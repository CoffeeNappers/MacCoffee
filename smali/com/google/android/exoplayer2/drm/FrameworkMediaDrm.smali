.class public final Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;
.super Ljava/lang/Object;
.source "FrameworkMediaDrm.java"

# interfaces
.implements Lcom/google/android/exoplayer2/drm/ExoMediaDrm;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x12
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/exoplayer2/drm/ExoMediaDrm",
        "<",
        "Lcom/google/android/exoplayer2/drm/FrameworkMediaCrypto;",
        ">;"
    }
.end annotation


# instance fields
.field private final mediaDrm:Landroid/media/MediaDrm;


# direct methods
.method private constructor <init>(Ljava/util/UUID;)V
    .locals 2
    .param p1, "uuid"    # Ljava/util/UUID;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/media/UnsupportedSchemeException;
        }
    .end annotation

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v1, Landroid/media/MediaDrm;

    invoke-static {p1}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    invoke-direct {v1, v0}, Landroid/media/MediaDrm;-><init>(Ljava/util/UUID;)V

    iput-object v1, p0, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;->mediaDrm:Landroid/media/MediaDrm;

    .line 58
    return-void
.end method

.method public static newInstance(Ljava/util/UUID;)Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;
    .locals 3
    .param p0, "uuid"    # Ljava/util/UUID;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/drm/UnsupportedDrmException;
        }
    .end annotation

    .prologue
    .line 48
    :try_start_0
    new-instance v1, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;

    invoke-direct {v1, p0}, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;-><init>(Ljava/util/UUID;)V
    :try_end_0
    .catch Landroid/media/UnsupportedSchemeException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    return-object v1

    .line 49
    :catch_0
    move-exception v0

    .line 50
    .local v0, "e":Landroid/media/UnsupportedSchemeException;
    new-instance v1, Lcom/google/android/exoplayer2/drm/UnsupportedDrmException;

    const/4 v2, 0x1

    invoke-direct {v1, v2, v0}, Lcom/google/android/exoplayer2/drm/UnsupportedDrmException;-><init>(ILjava/lang/Exception;)V

    throw v1

    .line 51
    .end local v0    # "e":Landroid/media/UnsupportedSchemeException;
    :catch_1
    move-exception v0

    .line 52
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lcom/google/android/exoplayer2/drm/UnsupportedDrmException;

    const/4 v2, 0x2

    invoke-direct {v1, v2, v0}, Lcom/google/android/exoplayer2/drm/UnsupportedDrmException;-><init>(ILjava/lang/Exception;)V

    throw v1
.end method


