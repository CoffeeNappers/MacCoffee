.class public Lcom/vkontakte/android/activities/VideoPlayerActivity;
.super Lcom/vkontakte/android/activities/BaseVideoActivity;
.source "VideoPlayerActivity.java"

# interfaces
.implements Lcom/vkontakte/android/media/VideoPools$PlayerContext;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/activities/VideoPlayerActivity$SettingsContentObserver;,
        Lcom/vkontakte/android/activities/VideoPlayerActivity$FocusListener;,
        Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;,
        Lcom/vkontakte/android/activities/VideoPlayerActivity$InsetsFrameLayout;,
        Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;
    }
.end annotation


# instance fields
.field adsPanel:Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;

.field bottomAnchor:Landroid/view/View;

.field private buffering:Z

.field private completed:Z

.field content:Landroid/view/View;

.field controlBar:Landroid/view/View;

.field volatile curQuality:I

.field endMenu:Landroid/view/View;

.field endMenuScrim:Landroid/view/View;

.field fill:Z

.field final focusListener:Lcom/vkontakte/android/activities/VideoPlayerActivity$FocusListener;

.field private fullscreenTracked:Z

.field insetsView:Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;

.field private isAutoplay:Z

.field private isMute:Z

.field private isResumed:Z

.field mHideUiAction:Ljava/lang/Runnable;

.field mOrientier:Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;

.field private mRecallReady:Z

.field mTracker:Lcom/vkontakte/android/media/VideoTracker;

.field private needSeekTo:I

.field playButton:Landroid/widget/ImageView;

.field player:Lcom/vkontakte/android/media/AbsVideoPlayer;

.field playing:Z

.field progress:Landroid/widget/ProgressBar;

.field qualityMenu:Landroid/support/v7/widget/PopupMenu;

.field qualitySelector:Landroid/widget/TextView;

.field private ready:Z

.field resizeAnim:Landroid/animation/Animator;

.field resizeButton:Landroid/widget/ImageView;

.field seekbar:Landroid/widget/SeekBar;

.field private seeking:Z

.field private shitAttachment:Lcom/vkontakte/android/attachments/ShitAttachment;

.field texScaleCrop:F

.field texScaleFit:F

.field texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

.field time1:Landroid/widget/TextView;

.field time2:Landroid/widget/TextView;

.field translationControlsCrop:F

.field translationControlsFit:F

.field private uiHidden:Z

.field private uiVisible:Z

.field final useVigo:Ljava/util/concurrent/atomic/AtomicBoolean;

.field visibilityAnim:Landroid/animation/Animator;

.field final volumeObserver:Landroid/database/ContentObserver;


