.class Lcom/wmspanel/libstream/VideoEncoderBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoEncoderBuilder"


# instance fields
.field private mConfig:Lcom/wmspanel/libstream/VideoConfig;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method build()Lcom/wmspanel/libstream/VideoEncoder;
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 15
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoEncoderBuilder;->mConfig:Lcom/wmspanel/libstream/VideoConfig;

    if-nez v1, :cond_1

    .line 16
    const-string/jumbo v1, "VideoEncoderBuilder"

    const-string/jumbo v2, "Build failed: video config is null"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    :cond_0
    :goto_0
    return-object v0

    .line 19
    :cond_1
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoEncoderBuilder;->mConfig:Lcom/wmspanel/libstream/VideoConfig;

    iget-object v1, v1, Lcom/wmspanel/libstream/VideoConfig;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    if-nez v1, :cond_2

    .line 20
    const-string/jumbo v1, "VideoEncoderBuilder"

    const-string/jumbo v2, "Build failed: video size is null"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 23
    :cond_2
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoEncoderBuilder;->mConfig:Lcom/wmspanel/libstream/VideoConfig;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoConfig;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    invoke-static {v0}, Lcom/wmspanel/libstream/VideoEncoder;->createVideoEncoder(Lcom/wmspanel/libstream/Streamer$Size;)Lcom/wmspanel/libstream/VideoEncoder;

    move-result-object v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoEncoderBuilder;->mConfig:Lcom/wmspanel/libstream/VideoConfig;

    iget v1, v1, Lcom/wmspanel/libstream/VideoConfig;->fps:F

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoEncoder;->setFrameRate(F)V

    .line 26
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoEncoderBuilder;->mConfig:Lcom/wmspanel/libstream/VideoConfig;

    iget v1, v1, Lcom/wmspanel/libstream/VideoConfig;->bitRate:I

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoEncoder;->setBitRate(I)V

    .line 27
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoEncoderBuilder;->mConfig:Lcom/wmspanel/libstream/VideoConfig;

    iget v1, v1, Lcom/wmspanel/libstream/VideoConfig;->keyFrameInterval:I

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoEncoder;->setKeyFrameInterval(I)V

    .line 28
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoEncoderBuilder;->mConfig:Lcom/wmspanel/libstream/VideoConfig;

    iget-object v1, v1, Lcom/wmspanel/libstream/VideoConfig;->profileLevel:Landroid/media/MediaCodecInfo$CodecProfileLevel;

    if-eqz v1, :cond_0

    .line 29
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoEncoderBuilder;->mConfig:Lcom/wmspanel/libstream/VideoConfig;

    iget-object v1, v1, Lcom/wmspanel/libstream/VideoConfig;->profileLevel:Landroid/media/MediaCodecInfo$CodecProfileLevel;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoEncoder;->setProfile(Landroid/media/MediaCodecInfo$CodecProfileLevel;)V

    goto :goto_0
.end method

.method setConfig(Lcom/wmspanel/libstream/VideoConfig;)V
    .locals 0
    .param p1, "config"    # Lcom/wmspanel/libstream/VideoConfig;

    .prologue
    .line 11
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoEncoderBuilder;->mConfig:Lcom/wmspanel/libstream/VideoConfig;

    .line 12
    return-void
.end method
