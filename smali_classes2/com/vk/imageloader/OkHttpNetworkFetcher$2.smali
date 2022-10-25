.class Lcom/vk/imageloader/OkHttpNetworkFetcher$2;
.super Ljava/lang/Object;
.source "OkHttpNetworkFetcher.java"

# interfaces
.implements Lokhttp3/Callback;


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

.field final synthetic val$callback:Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;

.field final synthetic val$fetchState:Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;


# direct methods
.method constructor <init>(Lcom/vk/imageloader/OkHttpNetworkFetcher;Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/imageloader/OkHttpNetworkFetcher;

    .prologue
    .line 115
    iput-object p1, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$2;->this$0:Lcom/vk/imageloader/OkHttpNetworkFetcher;

    iput-object p2, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$2;->val$fetchState:Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;

    iput-object p3, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$2;->val$callback:Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
    .locals 7
    .param p1, "call"    # Lokhttp3/Call;
    .param p2, "e"    # Ljava/io/IOException;

    .prologue
    const/4 v3, 0x0

    .line 150
    iget-object v0, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$2;->this$0:Lcom/vk/imageloader/OkHttpNetworkFetcher;

    iget-object v1, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$2;->val$fetchState:Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;

    iget-object v6, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$2;->val$callback:Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;

    move-object v2, p1

    move-object v4, p2

    move v5, v3

    invoke-static/range {v0 .. v6}, Lcom/vk/imageloader/OkHttpNetworkFetcher;->access$100(Lcom/vk/imageloader/OkHttpNetworkFetcher;Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;Lokhttp3/Call;ILjava/lang/Exception;ZLcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;)V

    .line 151
    return-void
.end method

.method public onResponse(Lokhttp3/Call;Lokhttp3/Response;)V
    .locals 10
    .param p1, "call"    # Lokhttp3/Call;
    .param p2, "response"    # Lokhttp3/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$2;->val$fetchState:Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;->responseTime:J

    .line 119
    invoke-virtual {p2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v7

    .line 121
    .local v7, "body":Lokhttp3/ResponseBody;
    :try_start_0
    invoke-virtual {p2}, Lokhttp3/Response;->isSuccessful()Z

    move-result v0

    if-nez v0, :cond_0

    .line 122
    iget-object v0, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$2;->this$0:Lcom/vk/imageloader/OkHttpNetworkFetcher;

    iget-object v1, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$2;->val$fetchState:Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;

    .line 125
    invoke-virtual {p2}, Lokhttp3/Response;->code()I

    move-result v3

    new-instance v4, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Unexpected HTTP code "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    const/4 v5, 0x1

    iget-object v6, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$2;->val$callback:Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;

    move-object v2, p1

    .line 122
    invoke-static/range {v0 .. v6}, Lcom/vk/imageloader/OkHttpNetworkFetcher;->access$100(Lcom/vk/imageloader/OkHttpNetworkFetcher;Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;Lokhttp3/Call;ILjava/lang/Exception;ZLcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    :try_start_1
    invoke-virtual {v7}, Lokhttp3/ResponseBody;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 146
    :goto_0
    return-void

    .line 142
    :catch_0
    move-exception v4

    .line 143
    .local v4, "e":Ljava/lang/Exception;
    const-string/jumbo v0, "OkHttpNetworkFetchProducer"

    const-string/jumbo v1, "Exception when closing response body"

    invoke-static {v0, v1, v4}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 132
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_0
    :try_start_2
    invoke-virtual {v7}, Lokhttp3/ResponseBody;->contentLength()J

    move-result-wide v8

    .line 133
    .local v8, "contentLength":J
    const-wide/16 v0, 0x0

    cmp-long v0, v8, v0

    if-gez v0, :cond_1

    .line 134
    const-wide/16 v8, 0x0

    .line 136
    :cond_1
    iget-object v0, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$2;->val$callback:Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;

    invoke-virtual {v7}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v1

    long-to-int v2, v8

    invoke-interface {v0, v1, v2}, Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;->onResponse(Ljava/io/InputStream;I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 141
    :try_start_3
    invoke-virtual {v7}, Lokhttp3/ResponseBody;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    .line 142
    :catch_1
    move-exception v4

    .line 143
    .restart local v4    # "e":Ljava/lang/Exception;
    const-string/jumbo v0, "OkHttpNetworkFetchProducer"

    const-string/jumbo v1, "Exception when closing response body"

    invoke-static {v0, v1, v4}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 137
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v8    # "contentLength":J
    :catch_2
    move-exception v4

    .line 138
    .restart local v4    # "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v0, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$2;->this$0:Lcom/vk/imageloader/OkHttpNetworkFetcher;

    iget-object v1, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$2;->val$fetchState:Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;

    invoke-virtual {p2}, Lokhttp3/Response;->code()I

    move-result v3

    const/4 v5, 0x1

    iget-object v6, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$2;->val$callback:Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;

    move-object v2, p1

    invoke-static/range {v0 .. v6}, Lcom/vk/imageloader/OkHttpNetworkFetcher;->access$100(Lcom/vk/imageloader/OkHttpNetworkFetcher;Lcom/vk/imageloader/OkHttpNetworkFetcher$OkHttpNetworkFetchState;Lokhttp3/Call;ILjava/lang/Exception;ZLcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 141
    :try_start_5
    invoke-virtual {v7}, Lokhttp3/ResponseBody;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_0

    .line 142
    :catch_3
    move-exception v4

    .line 143
    const-string/jumbo v0, "OkHttpNetworkFetchProducer"

    const-string/jumbo v1, "Exception when closing response body"

    invoke-static {v0, v1, v4}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 140
    .end local v4    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    .line 141
    :try_start_6
    invoke-virtual {v7}, Lokhttp3/ResponseBody;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    .line 144
    :goto_1
    throw v0

    .line 142
    :catch_4
    move-exception v4

    .line 143
    .restart local v4    # "e":Ljava/lang/Exception;
    const-string/jumbo v1, "OkHttpNetworkFetchProducer"

    const-string/jumbo v2, "Exception when closing response body"

    invoke-static {v1, v2, v4}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method
