.class abstract Lcom/wmspanel/libstream/MediaCodecState;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wmspanel/libstream/MediaCodecState$a;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MediaCodecState"


# instance fields
.field mCap:Landroid/media/MediaCodecInfo$CodecCapabilities;

.field mEncoder:Landroid/media/MediaCodec;

.field mFormat:Landroid/media/MediaFormat;

.field private mState:Lcom/wmspanel/libstream/MediaCodecState$a;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    sget-object v0, Lcom/wmspanel/libstream/MediaCodecState$a;->Y:Lcom/wmspanel/libstream/MediaCodecState$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/MediaCodecState;->mState:Lcom/wmspanel/libstream/MediaCodecState$a;

    return-void
.end method

.method private setState(Lcom/wmspanel/libstream/MediaCodecState$a;)V
    .locals 0
    .param p1, "state"    # Lcom/wmspanel/libstream/MediaCodecState$a;

    .prologue
    .line 74
    iput-object p1, p0, Lcom/wmspanel/libstream/MediaCodecState;->mState:Lcom/wmspanel/libstream/MediaCodecState$a;

    .line 76
    return-void
.end method

.method private stop()V
    .locals 2

    .prologue
    .line 52
    iget-object v0, p0, Lcom/wmspanel/libstream/MediaCodecState;->mEncoder:Landroid/media/MediaCodec;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/MediaCodecState;->mState:Lcom/wmspanel/libstream/MediaCodecState$a;

    sget-object v1, Lcom/wmspanel/libstream/MediaCodecState$a;->aa:Lcom/wmspanel/libstream/MediaCodecState$a;

    if-ne v0, v1, :cond_0

    .line 53
    iget-object v0, p0, Lcom/wmspanel/libstream/MediaCodecState;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 54
    sget-object v0, Lcom/wmspanel/libstream/MediaCodecState$a;->Y:Lcom/wmspanel/libstream/MediaCodecState$a;

    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/MediaCodecState;->setState(Lcom/wmspanel/libstream/MediaCodecState$a;)V

    .line 56
    :cond_0
    return-void
.end method


# virtual methods
.method configure()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 38
    iget-object v0, p0, Lcom/wmspanel/libstream/MediaCodecState;->mEncoder:Landroid/media/MediaCodec;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/MediaCodecState;->mState:Lcom/wmspanel/libstream/MediaCodecState$a;

    sget-object v1, Lcom/wmspanel/libstream/MediaCodecState$a;->Y:Lcom/wmspanel/libstream/MediaCodecState$a;

    if-ne v0, v1, :cond_0

    .line 39
    iget-object v0, p0, Lcom/wmspanel/libstream/MediaCodecState;->mEncoder:Landroid/media/MediaCodec;

    iget-object v1, p0, Lcom/wmspanel/libstream/MediaCodecState;->mFormat:Landroid/media/MediaFormat;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v3, v3, v2}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 40
    sget-object v0, Lcom/wmspanel/libstream/MediaCodecState$a;->Z:Lcom/wmspanel/libstream/MediaCodecState$a;

    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/MediaCodecState;->setState(Lcom/wmspanel/libstream/MediaCodecState$a;)V

    .line 42
    :cond_0
    return-void
.end method

.method getEncoder()Landroid/media/MediaCodec;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/wmspanel/libstream/MediaCodecState;->mEncoder:Landroid/media/MediaCodec;

    return-object v0
.end method

.method getFormat()Landroid/media/MediaFormat;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/wmspanel/libstream/MediaCodecState;->mFormat:Landroid/media/MediaFormat;

    return-object v0
.end method

.method public declared-synchronized release()V
    .locals 1

    .prologue
    .line 59
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/MediaCodecState;->mEncoder:Landroid/media/MediaCodec;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 61
    :try_start_1
    invoke-direct {p0}, Lcom/wmspanel/libstream/MediaCodecState;->stop()V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 65
    :goto_0
    :try_start_2
    iget-object v0, p0, Lcom/wmspanel/libstream/MediaCodecState;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 66
    sget-object v0, Lcom/wmspanel/libstream/MediaCodecState$a;->ab:Lcom/wmspanel/libstream/MediaCodecState$a;

    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/MediaCodecState;->setState(Lcom/wmspanel/libstream/MediaCodecState$a;)V

    .line 67
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/MediaCodecState;->mEncoder:Landroid/media/MediaCodec;

    .line 69
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/MediaCodecState;->mFormat:Landroid/media/MediaFormat;

    .line 70
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/MediaCodecState;->mCap:Landroid/media/MediaCodecInfo$CodecCapabilities;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 71
    monitor-exit p0

    return-void

    .line 62
    :catch_0
    move-exception v0

    goto :goto_0

    .line 59
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method start()V
    .locals 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/wmspanel/libstream/MediaCodecState;->mEncoder:Landroid/media/MediaCodec;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/wmspanel/libstream/MediaCodecState;->mState:Lcom/wmspanel/libstream/MediaCodecState$a;

    sget-object v1, Lcom/wmspanel/libstream/MediaCodecState$a;->Z:Lcom/wmspanel/libstream/MediaCodecState$a;

    if-ne v0, v1, :cond_0

    .line 46
    iget-object v0, p0, Lcom/wmspanel/libstream/MediaCodecState;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 47
    sget-object v0, Lcom/wmspanel/libstream/MediaCodecState$a;->aa:Lcom/wmspanel/libstream/MediaCodecState$a;

    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/MediaCodecState;->setState(Lcom/wmspanel/libstream/MediaCodecState$a;)V

    .line 49
    :cond_0
    return-void
.end method
