.class public Lcom/vkontakte/android/ui/WriteBar;
.super Landroid/widget/LinearLayout;
.source "WriteBar.java"

# interfaces
.implements Lcom/vkontakte/android/stickers/KeyboardPopup$OnVisibilityChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;,
        Lcom/vkontakte/android/ui/WriteBar$GraffitiSender;,
        Lcom/vkontakte/android/ui/WriteBar$SeekDelegate;,
        Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;,
        Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;,
        Lcom/vkontakte/android/ui/WriteBar$FadeRunnable;
    }
.end annotation


# static fields
.field private static final ATTACHMENTS_RESULT:I = 0x271a

.field private static final AUDIO_RESULT:I = 0x2713

.field private static final DOC_RESULT:I = 0x2714

.field private static final LOCATION_RESULT:I = 0x2715

.field private static final PHOTO_RESULT:I = 0x2711

.field private static final VIDEO_EXISTING_RESULT:I = 0x2716

.field private static final VIDEO_NEW_RESULT:I = 0x2717

.field private static final VIDEO_RESULT:I = 0x2712


# instance fields
.field private allowNew:Z

.field private attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

.field private attachDivider:Landroid/view/View;

.field private final audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

.field private final audioRecordSessionId:Ljava/lang/String;

.field private buttonCancel:Landroid/view/View;

.field private buttonPause:Landroid/view/View;

.field private buttonPlay:Landroid/view/View;

.field private buttonRecord:Landroid/view/View;

.field private buttonSend:Landroid/view/View;

.field private durationArea:Landroid/view/View;

.field private fadeRunnable:Ljava/lang/Runnable;

.field private fragment:Landroid/app/Fragment;

.field public giftAllowed:Z

.field public giftUser:Lcom/vkontakte/android/UserProfile;

.field public giftUsers:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private graffitiAllowed:Z

.field private graffitiPhoto:Ljava/lang/String;

.field private graffitiSender:Lcom/vkontakte/android/ui/WriteBar$GraffitiSender;

.field private graffitiTitle:Ljava/lang/String;

.field private isActive:Z

.field private isChat:Z

.field private isErrorViewShown:Z

.field private mAutoSuggestPopup:Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;

.field private mAutoSuggestPopupListener:Lcom/vkontakte/android/stickers/StickersView$Listener;

.field private mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mapAllowed:Z

.field private maxAtts:I

.field private mentionsManager:Lcom/vkontakte/android/ui/MentionsManager;

.field public moneyTransferAllowed:Z

.field private onSendClickListener:Landroid/view/View$OnClickListener;

.field private onUplDone:Ljava/lang/Runnable;

.field private onUplFail:Ljava/lang/Runnable;

.field public peerId:I

.field private replyBarVisibility:I

.field private slideToCancel:Landroid/view/View;

.field private voiceRecordControlPopup:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

.field private final voiceRecordEventListener:Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;

.field private waveformArea:Landroid/view/ViewGroup;

.field private waveformDuration:Landroid/widget/TextView;

.field private waveformView:Lcom/vkontakte/android/ui/widget/WaveformView;

.field private writeAudioArea:Landroid/view/ViewGroup;

.field private writeBarEdit:Lcom/vkontakte/android/ui/widget/RichEditText;

.field private writeBarEmoji:Landroid/widget/ImageView;

.field private writeBarEmojiNew:Landroid/widget/ImageView;

.field private writeDuration:Landroid/widget/TextView;

.field private writeRecordDot:Landroid/view/View;

.field private writeRecordTip:Landroid/view/View;

