.class Lcom/vkontakte/android/audio/player/ExoPlayerHelper$ProgressRunnable;
.super Ljava/lang/Object;
.source "ExoPlayerHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/ExoPlayerHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ProgressRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)V
    .locals 0

    .prologue
    .line 318
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$ProgressRunnable;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/player/ExoPlayerHelper;
    .param p2, "x1"    # Lcom/vkontakte/android/audio/player/ExoPlayerHelper$1;

    .prologue
    .line 318
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$ProgressRunnable;-><init>(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 321
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$ProgressRunnable;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->access$000(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getPlaybackState()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$ProgressRunnable;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->access$000(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getPlayWhenReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 322
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$ProgressRunnable;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->access$100(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$ProgressRunnable;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$ProgressRunnable;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    invoke-static {v2}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->access$000(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getCurrentPosition()J

    move-result-wide v2

    long-to-int v2, v2

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onProgress(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V

    .line 323
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$ProgressRunnable;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->access$100(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$ProgressRunnable;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/ExoPlayerHelper$ProgressRunnable;->this$0:Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    invoke-static {v2}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;->access$000(Lcom/vkontakte/android/audio/player/ExoPlayerHelper;)Lcom/google/android/exoplayer2/SimpleExoPlayer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getBufferedPercentage()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onBufferingProgress(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V

    .line 325
    :cond_0
    return-void
.end method
