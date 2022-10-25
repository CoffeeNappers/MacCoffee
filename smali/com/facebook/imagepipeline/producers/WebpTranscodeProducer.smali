.class public Lcom/facebook/imagepipeline/producers/WebpTranscodeProducer;
.super Ljava/lang/Object;
.source "WebpTranscodeProducer.java"

# interfaces
.implements Lcom/facebook/imagepipeline/producers/Producer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/producers/WebpTranscodeProducer$WebpTranscodeConsumer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/facebook/imagepipeline/producers/Producer",
        "<",
        "Lcom/facebook/imagepipeline/image/EncodedImage;",
        ">;"
    }
.end annotation


# static fields
.field private static final DEFAULT_JPEG_QUALITY:I = 0x50

.field public static final PRODUCER_NAME:Ljava/lang/String; = "WebpTranscodeProducer"


# instance fields
.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private final mInputProducer:Lcom/facebook/imagepipeline/producers/Producer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/producers/Producer",
            "<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation
.end field

.field private final mPooledByteBufferFactory:Lcom/facebook/imagepipeline/memory/PooledByteBufferFactory;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;Lcom/facebook/imagepipeline/memory/PooledByteBufferFactory;Lcom/facebook/imagepipeline/producers/Producer;)V
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "pooledByteBufferFactory"    # Lcom/facebook/imagepipeline/memory/PooledByteBufferFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "Lcom/facebook/imagepipeline/memory/PooledByteBufferFactory;",
            "Lcom/facebook/imagepipeline/producers/Producer",
            "<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 56
    .local p3, "inputProducer":Lcom/facebook/imagepipeline/producers/Producer;, "Lcom/facebook/imagepipeline/producers/Producer<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Executor;

    iput-object v0, p0, Lcom/facebook/imagepipeline/producers/WebpTranscodeProducer;->mExecutor:Ljava/util/concurrent/Executor;

    .line 58
    invoke-static {p2}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/memory/PooledByteBufferFactory;

    iput-object v0, p0, Lcom/facebook/imagepipeline/producers/WebpTranscodeProducer;->mPooledByteBufferFactory:Lcom/facebook/imagepipeline/memory/PooledByteBufferFactory;

    .line 59
    invoke-static {p3}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    iput-object v0, p0, Lcom/facebook/imagepipeline/producers/WebpTranscodeProducer;->mInputProducer:Lcom/facebook/imagepipeline/producers/Producer;

    .line 60
    return-void
.end method

