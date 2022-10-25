package com.vkontakte.android.attachments;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Environment;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.facebook.internal.NativeProtocol;
import com.vkontakte.android.AudioMessagePlayerService;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.Document;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.docs.DocsGetById;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.ui.widget.WaveformView;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.io.File;
import java.lang.ref.WeakReference;
import java.util.Locale;
/* loaded from: classes2.dex */
public class AudioMessageAttachment extends DocumentAttachment {
    public static final File CACHE_DIR = new File(Environment.getExternalStorageDirectory(), ".vkontakte/cache/audio_messages");
    public static final Serializer.Creator<AudioMessageAttachment> CREATOR = new Serializer.CreatorAdapter<AudioMessageAttachment>() { // from class: com.vkontakte.android.attachments.AudioMessageAttachment.2
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public AudioMessageAttachment mo1087createFromSerializer(Serializer in) {
            return new AudioMessageAttachment(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public AudioMessageAttachment[] mo1088newArray(int size) {
            return new AudioMessageAttachment[size];
        }
    };
    private final View.OnClickListener clickListener;
    private int duration;
    private String linkMp3;
    private String linkOgg;
    private int messageId;
    private boolean play;
    private Float progress;
    private UpdateReceiver receiver;
    private final WaveformView.SeekBarDelegate seekBarDelegate;
    private byte[] waveform;

    public AudioMessageAttachment(String linkOgg, String linkMp3, int duration, byte[] waveform, String title, String url, int size, int oid, int did, String ext) {
        super(title, url, size, null, oid, did, ext, null, 0, 0, null);
        this.clickListener = new OnPlayButtonClickListener();
        this.seekBarDelegate = new SeekDelegate();
        this.linkOgg = linkOgg;
        this.linkMp3 = linkMp3;
        this.duration = duration;
        this.waveform = waveform;
    }

    public AudioMessageAttachment(Document doc) {
        super(doc);
        this.clickListener = new OnPlayButtonClickListener();
        this.seekBarDelegate = new SeekDelegate();
        this.linkOgg = doc.linkOgg;
        this.linkMp3 = doc.linkMp3;
        this.duration = doc.duration;
        this.waveform = doc.waveform;
    }

    public AudioMessageAttachment(Serializer in) {
        super(in);
        this.clickListener = new OnPlayButtonClickListener();
        this.seekBarDelegate = new SeekDelegate();
        this.linkOgg = in.readString();
        this.linkMp3 = in.readString();
        this.duration = in.readInt();
        this.waveform = in.createByteArray();
    }

    @Override // com.vkontakte.android.attachments.DocumentAttachment, com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        return getViewForList(context, null);
    }

    @Override // com.vkontakte.android.attachments.DocumentAttachment, com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuseView) {
        boolean init = reuseView == null;
        View view = init ? getReusableView(context, "audio_message") : reuseView;
        if (view != null) {
            Intent intentPlayer = new Intent(context, AudioMessagePlayerService.class);
            intentPlayer.putExtra(NativeProtocol.WEB_DIALOG_ACTION, 4);
            intentPlayer.putExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, this.oid);
            intentPlayer.putExtra("did", this.did);
            context.startService(intentPlayer);
            TextView textView = (TextView) view.findViewById(R.id.attach_subtitle);
            ImageView buttonView = (ImageView) view.findViewById(R.id.play_button);
            buttonView.setImageResource(this.play ? R.drawable.ic_attach_audio_pause : R.drawable.ic_attach_audio_play);
            WaveformView waveformView = (WaveformView) view.findViewById(R.id.attach_waveform);
            waveformView.setSeekBarDelegate(this.seekBarDelegate);
            waveformView.setWaveform(this.waveform);
            waveformView.setProgress(this.progress);
            unregisterReceiver(context);
            this.receiver = new UpdateReceiver();
            this.receiver.setOid(this.oid);
            this.receiver.setDid(this.did);
            this.receiver.setDuration(this.duration);
            this.receiver.setTextView(textView);
            this.receiver.setButtonView(buttonView);
            this.receiver.setWaveformView(waveformView);
            this.receiver.setTimeProgress(textView, this.duration);
            registerReceiver(context);
            buttonView.setOnClickListener(this.clickListener);
            if (init) {
                view.setOnClickListener(null);
                view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() { // from class: com.vkontakte.android.attachments.AudioMessageAttachment.1
                    @Override // android.view.View.OnAttachStateChangeListener
                    public void onViewAttachedToWindow(View view2) {
                    }

                    @Override // android.view.View.OnAttachStateChangeListener
                    public void onViewDetachedFromWindow(View view2) {
                        AudioMessageAttachment.this.unregisterReceiver(view2.getContext());
                        AudioMessageAttachment.this.play = false;
                        AudioMessageAttachment.this.progress = null;
                    }
                });
            }
        }
        return view;
    }

    @Override // com.vkontakte.android.attachments.DocumentAttachment, com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        super.serializeTo(s);
        s.writeString(this.linkOgg);
        s.writeString(this.linkMp3);
        s.writeInt(this.duration);
        s.writeByteArray(this.waveform);
    }

    public void play(Context context) {
        if (this.receiver != null) {
            registerReceiver(context);
            this.receiver.setOid(this.oid);
            this.receiver.setDid(this.did);
        }
        Intent intentPlayer = new Intent(context, AudioMessagePlayerService.class);
        intentPlayer.putExtra(NativeProtocol.WEB_DIALOG_ACTION, 1);
        intentPlayer.putExtra("duration", this.duration);
        intentPlayer.putExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, this.oid);
        intentPlayer.putExtra("did", this.did);
        intentPlayer.putExtra(LongPollService.EXTRA_MSG_ID, this.messageId);
        intentPlayer.putExtra("url", getLink());
        intentPlayer.putExtra("progress", this.progress);
        intentPlayer.putExtra("pending", this instanceof PendingAudioMessageAttachment);
        context.startService(intentPlayer);
    }

    public void stop(Context context) {
        Intent intentPlayer = new Intent(context, AudioMessagePlayerService.class);
        intentPlayer.putExtra(NativeProtocol.WEB_DIALOG_ACTION, 2);
        intentPlayer.putExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, this.oid);
        intentPlayer.putExtra("did", this.did);
        context.startService(intentPlayer);
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }

    public byte[] getWaveform() {
        return this.waveform;
    }

    public int getDuration() {
        return this.duration;
    }

    @Override // com.vkontakte.android.attachments.DocumentAttachment, com.vkontakte.android.media.AutoPlay
    public boolean isPlaying() {
        return this.play;
    }

    public void setPlaying(boolean playing) {
        this.play = playing;
    }

    public void setProgress(Float progress) {
        this.progress = progress;
    }

    protected String getLink() {
        return this.linkOgg;
    }

    protected boolean isFileInCache() {
        return getCacheFile(this.oid, this.did).exists();
    }

    public static File getCacheFile(int oid, int did) {
        return new File(CACHE_DIR, oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + did + ".ogg");
    }

    private void registerReceiver(Context context) {
        IntentFilter filter = new IntentFilter();
        filter.addAction(AudioMessagePlayerService.ACTION_AUDIO_MESSAGE_UPDATE);
        filter.addAction(AudioMessagePlayerService.ACTION_AUDIO_MESSAGE_DONE);
        context.registerReceiver(this.receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void unregisterReceiver(Context context) {
        try {
            if (this.receiver != null) {
                context.unregisterReceiver(this.receiver);
            }
        } catch (Exception e) {
        }
    }

    /* loaded from: classes2.dex */
    private class SeekDelegate implements WaveformView.SeekBarDelegate {
        private SeekDelegate() {
        }

        @Override // com.vkontakte.android.ui.widget.WaveformView.SeekBarDelegate
        public void onSeekBarDrag(float progress) {
            if (AudioMessageAttachment.this.play) {
                Context context = VKApplication.context;
                Intent intentPlayer = new Intent(context, AudioMessagePlayerService.class);
                intentPlayer.putExtra(NativeProtocol.WEB_DIALOG_ACTION, 7);
                intentPlayer.putExtra("progress", progress);
                context.startService(intentPlayer);
                return;
            }
            AudioMessageAttachment.this.progress = Float.valueOf(progress);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class OnPlayButtonClickListener implements View.OnClickListener {
        private OnPlayButtonClickListener() {
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            final Context context = v.getContext();
            if (AudioMessageAttachment.this.isFileInCache()) {
                AudioMessageAttachment.this.play(context);
            } else {
                new DocsGetById(AudioMessageAttachment.this.oid, AudioMessageAttachment.this.did, AudioMessageAttachment.this.access_key).setCallback(new SimpleCallback<Document>(context) { // from class: com.vkontakte.android.attachments.AudioMessageAttachment.OnPlayButtonClickListener.1
                    @Override // com.vkontakte.android.api.Callback
                    public void success(Document doc) {
                        AudioMessageAttachment.this.linkMp3 = doc.linkMp3;
                        AudioMessageAttachment.this.linkOgg = doc.linkOgg;
                        AudioMessageAttachment.this.duration = doc.duration;
                        AudioMessageAttachment.this.waveform = doc.waveform;
                        AudioMessageAttachment.this.play(context);
                    }

                    @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                    public void fail(VKAPIRequest.VKErrorResponse error) {
                        super.fail(error);
                    }
                }).exec(context);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class UpdateReceiver extends BroadcastReceiver {
        private WeakReference<ImageView> buttonView;
        private int did;
        private int duration;
        private int oid;
        private WeakReference<TextView> textView;
        private WeakReference<WaveformView> waveformView;

        private UpdateReceiver() {
            this.waveformView = new WeakReference<>(null);
            this.buttonView = new WeakReference<>(null);
            this.textView = new WeakReference<>(null);
        }

        public void setTextView(TextView textView) {
            this.textView = new WeakReference<>(textView);
        }

        public void setWaveformView(WaveformView waveformView) {
            this.waveformView = new WeakReference<>(waveformView);
        }

        public void setButtonView(ImageView buttonView) {
            this.buttonView = new WeakReference<>(buttonView);
        }

        public void setOid(int oid) {
            this.oid = oid;
        }

        public void setDid(int did) {
            this.did = did;
        }

        public void setDuration(int duration) {
            this.duration = duration;
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            Float f = null;
            WaveformView waveform = this.waveformView.get();
            ImageView button = this.buttonView.get();
            TextView text = this.textView.get();
            if (waveform != null && button != null && text != null && intent.getIntExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, 0) == this.oid && intent.getIntExtra("did", 0) == this.did) {
                String action = intent.getAction() == null ? "" : intent.getAction();
                char c = 65535;
                switch (action.hashCode()) {
                    case -1841973862:
                        if (action.equals(AudioMessagePlayerService.ACTION_AUDIO_MESSAGE_UPDATE)) {
                            c = 1;
                            break;
                        }
                        break;
                    case 583050387:
                        if (action.equals(AudioMessagePlayerService.ACTION_AUDIO_MESSAGE_DONE)) {
                            c = 0;
                            break;
                        }
                        break;
                }
                switch (c) {
                    case 0:
                        AudioMessageAttachment.this.progress = null;
                        waveform.setProgress(null);
                        updatePlayButton(button, false);
                        setTimeProgress(text, this.duration);
                        return;
                    case 1:
                        boolean playing = intent.getBooleanExtra("playing", false);
                        if (intent.hasExtra("progress")) {
                            f = Float.valueOf(intent.getFloatExtra("progress", 0.0f));
                        }
                        setProgress(waveform, f);
                        setTimeProgress(text, intent.getIntExtra("position", 0));
                        updatePlayButton(button, playing);
                        return;
                    default:
                        return;
                }
            }
        }

        private void setProgress(WaveformView waveformView, Float progress) {
            if ((progress == null && AudioMessageAttachment.this.progress != null) || (progress != null && !progress.equals(AudioMessageAttachment.this.progress))) {
                AudioMessageAttachment.this.progress = progress;
                waveformView.setProgress(progress);
            }
        }

        private void updatePlayButton(ImageView button, boolean play) {
            if (AudioMessageAttachment.this.play != play) {
                AudioMessageAttachment.this.play = play;
                button.setImageResource(play ? R.drawable.ic_attach_audio_pause : R.drawable.ic_attach_audio_play);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setTimeProgress(TextView textView, int duration) {
            textView.setText(String.format(Locale.US, "%d:%02d", Integer.valueOf(duration / 60), Integer.valueOf(duration % 60)));
        }
    }
}
