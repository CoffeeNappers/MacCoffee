package com.vkontakte.android.media.audio;

import android.app.Activity;
import android.content.Intent;
import android.media.AudioManager;
import android.media.AudioRecord;
import android.os.Vibrator;
import android.util.SparseArray;
import android.widget.Toast;
import com.facebook.common.util.UriUtil;
import com.vk.core.util.Screen;
import com.vk.medianative.MediaNative;
import com.vk.stories.StoriesProcessor;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.attachments.AudioMessageAttachment;
import com.vkontakte.android.attachments.PendingAudioMessageAttachment;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.utils.Utils;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.utils.DispatchQueue;
import com.vkontakte.android.utils.L;
import java.io.File;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes3.dex */
public final class AudioMessageUtils {
    public static final String ACTION_AUDIO_MESSAGE_CANCEL = "com.vkontakte.android.AUDIO_MESSAGE_CANCEL";
    public static final String ACTION_AUDIO_MESSAGE_DONE = "com.vkontakte.android.AUDIO_MESSAGE_DONE";
    public static final String ACTION_AUDIO_MESSAGE_ERROR = "com.vkontakte.android.AUDIO_MESSAGE_ERROR";
    public static final String ACTION_AUDIO_MESSAGE_UPDATE = "com.vkontakte.android.AUDIO_MESSAGE_UPDATE";
    private static final String LOG = "AudioMessageUtils";
    private static final int MAX_RECORD_LENGTH = 300000;
    private static final int MIN_RECORD_LENGTH = 1000;
    public static final byte NORMALIZED_MAX_VALUE = 31;
    private static final int NOTIFY_UI_UPDATE_DELAY = 17;
    private static final int SAMPLE_RATE_HZ = 16000;
    public static final double SILENCE_VALUE = amplitudeToDb(20.0d);
    private static final int STOP_TYPE_CANCEL = 1;
    private static final int STOP_TYPE_DEFAULT = 0;
    private static final int STOP_TYPE_SEND = 2;
    private static final int STOP_TYPE_WAVE = 3;
    private static volatile AudioMessageUtils instance;
    private AudioRecord audioRecorder;
    private File currentRecord;
    private String currentSessionId;
    private boolean raisedRecording;
    private int recordBufferSize;
    private long recordDuration;
    private long samplesCount;
    private final SensorUtils sensorUtils = new SensorUtils();
    private final FocusListener focusListener = new FocusListener();
    private final SparseArray<PendingAudioMessageAttachment> pendingRecords = new SparseArray<>();
    private final DispatchQueue fileEncodingQueue = new DispatchQueue("fileEncodingQueue");
    private final DispatchQueue recordQueue = new DispatchQueue("recordQueue");
    private final ByteBuffer fileBuffer = ByteBuffer.allocateDirect(StoriesProcessor.MAX_PHOTO_HEIGHT);
    private final Runnable startRecord = new StartRecordRunnable();
    private final Runnable recording = new RecordingRunnable();
    private final List<ByteBuffer> recordBuffers = new ArrayList();
    private short[] recordSamples = new short[1024];

    public static AudioMessageUtils getInstance() {
        AudioMessageUtils localInstance = instance;
        if (localInstance == null) {
            synchronized (AudioMessageUtils.class) {
                try {
                    localInstance = instance;
                    if (localInstance == null) {
                        AudioMessageUtils localInstance2 = new AudioMessageUtils();
                        try {
                            instance = localInstance2;
                            localInstance = localInstance2;
                        } catch (Throwable th) {
                            th = th;
                            throw th;
                        }
                    }
                } catch (Throwable th2) {
                    th = th2;
                }
            }
        }
        return localInstance;
    }

    private AudioMessageUtils() {
        this.recordBufferSize = AudioRecord.getMinBufferSize(SAMPLE_RATE_HZ, 16, 2);
        if (this.recordBufferSize <= 0) {
            this.recordBufferSize = 1280;
        }
        this.recordQueue.setPriority(10);
        this.fileEncodingQueue.setPriority(10);
    }

