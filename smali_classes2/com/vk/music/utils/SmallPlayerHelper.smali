.class public Lcom/vk/music/utils/SmallPlayerHelper;
.super Lcom/vkontakte/android/audio/player/PlayerListener$PlayerListenerAdapter;
.source "SmallPlayerHelper.java"


# instance fields
.field private container:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private info:Lcom/vkontakte/android/audio/player/TrackInfo;

.field private keyBoardShowed:Z

.field private player:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/vk/music/view/SmallPlayerView;",
            ">;"
        }
    .end annotation
.end field

.field private shadow:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private state:Lcom/vkontakte/android/audio/player/PlayerState;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/PlayerListener$PlayerListenerAdapter;-><init>()V

    .line 26
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerState;->IDLE:Lcom/vkontakte/android/audio/player/PlayerState;

    iput-object v0, p0, Lcom/vk/music/utils/SmallPlayerHelper;->state:Lcom/vkontakte/android/audio/player/PlayerState;

    .line 28
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/music/utils/SmallPlayerHelper;->keyBoardShowed:Z

    return-void
.end method

.method private syncVisibilityPlayer()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v4, 0x0

    const/16 v5, 0x8

    .line 69
    iget-object v3, p0, Lcom/vk/music/utils/SmallPlayerHelper;->state:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/vk/music/utils/SmallPlayerHelper;->info:Lcom/vkontakte/android/audio/player/TrackInfo;

    if-nez v3, :cond_1

    .line 92
    :cond_0
    :goto_0
    return-void

    .line 72
    :cond_1
    iget-object v3, p0, Lcom/vk/music/utils/SmallPlayerHelper;->player:Ljava/lang/ref/WeakReference;

    if-nez v3, :cond_2

    move-object v2, v4

    .line 73
    .local v2, "smallPlayerView":Lcom/vk/music/view/SmallPlayerView;
    :goto_1
    iget-object v3, p0, Lcom/vk/music/utils/SmallPlayerHelper;->shadow:Ljava/lang/ref/WeakReference;

    if-nez v3, :cond_3

    move-object v1, v4

    .line 74
    .local v1, "shadowView":Landroid/view/View;
    :goto_2
    iget-object v3, p0, Lcom/vk/music/utils/SmallPlayerHelper;->container:Ljava/lang/ref/WeakReference;

    if-nez v3, :cond_4

    move-object v0, v4

    .line 75
    .local v0, "containerView":Landroid/view/View;
    :goto_3
    if-eqz v2, :cond_6

    if-eqz v1, :cond_6

    if-eqz v0, :cond_6

    .line 76
    iget-object v3, p0, Lcom/vk/music/utils/SmallPlayerHelper;->state:Lcom/vkontakte/android/audio/player/PlayerState;

    iget-object v4, p0, Lcom/vk/music/utils/SmallPlayerHelper;->info:Lcom/vkontakte/android/audio/player/TrackInfo;

    invoke-virtual {v2, v3, v4}, Lcom/vk/music/view/SmallPlayerView;->bind(Lcom/vkontakte/android/audio/player/PlayerState;Lcom/vkontakte/android/audio/player/TrackInfo;)V

    .line 78
    iget-object v3, p0, Lcom/vk/music/utils/SmallPlayerHelper;->state:Lcom/vkontakte/android/audio/player/PlayerState;

    sget-object v4, Lcom/vkontakte/android/audio/player/PlayerState;->STOPPED:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq v3, v4, :cond_5

    iget-object v3, p0, Lcom/vk/music/utils/SmallPlayerHelper;->state:Lcom/vkontakte/android/audio/player/PlayerState;

    sget-object v4, Lcom/vkontakte/android/audio/player/PlayerState;->IDLE:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq v3, v4, :cond_5

    iget-boolean v3, p0, Lcom/vk/music/utils/SmallPlayerHelper;->keyBoardShowed:Z

    if-nez v3, :cond_5

    .line 79
    invoke-virtual {v2}, Lcom/vk/music/view/SmallPlayerView;->getVisibility()I

    move-result v3

    if-eqz v3, :cond_0

    .line 80
    invoke-virtual {v2, v6}, Lcom/vk/music/view/SmallPlayerView;->setVisibility(I)V

    .line 81
    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 82
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    const/high16 v4, 0x42800000    # 64.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    iput v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    goto :goto_0

    .line 72
    .end local v0    # "containerView":Landroid/view/View;
    .end local v1    # "shadowView":Landroid/view/View;
    .end local v2    # "smallPlayerView":Lcom/vk/music/view/SmallPlayerView;
    :cond_2
    iget-object v3, p0, Lcom/vk/music/utils/SmallPlayerHelper;->player:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vk/music/view/SmallPlayerView;

    move-object v2, v3

    goto :goto_1

    .line 73
    .restart local v2    # "smallPlayerView":Lcom/vk/music/view/SmallPlayerView;
    :cond_3
    iget-object v3, p0, Lcom/vk/music/utils/SmallPlayerHelper;->shadow:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    move-object v1, v3

    goto :goto_2

    .line 74
    .restart local v1    # "shadowView":Landroid/view/View;
    :cond_4
    iget-object v3, p0, Lcom/vk/music/utils/SmallPlayerHelper;->container:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    move-object v0, v3

    goto :goto_3

    .line 84
    .restart local v0    # "containerView":Landroid/view/View;
    :cond_5
    invoke-virtual {v2}, Lcom/vk/music/view/SmallPlayerView;->getVisibility()I

    move-result v3

    if-eq v3, v5, :cond_0

    .line 85
    invoke-virtual {v2, v5}, Lcom/vk/music/view/SmallPlayerView;->setVisibility(I)V

    .line 86
    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 87
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v4, 0x0

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    iput v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    goto :goto_0

    .line 90
    :cond_6
    invoke-static {p0}, Lcom/vk/music/utils/SmallPlayerHelper$$Lambda$2;->lambdaFactory$(Lcom/vk/music/utils/SmallPlayerHelper;)Ljava/lang/Runnable;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/ViewUtils;->post(Ljava/lang/Runnable;)V

    goto/16 :goto_0
