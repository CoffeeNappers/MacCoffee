package com.vkontakte.android.ui;

import android.app.Activity;
import android.app.Fragment;
import android.app.ProgressDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.Cursor;
import android.graphics.Point;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.view.Display;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Toast;
import com.facebook.common.util.UriUtil;
import com.facebook.internal.NativeProtocol;
import com.google.android.exoplayer2.util.MimeTypes;
import com.vk.attachpicker.AttachActivity;
import com.vk.attachpicker.AttachIntent;
import com.vk.core.util.AnimationUtils;
import com.vk.core.util.TimeoutLock;
import com.vk.emoji.Emoji;
import com.vk.media.utils.MediaUtils;
import com.vkontakte.android.AudioMessagePlayerService;
import com.vkontakte.android.Global;
import com.vkontakte.android.Message;
import com.vkontakte.android.Photo;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.AudioAttachment;
import com.vkontakte.android.attachments.FwdMessagesAttachment;
import com.vkontakte.android.attachments.GeoAttachment;
import com.vkontakte.android.attachments.GraffitiAttachment;
import com.vkontakte.android.attachments.PendingAudioMessageAttachment;
import com.vkontakte.android.attachments.PendingGraffitiAttachment;
import com.vkontakte.android.attachments.PendingPhotoAttachment;
import com.vkontakte.android.attachments.PendingVideoAttachment;
import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.attachments.VideoAttachment;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.media.audio.AudioMessageUtils;
import com.vkontakte.android.stickers.AutoSuggestStickersPopupWindow;
import com.vkontakte.android.stickers.KeyboardPopup;
import com.vkontakte.android.stickers.Stickers;
import com.vkontakte.android.stickers.StickersView;
import com.vkontakte.android.ui.AttachmentsEditorView;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
import com.vkontakte.android.ui.widget.RichEditText;
import com.vkontakte.android.ui.widget.VoiceRecordControlPopupWindow;
import com.vkontakte.android.ui.widget.WaveformView;
import com.vkontakte.android.upload.Upload;
import com.vkontakte.android.upload.UploadUtils;
import com.vkontakte.android.utils.Utils;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class WriteBar extends LinearLayout implements KeyboardPopup.OnVisibilityChangedListener {
    private static final int ATTACHMENTS_RESULT = 10010;
    private static final int AUDIO_RESULT = 10003;
    private static final int DOC_RESULT = 10004;
    private static final int LOCATION_RESULT = 10005;
    private static final int PHOTO_RESULT = 10001;
    private static final int VIDEO_EXISTING_RESULT = 10006;
    private static final int VIDEO_NEW_RESULT = 10007;
    private static final int VIDEO_RESULT = 10002;
    private boolean allowNew;
    private AttachmentsEditorView attEditor;
    private View attachDivider;
    private final AudioMessageUtils audioMessageUtils;
    private final String audioRecordSessionId;
    private View buttonCancel;
    private View buttonPause;
    private View buttonPlay;
    private View buttonRecord;
    private View buttonSend;
    private View durationArea;
    private Runnable fadeRunnable;
    private Fragment fragment;
    public boolean giftAllowed;
    public UserProfile giftUser;
    public SparseArray<UserProfile> giftUsers;
    private boolean graffitiAllowed;
    private String graffitiPhoto;
    private GraffitiSender graffitiSender;
    private String graffitiTitle;
    private boolean isActive;
    private boolean isChat;
    private boolean isErrorViewShown;
    private AutoSuggestStickersPopupWindow mAutoSuggestPopup;
    private StickersView.Listener mAutoSuggestPopupListener;
    private KeyboardPopup mKeyboardPopup;
    private final BroadcastReceiver mReceiver;
    private boolean mapAllowed;
    private int maxAtts;
    private MentionsManager mentionsManager;
    public boolean moneyTransferAllowed;
    private View.OnClickListener onSendClickListener;
    private Runnable onUplDone;
    private Runnable onUplFail;
    public int peerId;
    private int replyBarVisibility;
    private View slideToCancel;
    private VoiceRecordControlPopupWindow voiceRecordControlPopup;
    private final VoiceRecordControlEventListener voiceRecordEventListener;
    private ViewGroup waveformArea;
    private android.widget.TextView waveformDuration;
    private WaveformView waveformView;
    private ViewGroup writeAudioArea;
    private RichEditText writeBarEdit;
    private ImageView writeBarEmoji;
    private ImageView writeBarEmojiNew;
    private android.widget.TextView writeDuration;
    private View writeRecordDot;
    private View writeRecordTip;
    private ViewGroup writeTextArea;

    /* loaded from: classes3.dex */
    public interface GraffitiSender {
        void sendGraffiti(GraffitiAttachment graffitiAttachment);
    }

    /* loaded from: classes3.dex */
    public interface MentionSuggestionsSupplier {
        int findExactMatch(String str);

        boolean getIsShowingMentionsSuggestions();

        void hideMentionSuggestions();

        void showMentionSuggestionsFor(String str);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.ui.WriteBar$1  reason: invalid class name */
    /* loaded from: classes3.dex */
    public class AnonymousClass1 extends BroadcastReceiver {
        AnonymousClass1() {
        }

        /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            char c;
            String action = intent.getAction() == null ? "" : intent.getAction();
            switch (action.hashCode()) {
                case -2124402942:
                    if (action.equals(AudioMessageUtils.ACTION_AUDIO_MESSAGE_DONE)) {
                        c = 3;
                        break;
                    }
                    c = 65535;
                    break;
                case -1841973862:
                    if (action.equals(AudioMessagePlayerService.ACTION_AUDIO_MESSAGE_UPDATE)) {
                        c = 5;
                        break;
                    }
                    c = 65535;
                    break;
                case -1483319814:
                    if (action.equals(AudioMessageUtils.ACTION_AUDIO_MESSAGE_CANCEL)) {
                        c = 1;
                        break;
                    }
                    c = 65535;
                    break;
                case -1430964632:
                    if (action.equals(AudioMessageUtils.ACTION_AUDIO_MESSAGE_ERROR)) {
                        c = 2;
                        break;
                    }
                    c = 65535;
                    break;
                case -954441655:
                    if (action.equals(AudioMessageUtils.ACTION_AUDIO_MESSAGE_UPDATE)) {
                        c = 4;
                        break;
                    }
                    c = 65535;
                    break;
                case 583050387:
                    if (action.equals(AudioMessagePlayerService.ACTION_AUDIO_MESSAGE_DONE)) {
                        c = 6;
                        break;
                    }
                    c = 65535;
                    break;
                case 2038551911:
                    if (action.equals(Stickers.ACTION_STICKERS_NUM_UPDATES)) {
                        c = 0;
                        break;
                    }
                    c = 65535;
                    break;
                default:
                    c = 65535;
                    break;
            }
            switch (c) {
                case 0:
                    if (WriteBar.this.writeBarEmojiNew != null) {
                        WriteBar.this.writeBarEmojiNew.setVisibility((!WriteBar.this.allowNew || Stickers.get().getGlobalPromotions() <= 0) ? 8 : 0);
                        return;
                    }
                    return;
                case 1:
                    if (WriteBar.this.attEditor != null && TextUtils.equals(intent.getStringExtra("peerId"), WriteBar.this.audioRecordSessionId)) {
                        WriteBar.this.hideVoiceRecordControl();
                        return;
                    }
                    return;
                case 2:
                    if (WriteBar.this.attEditor != null && TextUtils.equals(intent.getStringExtra("peerId"), WriteBar.this.audioRecordSessionId)) {
                        WriteBar.this.postDelayed(WriteBar$1$$Lambda$1.lambdaFactory$(this), 300L);
                        return;
                    }
                    return;
                case 3:
                    if (WriteBar.this.attEditor != null && TextUtils.equals(intent.getStringExtra("peerId"), WriteBar.this.audioRecordSessionId)) {
                        File file = (File) intent.getSerializableExtra(UriUtil.LOCAL_FILE_SCHEME);
                        int duration = intent.getIntExtra("duration", 0);
                        byte[] waveform = intent.getByteArrayExtra("waveform");
                        String path = new Uri.Builder().scheme(UriUtil.LOCAL_FILE_SCHEME).path(file.getAbsolutePath()).build().toString();
                        String[] ext = path.split("\\.");
                        PendingAudioMessageAttachment attachment = new PendingAudioMessageAttachment(file.getName(), file.getAbsolutePath(), (int) file.length(), VKAccountManager.getCurrent().getUid(), Upload.getNewID(), ext[ext.length - 1], duration, waveform);
                        WriteBar.this.audioMessageUtils.addPendingRecord(WriteBar.this.peerId, attachment);
                        if (WriteBar.this.isActive) {
                            WriteBar.this.attEditor.addHidden(attachment);
                        }
                        WriteBar.this.voiceRecordControlPopup.setAmplitude(null);
                        if (intent.getBooleanExtra("send", false)) {
                            WriteBar.this.buttonSend.performClick();
                            WriteBar.this.hideVoiceRecordControl();
                            return;
                        } else if (intent.getBooleanExtra("show_waveform", false)) {
                            WriteBar.this.showWaveformView(true);
                            WriteBar.this.setTimeProgress(duration);
                            WriteBar.this.waveformView.setWaveform(waveform);
                            return;
                        } else {
                            WriteBar.this.writeRecordDot.setVisibility(8);
                            return;
                        }
                    }
                    return;
                case 4:
                    if (TextUtils.equals(intent.getStringExtra("peerId"), WriteBar.this.audioRecordSessionId)) {
                        WriteBar.this.setTimeProgress(intent.getIntExtra("duration", 0));
                        double amplitude = intent.getDoubleExtra("amplitude", 0.0d);
                        WriteBar.this.voiceRecordControlPopup.setAmplitude(Double.valueOf(amplitude));
                        return;
                    }
                    return;
                case 5:
                    PendingAudioMessageAttachment attachment2 = WriteBar.this.audioMessageUtils.getPendingRecord(WriteBar.this.peerId);
                    if (attachment2 != null) {
                        int oid = attachment2.oid;
                        int did = attachment2.did;
                        if (intent.getIntExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, 0) == oid && intent.getIntExtra("did", 0) == did) {
                            WriteBar.this.setTimeProgress(intent.getIntExtra("position", 0));
                            Float progress = intent.hasExtra("progress") ? Float.valueOf(intent.getFloatExtra("progress", 0.0f)) : null;
                            boolean playing = intent.getBooleanExtra("playing", false);
                            attachment2.setPlaying(playing);
                            WriteBar.this.waveformView.setProgress(progress);
                            WriteBar.this.showPlayPauseButton(!playing && WriteBar.this.buttonPause.getVisibility() == 0);
                            return;
                        }
                        return;
                    }
                    return;
                case 6:
                    PendingAudioMessageAttachment attachment3 = WriteBar.this.audioMessageUtils.getPendingRecord(WriteBar.this.peerId);
                    if (attachment3 != null) {
                        attachment3.setPlaying(false);
                        WriteBar.this.setTimeProgress(attachment3.getDuration());
                        WriteBar.this.waveformView.setProgress(null);
                        WriteBar.this.showPlayPauseButton(true);
                        return;
                    }
                    return;
                default:
                    return;
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onReceive$0() {
            WriteBar.this.hideVoiceRecordControl();
        }
    }

    public WriteBar(Context context) {
        super(context);
        this.maxAtts = 10;
        this.mapAllowed = true;
        this.graffitiAllowed = false;
        this.giftAllowed = false;
        this.moneyTransferAllowed = false;
        this.allowNew = true;
        this.voiceRecordEventListener = new VoiceRecordControlEventListener(this, null);
        this.audioMessageUtils = AudioMessageUtils.getInstance();
        this.audioRecordSessionId = UUID.randomUUID().toString();
        this.replyBarVisibility = 8;
        this.mReceiver = new AnonymousClass1();
        init();
    }

    public WriteBar(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.maxAtts = 10;
        this.mapAllowed = true;
        this.graffitiAllowed = false;
        this.giftAllowed = false;
        this.moneyTransferAllowed = false;
        this.allowNew = true;
        this.voiceRecordEventListener = new VoiceRecordControlEventListener(this, null);
        this.audioMessageUtils = AudioMessageUtils.getInstance();
        this.audioRecordSessionId = UUID.randomUUID().toString();
        this.replyBarVisibility = 8;
        this.mReceiver = new AnonymousClass1();
        init();
    }

    public WriteBar(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.maxAtts = 10;
        this.mapAllowed = true;
        this.graffitiAllowed = false;
        this.giftAllowed = false;
        this.moneyTransferAllowed = false;
        this.allowNew = true;
        this.voiceRecordEventListener = new VoiceRecordControlEventListener(this, null);
        this.audioMessageUtils = AudioMessageUtils.getInstance();
        this.audioRecordSessionId = UUID.randomUUID().toString();
        this.replyBarVisibility = 8;
        this.mReceiver = new AnonymousClass1();
        init();
    }

    public void setKeyboardPopup(KeyboardPopup keyboardPopup) {
        this.mKeyboardPopup = keyboardPopup;
    }

    public void setOnSendClickListener(View.OnClickListener onSendClickListener) {
        this.onSendClickListener = onSendClickListener;
    }

    public void setChat(boolean chat) {
        this.isChat = chat;
        if (this.isChat) {
            this.buttonRecord.setOnTouchListener(new OnRecordTouchListener(this, null));
        }
        checkSendButtonState(false);
    }

    public void setGraffitiPhoto(String graffitiPhoto) {
        this.graffitiPhoto = graffitiPhoto;
    }

    public void setGraffitiTitle(String graffitiTitle) {
        this.graffitiTitle = graffitiTitle;
    }

    public void setGraffitiSender(GraffitiSender graffitiSender) {
        this.graffitiSender = graffitiSender;
    }

    public MentionsManager setMentionSuggestionsSupplier(MentionSuggestionsSupplier mentionSuggestionsSupplier) {
        this.mentionsManager = new MentionsManager(this.writeBarEdit, mentionSuggestionsSupplier);
        return this.mentionsManager;
    }

    public void setGraffitiAllowed(boolean graffitiAllowed) {
        this.graffitiAllowed = graffitiAllowed;
    }

    public View getAnchor() {
        return this.writeBarEmoji;
    }

    public void setAutoSuggestPopupListener(StickersView.Listener listener) {
        this.mAutoSuggestPopupListener = listener;
    }

    public void addReplyBarView(View replyBar) {
        int ind = indexOfChild(this.attEditor);
        addView(replyBar, ind + 1, new LinearLayout.LayoutParams(-1, -2));
    }

    public void handleReplyBarVisibilityChange(int newReplyBarVisibility) {
        this.replyBarVisibility = newReplyBarVisibility;
        updateAttachDividerVisibility();
    }

    private void init() {
        setBackgroundColor(-1);
        setOrientation(1);
        final Context context = getContext();
        addView(inflate(context, R.layout.write_bar, null));
        this.buttonSend = findViewById(R.id.writebar_send);
        this.buttonRecord = findViewById(R.id.writebar_record);
        this.buttonCancel = findViewById(R.id.writebar_cancel);
        this.durationArea = findViewById(R.id.writebar_duration_area);
        this.writeRecordTip = findViewById(R.id.writebar_record_tip);
        this.writeRecordDot = findViewById(R.id.writebar_record_dot);
        this.slideToCancel = findViewById(R.id.writebar_slide_to_cancel);
        this.writeDuration = (android.widget.TextView) findViewById(R.id.writebar_duration);
        this.writeTextArea = (ViewGroup) findViewById(R.id.writebar_text_area);
        this.writeAudioArea = (ViewGroup) findViewById(R.id.writebar_audio_area);
        this.waveformArea = (ViewGroup) findViewById(R.id.writebar_waveform_area);
        this.waveformView = (WaveformView) findViewById(R.id.writebar_waveform);
        this.waveformDuration = (android.widget.TextView) findViewById(R.id.writebar_waveform_duration);
        this.buttonPlay = findViewById(R.id.writebar_play);
        this.buttonPause = findViewById(R.id.writebar_pause);
        this.fadeRunnable = new FadeRunnable(this.writeTextArea, this.writeRecordTip);
        this.writeAudioArea.setVisibility(4);
        this.buttonRecord.setVisibility(8);
        this.waveformView.setSeekBarDelegate(new SeekDelegate(this, null));
        View writeBarAttach = findViewById(R.id.writebar_attach);
        this.writeBarEdit = (RichEditText) findViewById(R.id.writebar_edit);
        this.writeBarEmoji = (ImageView) findViewById(R.id.writebar_emoji);
        this.writeBarEmojiNew = (ImageView) findViewById(R.id.writebar_emoji_new);
        this.buttonCancel.setOnClickListener(WriteBar$$Lambda$1.lambdaFactory$(this));
        this.writeBarEmoji.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.ui.WriteBar.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (WriteBar.this.mKeyboardPopup != null) {
                    Stickers.get().checkServerUpdates();
                    WriteBar.this.mKeyboardPopup.toggle();
                }
            }
        });
        this.buttonPlay.setOnClickListener(WriteBar$$Lambda$2.lambdaFactory$(this));
        this.buttonPause.setOnClickListener(WriteBar$$Lambda$3.lambdaFactory$(this));
        findViewById(R.id.writebar_remove).setOnClickListener(WriteBar$$Lambda$4.lambdaFactory$(this));
        this.buttonSend.setOnClickListener(WriteBar$$Lambda$5.lambdaFactory$(this));
        writeBarAttach.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.ui.WriteBar.3
            private final TimeoutLock lock = new TimeoutLock(500);

            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                boolean z = true;
                if (!this.lock.isLocked()) {
                    this.lock.lock();
                    WriteBar.this.buttonRecord.setEnabled(false);
                    if (WriteBar.this.attEditor.getCount() < WriteBar.this.maxAtts) {
                        Intent intent = new Intent(context, AttachActivity.class);
                        intent.putExtra(AttachIntent.INTENT_SELECTION_LIMIT, WriteBar.this.maxAtts - WriteBar.this.attEditor.getCount());
                        intent.putExtra(AttachIntent.INTENT_ENABLE_GRAFFITI_ATT, WriteBar.this.graffitiAllowed);
                        intent.putExtra(AttachIntent.INTENT_ENABLE_MAP_ATT, WriteBar.this.mapAllowed && !WriteBar.this.attEditor.containsGeoAttachment());
                        if (!WriteBar.this.isChat || !WriteBar.this.giftAllowed) {
                            z = false;
                        }
                        intent.putExtra(AttachIntent.INTENT_ENABLE_GIFT_ATT, z);
                        intent.putExtra(AttachIntent.INTENT_ENABLE_MONEY_ATT, WriteBar.this.moneyTransferAllowed);
                        intent.putExtra(AttachIntent.INTENT_MONEY_PEER_ID, WriteBar.this.peerId);
                        if (WriteBar.this.giftUser != null) {
                            ArrayList<UserProfile> users = new ArrayList<>();
                            users.add(WriteBar.this.giftUser);
                            intent.putExtra(AttachIntent.INTENT_GIFT_USERS, users);
                        }
                        if (WriteBar.this.giftUsers != null && WriteBar.this.giftUsers.size() > 0) {
                            intent.putExtra(AttachIntent.INTENT_GIFT_USERS, Utils.asList(WriteBar.this.giftUsers));
                        }
                        if (WriteBar.this.graffitiAllowed) {
                            if (WriteBar.this.graffitiPhoto != null) {
                                intent.putExtra(AttachIntent.INTENT_GRAFFITI_AVATAR, WriteBar.this.graffitiPhoto);
                            }
                            if (WriteBar.this.graffitiTitle != null) {
                                intent.putExtra(AttachIntent.INTENT_GRAFFITI_TITLE, WriteBar.this.graffitiTitle);
                            }
                        }
                        WriteBar.this.fragment.startActivityForResult(intent, WriteBar.ATTACHMENTS_RESULT);
                        return;
                    }
                    Toast.makeText(context, WriteBar.this.getResources().getString(R.string.attachments_limit, Integer.valueOf(WriteBar.this.maxAtts)), 0).show();
                }
            }
        });
        this.attachDivider = new View(context);
        this.attachDivider.setBackgroundColor(-2171170);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, Global.scale(1.0f));
        int scale = Global.scale(12.0f);
        lp.rightMargin = scale;
        lp.leftMargin = scale;
        addView(this.attachDivider, 0, lp);
        this.attEditor = new AttachmentsEditorView(context);
        this.attEditor.setPadding(V.dp(16.0f), 0, V.dp(16.0f), 0);
        addView(this.attEditor, 0, new LinearLayout.LayoutParams(-1, Global.scale(91.0f)));
        setAttEditorVisible(false);
        checkSendButtonState(false);
        this.attEditor.setCallback(new AttachmentsEditorView.Callback() { // from class: com.vkontakte.android.ui.WriteBar.4
            @Override // com.vkontakte.android.ui.AttachmentsEditorView.Callback
            public void onAttachmentRemoved(Attachment att) {
                WriteBar.this.buttonRecord.setEnabled(true);
                if (WriteBar.this.attEditor.getRealCount() == 0) {
                    if (Build.VERSION.SDK_INT < 14) {
                        WriteBar.this.setAttEditorVisible(false);
                        WriteBar.this.checkSendButtonState(true);
                        return;
                    }
                    WriteBar.this.postDelayed(new Runnable() { // from class: com.vkontakte.android.ui.WriteBar.4.1
                        @Override // java.lang.Runnable
                        public void run() {
                            WriteBar.this.setAttEditorVisible(false);
                            WriteBar.this.checkSendButtonState(true);
                        }
                    }, 300L);
                }
            }

            @Override // com.vkontakte.android.ui.AttachmentsEditorView.Callback
            public void onAllUploadsDone() {
                if (WriteBar.this.onUplDone != null) {
                    WriteBar.this.onUplDone.run();
                    WriteBar.this.onUplDone = WriteBar.this.onUplFail = null;
                }
            }

            @Override // com.vkontakte.android.ui.AttachmentsEditorView.Callback
            public void onUploadFailed() {
                if (WriteBar.this.onUplFail != null) {
                    WriteBar.this.onUplFail.run();
                    WriteBar.this.onUplDone = WriteBar.this.onUplFail = null;
                }
            }
        });
        if (Build.VERSION.SDK_INT >= 14) {
            getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.ui.WriteBar.5
                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    WriteBar.this.getViewTreeObserver().removeOnPreDrawListener(this);
                    ((ViewGroup) WriteBar.this.getParent()).setClipChildren(false);
                    ((ViewGroup) WriteBar.this.getParent()).setClipToPadding(false);
                    return true;
                }
            });
            ViewUtils.setNoClipRecursive(this);
        }
        this.writeBarEdit.addTextChangedListener(new TextWatcher() { // from class: com.vkontakte.android.ui.WriteBar.6
            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable s) {
                Emoji.instance(WriteBar.this.getContext()).replaceEmoji(s);
                if (s == null || s.length() <= 0 || WriteBar.this.waveformArea.getVisibility() != 0) {
                    WriteBar.this.checkSendButtonState(true);
                } else {
                    WriteBar.this.writeBarEdit.setText("");
                }
            }
        });
        this.voiceRecordControlPopup = new VoiceRecordControlPopupWindow(context, findViewById(R.id.writebar_action), this.buttonCancel, this.voiceRecordEventListener);
        this.mAutoSuggestPopup = new AutoSuggestStickersPopupWindow(context, this.writeBarEdit, writeBarAttach);
        this.mAutoSuggestPopup.setListener(new StickersView.Listener() { // from class: com.vkontakte.android.ui.WriteBar.7
            @Override // com.vkontakte.android.stickers.StickersView.Listener
            public void onStickerSelected(int packId, int stickerId, String url, String stickerReferrer) {
                if (WriteBar.this.mAutoSuggestPopupListener != null) {
                    WriteBar.this.writeBarEdit.setText("");
                    WriteBar.this.mAutoSuggestPopupListener.onStickerSelected(packId, stickerId, url, stickerReferrer);
                }
            }

            @Override // com.vk.emoji.EmojiKeyboardListener
            public void onEmojiSelected(String emoji) {
            }

            @Override // com.vk.emoji.EmojiKeyboardListener
            public void onBackspace() {
            }
        });
        final int[] location = new int[2];
        final Point size = new Point();
        addOnLayoutChangeListener(new View.OnLayoutChangeListener() { // from class: com.vkontakte.android.ui.WriteBar.8
            private boolean lastEnoughTipSpace = true;

            @Override // android.view.View.OnLayoutChangeListener
            public void onLayoutChange(View v, int left, int top, int right, int bottom, int oldLeft, int oldTop, int oldRight, int oldBottom) {
                if (left != oldLeft || right != oldRight || top != oldTop || bottom != oldBottom) {
                    Log.v("WriteBar", "onLayoutChange bottom =  " + bottom);
                    WriteBar.this.mAutoSuggestPopup.hidePopup();
                    WindowManager wm = (WindowManager) context.getSystemService("window");
                    Display display = wm.getDefaultDisplay();
                    display.getSize(size);
                    v.getLocationOnScreen(location);
                    int bottomOfView = location[1] + (bottom - top);
                    Log.v("WriteBar", "onLayoutChange bottomOfView =  " + bottomOfView);
                    if (size.y - bottomOfView > 200) {
                        final String text = WriteBar.this.writeBarEdit.getText().toString();
                        ViewUtils.post(new Runnable() { // from class: com.vkontakte.android.ui.WriteBar.8.1
                            @Override // java.lang.Runnable
                            public void run() {
                                WriteBar.this.mAutoSuggestPopup.showHidePopupWindow(Stickers.get().getAutoSuggestStickersFor(text));
                            }
                        });
                    }
                    WriteBar.this.voiceRecordEventListener.resetDistance();
                    WriteBar.this.writeRecordTip.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.vkontakte.android.ui.WriteBar.8.2
                        @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
                        public void onGlobalLayout() {
                            WriteBar.this.writeRecordTip.getViewTreeObserver().removeGlobalOnLayoutListener(this);
                            int leftMin = WriteBar.this.getResources().getDimensionPixelSize(R.dimen.voice_rec_tip_left_padding_min);
                            int leftMax = WriteBar.this.getResources().getDimensionPixelSize(R.dimen.voice_rec_tip_left_padding_max);
                            int right2 = WriteBar.this.getResources().getDimensionPixelSize(R.dimen.voice_rec_tip_right_padding);
                            if (WriteBar.this.writeRecordTip.getWidth() >= WriteBar.this.getWidth()) {
                                AnonymousClass8.this.lastEnoughTipSpace = false;
                                WriteBar.this.writeRecordTip.setPadding(leftMin, 0, right2, 0);
                            } else if (!AnonymousClass8.this.lastEnoughTipSpace) {
                                AnonymousClass8.this.lastEnoughTipSpace = true;
                                int diff = WriteBar.this.getWidth() - WriteBar.this.writeRecordTip.getWidth();
                                int left2 = diff < leftMax ? diff : leftMax;
                                WriteBar.this.writeRecordTip.setPadding(left2, 0, right2, 0);
                            }
                        }
                    });
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$init$0(View view) {
        cancelRecord();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$init$1(View v) {
        playAudioMessage();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$init$2(View v) {
        playAudioMessage();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$init$3(View v) {
        cancelRecord();
        checkSendButtonState(true);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$init$4(View v) {
        hideWaveformView(true);
        this.buttonRecord.setEnabled(true);
        this.audioMessageUtils.deleteCurrentRecord();
        if (this.onSendClickListener != null) {
            this.onSendClickListener.onClick(v);
        }
    }

    public void setFragment(Fragment f) {
        this.fragment = f;
    }

    public void setUploadType(boolean isWall, int oid) {
        this.attEditor.isWallPhoto = isWall;
        this.attEditor.uploadOwnerId = oid;
    }

    public String getText() {
        return this.writeBarEdit.getText().toString();
    }

    public String getMentionsForSerialization() {
        return this.mentionsManager != null ? this.mentionsManager.getMentionsForSerialization() : "";
    }

    public void setMentionsFromSerializedString(String data) {
        if (this.mentionsManager != null) {
            this.mentionsManager.setMentionsFromSerializedString(data);
        }
    }

    public String getAsFormattedString() {
        return this.mentionsManager != null ? this.mentionsManager.getAsFormattedString() : getText();
    }

    public void setText(CharSequence text) {
        this.writeBarEdit.setText(text);
        checkSendButtonState(true);
    }

    public boolean isTextEmpty() {
        return getText().length() == 0;
    }

    public boolean isUploading() {
        return this.attEditor.isUploading();
    }

    public ArrayList<Attachment> getAttachments() {
        return this.attEditor.getAll();
    }

    public void clearAttachments() {
        this.audioMessageUtils.removePendingRecord(this.peerId);
        this.attEditor.clear();
        setAttEditorVisible(false);
    }

    public void addAttachment(Attachment att) {
        this.attEditor.add(att);
        if (att instanceof PendingAudioMessageAttachment) {
            this.audioMessageUtils.addPendingRecord(this.peerId, (PendingAudioMessageAttachment) att);
            setAttEditorVisible(false);
        } else {
            setAttEditorVisible(true);
        }
        checkSendButtonState(true);
    }

    public void setAttachLimits(int max, boolean allowMap) {
        this.mapAllowed = allowMap;
        this.maxAtts = max;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAttEditorVisible(boolean visible) {
        this.attEditor.setVisibility(visible ? 0 : 8);
        updateAttachDividerVisibility();
    }

    private void updateAttachDividerVisibility() {
        if (this.attEditor.getVisibility() == 0 && this.replyBarVisibility != 0) {
            this.attachDivider.setVisibility(0);
        } else {
            this.attachDivider.setVisibility(8);
        }
    }

    public void focus() {
        this.writeBarEdit.requestFocus();
        this.writeBarEdit.setSelection(getText().length());
        InputMethodManager imm = (InputMethodManager) getContext().getSystemService("input_method");
        imm.showSoftInput(this.writeBarEdit, 1);
    }

    public void onActivityResult(int reqCode, int resCode, Intent data) {
        if (resCode != -1 || data == null) {
            this.buttonRecord.setEnabled(true);
            return;
        }
        if (reqCode == ATTACHMENTS_RESULT) {
            if (data.hasExtra(AttachIntent.RESULT_NEW_GRAFFITI)) {
                PendingGraffitiAttachment graffiti = (PendingGraffitiAttachment) data.getParcelableExtra(AttachIntent.RESULT_NEW_GRAFFITI);
                if (this.graffitiSender != null) {
                    this.graffitiSender.sendGraffiti(graffiti);
                }
                this.buttonRecord.setEnabled(true);
                return;
            } else if (data.hasExtra(AttachIntent.RESULT_GRAFFITI)) {
                GraffitiAttachment graffiti2 = (GraffitiAttachment) data.getParcelableExtra(AttachIntent.RESULT_GRAFFITI);
                if (this.graffitiSender != null) {
                    this.graffitiSender.sendGraffiti(graffiti2);
                }
                this.buttonRecord.setEnabled(true);
                return;
            } else {
                setAttEditorVisible(true);
                if (data.hasExtra(AttachIntent.RESULT_ATTACHMENTS)) {
                    Bundle result = data.getBundleExtra(AttachIntent.RESULT_ATTACHMENTS);
                    if (result.containsKey(AttachIntent.RESULT_FILES) && result.containsKey(AttachIntent.RESULT_VIDEO_FLAGS)) {
                        ArrayList<Uri> files = result.getParcelableArrayList(AttachIntent.RESULT_FILES);
                        boolean[] videoFlags = result.getBooleanArray(AttachIntent.RESULT_VIDEO_FLAGS);
                        for (int i = 0; i < videoFlags.length; i++) {
                            Uri u = files.get(i);
                            if (videoFlags[i]) {
                                addVideoFile(u);
                            } else {
                                addAttachment(new PendingPhotoAttachment(u.getScheme() + "://" + u.getEncodedPath()));
                            }
                        }
                    }
                } else if (data.hasExtra(MimeTypes.BASE_TYPE_AUDIO)) {
                    MusicTrack file = (MusicTrack) data.getParcelableExtra(MimeTypes.BASE_TYPE_AUDIO);
                    addAttachment(new AudioAttachment(file));
                } else if (data.hasExtra("documents")) {
                    ArrayList<Parcelable> docs = data.getParcelableArrayListExtra("documents");
                    Iterator<Parcelable> it = docs.iterator();
                    while (it.hasNext()) {
                        Parcelable p = it.next();
                        addAttachment((Attachment) p);
                    }
                } else if (data.hasExtra("video")) {
                    VideoFile video = (VideoFile) data.getParcelableExtra("video");
                    addAttachment(new VideoAttachment(video));
                } else if (data.hasExtra("photo")) {
                    Photo photo = (Photo) data.getParcelableExtra("photo");
                    addAttachment(new PhotoAttachment(photo));
                } else if (data.hasExtra("point")) {
                    GeoAttachment geo = (GeoAttachment) data.getParcelableExtra("point");
                    addAttachment(geo);
                }
            }
        }
        if (reqCode == AUDIO_RESULT) {
            MusicTrack file2 = (MusicTrack) data.getParcelableExtra(MimeTypes.BASE_TYPE_AUDIO);
            addAttachment(new AudioAttachment(file2));
        }
        if (reqCode == DOC_RESULT) {
            ArrayList<Parcelable> docs2 = data.getParcelableArrayListExtra("documents");
            Iterator<Parcelable> it2 = docs2.iterator();
            while (it2.hasNext()) {
                Parcelable p2 = it2.next();
                addAttachment((Attachment) p2);
            }
        }
        if (reqCode == VIDEO_RESULT) {
            VideoFile video2 = (VideoFile) data.getParcelableExtra("video");
            addAttachment(new VideoAttachment(video2));
        }
        if (reqCode == 10001) {
            if (data.hasExtra("attachment")) {
                PhotoAttachment att = (PhotoAttachment) data.getParcelableExtra("attachment");
                addAttachment(att);
            } else if (data.hasExtra("files")) {
                ArrayList<String> files2 = data.getStringArrayListExtra("files");
                Iterator<String> it3 = files2.iterator();
                while (it3.hasNext()) {
                    String file3 = it3.next();
                    addAttachment(new PendingPhotoAttachment(file3));
                }
            } else {
                addAttachment(new PendingPhotoAttachment(data.getStringExtra(UriUtil.LOCAL_FILE_SCHEME)));
            }
        }
        if (reqCode == LOCATION_RESULT) {
            addAttachment((Attachment) data.getParcelableExtra("point"));
        }
        if (reqCode == VIDEO_NEW_RESULT || reqCode == VIDEO_EXISTING_RESULT) {
            addVideoFile(data.getData());
        }
    }

    private void addVideoFile(final Uri uri) {
        final int duration = MediaUtils.getVideoDurationMs(uri) / 1000;
        String urlExternal = uri.getEncodedPath();
        if (Build.VERSION.SDK_INT < 19) {
            addVideoFileInternal(urlExternal, duration, uri);
        } else if ("unknown".equals(urlExternal)) {
            ArrayList<Uri> uris = new ArrayList<>();
            uris.add(uri);
            final Context ctx = getContext();
            final ProgressDialog progress = new ProgressDialog(ctx);
            UploadUtils.doCopyFromRestrictedProviderAsync(uris, new UploadUtils.CopiesListener() { // from class: com.vkontakte.android.ui.WriteBar.9
                @Override // com.vkontakte.android.upload.UploadUtils.CopiesListener
                public void onStart() {
                    progress.setMessage(ctx.getString(R.string.loading));
                    progress.show();
                }

                @Override // com.vkontakte.android.upload.UploadUtils.CopiesListener
                public void onError(@Nullable Exception e) {
                    Toast.makeText(ctx, (int) R.string.error, 0).show();
                    ViewUtils.dismissDialogSafety(progress);
                }

                @Override // com.vkontakte.android.upload.UploadUtils.CopiesListener
                public void onComplete(@NonNull ArrayList<Uri> newUris) {
                    if (!newUris.isEmpty()) {
                        WriteBar.this.addVideoFileInternal(newUris.get(0).getEncodedPath(), duration, uri);
                    }
                    ViewUtils.dismissDialogSafety(progress);
                }
            }, getContext());
        } else {
            addVideoFileInternal(urlExternal, duration, uri);
        }
        checkSendButtonState(true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addVideoFileInternal(String urlExternal, int duration, Uri uri) {
        VideoFile vf = new VideoFile();
        vf.urlExternal = urlExternal;
        vf.duration = duration;
        vf.title = UriUtil.LOCAL_FILE_SCHEME.equals(uri.getScheme()) ? uri.getLastPathSegment() : Uri.parse("file://" + getRealPathFromURI(uri)).getLastPathSegment();
        vf.vid = Upload.getNewID();
        vf.urlBigThumb = "file://" + getRealPathFromURI(uri);
        this.attEditor.add(new PendingVideoAttachment(vf));
    }

    public static String getRealPathFromURI(Uri contentUri) {
        if (UriUtil.LOCAL_FILE_SCHEME.equals(contentUri.getScheme())) {
            return contentUri.getEncodedPath();
        }
        String[] proj = {"_data"};
        Cursor cursor = VKApplication.context.getContentResolver().query(contentUri, proj, null, null, null);
        int column_index = cursor.getColumnIndexOrThrow("_data");
        cursor.moveToFirst();
        String string = cursor.getString(column_index);
        cursor.close();
        return string;
    }

    public void addFwdMessages(List<Message> msgs) {
        ArrayList<Attachment> atts = this.attEditor.getAll();
        int i = 0;
        boolean found = false;
        Iterator<Attachment> it = atts.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            Attachment a = it.next();
            if (a instanceof FwdMessagesAttachment) {
                found = true;
                break;
            }
            i++;
        }
        setAttEditorVisible(true);
        addAttachment(new FwdMessagesAttachment(msgs));
        if (found) {
            this.attEditor.removeWithoutCallback(i);
        }
    }

    public void waitForUploads(Runnable onDone, Runnable onFailed) {
        if (this.attEditor.isUploading()) {
            this.onUplDone = onDone;
            this.onUplFail = onFailed;
            return;
        }
        onDone.run();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void checkSendButtonState(boolean animated) {
        View toHide;
        View toShow;
        boolean empty = getText().isEmpty() && getAttachments().isEmpty();
        boolean hasRaisedRecord = this.audioMessageUtils.isHasRecord() && this.audioMessageUtils.isRaisedRecording();
        this.audioMessageUtils.setAllowStartRecord(this.isChat && empty);
        this.audioMessageUtils.setInputFieldHasText(!empty);
        if (this.isChat && empty && this.buttonSend.getVisibility() == 0) {
            toHide = this.buttonSend;
            toShow = this.buttonRecord;
        } else if (this.isChat && ((!empty && this.buttonRecord.getVisibility() == 0) || hasRaisedRecord)) {
            toHide = this.buttonRecord;
            toShow = this.buttonSend;
        } else {
            toHide = null;
            toShow = null;
        }
        if (toHide != null && toShow != null) {
            if (animated) {
                V.setVisibilityAnimated(toShow, 0, true, AnimationUtils.DELAY_MID);
                V.setVisibilityAnimated(toHide, 8, true, AnimationUtils.DELAY_MID);
                return;
            }
            changeViewVisibilityAndScale(toHide, 8);
            changeViewVisibilityAndScale(toShow, 0);
        }
    }

    private void changeViewVisibilityAndScale(View view, int visibility) {
        if (visibility == 0) {
            view.setAlpha(1.0f);
            view.setScaleX(1.0f);
            view.setScaleY(1.0f);
            view.setVisibility(0);
            view.setEnabled(true);
            return;
        }
        view.setAlpha(0.0f);
        view.setScaleX(0.1f);
        view.setScaleY(0.1f);
        view.setVisibility(visibility);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        IntentFilter filter = new IntentFilter();
        filter.addAction(Stickers.ACTION_STICKERS_NUM_UPDATES);
        filter.addAction(AudioMessageUtils.ACTION_AUDIO_MESSAGE_DONE);
        filter.addAction(AudioMessageUtils.ACTION_AUDIO_MESSAGE_ERROR);
        filter.addAction(AudioMessageUtils.ACTION_AUDIO_MESSAGE_UPDATE);
        filter.addAction(AudioMessageUtils.ACTION_AUDIO_MESSAGE_CANCEL);
        filter.addAction(AudioMessagePlayerService.ACTION_AUDIO_MESSAGE_DONE);
        filter.addAction(AudioMessagePlayerService.ACTION_AUDIO_MESSAGE_UPDATE);
        getContext().registerReceiver(this.mReceiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
        this.writeBarEmojiNew.setVisibility((!this.allowNew || Stickers.get().getGlobalPromotions() <= 0) ? 8 : 0);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        getContext().unregisterReceiver(this.mReceiver);
        this.mAutoSuggestPopup.hidePopup();
        this.voiceRecordControlPopup.dismiss();
    }

    @Override // com.vkontakte.android.stickers.KeyboardPopup.OnVisibilityChangedListener
    public void showKeyboardIcon() {
        this.writeBarEmoji.setImageDrawable(new RecoloredDrawable(getResources().getDrawable(R.drawable.ic_keyboard_24dp), -4933701));
        this.writeBarEmojiNew.setVisibility(8);
        this.allowNew = false;
    }

    @Override // com.vkontakte.android.stickers.KeyboardPopup.OnVisibilityChangedListener
    public void showHideIcon() {
        this.writeBarEmoji.setImageDrawable(new RecoloredDrawable(getResources().getDrawable(R.drawable.ic_smile_24dp), -10252609));
        this.writeBarEmojiNew.setVisibility(8);
        this.allowNew = false;
    }

    @Override // com.vkontakte.android.stickers.KeyboardPopup.OnVisibilityChangedListener
    public void showDefaultIcon() {
        this.writeBarEmoji.setImageDrawable(new RecoloredDrawable(getResources().getDrawable(R.drawable.ic_smile_24dp), -4933701));
        this.writeBarEmojiNew.setVisibility(Stickers.get().getGlobalPromotions() > 0 ? 0 : 8);
        this.allowNew = true;
    }

    public void onPause(Activity activity) {
        this.isActive = false;
        if (!this.audioMessageUtils.isRaisedRecording() && !AudioMessagePlayerService.isPlaying()) {
            stopVoiceRecord();
            this.audioMessageUtils.stopRaiseToEarSensors(activity);
        }
    }

    public void onResume(Activity activity) {
        this.isActive = true;
        if (this.audioMessageUtils.isRaisedRecording() && this.audioMessageUtils.isRecording()) {
            showVoiceRecordControl();
            return;
        }
        restoreRecordViewIfNeeded();
        this.audioMessageUtils.startRaiseToEarSensors(activity, this.audioRecordSessionId);
    }

    public void setErrorViewShown(boolean shown) {
        this.isErrorViewShown = shown;
    }

    private void stopVoiceRecord() {
        if (this.audioMessageUtils.isRecording()) {
            this.audioMessageUtils.stopRecording();
            this.writeRecordDot.setVisibility(8);
            this.attEditor.clear();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void hideVoiceRecordControl() {
        this.writeRecordTip.setVisibility(8);
        V.setVisibilityAnimated(this.buttonRecord, 0);
        V.setVisibilityAnimated(this.writeTextArea, 0);
        V.setVisibilityAnimated(this.waveformArea, 4);
        V.setVisibilityAnimated(this.writeAudioArea, 4);
        postDelayed(WriteBar$$Lambda$6.lambdaFactory$(this), 300L);
        this.voiceRecordControlPopup.hide();
        this.writeBarEdit.setKeepFocus(false);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$hideVoiceRecordControl$5() {
        setTimeProgress(0);
        this.writeBarEdit.requestFocus();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showVoiceRecordControl() {
        V.setVisibilityAnimated(this.writeAudioArea, 0);
        V.setVisibilityAnimated(this.writeTextArea, 4);
        V.setVisibilityAnimated(this.writeRecordTip, 4);
        V.setVisibilityAnimated(this.buttonRecord, 8);
        this.slideToCancel.setAlpha(1.0f);
        this.slideToCancel.setTranslationX(0.0f);
        this.durationArea.setTranslationX(0.0f);
        this.buttonCancel.setVisibility(8);
        this.durationArea.setVisibility(0);
        this.slideToCancel.setVisibility(0);
        this.writeRecordDot.setVisibility(0);
        this.voiceRecordControlPopup.show();
        this.writeBarEdit.setKeepFocus(true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showWaveformView(boolean animation) {
        checkSendButtonState(animation);
        this.writeBarEdit.setKeepFocus(true);
        this.writeRecordTip.setVisibility(8);
        if (animation) {
            V.setVisibilityAnimated(this.waveformArea, 0);
            V.setVisibilityAnimated(this.writeTextArea, 4);
            V.setVisibilityAnimated(this.writeAudioArea, 4);
            V.setVisibilityAnimated(this.buttonRecord, 8, true, AnimationUtils.DELAY_MID);
            V.setVisibilityAnimated(this.buttonSend, 0, true, AnimationUtils.DELAY_MID);
            this.voiceRecordControlPopup.hide();
            return;
        }
        V.setVisibilityAnimated(this.waveformArea, 0, false, 0);
        V.setVisibilityAnimated(this.writeTextArea, 4, false, 0);
        V.setVisibilityAnimated(this.writeAudioArea, 4, false, 0);
        changeViewVisibilityAndScale(this.buttonSend, 0);
        changeViewVisibilityAndScale(this.buttonRecord, 8);
        this.voiceRecordControlPopup.dismiss();
    }

    private void hideWaveformView(boolean animation) {
        if (this.waveformArea.getVisibility() == 0) {
            this.writeRecordTip.setVisibility(8);
            this.voiceRecordControlPopup.hide();
            this.writeBarEdit.setKeepFocus(false);
            checkSendButtonState(false);
            if (animation) {
                V.setVisibilityAnimated(this.writeTextArea, 0);
                V.setVisibilityAnimated(this.waveformArea, 4);
                V.setVisibilityAnimated(this.writeAudioArea, 4);
                return;
            }
            V.setVisibilityAnimated(this.writeTextArea, 0, false, 0);
            V.setVisibilityAnimated(this.waveformArea, 4, false, 0);
            V.setVisibilityAnimated(this.writeAudioArea, 4, false, 0);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showPlayPauseButton(boolean play) {
        V.setVisibilityAnimated(play ? this.buttonPlay : this.buttonPause, 0, true, AnimationUtils.DELAY_MID);
        V.setVisibilityAnimated(play ? this.buttonPause : this.buttonPlay, 8, true, AnimationUtils.DELAY_MID);
    }

    private void playAudioMessage() {
        PendingAudioMessageAttachment attachment = this.audioMessageUtils.getPendingRecord(this.peerId);
        if (attachment != null) {
            attachment.play(getContext());
        }
    }

    private void stopAudioMessage() {
        PendingAudioMessageAttachment attachment = this.audioMessageUtils.getPendingRecord(this.peerId);
        if (attachment != null) {
            attachment.stop(getContext());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setTimeProgress(int duration) {
        String text = String.format(Locale.US, "%d:%02d", Integer.valueOf(duration / 60), Integer.valueOf(duration % 60));
        this.waveformDuration.setText(text);
        this.writeDuration.setText(text);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cancelRecord() {
        if (this.audioMessageUtils.isRecording()) {
            this.audioMessageUtils.cancelRecording();
            setTimeProgress(0);
        } else {
            this.audioMessageUtils.deleteCurrentRecord();
            hideWaveformView(true);
            hideVoiceRecordControl();
            stopAudioMessage();
            PendingAudioMessageAttachment attachment = this.audioMessageUtils.getPendingRecord(this.peerId);
            if (attachment != null) {
                attachment.removeFile();
            }
            clearAttachments();
        }
        this.attEditor.clear();
    }

    private void restoreRecordViewIfNeeded() {
        PendingAudioMessageAttachment attachment = this.audioMessageUtils.getPendingRecord(this.peerId);
        if (attachment == null) {
            if (this.waveformArea.getVisibility() == 0) {
                clearAttachments();
            }
            hideWaveformView(false);
            return;
        }
        if (!this.attEditor.contains(attachment)) {
            this.attEditor.addHidden(attachment);
        }
        this.waveformView.setWaveform(attachment.getWaveform());
        setTimeProgress(attachment.getDuration());
        showWaveformView(false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class FadeRunnable implements Runnable {
        private final View toHide;
        private final View toShow;

        public FadeRunnable(View toShow, View toHide) {
            this.toShow = toShow;
            this.toHide = toHide;
        }

        @Override // java.lang.Runnable
        public void run() {
            V.setVisibilityAnimated(this.toShow, 0);
            V.setVisibilityAnimated(this.toHide, 4);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class OnRecordTouchListener implements View.OnTouchListener {
        private boolean isLongPress;
        private final int longClickDuration;
        private final Runnable recordRunnable;

        private OnRecordTouchListener() {
            this.recordRunnable = new RecordRunnable(this, null);
            this.longClickDuration = 200;
        }

        /* synthetic */ OnRecordTouchListener(WriteBar x0, AnonymousClass1 x1) {
            this();
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View view, MotionEvent motionEvent) {
            View recButton = WriteBar.this.voiceRecordControlPopup.getRecButtonView();
            if (recButton != null && WriteBar.this.voiceRecordControlPopup.isShowing()) {
                recButton.dispatchTouchEvent(motionEvent);
            }
            switch (motionEvent.getAction()) {
                case 0:
                    if (!WriteBar.this.isErrorViewShown) {
                        this.isLongPress = false;
                        WriteBar.this.removeCallbacks(WriteBar.this.fadeRunnable);
                        WriteBar.this.removeCallbacks(this.recordRunnable);
                        WriteBar.this.postDelayed(this.recordRunnable, 200L);
                        this.isLongPress = true;
                        break;
                    }
                    break;
                case 1:
                case 3:
                    if (this.isLongPress) {
                        this.isLongPress = false;
                        V.setVisibilityAnimated(WriteBar.this.writeRecordTip, 0);
                        V.setVisibilityAnimated(WriteBar.this.writeTextArea, 4);
                        WriteBar.this.postDelayed(WriteBar$OnRecordTouchListener$$Lambda$1.lambdaFactory$(this), 1200L);
                        WriteBar.this.postDelayed(WriteBar.this.fadeRunnable, 1200L);
                        break;
                    }
                    break;
            }
            return false;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onTouch$0() {
            WriteBar.this.writeBarEdit.requestFocus();
        }

        /* loaded from: classes3.dex */
        private class RecordRunnable implements Runnable {
            private RecordRunnable() {
            }

            /* synthetic */ RecordRunnable(OnRecordTouchListener x0, AnonymousClass1 x1) {
                this();
            }

            @Override // java.lang.Runnable
            public void run() {
                if (OnRecordTouchListener.this.isLongPress) {
                    OnRecordTouchListener.this.isLongPress = false;
                    WriteBar.this.showVoiceRecordControl();
                    WriteBar.this.audioMessageUtils.startRecording(WriteBar.this.audioRecordSessionId, false);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class VoiceRecordControlEventListener implements VoiceRecordControlPopupWindow.EventListener {
        private int distance;
        private final int minDistance;

        private VoiceRecordControlEventListener() {
            this.minDistance = Global.scale(70.0f);
            this.distance = Integer.MIN_VALUE;
        }

        /* synthetic */ VoiceRecordControlEventListener(WriteBar x0, AnonymousClass1 x1) {
            this();
        }

        @Override // com.vkontakte.android.ui.widget.VoiceRecordControlPopupWindow.EventListener
        public void onSendClick() {
            if (WriteBar.this.audioMessageUtils.isRecording()) {
                WriteBar.this.audioMessageUtils.stopAndSendRecord();
                return;
            }
            WriteBar.this.buttonSend.performClick();
            WriteBar.this.hideVoiceRecordControl();
        }

        @Override // com.vkontakte.android.ui.widget.VoiceRecordControlPopupWindow.EventListener
        public void onCancel() {
            WriteBar.this.cancelRecord();
        }

        @Override // com.vkontakte.android.ui.widget.VoiceRecordControlPopupWindow.EventListener
        public void onRelease() {
            V.setVisibilityAnimated(WriteBar.this.buttonCancel, 0);
            V.setVisibilityAnimated(WriteBar.this.slideToCancel, 4);
        }

        @Override // com.vkontakte.android.ui.widget.VoiceRecordControlPopupWindow.EventListener
        public void onMove(float translateX, int duration) {
            if (this.distance == Integer.MIN_VALUE) {
                int[] location = new int[2];
                WriteBar.this.slideToCancel.getLocationOnScreen(location);
                int slideRight = WriteBar.this.slideToCancel.getWidth() + location[0];
                WriteBar.this.durationArea.getLocationOnScreen(location);
                this.distance = location[0] - slideRight;
            }
            int slideFactor = this.distance < this.minDistance ? 1 : 3;
            WriteBar.this.durationArea.animate().translationX(translateX).setDuration(duration).start();
            WriteBar.this.slideToCancel.animate().translationX(translateX / slideFactor).setDuration(duration).start();
            WriteBar.this.slideToCancel.setAlpha(Math.max(0.0f, 255.0f - Math.min(255.0f, Math.abs(translateX / 1.5f))) / 255.0f);
        }

        public void resetDistance() {
            this.distance = Integer.MIN_VALUE;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class SeekDelegate implements WaveformView.SeekBarDelegate {
        private SeekDelegate() {
        }

        /* synthetic */ SeekDelegate(WriteBar x0, AnonymousClass1 x1) {
            this();
        }

        @Override // com.vkontakte.android.ui.widget.WaveformView.SeekBarDelegate
        public void onSeekBarDrag(float progress) {
            PendingAudioMessageAttachment attachment = WriteBar.this.audioMessageUtils.getPendingRecord(WriteBar.this.peerId);
            if (attachment != null) {
                if (attachment.isPlaying()) {
                    Context context = WriteBar.this.getContext();
                    Intent intentPlayer = new Intent(context, AudioMessagePlayerService.class);
                    intentPlayer.putExtra(NativeProtocol.WEB_DIALOG_ACTION, 7);
                    intentPlayer.putExtra("progress", progress);
                    context.startService(intentPlayer);
                    return;
                }
                attachment.setProgress(Float.valueOf(progress));
            }
        }
    }
}
