.class Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$PlayerStateListener;
.super Ljava/lang/Object;
.source "YouTubeVideoPlayerActivity.java"

# interfaces
.implements Lcom/google/android/youtube/player/YouTubePlayer$PlayerStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PlayerStateListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;)V
    .locals 0

    .prologue
    .line 280
    iput-object p1, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$PlayerStateListener;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;
    .param p2, "x1"    # Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$1;

    .prologue
    .line 280
    invoke-direct {p0, p1}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$PlayerStateListener;-><init>(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;)V

    return-void
.end method


# virtual methods
.method public onAdStarted()V
    .locals 0

    .prologue
    .line 294
    return-void
.end method

.method public onError(Lcom/google/android/youtube/player/YouTubePlayer$ErrorReason;)V
    .locals 1
    .param p1, "errorReason"    # Lcom/google/android/youtube/player/YouTubePlayer$ErrorReason;

    .prologue
    .line 310
    sget-object v0, Lcom/google/android/youtube/player/YouTubePlayer$ErrorReason;->UNEXPECTED_SERVICE_DISCONNECTION:Lcom/google/android/youtube/player/YouTubePlayer$ErrorReason;

    if-ne p1, v0, :cond_0

    .line 311
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$PlayerStateListener;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    invoke-static {v0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->access$600(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;)V

    .line 315
    :goto_0
    return-void

    .line 313
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$PlayerStateListener;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    invoke-static {v0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->access$200(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;)Lcom/google/android/youtube/player/YouTubePlayerFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->access$300(Lcom/google/android/youtube/player/YouTubePlayerFragment;)V

    goto :goto_0
.end method

.method public onLoaded(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 288
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$PlayerStateListener;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    invoke-static {v0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->access$200(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;)Lcom/google/android/youtube/player/YouTubePlayerFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->access$300(Lcom/google/android/youtube/player/YouTubePlayerFragment;)V

    .line 289
    return-void
.end method

.method public onLoading()V
    .locals 1

    .prologue
    .line 283
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$PlayerStateListener;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    invoke-static {v0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->access$200(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;)Lcom/google/android/youtube/player/YouTubePlayerFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->access$300(Lcom/google/android/youtube/player/YouTubePlayerFragment;)V

    .line 284
    return-void
.end method

.method public onVideoEnded()V
    .locals 2

    .prologue
    .line 304
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$PlayerStateListener;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    invoke-static {v0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->access$200(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;)Lcom/google/android/youtube/player/YouTubePlayerFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->access$300(Lcom/google/android/youtube/player/YouTubePlayerFragment;)V

    .line 305
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$PlayerStateListener;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->setUIVisibility(Z)V

    .line 306
    return-void
.end method

.method public onVideoStarted()V
    .locals 2

    .prologue
    .line 298
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$PlayerStateListener;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    invoke-static {v0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->access$200(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;)Lcom/google/android/youtube/player/YouTubePlayerFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->access$300(Lcom/google/android/youtube/player/YouTubePlayerFragment;)V

    .line 299
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$PlayerStateListener;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    iget-object v1, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$PlayerStateListener;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    invoke-virtual {v1}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->getHideDelay()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->hideUIDelayed(I)V

    .line 300
    return-void
.end method
