.class Lcom/vk/imageloader/OkHttpNetworkFetcher$1;
.super Lcom/facebook/imagepipeline/producers/BaseProducerContextCallbacks;
.source "OkHttpNetworkFetcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/imageloader/OkHttpNetworkFetcher;->fetch(Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/imageloader/OkHttpNetworkFetcher;

.field final synthetic val$call:Lokhttp3/Call;

.field final synthetic val$client:Lokhttp3/OkHttpClient;


# direct methods
.method constructor <init>(Lcom/vk/imageloader/OkHttpNetworkFetcher;Lokhttp3/Call;Lokhttp3/OkHttpClient;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/imageloader/OkHttpNetworkFetcher;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$1;->this$0:Lcom/vk/imageloader/OkHttpNetworkFetcher;

    iput-object p2, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$1;->val$call:Lokhttp3/Call;

    iput-object p3, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$1;->val$client:Lokhttp3/OkHttpClient;

    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/BaseProducerContextCallbacks;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancellationRequested()V
    .locals 2

    .prologue
    .line 99
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 100
    iget-object v0, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$1;->val$call:Lokhttp3/Call;

    invoke-interface {v0}, Lokhttp3/Call;->cancel()V

    .line 111
    :goto_0
    return-void

    .line 102
    :cond_0
    iget-object v0, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$1;->this$0:Lcom/vk/imageloader/OkHttpNetworkFetcher;

    invoke-static {v0}, Lcom/vk/imageloader/OkHttpNetworkFetcher;->access$000(Lcom/vk/imageloader/OkHttpNetworkFetcher;)Ljava/util/concurrent/Executor;

    move-result-object v0

    if-nez v0, :cond_1

    .line 103
    iget-object v0, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$1;->this$0:Lcom/vk/imageloader/OkHttpNetworkFetcher;

    iget-object v1, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$1;->val$client:Lokhttp3/OkHttpClient;

    invoke-virtual {v1}, Lokhttp3/OkHttpClient;->dispatcher()Lokhttp3/Dispatcher;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/Dispatcher;->executorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/imageloader/OkHttpNetworkFetcher;->access$002(Lcom/vk/imageloader/OkHttpNetworkFetcher;Ljava/util/concurrent/Executor;)Ljava/util/concurrent/Executor;

    .line 105
    :cond_1
    iget-object v0, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$1;->this$0:Lcom/vk/imageloader/OkHttpNetworkFetcher;

    invoke-static {v0}, Lcom/vk/imageloader/OkHttpNetworkFetcher;->access$000(Lcom/vk/imageloader/OkHttpNetworkFetcher;)Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/vk/imageloader/OkHttpNetworkFetcher$1$1;

    invoke-direct {v1, p0}, Lcom/vk/imageloader/OkHttpNetworkFetcher$1$1;-><init>(Lcom/vk/imageloader/OkHttpNetworkFetcher$1;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_0
.end method
