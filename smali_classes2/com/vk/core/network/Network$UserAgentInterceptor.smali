.class Lcom/vk/core/network/Network$UserAgentInterceptor;
.super Ljava/lang/Object;
.source "Network.java"

# interfaces
.implements Lokhttp3/Interceptor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/network/Network;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "UserAgentInterceptor"
.end annotation


# instance fields
.field private final ua:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 197
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 198
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/network/Network;->access$000(Lcom/vk/core/network/Network;)Lcom/vk/core/network/NetworkUserAgent;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/network/NetworkUserAgent;->userAgent()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/core/network/Network$UserAgentInterceptor;->ua:Ljava/lang/String;

    .line 199
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
    .line 203
    invoke-interface {p1}, Lokhttp3/Interceptor$Chain;->request()Lokhttp3/Request;

    move-result-object v0

    .line 204
    .local v0, "originalRequest":Lokhttp3/Request;
    invoke-virtual {v0}, Lokhttp3/Request;->newBuilder()Lokhttp3/Request$Builder;

    move-result-object v2

    const-string/jumbo v3, "User-Agent"

    iget-object v4, p0, Lcom/vk/core/network/Network$UserAgentInterceptor;->ua:Ljava/lang/String;

    .line 205
    invoke-virtual {v2, v3, v4}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v2

    .line 206
    invoke-virtual {v2}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v1

    .line 207
    .local v1, "requestWithUserAgent":Lokhttp3/Request;
    invoke-interface {p1, v1}, Lokhttp3/Interceptor$Chain;->proceed(Lokhttp3/Request;)Lokhttp3/Response;

    move-result-object v2

    return-object v2
.end method
