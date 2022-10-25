.class Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory$1;
.super Ljava/lang/Object;
.source "ExoVideoPlayer.java"

# interfaces
.implements Lokhttp3/Call$Factory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;

    .prologue
    .line 846
    iput-object p1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory$1;->this$0:Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public newCall(Lokhttp3/Request;)Lokhttp3/Call;
    .locals 6
    .param p1, "request"    # Lokhttp3/Request;

    .prologue
    .line 849
    iget-object v4, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory$1;->this$0:Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;

    invoke-static {v4}, Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;->access$800(Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 850
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vk/core/network/Network;->proxy()Lcom/vk/core/network/NetworkProxy;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vk/core/network/NetworkProxy;->host()Ljava/lang/String;

    move-result-object v2

    .line 851
    .local v2, "proxy":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 852
    invoke-virtual {p1}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    .line 853
    .local v0, "host":Ljava/lang/String;
    invoke-static {v2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 854
    invoke-virtual {p1}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/HttpUrl;->newBuilder()Lokhttp3/HttpUrl$Builder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory$1;->this$0:Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;

    invoke-static {v5}, Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;->access$900(Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lokhttp3/HttpUrl$Builder;->host(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object v1

    .line 855
    .local v1, "newUrl":Lokhttp3/HttpUrl;
    invoke-virtual {p1}, Lokhttp3/Request;->newBuilder()Lokhttp3/Request$Builder;

    move-result-object v4

    invoke-virtual {v4, v1}, Lokhttp3/Request$Builder;->url(Lokhttp3/HttpUrl;)Lokhttp3/Request$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v3

    .line 856
    .local v3, "r":Lokhttp3/Request;
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v4

    sget-object v5, Lcom/vk/core/network/Network$ClientType;->CLIENT_PLAYER:Lcom/vk/core/network/Network$ClientType;

    invoke-virtual {v4, v5}, Lcom/vk/core/network/Network;->getClient(Lcom/vk/core/network/Network$ClientType;)Lokhttp3/OkHttpClient;

    move-result-object v4

    invoke-virtual {v4, v3}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v4

    .line 861
    .end local v0    # "host":Ljava/lang/String;
    .end local v1    # "newUrl":Lokhttp3/HttpUrl;
    .end local v2    # "proxy":Ljava/lang/String;
    .end local v3    # "r":Lokhttp3/Request;
    :goto_0
    return-object v4

    .line 858
    .restart local v0    # "host":Ljava/lang/String;
    .restart local v2    # "proxy":Ljava/lang/String;
    :cond_0
    iget-object v4, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory$1;->this$0:Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;

    invoke-static {v4, v0}, Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;->access$902(Lcom/vkontakte/android/media/ExoVideoPlayer$CustomHttpDataSourceFactory;Ljava/lang/String;)Ljava/lang/String;

    .line 861
    .end local v0    # "host":Ljava/lang/String;
    .end local v2    # "proxy":Ljava/lang/String;
    :cond_1
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v4

    sget-object v5, Lcom/vk/core/network/Network$ClientType;->CLIENT_PLAYER:Lcom/vk/core/network/Network$ClientType;

    invoke-virtual {v4, v5}, Lcom/vk/core/network/Network;->getClient(Lcom/vk/core/network/Network$ClientType;)Lokhttp3/OkHttpClient;

    move-result-object v4

    invoke-virtual {v4, p1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v4

    goto :goto_0
.end method
