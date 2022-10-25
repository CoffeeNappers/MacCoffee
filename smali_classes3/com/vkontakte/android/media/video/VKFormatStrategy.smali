.class public Lcom/vkontakte/android/media/video/VKFormatStrategy;
.super Ljava/lang/Object;
.source "VKFormatStrategy.java"

# interfaces
.implements Lnet/ypresto/androidtranscoder/format/MediaFormatStrategy;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "VKFormatStrategy"


# instance fields
.field private final bitRate:I

.field private final shorterLength:I


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/media/video/VideoEncoderSettings;)V
    .locals 1
    .param p1, "videoEncoderSettings"    # Lcom/vkontakte/android/media/video/VideoEncoderSettings;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    invoke-virtual {p1}, Lcom/vkontakte/android/media/video/VideoEncoderSettings;->getShorterLength()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/media/video/VKFormatStrategy;->shorterLength:I

    .line 19
    invoke-virtual {p1}, Lcom/vkontakte/android/media/video/VideoEncoderSettings;->getBitrate()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/media/video/VKFormatStrategy;->bitRate:I

    .line 20
    return-void
.end method


# virtual methods
.method public createAudioOutputFormat(Landroid/media/MediaFormat;)Landroid/media/MediaFormat;
    .locals 1
    .param p1, "inputFormat"    # Landroid/media/MediaFormat;

    .prologue
    .line 54
    const/4 v0, 0x0

    return-object v0
.end method

.method public createVideoOutputFormat(Landroid/media/MediaFormat;)Landroid/media/MediaFormat;
    .locals 10
    .param p1, "inputFormat"    # Landroid/media/MediaFormat;

    .prologue
    .line 24
    const-string/jumbo v7, "width"

    invoke-virtual {p1, v7}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v6

    .line 25
    .local v6, "width":I
    const-string/jumbo v7, "height"

    invoke-virtual {p1, v7}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v1

    .line 27
    .local v1, "height":I
    if-lt v6, v1, :cond_0

    .line 28
    int-to-float v7, v6

    int-to-float v8, v1

    div-float v4, v7, v8

    .line 29
    .local v4, "ratio":F
    move v5, v1

    .line 30
    .local v5, "shorter":I
    iget v7, p0, Lcom/vkontakte/android/media/video/VKFormatStrategy;->shorterLength:I

    int-to-float v7, v7

    mul-float/2addr v7, v4

    float-to-double v8, v7

    invoke-static {v8, v9}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v8

    double-to-int v3, v8

    .line 31
    .local v3, "outWidth":I
    iget v2, p0, Lcom/vkontakte/android/media/video/VKFormatStrategy;->shorterLength:I

    .line 39
    .local v2, "outHeight":I
    :goto_0
    iget v7, p0, Lcom/vkontakte/android/media/video/VKFormatStrategy;->shorterLength:I

    if-gt v5, v7, :cond_1

    .line 40
    const-string/jumbo v7, "VKFormatStrategy"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "This video is less or equal to target format, pass-through. ("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "x"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    const/4 v0, 0x0

    .line 48
    :goto_1
    return-object v0

    .line 33
    .end local v2    # "outHeight":I
    .end local v3    # "outWidth":I
    .end local v4    # "ratio":F
    .end local v5    # "shorter":I
    :cond_0
    int-to-float v7, v1

    int-to-float v8, v6

    div-float v4, v7, v8

    .line 34
    .restart local v4    # "ratio":F
    move v5, v6

    .line 35
    .restart local v5    # "shorter":I
    iget v7, p0, Lcom/vkontakte/android/media/video/VKFormatStrategy;->shorterLength:I

    int-to-float v7, v7

    mul-float/2addr v7, v4

    float-to-double v8, v7

    invoke-static {v8, v9}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v8

    double-to-int v2, v8

    .line 36
    .restart local v2    # "outHeight":I
    iget v3, p0, Lcom/vkontakte/android/media/video/VKFormatStrategy;->shorterLength:I

    .restart local v3    # "outWidth":I
    goto :goto_0

    .line 43
    :cond_1
    const-string/jumbo v7, "video/avc"

    invoke-static {v7, v3, v2}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v0

    .line 44
    .local v0, "format":Landroid/media/MediaFormat;
    const-string/jumbo v7, "bitrate"

    iget v8, p0, Lcom/vkontakte/android/media/video/VKFormatStrategy;->bitRate:I

    invoke-virtual {v0, v7, v8}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 45
    const-string/jumbo v7, "frame-rate"

    const/16 v8, 0x1e

    invoke-virtual {v0, v7, v8}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 46
    const-string/jumbo v7, "i-frame-interval"

    const/4 v8, 0x3

    invoke-virtual {v0, v7, v8}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 47
    const-string/jumbo v7, "color-format"

    const v8, 0x7f000789

    invoke-virtual {v0, v7, v8}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    goto :goto_1
.end method