.end method


# virtual methods
.method synthetic lambda$onCreateView$0(Z)V
    .locals 0
    .param p1, "visible"    # Z

    .prologue
    .line 39
    iput-boolean p1, p0, Lcom/vk/music/utils/SmallPlayerHelper;->keyBoardShowed:Z

    .line 40
    invoke-direct {p0}, Lcom/vk/music/utils/SmallPlayerHelper;->syncVisibilityPlayer()V

    .line 41
    return-void
.end method

.method public onBufferingProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 2
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 96
    iget-object v1, p0, Lcom/vk/music/utils/SmallPlayerHelper;->player:Ljava/lang/ref/WeakReference;

    if-nez v1, :cond_1

    const/4 v0, 0x0

    .line 97
    .local v0, "smallPlayerView":Lcom/vk/music/view/SmallPlayerView;
    :goto_0
    if-eqz v0, :cond_0

    .line 98
    invoke-virtual {v0, p1}, Lcom/vk/music/view/SmallPlayerView;->onBufferingProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V

    .line 100
    :cond_0
    return-void

    .line 96
    .end local v0    # "smallPlayerView":Lcom/vk/music/view/SmallPlayerView;
    :cond_1
    iget-object v1, p0, Lcom/vk/music/utils/SmallPlayerHelper;->player:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/music/view/SmallPlayerView;

    move-object v0, v1

    goto :goto_0
.end method