    public PendingAudioMessageAttachment getPendingRecord(int peerId) {
        return this.pendingRecords.get(peerId);
    }

    public void addPendingRecord(int peerId, PendingAudioMessageAttachment attachment) {
        this.pendingRecords.put(peerId, attachment);
    }

    public void removePendingRecord(int peerId) {
        this.pendingRecords.remove(peerId);
    }

    public void startRecordingIfFromSpeaker() {
        this.sensorUtils.startRecordingIfFromSpeaker();
    }

    public void startRaiseToEarSensors(Activity activity, String sessionId) {
        if (!Screen.isTablet(activity)) {
            if (VKAccountManager.getCurrent().isRiseToRecordAvailable()) {
                this.sensorUtils.startSensors(activity, sessionId);
                return;
            } else {
                L.e(LOG, "Rise to record is not supported on this device");
                return;
            }
        }
        L.e(LOG, "Rise to record is not supported on the tablet devices");
    }

    public void stopRaiseToEarSensors(Activity activity) {
        this.sensorUtils.stopSensors(activity);
    }

    public void setInputFieldHasText(boolean value) {
        this.sensorUtils.setInputFieldHasText(value);
    }

    public void setAllowStartRecord(boolean value) {
        this.sensorUtils.setAllowStartRecord(value);
    }

    public static byte[] resizeWaveform(byte[] source, int targetLength) {
        int destIndex;
        if (source == null || source.length == 0 || source.length == targetLength) {
            return source;
        }
        if (source.length < targetLength) {
            float step = source.length / targetLength;
            byte[] dest = new byte[targetLength];
            for (int index = 0; index < targetLength; index++) {
                dest[index] = source[(int) (index * step)];
            }
            return dest;
        }
        float step2 = source.length / targetLength;
        byte[] dest2 = new byte[targetLength];
        float accum = 0.0f;
        float weight = 0.0f;
        int length = source.length;
        int i = 0;
        int destIndex2 = 0;
        while (i < length) {
            byte value = source[i];
            float valueWeight = Math.min(weight + 1.0f, step2) - weight;
            accum += value * valueWeight;
            weight += valueWeight;
            if (weight >= step2 - 0.001f) {
                destIndex = destIndex2 + 1;
                dest2[destIndex2] = (byte) Math.round(accum / step2);
                if (valueWeight < 1.0f) {
                    weight = 1.0f - valueWeight;
                    accum = value * weight;
                } else {
                    weight = 0.0f;
                    accum = 0.0f;
                }
            } else {
                destIndex = destIndex2;
            }
            i++;
            destIndex2 = destIndex;
        }
        if (accum > 0.0f && destIndex2 < targetLength) {
            dest2[destIndex2] = (byte) Math.round(accum / step2);
            return dest2;
        }
        return dest2;
    }

    public void startRecording(String sessionId, boolean raisedRecording) {
        this.currentSessionId = sessionId;
        this.raisedRecording = raisedRecording;
        this.recordQueue.postRunnable(this.startRecord);
        abandonAudioFocus();
    }

