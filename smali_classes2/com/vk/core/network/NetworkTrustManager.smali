.class public Lcom/vk/core/network/NetworkTrustManager;
.super Ljava/lang/Object;
.source "NetworkTrustManager.java"

# interfaces
.implements Ljavax/net/ssl/X509TrustManager;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/core/network/NetworkTrustManager$NetworkException;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private factory:Ljavax/net/ssl/SSLSocketFactory;

.field private systemTrustManager:Ljavax/net/ssl/X509TrustManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const-class v0, Lcom/vk/core/network/NetworkTrustManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vk/core/network/NetworkTrustManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    invoke-direct {p0}, Lcom/vk/core/network/NetworkTrustManager;->systemDefaultTrustManager()Ljavax/net/ssl/X509TrustManager;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/core/network/NetworkTrustManager;->systemTrustManager:Ljavax/net/ssl/X509TrustManager;

    .line 48
    invoke-direct {p0, p0}, Lcom/vk/core/network/NetworkTrustManager;->createSslSocketFactory(Ljavax/net/ssl/TrustManager;)Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/core/network/NetworkTrustManager;->factory:Ljavax/net/ssl/SSLSocketFactory;

    .line 49
    return-void
.end method

.method private createSslSocketFactory(Ljavax/net/ssl/TrustManager;)Ljavax/net/ssl/SSLSocketFactory;
    .locals 5
    .param p1, "trustManager"    # Ljavax/net/ssl/TrustManager;

    .prologue
    .line 87
    :try_start_0
    const-string/jumbo v2, "TLS"

    invoke-static {v2}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    .line 88
    .local v0, "context":Ljavax/net/ssl/SSLContext;
    const/4 v2, 0x0

    const/4 v3, 0x1

    new-array v3, v3, [Ljavax/net/ssl/TrustManager;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 89
    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getClientSessionContext()Ljavax/net/ssl/SSLSessionContext;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljavax/net/ssl/SSLSessionContext;->setSessionCacheSize(I)V

    .line 90
    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getClientSessionContext()Ljavax/net/ssl/SSLSessionContext;

    move-result-object v2

    const/16 v3, 0x384

    invoke-interface {v2, v3}, Ljavax/net/ssl/SSLSessionContext;->setSessionTimeout(I)V

    .line 91
    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    return-object v2

    .line 92
    .end local v0    # "context":Ljavax/net/ssl/SSLContext;
    :catch_0
    move-exception v1

    .line 93
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2
.end method

.method public static sslDefaultSocketFactory(Lokhttp3/OkHttpClient$Builder;)V
    .locals 3
    .param p0, "client"    # Lokhttp3/OkHttpClient$Builder;

    .prologue
    .line 31
    :try_start_0
    new-instance v1, Lcom/vk/core/network/NetworkTrustManager;

    invoke-direct {v1}, Lcom/vk/core/network/NetworkTrustManager;-><init>()V

    .line 32
    .local v1, "manager":Lcom/vk/core/network/NetworkTrustManager;
    invoke-virtual {v1}, Lcom/vk/core/network/NetworkTrustManager;->getFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v2

    invoke-virtual {p0, v2, v1}, Lokhttp3/OkHttpClient$Builder;->sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;)Lokhttp3/OkHttpClient$Builder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .end local v1    # "manager":Lcom/vk/core/network/NetworkTrustManager;
    :goto_0
    return-void

    .line 33
    :catch_0
    move-exception v0

    .line 34
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/vk/core/network/NetworkTrustManager;->TAG:Ljava/lang/String;

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static sslSocketFactory(Lokhttp3/OkHttpClient$Builder;Lcom/vk/core/network/NetworkTrustManager;)V
    .locals 2
    .param p0, "client"    # Lokhttp3/OkHttpClient$Builder;
    .param p1, "manager"    # Lcom/vk/core/network/NetworkTrustManager;

    .prologue
    .line 40
    :try_start_0
    invoke-virtual {p1}, Lcom/vk/core/network/NetworkTrustManager;->getFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v1

    invoke-virtual {p0, v1, p1}, Lokhttp3/OkHttpClient$Builder;->sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;)Lokhttp3/OkHttpClient$Builder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    :goto_0
    return-void

    .line 41
    :catch_0
    move-exception v0

    .line 42
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/vk/core/network/NetworkTrustManager;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private systemDefaultTrustManager()Ljavax/net/ssl/X509TrustManager;
    .locals 6

    .prologue
    .line 72
    :try_start_0
    invoke-static {}, Ljavax/net/ssl/TrustManagerFactory;->getDefaultAlgorithm()Ljava/lang/String;

    move-result-object v3

    .line 71
    invoke-static {v3}, Ljavax/net/ssl/TrustManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/TrustManagerFactory;

    move-result-object v1

    .line 73
    .local v1, "trustManagerFactory":Ljavax/net/ssl/TrustManagerFactory;
    const/4 v3, 0x0

    check-cast v3, Ljava/security/KeyStore;

    invoke-virtual {v1, v3}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljava/security/KeyStore;)V

    .line 74
    invoke-virtual {v1}, Ljavax/net/ssl/TrustManagerFactory;->getTrustManagers()[Ljavax/net/ssl/TrustManager;

    move-result-object v2

    .line 75
    .local v2, "trustManagers":[Ljavax/net/ssl/TrustManager;
    array-length v3, v2

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    const/4 v3, 0x0

    aget-object v3, v2, v3

    instance-of v3, v3, Ljavax/net/ssl/X509TrustManager;

    if-nez v3, :cond_1

    .line 76
    :cond_0
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Unexpected default trust managers:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 77
    invoke-static {v2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    .end local v1    # "trustManagerFactory":Ljavax/net/ssl/TrustManagerFactory;
    .end local v2    # "trustManagers":[Ljavax/net/ssl/TrustManager;
    :catch_0
    move-exception v0

    .line 81
    .local v0, "e":Ljava/security/GeneralSecurityException;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 79
    .end local v0    # "e":Ljava/security/GeneralSecurityException;
    .restart local v1    # "trustManagerFactory":Ljavax/net/ssl/TrustManagerFactory;
    .restart local v2    # "trustManagers":[Ljavax/net/ssl/TrustManager;
    :cond_1
    const/4 v3, 0x0

    :try_start_1
    aget-object v3, v2, v3

    check-cast v3, Ljavax/net/ssl/X509TrustManager;
    :try_end_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v3
.end method


# virtual methods
.method public checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 1
    .param p1, "chain"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 57
    iget-object v0, p0, Lcom/vk/core/network/NetworkTrustManager;->systemTrustManager:Ljavax/net/ssl/X509TrustManager;

    invoke-interface {v0, p1, p2}, Ljavax/net/ssl/X509TrustManager;->checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V

    .line 58
    return-void
.end method

.method public checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 1
    .param p1, "chain"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vk/core/network/NetworkTrustManager;->systemTrustManager:Ljavax/net/ssl/X509TrustManager;

    invoke-interface {v0, p1, p2}, Ljavax/net/ssl/X509TrustManager;->checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V

    .line 63
    return-void
.end method

.method public getAcceptedIssuers()[Ljava/security/cert/X509Certificate;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/vk/core/network/NetworkTrustManager;->systemTrustManager:Ljavax/net/ssl/X509TrustManager;

    invoke-interface {v0}, Ljavax/net/ssl/X509TrustManager;->getAcceptedIssuers()[Ljava/security/cert/X509Certificate;

    move-result-object v0

    return-object v0
.end method

.method public getFactory()Ljavax/net/ssl/SSLSocketFactory;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vk/core/network/NetworkTrustManager;->factory:Ljavax/net/ssl/SSLSocketFactory;

    return-object v0
.end method
