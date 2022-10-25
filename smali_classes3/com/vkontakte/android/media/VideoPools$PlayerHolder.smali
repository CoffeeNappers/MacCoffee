.class Lcom/vkontakte/android/media/VideoPools$PlayerHolder;
.super Ljava/lang/Object;
.source "VideoPools.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/media/VideoPools;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PlayerHolder"
.end annotation


# instance fields
.field lastURL:Ljava/lang/String;

.field final player:Lcom/vkontakte/android/media/AbsVideoPlayer;

.field final playerContexts:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Lcom/vkontakte/android/media/VideoPools$PlayerContext;",
            ">;"
        }
    .end annotation
.end field

.field final refCounter:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/media/AbsVideoPlayer;)V
    .locals 2
    .param p1, "player"    # Lcom/vkontakte/android/media/AbsVideoPlayer;

    .prologue
    .line 266
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 261
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->refCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 263
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->playerContexts:Ljava/util/Stack;

    .line 267
    iput-object p1, p0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    .line 268
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/media/AbsVideoPlayer;Lcom/vkontakte/android/media/VideoPools$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/media/AbsVideoPlayer;
    .param p2, "x1"    # Lcom/vkontakte/android/media/VideoPools$1;

    .prologue
    .line 260
    invoke-direct {p0, p1}, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;-><init>(Lcom/vkontakte/android/media/AbsVideoPlayer;)V

    return-void
.end method


# virtual methods
.method public attachCallbacks(Lcom/vkontakte/android/media/VideoPools$PlayerContext;)V
    .locals 2
    .param p1, "playerContext"    # Lcom/vkontakte/android/media/VideoPools$PlayerContext;

    .prologue
    .line 285
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->playerContexts:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 286
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->playerContexts:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/VideoPools$PlayerContext;

    .line 287
    .local v0, "prev":Lcom/vkontakte/android/media/VideoPools$PlayerContext;
    if-eqz v0, :cond_0

    .line 288
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-interface {v0, v1}, Lcom/vkontakte/android/media/VideoPools$PlayerContext;->onPlayerDetached(Lcom/vkontakte/android/media/AbsVideoPlayer;)V

    .line 291
    .end local v0    # "prev":Lcom/vkontakte/android/media/VideoPools$PlayerContext;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->playerContexts:Ljava/util/Stack;

    invoke-virtual {v1, p1}, Ljava/util/Stack;->add(Ljava/lang/Object;)Z

    .line 292
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-interface {p1, v1}, Lcom/vkontakte/android/media/VideoPools$PlayerContext;->onPlayerAttached(Lcom/vkontakte/android/media/AbsVideoPlayer;)V

    .line 293
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->setPlayerStateListener(Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;)V

    .line 294
    return-void
.end method

.method public detachCallbacks()V
    .locals 3

    .prologue
    .line 271
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->playerContexts:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/VideoPools$PlayerContext;

    .line 272
    .local v0, "playerContext":Lcom/vkontakte/android/media/VideoPools$PlayerContext;
    if-eqz v0, :cond_0

    .line 273
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-interface {v0, v1}, Lcom/vkontakte/android/media/VideoPools$PlayerContext;->onPlayerDetached(Lcom/vkontakte/android/media/AbsVideoPlayer;)V

    .line 275
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->playerContexts:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 276
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/media/AbsVideoPlayer;->setPlayerStateListener(Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;)V

    .line 282
    :goto_0
    return-void

    .line 278
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->playerContexts:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "playerContext":Lcom/vkontakte/android/media/VideoPools$PlayerContext;
    check-cast v0, Lcom/vkontakte/android/media/VideoPools$PlayerContext;

    .line 279
    .restart local v0    # "playerContext":Lcom/vkontakte/android/media/VideoPools$PlayerContext;
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-interface {v0, v1}, Lcom/vkontakte/android/media/VideoPools$PlayerContext;->onPlayerAttached(Lcom/vkontakte/android/media/AbsVideoPlayer;)V

    .line 280
    iget-object v1, p0, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/media/AbsVideoPlayer;->setPlayerStateListener(Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;)V

    goto :goto_0
.end method
