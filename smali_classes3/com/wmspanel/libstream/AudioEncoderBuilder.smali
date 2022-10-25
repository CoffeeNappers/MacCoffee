.class Lcom/wmspanel/libstream/AudioEncoderBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "AudioEncoderBuilder"


# instance fields
.field private mConfig:Lcom/wmspanel/libstream/AudioConfig;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method build()Lcom/wmspanel/libstream/AudioEncoder;
    .locals 7

    .prologue
    const/4 v2, 0x0

    .line 15
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioEncoderBuilder;->mConfig:Lcom/wmspanel/libstream/AudioConfig;

    if-nez v0, :cond_1

    .line 16
    const-string/jumbo v0, "AudioEncoderBuilder"

    const-string/jumbo v1, "Build failed: audio config is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    const/4 v0, 0x0

    .line 48
    :cond_0
    :goto_0
    return-object v0

    .line 20
    :cond_1
    invoke-static {}, Lcom/wmspanel/libstream/AudioEncoder;->createAudioEncoder()Lcom/wmspanel/libstream/AudioEncoder;

    move-result-object v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioEncoder;->getSupportedSampleRates()[I

    move-result-object v3

    .line 24
    if-eqz v3, :cond_3

    .line 26
    array-length v4, v3

    move v1, v2

    :goto_1
    if-ge v1, v4, :cond_6

    aget v5, v3, v1

    .line 27
    iget-object v6, p0, Lcom/wmspanel/libstream/AudioEncoderBuilder;->mConfig:Lcom/wmspanel/libstream/AudioConfig;

    iget v6, v6, Lcom/wmspanel/libstream/AudioConfig;->sampleRate:I

    if-ne v5, v6, :cond_5

    .line 28
    const/4 v1, 0x1

    .line 32
    :goto_2
    if-nez v1, :cond_2

    .line 33
    iget-object v1, p0, Lcom/wmspanel/libstream/AudioEncoderBuilder;->mConfig:Lcom/wmspanel/libstream/AudioConfig;

    aget v2, v3, v2

    iput v2, v1, Lcom/wmspanel/libstream/AudioConfig;->sampleRate:I

    .line 35
    :cond_2
    iget-object v1, p0, Lcom/wmspanel/libstream/AudioEncoderBuilder;->mConfig:Lcom/wmspanel/libstream/AudioConfig;

    iget v1, v1, Lcom/wmspanel/libstream/AudioConfig;->sampleRate:I

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/AudioEncoder;->setSampleRate(I)V

    .line 38
    :cond_3
    invoke-virtual {v0}, Lcom/wmspanel/libstream/AudioEncoder;->getMaxInputChannelCount()I

    move-result v1

    .line 39
    iget-object v2, p0, Lcom/wmspanel/libstream/AudioEncoderBuilder;->mConfig:Lcom/wmspanel/libstream/AudioConfig;

    iget v2, v2, Lcom/wmspanel/libstream/AudioConfig;->channelCount:I

    if-ge v1, v2, :cond_4

    .line 40
    iget-object v2, p0, Lcom/wmspanel/libstream/AudioEncoderBuilder;->mConfig:Lcom/wmspanel/libstream/AudioConfig;

    iput v1, v2, Lcom/wmspanel/libstream/AudioConfig;->channelCount:I

    .line 42
    :cond_4
    iget-object v1, p0, Lcom/wmspanel/libstream/AudioEncoderBuilder;->mConfig:Lcom/wmspanel/libstream/AudioConfig;

    iget v1, v1, Lcom/wmspanel/libstream/AudioConfig;->channelCount:I

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/AudioEncoder;->setChannelCount(I)V

    .line 44
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/AudioEncoder;->setAACProfile(I)V

    .line 46
    iget-object v1, p0, Lcom/wmspanel/libstream/AudioEncoderBuilder;->mConfig:Lcom/wmspanel/libstream/AudioConfig;

    iget v1, v1, Lcom/wmspanel/libstream/AudioConfig;->bitRate:I

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/AudioEncoder;->setBitRate(I)V

    goto :goto_0

    .line 26
    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_6
    move v1, v2

    goto :goto_2
.end method

.method setConfig(Lcom/wmspanel/libstream/AudioConfig;)V
    .locals 0
    .param p1, "config"    # Lcom/wmspanel/libstream/AudioConfig;

    .prologue
    .line 11
    iput-object p1, p0, Lcom/wmspanel/libstream/AudioEncoderBuilder;->mConfig:Lcom/wmspanel/libstream/AudioConfig;

    .line 12
    return-void
.end method