# direct methods
.method public constructor <init>()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    const/4 v3, -0x1

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    .line 75
    invoke-direct {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;-><init>()V

    .line 77
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->useVigo:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 78
    new-instance v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$FocusListener;

    invoke-direct {v0, p0, v5}, Lcom/vkontakte/android/activities/VideoPlayerActivity$FocusListener;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;Lcom/vkontakte/android/activities/VideoPlayerActivity$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->focusListener:Lcom/vkontakte/android/activities/VideoPlayerActivity$FocusListener;

    .line 79
    new-instance v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$SettingsContentObserver;

    invoke-direct {v0, p0, v5}, Lcom/vkontakte/android/activities/VideoPlayerActivity$SettingsContentObserver;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->volumeObserver:Landroid/database/ContentObserver;

    .line 86
    iput v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->curQuality:I

    .line 88
    iput v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->needSeekTo:I

    .line 94
    iput-boolean v4, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->uiVisible:Z

    .line 984
    iput v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texScaleFit:F

    .line 985
    iput v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texScaleCrop:F

    .line 986
    iput v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->translationControlsFit:F

    .line 987
    iput v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->translationControlsCrop:F

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/activities/VideoPlayerActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/activities/VideoPlayerActivity;

    .prologue
    .line 75
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->completed:Z

    return v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/activities/VideoPlayerActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/activities/VideoPlayerActivity;

    .prologue
    .line 75
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->uiVisible:Z

    return v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/activities/VideoPlayerActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/activities/VideoPlayerActivity;

    .prologue
    .line 75
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->ready:Z

    return v0
.end method

.method static synthetic access$402(Lcom/vkontakte/android/activities/VideoPlayerActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/VideoPlayerActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 75
    iput-boolean p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->seeking:Z

    return p1
.end method

.method static synthetic access$500(Lcom/vkontakte/android/activities/VideoPlayerActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/activities/VideoPlayerActivity;

    .prologue
    .line 75
    iget v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->needSeekTo:I

    return v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/activities/VideoPlayerActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/activities/VideoPlayerActivity;

    .prologue
    .line 75
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->buffering:Z

    return v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/VideoPlayerActivity;

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->trackIsMute()V

    return-void
.end method

.method private initShitIfNeeded()V
    .locals 2

    .prologue
    .line 163
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "ads"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->shitAttachment:Lcom/vkontakte/android/attachments/ShitAttachment;

    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->shitAttachment:Lcom/vkontakte/android/attachments/ShitAttachment;

    if-eqz v0, :cond_0

    .line 165
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getSystemLayoutFlags()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->systemUILayoutFlag:I

    .line 167
    :cond_0
    return-void
.end method

.method private isSoundIsMute()Z
    .locals 2

    .prologue
    .line 1076
    invoke-static {p0}, Lcom/vkontakte/android/audio/utils/Utils;->getAudioManager(Landroid/content/Context;)Landroid/media/AudioManager;

    move-result-object v0

    .line 1077
    .local v0, "am":Landroid/media/AudioManager;
    if-eqz v0, :cond_0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private trackFullscreenOn()V
    .locals 1

    .prologue
    .line 1081
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->fullscreenTracked:Z

    if-nez v0, :cond_0

    .line 1082
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->fullscreenTracked:Z

    .line 1083
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/VideoTracker;->trackFullscreenOn()V

    .line 1085
    :cond_0
    return-void
.end method

.method private trackIsMute()V
    .locals 2

    .prologue
    .line 1088
    invoke-direct {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->isSoundIsMute()Z

    move-result v0

    .line 1089
    .local v0, "isMute":Z
    iget-boolean v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->isMute:Z

    if-eq v1, v0, :cond_0

    .line 1090
    iput-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->isMute:Z

    .line 1091
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    if-eqz v1, :cond_0

    .line 1092
    if-eqz v0, :cond_1

    .line 1093
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    invoke-virtual {v1}, Lcom/vkontakte/android/media/VideoTracker;->trackVolumeOff()V

    .line 1099
    :cond_0
    :goto_0
    return-void

    .line 1095
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    invoke-virtual {v1}, Lcom/vkontakte/android/media/VideoTracker;->trackVolumeOn()V

    goto :goto_0
.end method


# virtual methods
.method abandonAudioFocus()V
    .locals 2

    .prologue
    .line 1069
    invoke-static {p0}, Lcom/vkontakte/android/audio/utils/Utils;->getAudioManager(Landroid/content/Context;)Landroid/media/AudioManager;

    move-result-object v0

    .line 1070
    .local v0, "am":Landroid/media/AudioManager;
    if-eqz v0, :cond_0

    .line 1071
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->focusListener:Lcom/vkontakte/android/activities/VideoPlayerActivity$FocusListener;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 1073
    :cond_0
    return-void
.end method

.method addVideo()V
    .locals 1

    .prologue
    .line 600
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->completed:Z

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->addVideo(Z)V

    .line 601
    return-void
.end method

.method bindInfo(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 9
    .param p1, "file"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    const v8, 0x7f100590

    const/16 v1, 0x8

    const/4 v6, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 768
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->isExternal()Z

    move-result v0

    if-nez v0, :cond_7

    .line 769
    invoke-virtual {p0, v6}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->setBottomPanelVisible(Z)V

    .line 770
    invoke-virtual {p0, v8}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-boolean v4, p1, Lcom/vkontakte/android/api/VideoFile;->liked:Z

    invoke-virtual {v0, v4}, Landroid/view/View;->setSelected(Z)V

    .line 771
    const v0, 0x7f100592

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iget-boolean v0, p1, Lcom/vkontakte/android/api/VideoFile;->canRepost:Z

    if-nez v0, :cond_1

    move v0, v1

    :goto_0
    invoke-virtual {v4, v0}, Landroid/view/View;->setVisibility(I)V

    .line 772
    const v0, 0x7f10058c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-boolean v4, p1, Lcom/vkontakte/android/api/VideoFile;->canAdd:Z

    if-eqz v4, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->isInShitMode()Z

    move-result v4

    if-nez v4, :cond_0

    move v1, v2

    :cond_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 773
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 774
    const v0, 0x7f10019c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v4, 0x7f0d0060

    iget v5, p1, Lcom/vkontakte/android/api/VideoFile;->views:I

    new-array v6, v6, [Ljava/lang/Object;

    iget v7, p1, Lcom/vkontakte/android/api/VideoFile;->views:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v2

    invoke-virtual {v1, v4, v5, v6}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 775
    invoke-virtual {p0, v8}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget v1, p1, Lcom/vkontakte/android/api/VideoFile;->likes:I

    if-lez v1, :cond_2

    iget v1, p1, Lcom/vkontakte/android/api/VideoFile;->likes:I

    invoke-static {v1}, Lcom/vkontakte/android/Global;->formatNumber(I)Ljava/lang/String;

    move-result-object v1

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 776
    const v0, 0x7f100591

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget v1, p1, Lcom/vkontakte/android/api/VideoFile;->comments:I

    if-lez v1, :cond_3

    iget v1, p1, Lcom/vkontakte/android/api/VideoFile;->comments:I

    invoke-static {v1}, Lcom/vkontakte/android/Global;->formatNumber(I)Ljava/lang/String;

    move-result-object v1

    :goto_2
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 777
    const v0, 0x7f100592

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget v1, p1, Lcom/vkontakte/android/api/VideoFile;->reposts:I

    if-lez v1, :cond_4

    iget v1, p1, Lcom/vkontakte/android/api/VideoFile;->reposts:I

    invoke-static {v1}, Lcom/vkontakte/android/Global;->formatNumber(I)Ljava/lang/String;

    move-result-object v1

    :goto_3
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 778
    const v0, 0x7f100586

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iget-boolean v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->landscape:Z

    if-eqz v1, :cond_5

    const v1, 0x7f0201c2

    :goto_4
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 779
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->adsPanel:Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;

    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->shitAttachment:Lcom/vkontakte/android/attachments/ShitAttachment;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->bind(Lcom/vkontakte/android/attachments/ShitAttachment;Ljava/lang/CharSequence;)V

    .line 780
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->invalidateOptionsMenu()V

    .line 781
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->landscape:Z

    if-nez v0, :cond_6

    .line 782
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/support/v7/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 789
    :goto_5
    return-void

    :cond_1
    move v0, v2

    .line 771
    goto/16 :goto_0

    :cond_2
    move-object v1, v3

    .line 775
    goto :goto_1

    :cond_3
    move-object v1, v3

    .line 776
    goto :goto_2

    :cond_4
    move-object v1, v3

    .line 777
    goto :goto_3

    .line 778
    :cond_5
    const v1, 0x7f0201c1

    goto :goto_4

    .line 784
    :cond_6
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_5

    .line 787
    :cond_7
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->setBottomPanelVisible(Z)V

    goto :goto_5
.end method

.method blockingSetUIVisibility(Z)V
    .locals 3
    .param p1, "visible"    # Z

    .prologue
    const/4 v2, 0x0

    const/16 v1, 0x8

    .line 710
    if-eqz p1, :cond_0

    .line 711
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->setUIVisibility(Z)V

    .line 720
    :goto_0
    return-void

    .line 713
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setVisibility(I)V

    .line 714
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->controlBar:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 715
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->endMenu:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 716
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->setBottomPanelVisible(Z)V

    .line 717
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->setAlpha(F)V

    .line 718
    iput-boolean v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->uiVisible:Z

    goto :goto_0
.end method

.method cancelHideUI()V
    .locals 1

    .prologue
    .line 621
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mHideUiAction:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 622
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mHideUiAction:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->cancelRunnable(Ljava/lang/Runnable;)Z

    .line 623
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mHideUiAction:Ljava/lang/Runnable;

    .line 625
    :cond_0
    return-void
.end method

.method createUI(Landroid/os/Bundle;)V
    .locals 12
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 172
    const v0, 0x7f030227

    const/4 v2, 0x0

    invoke-static {p0, v0, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->content:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->setContentView(Landroid/view/View;)V

    .line 173
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->content:Landroid/view/View;

    new-instance v2, Lcom/vkontakte/android/activities/VideoPlayerActivity$1;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$1;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 180
    const v0, 0x7f10058b

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v2, Lcom/vkontakte/android/activities/VideoPlayerActivity$2;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$2;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 186
    const v0, 0x7f10058a

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v2, Lcom/vkontakte/android/activities/VideoPlayerActivity$3;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$3;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 192
    const v0, 0x7f10058c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v2, Lcom/vkontakte/android/activities/VideoPlayerActivity$4;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$4;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 198
    const v0, 0x7f100184

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->progress:Landroid/widget/ProgressBar;

    .line 199
    const v0, 0x7f1003f3

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playButton:Landroid/widget/ImageView;

    .line 200
    const v0, 0x7f100585

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->resizeButton:Landroid/widget/ImageView;

    .line 201
    const v0, 0x7f100584

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->qualitySelector:Landroid/widget/TextView;

    .line 202
    const v0, 0x7f100582

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->time1:Landroid/widget/TextView;

    .line 203
    const v0, 0x7f100583

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->time2:Landroid/widget/TextView;

    .line 204
    const v0, 0x7f1004cf

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->seekbar:Landroid/widget/SeekBar;

    .line 205
    const v0, 0x7f100581

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->controlBar:Landroid/view/View;

    .line 206
    const v0, 0x7f100589

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->endMenu:Landroid/view/View;

    .line 207
    const v0, 0x7f100580

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->endMenuScrim:Landroid/view/View;

    .line 208
    const v0, 0x7f100201

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/widget/VideoTextureView;

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    .line 209
    const v0, 0x7f100587

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->bottomAnchor:Landroid/view/View;

    .line 210
    const v0, 0x7f100588

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->adsPanel:Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;

    .line 211
    const v0, 0x7f10058b

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->isInShitMode()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 212
    const v0, 0x7f10058c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->isInShitMode()Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x0

    :goto_1
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 214
    new-instance v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;

    invoke-direct {v0, p0, p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mOrientier:Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;

    .line 215
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mOrientier:Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->enable()V

    .line 216
    const v0, 0x7f100586

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v2, Lcom/vkontakte/android/activities/VideoPlayerActivity$5;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$5;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 224
    new-instance v0, Landroid/support/v7/widget/PopupMenu;

    iget-object v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->qualitySelector:Landroid/widget/TextView;

    invoke-direct {v0, p0, v2}, Landroid/support/v7/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->qualityMenu:Landroid/support/v7/widget/PopupMenu;

    .line 225
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->qualityMenu:Landroid/support/v7/widget/PopupMenu;

    new-instance v2, Lcom/vkontakte/android/activities/VideoPlayerActivity$6;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$6;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 235
    const v0, 0x7f10044d

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->insetsView:Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;

    .line 236
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->qualitySelector:Landroid/widget/TextView;

    new-instance v2, Lcom/vkontakte/android/activities/VideoPlayerActivity$7;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$7;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 242
    const v0, 0x7f10028e

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v2, Lcom/vkontakte/android/activities/VideoPlayerActivity$8;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$8;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 255
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->changingSysUiVisibility:Z

    .line 257
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playButton:Landroid/widget/ImageView;

    new-instance v2, Lcom/vkontakte/android/activities/VideoPlayerActivity$9;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$9;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 272
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->resizeButton:Landroid/widget/ImageView;

    new-instance v2, Lcom/vkontakte/android/activities/VideoPlayerActivity$10;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$10;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 281
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->seekbar:Landroid/widget/SeekBar;

    new-instance v2, Lcom/vkontakte/android/activities/VideoPlayerActivity$11;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$11;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 313
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getVideo()Lcom/vkontakte/android/api/VideoFile;

    move-result-object v1

    .line 315
    .local v1, "file":Lcom/vkontakte/android/api/VideoFile;
    invoke-direct {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->isSoundIsMute()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->isMute:Z

    .line 316
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v10

    .line 317
    .local v10, "intent":Landroid/content/Intent;
    const-string/jumbo v0, "autoplay"

    const/4 v2, 0x0

    invoke-virtual {v10, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->isAutoplay:Z

    .line 318
    new-instance v0, Lcom/vkontakte/android/media/VideoTracker;

    const-string/jumbo v2, "statistic"

    invoke-virtual {v10, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/statistics/Statistic;

    iget v3, v1, Lcom/vkontakte/android/api/VideoFile;->vid:I

    iget v4, v1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->referrer:Ljava/lang/String;

    iget-boolean v6, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->isAutoplay:Z

    const-string/jumbo v7, "context"

    .line 319
    invoke-virtual {v10, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct/range {v0 .. v7}, Lcom/vkontakte/android/media/VideoTracker;-><init>(Lcom/vkontakte/android/api/VideoFile;Lcom/vkontakte/android/statistics/Statistic;IILjava/lang/String;ZLjava/lang/String;)V

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    .line 320
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->isMute:Z

    if-nez v0, :cond_0

    .line 321
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/VideoTracker;->trackVolumeOn()V

    .line 324
    :cond_0
    iget v0, v1, Lcom/vkontakte/android/api/VideoFile;->width:I

    if-lez v0, :cond_3

    iget v0, v1, Lcom/vkontakte/android/api/VideoFile;->height:I

    if-lez v0, :cond_3

    .line 325
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    iget v2, v1, Lcom/vkontakte/android/api/VideoFile;->width:I

    iget v3, v1, Lcom/vkontakte/android/api/VideoFile;->height:I

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->setVideoSize(II)V

    .line 331
    :goto_2
    const v0, 0x7f1001cb

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    .line 332
    .local v8, "dividerView":Landroid/view/View;
    const v0, 0x7f10058f

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v9

    .line 333
    .local v9, "gotoVKLiveButton":Landroid/view/View;
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    .line 334
    .local v11, "titleView":Landroid/widget/TextView;
    invoke-virtual {v1}, Lcom/vkontakte/android/api/VideoFile;->isLive()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 335
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->seekbar:Landroid/widget/SeekBar;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setVisibility(I)V

    .line 336
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->time1:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 337
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->time2:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 338
    const/16 v0, 0x8

    invoke-virtual {v8, v0}, Landroid/view/View;->setVisibility(I)V

    .line 339
    const/4 v0, 0x0

    invoke-virtual {v9, v0}, Landroid/view/View;->setVisibility(I)V

    .line 340
    new-instance v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$12;

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity$12;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;Lcom/vkontakte/android/api/VideoFile;)V

    invoke-virtual {v9, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 346
    const/4 v0, 0x0

    const/4 v2, 0x0

    .line 347
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/utils/VKLiveUtils;->createLiveDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    const/4 v4, 0x0

    .line 346
    invoke-virtual {v11, v0, v2, v3, v4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 348
    const/high16 v0, 0x41000000    # 8.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 357
    :goto_3
    return-void

    .line 211
    .end local v1    # "file":Lcom/vkontakte/android/api/VideoFile;
    .end local v8    # "dividerView":Landroid/view/View;
    .end local v9    # "gotoVKLiveButton":Landroid/view/View;
    .end local v10    # "intent":Landroid/content/Intent;
    .end local v11    # "titleView":Landroid/widget/TextView;
    :cond_1
    const/16 v0, 0x8

    goto/16 :goto_0

    .line 212
    :cond_2
    const/16 v0, 0x8

    goto/16 :goto_1

    .line 327
    .restart local v1    # "file":Lcom/vkontakte/android/api/VideoFile;
    .restart local v10    # "intent":Landroid/content/Intent;
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->controlBar:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 328
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->setAlpha(F)V

    goto :goto_2

    .line 350
    .restart local v8    # "dividerView":Landroid/view/View;
    .restart local v9    # "gotoVKLiveButton":Landroid/view/View;
    .restart local v11    # "titleView":Landroid/widget/TextView;
    :cond_4
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->seekbar:Landroid/widget/SeekBar;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setVisibility(I)V

    .line 351
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->time1:Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 352
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->time2:Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 353
    const/4 v0, 0x0

    invoke-virtual {v8, v0}, Landroid/view/View;->setVisibility(I)V

    .line 354
    const/16 v0, 0x8

    invoke-virtual {v9, v0}, Landroid/view/View;->setVisibility(I)V

    .line 355
    const/4 v0, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v11, v0, v2, v3, v4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    goto :goto_3
.end method

.method public finish()V
    .locals 2

    .prologue
    .line 411
    invoke-super {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->finish()V

    .line 412
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-eqz v0, :cond_0

    .line 413
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->pause()V

    .line 414
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getVideo()Lcom/vkontakte/android/api/VideoFile;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getVideoIndex()I

    move-result v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/media/VideoPools;->detachAndReleasePlayer(Lcom/vkontakte/android/api/VideoFile;I)V

    .line 416
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mOrientier:Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->disable()V

    .line 417
    return-void
.end method

.method getHideDelay()I
    .locals 1

    .prologue
    .line 808
    const/16 v0, 0x1388

    return v0
.end method

.method public getSystemLayoutFlags()I
    .locals 2

    .prologue
    .line 144
    const/16 v0, 0x700

    .line 148
    .local v0, "flag":I
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->keepNavigationBarShownInFullScreen()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 149
    const/16 v0, 0x500

    .line 153
    :cond_0
    return v0
.end method

.method public getUIFlagsForFullScreenMode()I
    .locals 2

    .prologue
    .line 129
    const/4 v0, 0x6

    .line 130
    .local v0, "flag":I
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->isInShitMode()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 132
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->keepNavigationBarShownInFullScreen()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 134
    const/4 v0, 0x4

    .line 140
    :cond_0
    :goto_0
    return v0

    .line 137
    :cond_1
    const/16 v0, 0x806

    goto :goto_0
.end method

.method hideUIDelayed(I)V
    .locals 1
    .param p1, "delay"    # I

    .prologue
    .line 605
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mHideUiAction:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 606
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mHideUiAction:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->cancelRunnable(Ljava/lang/Runnable;)Z

    .line 608
    :cond_0
    new-instance v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$15;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$15;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mHideUiAction:Ljava/lang/Runnable;

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->postRunnable(Ljava/lang/Runnable;I)Z

    .line 615
    return-void
.end method

.method public isInShitMode()Z
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->shitAttachment:Lcom/vkontakte/android/attachments/ShitAttachment;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public keepNavigationBarShownInFullScreen()Z
    .locals 2

    .prologue
    .line 124
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->isInShitMode()Z

    move-result v0

    if-eqz v0, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 405
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/activities/BaseVideoActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 406
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->finish()V

    .line 407
    return-void
.end method

.method onAddedStateChanged()V
    .locals 0

    .prologue
    .line 590
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->updateEndMenuIcons()V

    .line 591
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 158
    invoke-direct {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->initShitIfNeeded()V

    .line 159
    invoke-super {p0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->onCreate(Landroid/os/Bundle;)V

    .line 160
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 803
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->isInShitMode()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 421
    invoke-super {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->onDestroy()V

    .line 422
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    if-eqz v0, :cond_1

    .line 423
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->fullscreenTracked:Z

    if-eqz v0, :cond_0

    .line 424
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/VideoTracker;->trackFullscreenOff()V

    .line 426
    :cond_0
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->isMute:Z

    if-nez v0, :cond_1

    .line 427
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/VideoTracker;->trackVolumeOff()V

    .line 430
    :cond_1
    return-void
.end method

.method public onEndOfBuffer(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
    .locals 2
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;

    .prologue
    .line 543
    invoke-virtual {p1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->isCompleted()Z

    move-result v0

    if-nez v0, :cond_0

    .line 544
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->progress:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 545
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playButton:Landroid/widget/ImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 546
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->buffering:Z

    .line 548
    :cond_0
    return-void
.end method

.method public onError(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V
    .locals 0
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;
    .param p2, "errCode"    # I

    .prologue
    .line 528
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->displayError(I)V

    .line 529
    return-void
.end method

.method onLikeStateChanged()V
    .locals 0

    .prologue
    .line 595
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->updateEndMenuIcons()V

    .line 596
    return-void
.end method

.method public onNavigateUp()Z
    .locals 1

    .prologue
    .line 361
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->finish()V

    .line 362
    const/4 v0, 0x1

    return v0
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 367
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->isResumed:Z

    .line 368
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playing:Z

    if-eqz v0, :cond_0

    .line 369
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->pause()V

    .line 370
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->setUIVisibility(Z)V

    .line 372
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->volumeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 373
    invoke-super {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->onPause()V

    .line 374
    return-void
.end method

.method public onPause(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 581
    return-void
.end method

.method public onPlaybackCompleted(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
    .locals 3
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 508
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getVideo()Lcom/vkontakte/android/api/VideoFile;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vkontakte/android/api/VideoFile;->repeat:Z

    if-eqz v0, :cond_0

    .line 509
    invoke-virtual {p1, v1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->seek(I)V

    .line 510
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->updateTimings(I)V

    .line 511
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->play(Z)V

    .line 524
    :goto_0
    return-void

    .line 513
    :cond_0
    iput-boolean v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playing:Z

    .line 514
    iput-boolean v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->completed:Z

    .line 515
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->updatePlayButton()V

    .line 516
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->setUIVisibility(Z)V

    .line 517
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->updateEndMenuIcons()V

    .line 518
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->setEndMenuVisible(Z)V

    .line 519
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->setKeepScreenOn(Z)V

    .line 520
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->abandonAudioFocus()V

    .line 521
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->qualitySelector:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 522
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->qualitySelector:Landroid/widget/TextView;

    const v1, 0x3ec7ae14    # 0.39f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setAlpha(F)V

    goto :goto_0
.end method

.method public onPlaybackResumed(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
    .locals 3
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;

    .prologue
    const/4 v2, 0x0

    .line 552
    invoke-virtual {p1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->isCompleted()Z

    move-result v0

    if-nez v0, :cond_0

    .line 553
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->progress:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 554
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playButton:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 555
    iput-boolean v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->buffering:Z

    .line 557
    :cond_0
    return-void
.end method

.method public onPlayerAttached(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
    .locals 2
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;

    .prologue
    .line 561
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    .line 562
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->setView(Lcom/vkontakte/android/ui/widget/VideoTextureView;)V

    .line 563
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    if-eqz v1, :cond_0

    .line 564
    invoke-virtual {p1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->getPosition()I

    move-result v1

    div-int/lit16 v0, v1, 0x3e8

    .line 565
    .local v0, "sec":I
    if-eqz v0, :cond_0

    .line 566
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/media/VideoTracker;->reset(I)V

    .line 569
    .end local v0    # "sec":I
    :cond_0
    return-void
.end method

.method public onPlayerDetached(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
    .locals 2
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;

    .prologue
    const/4 v1, 0x0

    .line 573
    iput-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    .line 574
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playing:Z

    .line 575
    invoke-virtual {p1, v1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->setView(Lcom/vkontakte/android/ui/widget/VideoTextureView;)V

    .line 576
    return-void
.end method

.method public onPlayerReady(Lcom/vkontakte/android/media/AbsVideoPlayer;II)V
    .locals 8
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;
    .param p2, "videoW"    # I
    .param p3, "videoH"    # I

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    const/4 v5, -0x1

    .line 434
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getVideo()Lcom/vkontakte/android/api/VideoFile;

    move-result-object v0

    .line 435
    .local v0, "file":Lcom/vkontakte/android/api/VideoFile;
    iget-boolean v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->isResumed:Z

    if-nez v3, :cond_0

    .line 436
    iput-boolean v6, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mRecallReady:Z

    .line 492
    :goto_0
    return-void

    .line 439
    :cond_0
    if-eq p2, v5, :cond_1

    if-ne p3, v5, :cond_2

    .line 440
    :cond_1
    iget p2, v0, Lcom/vkontakte/android/api/VideoFile;->width:I

    .line 441
    iget p3, v0, Lcom/vkontakte/android/api/VideoFile;->height:I

    .line 443
    :cond_2
    if-eqz p2, :cond_3

    if-nez p3, :cond_4

    .line 444
    :cond_3
    const/16 p2, 0x140

    .line 445
    const/16 p3, 0xb4

    .line 447
    :cond_4
    iget v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->needSeekTo:I

    if-eq v3, v5, :cond_6

    .line 448
    iget v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->needSeekTo:I

    div-int/lit16 v3, v3, 0x3e8

    iget v4, v0, Lcom/vkontakte/android/api/VideoFile;->duration:I

    if-ne v3, v4, :cond_5

    .line 449
    iget v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->needSeekTo:I

    add-int/lit8 v3, v3, -0x64

    iput v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->needSeekTo:I

    .line 451
    :cond_5
    iget v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->needSeekTo:I

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/media/AbsVideoPlayer;->seek(I)V

    .line 452
    new-instance v3, Lcom/vkontakte/android/activities/VideoPlayerActivity$13;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$13;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V

    invoke-static {v3}, Lcom/vkontakte/android/ViewUtils;->post(Ljava/lang/Runnable;)V

    .line 458
    iput v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->needSeekTo:I

    .line 461
    :cond_6
    move v2, p2

    .line 462
    .local v2, "width":I
    move v1, p3

    .line 464
    .local v1, "height":I
    iput-boolean v7, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->completed:Z

    .line 465
    const-string/jumbo v3, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "VIDEO SIZE = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 467
    new-instance v3, Lcom/vkontakte/android/activities/VideoPlayerActivity$14;

    invoke-direct {v3, p0, v2, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity$14;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;II)V

    invoke-static {v3}, Lcom/vkontakte/android/ViewUtils;->post(Ljava/lang/Runnable;)V

    .line 478
    invoke-virtual {p1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->isCompleted()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 479
    iget-object v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playButton:Landroid/widget/ImageView;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 480
    iget-object v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->progress:Landroid/widget/ProgressBar;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 485
    :goto_1
    iget-boolean v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->uiHidden:Z

    if-nez v3, :cond_7

    .line 486
    iput-boolean v6, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->uiHidden:Z

    .line 487
    const/16 v3, 0x3e8

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->hideUIDelayed(I)V

    .line 489
    :cond_7
    invoke-direct {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->trackIsMute()V

    .line 490
    invoke-direct {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->trackFullscreenOn()V

    .line 491
    iput-boolean v6, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->ready:Z

    goto/16 :goto_0

    .line 482
    :cond_8
    invoke-virtual {p0, v7}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->play(Z)V

    goto :goto_1
.end method

.method public onRenderedFirstFrame(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
    .locals 0
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;

    .prologue
    .line 534
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 386
    invoke-super {p0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 387
    if-eqz p1, :cond_0

    .line 388
    const-string/jumbo v0, "needSeekTo"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->needSeekTo:I

    .line 390
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 394
    invoke-super {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->onResume()V

    .line 395
    iput-boolean v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->isResumed:Z

    .line 396
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mRecallReady:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-eqz v0, :cond_0

    .line 397
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mRecallReady:Z

    .line 398
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/AbsVideoPlayer;->recallReady()V

    .line 400
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/Settings$System;->CONTENT_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->volumeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 401
    return-void
.end method

.method public onResume(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 586
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 378
    invoke-super {p0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 379
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-eqz v0, :cond_0

    .line 380
    const-string/jumbo v0, "needSeekTo"

    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-virtual {v1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->getPosition()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 382
    :cond_0
    return-void
.end method

.method public onUpdateBuffered(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V
    .locals 3
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;
    .param p2, "percent"    # I

    .prologue
    .line 538
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->seekbar:Landroid/widget/SeekBar;

    int-to-float v1, p2

    const/high16 v2, 0x42c80000    # 100.0f

    div-float/2addr v1, v2

    iget-object v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {v2}, Landroid/widget/SeekBar;->getMax()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setSecondaryProgress(I)V

    .line 539
    return-void
.end method

.method public onUpdatePlaybackPosition(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V
    .locals 3
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;
    .param p2, "msec"    # I

    .prologue
    .line 496
    iget-boolean v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->seeking:Z

    if-nez v1, :cond_0

    .line 497
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {v1, p2}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 499
    :cond_0
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->updateTimings(I)V

    .line 500
    div-int/lit16 v0, p2, 0x3e8

    .line 501
    .local v0, "sec":I
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    if-eqz v1, :cond_1

    .line 502
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    iget v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->curQuality:I

    invoke-virtual {v1, v0, v2}, Lcom/vkontakte/android/media/VideoTracker;->track(II)V

    .line 504
    :cond_1
    return-void
.end method

.method pause()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 912
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playing:Z

    if-eqz v0, :cond_0

    .line 913
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/AbsVideoPlayer;->pause()V

    .line 914
    iput-boolean v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playing:Z

    .line 915
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->updatePlayButton()V

    .line 916
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->abandonAudioFocus()V

    .line 917
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->setKeepScreenOn(Z)V

    .line 919
    :cond_0
    return-void
.end method

.method play(Z)V
    .locals 2
    .param p1, "replay"    # Z

    .prologue
    const/4 v1, 0x1

    .line 900
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playing:Z

    if-nez v0, :cond_0

    .line 901
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->play(Z)V

    .line 902
    iput-boolean v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playing:Z

    .line 903
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->updatePlayButton()V

    .line 904
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->requestAudioFocus()V

    .line 905
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->setKeepScreenOn(Z)V

    .line 906
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->qualitySelector:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 907
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->qualitySelector:Landroid/widget/TextView;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 909
    :cond_0
    return-void
.end method

.method replay(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    const/4 v0, 0x0

    .line 958
    iput-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->completed:Z

    .line 959
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->setEndMenuVisible(Z)V

    .line 960
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playButton:Landroid/widget/ImageView;

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->cancelVisibilityAnimation(Landroid/view/View;)V

    .line 961
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->ready:Z

    if-nez v0, :cond_1

    .line 973
    :cond_0
    :goto_0
    return-void

    .line 964
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->replay(I)V

    .line 965
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getHideDelay()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->hideUIDelayed(I)V

    .line 966
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 967
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->seek(I)V

    .line 968
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->updateTimings(I)V

    .line 969
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    if-eqz v0, :cond_2

    .line 970
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/VideoTracker;->reset()V

    .line 972
    :cond_2
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->play(Z)V

    goto :goto_0
.end method

.method requestAudioFocus()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 1057
    invoke-static {p0}, Lcom/vkontakte/android/audio/utils/Utils;->getAudioManager(Landroid/content/Context;)Landroid/media/AudioManager;

    move-result-object v0

    .line 1058
    .local v0, "am":Landroid/media/AudioManager;
    if-eqz v0, :cond_0

    .line 1059
    iget-object v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->focusListener:Lcom/vkontakte/android/activities/VideoPlayerActivity$FocusListener;

    const/4 v3, 0x3

    invoke-virtual {v0, v2, v3, v4}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    move-result v1

    .line 1060
    .local v1, "result":I
    if-ne v1, v4, :cond_1

    .line 1061
    iget-object v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->focusListener:Lcom/vkontakte/android/activities/VideoPlayerActivity$FocusListener;

    invoke-virtual {v2, v4}, Lcom/vkontakte/android/activities/VideoPlayerActivity$FocusListener;->onAudioFocusChange(I)V

    .line 1066
    .end local v1    # "result":I
    :cond_0
    :goto_0
    return-void

    .line 1063
    .restart local v1    # "result":I
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->focusListener:Lcom/vkontakte/android/activities/VideoPlayerActivity$FocusListener;

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/activities/VideoPlayerActivity$FocusListener;->onAudioFocusChange(I)V

    goto :goto_0
.end method

.method resize()V
    .locals 10

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 992
    iget-boolean v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->fill:Z

    if-nez v2, :cond_1

    move v2, v3

    :goto_0
    iput-boolean v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->fill:Z

    .line 993
    iget-object v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->resizeAnim:Landroid/animation/Animator;

    if-eqz v2, :cond_0

    .line 994
    iget-object v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->resizeAnim:Landroid/animation/Animator;

    invoke-virtual {v2}, Landroid/animation/Animator;->cancel()V

    .line 996
    :cond_0
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->resizeButton:Landroid/widget/ImageView;

    iget-boolean v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->fill:Z

    if-eqz v2, :cond_2

    const v2, 0x7f0202d1

    :goto_1
    invoke-virtual {v5, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 997
    new-instance v1, Landroid/animation/AnimatorSet;

    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 998
    .local v1, "set":Landroid/animation/AnimatorSet;
    iget v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->translationControlsCrop:F

    iget v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->translationControlsFit:F

    sub-float v0, v2, v5

    .line 999
    .local v0, "diff":F
    const/4 v2, 0x5

    new-array v5, v2, [Landroid/animation/Animator;

    iget-object v6, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    const-string/jumbo v7, "scaleX"

    new-array v8, v3, [F

    iget-boolean v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->fill:Z

    if-eqz v2, :cond_3

    iget v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texScaleCrop:F

    :goto_2
    aput v2, v8, v4

    .line 1000
    invoke-static {v6, v7, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v5, v4

    iget-object v6, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    const-string/jumbo v7, "scaleY"

    new-array v8, v3, [F

    iget-boolean v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->fill:Z

    if-eqz v2, :cond_4

    iget v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texScaleCrop:F

    :goto_3
    aput v2, v8, v4

    .line 1001
    invoke-static {v6, v7, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v5, v3

    const/4 v6, 0x2

    iget-object v7, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->insetsView:Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;

    const-string/jumbo v8, "scaleX"

    new-array v9, v3, [F

    iget-boolean v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->fill:Z

    if-eqz v2, :cond_5

    iget v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texScaleCrop:F

    :goto_4
    aput v2, v9, v4

    .line 1002
    invoke-static {v7, v8, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v5, v6

    const/4 v6, 0x3

    iget-object v7, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->insetsView:Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;

    const-string/jumbo v8, "scaleY"

    new-array v9, v3, [F

    iget-boolean v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->fill:Z

    if-eqz v2, :cond_6

    iget v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texScaleCrop:F

    :goto_5
    aput v2, v9, v4

    .line 1003
    invoke-static {v7, v8, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v5, v6

    const/4 v2, 0x4

    iget-object v6, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->controlBar:Landroid/view/View;

    const-string/jumbo v7, "translationY"

    new-array v3, v3, [F

    iget-object v8, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->controlBar:Landroid/view/View;

    .line 1004
    invoke-virtual {v8}, Landroid/view/View;->getTranslationY()F

    move-result v8

    iget-boolean v9, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->fill:Z

    if-eqz v9, :cond_7

    .end local v0    # "diff":F
    :goto_6
    add-float/2addr v8, v0

    aput v8, v3, v4

    invoke-static {v6, v7, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v5, v2

    .line 999
    invoke-virtual {v1, v5}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 1006
    sget-object v2, Lcom/vkontakte/android/activities/VideoPlayerActivity;->interpolatorIn:Landroid/view/animation/Interpolator;

    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1007
    const-wide/16 v2, 0x12c

    invoke-virtual {v1, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 1008
    iput-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->resizeAnim:Landroid/animation/Animator;

    .line 1009
    new-instance v2, Lcom/vkontakte/android/activities/VideoPlayerActivity$21;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$21;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V

    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1016
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 1017
    return-void

    .end local v1    # "set":Landroid/animation/AnimatorSet;
    :cond_1
    move v2, v4

    .line 992
    goto/16 :goto_0

    .line 996
    :cond_2
    const v2, 0x7f0202d0

    goto/16 :goto_1

    .line 999
    .restart local v0    # "diff":F
    .restart local v1    # "set":Landroid/animation/AnimatorSet;
    :cond_3
    iget v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texScaleFit:F

    goto/16 :goto_2

    .line 1000
    :cond_4
    iget v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texScaleFit:F

    goto :goto_3

    .line 1001
    :cond_5
    iget v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texScaleFit:F

    goto :goto_4

    .line 1002
    :cond_6
    iget v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texScaleFit:F

    goto :goto_5

    .line 1004
    :cond_7
    neg-float v0, v0

    goto :goto_6
.end method

.method protected setBottomPanelVisible(Z)V
    .locals 2
    .param p1, "visible"    # Z

    .prologue
    .line 793
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->isInShitMode()Z

    move-result v0

    if-nez v0, :cond_0

    .line 794
    invoke-super {p0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->setBottomPanelVisible(Z)V

    .line 799
    :goto_0
    return-void

    .line 796
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->bottomPanel:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 797
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->adsPanel:Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/VideoPlayerAdsPanel;->setVisibility(I)V

    goto :goto_0
.end method

.method setEndMenuVisible(Z)V
    .locals 4
    .param p1, "visible"    # Z

    .prologue
    const/4 v2, 0x4

    const/4 v1, 0x0

    .line 818
    iget-object v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->endMenu:Landroid/view/View;

    if-eqz p1, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v3, v0}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 819
    iget-object v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->endMenuScrim:Landroid/view/View;

    if-eqz p1, :cond_1

    move v0, v1

    :goto_1
    invoke-static {v3, v0}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 820
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playButton:Landroid/widget/ImageView;

    if-eqz p1, :cond_2

    :goto_2
    invoke-static {v0, v2}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 821
    return-void

    :cond_0
    move v0, v2

    .line 818
    goto :goto_0

    :cond_1
    move v0, v2

    .line 819
    goto :goto_1

    :cond_2
    move v2, v1

    .line 820
    goto :goto_2
.end method

.method setKeepScreenOn(Z)V
    .locals 2
    .param p1, "keepScreenOn"    # Z

    .prologue
    .line 936
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/activities/VideoPlayerActivity$19;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/activities/VideoPlayerActivity$19;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;Z)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 946
    return-void
.end method

.method setUIVisibility(Z)V
    .locals 10
    .param p1, "visible"    # Z

    .prologue
    const/4 v5, 0x2

    const/high16 v9, 0x3f800000    # 1.0f

    const/4 v8, 0x0

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 825
    iget-boolean v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->uiVisible:Z

    if-ne v1, p1, :cond_0

    .line 895
    :goto_0
    return-void

    .line 828
    :cond_0
    iput-boolean p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->uiVisible:Z

    .line 829
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->cancelHideUI()V

    .line 831
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->visibilityAnim:Landroid/animation/Animator;

    if-eqz v1, :cond_1

    .line 832
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->visibilityAnim:Landroid/animation/Animator;

    invoke-virtual {v1}, Landroid/animation/Animator;->cancel()V

    .line 834
    :cond_1
    iput-boolean v6, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->changingSysUiVisibility:Z

    .line 835
    if-eqz p1, :cond_2

    .line 836
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v2

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getUIFlagsForFullScreenMode()I

    move-result v3

    xor-int/lit8 v3, v3, -0x1

    and-int/2addr v2, v3

    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 837
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 838
    .local v0, "set":Landroid/animation/AnimatorSet;
    const/4 v1, 0x5

    new-array v1, v1, [Landroid/animation/Animator;

    iget-object v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    const-string/jumbo v3, "alpha"

    new-array v4, v6, [F

    aput v9, v4, v7

    .line 839
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v7

    iget-object v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->bottomPanel:Landroid/view/View;

    const-string/jumbo v3, "alpha"

    new-array v4, v6, [F

    aput v9, v4, v7

    .line 840
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v6

    iget-object v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->controlBar:Landroid/view/View;

    const-string/jumbo v3, "alpha"

    new-array v4, v6, [F

    aput v9, v4, v7

    .line 841
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v5

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->insetsView:Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;

    const-string/jumbo v4, "alpha"

    new-array v5, v6, [F

    aput v9, v5, v7

    .line 842
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    iget-object v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playButton:Landroid/widget/ImageView;

    const-string/jumbo v4, "alpha"

    new-array v5, v6, [F

    aput v9, v5, v7

    .line 843
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    .line 838
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 845
    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 846
    sget-object v1, Lcom/vkontakte/android/activities/VideoPlayerActivity;->interpolatorOut:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 847
    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->visibilityAnim:Landroid/animation/Animator;

    .line 848
    new-instance v1, Lcom/vkontakte/android/activities/VideoPlayerActivity$17;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$17;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 864
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    goto/16 :goto_0

    .line 866
    .end local v0    # "set":Landroid/animation/AnimatorSet;
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v2

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getUIFlagsForFullScreenMode()I

    move-result v3

    or-int/2addr v2, v3

    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 867
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 868
    .restart local v0    # "set":Landroid/animation/AnimatorSet;
    const/4 v1, 0x5

    new-array v1, v1, [Landroid/animation/Animator;

    iget-object v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    const-string/jumbo v3, "alpha"

    new-array v4, v6, [F

    aput v8, v4, v7

    .line 869
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v7

    iget-object v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->bottomPanel:Landroid/view/View;

    const-string/jumbo v3, "alpha"

    new-array v4, v6, [F

    aput v8, v4, v7

    .line 870
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v6

    iget-object v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->controlBar:Landroid/view/View;

    const-string/jumbo v3, "alpha"

    new-array v4, v6, [F

    aput v8, v4, v7

    .line 871
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v5

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->insetsView:Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;

    const-string/jumbo v4, "alpha"

    new-array v5, v6, [F

    aput v8, v5, v7

    .line 872
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    iget-object v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playButton:Landroid/widget/ImageView;

    const-string/jumbo v4, "alpha"

    new-array v5, v6, [F

    aput v8, v5, v7

    .line 873
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    .line 868
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 875
    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 876
    sget-object v1, Lcom/vkontakte/android/activities/VideoPlayerActivity;->interpolatorIn:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 877
    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->visibilityAnim:Landroid/animation/Animator;

    .line 878
    new-instance v1, Lcom/vkontakte/android/activities/VideoPlayerActivity$18;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$18;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 893
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    goto/16 :goto_0
.end method

.method startFile(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 14
    .param p1, "file"    # Lcom/vkontakte/android/api/VideoFile;
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    const/4 v13, 0x3

    const/4 v12, 0x2

    const/4 v11, 0x6

    const/4 v10, 0x4

    const/4 v4, 0x0

    .line 630
    iget-object v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->seekbar:Landroid/widget/SeekBar;

    iget v5, p1, Lcom/vkontakte/android/api/VideoFile;->duration:I

    mul-int/lit16 v5, v5, 0x3e8

    invoke-virtual {v3, v5}, Landroid/widget/SeekBar;->setMax(I)V

    .line 631
    iget-wide v6, p1, Lcom/vkontakte/android/api/VideoFile;->seekToMs:J

    const-wide/16 v8, 0x0

    cmp-long v3, v6, v8

    if-lez v3, :cond_0

    .line 632
    iget-wide v6, p1, Lcom/vkontakte/android/api/VideoFile;->seekToMs:J

    long-to-int v3, v6

    iput v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->needSeekTo:I

    .line 634
    :cond_0
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->isExternal()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 635
    iget-object v3, p1, Lcom/vkontakte/android/api/VideoFile;->urlExternal:Ljava/lang/String;

    if-nez v3, :cond_1

    .line 636
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->finish()V

    .line 706
    :goto_0
    return-void

    .line 639
    :cond_1
    const-string/jumbo v3, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "ext="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p1, Lcom/vkontakte/android/api/VideoFile;->urlExternal:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "; embed="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p1, Lcom/vkontakte/android/api/VideoFile;->urlEmbed:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 640
    iget-object v3, p1, Lcom/vkontakte/android/api/VideoFile;->urlEmbed:Ljava/lang/String;

    if-eqz v3, :cond_5

    .line 641
    const-string/jumbo v3, "YouTube"

    iget-object v4, p1, Lcom/vkontakte/android/api/VideoFile;->platform:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 642
    new-instance v0, Landroid/content/Intent;

    const-class v3, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    invoke-direct {v0, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 643
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/content/Intent;->putExtras(Landroid/content/Intent;)Landroid/content/Intent;

    .line 644
    const-string/jumbo v3, "file"

    invoke-virtual {v0, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 645
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->startActivity(Landroid/content/Intent;)V

    .line 646
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->finish()V

    goto :goto_0

    .line 649
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_2
    iget-boolean v3, p1, Lcom/vkontakte/android/api/VideoFile;->processing:Z

    if-eqz v3, :cond_3

    .line 650
    invoke-virtual {p0, v10}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->displayError(I)V

    goto :goto_0

    .line 651
    :cond_3
    iget-boolean v3, p1, Lcom/vkontakte/android/api/VideoFile;->contentRestricted:Z

    if-eqz v3, :cond_4

    .line 652
    invoke-virtual {p0, v11}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->displayError(I)V

    goto :goto_0

    .line 654
    :cond_4
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playEmbed()V

    goto :goto_0

    .line 657
    :cond_5
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v3, "android.intent.action.VIEW"

    iget-object v4, p1, Lcom/vkontakte/android/api/VideoFile;->urlExternal:Ljava/lang/String;

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v0, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 659
    .restart local v0    # "intent":Landroid/content/Intent;
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->startActivity(Landroid/content/Intent;)V

    .line 660
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 661
    :catch_0
    move-exception v3

    goto :goto_0

    .line 664
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_6
    invoke-static {}, Lcom/vkontakte/android/cache/Videos;->getMaxSupportedQuality()I

    move-result v1

    .line 666
    .local v1, "mq":I
    iget-object v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->qualityMenu:Landroid/support/v7/widget/PopupMenu;

    invoke-virtual {v3}, Landroid/support/v7/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/Menu;->clear()V

    .line 668
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->isHLSSupported()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->isFlv()Z

    move-result v3

    if-nez v3, :cond_7

    .line 669
    iget-object v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->qualityMenu:Landroid/support/v7/widget/PopupMenu;

    invoke-virtual {v3}, Landroid/support/v7/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    const/4 v5, -0x2

    const/4 v6, -0x2

    invoke-static {v6}, Lcom/vkontakte/android/cache/Videos;->formatQuality(I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v4, v5, v4, v6}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 671
    :cond_7
    iget-object v3, p1, Lcom/vkontakte/android/api/VideoFile;->url240:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_8

    if-lt v1, v12, :cond_8

    .line 672
    iget-object v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->qualityMenu:Landroid/support/v7/widget/PopupMenu;

    invoke-virtual {v3}, Landroid/support/v7/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    invoke-static {v12}, Lcom/vkontakte/android/cache/Videos;->formatQuality(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v12, v12, v5}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 674
    :cond_8
    iget-object v3, p1, Lcom/vkontakte/android/api/VideoFile;->url360:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_9

    if-lt v1, v13, :cond_9

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->isFlv()Z

    move-result v3

    if-nez v3, :cond_9

    .line 675
    iget-object v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->qualityMenu:Landroid/support/v7/widget/PopupMenu;

    invoke-virtual {v3}, Landroid/support/v7/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    invoke-static {v13}, Lcom/vkontakte/android/cache/Videos;->formatQuality(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v13, v13, v5}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 677
    :cond_9
    iget-object v3, p1, Lcom/vkontakte/android/api/VideoFile;->url480:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_a

    if-lt v1, v10, :cond_a

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->isFlv()Z

    move-result v3

    if-nez v3, :cond_a

    .line 678
    iget-object v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->qualityMenu:Landroid/support/v7/widget/PopupMenu;

    invoke-virtual {v3}, Landroid/support/v7/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    invoke-static {v10}, Lcom/vkontakte/android/cache/Videos;->formatQuality(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v10, v10, v5}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 680
    :cond_a
    iget-object v3, p1, Lcom/vkontakte/android/api/VideoFile;->url720:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_b

    const/4 v3, 0x5

    if-lt v1, v3, :cond_b

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->isFlv()Z

    move-result v3

    if-nez v3, :cond_b

    .line 681
    iget-object v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->qualityMenu:Landroid/support/v7/widget/PopupMenu;

    invoke-virtual {v3}, Landroid/support/v7/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    const/4 v5, 0x5

    const/4 v6, 0x5

    const/4 v7, 0x5

    invoke-static {v7}, Lcom/vkontakte/android/cache/Videos;->formatQuality(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v3, v4, v5, v6, v7}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 683
    :cond_b
    iget-object v3, p1, Lcom/vkontakte/android/api/VideoFile;->url1080:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_c

    if-lt v1, v11, :cond_c

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->isFlv()Z

    move-result v3

    if-nez v3, :cond_c

    .line 684
    iget-object v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->qualityMenu:Landroid/support/v7/widget/PopupMenu;

    invoke-virtual {v3}, Landroid/support/v7/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    invoke-static {v11}, Lcom/vkontakte/android/cache/Videos;->formatQuality(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v11, v11, v5}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 686
    :cond_c
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->qualitySelector:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->qualityMenu:Landroid/support/v7/widget/PopupMenu;

    invoke-virtual {v3}, Landroid/support/v7/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/Menu;->size()I

    move-result v3

    const/4 v6, 0x1

    if-le v3, v6, :cond_d

    move v3, v4

    :goto_1
    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 688
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string/jumbo v5, "quality"

    iget v6, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->curQuality:I

    invoke-virtual {v3, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 689
    .local v2, "quality":I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_e

    .line 690
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->switchQuality(I)V

    goto/16 :goto_0

    .line 686
    .end local v2    # "quality":I
    :cond_d
    const/16 v3, 0x8

    goto :goto_1

    .line 692
    .restart local v2    # "quality":I
    :cond_e
    new-instance v3, Lcom/vkontakte/android/activities/VideoPlayerActivity$16;

    invoke-direct {v3, p0, p1}, Lcom/vkontakte/android/activities/VideoPlayerActivity$16;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;Lcom/vkontakte/android/api/VideoFile;)V

    new-array v4, v4, [Ljava/lang/Void;

    .line 703
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/activities/VideoPlayerActivity$16;->execPool([Ljava/lang/Object;)Lcom/vkontakte/android/background/AsyncTask;

    goto/16 :goto_0
.end method

.method switchQuality(I)V
    .locals 11
    .param p1, "quality"    # I
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x1

    const/4 v4, -0x1

    const/4 v3, 0x0

    .line 724
    iget v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->curQuality:I

    if-eq p1, v1, :cond_0

    if-eq p1, v4, :cond_0

    iget-boolean v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->completed:Z

    if-eqz v1, :cond_1

    .line 764
    :cond_0
    :goto_0
    return-void

    .line 728
    :cond_1
    iput p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->curQuality:I

    .line 729
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-eqz v1, :cond_2

    .line 730
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-virtual {v1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->getPosition()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->needSeekTo:I

    .line 731
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getVideo()Lcom/vkontakte/android/api/VideoFile;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getVideoIndex()I

    move-result v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/media/VideoPools;->detachAndReleasePlayer(Lcom/vkontakte/android/api/VideoFile;I)V

    .line 732
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    .line 734
    :cond_2
    new-instance v8, Landroid/text/SpannableStringBuilder;

    invoke-static {p1}, Lcom/vkontakte/android/cache/Videos;->formatQuality(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v8, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 735
    .local v8, "bldr":Landroid/text/SpannableStringBuilder;
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v1

    const-string/jumbo v2, "F"

    invoke-virtual {v1, v2}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v10

    .line 736
    .local v10, "sp":Landroid/text/Spannable;
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020254

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    .line 737
    .local v9, "d":Landroid/graphics/drawable/Drawable;
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v9, v4, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 738
    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    invoke-virtual {v9, v3, v3, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 739
    const/16 v1, 0x2710

    invoke-virtual {v9, v1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 740
    new-instance v1, Landroid/text/style/ImageSpan;

    invoke-direct {v1, v9, v5}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-interface {v10, v1, v3, v5, v3}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 741
    const-string/jumbo v1, " "

    invoke-virtual {v8, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 742
    invoke-virtual {v8, v10}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 743
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->qualitySelector:Landroid/widget/TextView;

    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 745
    invoke-virtual {p0, v3}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->setUIVisibility(Z)V

    .line 746
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playButton:Landroid/widget/ImageView;

    invoke-virtual {v1, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 747
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playButton:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setClickable(Z)V

    .line 748
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getVideo()Lcom/vkontakte/android/api/VideoFile;

    move-result-object v0

    .line 750
    .local v0, "file":Lcom/vkontakte/android/api/VideoFile;
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VideoFile;->isFlv()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 751
    const/4 v1, 0x7

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->displayError(I)V

    goto/16 :goto_0

    .line 754
    :cond_3
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VideoFile;->isLiveUpcoming()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 755
    const/4 v1, 0x5

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->displayError(I)V

    goto/16 :goto_0

    .line 758
    :cond_4
    iget v1, v0, Lcom/vkontakte/android/api/VideoFile;->liveStatus:I

    if-ne v1, v6, :cond_5

    .line 759
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->displayError(I)V

    goto/16 :goto_0

    .line 762
    :cond_5
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getVideoIndex()I

    move-result v1

    invoke-static {v0, p1}, Lcom/vkontakte/android/cache/Videos;->getUrl(Lcom/vkontakte/android/api/VideoFile;I)Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->curQuality:I

    iget-object v4, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->useVigo:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 763
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v4

    iget-boolean v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->isAutoplay:Z

    iget-object v6, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->referrer:Ljava/lang/String;

    move-object v7, p0

    .line 762
    invoke-static/range {v0 .. v7}, Lcom/vkontakte/android/media/VideoPools;->obtainAndAttachPlayer(Lcom/vkontakte/android/api/VideoFile;ILjava/lang/String;IZZLjava/lang/String;Lcom/vkontakte/android/media/VideoPools$PlayerContext;)V

    goto/16 :goto_0
.end method

.method togglePlay()V
    .locals 1

    .prologue
    .line 922
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playing:Z

    if-eqz v0, :cond_1

    .line 923
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->pause()V

    .line 924
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    if-eqz v0, :cond_0

    .line 925
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/VideoTracker;->trackPause()V

    .line 933
    :cond_0
    :goto_0
    return-void

    .line 928
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->play(Z)V

    .line 929
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    if-eqz v0, :cond_0

    .line 930
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->mTracker:Lcom/vkontakte/android/media/VideoTracker;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/VideoTracker;->trackResume()V

    goto :goto_0
.end method

.method updateEndMenuIcons()V
    .locals 8

    .prologue
    const/4 v4, -0x1

    const v3, -0x6e400e

    .line 812
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getVideo()Lcom/vkontakte/android/api/VideoFile;

    move-result-object v0

    .line 813
    .local v0, "file":Lcom/vkontakte/android/api/VideoFile;
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->endMenu:Landroid/view/View;

    const v2, 0x7f10058b

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    new-instance v5, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v6, 0x7f0201d8

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    iget-boolean v2, v0, Lcom/vkontakte/android/api/VideoFile;->liked:Z

    if-eqz v2, :cond_2

    move v2, v3

    :goto_0
    invoke-direct {v5, v6, v2}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 814
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->endMenu:Landroid/view/View;

    const v2, 0x7f10058c

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    new-instance v2, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020160

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    iget v6, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->addedID:I

    if-nez v6, :cond_0

    iget v6, v0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v7

    invoke-virtual {v7}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v7

    if-ne v6, v7, :cond_1

    :cond_0
    move v4, v3

    :cond_1
    invoke-direct {v2, v5, v4}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 815
    return-void

    :cond_2
    move v2, v4

    .line 813
    goto :goto_0
.end method

.method updatePlayButton()V
    .locals 1

    .prologue
    .line 949
    new-instance v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$20;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$20;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 955
    return-void
.end method

.method updateTextureViewScale()V
    .locals 2

    .prologue
    .line 1020
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    if-nez v0, :cond_0

    .line 1054
    :goto_0
    return-void

    .line 1023
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    goto :goto_0
.end method

.method updateTimings(I)V
    .locals 6
    .param p1, "msec"    # I

    .prologue
    .line 976
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getVideo()Lcom/vkontakte/android/api/VideoFile;

    move-result-object v1

    .line 977
    .local v1, "file":Lcom/vkontakte/android/api/VideoFile;
    iget v3, v1, Lcom/vkontakte/android/api/VideoFile;->duration:I

    div-int/lit16 v4, p1, 0x3e8

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 978
    .local v2, "sec":I
    iget-object v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->time1:Landroid/widget/TextView;

    invoke-static {v2}, Lcom/vkontakte/android/cache/Videos;->formatDuration(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 979
    iget v3, v1, Lcom/vkontakte/android/api/VideoFile;->duration:I

    sub-int v0, v3, v2

    .line 980
    .local v0, "eta":I
    iget-object v4, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->time2:Landroid/widget/TextView;

    if-nez v0, :cond_0

    invoke-static {v0}, Lcom/vkontakte/android/cache/Videos;->formatDuration(I)Ljava/lang/String;

    move-result-object v3

    :goto_0
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 981
    return-void

    .line 980
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "-"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v0}, Lcom/vkontakte/android/cache/Videos;->formatDuration(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method
