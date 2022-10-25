.class Lcom/vk/core/network/RxFileDownloader$1;
.super Ljava/lang/Object;
.source "RxFileDownloader.java"

# interfaces
.implements Lokhttp3/Interceptor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/core/network/RxFileDownloader;->subscribe(Lio/reactivex/ObservableEmitter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/core/network/RxFileDownloader;

.field final synthetic val$e:Lio/reactivex/ObservableEmitter;


# direct methods
.method constructor <init>(Lcom/vk/core/network/RxFileDownloader;Lio/reactivex/ObservableEmitter;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/core/network/RxFileDownloader;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/vk/core/network/RxFileDownloader$1;->this$0:Lcom/vk/core/network/RxFileDownloader;

    iput-object p2, p0, Lcom/vk/core/network/RxFileDownloader$1;->val$e:Lio/reactivex/ObservableEmitter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public intercept(Lokhttp3/Interceptor$Chain;)Lokhttp3/Response;
    .locals 5
    .param p1, "chain"    # Lokhttp3/Interceptor$Chain;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    invoke-interface {p1}, Lokhttp3/Interceptor$Chain;->request()Lokhttp3/Request;

    move-result-object v1

    invoke-interface {p1, v1}, Lokhttp3/Interceptor$Chain;->proceed(Lokhttp3/Request;)Lokhttp3/Response;

    move-result-object v0

    .line 49
    .local v0, "originalResponse":Lokhttp3/Response;
    invoke-virtual {v0}, Lokhttp3/Response;->newBuilder()Lokhttp3/Response$Builder;

    move-result-object v1

    new-instance v2, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;

    .line 50
    invoke-virtual {v0}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v3

    iget-object v4, p0, Lcom/vk/core/network/RxFileDownloader$1;->val$e:Lio/reactivex/ObservableEmitter;

    invoke-direct {v2, v3, v4}, Lcom/vk/core/network/RxFileDownloader$ProgressResponseBody;-><init>(Lokhttp3/ResponseBody;Lio/reactivex/ObservableEmitter;)V

    invoke-virtual {v1, v2}, Lokhttp3/Response$Builder;->body(Lokhttp3/ResponseBody;)Lokhttp3/Response$Builder;

    move-result-object v1

    .line 51
    invoke-virtual {v1}, Lokhttp3/Response$Builder;->build()Lokhttp3/Response;

    move-result-object v1

    return-object v1
.end method
