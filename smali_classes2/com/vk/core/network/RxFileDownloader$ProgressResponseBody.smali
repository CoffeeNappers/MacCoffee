.class Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;
.super Lokhttp3/ResponseBody;
.source "RxFileDownloader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/network/RxFileDownloader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ProgressResponseBody"
.end annotation


# instance fields
.field private bufferedSource:Lokio/BufferedSource;

.field private final observableEmitter:Lio/reactivex/ObservableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableEmitter",
            "<",
            "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
            ">;"
        }
    .end annotation
.end field

.field private final responseBody:Lokhttp3/ResponseBody;


# direct methods
.method public constructor <init>(Lokhttp3/ResponseBody;Lio/reactivex/ObservableEmitter;)V
    .locals 0
    .param p1, "responseBody"    # Lokhttp3/ResponseBody;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokhttp3/ResponseBody;",
            "Lio/reactivex/ObservableEmitter",
            "<",
            "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 163
    .local p2, "observableEmitterr":Lio/reactivex/ObservableEmitter;, "Lio/reactivex/ObservableEmitter<Lcom/vk/core/network/RxFileDownloader$DownloadEvent;>;"
    invoke-direct {p0}, Lokhttp3/ResponseBody;-><init>()V

    .line 164
    iput-object p1, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;->responseBody:Lokhttp3/ResponseBody;

    .line 165
    iput-object p2, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;->observableEmitter:Lio/reactivex/ObservableEmitter;

    .line 166
    return-void
.end method

.method static synthetic access$000(Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;)Lio/reactivex/ObservableEmitter;
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;

    .prologue
    .line 157
    iget-object v0, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;->observableEmitter:Lio/reactivex/ObservableEmitter;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;)Lokhttp3/ResponseBody;
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;

    .prologue
    .line 157
    iget-object v0, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;->responseBody:Lokhttp3/ResponseBody;

    return-object v0
.end method

.method private source(Lokio/Source;)Lokio/Source;
    .locals 2
    .param p1, "source"    # Lokio/Source;

    .prologue
    .line 187
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 188
    .local v0, "firstRead":Ljava/util/concurrent/atomic/AtomicBoolean;
    new-instance v1, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody$1;

    invoke-direct {v1, p0, p1, v0}, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody$1;-><init>(Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;Lokio/Source;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    return-object v1
.end method


# virtual methods
.method public contentLength()J
    .locals 2

    .prologue
    .line 175
    iget-object v0, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;->responseBody:Lokhttp3/ResponseBody;

    invoke-virtual {v0}, Lokhttp3/ResponseBody;->contentLength()J

    move-result-wide v0

    return-wide v0
.end method

.method public contentType()Lokhttp3/MediaType;
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;->responseBody:Lokhttp3/ResponseBody;

    invoke-virtual {v0}, Lokhttp3/ResponseBody;->contentType()Lokhttp3/MediaType;

    move-result-object v0

    return-object v0
.end method

.method public source()Lokio/BufferedSource;
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;->bufferedSource:Lokio/BufferedSource;

    if-nez v0, :cond_0

    .line 181
    iget-object v0, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;->responseBody:Lokhttp3/ResponseBody;

    invoke-virtual {v0}, Lokhttp3/ResponseBody;->source()Lokio/BufferedSource;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;->source(Lokio/Source;)Lokio/Source;

    move-result-object v0

    invoke-static {v0}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;->bufferedSource:Lokio/BufferedSource;

    .line 183
    :cond_0
    iget-object v0, p0, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;->bufferedSource:Lokio/BufferedSource;

    return-object v0
.end method
