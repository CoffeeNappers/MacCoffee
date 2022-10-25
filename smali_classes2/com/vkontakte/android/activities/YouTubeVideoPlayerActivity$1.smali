.class Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$1;
.super Ljava/lang/Object;
.source "YouTubeVideoPlayerActivity.java"

# interfaces
.implements Lcom/google/android/youtube/player/YouTubePlayer$OnInitializedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->initPlayer(Lcom/vkontakte/android/api/VideoFile;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

.field final synthetic val$file:Lcom/vkontakte/android/api/VideoFile;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;Lcom/vkontakte/android/api/VideoFile;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    .prologue
    .line 107
    iput-object p1, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$1;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    iput-object p2, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$1;->val$file:Lcom/vkontakte/android/api/VideoFile;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onInitializationFailure(Lcom/google/android/youtube/player/YouTubePlayer$Provider;Lcom/google/android/youtube/player/YouTubeInitializationResult;)V
    .locals 2
    .param p1, "provider"    # Lcom/google/android/youtube/player/YouTubePlayer$Provider;
    .param p2, "youTubeInitializationResult"    # Lcom/google/android/youtube/player/YouTubeInitializationResult;

    .prologue
    .line 125
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$1;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->access$002(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;Lcom/google/android/youtube/player/YouTubePlayer;)Lcom/google/android/youtube/player/YouTubePlayer;

    .line 126
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$1;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->playEmbed()V

    .line 127
    return-void
.end method

.method public onInitializationSuccess(Lcom/google/android/youtube/player/YouTubePlayer$Provider;Lcom/google/android/youtube/player/YouTubePlayer;Z)V
    .locals 4
    .param p1, "provider"    # Lcom/google/android/youtube/player/YouTubePlayer$Provider;
    .param p2, "youTubePlayer"    # Lcom/google/android/youtube/player/YouTubePlayer;
    .param p3, "b"    # Z

    .prologue
    .line 110
    iget-object v1, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$1;->val$file:Lcom/vkontakte/android/api/VideoFile;

    iget-object v1, v1, Lcom/vkontakte/android/api/VideoFile;->urlExternal:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 111
    .local v0, "uri":Landroid/net/Uri;
    iget-object v1, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$1;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    invoke-static {v1, p2}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->access$002(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;Lcom/google/android/youtube/player/YouTubePlayer;)Lcom/google/android/youtube/player/YouTubePlayer;

    .line 112
    const/16 v1, 0x8

    invoke-interface {p2, v1}, Lcom/google/android/youtube/player/YouTubePlayer;->addFullscreenControlFlag(I)V

    .line 113
    new-instance v1, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$PlayerStateListener;

    iget-object v2, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$1;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$PlayerStateListener;-><init>(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$1;)V

    invoke-interface {p2, v1}, Lcom/google/android/youtube/player/YouTubePlayer;->setPlayerStateChangeListener(Lcom/google/android/youtube/player/YouTubePlayer$PlayerStateChangeListener;)V

    .line 114
    const-string/jumbo v1, "v"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v1}, Lcom/google/android/youtube/player/YouTubePlayer;->loadVideo(Ljava/lang/String;)V

    .line 115
    invoke-interface {p2}, Lcom/google/android/youtube/player/YouTubePlayer;->play()V

    .line 116
    iget-object v1, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$1;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    invoke-static {v1}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->access$200(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;)Lcom/google/android/youtube/player/YouTubePlayerFragment;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->access$300(Lcom/google/android/youtube/player/YouTubePlayerFragment;)V

    .line 117
    iget-object v1, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$1;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    invoke-static {v1}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->access$400(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 118
    const/4 v1, 0x1

    invoke-interface {p2, v1}, Lcom/google/android/youtube/player/YouTubePlayer;->setFullscreen(Z)V

    .line 120
    :cond_0
    return-void
.end method
