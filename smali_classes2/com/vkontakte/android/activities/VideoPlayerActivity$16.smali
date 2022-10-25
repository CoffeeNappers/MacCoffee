.class Lcom/vkontakte/android/activities/VideoPlayerActivity$16;
.super Lcom/vkontakte/android/background/AsyncTask;
.source "VideoPlayerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/VideoPlayerActivity;->startFile(Lcom/vkontakte/android/api/VideoFile;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/background/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

.field final synthetic val$file:Lcom/vkontakte/android/api/VideoFile;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;Lcom/vkontakte/android/api/VideoFile;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/VideoPlayerActivity;

    .prologue
    .line 692
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$16;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iput-object p2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$16;->val$file:Lcom/vkontakte/android/api/VideoFile;

    invoke-direct {p0}, Lcom/vkontakte/android/background/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;
    .locals 3
    .param p1, "args"    # [Ljava/lang/Void;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 696
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$16;->val$file:Lcom/vkontakte/android/api/VideoFile;

    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$16;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v2, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->useVigo:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$16;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$16;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->player:Lcom/vkontakte/android/media/AbsVideoPlayer;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/AbsVideoPlayer;->isAutoplay()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/vkontakte/android/media/VigoDelegate;->getSVCid(Z)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/vkontakte/android/cache/Videos;->getQuality(Lcom/vkontakte/android/api/VideoFile;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 692
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/activities/VideoPlayerActivity$16;->doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Integer;)V
    .locals 2
    .param p1, "quality"    # Ljava/lang/Integer;

    .prologue
    .line 701
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$16;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->switchQuality(I)V

    .line 702
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 692
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/activities/VideoPlayerActivity$16;->onPostExecute(Ljava/lang/Integer;)V

    return-void
.end method
