.class Lcom/vk/core/network/NetworkProxyHost$2;
.super Ljava/lang/Object;
.source "NetworkProxyHost.java"

# interfaces
.implements Ljavax/net/ssl/HostnameVerifier;


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
    .line 91
    iput-object p1, p0, Lcom/vk/core/network/NetworkProxyHost$2;->this$0:Lcom/vk/core/network/NetworkProxyHost;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z
    .locals 9
    .param p1, "hostname"    # Ljava/lang/String;
    .param p2, "session"    # Ljavax/net/ssl/SSLSession;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 94
    iget-object v6, p0, Lcom/vk/core/network/NetworkProxyHost$2;->this$0:Lcom/vk/core/network/NetworkProxyHost;

    iget-boolean v6, v6, Lcom/vk/core/network/NetworkProxyHost;->useHosts:Z

    if-nez v6, :cond_1

    iget-object v6, p0, Lcom/vk/core/network/NetworkProxyHost$2;->this$0:Lcom/vk/core/network/NetworkProxyHost;

    invoke-static {v6}, Lcom/vk/core/network/NetworkProxyHost;->access$000(Lcom/vk/core/network/NetworkProxyHost;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 95
    sget-object v4, Lokhttp3/internal/tls/OkHostnameVerifier;->INSTANCE:Lokhttp3/internal/tls/OkHostnameVerifier;

    invoke-virtual {v4, p1, p2}, Lokhttp3/internal/tls/OkHostnameVerifier;->verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z

    move-result v4

    .line 121
    :cond_0
    :goto_0
    return v4

    .line 98
    :cond_1
    if-eqz p2, :cond_2

    invoke-interface {p2}, Ljavax/net/ssl/SSLSession;->isValid()Z

    move-result v6

    if-nez v6, :cond_3

    :cond_2
    move v4, v5

    .line 99
    goto :goto_0

    .line 102
    :cond_3
    iget-object v6, p0, Lcom/vk/core/network/NetworkProxyHost$2;->this$0:Lcom/vk/core/network/NetworkProxyHost;

    iget-boolean v6, v6, Lcom/vk/core/network/NetworkProxyHost;->logging:Z

    if-nez v6, :cond_0

    .line 105
    :try_start_0
    invoke-interface {p2}, Ljavax/net/ssl/SSLSession;->getPeerCertificateChain()[Ljavax/security/cert/X509Certificate;

    move-result-object v1

    .line 106
    .local v1, "certificates":[Ljavax/security/cert/X509Certificate;
    if-eqz v1, :cond_5

    .line 107
    array-length v6, v1

    :goto_1
    if-ge v5, v6, :cond_5

    aget-object v0, v1, v5

    .line 108
    .local v0, "cert":Ljavax/security/cert/X509Certificate;
    invoke-virtual {v0}, Ljavax/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v3

    .line 109
    .local v3, "principal":Ljava/security/Principal;
    iget-object v7, p0, Lcom/vk/core/network/NetworkProxyHost$2;->this$0:Lcom/vk/core/network/NetworkProxyHost;

    invoke-interface {v3}, Ljava/security/Principal;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/vk/core/network/NetworkProxyHost;->access$100(Lcom/vk/core/network/NetworkProxyHost;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v7

    if-eqz v7, :cond_4

    .line 111
    :try_start_1
    iget-object v7, p0, Lcom/vk/core/network/NetworkProxyHost$2;->this$0:Lcom/vk/core/network/NetworkProxyHost;

    invoke-static {v7}, Lcom/vk/core/network/NetworkProxyHost;->access$200(Lcom/vk/core/network/NetworkProxyHost;)Ljava/security/PublicKey;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljavax/security/cert/X509Certificate;->verify(Ljava/security/PublicKey;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 113
    :catch_0
    move-exception v2

    .line 114
    .local v2, "e":Ljava/lang/Exception;
    :try_start_2
    iget-object v7, p0, Lcom/vk/core/network/NetworkProxyHost$2;->this$0:Lcom/vk/core/network/NetworkProxyHost;

    invoke-virtual {v7, v2}, Lcom/vk/core/network/NetworkProxyHost;->log(Ljava/lang/Exception;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 107
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 119
    .end local v0    # "cert":Ljavax/security/cert/X509Certificate;
    .end local v1    # "certificates":[Ljavax/security/cert/X509Certificate;
    .end local v3    # "principal":Ljava/security/Principal;
    :catch_1
    move-exception v4

    .line 121
    :cond_5
    sget-object v4, Lokhttp3/internal/tls/OkHostnameVerifier;->INSTANCE:Lokhttp3/internal/tls/OkHostnameVerifier;

    invoke-virtual {v4, p1, p2}, Lokhttp3/internal/tls/OkHostnameVerifier;->verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z

    move-result v4

    goto :goto_0
.end method
