.class public Lcom/vk/music/view/SmallPlayerView;
.super Landroid/widget/FrameLayout;
.source "SmallPlayerView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/view/SmallPlayerView$ItemHolder;
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 26
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 27
    invoke-direct {p0}, Lcom/vk/music/view/SmallPlayerView;->init()V

    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 32
    invoke-direct {p0}, Lcom/vk/music/view/SmallPlayerView;->init()V

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyleAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 36
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 37
    invoke-direct {p0}, Lcom/vk/music/view/SmallPlayerView;->init()V

    .line 38
    return-void
.end method

.method private init()V
    .locals 2

    .prologue
    .line 41
    new-instance v0, Lcom/vk/music/view/SmallPlayerView$ItemHolder;

    invoke-direct {v0, p0}, Lcom/vk/music/view/SmallPlayerView$ItemHolder;-><init>(Landroid/view/ViewGroup;)V

    .line 42
    .local v0, "holder":Lcom/vk/music/view/SmallPlayerView$ItemHolder;
    iget-object v1, v0, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0, v1}, Lcom/vk/music/view/SmallPlayerView;->addView(Landroid/view/View;)V

    .line 43
    return-void
.end method


# virtual methods
.method public bind(Lcom/vkontakte/android/audio/player/PlayerState;Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 2
    .param p1, "state"    # Lcom/vkontakte/android/audio/player/PlayerState;
    .param p2, "info"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 46
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vk/music/view/SmallPlayerView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/view/SmallPlayerView$ItemHolder;

    new-instance v1, Landroid/util/Pair;

    invoke-direct {v1, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->bind(Ljava/lang/Object;)V

    .line 47
    return-void
.end method

.method public onBufferingProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 1
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vk/music/view/SmallPlayerView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/view/SmallPlayerView$ItemHolder;

    invoke-virtual {v0, p1}, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->onBufferingProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V

    .line 51
    return-void
.end method

.method public onProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 1
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 54
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vk/music/view/SmallPlayerView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/view/SmallPlayerView$ItemHolder;

    invoke-virtual {v0, p1}, Lcom/vk/music/view/SmallPlayerView$ItemHolder;->onProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V

    .line 55
    return-void
.end method