# virtual methods
.method public closeSession([B)V
    .locals 1
    .param p1, "sessionId"    # [B

    .prologue
    .line 78
    iget-object v0, p0, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;->mediaDrm:Landroid/media/MediaDrm;

    invoke-virtual {v0, p1}, Landroid/media/MediaDrm;->closeSession([B)V

    .line 79
    return-void
.end method

.method public bridge synthetic createMediaCrypto(Ljava/util/UUID;[B)Lcom/google/android/exoplayer2/drm/ExoMediaCrypto;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/media/MediaCryptoException;
        }
    .end annotation

    .prologue
    .line 34
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;->createMediaCrypto(Ljava/util/UUID;[B)Lcom/google/android/exoplayer2/drm/FrameworkMediaCrypto;

    move-result-object v0

    return-object v0
.end method

.method public createMediaCrypto(Ljava/util/UUID;[B)Lcom/google/android/exoplayer2/drm/FrameworkMediaCrypto;
    .locals 2
    .param p1, "uuid"    # Ljava/util/UUID;
    .param p2, "initData"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/media/MediaCryptoException;
        }
    .end annotation

    .prologue
    .line 164
    new-instance v0, Lcom/google/android/exoplayer2/drm/FrameworkMediaCrypto;

    new-instance v1, Landroid/media/MediaCrypto;

    invoke-direct {v1, p1, p2}, Landroid/media/MediaCrypto;-><init>(Ljava/util/UUID;[B)V

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/drm/FrameworkMediaCrypto;-><init>(Landroid/media/MediaCrypto;)V

    return-object v0
.end method

.method public getKeyRequest([B[BLjava/lang/String;ILjava/util/HashMap;)Lcom/google/android/exoplayer2/drm/ExoMediaDrm$KeyRequest;
    .locals 7
    .param p1, "scope"    # [B
    .param p2, "init"    # [B
    .param p3, "mimeType"    # Ljava/lang/String;
    .param p4, "keyType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B[B",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/android/exoplayer2/drm/ExoMediaDrm$KeyRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/media/NotProvisionedException;
        }
    .end annotation

    .prologue
    .line 84
    .local p5, "optionalParameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;->mediaDrm:Landroid/media/MediaDrm;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaDrm;->getKeyRequest([B[BLjava/lang/String;ILjava/util/HashMap;)Landroid/media/MediaDrm$KeyRequest;

    move-result-object v6

    .line 86
    .local v6, "request":Landroid/media/MediaDrm$KeyRequest;
    new-instance v0, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm$2;

    invoke-direct {v0, p0, v6}, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm$2;-><init>(Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;Landroid/media/MediaDrm$KeyRequest;)V

    return-object v0
.end method

.method public getPropertyByteArray(Ljava/lang/String;)[B
    .locals 1
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 148
    iget-object v0, p0, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;->mediaDrm:Landroid/media/MediaDrm;

    invoke-virtual {v0, p1}, Landroid/media/MediaDrm;->getPropertyByteArray(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public getPropertyString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 143
    iget-object v0, p0, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;->mediaDrm:Landroid/media/MediaDrm;

    invoke-virtual {v0, p1}, Landroid/media/MediaDrm;->getPropertyString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProvisionRequest()Lcom/google/android/exoplayer2/drm/ExoMediaDrm$ProvisionRequest;
    .locals 2

    .prologue
    .line 107
    iget-object v1, p0, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;->mediaDrm:Landroid/media/MediaDrm;

    invoke-virtual {v1}, Landroid/media/MediaDrm;->getProvisionRequest()Landroid/media/MediaDrm$ProvisionRequest;

    move-result-object v0

    .line 108
    .local v0, "provisionRequest":Landroid/media/MediaDrm$ProvisionRequest;
    new-instance v1, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm$3;

    invoke-direct {v1, p0, v0}, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm$3;-><init>(Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;Landroid/media/MediaDrm$ProvisionRequest;)V

    return-object v1
.end method

.method public openSession()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/media/NotProvisionedException;,
            Landroid/media/ResourceBusyException;
        }
    .end annotation

    .prologue
    .line 73
    iget-object v0, p0, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;->mediaDrm:Landroid/media/MediaDrm;

    invoke-virtual {v0}, Landroid/media/MediaDrm;->openSession()[B

    move-result-object v0

    return-object v0
.end method

.method public provideKeyResponse([B[B)[B
    .locals 1
    .param p1, "scope"    # [B
    .param p2, "response"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/media/NotProvisionedException;,
            Landroid/media/DeniedByServerException;
        }
    .end annotation

    .prologue
    .line 102
    iget-object v0, p0, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;->mediaDrm:Landroid/media/MediaDrm;

    invoke-virtual {v0, p1, p2}, Landroid/media/MediaDrm;->provideKeyResponse([B[B)[B

    move-result-object v0

    return-object v0
.end method

.method public provideProvisionResponse([B)V
    .locals 1
    .param p1, "response"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/media/DeniedByServerException;
        }
    .end annotation

    .prologue
    .line 123
    iget-object v0, p0, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;->mediaDrm:Landroid/media/MediaDrm;

    invoke-virtual {v0, p1}, Landroid/media/MediaDrm;->provideProvisionResponse([B)V

    .line 124
    return-void
.end method

.method public queryKeyStatus([B)Ljava/util/Map;
    .locals 1
    .param p1, "sessionId"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 128
    iget-object v0, p0, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;->mediaDrm:Landroid/media/MediaDrm;

    invoke-virtual {v0, p1}, Landroid/media/MediaDrm;->queryKeyStatus([B)Ljava/util/HashMap;

    move-result-object v0

    return-object v0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;->mediaDrm:Landroid/media/MediaDrm;

    invoke-virtual {v0}, Landroid/media/MediaDrm;->release()V

    .line 134
    return-void
.end method

.method public restoreKeys([B[B)V
    .locals 1
    .param p1, "sessionId"    # [B
    .param p2, "keySetId"    # [B

    .prologue
    .line 138
    iget-object v0, p0, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;->mediaDrm:Landroid/media/MediaDrm;

    invoke-virtual {v0, p1, p2}, Landroid/media/MediaDrm;->restoreKeys([B[B)V

    .line 139
    return-void
.end method

.method public setOnEventListener(Lcom/google/android/exoplayer2/drm/ExoMediaDrm$OnEventListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/drm/ExoMediaDrm$OnEventListener",
            "<-",
            "Lcom/google/android/exoplayer2/drm/FrameworkMediaCrypto;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 63
    .local p1, "listener":Lcom/google/android/exoplayer2/drm/ExoMediaDrm$OnEventListener;, "Lcom/google/android/exoplayer2/drm/ExoMediaDrm$OnEventListener<-Lcom/google/android/exoplayer2/drm/FrameworkMediaCrypto;>;"
    iget-object v1, p0, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;->mediaDrm:Landroid/media/MediaDrm;

    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/media/MediaDrm;->setOnEventListener(Landroid/media/MediaDrm$OnEventListener;)V

    .line 69
    return-void

    .line 63
    :cond_0
    new-instance v0, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm$1;

    invoke-direct {v0, p0, p1}, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm$1;-><init>(Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;Lcom/google/android/exoplayer2/drm/ExoMediaDrm$OnEventListener;)V

    goto :goto_0
.end method

.method public setPropertyByteArray(Ljava/lang/String;[B)V
    .locals 1
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "value"    # [B

    .prologue
    .line 158
    iget-object v0, p0, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;->mediaDrm:Landroid/media/MediaDrm;

    invoke-virtual {v0, p1, p2}, Landroid/media/MediaDrm;->setPropertyByteArray(Ljava/lang/String;[B)V

    .line 159
    return-void
.end method

.method public setPropertyString(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 153
    iget-object v0, p0, Lcom/google/android/exoplayer2/drm/FrameworkMediaDrm;->mediaDrm:Landroid/media/MediaDrm;

    invoke-virtual {v0, p1, p2}, Landroid/media/MediaDrm;->setPropertyString(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    return-void
.end method