    public void stopRecording() {
        stopRecording(0);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void requestAudioFocus() {
        int result = Utils.getAudioManager(VKApplication.context).requestAudioFocus(this.focusListener, 3, 2);
        if (result == 1) {
            this.focusListener.onAudioFocusChange(1);
        } else {
            this.focusListener.onAudioFocusChange(-1);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void abandonAudioFocus() {
        Utils.getAudioManager(VKApplication.context).abandonAudioFocus(this.focusListener);
    }

    public void stopAndSendRecord() {
        stopRecording(2);
    }

    public void stopAndShowWaveform() {
        stopRecording(3);
    }

    public void cancelRecording() {
        stopRecording(1);
    }

    public boolean isRecording() {
        return this.audioRecorder != null;
    }

    public boolean isHasRecord() {
        return this.currentRecord != null;
    }

    public boolean isRaisedRecording() {
        return this.raisedRecording;
    }

    public void deleteCurrentRecord() {
        if (this.currentRecord != null) {
            this.currentRecord.delete();
            this.currentRecord = null;
        }
        this.recordDuration = 0L;
        this.raisedRecording = false;
        this.currentSessionId = null;
    }

    public int openOpusFile(String absolutePath) {
        return MediaNative.nativeAudioOpenOpusFile(absolutePath);
    }

    public long getTotalPcmDuration() {
        return MediaNative.nativeAudioGetTotalPcmDuration();
    }

    public void readOpusFile(ByteBuffer buffer, int playerBufferSize, int[] readArgs) {
        MediaNative.nativeAudioReadOpusFile(buffer, playerBufferSize, readArgs);
    }

    public void seekOpusFile(float progress) {
        MediaNative.nativeAudioSeekOpusFile(progress);
    }

    private void stopRecording(int type) {
        if (this.startRecord != null) {
            this.recordQueue.cancelRunnable(this.startRecord);
        }
        this.recordQueue.postRunnable(AudioMessageUtils$$Lambda$1.lambdaFactory$(this, type));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$stopRecording$0(int type) {
        if (this.audioRecorder != null) {
            try {
                L.d(LOG, "Audio record stop");
                this.audioRecorder.stop();
            } catch (Exception e) {
                L.e(LOG, "Audio record stop failure", e);
                deleteCurrentRecord();
            }
            stopRecordingInternal(type, false);
            abandonAudioFocus();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void stopRecordingInternal(int type, boolean error) {
        this.fileEncodingQueue.postRunnable(new Runnable() { // from class: com.vkontakte.android.media.audio.AudioMessageUtils.1
            @Override // java.lang.Runnable
            public void run() {
                MediaNative.nativeAudioStopRecord();
            }
        });
        try {
            if (this.audioRecorder != null) {
                this.audioRecorder.release();
                this.audioRecorder = null;
            }
            vibrate();
            AudioFacade.resumeIfPausedBySystem();
            boolean tooShort = this.recordDuration < 1000;
            Intent intent = new Intent();
            intent.putExtra("peerId", this.currentSessionId);
            if (error || this.currentRecord.length() == 0 || !this.currentRecord.exists()) {
                sendBroadcast(ACTION_AUDIO_MESSAGE_ERROR, intent);
                deleteCurrentRecord();
                showErrorToast();
            } else if (tooShort || type == 1) {
                intent.putExtra(UriUtil.LOCAL_FILE_SCHEME, this.currentRecord);
                intent.putExtra("too_short", tooShort);
                sendBroadcast(ACTION_AUDIO_MESSAGE_CANCEL, intent);
                deleteCurrentRecord();
            } else {
                intent.putExtra("show_waveform", type == 3 || type == 0);
                intent.putExtra("send", type == 2);
                intent.putExtra(UriUtil.LOCAL_FILE_SCHEME, this.currentRecord);
                intent.putExtra("duration", (int) (this.recordDuration / 1000));
                intent.putExtra("waveform", MediaNative.nativeAudioGetWaveform(this.recordSamples, this.recordSamples.length));
                sendBroadcast(ACTION_AUDIO_MESSAGE_DONE, intent);
            }
        } catch (Exception e) {
            L.e(LOG, "Audio record stop failure", e);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendBroadcast(String action, Intent extra) {
        Intent intent = new Intent(action);
        if (extra != null) {
            intent.putExtras(extra);
        }
        VKApplication.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showErrorToast() {
        Toast.makeText(VKApplication.context, (int) R.string.audio_message_rec_error, 0).show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static double amplitudeToDb(double amplitude) {
        return 20.0d * Math.log10(Math.abs(amplitude) / 32767.0d);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void vibrate() {
        try {
            Vibrator v = (Vibrator) VKApplication.context.getSystemService("vibrator");
            v.vibrate(50L);
        } catch (Exception e) {
            L.e(LOG, "Vibrator error ", e);
        }
    }

    /* loaded from: classes3.dex */
    private class StartRecordRunnable implements Runnable {
        private StartRecordRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                File outputFolder = AudioMessageAttachment.CACHE_DIR;
                AudioMessageUtils.this.currentRecord = new File(outputFolder, "audio_message_" + (System.currentTimeMillis() / 1000) + ".ogg");
                if (!outputFolder.exists()) {
                    outputFolder.mkdirs();
                }
                if (MediaNative.nativeAudioStartRecord(AudioMessageUtils.this.currentRecord.getAbsolutePath()) == 0) {
                    AudioMessageUtils.this.showErrorToast();
                    L.e(AudioMessageUtils.LOG, "Audio record start native error");
                    return;
                }
                L.d(AudioMessageUtils.LOG, "Audio record start");
                AudioMessageUtils.this.audioRecorder = new AudioRecord(1, AudioMessageUtils.SAMPLE_RATE_HZ, 16, 2, AudioMessageUtils.this.recordBufferSize * 10);
                AudioMessageUtils.this.samplesCount = 0L;
                AudioMessageUtils.this.recordDuration = 0L;
                AudioMessageUtils.this.fileBuffer.rewind();
                AudioMessageUtils.this.audioRecorder.startRecording();
                AudioMessageUtils.this.recordQueue.postRunnable(AudioMessageUtils.this.recording);
                AudioMessageUtils.this.requestAudioFocus();
                AudioMessageUtils.vibrate();
            } catch (Exception e) {
                L.e(AudioMessageUtils.LOG, "Audio record failure " + e.getMessage());
                MediaNative.nativeAudioStopRecord();
                AudioMessageUtils.this.deleteCurrentRecord();
                try {
                    AudioMessageUtils.this.audioRecorder.release();
                    AudioMessageUtils.this.audioRecorder = null;
                } catch (Exception e2) {
                    L.e(AudioMessageUtils.LOG, e2.getMessage());
                }
                AudioMessageUtils.this.showErrorToast();
                AudioMessageUtils.this.abandonAudioFocus();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class RecordingRunnable implements Runnable {
        private long lastUpdate;

        private RecordingRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            ByteBuffer buffer;
            if (AudioMessageUtils.this.audioRecorder != null) {
                if (AudioMessageUtils.this.recordBuffers.isEmpty()) {
                    buffer = ByteBuffer.allocateDirect(AudioMessageUtils.this.recordBufferSize);
                    buffer.order(ByteOrder.nativeOrder());
                } else {
                    buffer = (ByteBuffer) AudioMessageUtils.this.recordBuffers.get(0);
                    AudioMessageUtils.this.recordBuffers.remove(0);
                }
                buffer.rewind();
                int len = AudioMessageUtils.this.audioRecorder.read(buffer, buffer.capacity());
                if (len <= 0) {
                    AudioMessageUtils.this.recordBuffers.add(buffer);
                    AudioMessageUtils.this.stopRecordingInternal(0, true);
                    return;
                }
                buffer.limit(len);
                double sum = 0.0d;
                try {
                    long newSamplesCount = AudioMessageUtils.this.samplesCount + (len / 2);
                    int currentPart = (int) ((AudioMessageUtils.this.samplesCount / newSamplesCount) * AudioMessageUtils.this.recordSamples.length);
                    int newPart = AudioMessageUtils.this.recordSamples.length - currentPart;
                    if (currentPart != 0) {
                        float sampleStep = AudioMessageUtils.this.recordSamples.length / currentPart;
                        float currentNum = 0.0f;
                        for (int a = 0; a < currentPart; a++) {
                            AudioMessageUtils.this.recordSamples[a] = AudioMessageUtils.this.recordSamples[(int) currentNum];
                            currentNum += sampleStep;
                        }
                    }
                    int currentNum2 = currentPart;
                    float nextNum = 0.0f;
                    float sampleStep2 = (len / 2.0f) / newPart;
                    for (int i = 0; i < len / 2; i++) {
                        short peak = buffer.getShort();
                        sum += peak * peak;
                        if (i == ((int) nextNum) && currentNum2 < AudioMessageUtils.this.recordSamples.length) {
                            AudioMessageUtils.this.recordSamples[currentNum2] = peak;
                            nextNum += sampleStep2;
                            currentNum2++;
                        }
                    }
                    AudioMessageUtils.this.samplesCount = newSamplesCount;
                } catch (Exception e) {
                    L.e(AudioMessageUtils.LOG, "Audio record failure", e);
                }
                buffer.position(0);
                double amplitude = Math.sqrt((sum / len) / 2.0d);
                boolean flush = len != buffer.capacity();
                encode(buffer, flush);
                AudioMessageUtils.this.recordQueue.postRunnable(AudioMessageUtils.this.recording);
                long currentTime = System.currentTimeMillis();
                if (currentTime - this.lastUpdate >= 17) {
                    this.lastUpdate = currentTime;
                    Intent intent = new Intent();
                    intent.putExtra("peerId", AudioMessageUtils.this.currentSessionId);
                    intent.putExtra("duration", (int) (AudioMessageUtils.this.recordDuration / 1000));
                    double ampDb = AudioMessageUtils.amplitudeToDb(amplitude);
                    if (ampDb < AudioMessageUtils.SILENCE_VALUE) {
                        ampDb = AudioMessageUtils.SILENCE_VALUE;
                    }
                    intent.putExtra("amplitude", ampDb);
                    AudioMessageUtils.this.sendBroadcast(AudioMessageUtils.ACTION_AUDIO_MESSAGE_UPDATE, intent);
                }
                if (AudioMessageUtils.this.recordDuration >= 300000) {
                    AudioMessageUtils.this.stopRecording();
                }
            }
        }

        private void encode(ByteBuffer finalBuffer, boolean flush) {
            AudioMessageUtils.this.fileEncodingQueue.postRunnable(AudioMessageUtils$RecordingRunnable$$Lambda$1.lambdaFactory$(this, finalBuffer, flush));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$encode$1(ByteBuffer finalBuffer, boolean flush) {
            while (finalBuffer.hasRemaining()) {
                int bufferLimit = -1;
                if (finalBuffer.remaining() > AudioMessageUtils.this.fileBuffer.remaining()) {
                    bufferLimit = finalBuffer.limit();
                    finalBuffer.limit(AudioMessageUtils.this.fileBuffer.remaining() + finalBuffer.position());
                }
                AudioMessageUtils.this.fileBuffer.put(finalBuffer);
                if (AudioMessageUtils.this.fileBuffer.position() == AudioMessageUtils.this.fileBuffer.limit() || flush) {
                    if (MediaNative.nativeAudioWriteFrame(AudioMessageUtils.this.fileBuffer, flush ? finalBuffer.position() : AudioMessageUtils.this.fileBuffer.limit()) != 0) {
                        AudioMessageUtils.this.fileBuffer.rewind();
                        AudioMessageUtils.this.recordDuration += (AudioMessageUtils.this.fileBuffer.limit() / 2) / 16;
                    }
                }
                if (bufferLimit != -1) {
                    finalBuffer.limit(bufferLimit);
                }
            }
            AudioMessageUtils.this.recordQueue.postRunnable(AudioMessageUtils$RecordingRunnable$$Lambda$2.lambdaFactory$(this, finalBuffer));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$null$0(ByteBuffer finalBuffer) {
            AudioMessageUtils.this.recordBuffers.add(finalBuffer);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class FocusListener implements AudioManager.OnAudioFocusChangeListener {
        private FocusListener() {
        }

        @Override // android.media.AudioManager.OnAudioFocusChangeListener
        public void onAudioFocusChange(int focusChange) {
            switch (focusChange) {
                case -2:
                case -1:
                    AudioMessageUtils.this.stopRecording();
                    return;
                default:
                    return;
            }
        }
    }
}
