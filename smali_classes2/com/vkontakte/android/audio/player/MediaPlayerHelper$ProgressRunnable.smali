.class Lcom/vkontakte/android/audio/player/MediaPlayerHelper$ProgressRunnable;
.super Ljava/lang/Object;
.source "MediaPlayerHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/MediaPlayerHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ProgressRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;)V
    .locals 0

    .prologue
    .line 248
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$ProgressRunnable;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;Lcom/vkontakte/android/audio/player/MediaPlayerHelper$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelper;
    .param p2, "x1"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelper$1;

    .prologue
    .line 248
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$ProgressRunnable;-><init>(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 251
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$ProgressRunnable;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->access$500(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 252
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$ProgressRunnable;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->access$200(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$ProgressRunnable;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$ProgressRunnable;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    invoke-static {v2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->access$500(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;)Landroid/media/MediaPlayer;

    move-result-object v2

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onProgress(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V

    .line 254
    :cond_0
    return-void
.end method
