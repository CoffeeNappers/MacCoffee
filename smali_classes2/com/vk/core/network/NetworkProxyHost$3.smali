.class Lcom/vk/core/network/NetworkProxyHost$3;
.super Ljava/lang/Object;
.source "NetworkProxyHost.java"

# interfaces
.implements Lokhttp3/Interceptor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/network/NetworkProxyHost;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/core/network/NetworkProxyHost;


# direct methods
.method constructor <init>(Lcom/vk/core/network/NetworkProxyHost;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/core/network/NetworkProxyHost;

    .prologue
    .line 125
    iput-object p1, p0, Lcom/vk/core/network/NetworkProxyHost$3;->this$0:Lcom/vk/core/network/NetworkProxyHost;

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
    .line 128
    invoke-interface {p1}, Lokhttp3/Interceptor$Chain;->request()Lokhttp3/Request;

    move-result-object v2

    .line 129
    .local v2, "request":Lokhttp3/Request;
    iget-object v4, p0, Lcom/vk/core/network/NetworkProxyHost$3;->this$0:Lcom/vk/core/network/NetworkProxyHost;

    invoke-static {v4, v2}, Lcom/vk/core/network/NetworkProxyHost;->access$300(Lcom/vk/core/network/NetworkProxyHost;Lokhttp3/Request;)Z

    move-result v4

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/vk/core/network/NetworkProxyHost$3;->this$0:Lcom/vk/core/network/NetworkProxyHost;

    invoke-static {v4, v2}, Lcom/vk/core/network/NetworkProxyHost;->access$400(Lcom/vk/core/network/NetworkProxyHost;Lokhttp3/Request;)Lokhttp3/Request;

    move-result-object v2

    .line 130
    :goto_0
    invoke-interface {p1, v2}, Lokhttp3/Interceptor$Chain;->proceed(Lokhttp3/Request;)Lokhttp3/Response;

    move-result-object v3

    .line 132
    .local v3, "response":Lokhttp3/Response;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Lokhttp3/Response;->isRedirect()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 133
    const/4 v1, 0x0

    .line 134
    .local v1, "redirects":I
    :goto_1
    if-eqz v3, :cond_0

    const/16 v4, 0x14

    if-ge v1, v4, :cond_0

    .line 135
    iget-object v4, p0, Lcom/vk/core/network/NetworkProxyHost$3;->this$0:Lcom/vk/core/network/NetworkProxyHost;

    invoke-static {v4, v3}, Lcom/vk/core/network/NetworkProxyHost;->access$600(Lcom/vk/core/network/NetworkProxyHost;Lokhttp3/Response;)Lokhttp3/Request;

    move-result-object v0

    .line 136
    .local v0, "r":Lokhttp3/Request;
    if-nez v0, :cond_3

    .line 145
    .end local v0    # "r":Lokhttp3/Request;
    .end local v1    # "redirects":I
    :cond_0
    if-eqz v3, :cond_1

    .line 149
    :cond_1
    return-object v3

    .line 129
    .end local v3    # "response":Lokhttp3/Response;
    :cond_2
    iget-object v4, p0, Lcom/vk/core/network/NetworkProxyHost$3;->this$0:Lcom/vk/core/network/NetworkProxyHost;

    invoke-static {v4, v2}, Lcom/vk/core/network/NetworkProxyHost;->access$500(Lcom/vk/core/network/NetworkProxyHost;Lokhttp3/Request;)Lokhttp3/Request;

    move-result-object v2

    goto :goto_0

    .line 139
    .restart local v0    # "r":Lokhttp3/Request;
    .restart local v1    # "redirects":I
    .restart local v3    # "response":Lokhttp3/Response;
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 141
    iget-object v4, p0, Lcom/vk/core/network/NetworkProxyHost$3;->this$0:Lcom/vk/core/network/NetworkProxyHost;

    invoke-static {v4, v0}, Lcom/vk/core/network/NetworkProxyHost;->access$300(Lcom/vk/core/network/NetworkProxyHost;Lokhttp3/Request;)Z

    move-result v4

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/vk/core/network/NetworkProxyHost$3;->this$0:Lcom/vk/core/network/NetworkProxyHost;

    invoke-static {v4, v0}, Lcom/vk/core/network/NetworkProxyHost;->access$400(Lcom/vk/core/network/NetworkProxyHost;Lokhttp3/Request;)Lokhttp3/Request;

    move-result-object v2

    .line 142
    :goto_2
    invoke-interface {p1, v2}, Lokhttp3/Interceptor$Chain;->proceed(Lokhttp3/Request;)Lokhttp3/Response;

    move-result-object v3

    .line 143
    goto :goto_1

    .line 141
    :cond_4
    iget-object v4, p0, Lcom/vk/core/network/NetworkProxyHost$3;->this$0:Lcom/vk/core/network/NetworkProxyHost;

    invoke-static {v4, v0}, Lcom/vk/core/network/NetworkProxyHost;->access$500(Lcom/vk/core/network/NetworkProxyHost;Lokhttp3/Request;)Lokhttp3/Request;

    move-result-object v2

    goto :goto_2
.end method