.method public onCreateView(Landroid/view/View;)Landroid/view/View;
    .locals 7
    .param p1, "innerView"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x0

    .line 31
    if-nez p1, :cond_0

    .line 54
    :goto_0
    return-object v4

    .line 34
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 35
    .local v1, "inflater":Landroid/view/LayoutInflater;
    const v5, 0x7f030155

    invoke-virtual {v1, v5, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .line 37
    .local v4, "view":Landroid/view/View;
    const v5, 0x7f1003f4

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/ui/XFrameLayout;

    .line 38
    .local v2, "layout":Lcom/vkontakte/android/ui/XFrameLayout;
    invoke-static {p0}, Lcom/vk/music/utils/SmallPlayerHelper$$Lambda$1;->lambdaFactory$(Lcom/vk/music/utils/SmallPlayerHelper;)Lcom/vkontakte/android/ui/XFrameLayout$OnKeyboardStateChangeListener;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/vkontakte/android/ui/XFrameLayout;->setOnKeyboardStateListener(Lcom/vkontakte/android/ui/XFrameLayout$OnKeyboardStateChangeListener;)V

    .line 43
    const v5, 0x7f1003f5

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 44
    .local v0, "containerView":Landroid/view/ViewGroup;
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 46
    const v5, 0x7f1003f7

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/vk/music/view/SmallPlayerView;

    .line 48
    .local v3, "smallPlayerView":Lcom/vk/music/view/SmallPlayerView;
    new-instance v5, Ljava/lang/ref/WeakReference;

    invoke-direct {v5, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v5, p0, Lcom/vk/music/utils/SmallPlayerHelper;->player:Ljava/lang/ref/WeakReference;

    .line 49
    new-instance v5, Ljava/lang/ref/WeakReference;

    const v6, 0x7f1003f6

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v5, p0, Lcom/vk/music/utils/SmallPlayerHelper;->shadow:Ljava/lang/ref/WeakReference;

    .line 50
    new-instance v5, Ljava/lang/ref/WeakReference;

    invoke-direct {v5, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v5, p0, Lcom/vk/music/utils/SmallPlayerHelper;->container:Ljava/lang/ref/WeakReference;

    .line 52
    const/4 v5, 0x1

    invoke-static {p0, v5}, Lcom/vkontakte/android/audio/AudioFacade;->addPlayerListener(Lcom/vkontakte/android/audio/player/PlayerListener;Z)V

    goto :goto_0
.end method

.method public onDestroyView()V
    .locals 0

    .prologue
    .line 58
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioFacade;->removePlayerListener(Lcom/vkontakte/android/audio/player/PlayerListener;)V

    .line 59
    return-void
.end method

.method public onProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 2
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 104
    iget-object v1, p0, Lcom/vk/music/utils/SmallPlayerHelper;->player:Ljava/lang/ref/WeakReference;

    if-nez v1, :cond_1

    const/4 v0, 0x0

    .line 105
    .local v0, "smallPlayerView":Lcom/vk/music/view/SmallPlayerView;
    :goto_0
    if-eqz v0, :cond_0

    .line 106
    invoke-virtual {v0, p1}, Lcom/vk/music/view/SmallPlayerView;->onProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V

    .line 108
    :cond_0
    return-void

    .line 104
    .end local v0    # "smallPlayerView":Lcom/vk/music/view/SmallPlayerView;
    :cond_1
    iget-object v1, p0, Lcom/vk/music/utils/SmallPlayerHelper;->player:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/music/view/SmallPlayerView;

    move-object v0, v1

    goto :goto_0
.end method

.method public onStateChanged(Lcom/vkontakte/android/audio/player/PlayerState;Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 0
    .param p1, "state"    # Lcom/vkontakte/android/audio/player/PlayerState;
    .param p2, "info"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/vk/music/utils/SmallPlayerHelper;->state:Lcom/vkontakte/android/audio/player/PlayerState;

    .line 64
    iput-object p2, p0, Lcom/vk/music/utils/SmallPlayerHelper;->info:Lcom/vkontakte/android/audio/player/TrackInfo;

    .line 65
    invoke-direct {p0}, Lcom/vk/music/utils/SmallPlayerHelper;->syncVisibilityPlayer()V

    .line 66
    return-void
.end method
