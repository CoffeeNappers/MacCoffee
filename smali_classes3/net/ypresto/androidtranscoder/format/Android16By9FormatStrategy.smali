.class Lnet/ypresto/androidtranscoder/format/Android16By9FormatStrategy;
.super Ljava/lang/Object;
.source "Android16By9FormatStrategy.java"

# interfaces
.implements Lnet/ypresto/androidtranscoder/format/MediaFormatStrategy;


# static fields
.field public static final AUDIO_BITRATE_AS_IS:I = -0x1

.field public static final AUDIO_CHANNELS_AS_IS:I = -0x1

.field public static final SCALE_720P:I = 0x5

.field private static final TAG:Ljava/lang/String; = "Android16By9FormatStrategy"


# instance fields
.field private final mAudioBitrate:I

.field private final mAudioChannels:I

.field private final mScale:I

.field private final mVideoBitrate:I


# direct methods
.method public constructor <init>(II)V
    .locals 1
    .param p1, "scale"    # I
    .param p2, "videoBitrate"    # I

    .prologue
    const/4 v0, -0x1

    .line 33
    invoke-direct {p0, p1, p2, v0, v0}, Lnet/ypresto/androidtranscoder/format/Android16By9FormatStrategy;-><init>(IIII)V

    .line 34
    return-void
.end method

.method public constructor <init>(IIII)V
    .locals 0
    .param p1, "scale"    # I
    .param p2, "videoBitrate"    # I
    .param p3, "audioBitrate"    # I
    .param p4, "audioChannels"    # I

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput p1, p0, Lnet/ypresto/androidtranscoder/format/Android16By9FormatStrategy;->mScale:I

    .line 38
    iput p2, p0, Lnet/ypresto/androidtranscoder/format/Android16By9FormatStrategy;->mVideoBitrate:I

    .line 39
    iput p3, p0, Lnet/ypresto/androidtranscoder/format/Android16By9FormatStrategy;->mAudioBitrate:I

    .line 40
    iput p4, p0, Lnet/ypresto/androidtranscoder/format/Android16By9FormatStrategy;->mAudioChannels:I

    .line 41
    return-void
.end method


# virtual methods
.method public createAudioOutputFormat(Landroid/media/MediaFormat;)Landroid/media/MediaFormat;
    .locals 4
    .param p1, "inputFormat"    # Landroid/media/MediaFormat;

    .prologue
    const/4 v2, -0x1

    .line 79
    iget v1, p0, Lnet/ypresto/androidtranscoder/format/Android16By9FormatStrategy;->mAudioBitrate:I

    if-eq v1, v2, :cond_0

    iget v1, p0, Lnet/ypresto/androidtranscoder/format/Android16By9FormatStrategy;->mAudioChannels:I

    if-ne v1, v2, :cond_1

    :cond_0
    const/4 v0, 0x0

    .line 86
    :goto_0
    return-object v0

    .line 82
    :cond_1
    const-string/jumbo v1, "audio/mp4a-latm"

    const-string/jumbo v2, "sample-rate"

    .line 83
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v2

    iget v3, p0, Lnet/ypresto/androidtranscoder/format/Android16By9FormatStrategy;->mAudioChannels:I

    .line 82
    invoke-static {v1, v2, v3}, Landroid/media/MediaFormat;->createAudioFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v0

    .line 84
    .local v0, "format":Landroid/media/MediaFormat;
    const-string/jumbo v1, "aac-profile"

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 85
    const-string/jumbo v1, "bitrate"

    iget v2, p0, Lnet/ypresto/androidtranscoder/format/Android16By9FormatStrategy;->mAudioBitrate:I

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public createVideoOutputFormat(Landroid/media/MediaFormat;)Landroid/media/MediaFormat;
    .locals 12
    .param p1, "inputFormat"    # Landroid/media/MediaFormat;

    .prologue
    .line 45
    const-string/jumbo v9, "width"

    invoke-virtual {p1, v9}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v8

    .line 46
    .local v8, "width":I
    const-string/jumbo v9, "height"

    invoke-virtual {p1, v9}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v1

    .line 47
    .local v1, "height":I
    iget v9, p0, Lnet/ypresto/androidtranscoder/format/Android16By9FormatStrategy;->mScale:I

    mul-int/lit8 v9, v9, 0x10

    mul-int/lit8 v6, v9, 0x10

    .line 48
    .local v6, "targetLonger":I
    iget v9, p0, Lnet/ypresto/androidtranscoder/format/Android16By9FormatStrategy;->mScale:I

    mul-int/lit8 v9, v9, 0x10

    mul-int/lit8 v7, v9, 0x9

    .line 50
    .local v7, "targetShorter":I
    if-lt v8, v1, :cond_0

    .line 51
    move v2, v8

    .line 52
    .local v2, "longer":I
    move v5, v1

    .line 53
    .local v5, "shorter":I
    move v4, v6

    .line 54
    .local v4, "outWidth":I
    move v3, v7

    .line 61
    .local v3, "outHeight":I
    :goto_0
    mul-int/lit8 v9, v2, 0x9

    mul-int/lit8 v10, v5, 0x10

    if-eq v9, v10, :cond_1

    .line 62
    new-instance v9, Lnet/ypresto/androidtranscoder/format/OutputFormatUnavailableException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "This video is not 16:9, and is not able to transcode. ("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "x"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, ")"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lnet/ypresto/androidtranscoder/format/OutputFormatUnavailableException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 56
    .end local v2    # "longer":I
    .end local v3    # "outHeight":I
    .end local v4    # "outWidth":I
    .end local v5    # "shorter":I
    :cond_0
    move v5, v8

    .line 57
    .restart local v5    # "shorter":I
    move v2, v1

    .line 58
    .restart local v2    # "longer":I
    move v4, v7

    .line 59
    .restart local v4    # "outWidth":I
    move v3, v6

    .restart local v3    # "outHeight":I
    goto :goto_0

    .line 64
    :cond_1
    if-gt v5, v7, :cond_2

    .line 65
    const-string/jumbo v9, "Android16By9FormatStrategy"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "This video\'s height is less or equal to "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, ", pass-through. ("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "x"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, ")"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    const/4 v0, 0x0

    .line 74
    :goto_1
    return-object v0

    .line 68
    :cond_2
    const-string/jumbo v9, "video/avc"

    invoke-static {v9, v4, v3}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v0

    .line 70
    .local v0, "format":Landroid/media/MediaFormat;
    const-string/jumbo v9, "bitrate"

    iget v10, p0, Lnet/ypresto/androidtranscoder/format/Android16By9FormatStrategy;->mVideoBitrate:I

    invoke-virtual {v0, v9, v10}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 71
    const-string/jumbo v9, "frame-rate"

    const/16 v10, 0x1e

    invoke-virtual {v0, v9, v10}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 72
    const-string/jumbo v9, "i-frame-interval"

    const/4 v10, 0x3

    invoke-virtual {v0, v9, v10}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 73
    const-string/jumbo v9, "color-format"

    const v10, 0x7f000789

    invoke-virtual {v0, v9, v10}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    goto :goto_1
.end method
