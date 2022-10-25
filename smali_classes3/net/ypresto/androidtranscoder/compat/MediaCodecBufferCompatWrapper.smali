.class public Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;
.super Ljava/lang/Object;
.source "MediaCodecBufferCompatWrapper.java"


# instance fields
.field final mInputBuffers:[Ljava/nio/ByteBuffer;

.field final mMediaCodec:Landroid/media/MediaCodec;

.field final mOutputBuffers:[Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>(Landroid/media/MediaCodec;)V
    .locals 2
    .param p1, "mediaCodec"    # Landroid/media/MediaCodec;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 21
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_0

    .line 22
    invoke-virtual {p1}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;->mInputBuffers:[Ljava/nio/ByteBuffer;

    .line 23
    invoke-virtual {p1}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;->mOutputBuffers:[Ljava/nio/ByteBuffer;

    .line 27
    :goto_0
    return-void

    .line 25
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;->mOutputBuffers:[Ljava/nio/ByteBuffer;

    iput-object v0, p0, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;->mInputBuffers:[Ljava/nio/ByteBuffer;

    goto :goto_0
.end method


# virtual methods
.method public getInputBuffer(I)Ljava/nio/ByteBuffer;
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 30
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 31
    iget-object v0, p0, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0, p1}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 33
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;->mInputBuffers:[Ljava/nio/ByteBuffer;

    aget-object v0, v0, p1

    goto :goto_0
.end method

.method public getOutputBuffer(I)Ljava/nio/ByteBuffer;
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 37
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 38
    iget-object v0, p0, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0, p1}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 40
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lnet/ypresto/androidtranscoder/compat/MediaCodecBufferCompatWrapper;->mOutputBuffers:[Ljava/nio/ByteBuffer;

    aget-object v0, v0, p1

    goto :goto_0
.end method
