.class Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler$1;
.super Ljava/lang/Object;
.source "DownloadThread.java"

# interfaces
.implements Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverterListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;->handleResponse(Landroid/content/Context;Lokhttp3/Response;)Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$Result;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private downloadedCount:J

.field final synthetic this$1:Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;

.field final synthetic val$totalCount:J


# direct methods
.method constructor <init>(Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;J)V
    .locals 2
    .param p1, "this$1"    # Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;

    .prologue
    .line 221
    iput-object p1, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler$1;->this$1:Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;

    iput-wide p2, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler$1;->val$totalCount:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 222
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler$1;->downloadedCount:J

    return-void
.end method


# virtual methods
.method public isCancelled()Z
    .locals 1

    .prologue
    .line 232
    iget-object v0, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler$1;->this$1:Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;

    iget-object v0, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;->this$0:Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;

    invoke-static {v0}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->access$200(Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;)Z

    move-result v0

    return v0
.end method

.method public onRead(J)V
    .locals 7
    .param p1, "count"    # J

    .prologue
    .line 226
    iget-wide v0, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler$1;->downloadedCount:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler$1;->downloadedCount:J

    .line 227
    iget-object v0, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler$1;->this$1:Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;

    iget-object v0, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;->this$0:Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;

    iget-wide v2, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler$1;->downloadedCount:J

    iget-wide v4, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler$1;->val$totalCount:J

    invoke-static {v0, v2, v3, v4, v5}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->access$300(Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;JJ)Z

    .line 228
    return-void
.end method