.method static synthetic access$000(Lcom/facebook/imagepipeline/image/EncodedImage;)Lcom/facebook/common/util/TriState;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/imagepipeline/image/EncodedImage;

    .prologue
    .line 44
    invoke-static {p0}, Lcom/facebook/imagepipeline/producers/WebpTranscodeProducer;->shouldTranscode(Lcom/facebook/imagepipeline/image/EncodedImage;)Lcom/facebook/common/util/TriState;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/facebook/imagepipeline/producers/WebpTranscodeProducer;Lcom/facebook/imagepipeline/image/EncodedImage;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V
    .locals 0
    .param p0, "x0"    # Lcom/facebook/imagepipeline/producers/WebpTranscodeProducer;
    .param p1, "x1"    # Lcom/facebook/imagepipeline/image/EncodedImage;
    .param p2, "x2"    # Lcom/facebook/imagepipeline/producers/Consumer;
    .param p3, "x3"    # Lcom/facebook/imagepipeline/producers/ProducerContext;

    .prologue
    .line 44
    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/imagepipeline/producers/WebpTranscodeProducer;->transcodeLastResult(Lcom/facebook/imagepipeline/image/EncodedImage;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    return-void
.end method

.method static synthetic access$200(Lcom/facebook/imagepipeline/producers/WebpTranscodeProducer;)Lcom/facebook/imagepipeline/memory/PooledByteBufferFactory;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/imagepipeline/producers/WebpTranscodeProducer;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/WebpTranscodeProducer;->mPooledByteBufferFactory:Lcom/facebook/imagepipeline/memory/PooledByteBufferFactory;

    return-object v0
.end method

.method static synthetic access$300(Lcom/facebook/imagepipeline/image/EncodedImage;Lcom/facebook/imagepipeline/memory/PooledByteBufferOutputStream;)V
    .locals 0
    .param p0, "x0"    # Lcom/facebook/imagepipeline/image/EncodedImage;
    .param p1, "x1"    # Lcom/facebook/imagepipeline/memory/PooledByteBufferOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 44
    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/producers/WebpTranscodeProducer;->doTranscode(Lcom/facebook/imagepipeline/image/EncodedImage;Lcom/facebook/imagepipeline/memory/PooledByteBufferOutputStream;)V

    return-void
.end method

.method private static doTranscode(Lcom/facebook/imagepipeline/image/EncodedImage;Lcom/facebook/imagepipeline/memory/PooledByteBufferOutputStream;)V
    .locals 4
    .param p0, "encodedImage"    # Lcom/facebook/imagepipeline/image/EncodedImage;
    .param p1, "outputStream"    # Lcom/facebook/imagepipeline/memory/PooledByteBufferOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 182
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/image/EncodedImage;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 183
    .local v1, "imageInputStream":Ljava/io/InputStream;
    invoke-static {v1}, Lcom/facebook/imageformat/ImageFormatChecker;->getImageFormat_WrapIOException(Ljava/io/InputStream;)Lcom/facebook/imageformat/ImageFormat;

    move-result-object v0

    .line 184
    .local v0, "imageFormat":Lcom/facebook/imageformat/ImageFormat;
    sget-object v2, Lcom/facebook/imageformat/DefaultImageFormats;->WEBP_SIMPLE:Lcom/facebook/imageformat/ImageFormat;

    if-eq v0, v2, :cond_0

    sget-object v2, Lcom/facebook/imageformat/DefaultImageFormats;->WEBP_EXTENDED:Lcom/facebook/imageformat/ImageFormat;

    if-ne v0, v2, :cond_1

    .line 186
    :cond_0
    invoke-static {}, Lcom/facebook/imagepipeline/nativecode/WebpTranscoderFactory;->getWebpTranscoder()Lcom/facebook/imagepipeline/nativecode/WebpTranscoder;

    move-result-object v2

    const/16 v3, 0x50

    invoke-interface {v2, v1, p1, v3}, Lcom/facebook/imagepipeline/nativecode/WebpTranscoder;->transcodeWebpToJpeg(Ljava/io/InputStream;Ljava/io/OutputStream;I)V

    .line 198
    :goto_0
    return-void

    .line 190
    :cond_1
    sget-object v2, Lcom/facebook/imageformat/DefaultImageFormats;->WEBP_LOSSLESS:Lcom/facebook/imageformat/ImageFormat;

    if-eq v0, v2, :cond_2

    sget-object v2, Lcom/facebook/imageformat/DefaultImageFormats;->WEBP_EXTENDED_WITH_ALPHA:Lcom/facebook/imageformat/ImageFormat;

    if-ne v0, v2, :cond_3

    .line 193
    :cond_2
    invoke-static {}, Lcom/facebook/imagepipeline/nativecode/WebpTranscoderFactory;->getWebpTranscoder()Lcom/facebook/imagepipeline/nativecode/WebpTranscoder;

    move-result-object v2

    .line 194
    invoke-interface {v2, v1, p1}, Lcom/facebook/imagepipeline/nativecode/WebpTranscoder;->transcodeWebpToPng(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    goto :goto_0

    .line 196
    :cond_3
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "Wrong image format"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static shouldTranscode(Lcom/facebook/imagepipeline/image/EncodedImage;)Lcom/facebook/common/util/TriState;
    .locals 3
    .param p0, "encodedImage"    # Lcom/facebook/imagepipeline/image/EncodedImage;

    .prologue
    .line 160
    invoke-static {p0}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/image/EncodedImage;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 161
    invoke-static {v2}, Lcom/facebook/imageformat/ImageFormatChecker;->getImageFormat_WrapIOException(Ljava/io/InputStream;)Lcom/facebook/imageformat/ImageFormat;

    move-result-object v0

    .line 163
    .local v0, "imageFormat":Lcom/facebook/imageformat/ImageFormat;
    invoke-static {v0}, Lcom/facebook/imageformat/DefaultImageFormats;->isStaticWebpFormat(Lcom/facebook/imageformat/ImageFormat;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 164
    invoke-static {}, Lcom/facebook/imagepipeline/nativecode/WebpTranscoderFactory;->getWebpTranscoder()Lcom/facebook/imagepipeline/nativecode/WebpTranscoder;

    move-result-object v1

    .line 165
    .local v1, "webpTranscoder":Lcom/facebook/imagepipeline/nativecode/WebpTranscoder;
    if-nez v1, :cond_0

    .line 166
    sget-object v2, Lcom/facebook/common/util/TriState;->NO:Lcom/facebook/common/util/TriState;

    .line 176
    .end local v1    # "webpTranscoder":Lcom/facebook/imagepipeline/nativecode/WebpTranscoder;
    :goto_0
    return-object v2

    .line 169
    .restart local v1    # "webpTranscoder":Lcom/facebook/imagepipeline/nativecode/WebpTranscoder;
    :cond_0
    invoke-interface {v1, v0}, Lcom/facebook/imagepipeline/nativecode/WebpTranscoder;->isWebpNativelySupported(Lcom/facebook/imageformat/ImageFormat;)Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v2, 0x1

    .line 168
    :goto_1
    invoke-static {v2}, Lcom/facebook/common/util/TriState;->valueOf(Z)Lcom/facebook/common/util/TriState;

    move-result-object v2

    goto :goto_0

    .line 169
    :cond_1
    const/4 v2, 0x0

    goto :goto_1

    .line 170
    .end local v1    # "webpTranscoder":Lcom/facebook/imagepipeline/nativecode/WebpTranscoder;
    :cond_2
    sget-object v2, Lcom/facebook/imageformat/ImageFormat;->UNKNOWN:Lcom/facebook/imageformat/ImageFormat;

    if-ne v0, v2, :cond_3

    .line 173
    sget-object v2, Lcom/facebook/common/util/TriState;->UNSET:Lcom/facebook/common/util/TriState;

    goto :goto_0

    .line 176
    :cond_3
    sget-object v2, Lcom/facebook/common/util/TriState;->NO:Lcom/facebook/common/util/TriState;

    goto :goto_0
.end method

.method private transcodeLastResult(Lcom/facebook/imagepipeline/image/EncodedImage;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V
    .locals 7
    .param p1, "originalResult"    # Lcom/facebook/imagepipeline/image/EncodedImage;
    .param p3, "producerContext"    # Lcom/facebook/imagepipeline/producers/ProducerContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            "Lcom/facebook/imagepipeline/producers/Consumer",
            "<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;",
            "Lcom/facebook/imagepipeline/producers/ProducerContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 106
    .local p2, "consumer":Lcom/facebook/imagepipeline/producers/Consumer;, "Lcom/facebook/imagepipeline/producers/Consumer<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    invoke-static {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->cloneOrNull(Lcom/facebook/imagepipeline/image/EncodedImage;)Lcom/facebook/imagepipeline/image/EncodedImage;

    move-result-object v6

    .line 108
    .local v6, "encodedImageCopy":Lcom/facebook/imagepipeline/image/EncodedImage;
    new-instance v0, Lcom/facebook/imagepipeline/producers/WebpTranscodeProducer$1;

    .line 111
    invoke-interface {p3}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getListener()Lcom/facebook/imagepipeline/producers/ProducerListener;

    move-result-object v3

    const-string/jumbo v4, "WebpTranscodeProducer"

    .line 113
    invoke-interface {p3}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getId()Ljava/lang/String;

    move-result-object v5

    move-object v1, p0

    move-object v2, p2

    invoke-direct/range {v0 .. v6}, Lcom/facebook/imagepipeline/producers/WebpTranscodeProducer$1;-><init>(Lcom/facebook/imagepipeline/producers/WebpTranscodeProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerListener;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/imagepipeline/image/EncodedImage;)V

    .line 156
    .local v0, "runnable":Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;, "Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/WebpTranscodeProducer;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 157
    return-void
.end method


# virtual methods
.method public produceResults(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V
    .locals 2
    .param p2, "context"    # Lcom/facebook/imagepipeline/producers/ProducerContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Consumer",
            "<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;",
            "Lcom/facebook/imagepipeline/producers/ProducerContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 64
    .local p1, "consumer":Lcom/facebook/imagepipeline/producers/Consumer;, "Lcom/facebook/imagepipeline/producers/Consumer<Lcom/facebook/imagepipeline/image/EncodedImage;>;"
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/WebpTranscodeProducer;->mInputProducer:Lcom/facebook/imagepipeline/producers/Producer;

    new-instance v1, Lcom/facebook/imagepipeline/producers/WebpTranscodeProducer$WebpTranscodeConsumer;

    invoke-direct {v1, p0, p1, p2}, Lcom/facebook/imagepipeline/producers/WebpTranscodeProducer$WebpTranscodeConsumer;-><init>(Lcom/facebook/imagepipeline/producers/WebpTranscodeProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    invoke-interface {v0, v1, p2}, Lcom/facebook/imagepipeline/producers/Producer;->produceResults(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    .line 65
    return-void
.end method
