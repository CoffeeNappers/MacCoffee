.class public Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;
.super Lcom/vkontakte/android/activities/BaseVideoActivity;
.source "YouTubeVideoPlayerActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$PlayerStateListener;
    }
.end annotation


# instance fields
.field private fragment:Lcom/google/android/youtube/player/YouTubePlayerFragment;

.field private mHideUiAction:Ljava/lang/Runnable;

.field private player:Lcom/google/android/youtube/player/YouTubePlayer;

.field private uiVisible:Z

.field private visibilityAnim:Landroid/animation/Animator;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;-><init>()V

    return-void
.end method

.method static synthetic access$002(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;Lcom/google/android/youtube/player/YouTubePlayer;)Lcom/google/android/youtube/player/YouTubePlayer;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;
    .param p1, "x1"    # Lcom/google/android/youtube/player/YouTubePlayer;

    .prologue
    .line 24
    iput-object p1, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->player:Lcom/google/android/youtube/player/YouTubePlayer;

    return-object p1
.end method

.method static synthetic access$200(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;)Lcom/google/android/youtube/player/YouTubePlayerFragment;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->fragment:Lcom/google/android/youtube/player/YouTubePlayerFragment;

    return-object v0
.end method

.method static synthetic access$300(Lcom/google/android/youtube/player/YouTubePlayerFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/youtube/player/YouTubePlayerFragment;

    .prologue
    .line 24
    invoke-static {p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->hideAdsText(Lcom/google/android/youtube/player/YouTubePlayerFragment;)V

    return-void
.end method

.method static synthetic access$400(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->isLandscape()Z

    move-result v0

    return v0
.end method

.method static synthetic access$502(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;Landroid/animation/Animator;)Landroid/animation/Animator;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;
    .param p1, "x1"    # Landroid/animation/Animator;

    .prologue
    .line 24
    iput-object p1, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->visibilityAnim:Landroid/animation/Animator;

    return-object p1
.end method

.method static synthetic access$600(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->releasePlayer()V

    return-void
.end method

.method private static hideAdsText(Lcom/google/android/youtube/player/YouTubePlayerFragment;)V
    .locals 2
    .param p0, "fragment"    # Lcom/google/android/youtube/player/YouTubePlayerFragment;

    .prologue
    .line 272
    .line 273
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/youtube/player/YouTubePlayerFragment;->getView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    .line 274
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 277
    :goto_0
    return-void

    .line 275
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private initPlayer(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 3
    .param p1, "file"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 105
    new-instance v0, Lcom/google/android/youtube/player/YouTubePlayerFragment;

    invoke-direct {v0}, Lcom/google/android/youtube/player/YouTubePlayerFragment;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->fragment:Lcom/google/android/youtube/player/YouTubePlayerFragment;

    .line 106
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v0

    const v1, 0x7f100201

    iget-object v2, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->fragment:Lcom/google/android/youtube/player/YouTubePlayerFragment;

    invoke-virtual {v0, v1, v2}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commit()I

    .line 107
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->fragment:Lcom/google/android/youtube/player/YouTubePlayerFragment;

    const-string/jumbo v1, "AIzaSyCxCklrOsCwTiBbmrT38Q0Wl-buN_uuz54"

    new-instance v2, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$1;

    invoke-direct {v2, p0, p1}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$1;-><init>(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;Lcom/vkontakte/android/api/VideoFile;)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/youtube/player/YouTubePlayerFragment;->initialize(Ljava/lang/String;Lcom/google/android/youtube/player/YouTubePlayer$OnInitializedListener;)V

    .line 129
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->setUIVisibility(Z)V

    .line 130
    return-void
.end method

.method private isLandscape()Z
    .locals 2

    .prologue
    .line 267
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private releasePlayer()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 133
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->player:Lcom/google/android/youtube/player/YouTubePlayer;

    if-eqz v0, :cond_0

    .line 134
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->player:Lcom/google/android/youtube/player/YouTubePlayer;

    invoke-interface {v0}, Lcom/google/android/youtube/player/YouTubePlayer;->release()V

    .line 135
    iput-object v1, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->player:Lcom/google/android/youtube/player/YouTubePlayer;

    .line 136
    iput-object v1, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->fragment:Lcom/google/android/youtube/player/YouTubePlayerFragment;

    .line 138
    :cond_0
    return-void
.end method


# virtual methods
.method addVideo()V
    .locals 1

    .prologue
    .line 154
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->addVideo(Z)V

    .line 155
    return-void
.end method

.method bindInfo(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 11
    .param p1, "file"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    const v10, 0x7f100592

    const v9, 0x7f100590

    const/4 v7, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 242
    invoke-virtual {p0, v7}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->setBottomPanelVisible(Z)V

    .line 243
    invoke-virtual {p0, v9}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-boolean v4, p1, Lcom/vkontakte/android/api/VideoFile;->liked:Z

    invoke-virtual {v1, v4}, Landroid/view/View;->setSelected(Z)V

    .line 244
    invoke-virtual {p0, v10}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iget-boolean v1, p1, Lcom/vkontakte/android/api/VideoFile;->canRepost:Z

    if-nez v1, :cond_1

    const/16 v1, 0x8

    :goto_0
    invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

    .line 245
    const v1, 0x7f100128

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->getTitle()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 246
    const v1, 0x7f10019c

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0d0060

    iget v6, p1, Lcom/vkontakte/android/api/VideoFile;->views:I

    new-array v7, v7, [Ljava/lang/Object;

    iget v8, p1, Lcom/vkontakte/android/api/VideoFile;->views:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v2

    invoke-virtual {v4, v5, v6, v7}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 247
    invoke-virtual {p0, v9}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget v2, p1, Lcom/vkontakte/android/api/VideoFile;->likes:I

    if-lez v2, :cond_2

    iget v2, p1, Lcom/vkontakte/android/api/VideoFile;->likes:I

    invoke-static {v2}, Lcom/vkontakte/android/Global;->formatNumber(I)Ljava/lang/String;

    move-result-object v2

    :goto_1
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 248
    const v1, 0x7f100591

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget v2, p1, Lcom/vkontakte/android/api/VideoFile;->comments:I

    if-lez v2, :cond_3

    iget v2, p1, Lcom/vkontakte/android/api/VideoFile;->comments:I

    invoke-static {v2}, Lcom/vkontakte/android/Global;->formatNumber(I)Ljava/lang/String;

    move-result-object v2

    :goto_2
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 249
    invoke-virtual {p0, v10}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget v2, p1, Lcom/vkontakte/android/api/VideoFile;->reposts:I

    if-lez v2, :cond_4

    iget v2, p1, Lcom/vkontakte/android/api/VideoFile;->reposts:I

    invoke-static {v2}, Lcom/vkontakte/android/Global;->formatNumber(I)Ljava/lang/String;

    move-result-object v2

    :goto_3
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 250
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->invalidateOptionsMenu()V

    .line 251
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 252
    .local v0, "actionBar":Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_0

    .line 253
    iget-boolean v1, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->landscape:Z

    if-nez v1, :cond_5

    .line 254
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v1

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VideoFile;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 259
    :cond_0
    :goto_4
    return-void

    .end local v0    # "actionBar":Landroid/support/v7/app/ActionBar;
    :cond_1
    move v1, v2

    .line 244
    goto/16 :goto_0

    :cond_2
    move-object v2, v3

    .line 247
    goto :goto_1

    :cond_3
    move-object v2, v3

    .line 248
    goto :goto_2

    :cond_4
    move-object v2, v3

    .line 249
    goto :goto_3

    .line 256
    .restart local v0    # "actionBar":Landroid/support/v7/app/ActionBar;
    :cond_5
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/support/v7/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_4
.end method

.method blockingSetUIVisibility(Z)V
    .locals 3
    .param p1, "visible"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 142
    if-eqz p1, :cond_0

    .line 143
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/Toolbar;->setVisibility(I)V

    .line 144
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->setUIVisibility(Z)V

    .line 145
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->setBottomPanelVisible(Z)V

    .line 150
    :goto_0
    return-void

    .line 147
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setVisibility(I)V

    .line 148
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->setBottomPanelVisible(Z)V

    goto :goto_0
.end method

.method cancelHideUI()V
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->mHideUiAction:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 93
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->mHideUiAction:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->cancelRunnable(Ljava/lang/Runnable;)Z

    .line 94
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->mHideUiAction:Ljava/lang/Runnable;

    .line 96
    :cond_0
    return-void
.end method

.method createUI(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 220
    const v0, 0x7f03022b

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->setContentView(I)V

    .line 221
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->changingSysUiVisibility:Z

    .line 222
    const v0, 0x7f100593

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 228
    return-void
.end method

.method getHideDelay()I
    .locals 1

    .prologue
    .line 263
    const/16 v0, 0x9c4

    return v0
.end method

.method hideUIDelayed(I)V
    .locals 1
    .param p1, "delay"    # I

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->mHideUiAction:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 82
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->mHideUiAction:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->cancelRunnable(Ljava/lang/Runnable;)Z

    .line 84
    :cond_0
    invoke-static {p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;)Ljava/lang/Runnable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->mHideUiAction:Ljava/lang/Runnable;

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->postRunnable(Ljava/lang/Runnable;I)Z

    .line 88
    return-void
.end method

.method synthetic lambda$createUI$1(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 223
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->uiVisible:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->setUIVisibility(Z)V

    .line 224
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->uiVisible:Z

    if-eqz v0, :cond_0

    .line 225
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->getHideDelay()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->hideUIDelayed(I)V

    .line 227
    :cond_0
    return-void

    .line 223
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$hideUIDelayed$0()V
    .locals 1

    .prologue
    .line 85
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->setUIVisibility(Z)V

    .line 86
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->mHideUiAction:Ljava/lang/Runnable;

    .line 87
    return-void
.end method

.method onAddedStateChanged()V
    .locals 0

    .prologue
    .line 233
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 44
    invoke-super {p0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->player:Lcom/google/android/youtube/player/YouTubePlayer;

    if-eqz v0, :cond_0

    .line 46
    invoke-direct {p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->isLandscape()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 47
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->player:Lcom/google/android/youtube/player/YouTubePlayer;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/google/android/youtube/player/YouTubePlayer;->setFullscreen(Z)V

    .line 52
    :cond_0
    :goto_0
    return-void

    .line 49
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->player:Lcom/google/android/youtube/player/YouTubePlayer;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/google/android/youtube/player/YouTubePlayer;->setFullscreen(Z)V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 36
    if-eqz p1, :cond_0

    .line 37
    const-string/jumbo v0, "android:fragments"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 39
    :cond_0
    invoke-super {p0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->onCreate(Landroid/os/Bundle;)V

    .line 40
    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 56
    invoke-super {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->onDestroy()V

    .line 57
    invoke-direct {p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->releasePlayer()V

    .line 58
    return-void
.end method

.method onLikeStateChanged()V
    .locals 0

    .prologue
    .line 238
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 62
    invoke-super {p0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->onResume()V

    .line 63
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->getVideo()Lcom/vkontakte/android/api/VideoFile;

    move-result-object v0

    .line 64
    .local v0, "file":Lcom/vkontakte/android/api/VideoFile;
    iget-object v1, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->fragment:Lcom/google/android/youtube/player/YouTubePlayerFragment;

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->player:Lcom/google/android/youtube/player/YouTubePlayer;

    if-nez v1, :cond_0

    if-eqz v0, :cond_0

    .line 65
    invoke-direct {p0, v0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->initPlayer(Lcom/vkontakte/android/api/VideoFile;)V

    .line 67
    :cond_0
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 72
    :try_start_0
    invoke-super {p0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->onSaveInstanceState(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    :goto_0
    return-void

    .line 73
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method setUIVisibility(Z)V
    .locals 9
    .param p1, "visible"    # Z

    .prologue
    const/4 v3, 0x2

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 159
    iget-boolean v1, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->uiVisible:Z

    if-eq v1, p1, :cond_0

    invoke-direct {p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->isLandscape()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 216
    :cond_0
    :goto_0
    return-void

    .line 162
    :cond_1
    iput-boolean p1, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->uiVisible:Z

    .line 163
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->cancelHideUI()V

    .line 165
    iget-object v1, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->visibilityAnim:Landroid/animation/Animator;

    if-eqz v1, :cond_2

    .line 166
    iget-object v1, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->visibilityAnim:Landroid/animation/Animator;

    invoke-virtual {v1}, Landroid/animation/Animator;->cancel()V

    .line 168
    :cond_2
    iput-boolean v5, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->changingSysUiVisibility:Z

    .line 169
    if-eqz p1, :cond_3

    .line 170
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v2

    and-int/lit8 v2, v2, -0x7

    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 172
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 173
    .local v0, "set":Landroid/animation/AnimatorSet;
    new-array v1, v3, [Landroid/animation/Animator;

    iget-object v2, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    const-string/jumbo v3, "alpha"

    new-array v4, v5, [F

    aput v8, v4, v6

    .line 174
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v6

    iget-object v2, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->bottomPanel:Landroid/view/View;

    const-string/jumbo v3, "alpha"

    new-array v4, v5, [F

    aput v8, v4, v6

    .line 175
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v5

    .line 173
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 177
    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 178
    sget-object v1, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->interpolatorOut:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 179
    iput-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->visibilityAnim:Landroid/animation/Animator;

    .line 180
    new-instance v1, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$2;-><init>(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 192
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    goto :goto_0

    .line 194
    .end local v0    # "set":Landroid/animation/AnimatorSet;
    :cond_3
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v2

    or-int/lit8 v2, v2, 0x4

    or-int/lit8 v2, v2, 0x2

    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 196
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 197
    .restart local v0    # "set":Landroid/animation/AnimatorSet;
    new-array v1, v3, [Landroid/animation/Animator;

    iget-object v2, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    const-string/jumbo v3, "alpha"

    new-array v4, v5, [F

    aput v7, v4, v6

    .line 198
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v6

    iget-object v2, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->bottomPanel:Landroid/view/View;

    const-string/jumbo v3, "alpha"

    new-array v4, v5, [F

    aput v7, v4, v6

    .line 199
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v5

    .line 197
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 201
    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 202
    sget-object v1, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->interpolatorIn:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 203
    iput-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->visibilityAnim:Landroid/animation/Animator;

    .line 204
    new-instance v1, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$3;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$3;-><init>(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 214
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    goto/16 :goto_0
.end method

.method startFile(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 0
    .param p1, "file"    # Lcom/vkontakte/android/api/VideoFile;
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 101
    invoke-direct {p0, p1}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->initPlayer(Lcom/vkontakte/android/api/VideoFile;)V

    .line 102
    return-void
.end method