.field private writeTextArea:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 235
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 99
    const/16 v0, 0xa

    iput v0, p0, Lcom/vkontakte/android/ui/WriteBar;->maxAtts:I

    .line 101
    iput-boolean v2, p0, Lcom/vkontakte/android/ui/WriteBar;->mapAllowed:Z

    .line 102
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/WriteBar;->graffitiAllowed:Z

    .line 103
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/WriteBar;->giftAllowed:Z

    .line 104
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/WriteBar;->moneyTransferAllowed:Z

    .line 126
    iput-boolean v2, p0, Lcom/vkontakte/android/ui/WriteBar;->allowNew:Z

    .line 130
    new-instance v0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;-><init>(Lcom/vkontakte/android/ui/WriteBar;Lcom/vkontakte/android/ui/WriteBar$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->voiceRecordEventListener:Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;

    .line 131
    invoke-static {}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->getInstance()Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .line 132
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->audioRecordSessionId:Ljava/lang/String;

    .line 144
    const/16 v0, 0x8

    iput v0, p0, Lcom/vkontakte/android/ui/WriteBar;->replyBarVisibility:I

    .line 146
    new-instance v0, Lcom/vkontakte/android/ui/WriteBar$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/WriteBar$1;-><init>(Lcom/vkontakte/android/ui/WriteBar;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 236
    invoke-direct {p0}, Lcom/vkontakte/android/ui/WriteBar;->init()V

    .line 237
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 240
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 99
    const/16 v0, 0xa

    iput v0, p0, Lcom/vkontakte/android/ui/WriteBar;->maxAtts:I

    .line 101
    iput-boolean v2, p0, Lcom/vkontakte/android/ui/WriteBar;->mapAllowed:Z

    .line 102
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/WriteBar;->graffitiAllowed:Z

    .line 103
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/WriteBar;->giftAllowed:Z

    .line 104
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/WriteBar;->moneyTransferAllowed:Z

    .line 126
    iput-boolean v2, p0, Lcom/vkontakte/android/ui/WriteBar;->allowNew:Z

    .line 130
    new-instance v0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;-><init>(Lcom/vkontakte/android/ui/WriteBar;Lcom/vkontakte/android/ui/WriteBar$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->voiceRecordEventListener:Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;

    .line 131
    invoke-static {}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->getInstance()Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .line 132
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->audioRecordSessionId:Ljava/lang/String;

    .line 144
    const/16 v0, 0x8

    iput v0, p0, Lcom/vkontakte/android/ui/WriteBar;->replyBarVisibility:I

    .line 146
    new-instance v0, Lcom/vkontakte/android/ui/WriteBar$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/WriteBar$1;-><init>(Lcom/vkontakte/android/ui/WriteBar;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 241
    invoke-direct {p0}, Lcom/vkontakte/android/ui/WriteBar;->init()V

    .line 242
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 245
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 99
    const/16 v0, 0xa

    iput v0, p0, Lcom/vkontakte/android/ui/WriteBar;->maxAtts:I

    .line 101
    iput-boolean v2, p0, Lcom/vkontakte/android/ui/WriteBar;->mapAllowed:Z

    .line 102
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/WriteBar;->graffitiAllowed:Z

    .line 103
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/WriteBar;->giftAllowed:Z

    .line 104
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/WriteBar;->moneyTransferAllowed:Z

    .line 126
    iput-boolean v2, p0, Lcom/vkontakte/android/ui/WriteBar;->allowNew:Z

    .line 130
    new-instance v0, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;-><init>(Lcom/vkontakte/android/ui/WriteBar;Lcom/vkontakte/android/ui/WriteBar$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->voiceRecordEventListener:Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;

    .line 131
    invoke-static {}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->getInstance()Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .line 132
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->audioRecordSessionId:Ljava/lang/String;

    .line 144
    const/16 v0, 0x8

    iput v0, p0, Lcom/vkontakte/android/ui/WriteBar;->replyBarVisibility:I

    .line 146
    new-instance v0, Lcom/vkontakte/android/ui/WriteBar$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/WriteBar$1;-><init>(Lcom/vkontakte/android/ui/WriteBar;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 246
    invoke-direct {p0}, Lcom/vkontakte/android/ui/WriteBar;->init()V

    .line 247
    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ui/WriteBar;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEmojiNew:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/ui/WriteBar;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;
    .param p1, "x1"    # Z

    .prologue
    .line 85
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/WriteBar;->showWaveformView(Z)V

    return-void
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/ui/WriteBar;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;
    .param p1, "x1"    # I

    .prologue
    .line 85
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/WriteBar;->setTimeProgress(I)V

    return-void
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/ui/widget/WaveformView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->waveformView:Lcom/vkontakte/android/ui/widget/WaveformView;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeRecordDot:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonPause:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/ui/WriteBar;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;
    .param p1, "x1"    # Z

    .prologue
    .line 85
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/WriteBar;->showPlayPauseButton(Z)V

    return-void
.end method

.method static synthetic access$1800(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/stickers/KeyboardPopup;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonRecord:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/ui/WriteBar;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/WriteBar;->allowNew:Z

    return v0
.end method

.method static synthetic access$2000(Lcom/vkontakte/android/ui/WriteBar;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget v0, p0, Lcom/vkontakte/android/ui/WriteBar;->maxAtts:I

    return v0
.end method

.method static synthetic access$2100(Lcom/vkontakte/android/ui/WriteBar;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/WriteBar;->graffitiAllowed:Z

    return v0
.end method

.method static synthetic access$2200(Lcom/vkontakte/android/ui/WriteBar;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/WriteBar;->mapAllowed:Z

    return v0
.end method

.method static synthetic access$2300(Lcom/vkontakte/android/ui/WriteBar;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/WriteBar;->isChat:Z

    return v0
.end method

.method static synthetic access$2400(Lcom/vkontakte/android/ui/WriteBar;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->graffitiPhoto:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2500(Lcom/vkontakte/android/ui/WriteBar;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->graffitiTitle:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2600(Lcom/vkontakte/android/ui/WriteBar;)Landroid/app/Fragment;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->fragment:Landroid/app/Fragment;

    return-object v0
.end method

.method static synthetic access$2700(Lcom/vkontakte/android/ui/WriteBar;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;
    .param p1, "x1"    # Z

    .prologue
    .line 85
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/WriteBar;->setAttEditorVisible(Z)V

    return-void
.end method

.method static synthetic access$2800(Lcom/vkontakte/android/ui/WriteBar;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;
    .param p1, "x1"    # Z

    .prologue
    .line 85
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/WriteBar;->checkSendButtonState(Z)V

    return-void
.end method

.method static synthetic access$2900(Lcom/vkontakte/android/ui/WriteBar;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->onUplDone:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$2902(Lcom/vkontakte/android/ui/WriteBar;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;
    .param p1, "x1"    # Ljava/lang/Runnable;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar;->onUplDone:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$300(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/ui/AttachmentsEditorView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    return-object v0
.end method

.method static synthetic access$3000(Lcom/vkontakte/android/ui/WriteBar;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->onUplFail:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$3002(Lcom/vkontakte/android/ui/WriteBar;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;
    .param p1, "x1"    # Ljava/lang/Runnable;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar;->onUplFail:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$3100(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->waveformArea:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic access$3200(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/ui/widget/RichEditText;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEdit:Lcom/vkontakte/android/ui/widget/RichEditText;

    return-object v0
.end method

.method static synthetic access$3300(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/stickers/StickersView$Listener;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->mAutoSuggestPopupListener:Lcom/vkontakte/android/stickers/StickersView$Listener;

    return-object v0
.end method

.method static synthetic access$3400(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->mAutoSuggestPopup:Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;

    return-object v0
.end method

.method static synthetic access$3500(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->voiceRecordEventListener:Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;

    return-object v0
.end method

.method static synthetic access$3600(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeRecordTip:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$3800(Lcom/vkontakte/android/ui/WriteBar;Ljava/lang/String;ILandroid/net/Uri;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # I
    .param p3, "x3"    # Landroid/net/Uri;

    .prologue
    .line 85
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/ui/WriteBar;->addVideoFileInternal(Ljava/lang/String;ILandroid/net/Uri;)V

    return-void
.end method

.method static synthetic access$400(Lcom/vkontakte/android/ui/WriteBar;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->audioRecordSessionId:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$4000(Lcom/vkontakte/android/ui/WriteBar;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/WriteBar;->isErrorViewShown:Z

    return v0
.end method

.method static synthetic access$4100(Lcom/vkontakte/android/ui/WriteBar;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->fadeRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$4200(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeTextArea:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic access$4400(Lcom/vkontakte/android/ui/WriteBar;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    invoke-direct {p0}, Lcom/vkontakte/android/ui/WriteBar;->showVoiceRecordControl()V

    return-void
.end method

.method static synthetic access$4500(Lcom/vkontakte/android/ui/WriteBar;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    invoke-direct {p0}, Lcom/vkontakte/android/ui/WriteBar;->cancelRecord()V

    return-void
.end method

.method static synthetic access$4600(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonCancel:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$4700(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->slideToCancel:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$4800(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->durationArea:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/ui/WriteBar;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    invoke-direct {p0}, Lcom/vkontakte/android/ui/WriteBar;->hideVoiceRecordControl()V

    return-void
.end method

.method static synthetic access$600(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/media/audio/AudioMessageUtils;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/ui/WriteBar;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/WriteBar;->isActive:Z

    return v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->voiceRecordControlPopup:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    return-object v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonSend:Landroid/view/View;

    return-object v0
.end method

.method private addVideoFile(Landroid/net/Uri;)V
    .locals 9
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 774
    invoke-static {p1}, Lcom/vk/media/utils/MediaUtils;->getVideoDurationMs(Landroid/net/Uri;)I

    move-result v0

    div-int/lit16 v6, v0, 0x3e8

    .line 775
    .local v6, "duration":I
    invoke-virtual {p1}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    move-result-object v8

    .line 776
    .local v8, "urlExternal":Ljava/lang/String;
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-ge v0, v1, :cond_0

    .line 777
    invoke-direct {p0, v8, v6, p1}, Lcom/vkontakte/android/ui/WriteBar;->addVideoFileInternal(Ljava/lang/String;ILandroid/net/Uri;)V

    .line 809
    :goto_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/WriteBar;->checkSendButtonState(Z)V

    .line 810
    return-void

    .line 778
    :cond_0
    const-string/jumbo v0, "unknown"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 779
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 780
    .local v7, "uris":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    invoke-virtual {v7, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 781
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/WriteBar;->getContext()Landroid/content/Context;

    move-result-object v3

    .line 782
    .local v3, "ctx":Landroid/content/Context;
    new-instance v2, Landroid/app/ProgressDialog;

    invoke-direct {v2, v3}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 783
    .local v2, "progress":Landroid/app/ProgressDialog;
    move v4, v6

    .line 784
    .local v4, "durationFinal":I
    new-instance v0, Lcom/vkontakte/android/ui/WriteBar$9;

    move-object v1, p0

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/ui/WriteBar$9;-><init>(Lcom/vkontakte/android/ui/WriteBar;Landroid/app/ProgressDialog;Landroid/content/Context;ILandroid/net/Uri;)V

    .line 804
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/WriteBar;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 784
    invoke-static {v7, v0, v1}, Lcom/vkontakte/android/upload/UploadUtils;->doCopyFromRestrictedProviderAsync(Ljava/util/ArrayList;Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;Landroid/content/Context;)V

    goto :goto_0

    .line 806
    .end local v2    # "progress":Landroid/app/ProgressDialog;
    .end local v3    # "ctx":Landroid/content/Context;
    .end local v4    # "durationFinal":I
    .end local v7    # "uris":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    :cond_1
    invoke-direct {p0, v8, v6, p1}, Lcom/vkontakte/android/ui/WriteBar;->addVideoFileInternal(Ljava/lang/String;ILandroid/net/Uri;)V

    goto :goto_0
.end method

.method private addVideoFileInternal(Ljava/lang/String;ILandroid/net/Uri;)V
    .locals 3
    .param p1, "urlExternal"    # Ljava/lang/String;
    .param p2, "duration"    # I
    .param p3, "uri"    # Landroid/net/Uri;

    .prologue
    .line 813
    new-instance v0, Lcom/vkontakte/android/api/VideoFile;

    invoke-direct {v0}, Lcom/vkontakte/android/api/VideoFile;-><init>()V

    .line 814
    .local v0, "vf":Lcom/vkontakte/android/api/VideoFile;
    iput-object p1, v0, Lcom/vkontakte/android/api/VideoFile;->urlExternal:Ljava/lang/String;

    .line 815
    iput p2, v0, Lcom/vkontakte/android/api/VideoFile;->duration:I

    .line 816
    const-string/jumbo v1, "file"

    invoke-virtual {p3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p3}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v1

    :goto_0
    iput-object v1, v0, Lcom/vkontakte/android/api/VideoFile;->title:Ljava/lang/String;

    .line 817
    invoke-static {}, Lcom/vkontakte/android/upload/Upload;->getNewID()I

    move-result v1

    iput v1, v0, Lcom/vkontakte/android/api/VideoFile;->vid:I

    .line 818
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "file://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p3}, Lcom/vkontakte/android/ui/WriteBar;->getRealPathFromURI(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/api/VideoFile;->urlBigThumb:Ljava/lang/String;

    .line 819
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    new-instance v2, Lcom/vkontakte/android/attachments/PendingVideoAttachment;

    invoke-direct {v2, v0}, Lcom/vkontakte/android/attachments/PendingVideoAttachment;-><init>(Lcom/vkontakte/android/api/VideoFile;)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->add(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 820
    return-void

    .line 816
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "file://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p3}, Lcom/vkontakte/android/ui/WriteBar;->getRealPathFromURI(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private cancelRecord()V
    .locals 3

    .prologue
    .line 1075
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-virtual {v1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->isRecording()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1076
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-virtual {v1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->cancelRecording()V

    .line 1077
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/vkontakte/android/ui/WriteBar;->setTimeProgress(I)V

    .line 1089
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->clear()V

    .line 1090
    return-void

    .line 1079
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-virtual {v1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->deleteCurrentRecord()V

    .line 1080
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/ui/WriteBar;->hideWaveformView(Z)V

    .line 1081
    invoke-direct {p0}, Lcom/vkontakte/android/ui/WriteBar;->hideVoiceRecordControl()V

    .line 1082
    invoke-direct {p0}, Lcom/vkontakte/android/ui/WriteBar;->stopAudioMessage()V

    .line 1083
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    iget v2, p0, Lcom/vkontakte/android/ui/WriteBar;->peerId:I

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->getPendingRecord(I)Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;

    move-result-object v0

    .line 1084
    .local v0, "attachment":Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;
    if-eqz v0, :cond_1

    .line 1085
    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->removeFile()Z

    .line 1087
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/WriteBar;->clearAttachments()V

    goto :goto_0
.end method

.method private changeViewVisibilityAndScale(Landroid/view/View;I)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "visibility"    # I

    .prologue
    const v1, 0x3dcccccd    # 0.1f

    const/high16 v0, 0x3f800000    # 1.0f

    .line 892
    if-nez p2, :cond_0

    .line 893
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 894
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleX(F)V

    .line 895
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleY(F)V

    .line 896
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 897
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 904
    :goto_0
    return-void

    .line 899
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 900
    invoke-virtual {p1, v1}, Landroid/view/View;->setScaleX(F)V

    .line 901
    invoke-virtual {p1, v1}, Landroid/view/View;->setScaleY(F)V

    .line 902
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method private checkSendButtonState(Z)V
    .locals 10
    .param p1, "animated"    # Z

    .prologue
    const/16 v9, 0x96

    const/16 v8, 0x8

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 865
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/WriteBar;->getText()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/WriteBar;->getAttachments()Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_1

    move v0, v4

    .line 866
    .local v0, "empty":Z
    :goto_0
    iget-object v6, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-virtual {v6}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->isHasRecord()Z

    move-result v6

    if-eqz v6, :cond_2

    iget-object v6, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-virtual {v6}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->isRaisedRecording()Z

    move-result v6

    if-eqz v6, :cond_2

    move v1, v4

    .line 867
    .local v1, "hasRaisedRecord":Z
    :goto_1
    iget-object v7, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    iget-boolean v6, p0, Lcom/vkontakte/android/ui/WriteBar;->isChat:Z

    if-eqz v6, :cond_3

    if-eqz v0, :cond_3

    move v6, v4

    :goto_2
    invoke-virtual {v7, v6}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->setAllowStartRecord(Z)V

    .line 868
    iget-object v7, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    if-nez v0, :cond_4

    move v6, v4

    :goto_3
    invoke-virtual {v7, v6}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->setInputFieldHasText(Z)V

    .line 869
    iget-boolean v6, p0, Lcom/vkontakte/android/ui/WriteBar;->isChat:Z

    if-eqz v6, :cond_5

    if-eqz v0, :cond_5

    iget-object v6, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonSend:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v6

    if-nez v6, :cond_5

    .line 870
    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonSend:Landroid/view/View;

    .line 871
    .local v2, "toHide":Landroid/view/View;
    iget-object v3, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonRecord:Landroid/view/View;

    .line 880
    .local v3, "toShow":Landroid/view/View;
    :goto_4
    if-eqz v2, :cond_0

    if-eqz v3, :cond_0

    .line 881
    if-eqz p1, :cond_9

    .line 882
    invoke-static {v3, v5, v4, v9}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;IZI)V

    .line 883
    invoke-static {v2, v8, v4, v9}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;IZI)V

    .line 889
    :cond_0
    :goto_5
    return-void

    .end local v0    # "empty":Z
    .end local v1    # "hasRaisedRecord":Z
    .end local v2    # "toHide":Landroid/view/View;
    .end local v3    # "toShow":Landroid/view/View;
    :cond_1
    move v0, v5

    .line 865
    goto :goto_0

    .restart local v0    # "empty":Z
    :cond_2
    move v1, v5

    .line 866
    goto :goto_1

    .restart local v1    # "hasRaisedRecord":Z
    :cond_3
    move v6, v5

    .line 867
    goto :goto_2

    :cond_4
    move v6, v5

    .line 868
    goto :goto_3

    .line 872
    :cond_5
    iget-boolean v6, p0, Lcom/vkontakte/android/ui/WriteBar;->isChat:Z

    if-eqz v6, :cond_8

    if-nez v0, :cond_6

    iget-object v6, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonRecord:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v6

    if-eqz v6, :cond_7

    :cond_6
    if-eqz v1, :cond_8

    .line 873
    :cond_7
    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonRecord:Landroid/view/View;

    .line 874
    .restart local v2    # "toHide":Landroid/view/View;
    iget-object v3, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonSend:Landroid/view/View;

    .restart local v3    # "toShow":Landroid/view/View;
    goto :goto_4

    .line 876
    .end local v2    # "toHide":Landroid/view/View;
    .end local v3    # "toShow":Landroid/view/View;
    :cond_8
    const/4 v2, 0x0

    .line 877
    .restart local v2    # "toHide":Landroid/view/View;
    const/4 v3, 0x0

    .restart local v3    # "toShow":Landroid/view/View;
    goto :goto_4

    .line 885
    :cond_9
    invoke-direct {p0, v2, v8}, Lcom/vkontakte/android/ui/WriteBar;->changeViewVisibilityAndScale(Landroid/view/View;I)V

    .line 886
    invoke-direct {p0, v3, v5}, Lcom/vkontakte/android/ui/WriteBar;->changeViewVisibilityAndScale(Landroid/view/View;I)V

    goto :goto_5
.end method

.method public static getRealPathFromURI(Landroid/net/Uri;)Ljava/lang/String;
    .locals 9
    .param p0, "contentUri"    # Landroid/net/Uri;

    .prologue
    const/4 v3, 0x0

    .line 823
    const-string/jumbo v0, "file"

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 824
    invoke-virtual {p0}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    move-result-object v8

    .line 832
    :goto_0
    return-object v8

    .line 826
    :cond_0
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string/jumbo v1, "_data"

    aput-object v1, v2, v0

    .line 827
    .local v2, "proj":[Ljava/lang/String;
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    move-object v1, p0

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 828
    .local v7, "cursor":Landroid/database/Cursor;
    const-string/jumbo v0, "_data"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    .line 829
    .local v6, "column_index":I
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 830
    invoke-interface {v7, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 831
    .local v8, "path":Ljava/lang/String;
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_0
.end method

.method private hideVoiceRecordControl()V
    .locals 5

    .prologue
    const/4 v2, 0x4

    const/4 v4, 0x0

    .line 981
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeRecordTip:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 982
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonRecord:Landroid/view/View;

    invoke-static {v0, v4}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 983
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeTextArea:Landroid/view/ViewGroup;

    invoke-static {v0, v4}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 984
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->waveformArea:Landroid/view/ViewGroup;

    invoke-static {v0, v2}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 985
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeAudioArea:Landroid/view/ViewGroup;

    invoke-static {v0, v2}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 986
    invoke-static {p0}, Lcom/vkontakte/android/ui/WriteBar$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/ui/WriteBar;)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v2, 0x12c

    invoke-virtual {p0, v0, v2, v3}, Lcom/vkontakte/android/ui/WriteBar;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 990
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->voiceRecordControlPopup:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->hide()V

    .line 991
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEdit:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/ui/widget/RichEditText;->setKeepFocus(Z)V

    .line 992
    return-void
.end method

.method private hideWaveformView(Z)V
    .locals 4
    .param p1, "animation"    # Z

    .prologue
    const/4 v3, 0x4

    const/4 v2, 0x0

    .line 1032
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->waveformArea:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 1033
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeRecordTip:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1034
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->voiceRecordControlPopup:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->hide()V

    .line 1035
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEdit:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/ui/widget/RichEditText;->setKeepFocus(Z)V

    .line 1036
    invoke-direct {p0, v2}, Lcom/vkontakte/android/ui/WriteBar;->checkSendButtonState(Z)V

    .line 1037
    if-eqz p1, :cond_1

    .line 1038
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeTextArea:Landroid/view/ViewGroup;

    invoke-static {v0, v2}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1039
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->waveformArea:Landroid/view/ViewGroup;

    invoke-static {v0, v3}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1040
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeAudioArea:Landroid/view/ViewGroup;

    invoke-static {v0, v3}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1047
    :cond_0
    :goto_0
    return-void

    .line 1042
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeTextArea:Landroid/view/ViewGroup;

    invoke-static {v0, v2, v2, v2}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;IZI)V

    .line 1043
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->waveformArea:Landroid/view/ViewGroup;

    invoke-static {v0, v3, v2, v2}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;IZI)V

    .line 1044
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeAudioArea:Landroid/view/ViewGroup;

    invoke-static {v0, v3, v2, v2}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;IZI)V

    goto :goto_0
.end method

.method private init()V
    .locals 12

    .prologue
    const/4 v11, 0x0

    const/high16 v10, 0x41800000    # 16.0f

    const/4 v9, -0x1

    const/4 v8, 0x0

    .line 310
    invoke-virtual {p0, v9}, Lcom/vkontakte/android/ui/WriteBar;->setBackgroundColor(I)V

    .line 311
    const/4 v5, 0x1

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->setOrientation(I)V

    .line 312
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/WriteBar;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 314
    .local v0, "context":Landroid/content/Context;
    const v5, 0x7f03023d

    invoke-static {v0, v5, v11}, Lcom/vkontakte/android/ui/WriteBar;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->addView(Landroid/view/View;)V

    .line 315
    const v5, 0x7f1005cc

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonSend:Landroid/view/View;

    .line 316
    const v5, 0x7f1005cd

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonRecord:Landroid/view/View;

    .line 317
    const v5, 0x7f1005ce

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonCancel:Landroid/view/View;

    .line 318
    const v5, 0x7f1005d0

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->durationArea:Landroid/view/View;

    .line 319
    const v5, 0x7f1005c5

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->writeRecordTip:Landroid/view/View;

    .line 320
    const v5, 0x7f1005d1

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->writeRecordDot:Landroid/view/View;

    .line 321
    const v5, 0x7f1005cf

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->slideToCancel:Landroid/view/View;

    .line 322
    const v5, 0x7f1005d2

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->writeDuration:Landroid/widget/TextView;

    .line 323
    const v5, 0x7f1005c6

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->writeTextArea:Landroid/view/ViewGroup;

    .line 324
    const v5, 0x7f1005c4

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->writeAudioArea:Landroid/view/ViewGroup;

    .line 325
    const v5, 0x7f1005c3

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->waveformArea:Landroid/view/ViewGroup;

    .line 326
    const v5, 0x7f1005d6

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/ui/widget/WaveformView;

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->waveformView:Lcom/vkontakte/android/ui/widget/WaveformView;

    .line 327
    const v5, 0x7f1005d7

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->waveformDuration:Landroid/widget/TextView;

    .line 328
    const v5, 0x7f1005d4

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonPlay:Landroid/view/View;

    .line 329
    const v5, 0x7f1005d5

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonPause:Landroid/view/View;

    .line 330
    new-instance v5, Lcom/vkontakte/android/ui/WriteBar$FadeRunnable;

    iget-object v6, p0, Lcom/vkontakte/android/ui/WriteBar;->writeTextArea:Landroid/view/ViewGroup;

    iget-object v7, p0, Lcom/vkontakte/android/ui/WriteBar;->writeRecordTip:Landroid/view/View;

    invoke-direct {v5, p0, v6, v7}, Lcom/vkontakte/android/ui/WriteBar$FadeRunnable;-><init>(Lcom/vkontakte/android/ui/WriteBar;Landroid/view/View;Landroid/view/View;)V

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->fadeRunnable:Ljava/lang/Runnable;

    .line 331
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->writeAudioArea:Landroid/view/ViewGroup;

    const/4 v6, 0x4

    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 332
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonRecord:Landroid/view/View;

    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 333
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->waveformView:Lcom/vkontakte/android/ui/widget/WaveformView;

    new-instance v6, Lcom/vkontakte/android/ui/WriteBar$SeekDelegate;

    invoke-direct {v6, p0, v11}, Lcom/vkontakte/android/ui/WriteBar$SeekDelegate;-><init>(Lcom/vkontakte/android/ui/WriteBar;Lcom/vkontakte/android/ui/WriteBar$1;)V

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/ui/widget/WaveformView;->setSeekBarDelegate(Lcom/vkontakte/android/ui/widget/WaveformView$SeekBarDelegate;)V

    .line 334
    const v5, 0x7f1005c9

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 335
    .local v4, "writeBarAttach":Landroid/view/View;
    const v5, 0x7f1005c7

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/ui/widget/RichEditText;

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEdit:Lcom/vkontakte/android/ui/widget/RichEditText;

    .line 336
    const v5, 0x7f1005c8

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEmoji:Landroid/widget/ImageView;

    .line 337
    const v5, 0x7f1005ca

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEmojiNew:Landroid/widget/ImageView;

    .line 338
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonCancel:Landroid/view/View;

    invoke-static {p0}, Lcom/vkontakte/android/ui/WriteBar$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View$OnClickListener;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 339
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEmoji:Landroid/widget/ImageView;

    new-instance v6, Lcom/vkontakte/android/ui/WriteBar$2;

    invoke-direct {v6, p0}, Lcom/vkontakte/android/ui/WriteBar$2;-><init>(Lcom/vkontakte/android/ui/WriteBar;)V

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 348
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonPlay:Landroid/view/View;

    invoke-static {p0}, Lcom/vkontakte/android/ui/WriteBar$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View$OnClickListener;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 349
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonPause:Landroid/view/View;

    invoke-static {p0}, Lcom/vkontakte/android/ui/WriteBar$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View$OnClickListener;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 350
    const v5, 0x7f1005d3

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-static {p0}, Lcom/vkontakte/android/ui/WriteBar$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View$OnClickListener;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 354
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonSend:Landroid/view/View;

    invoke-static {p0}, Lcom/vkontakte/android/ui/WriteBar$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View$OnClickListener;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 362
    new-instance v5, Lcom/vkontakte/android/ui/WriteBar$3;

    invoke-direct {v5, p0, v0}, Lcom/vkontakte/android/ui/WriteBar$3;-><init>(Lcom/vkontakte/android/ui/WriteBar;Landroid/content/Context;)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 413
    new-instance v5, Landroid/view/View;

    invoke-direct {v5, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->attachDivider:Landroid/view/View;

    .line 414
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->attachDivider:Landroid/view/View;

    const v6, -0x212122

    invoke-virtual {v5, v6}, Landroid/view/View;->setBackgroundColor(I)V

    .line 415
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v5

    invoke-direct {v2, v9, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 416
    .local v2, "lp":Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v5, 0x41400000    # 12.0f

    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v5

    iput v5, v2, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iput v5, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 417
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->attachDivider:Landroid/view/View;

    invoke-virtual {p0, v5, v8, v2}, Lcom/vkontakte/android/ui/WriteBar;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 418
    new-instance v5, Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-direct {v5, v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    .line 419
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v10}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    invoke-static {v10}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v7

    invoke-virtual {v5, v6, v8, v7, v8}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->setPadding(IIII)V

    .line 420
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x42b60000    # 91.0f

    invoke-static {v7}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v7

    invoke-direct {v6, v9, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v5, v8, v6}, Lcom/vkontakte/android/ui/WriteBar;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 421
    invoke-direct {p0, v8}, Lcom/vkontakte/android/ui/WriteBar;->setAttEditorVisible(Z)V

    .line 422
    invoke-direct {p0, v8}, Lcom/vkontakte/android/ui/WriteBar;->checkSendButtonState(Z)V

    .line 423
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    new-instance v6, Lcom/vkontakte/android/ui/WriteBar$4;

    invoke-direct {v6, p0}, Lcom/vkontakte/android/ui/WriteBar$4;-><init>(Lcom/vkontakte/android/ui/WriteBar;)V

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->setCallback(Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;)V

    .line 458
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0xe

    if-lt v5, v6, :cond_0

    .line 459
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/WriteBar;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v5

    new-instance v6, Lcom/vkontakte/android/ui/WriteBar$5;

    invoke-direct {v6, p0}, Lcom/vkontakte/android/ui/WriteBar$5;-><init>(Lcom/vkontakte/android/ui/WriteBar;)V

    invoke-virtual {v5, v6}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 468
    invoke-static {p0}, Lcom/vkontakte/android/ViewUtils;->setNoClipRecursive(Landroid/view/View;)V

    .line 470
    :cond_0
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEdit:Lcom/vkontakte/android/ui/widget/RichEditText;

    new-instance v6, Lcom/vkontakte/android/ui/WriteBar$6;

    invoke-direct {v6, p0}, Lcom/vkontakte/android/ui/WriteBar$6;-><init>(Lcom/vkontakte/android/ui/WriteBar;)V

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/ui/widget/RichEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 491
    new-instance v5, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    const v6, 0x7f1005cb

    invoke-virtual {p0, v6}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v6

    iget-object v7, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonCancel:Landroid/view/View;

    iget-object v8, p0, Lcom/vkontakte/android/ui/WriteBar;->voiceRecordEventListener:Lcom/vkontakte/android/ui/WriteBar$VoiceRecordControlEventListener;

    invoke-direct {v5, v0, v6, v7, v8}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;-><init>(Landroid/content/Context;Landroid/view/View;Landroid/view/View;Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow$EventListener;)V

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->voiceRecordControlPopup:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    .line 493
    new-instance v5, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;

    iget-object v6, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEdit:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-direct {v5, v0, v6, v4}, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;-><init>(Landroid/content/Context;Landroid/widget/EditText;Landroid/view/View;)V

    iput-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->mAutoSuggestPopup:Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;

    .line 494
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar;->mAutoSuggestPopup:Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;

    new-instance v6, Lcom/vkontakte/android/ui/WriteBar$7;

    invoke-direct {v6, p0}, Lcom/vkontakte/android/ui/WriteBar$7;-><init>(Lcom/vkontakte/android/ui/WriteBar;)V

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->setListener(Lcom/vkontakte/android/stickers/StickersView$Listener;)V

    .line 516
    const/4 v5, 0x2

    new-array v1, v5, [I

    .line 517
    .local v1, "location":[I
    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3}, Landroid/graphics/Point;-><init>()V

    .line 518
    .local v3, "size":Landroid/graphics/Point;
    new-instance v5, Lcom/vkontakte/android/ui/WriteBar$8;

    invoke-direct {v5, p0, v0, v3, v1}, Lcom/vkontakte/android/ui/WriteBar$8;-><init>(Lcom/vkontakte/android/ui/WriteBar;Landroid/content/Context;Landroid/graphics/Point;[I)V

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/WriteBar;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 572
    return-void
.end method

.method private playAudioMessage()V
    .locals 3

    .prologue
    .line 1055
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    iget v2, p0, Lcom/vkontakte/android/ui/WriteBar;->peerId:I

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->getPendingRecord(I)Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;

    move-result-object v0

    .line 1056
    .local v0, "attachment":Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;
    if-eqz v0, :cond_0

    .line 1057
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/WriteBar;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->play(Landroid/content/Context;)V

    .line 1059
    :cond_0
    return-void
.end method

.method private restoreRecordViewIfNeeded()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1093
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    iget v2, p0, Lcom/vkontakte/android/ui/WriteBar;->peerId:I

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->getPendingRecord(I)Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;

    move-result-object v0

    .line 1094
    .local v0, "attachment":Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;
    if-nez v0, :cond_1

    .line 1095
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->waveformArea:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v1

    if-nez v1, :cond_0

    .line 1096
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/WriteBar;->clearAttachments()V

    .line 1098
    :cond_0
    invoke-direct {p0, v3}, Lcom/vkontakte/android/ui/WriteBar;->hideWaveformView(Z)V

    .line 1107
    :goto_0
    return-void

    .line 1100
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->contains(Lcom/vkontakte/android/attachments/Attachment;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 1101
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->addHidden(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 1103
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->waveformView:Lcom/vkontakte/android/ui/widget/WaveformView;

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->getWaveform()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/widget/WaveformView;->setWaveform([B)V

    .line 1104
    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->getDuration()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/ui/WriteBar;->setTimeProgress(I)V

    .line 1105
    invoke-direct {p0, v3}, Lcom/vkontakte/android/ui/WriteBar;->showWaveformView(Z)V

    goto :goto_0
.end method

.method private setAttEditorVisible(Z)V
    .locals 2
    .param p1, "visible"    # Z

    .prologue
    .line 648
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->setVisibility(I)V

    .line 649
    invoke-direct {p0}, Lcom/vkontakte/android/ui/WriteBar;->updateAttachDividerVisibility()V

    .line 650
    return-void

    .line 648
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method private setTimeProgress(I)V
    .locals 6
    .param p1, "duration"    # I

    .prologue
    .line 1069
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v2, "%d:%02d"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    div-int/lit8 v5, p1, 0x3c

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    rem-int/lit8 v5, p1, 0x3c

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1070
    .local v0, "text":Ljava/lang/String;
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->waveformDuration:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1071
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->writeDuration:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1072
    return-void
.end method

.method private showPlayPauseButton(Z)V
    .locals 4
    .param p1, "play"    # Z

    .prologue
    const/16 v3, 0x96

    const/4 v2, 0x1

    .line 1050
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonPlay:Landroid/view/View;

    :goto_0
    const/4 v1, 0x0

    invoke-static {v0, v1, v2, v3}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;IZI)V

    .line 1051
    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonPause:Landroid/view/View;

    :goto_1
    const/16 v1, 0x8

    invoke-static {v0, v1, v2, v3}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;IZI)V

    .line 1052
    return-void

    .line 1050
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonPause:Landroid/view/View;

    goto :goto_0

    .line 1051
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonPlay:Landroid/view/View;

    goto :goto_1
.end method

.method private showVoiceRecordControl()V
    .locals 5

    .prologue
    const/16 v4, 0x8

    const/4 v1, 0x4

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 995
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeAudioArea:Landroid/view/ViewGroup;

    invoke-static {v0, v2}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 996
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeTextArea:Landroid/view/ViewGroup;

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 997
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeRecordTip:Landroid/view/View;

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 998
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonRecord:Landroid/view/View;

    invoke-static {v0, v4}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 999
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->slideToCancel:Landroid/view/View;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 1000
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->slideToCancel:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 1001
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->durationArea:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 1002
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonCancel:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 1003
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->durationArea:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1004
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->slideToCancel:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1005
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeRecordDot:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1006
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->voiceRecordControlPopup:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->show()V

    .line 1007
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEdit:Lcom/vkontakte/android/ui/widget/RichEditText;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/RichEditText;->setKeepFocus(Z)V

    .line 1008
    return-void
.end method

.method private showWaveformView(Z)V
    .locals 6
    .param p1, "animation"    # Z

    .prologue
    const/16 v5, 0x96

    const/16 v4, 0x8

    const/4 v3, 0x1

    const/4 v2, 0x4

    const/4 v1, 0x0

    .line 1011
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/WriteBar;->checkSendButtonState(Z)V

    .line 1012
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEdit:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/ui/widget/RichEditText;->setKeepFocus(Z)V

    .line 1013
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeRecordTip:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 1014
    if-eqz p1, :cond_0

    .line 1015
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->waveformArea:Landroid/view/ViewGroup;

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1016
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeTextArea:Landroid/view/ViewGroup;

    invoke-static {v0, v2}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1017
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeAudioArea:Landroid/view/ViewGroup;

    invoke-static {v0, v2}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1018
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonRecord:Landroid/view/View;

    invoke-static {v0, v4, v3, v5}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;IZI)V

    .line 1019
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonSend:Landroid/view/View;

    invoke-static {v0, v1, v3, v5}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;IZI)V

    .line 1020
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->voiceRecordControlPopup:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->hide()V

    .line 1029
    :goto_0
    return-void

    .line 1022
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->waveformArea:Landroid/view/ViewGroup;

    invoke-static {v0, v1, v1, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;IZI)V

    .line 1023
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeTextArea:Landroid/view/ViewGroup;

    invoke-static {v0, v2, v1, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;IZI)V

    .line 1024
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeAudioArea:Landroid/view/ViewGroup;

    invoke-static {v0, v2, v1, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;IZI)V

    .line 1025
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonSend:Landroid/view/View;

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->changeViewVisibilityAndScale(Landroid/view/View;I)V

    .line 1026
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonRecord:Landroid/view/View;

    invoke-direct {p0, v0, v4}, Lcom/vkontakte/android/ui/WriteBar;->changeViewVisibilityAndScale(Landroid/view/View;I)V

    .line 1027
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->voiceRecordControlPopup:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->dismiss()V

    goto :goto_0
.end method

.method private stopAudioMessage()V
    .locals 3

    .prologue
    .line 1062
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    iget v2, p0, Lcom/vkontakte/android/ui/WriteBar;->peerId:I

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->getPendingRecord(I)Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;

    move-result-object v0

    .line 1063
    .local v0, "attachment":Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;
    if-eqz v0, :cond_0

    .line 1064
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/WriteBar;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->stop(Landroid/content/Context;)V

    .line 1066
    :cond_0
    return-void
.end method

.method private stopVoiceRecord()V
    .locals 2

    .prologue
    .line 973
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->isRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 974
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->stopRecording()V

    .line 975
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeRecordDot:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 976
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->clear()V

    .line 978
    :cond_0
    return-void
.end method

.method private updateAttachDividerVisibility()V
    .locals 2

    .prologue
    .line 653
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/ui/WriteBar;->replyBarVisibility:I

    if-eqz v0, :cond_0

    .line 654
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->attachDivider:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 659
    :goto_0
    return-void

    .line 657
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->attachDivider:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method


# virtual methods
.method public addAttachment(Lcom/vkontakte/android/attachments/Attachment;)V
    .locals 3
    .param p1, "att"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    const/4 v2, 0x1

    .line 632
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->add(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 633
    instance-of v0, p1, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;

    if-eqz v0, :cond_0

    .line 634
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    iget v1, p0, Lcom/vkontakte/android/ui/WriteBar;->peerId:I

    check-cast p1, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;

    .end local p1    # "att":Lcom/vkontakte/android/attachments/Attachment;
    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->addPendingRecord(ILcom/vkontakte/android/attachments/PendingAudioMessageAttachment;)V

    .line 635
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/WriteBar;->setAttEditorVisible(Z)V

    .line 639
    :goto_0
    invoke-direct {p0, v2}, Lcom/vkontakte/android/ui/WriteBar;->checkSendButtonState(Z)V

    .line 640
    return-void

    .line 637
    .restart local p1    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_0
    invoke-direct {p0, v2}, Lcom/vkontakte/android/ui/WriteBar;->setAttEditorVisible(Z)V

    goto :goto_0
.end method

.method public addFwdMessages(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/Message;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 836
    .local p1, "msgs":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/Message;>;"
    iget-object v4, p0, Lcom/vkontakte/android/ui/WriteBar;->attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getAll()Ljava/util/ArrayList;

    move-result-object v1

    .line 837
    .local v1, "atts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    const/4 v3, 0x0

    .line 838
    .local v3, "i":I
    const/4 v2, 0x0

    .line 839
    .local v2, "found":Z
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 840
    .local v0, "a":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v5, v0, Lcom/vkontakte/android/attachments/FwdMessagesAttachment;

    if-eqz v5, :cond_2

    .line 841
    const/4 v2, 0x1

    .line 846
    .end local v0    # "a":Lcom/vkontakte/android/attachments/Attachment;
    :cond_0
    const/4 v4, 0x1

    invoke-direct {p0, v4}, Lcom/vkontakte/android/ui/WriteBar;->setAttEditorVisible(Z)V

    .line 847
    new-instance v4, Lcom/vkontakte/android/attachments/FwdMessagesAttachment;

    invoke-direct {v4, p1}, Lcom/vkontakte/android/attachments/FwdMessagesAttachment;-><init>(Ljava/util/List;)V

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/ui/WriteBar;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 848
    if-eqz v2, :cond_1

    .line 849
    iget-object v4, p0, Lcom/vkontakte/android/ui/WriteBar;->attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v4, v3}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->removeWithoutCallback(I)V

    .line 851
    :cond_1
    return-void

    .line 844
    .restart local v0    # "a":Lcom/vkontakte/android/attachments/Attachment;
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 845
    goto :goto_0
.end method

.method public addReplyBarView(Landroid/view/View;)V
    .locals 5
    .param p1, "replyBar"    # Landroid/view/View;

    .prologue
    .line 296
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/WriteBar;->indexOfChild(Landroid/view/View;)I

    move-result v0

    .line 297
    .local v0, "ind":I
    add-int/lit8 v1, v0, 0x1

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p1, v1, v2}, Lcom/vkontakte/android/ui/WriteBar;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 298
    return-void
.end method

.method public clearAttachments()V
    .locals 2

    .prologue
    .line 626
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    iget v1, p0, Lcom/vkontakte/android/ui/WriteBar;->peerId:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->removePendingRecord(I)V

    .line 627
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->clear()V

    .line 628
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/WriteBar;->setAttEditorVisible(Z)V

    .line 629
    return-void
.end method

.method public focus()V
    .locals 3

    .prologue
    .line 663
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEdit:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/widget/RichEditText;->requestFocus()Z

    .line 664
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEdit:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/WriteBar;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/widget/RichEditText;->setSelection(I)V

    .line 665
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/WriteBar;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 666
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEdit:Lcom/vkontakte/android/ui/widget/RichEditText;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 667
    return-void
.end method

.method public getAnchor()Landroid/view/View;
    .locals 1

    .prologue
    .line 287
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEmoji:Landroid/widget/ImageView;

    return-object v0
.end method

.method public getAsFormattedString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 601
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->mentionsManager:Lcom/vkontakte/android/ui/MentionsManager;

    if-eqz v0, :cond_0

    .line 602
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->mentionsManager:Lcom/vkontakte/android/ui/MentionsManager;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/MentionsManager;->getAsFormattedString()Ljava/lang/String;

    move-result-object v0

    .line 604
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/WriteBar;->getText()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getAttachments()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;"
        }
    .end annotation

    .prologue
    .line 622
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getAll()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getMentionsForSerialization()Ljava/lang/String;
    .locals 1

    .prologue
    .line 588
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->mentionsManager:Lcom/vkontakte/android/ui/MentionsManager;

    if-eqz v0, :cond_0

    .line 589
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->mentionsManager:Lcom/vkontakte/android/ui/MentionsManager;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/MentionsManager;->getMentionsForSerialization()Ljava/lang/String;

    move-result-object v0

    .line 591
    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 584
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEdit:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/RichEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public handleReplyBarVisibilityChange(I)V
    .locals 0
    .param p1, "newReplyBarVisibility"    # I

    .prologue
    .line 304
    iput p1, p0, Lcom/vkontakte/android/ui/WriteBar;->replyBarVisibility:I

    .line 305
    invoke-direct {p0}, Lcom/vkontakte/android/ui/WriteBar;->updateAttachDividerVisibility()V

    .line 306
    return-void
.end method

.method public isTextEmpty()Z
    .locals 1

    .prologue
    .line 614
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/WriteBar;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isUploading()Z
    .locals 1

    .prologue
    .line 618
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->isUploading()Z

    move-result v0

    return v0
.end method

.method synthetic lambda$hideVoiceRecordControl$5()V
    .locals 1

    .prologue
    .line 987
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/WriteBar;->setTimeProgress(I)V

    .line 988
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEdit:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/RichEditText;->requestFocus()Z

    .line 989
    return-void
.end method

.method synthetic lambda$init$0(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 338
    invoke-direct {p0}, Lcom/vkontakte/android/ui/WriteBar;->cancelRecord()V

    return-void
.end method

.method synthetic lambda$init$1(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 348
    invoke-direct {p0}, Lcom/vkontakte/android/ui/WriteBar;->playAudioMessage()V

    return-void
.end method

.method synthetic lambda$init$2(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 349
    invoke-direct {p0}, Lcom/vkontakte/android/ui/WriteBar;->playAudioMessage()V

    return-void
.end method

.method synthetic lambda$init$3(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 351
    invoke-direct {p0}, Lcom/vkontakte/android/ui/WriteBar;->cancelRecord()V

    .line 352
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/WriteBar;->checkSendButtonState(Z)V

    .line 353
    return-void
.end method

.method synthetic lambda$init$4(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x1

    .line 355
    invoke-direct {p0, v1}, Lcom/vkontakte/android/ui/WriteBar;->hideWaveformView(Z)V

    .line 356
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonRecord:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 357
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->deleteCurrentRecord()V

    .line 358
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->onSendClickListener:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_0

    .line 359
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->onSendClickListener:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 361
    :cond_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 19
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 670
    const/16 v16, -0x1

    move/from16 v0, p2

    move/from16 v1, v16

    if-ne v0, v1, :cond_0

    if-nez p3, :cond_2

    .line 671
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/WriteBar;->buttonRecord:Landroid/view/View;

    move-object/from16 v16, v0

    const/16 v17, 0x1

    invoke-virtual/range {v16 .. v17}, Landroid/view/View;->setEnabled(Z)V

    .line 771
    :cond_1
    :goto_0
    return-void

    .line 675
    :cond_2
    const/16 v16, 0x271a

    move/from16 v0, p1

    move/from16 v1, v16

    if-ne v0, v1, :cond_9

    .line 676
    const-string/jumbo v16, "result_new_graffiti"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_4

    .line 677
    const-string/jumbo v16, "result_new_graffiti"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/attachments/PendingGraffitiAttachment;

    .line 678
    .local v8, "graffiti":Lcom/vkontakte/android/attachments/PendingGraffitiAttachment;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/WriteBar;->graffitiSender:Lcom/vkontakte/android/ui/WriteBar$GraffitiSender;

    move-object/from16 v16, v0

    if-eqz v16, :cond_3

    .line 679
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/WriteBar;->graffitiSender:Lcom/vkontakte/android/ui/WriteBar$GraffitiSender;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-interface {v0, v8}, Lcom/vkontakte/android/ui/WriteBar$GraffitiSender;->sendGraffiti(Lcom/vkontakte/android/attachments/GraffitiAttachment;)V

    .line 681
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/WriteBar;->buttonRecord:Landroid/view/View;

    move-object/from16 v16, v0

    const/16 v17, 0x1

    invoke-virtual/range {v16 .. v17}, Landroid/view/View;->setEnabled(Z)V

    goto :goto_0

    .line 685
    .end local v8    # "graffiti":Lcom/vkontakte/android/attachments/PendingGraffitiAttachment;
    :cond_4
    const-string/jumbo v16, "result_graffiti"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_6

    .line 686
    const-string/jumbo v16, "result_graffiti"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/attachments/GraffitiAttachment;

    .line 687
    .local v8, "graffiti":Lcom/vkontakte/android/attachments/GraffitiAttachment;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/WriteBar;->graffitiSender:Lcom/vkontakte/android/ui/WriteBar$GraffitiSender;

    move-object/from16 v16, v0

    if-eqz v16, :cond_5

    .line 688
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/WriteBar;->graffitiSender:Lcom/vkontakte/android/ui/WriteBar$GraffitiSender;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-interface {v0, v8}, Lcom/vkontakte/android/ui/WriteBar$GraffitiSender;->sendGraffiti(Lcom/vkontakte/android/attachments/GraffitiAttachment;)V

    .line 690
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/WriteBar;->buttonRecord:Landroid/view/View;

    move-object/from16 v16, v0

    const/16 v17, 0x1

    invoke-virtual/range {v16 .. v17}, Landroid/view/View;->setEnabled(Z)V

    goto :goto_0

    .line 694
    .end local v8    # "graffiti":Lcom/vkontakte/android/attachments/GraffitiAttachment;
    :cond_6
    const/16 v16, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->setAttEditorVisible(Z)V

    .line 695
    const-string/jumbo v16, "result_attachments"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_8

    .line 696
    const-string/jumbo v16, "result_attachments"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v12

    .line 697
    .local v12, "result":Landroid/os/Bundle;
    const-string/jumbo v16, "result_files"

    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_9

    const-string/jumbo v16, "result_video_flags"

    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_9

    .line 698
    const-string/jumbo v16, "result_files"

    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v5

    .line 699
    .local v5, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    const-string/jumbo v16, "result_video_flags"

    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Landroid/os/Bundle;->getBooleanArray(Ljava/lang/String;)[Z

    move-result-object v15

    .line 700
    .local v15, "videoFlags":[Z
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_1
    array-length v0, v15

    move/from16 v16, v0

    move/from16 v0, v16

    if-ge v9, v0, :cond_9

    .line 701
    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/net/Uri;

    .line 702
    .local v13, "u":Landroid/net/Uri;
    aget-boolean v16, v15, v9

    if-eqz v16, :cond_7

    .line 703
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/vkontakte/android/ui/WriteBar;->addVideoFile(Landroid/net/Uri;)V

    .line 700
    :goto_2
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 705
    :cond_7
    new-instance v16, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, "://"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual {v13}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;)V

    goto :goto_2

    .line 710
    .end local v5    # "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    .end local v9    # "i":I
    .end local v12    # "result":Landroid/os/Bundle;
    .end local v13    # "u":Landroid/net/Uri;
    .end local v15    # "videoFlags":[Z
    :cond_8
    const-string/jumbo v16, "audio"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_b

    .line 711
    const-string/jumbo v16, "audio"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/audio/MusicTrack;

    .line 712
    .local v4, "file":Lcom/vkontakte/android/audio/MusicTrack;
    new-instance v16, Lcom/vkontakte/android/attachments/AudioAttachment;

    move-object/from16 v0, v16

    invoke-direct {v0, v4}, Lcom/vkontakte/android/attachments/AudioAttachment;-><init>(Lcom/vkontakte/android/audio/MusicTrack;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 735
    .end local v4    # "file":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_9
    :goto_3
    const/16 v16, 0x2713

    move/from16 v0, p1

    move/from16 v1, v16

    if-ne v0, v1, :cond_a

    .line 736
    const-string/jumbo v16, "audio"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/audio/MusicTrack;

    .line 737
    .restart local v4    # "file":Lcom/vkontakte/android/audio/MusicTrack;
    new-instance v16, Lcom/vkontakte/android/attachments/AudioAttachment;

    move-object/from16 v0, v16

    invoke-direct {v0, v4}, Lcom/vkontakte/android/attachments/AudioAttachment;-><init>(Lcom/vkontakte/android/audio/MusicTrack;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 739
    .end local v4    # "file":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_a
    const/16 v16, 0x2714

    move/from16 v0, p1

    move/from16 v1, v16

    if-ne v0, v1, :cond_f

    .line 742
    const-string/jumbo v16, "documents"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    .line 743
    .local v3, "docs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/Parcelable;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_4
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_f

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/os/Parcelable;

    .line 744
    .local v10, "p":Landroid/os/Parcelable;
    check-cast v10, Lcom/vkontakte/android/attachments/Attachment;

    .end local v10    # "p":Landroid/os/Parcelable;
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/vkontakte/android/ui/WriteBar;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;)V

    goto :goto_4

    .line 714
    .end local v3    # "docs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/Parcelable;>;"
    :cond_b
    const-string/jumbo v16, "documents"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_c

    .line 715
    const-string/jumbo v16, "documents"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    .line 716
    .restart local v3    # "docs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/Parcelable;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_5
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_9

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/os/Parcelable;

    .line 717
    .restart local v10    # "p":Landroid/os/Parcelable;
    check-cast v10, Lcom/vkontakte/android/attachments/Attachment;

    .end local v10    # "p":Landroid/os/Parcelable;
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/vkontakte/android/ui/WriteBar;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;)V

    goto :goto_5

    .line 720
    .end local v3    # "docs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/Parcelable;>;"
    :cond_c
    const-string/jumbo v16, "video"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_d

    .line 721
    const-string/jumbo v16, "video"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v14

    check-cast v14, Lcom/vkontakte/android/api/VideoFile;

    .line 722
    .local v14, "video":Lcom/vkontakte/android/api/VideoFile;
    new-instance v16, Lcom/vkontakte/android/attachments/VideoAttachment;

    move-object/from16 v0, v16

    invoke-direct {v0, v14}, Lcom/vkontakte/android/attachments/VideoAttachment;-><init>(Lcom/vkontakte/android/api/VideoFile;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;)V

    goto/16 :goto_3

    .line 724
    .end local v14    # "video":Lcom/vkontakte/android/api/VideoFile;
    :cond_d
    const-string/jumbo v16, "photo"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_e

    .line 725
    const-string/jumbo v16, "photo"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v11

    check-cast v11, Lcom/vkontakte/android/Photo;

    .line 726
    .local v11, "photo":Lcom/vkontakte/android/Photo;
    new-instance v16, Lcom/vkontakte/android/attachments/PhotoAttachment;

    move-object/from16 v0, v16

    invoke-direct {v0, v11}, Lcom/vkontakte/android/attachments/PhotoAttachment;-><init>(Lcom/vkontakte/android/Photo;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;)V

    goto/16 :goto_3

    .line 728
    .end local v11    # "photo":Lcom/vkontakte/android/Photo;
    :cond_e
    const-string/jumbo v16, "point"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_9

    .line 729
    const-string/jumbo v16, "point"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/attachments/GeoAttachment;

    .line 730
    .local v7, "geo":Lcom/vkontakte/android/attachments/GeoAttachment;
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/vkontakte/android/ui/WriteBar;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;)V

    goto/16 :goto_3

    .line 747
    .end local v7    # "geo":Lcom/vkontakte/android/attachments/GeoAttachment;
    :cond_f
    const/16 v16, 0x2712

    move/from16 v0, p1

    move/from16 v1, v16

    if-ne v0, v1, :cond_10

    .line 748
    const-string/jumbo v16, "video"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v14

    check-cast v14, Lcom/vkontakte/android/api/VideoFile;

    .line 749
    .restart local v14    # "video":Lcom/vkontakte/android/api/VideoFile;
    new-instance v16, Lcom/vkontakte/android/attachments/VideoAttachment;

    move-object/from16 v0, v16

    invoke-direct {v0, v14}, Lcom/vkontakte/android/attachments/VideoAttachment;-><init>(Lcom/vkontakte/android/api/VideoFile;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 751
    .end local v14    # "video":Lcom/vkontakte/android/api/VideoFile;
    :cond_10
    const/16 v16, 0x2711

    move/from16 v0, p1

    move/from16 v1, v16

    if-ne v0, v1, :cond_11

    .line 752
    const-string/jumbo v16, "attachment"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_14

    .line 753
    const-string/jumbo v16, "attachment"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/attachments/PhotoAttachment;

    .line 754
    .local v2, "att":Lcom/vkontakte/android/attachments/PhotoAttachment;
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/ui/WriteBar;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 765
    .end local v2    # "att":Lcom/vkontakte/android/attachments/PhotoAttachment;
    :cond_11
    :goto_6
    const/16 v16, 0x2715

    move/from16 v0, p1

    move/from16 v1, v16

    if-ne v0, v1, :cond_12

    .line 766
    const-string/jumbo v16, "point"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v16

    check-cast v16, Lcom/vkontakte/android/attachments/Attachment;

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 768
    :cond_12
    const/16 v16, 0x2717

    move/from16 v0, p1

    move/from16 v1, v16

    if-eq v0, v1, :cond_13

    const/16 v16, 0x2716

    move/from16 v0, p1

    move/from16 v1, v16

    if-ne v0, v1, :cond_1

    .line 769
    :cond_13
    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->addVideoFile(Landroid/net/Uri;)V

    goto/16 :goto_0

    .line 755
    :cond_14
    const-string/jumbo v16, "files"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_15

    .line 756
    const-string/jumbo v16, "files"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    .line 757
    .local v6, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_7
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_11

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 759
    .local v4, "file":Ljava/lang/String;
    new-instance v17, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    move-object/from16 v0, v17

    invoke-direct {v0, v4}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;)V

    goto :goto_7

    .line 762
    .end local v4    # "file":Ljava/lang/String;
    .end local v6    # "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_15
    new-instance v16, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    const-string/jumbo v17, "file"

    move-object/from16 v0, p3

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;)V

    goto/16 :goto_6
.end method

.method protected onAttachedToWindow()V
    .locals 5

    .prologue
    .line 908
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    .line 909
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 910
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.vkontakte.android.STICKERS_NUM_UPDATES"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 911
    const-string/jumbo v1, "com.vkontakte.android.AUDIO_MESSAGE_DONE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 912
    const-string/jumbo v1, "com.vkontakte.android.AUDIO_MESSAGE_ERROR"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 913
    const-string/jumbo v1, "com.vkontakte.android.AUDIO_MESSAGE_UPDATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 914
    const-string/jumbo v1, "com.vkontakte.android.AUDIO_MESSAGE_CANCEL"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 915
    const-string/jumbo v1, "com.vkontakte.android.actions.AUDIO_MESSAGE_DONE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 916
    const-string/jumbo v1, "com.vkontakte.android.actions.AUDIO_MESSAGE_UPDATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 917
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/WriteBar;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar;->mReceiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 918
    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEmojiNew:Landroid/widget/ImageView;

    iget-boolean v1, p0, Lcom/vkontakte/android/ui/WriteBar;->allowNew:Z

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/stickers/Stickers;->getGlobalPromotions()I

    move-result v1

    if-lez v1, :cond_0

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 919
    return-void

    .line 918
    :cond_0
    const/16 v1, 0x8

    goto :goto_0
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 923
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 924
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/WriteBar;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 925
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->mAutoSuggestPopup:Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;

    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->hidePopup()V

    .line 926
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->voiceRecordControlPopup:Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->dismiss()V

    .line 927
    return-void
.end method

.method public onPause(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 951
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/WriteBar;->isActive:Z

    .line 952
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->isRaisedRecording()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->isPlaying()Z

    move-result v0

    if-nez v0, :cond_0

    .line 953
    invoke-direct {p0}, Lcom/vkontakte/android/ui/WriteBar;->stopVoiceRecord()V

    .line 954
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->stopRaiseToEarSensors(Landroid/app/Activity;)V

    .line 956
    :cond_0
    return-void
.end method

.method public onResume(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 959
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/WriteBar;->isActive:Z

    .line 960
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->isRaisedRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->isRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 961
    invoke-direct {p0}, Lcom/vkontakte/android/ui/WriteBar;->showVoiceRecordControl()V

    .line 966
    :goto_0
    return-void

    .line 963
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/ui/WriteBar;->restoreRecordViewIfNeeded()V

    .line 964
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->audioRecordSessionId:Ljava/lang/String;

    invoke-virtual {v0, p1, v1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->startRaiseToEarSensors(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setAttachLimits(IZ)V
    .locals 0
    .param p1, "max"    # I
    .param p2, "allowMap"    # Z

    .prologue
    .line 643
    iput-boolean p2, p0, Lcom/vkontakte/android/ui/WriteBar;->mapAllowed:Z

    .line 644
    iput p1, p0, Lcom/vkontakte/android/ui/WriteBar;->maxAtts:I

    .line 645
    return-void
.end method

.method public setAutoSuggestPopupListener(Lcom/vkontakte/android/stickers/StickersView$Listener;)V
    .locals 0
    .param p1, "listener"    # Lcom/vkontakte/android/stickers/StickersView$Listener;

    .prologue
    .line 292
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar;->mAutoSuggestPopupListener:Lcom/vkontakte/android/stickers/StickersView$Listener;

    .line 293
    return-void
.end method

.method public setChat(Z)V
    .locals 3
    .param p1, "chat"    # Z

    .prologue
    .line 258
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/WriteBar;->isChat:Z

    .line 259
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/WriteBar;->isChat:Z

    if-eqz v0, :cond_0

    .line 260
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->buttonRecord:Landroid/view/View;

    new-instance v1, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;-><init>(Lcom/vkontakte/android/ui/WriteBar;Lcom/vkontakte/android/ui/WriteBar$1;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 262
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/WriteBar;->checkSendButtonState(Z)V

    .line 263
    return-void
.end method

.method public setErrorViewShown(Z)V
    .locals 0
    .param p1, "shown"    # Z

    .prologue
    .line 969
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/WriteBar;->isErrorViewShown:Z

    .line 970
    return-void
.end method

.method public setFragment(Landroid/app/Fragment;)V
    .locals 0
    .param p1, "f"    # Landroid/app/Fragment;

    .prologue
    .line 575
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar;->fragment:Landroid/app/Fragment;

    .line 576
    return-void
.end method

.method public setGraffitiAllowed(Z)V
    .locals 0
    .param p1, "graffitiAllowed"    # Z

    .prologue
    .line 283
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/WriteBar;->graffitiAllowed:Z

    .line 284
    return-void
.end method

.method public setGraffitiPhoto(Ljava/lang/String;)V
    .locals 0
    .param p1, "graffitiPhoto"    # Ljava/lang/String;

    .prologue
    .line 266
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar;->graffitiPhoto:Ljava/lang/String;

    .line 267
    return-void
.end method

.method public setGraffitiSender(Lcom/vkontakte/android/ui/WriteBar$GraffitiSender;)V
    .locals 0
    .param p1, "graffitiSender"    # Lcom/vkontakte/android/ui/WriteBar$GraffitiSender;

    .prologue
    .line 274
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar;->graffitiSender:Lcom/vkontakte/android/ui/WriteBar$GraffitiSender;

    .line 275
    return-void
.end method

.method public setGraffitiTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "graffitiTitle"    # Ljava/lang/String;

    .prologue
    .line 270
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar;->graffitiTitle:Ljava/lang/String;

    .line 271
    return-void
.end method

.method public setKeyboardPopup(Lcom/vkontakte/android/stickers/KeyboardPopup;)V
    .locals 0
    .param p1, "keyboardPopup"    # Lcom/vkontakte/android/stickers/KeyboardPopup;

    .prologue
    .line 250
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    .line 251
    return-void
.end method

.method public setMentionSuggestionsSupplier(Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;)Lcom/vkontakte/android/ui/MentionsManager;
    .locals 2
    .param p1, "mentionSuggestionsSupplier"    # Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;

    .prologue
    .line 278
    new-instance v0, Lcom/vkontakte/android/ui/MentionsManager;

    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEdit:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/ui/MentionsManager;-><init>(Lcom/vkontakte/android/ui/widget/RichEditText;Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->mentionsManager:Lcom/vkontakte/android/ui/MentionsManager;

    .line 279
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->mentionsManager:Lcom/vkontakte/android/ui/MentionsManager;

    return-object v0
.end method

.method public setMentionsFromSerializedString(Ljava/lang/String;)V
    .locals 1
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 595
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->mentionsManager:Lcom/vkontakte/android/ui/MentionsManager;

    if-eqz v0, :cond_0

    .line 596
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->mentionsManager:Lcom/vkontakte/android/ui/MentionsManager;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/MentionsManager;->setMentionsFromSerializedString(Ljava/lang/String;)V

    .line 598
    :cond_0
    return-void
.end method

.method public setOnSendClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .param p1, "onSendClickListener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 254
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar;->onSendClickListener:Landroid/view/View$OnClickListener;

    .line 255
    return-void
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 609
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEdit:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/widget/RichEditText;->setText(Ljava/lang/CharSequence;)V

    .line 610
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/WriteBar;->checkSendButtonState(Z)V

    .line 611
    return-void
.end method

.method public setUploadType(ZI)V
    .locals 1
    .param p1, "isWall"    # Z
    .param p2, "oid"    # I

    .prologue
    .line 579
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    iput-boolean p1, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->isWallPhoto:Z

    .line 580
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    iput p2, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->uploadOwnerId:I

    .line 581
    return-void
.end method

.method public showDefaultIcon()V
    .locals 4

    .prologue
    .line 945
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEmoji:Landroid/widget/ImageView;

    new-instance v1, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/WriteBar;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f020291

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const v3, -0x4b4845

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 946
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEmojiNew:Landroid/widget/ImageView;

    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/Stickers;->getGlobalPromotions()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 947
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/WriteBar;->allowNew:Z

    .line 948
    return-void

    .line 946
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method public showHideIcon()V
    .locals 4

    .prologue
    .line 938
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEmoji:Landroid/widget/ImageView;

    new-instance v1, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/WriteBar;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f020291

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const v3, -0x9c7141

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 939
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEmojiNew:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 940
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/WriteBar;->allowNew:Z

    .line 941
    return-void
.end method

.method public showKeyboardIcon()V
    .locals 4

    .prologue
    .line 931
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEmoji:Landroid/widget/ImageView;

    new-instance v1, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/WriteBar;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0201d0

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const v3, -0x4b4845

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 932
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->writeBarEmojiNew:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 933
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/WriteBar;->allowNew:Z

    .line 934
    return-void
.end method

.method public waitForUploads(Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "onDone"    # Ljava/lang/Runnable;
    .param p2, "onFailed"    # Ljava/lang/Runnable;

    .prologue
    .line 854
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar;->attEditor:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->isUploading()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 855
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar;->onUplDone:Ljava/lang/Runnable;

    .line 856
    iput-object p2, p0, Lcom/vkontakte/android/ui/WriteBar;->onUplFail:Ljava/lang/Runnable;

    .line 860
    :goto_0
    return-void

    .line 858
    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    goto :goto_0
.end method
