.class Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody$1;
.super Lokio/ForwardingSource;
.source "RxFileDownloader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;->source(Lokio/Source;)Lokio/Source;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;

.field totalBytesRead:J

.field final synthetic val$firstRead:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method constructor <init>(Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;Lokio/Source;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 2
    .param p1, "this$0"    # Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;
    .param p2, "x0"    # Lokio/Source;

    .prologue
    .line 188
    iput-object p1, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody$1;->this$0:Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;

    iput-object p3, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody$1;->val$firstRead:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p0, p2}, Lokio/ForwardingSource;-><init>(Lokio/Source;)V

    .line 189
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody$1;->totalBytesRead:J

    return-void
.end method


# virtual methods
.method public read(Lokio/Buffer;J)J
    .locals 10
    .param p1, "sink"    # Lokio/Buffer;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x0

    .line 193
    invoke-super {p0, p1, p2, p3}, Lokio/ForwardingSource;->read(Lokio/Buffer;J)J

    move-result-wide v2

    .line 195
    .local v2, "bytesRead":J
    iget-object v4, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody$1;->val$firstRead:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 196
    iget-object v4, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody$1;->val$firstRead:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 197
    iget-object v4, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody$1;->this$0:Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;

    invoke-static {v4}, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;->access$000(Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;)Lio/reactivex/ObservableEmitter;

    move-result-object v4

    invoke-interface {v4}, Lio/reactivex/ObservableEmitter;->isDisposed()Z

    move-result v4

    if-nez v4, :cond_0

    .line 198
    iget-object v4, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody$1;->this$0:Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;

    invoke-static {v4}, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;->access$000(Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;)Lio/reactivex/ObservableEmitter;

    move-result-object v4

    invoke-static {}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->createStartEvent()Lcom/vk/core/network/RxFileDownloader$DownloadEvent;

    move-result-object v5

    invoke-interface {v4, v5}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 203
    :cond_0
    iget-wide v8, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody$1;->totalBytesRead:J

    const-wide/16 v4, -0x1

    cmp-long v4, v2, v4

    if-eqz v4, :cond_1

    move-wide v4, v2

    :goto_0
    add-long/2addr v4, v8

    iput-wide v4, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody$1;->totalBytesRead:J

    .line 204
    iget-object v4, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody$1;->this$0:Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;

    invoke-static {v4}, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;->access$000(Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;)Lio/reactivex/ObservableEmitter;

    move-result-object v4

    invoke-interface {v4}, Lio/reactivex/ObservableEmitter;->isDisposed()Z

    move-result v4

    if-nez v4, :cond_3

    .line 205
    iget-object v4, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody$1;->this$0:Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;

    invoke-static {v4}, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;->access$100(Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;)Lokhttp3/ResponseBody;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/ResponseBody;->contentLength()J

    move-result-wide v4

    cmp-long v4, v4, v6

    if-nez v4, :cond_2

    .line 206
    iget-object v4, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody$1;->this$0:Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;

    invoke-static {v4}, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;->access$000(Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;)Lio/reactivex/ObservableEmitter;

    move-result-object v4

    invoke-static {}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->createIndeterminateProgressEvent()Lcom/vk/core/network/RxFileDownloader$DownloadEvent;

    move-result-object v5

    invoke-interface {v4, v5}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 215
    :goto_1
    return-wide v2

    :cond_1
    move-wide v4, v6

    .line 203
    goto :goto_0

    .line 208
    :cond_2
    iget-wide v4, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody$1;->totalBytesRead:J

    long-to-float v0, v4

    .line 209
    .local v0, "a":F
    iget-object v4, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody$1;->this$0:Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;

    invoke-static {v4}, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;->access$100(Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;)Lokhttp3/ResponseBody;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/ResponseBody;->contentLength()J

    move-result-wide v4

    long-to-float v1, v4

    .line 210
    .local v1, "b":F
    iget-object v4, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody$1;->this$0:Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;

    invoke-static {v4}, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;->access$000(Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;)Lio/reactivex/ObservableEmitter;

    move-result-object v4

    div-float v5, v0, v1

    invoke-static {v5}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->createProgressEvent(F)Lcom/vk/core/network/RxFileDownloader$DownloadEvent;

    move-result-object v5

    invoke-interface {v4, v5}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    goto :goto_1

    .line 213
    .end local v0    # "a":F
    .end local v1    # "b":F
    :cond_3
    new-instance v4, Lcom/vk/core/network/RxFileDownloader$DownloadCancelationException;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Lcom/vk/core/network/RxFileDownloader$DownloadCancelationException;-><init>(Lcom/vk/core/network/RxFileDownloader$1;)V

    throw v4
.end method
