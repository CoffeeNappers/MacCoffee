.class Lcom/vkontakte/android/attachments/VideoAttachment$1;
.super Lcom/vkontakte/android/background/AsyncTask;
.source "VideoAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/attachments/VideoAttachment;->start(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/background/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Integer;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/attachments/VideoAttachment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/attachments/VideoAttachment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/attachments/VideoAttachment;

    .prologue
    .line 703
    iput-object p1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$1;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-direct {p0}, Lcom/vkontakte/android/background/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 703
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/VideoAttachment$1;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 716
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$1;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment;

    iget-object v0, v1, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    .line 717
    .local v0, "file":Lcom/vkontakte/android/api/VideoFile;
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VideoFile;->isHLSSupported()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 718
    iget-object v1, v0, Lcom/vkontakte/android/api/VideoFile;->urlHls:Ljava/lang/String;

    .line 721
    :goto_0
    return-object v1

    .line 720
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$1;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment;

    iget-object v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment$1;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment;

    iget-object v2, v2, Lcom/vkontakte/android/attachments/VideoAttachment;->useVigo:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-object v3, p0, Lcom/vkontakte/android/attachments/VideoAttachment$1;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-static {v3}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1300(Lcom/vkontakte/android/attachments/VideoAttachment;)Z

    move-result v3

    invoke-static {v3}, Lcom/vkontakte/android/media/VigoDelegate;->getSVCid(Z)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v2, v3}, Lcom/vkontakte/android/cache/Videos;->getQuality(Lcom/vkontakte/android/api/VideoFile;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Lcom/vkontakte/android/attachments/VideoAttachment;->mQuality:I

    .line 721
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$1;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment;

    iget v1, v1, Lcom/vkontakte/android/attachments/VideoAttachment;->mQuality:I

    invoke-static {v0, v1}, Lcom/vkontakte/android/cache/Videos;->getUrl(Lcom/vkontakte/android/api/VideoFile;I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method protected onError(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 727
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$1;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/attachments/VideoAttachment;->onError(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V

    .line 728
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 703
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/VideoAttachment$1;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 732
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$1;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/vkontakte/android/attachments/VideoAttachment;->mFailed:Z

    .line 733
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$1;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/attachments/VideoAttachment;->requestPlayer(Ljava/lang/String;)V

    .line 734
    return-void
.end method

.method protected onPreExecute()V
    .locals 2

    .prologue
    .line 707
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$1;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1200(Lcom/vkontakte/android/attachments/VideoAttachment;)Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$1;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1200(Lcom/vkontakte/android/attachments/VideoAttachment;)Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$1;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment;

    .line 708
    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1200(Lcom/vkontakte/android/attachments/VideoAttachment;)Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$1;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment;

    if-ne v0, v1, :cond_0

    .line 709
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$1;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment;->access$1200(Lcom/vkontakte/android/attachments/VideoAttachment;)Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->showProgress()V

    .line 711
    :cond_0
    return-void
.end method
