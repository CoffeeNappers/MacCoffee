package com.vkontakte.android;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.media.AudioManager;
import android.media.AudioTrack;
import android.os.IBinder;
import android.webkit.URLUtil;
import android.widget.Toast;
import com.facebook.internal.NativeProtocol;
import com.vk.core.network.Network;
import com.vk.medianative.MediaNative;
import com.vkontakte.android.attachments.AudioMessageAttachment;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.audio.utils.Utils;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.media.audio.AudioMessageUtils;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.utils.DispatchQueue;
import com.vkontakte.android.utils.L;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Semaphore;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;
/* loaded from: classes2.dex */
public class AudioMessagePlayerService extends Service {
    public static final String ACTION_AUDIO_MESSAGE_DONE = "com.vkontakte.android.actions.AUDIO_MESSAGE_DONE";
    public static final String ACTION_AUDIO_MESSAGE_UPDATE = "com.vkontakte.android.actions.AUDIO_MESSAGE_UPDATE";
    public static final int ACTION_GET_UPDATE = 4;
    public static final int ACTION_PAUSE = 3;
    public static final int ACTION_PLAY = 1;
    public static final int ACTION_RENAME = 5;
    public static final int ACTION_SEEK = 7;
    public static final int ACTION_SET_STREAM = 6;
    public static final int ACTION_STOP = 2;
    private static final int PLAY_RATE_HZ = 48000;
    private static final long RELEASE_DELAY = 60000;
    private static final String TAG = "AudioMessagePlayerService";
    private static final long UPDATE_DELAY = 100;
    private static AudioTrack audioTrackPlayer;
    private static boolean isPlaying;
    private static int[] readArgs = new int[3];
    private static boolean useFrontSpeaker;
    private int buffersWrite;
    private int currentMsgId;
    private boolean decodingFinished;
    private int newDid;
    private int newOid;
    private int playerBufferSize;
    private final DispatchQueue queue = new DispatchQueue("audio_message_player");
    private final ReleaseRunnable release = new ReleaseRunnable();
    private final UpdateRunnable update = new UpdateRunnable();
    private final AudioMessageUtils audioMessageUtils = AudioMessageUtils.getInstance();
    private final DispatchQueue fileDecodingQueue = new DispatchQueue("fileDecodingQueue");
    private final DispatchQueue playerQueue = new DispatchQueue("playerQueue");
    private final FocusListener focusListener = new FocusListener();
    private final AbandonFocus abandonFocus = new AbandonFocus();
    private List<AudioBuffer> usedPlayerBuffers = new ArrayList();
    private List<AudioBuffer> freePlayerBuffers = new ArrayList();
    private final Object playerObjectSync = new Object();
    private final Object playerSync = new Object();
    private final SharedPreferences preferences = VKApplication.context.getSharedPreferences(TAG, 0);
    private int currentOid = this.preferences.getInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, 0);
    private int currentDid = this.preferences.getInt("did", 0);
    private long lastPlayPcm = this.preferences.getLong("pcm", 0);
    private float lastProgress = this.preferences.getFloat("progress", 0.0f);
    private long currentTotalPcmDuration = this.preferences.getLong(ArgKeys.TOTAL, 0);
    private boolean currentPending = this.preferences.getBoolean("pending", false);

    static /* synthetic */ int access$1308(AudioMessagePlayerService x0) {
        int i = x0.buffersWrite;
        x0.buffersWrite = i + 1;
        return i;
    }

    public AudioMessagePlayerService() {
        this.playerBufferSize = AudioTrack.getMinBufferSize(PLAY_RATE_HZ, 4, 2);
        if (this.playerBufferSize <= 0) {
            this.playerBufferSize = 3840;
        }
        for (int a = 0; a < 3; a++) {
            this.freePlayerBuffers.add(new AudioBuffer(this.playerBufferSize));
        }
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (intent == null) {
            return 2;
        }
        int act = intent.getIntExtra(NativeProtocol.WEB_DIALOG_ACTION, -1);
        this.queue.cancelRunnable(this.release);
        switch (act) {
            case 1:
                writePreferences(0, 0, 0L, 0L, 0.0f, false);
                try {
                    int oid = intent.getIntExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, 0);
                    int did = intent.getIntExtra("did", 0);
                    int msgId = intent.getIntExtra(LongPollService.EXTRA_MSG_ID, 0);
                    String url = intent.getStringExtra("url");
                    boolean pending = intent.getBooleanExtra("pending", false);
                    if (this.currentOid == oid && this.currentDid == did) {
                        this.lastProgress = intent.getFloatExtra("progress", this.lastProgress);
                        if (isPlaying()) {
                            cleanupPlayer();
                            abandonAudioFocus();
                        } else {
                            this.queue.cancelRunnable(this.abandonFocus);
                            play(url, oid, did, msgId, pending);
                        }
                        this.queue.postRunnable(this.update);
                        break;
                    } else {
                        cleanupPlayer();
                        onComplete();
                        this.lastProgress = intent.getFloatExtra("progress", this.lastProgress);
                        this.queue.cancelRunnable(this.abandonFocus);
                        play(url, oid, did, msgId, pending);
                        break;
                    }
                } catch (Exception e) {
                    Log.e(TAG, "Audio message player error ", e);
                    showOnErrorMessage(this);
                    sendBroadcastDone();
                    break;
                }
                break;
            case 2:
                if (audioTrackPlayer != null) {
                    int oid2 = intent.getIntExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, 0);
                    int did2 = intent.getIntExtra("did", 0);
                    if ((oid2 == 0 && did2 == 0) || (oid2 == this.currentOid && did2 == this.currentDid)) {
                        writePreferences(0, 0, 0L, 0L, 0.0f, false);
                        cleanupPlayer();
                        onComplete();
                        abandonAudioFocus();
                    }
                }
                useFrontSpeaker = false;
                break;
            case 3:
                if (audioTrackPlayer != null) {
                    writePreferences(this.currentOid, this.currentDid, this.lastPlayPcm, this.currentTotalPcmDuration, this.lastProgress, this.currentPending);
                    cleanupPlayer();
                    abandonAudioFocus();
                    break;
                }
                break;
            case 4:
                int oid3 = intent.getIntExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, 0);
                int did3 = intent.getIntExtra("did", 0);
                if (this.currentOid == oid3 && this.currentDid == did3) {
                    sendBroadcastUpdate();
                    break;
                }
                break;
            case 5:
                int newOid = intent.getIntExtra("new_oid", 0);
                int newDid = intent.getIntExtra("new_did", 0);
                int oid4 = intent.getIntExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, 0);
                int did4 = intent.getIntExtra("did", 0);
                String url2 = intent.getStringExtra("url");
                if (this.currentOid == oid4 && this.currentDid == did4) {
                    if (isPlaying()) {
                        this.newOid = newOid;
                        this.newDid = newDid;
                        this.currentOid = newOid;
                        this.currentDid = newDid;
                        sendBroadcastUpdate();
                        break;
                    } else {
                        renameCacheFile(url2, newOid, newDid);
                        break;
                    }
                } else {
                    renameCacheFile(url2, newOid, newDid);
                    break;
                }
                break;
            case 6:
                useFrontSpeaker = intent.getBooleanExtra("front_speaker", false);
                if (isPlaying()) {
                    cleanupPlayer();
                    File cacheFile = AudioMessageAttachment.getCacheFile(this.currentOid, this.currentDid);
                    if (!cacheFile.exists()) {
                        L.e(TAG, "File find failure during stream type changing");
                        break;
                    } else {
                        play(cacheFile);
                        break;
                    }
                }
                break;
            case 7:
                float progress = intent.getFloatExtra("progress", 0.0f);
                if (isPlaying()) {
                    seekOpusPlayer(progress);
                    break;
                }
                break;
        }
        return 2;
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override // android.app.Service
    public void onDestroy() {
        if (isPlaying()) {
            writePreferences(0, 0, 0L, 0L, 0.0f, false);
            cleanupPlayer();
            onComplete();
            abandonAudioFocus();
        }
        this.queue.cancelRunnable(this.update);
        super.onDestroy();
    }

    public void onComplete() {
        this.queue.cancelRunnable(this.update);
        this.currentOid = 0;
        this.currentDid = 0;
        this.lastProgress = 0.0f;
        this.lastPlayPcm = 0L;
        this.currentPending = false;
    }

    private void play(String url, int oid, int did, int msgId, boolean pending) {
        this.currentOid = oid;
        this.currentDid = did;
        this.currentMsgId = msgId;
        this.currentPending = pending;
        if (oid == 0 || did == 0) {
            play(new File(url));
            return;
        }
        File cacheFile = AudioMessageAttachment.getCacheFile(oid, did);
        if (cacheFile.exists()) {
            play(cacheFile);
            return;
        }
        this.currentTotalPcmDuration = 0L;
        this.queue.postRunnable(this.update);
        this.queue.postRunnable(new DownloadRunnable(url, cacheFile, oid, did));
    }

    public void play(File source) {
        if (MediaNative.nativeAudioIsOpusFile(source.getAbsolutePath()) == 1) {
            playOpusFile(source);
            return;
        }
        showOnErrorMessage(this);
        sendBroadcastDone();
    }

    private boolean playOpusFile(File opusFile) {
        synchronized (this.playerObjectSync) {
            try {
                Semaphore semaphore = new Semaphore(0);
                Boolean[] result = new Boolean[1];
                this.fileDecodingQueue.postRunnable(AudioMessagePlayerService$$Lambda$1.lambdaFactory$(this, result, opusFile, semaphore));
                semaphore.acquire();
                if (!result[0].booleanValue()) {
                    return false;
                }
                requestAudioFocus();
                this.currentTotalPcmDuration = this.audioMessageUtils.getTotalPcmDuration();
                int streamType = useFrontSpeaker ? 0 : 3;
                audioTrackPlayer = new AudioTrack(streamType, PLAY_RATE_HZ, 4, 2, this.playerBufferSize, 1);
                audioTrackPlayer.setStereoVolume(1.0f, 1.0f);
                audioTrackPlayer.setPlaybackPositionUpdateListener(new AudioTrack.OnPlaybackPositionUpdateListener() { // from class: com.vkontakte.android.AudioMessagePlayerService.1
                    {
                        AudioMessagePlayerService.this = this;
                    }

                    @Override // android.media.AudioTrack.OnPlaybackPositionUpdateListener
                    public void onMarkerReached(AudioTrack audioTrack) {
                        AudioMessagePlayerService.this.cleanupPlayer();
                        AudioMessagePlayerService.this.sendBroadcastDone();
                        AudioMessagePlayerService.this.onComplete();
                        AudioMessagePlayerService.this.lastProgress = 0.0f;
                        AudioMessagePlayerService.this.abandonAudioFocus();
                    }

                    @Override // android.media.AudioTrack.OnPlaybackPositionUpdateListener
                    public void onPeriodicNotification(AudioTrack audioTrack) {
                    }
                });
                audioTrackPlayer.play();
                this.fileDecodingQueue.postRunnable(AudioMessagePlayerService$$Lambda$2.lambdaFactory$(this));
                if (this.lastProgress > 0.0f) {
                    seekOpusPlayer(this.lastProgress);
                }
                isPlaying = true;
                this.queue.postRunnable(this.update);
                if (!this.currentPending) {
                    Analytics.track("audio_message_play").addParam("audio_message_id", this.currentOid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.currentDid).commit();
                }
                return true;
            } catch (Exception e) {
                Log.e(TAG, "Failure on play opus file", e);
                if (audioTrackPlayer != null) {
                    audioTrackPlayer.release();
                    audioTrackPlayer = null;
                }
                return false;
            }
        }
    }

    public /* synthetic */ void lambda$playOpusFile$0(Boolean[] result, File opusFile, Semaphore semaphore) {
        result[0] = Boolean.valueOf(this.audioMessageUtils.openOpusFile(opusFile.getAbsolutePath()) != 0);
        semaphore.release();
    }

    public /* synthetic */ void lambda$playOpusFile$1() {
        synchronized (this.playerSync) {
            this.freePlayerBuffers.addAll(this.usedPlayerBuffers);
            this.usedPlayerBuffers.clear();
        }
        this.decodingFinished = false;
        checkPlayerQueue();
    }

    public void checkPlayerQueue() {
        this.playerQueue.postRunnable(new Runnable() { // from class: com.vkontakte.android.AudioMessagePlayerService.2
            {
                AudioMessagePlayerService.this = this;
            }

            @Override // java.lang.Runnable
            public void run() {
                synchronized (AudioMessagePlayerService.this.playerObjectSync) {
                    if (AudioMessagePlayerService.audioTrackPlayer != null && AudioMessagePlayerService.audioTrackPlayer.getPlayState() == 3) {
                        AudioBuffer buffer = null;
                        synchronized (AudioMessagePlayerService.this.playerSync) {
                            if (!AudioMessagePlayerService.this.usedPlayerBuffers.isEmpty()) {
                                buffer = (AudioBuffer) AudioMessagePlayerService.this.usedPlayerBuffers.get(0);
                                AudioMessagePlayerService.this.usedPlayerBuffers.remove(0);
                            }
                        }
                        if (buffer != null) {
                            int count = 0;
                            try {
                                count = AudioMessagePlayerService.audioTrackPlayer.write(buffer.bufferBytes, 0, buffer.size);
                            } catch (Exception e) {
                                Log.e(AudioMessagePlayerService.TAG, "Failure on write opus buffer", e);
                            }
                            AudioMessagePlayerService.access$1308(AudioMessagePlayerService.this);
                            if (count > 0) {
                                long pcm = buffer.pcmOffset;
                                int marker = buffer.finished == 1 ? count : -1;
                                int finalBuffersWrite = AudioMessagePlayerService.this.buffersWrite;
                                AudioMessagePlayerService.this.lastPlayPcm = pcm;
                                if (marker != -1) {
                                    if (AudioMessagePlayerService.audioTrackPlayer != null) {
                                        AudioMessagePlayerService.audioTrackPlayer.setNotificationMarkerPosition(1);
                                    }
                                    if (finalBuffersWrite == 1) {
                                        AudioMessagePlayerService.this.cleanupPlayer();
                                        AudioMessagePlayerService.this.onComplete();
                                        AudioMessagePlayerService.this.abandonAudioFocus();
                                    }
                                }
                            }
                            if (buffer.finished != 1) {
                                AudioMessagePlayerService.this.checkPlayerQueue();
                            }
                        }
                        if (buffer == null || buffer.finished != 1) {
                            AudioMessagePlayerService.this.checkDecoderQueue();
                        }
                        if (buffer != null) {
                            synchronized (AudioMessagePlayerService.this.playerSync) {
                                AudioMessagePlayerService.this.freePlayerBuffers.add(buffer);
                            }
                        }
                    }
                }
            }
        });
    }

    public void checkDecoderQueue() {
        this.fileDecodingQueue.postRunnable(new Runnable() { // from class: com.vkontakte.android.AudioMessagePlayerService.3
            {
                AudioMessagePlayerService.this = this;
            }

            @Override // java.lang.Runnable
            public void run() {
                if (AudioMessagePlayerService.this.decodingFinished) {
                    AudioMessagePlayerService.this.checkPlayerQueue();
                    return;
                }
                boolean was = false;
                while (true) {
                    AudioBuffer buffer = null;
                    synchronized (AudioMessagePlayerService.this.playerSync) {
                        if (!AudioMessagePlayerService.this.freePlayerBuffers.isEmpty()) {
                            buffer = (AudioBuffer) AudioMessagePlayerService.this.freePlayerBuffers.get(0);
                            AudioMessagePlayerService.this.freePlayerBuffers.remove(0);
                        }
                        if (!AudioMessagePlayerService.this.usedPlayerBuffers.isEmpty()) {
                            was = true;
                        }
                    }
                    if (buffer == null) {
                        break;
                    }
                    AudioMessagePlayerService.this.audioMessageUtils.readOpusFile(buffer.buffer, AudioMessagePlayerService.this.playerBufferSize, AudioMessagePlayerService.readArgs);
                    buffer.size = AudioMessagePlayerService.readArgs[0];
                    buffer.pcmOffset = AudioMessagePlayerService.readArgs[1];
                    buffer.finished = AudioMessagePlayerService.readArgs[2];
                    if (buffer.finished == 1) {
                        AudioMessagePlayerService.this.decodingFinished = true;
                    }
                    if (buffer.size == 0) {
                        synchronized (AudioMessagePlayerService.this.playerSync) {
                            AudioMessagePlayerService.this.freePlayerBuffers.add(buffer);
                            break;
                        }
                    }
                    buffer.buffer.rewind();
                    buffer.buffer.get(buffer.bufferBytes);
                    synchronized (AudioMessagePlayerService.this.playerSync) {
                        AudioMessagePlayerService.this.usedPlayerBuffers.add(buffer);
                    }
                    was = true;
                }
                if (was) {
                    AudioMessagePlayerService.this.checkPlayerQueue();
                }
            }
        });
    }

    private void seekOpusPlayer(float progress) {
        if (progress != 1.0f) {
            try {
                if (isPlaying) {
                    audioTrackPlayer.pause();
                }
                audioTrackPlayer.flush();
                this.fileDecodingQueue.postRunnable(AudioMessagePlayerService$$Lambda$3.lambdaFactory$(this, progress));
            } catch (Exception e) {
                Log.e(TAG, "Failure on seek opus player", e);
            }
        }
    }

    public /* synthetic */ void lambda$seekOpusPlayer$2(float progress) {
        try {
            this.audioMessageUtils.seekOpusFile(progress);
            synchronized (this.playerSync) {
                this.freePlayerBuffers.addAll(this.usedPlayerBuffers);
                this.usedPlayerBuffers.clear();
            }
            if (isPlaying) {
                this.lastPlayPcm = ((float) this.currentTotalPcmDuration) * progress;
                if (audioTrackPlayer != null) {
                    audioTrackPlayer.play();
                }
                checkPlayerQueue();
            }
        } catch (Exception e) {
            Log.e(TAG, "Failure on play opus player", e);
        }
    }

    public void cleanupPlayer() {
        synchronized (this.playerObjectSync) {
            if (audioTrackPlayer != null) {
                try {
                    audioTrackPlayer.pause();
                    audioTrackPlayer.flush();
                } catch (Exception e) {
                    Log.e(TAG, "Failure on pause opus file player", e);
                }
                try {
                    audioTrackPlayer.release();
                    audioTrackPlayer = null;
                } catch (Exception e2) {
                    Log.e(TAG, "Failure on release opus file player", e2);
                }
                if (this.newOid != 0 && this.newDid != 0) {
                    File curFile = AudioMessageAttachment.getCacheFile(this.currentOid, this.currentDid);
                    renameCacheFile(curFile, this.newOid, this.newDid);
                    this.newOid = 0;
                    this.newDid = 0;
                }
                isPlaying = false;
                this.buffersWrite = 0;
                sendBroadcastUpdate();
                this.queue.cancelRunnable(this.update);
                this.queue.postRunnable(this.release, 60000L);
            }
        }
    }

    public void writePreferences(int oid, int did, long pcm, long total, float progress, boolean pending) {
        this.preferences.edit().putInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, oid).putInt("did", did).putLong("pcm", pcm).putFloat("progress", progress).putLong(ArgKeys.TOTAL, total).putBoolean("pending", pending).apply();
    }

    public void sendBroadcastDone() {
        Intent intent = new Intent(ACTION_AUDIO_MESSAGE_DONE);
        intent.putExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, this.currentOid);
        intent.putExtra("did", this.currentDid);
        intent.putExtra(LongPollService.EXTRA_MSG_ID, this.currentMsgId);
        sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }

    public void sendBroadcastUpdate() {
        try {
            Intent intent = new Intent(ACTION_AUDIO_MESSAGE_UPDATE);
            intent.putExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, this.currentOid);
            intent.putExtra("did", this.currentDid);
            if (this.currentTotalPcmDuration > 0) {
                this.lastProgress = ((float) this.lastPlayPcm) / ((float) this.currentTotalPcmDuration);
                intent.putExtra("progress", this.lastProgress);
                intent.putExtra("position", (int) (this.lastPlayPcm / 48000));
                intent.putExtra("playing", isPlaying());
            } else {
                intent.putExtra("progress", -1.0f);
            }
            sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
        } catch (Exception e) {
            Log.e(TAG, "Get player state error", e);
        }
    }

    private void requestAudioFocus() {
        int result = Utils.getAudioManager(this).requestAudioFocus(this.focusListener, 3, 2);
        if (result == 1) {
            this.focusListener.onAudioFocusChange(1);
        } else {
            this.focusListener.onAudioFocusChange(-1);
        }
    }

    public void abandonAudioFocus() {
        this.queue.postRunnable(this.abandonFocus, 1000L);
    }

    public static void showOnErrorMessage(Context context) {
        Toast.makeText(context, (int) R.string.audio_message_play_error, 0).show();
    }

    public static void cleanCache() {
        try {
            File[] files = AudioMessageAttachment.CACHE_DIR.listFiles();
            if (files != null) {
                for (File f : files) {
                    Log.d(TAG, "Deleting: " + f.getAbsolutePath());
                    f.delete();
                }
            }
        } catch (Exception e) {
            Log.e(TAG, "Audio messages cache clean failure", e);
        }
    }

    private static void renameCacheFile(String file, int oid, int did) {
        renameCacheFile(new File(file), oid, did);
    }

    private static void renameCacheFile(File file, int oid, int did) {
        File newFile = AudioMessageAttachment.getCacheFile(oid, did);
        file.renameTo(newFile);
    }

    public static boolean isPlaying() {
        return audioTrackPlayer != null && isPlaying;
    }

    public static boolean isFrontSpeakerUsed() {
        return useFrontSpeaker;
    }

    /* loaded from: classes2.dex */
    public class UpdateRunnable implements Runnable {
        private UpdateRunnable() {
            AudioMessagePlayerService.this = r1;
        }

        @Override // java.lang.Runnable
        public void run() {
            AudioMessagePlayerService.this.sendBroadcastUpdate();
            if (AudioMessagePlayerService.isPlaying()) {
                AudioMessagePlayerService.this.queue.postRunnable(this, AudioMessagePlayerService.UPDATE_DELAY);
            }
        }
    }

    /* loaded from: classes2.dex */
    public class DownloadRunnable implements Runnable {
        private final String audioMessageUrl;
        private final int did;
        private final int oid;
        private final File outputFile;

        public DownloadRunnable(String audioMessageUrl, File outputFile, int oid, int did) {
            AudioMessagePlayerService.this = r1;
            this.audioMessageUrl = audioMessageUrl;
            this.outputFile = outputFile;
            this.oid = oid;
            this.did = did;
        }

        @Override // java.lang.Runnable
        public void run() {
            InputStream input;
            try {
                if (!URLUtil.isNetworkUrl(this.audioMessageUrl)) {
                    URL url = new URL(this.audioMessageUrl);
                    URLConnection connection = url.openConnection();
                    connection.connect();
                    input = new BufferedInputStream(connection.getInputStream());
                } else {
                    Response response = Network.getDefaultClient().newCall(new Request.Builder().url(this.audioMessageUrl).get().build()).execute();
                    ResponseBody body = response.body();
                    input = body.byteStream();
                }
                File dir = this.outputFile.getParentFile();
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                OutputStream output = new FileOutputStream(this.outputFile, false);
                byte[] data = new byte[8192];
                while (true) {
                    int count = input.read(data);
                    if (count == -1) {
                        break;
                    }
                    output.write(data, 0, count);
                }
                output.flush();
                output.close();
                input.close();
                if (AudioMessagePlayerService.this.currentOid == this.oid && AudioMessagePlayerService.this.currentDid == this.did) {
                    AudioMessagePlayerService.this.play(this.outputFile);
                }
            } catch (IOException e) {
                Log.e(AudioMessagePlayerService.TAG, "Download file error", e);
                this.outputFile.delete();
                AudioMessagePlayerService.showOnErrorMessage(AudioMessagePlayerService.this.getApplicationContext());
                AudioMessagePlayerService.this.sendBroadcastDone();
            }
        }
    }

    /* loaded from: classes2.dex */
    public class ReleaseRunnable implements Runnable {
        private ReleaseRunnable() {
            AudioMessagePlayerService.this = r1;
        }

        @Override // java.lang.Runnable
        public void run() {
            AudioMessagePlayerService.this.stopSelf();
        }
    }

    /* loaded from: classes2.dex */
    public class AbandonFocus implements Runnable {
        private AbandonFocus() {
            AudioMessagePlayerService.this = r1;
        }

        @Override // java.lang.Runnable
        public void run() {
            Utils.getAudioManager(AudioMessagePlayerService.this).abandonAudioFocus(AudioMessagePlayerService.this.focusListener);
        }
    }

    /* loaded from: classes2.dex */
    public class FocusListener implements AudioManager.OnAudioFocusChangeListener {
        private FocusListener() {
            AudioMessagePlayerService.this = r1;
        }

        @Override // android.media.AudioManager.OnAudioFocusChangeListener
        public void onAudioFocusChange(int focusChange) {
            Runnable runnable;
            switch (focusChange) {
                case -3:
                    if (AudioMessagePlayerService.audioTrackPlayer != null) {
                        AudioMessagePlayerService.audioTrackPlayer.setStereoVolume(0.2f, 0.2f);
                        return;
                    }
                    return;
                case -2:
                case -1:
                    AudioMessagePlayerService.this.writePreferences(AudioMessagePlayerService.this.currentOid, AudioMessagePlayerService.this.currentDid, AudioMessagePlayerService.this.lastPlayPcm, AudioMessagePlayerService.this.currentTotalPcmDuration, AudioMessagePlayerService.this.lastProgress, AudioMessagePlayerService.this.currentPending);
                    AudioMessagePlayerService.this.cleanupPlayer();
                    AudioMessagePlayerService.this.sendBroadcastUpdate();
                    return;
                case 0:
                default:
                    return;
                case 1:
                    runnable = AudioMessagePlayerService$FocusListener$$Lambda$1.instance;
                    ViewUtils.postDelayed(runnable, 1500L);
                    return;
            }
        }

        public static /* synthetic */ void lambda$onAudioFocusChange$0() {
            if (AudioMessagePlayerService.audioTrackPlayer != null && AudioMessagePlayerService.audioTrackPlayer.getState() == 1 && AudioMessagePlayerService.audioTrackPlayer.getPlayState() == 3) {
                try {
                    AudioMessagePlayerService.audioTrackPlayer.setStereoVolume(1.0f, 1.0f);
                } catch (Exception e) {
                    Log.e("vk", "Illegal track state", e);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class AudioBuffer {
        ByteBuffer buffer;
        byte[] bufferBytes;
        int finished;
        long pcmOffset;
        int size;

        public AudioBuffer(int capacity) {
            this.buffer = ByteBuffer.allocateDirect(capacity);
            this.bufferBytes = new byte[capacity];
        }
    }
}
