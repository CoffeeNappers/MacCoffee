.class public Lcom/vk/media/utils/MediaUtils;
.super Ljava/lang/Object;
.source "MediaUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/media/utils/MediaUtils$VideoInfo;,
        Lcom/vk/media/utils/MediaUtils$Size;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getVideoDurationMs(Landroid/net/Uri;)I
    .locals 3
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 52
    :try_start_0
    new-instance v1, Landroid/media/MediaMetadataRetriever;

    invoke-direct {v1}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .line 53
    .local v1, "retriever":Landroid/media/MediaMetadataRetriever;
    invoke-virtual {p0}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V

    .line 54
    const/16 v2, 0x9

    invoke-virtual {v1, v2}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 55
    .local v0, "duration":I
    invoke-virtual {v1}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .end local v0    # "duration":I
    .end local v1    # "retriever":Landroid/media/MediaMetadataRetriever;
    :goto_0
    return v0

    .line 57
    :catch_0
    move-exception v2

    .line 58
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static getVideoInfo(Landroid/net/Uri;Z)Lcom/vk/media/utils/MediaUtils$VideoInfo;
    .locals 7
    .param p0, "uri"    # Landroid/net/Uri;
    .param p1, "withPreview"    # Z

    .prologue
    .line 63
    :try_start_0
    new-instance v1, Landroid/media/MediaMetadataRetriever;

    invoke-direct {v1}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .line 64
    .local v1, "retriever":Landroid/media/MediaMetadataRetriever;
    invoke-virtual {p0}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V

    .line 66
    const/16 v6, 0x12

    invoke-virtual {v1, v6}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 67
    .local v5, "videoWidth":I
    const/16 v6, 0x13

    invoke-virtual {v1, v6}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 68
    .local v4, "videoHeight":I
    const/16 v6, 0x18

    invoke-virtual {v1, v6}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 69
    .local v2, "rotation":I
    rem-int/lit16 v6, v2, 0xb4

    if-eqz v6, :cond_0

    .line 70
    move v3, v5

    .line 71
    .local v3, "tmp":I
    move v5, v4

    .line 72
    move v4, v3

    .line 75
    .end local v3    # "tmp":I
    :cond_0
    new-instance v0, Lcom/vk/media/utils/MediaUtils$VideoInfo;

    invoke-direct {v0, v5, v4}, Lcom/vk/media/utils/MediaUtils$VideoInfo;-><init>(II)V

    .line 76
    .local v0, "info":Lcom/vk/media/utils/MediaUtils$VideoInfo;
    if-eqz p1, :cond_1

    .line 77
    invoke-virtual {v1}, Landroid/media/MediaMetadataRetriever;->getFrameAtTime()Landroid/graphics/Bitmap;

    move-result-object v6

    iput-object v6, v0, Lcom/vk/media/utils/MediaUtils$VideoInfo;->preview:Landroid/graphics/Bitmap;

    .line 78
    const/16 v6, 0x9

    invoke-virtual {v1, v6}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    iput v6, v0, Lcom/vk/media/utils/MediaUtils$VideoInfo;->durationMs:I

    .line 80
    :cond_1
    invoke-virtual {v1}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    .end local v0    # "info":Lcom/vk/media/utils/MediaUtils$VideoInfo;
    .end local v1    # "retriever":Landroid/media/MediaMetadataRetriever;
    .end local v2    # "rotation":I
    .end local v4    # "videoHeight":I
    .end local v5    # "videoWidth":I
    :goto_0
    return-object v0

    .line 82
    :catch_0
    move-exception v6

    .line 83
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getVideoPreview(Landroid/net/Uri;)Lcom/vk/media/utils/MediaUtils$VideoInfo;
    .locals 1
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 43
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/vk/media/utils/MediaUtils;->getVideoInfo(Landroid/net/Uri;Z)Lcom/vk/media/utils/MediaUtils$VideoInfo;

    move-result-object v0

    return-object v0
.end method

.method public static getVideoSize(Landroid/net/Uri;)Lcom/vk/media/utils/MediaUtils$Size;
    .locals 1
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 47
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/vk/media/utils/MediaUtils;->getVideoInfo(Landroid/net/Uri;Z)Lcom/vk/media/utils/MediaUtils$VideoInfo;

    move-result-object v0

    return-object v0
.end method
