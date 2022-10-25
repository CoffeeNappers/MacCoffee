.class public Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;
.super Ljava/lang/Object;
.source "DefaultImageDecoder.java"

# interfaces
.implements Lcom/facebook/imagepipeline/decoder/ImageDecoder;


# instance fields
.field private final mAnimatedImageFactory:Lcom/facebook/imagepipeline/animated/factory/AnimatedImageFactory;

.field private final mBitmapConfig:Landroid/graphics/Bitmap$Config;

.field private final mCustomDecoders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/facebook/imageformat/ImageFormat;",
            "Lcom/facebook/imagepipeline/decoder/ImageDecoder;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mDefaultDecoder:Lcom/facebook/imagepipeline/decoder/ImageDecoder;

.field private final mPlatformDecoder:Lcom/facebook/imagepipeline/platform/PlatformDecoder;


# direct methods
.method public constructor <init>(Lcom/facebook/imagepipeline/animated/factory/AnimatedImageFactory;Lcom/facebook/imagepipeline/platform/PlatformDecoder;Landroid/graphics/Bitmap$Config;)V
    .locals 1
    .param p1, "animatedImageFactory"    # Lcom/facebook/imagepipeline/animated/factory/AnimatedImageFactory;
    .param p2, "platformDecoder"    # Lcom/facebook/imagepipeline/platform/PlatformDecoder;
    .param p3, "bitmapConfig"    # Landroid/graphics/Bitmap$Config;

    .prologue
    .line 82
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;-><init>(Lcom/facebook/imagepipeline/animated/factory/AnimatedImageFactory;Lcom/facebook/imagepipeline/platform/PlatformDecoder;Landroid/graphics/Bitmap$Config;Ljava/util/Map;)V

    .line 83
    return-void
.end method

.method public constructor <init>(Lcom/facebook/imagepipeline/animated/factory/AnimatedImageFactory;Lcom/facebook/imagepipeline/platform/PlatformDecoder;Landroid/graphics/Bitmap$Config;Ljava/util/Map;)V
    .locals 1
    .param p1, "animatedImageFactory"    # Lcom/facebook/imagepipeline/animated/factory/AnimatedImageFactory;
    .param p2, "platformDecoder"    # Lcom/facebook/imagepipeline/platform/PlatformDecoder;
    .param p3, "bitmapConfig"    # Landroid/graphics/Bitmap$Config;
    .param p4    # Ljava/util/Map;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/animated/factory/AnimatedImageFactory;",
            "Lcom/facebook/imagepipeline/platform/PlatformDecoder;",
            "Landroid/graphics/Bitmap$Config;",
            "Ljava/util/Map",
            "<",
            "Lcom/facebook/imageformat/ImageFormat;",
            "Lcom/facebook/imagepipeline/decoder/ImageDecoder;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 89
    .local p4, "customDecoders":Ljava/util/Map;, "Ljava/util/Map<Lcom/facebook/imageformat/ImageFormat;Lcom/facebook/imagepipeline/decoder/ImageDecoder;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    new-instance v0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder$1;

    invoke-direct {v0, p0}, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder$1;-><init>(Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;)V

    iput-object v0, p0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;->mDefaultDecoder:Lcom/facebook/imagepipeline/decoder/ImageDecoder;

    .line 90
    iput-object p1, p0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;->mAnimatedImageFactory:Lcom/facebook/imagepipeline/animated/factory/AnimatedImageFactory;

    .line 91
    iput-object p3, p0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;->mBitmapConfig:Landroid/graphics/Bitmap$Config;

    .line 92
    iput-object p2, p0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;->mPlatformDecoder:Lcom/facebook/imagepipeline/platform/PlatformDecoder;

    .line 93
    iput-object p4, p0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;->mCustomDecoders:Ljava/util/Map;

    .line 94
    return-void
.end method


# virtual methods
.method public decode(Lcom/facebook/imagepipeline/image/EncodedImage;ILcom/facebook/imagepipeline/image/QualityInfo;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;)Lcom/facebook/imagepipeline/image/CloseableImage;
    .locals 3
    .param p1, "encodedImage"    # Lcom/facebook/imagepipeline/image/EncodedImage;
    .param p2, "length"    # I
    .param p3, "qualityInfo"    # Lcom/facebook/imagepipeline/image/QualityInfo;
    .param p4, "options"    # Lcom/facebook/imagepipeline/common/ImageDecodeOptions;

    .prologue
    .line 111
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getImageFormat()Lcom/facebook/imageformat/ImageFormat;

    move-result-object v1

    .line 112
    .local v1, "imageFormat":Lcom/facebook/imageformat/ImageFormat;
    if-eqz v1, :cond_0

    sget-object v2, Lcom/facebook/imageformat/ImageFormat;->UNKNOWN:Lcom/facebook/imageformat/ImageFormat;

    if-ne v1, v2, :cond_1

    .line 114
    :cond_0
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 113
    invoke-static {v2}, Lcom/facebook/imageformat/ImageFormatChecker;->getImageFormat_WrapIOException(Ljava/io/InputStream;)Lcom/facebook/imageformat/ImageFormat;

    move-result-object v1

    .line 115
    invoke-virtual {p1, v1}, Lcom/facebook/imagepipeline/image/EncodedImage;->setImageFormat(Lcom/facebook/imageformat/ImageFormat;)V

    .line 117
    :cond_1
    iget-object v2, p0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;->mCustomDecoders:Ljava/util/Map;

    if-eqz v2, :cond_2

    .line 118
    iget-object v2, p0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;->mCustomDecoders:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/decoder/ImageDecoder;

    .line 119
    .local v0, "decoder":Lcom/facebook/imagepipeline/decoder/ImageDecoder;
    if-eqz v0, :cond_2

    .line 120
    invoke-interface {v0, p1, p2, p3, p4}, Lcom/facebook/imagepipeline/decoder/ImageDecoder;->decode(Lcom/facebook/imagepipeline/image/EncodedImage;ILcom/facebook/imagepipeline/image/QualityInfo;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;)Lcom/facebook/imagepipeline/image/CloseableImage;

    move-result-object v2

    .line 123
    .end local v0    # "decoder":Lcom/facebook/imagepipeline/decoder/ImageDecoder;
    :goto_0
    return-object v2

    :cond_2
    iget-object v2, p0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;->mDefaultDecoder:Lcom/facebook/imagepipeline/decoder/ImageDecoder;

    invoke-interface {v2, p1, p2, p3, p4}, Lcom/facebook/imagepipeline/decoder/ImageDecoder;->decode(Lcom/facebook/imagepipeline/image/EncodedImage;ILcom/facebook/imagepipeline/image/QualityInfo;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;)Lcom/facebook/imagepipeline/image/CloseableImage;

    move-result-object v2

    goto :goto_0
.end method

.method public decodeAnimatedWebp(Lcom/facebook/imagepipeline/image/EncodedImage;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;)Lcom/facebook/imagepipeline/image/CloseableImage;
    .locals 2
    .param p1, "encodedImage"    # Lcom/facebook/imagepipeline/image/EncodedImage;
    .param p2, "options"    # Lcom/facebook/imagepipeline/common/ImageDecodeOptions;

    .prologue
    .line 206
    iget-object v0, p0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;->mAnimatedImageFactory:Lcom/facebook/imagepipeline/animated/factory/AnimatedImageFactory;

    iget-object v1, p0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;->mBitmapConfig:Landroid/graphics/Bitmap$Config;

    invoke-interface {v0, p1, p2, v1}, Lcom/facebook/imagepipeline/animated/factory/AnimatedImageFactory;->decodeWebP(Lcom/facebook/imagepipeline/image/EncodedImage;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;Landroid/graphics/Bitmap$Config;)Lcom/facebook/imagepipeline/image/CloseableImage;

    move-result-object v0

    return-object v0
.end method

.method public decodeGif(Lcom/facebook/imagepipeline/image/EncodedImage;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;)Lcom/facebook/imagepipeline/image/CloseableImage;
    .locals 3
    .param p1, "encodedImage"    # Lcom/facebook/imagepipeline/image/EncodedImage;
    .param p2, "options"    # Lcom/facebook/imagepipeline/common/ImageDecodeOptions;

    .prologue
    .line 135
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 136
    .local v0, "is":Ljava/io/InputStream;
    if-nez v0, :cond_0

    .line 137
    const/4 v1, 0x0

    .line 144
    :goto_0
    return-object v1

    .line 140
    :cond_0
    :try_start_0
    iget-boolean v1, p2, Lcom/facebook/imagepipeline/common/ImageDecodeOptions;->forceStaticImage:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;->mAnimatedImageFactory:Lcom/facebook/imagepipeline/animated/factory/AnimatedImageFactory;

    if-eqz v1, :cond_1

    .line 142
    iget-object v1, p0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;->mAnimatedImageFactory:Lcom/facebook/imagepipeline/animated/factory/AnimatedImageFactory;

    iget-object v2, p0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;->mBitmapConfig:Landroid/graphics/Bitmap$Config;

    invoke-interface {v1, p1, p2, v2}, Lcom/facebook/imagepipeline/animated/factory/AnimatedImageFactory;->decodeGif(Lcom/facebook/imagepipeline/image/EncodedImage;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;Landroid/graphics/Bitmap$Config;)Lcom/facebook/imagepipeline/image/CloseableImage;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 146
    invoke-static {v0}, Lcom/facebook/common/internal/Closeables;->closeQuietly(Ljava/io/InputStream;)V

    goto :goto_0

    .line 144
    :cond_1
    :try_start_1
    invoke-virtual {p0, p1, p2}, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;->decodeStaticImage(Lcom/facebook/imagepipeline/image/EncodedImage;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;)Lcom/facebook/imagepipeline/image/CloseableStaticBitmap;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    .line 146
    invoke-static {v0}, Lcom/facebook/common/internal/Closeables;->closeQuietly(Ljava/io/InputStream;)V

    goto :goto_0

    :catchall_0
    move-exception v1

    invoke-static {v0}, Lcom/facebook/common/internal/Closeables;->closeQuietly(Ljava/io/InputStream;)V

    throw v1
.end method

.method public decodeJpeg(Lcom/facebook/imagepipeline/image/EncodedImage;ILcom/facebook/imagepipeline/image/QualityInfo;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;)Lcom/facebook/imagepipeline/image/CloseableStaticBitmap;
    .locals 3
    .param p1, "encodedImage"    # Lcom/facebook/imagepipeline/image/EncodedImage;
    .param p2, "length"    # I
    .param p3, "qualityInfo"    # Lcom/facebook/imagepipeline/image/QualityInfo;
    .param p4, "options"    # Lcom/facebook/imagepipeline/common/ImageDecodeOptions;

    .prologue
    .line 182
    iget-object v1, p0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;->mPlatformDecoder:Lcom/facebook/imagepipeline/platform/PlatformDecoder;

    iget-object v2, p4, Lcom/facebook/imagepipeline/common/ImageDecodeOptions;->bitmapConfig:Landroid/graphics/Bitmap$Config;

    .line 183
    invoke-interface {v1, p1, v2, p2}, Lcom/facebook/imagepipeline/platform/PlatformDecoder;->decodeJPEGFromEncodedImage(Lcom/facebook/imagepipeline/image/EncodedImage;Landroid/graphics/Bitmap$Config;I)Lcom/facebook/common/references/CloseableReference;

    move-result-object v0

    .line 185
    .local v0, "bitmapReference":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Landroid/graphics/Bitmap;>;"
    :try_start_0
    new-instance v1, Lcom/facebook/imagepipeline/image/CloseableStaticBitmap;

    .line 188
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getRotationAngle()I

    move-result v2

    invoke-direct {v1, v0, p3, v2}, Lcom/facebook/imagepipeline/image/CloseableStaticBitmap;-><init>(Lcom/facebook/common/references/CloseableReference;Lcom/facebook/imagepipeline/image/QualityInfo;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 190
    invoke-virtual {v0}, Lcom/facebook/common/references/CloseableReference;->close()V

    .line 185
    return-object v1

    .line 190
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lcom/facebook/common/references/CloseableReference;->close()V

    throw v1
.end method

.method public decodeStaticImage(Lcom/facebook/imagepipeline/image/EncodedImage;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;)Lcom/facebook/imagepipeline/image/CloseableStaticBitmap;
    .locals 4
    .param p1, "encodedImage"    # Lcom/facebook/imagepipeline/image/EncodedImage;
    .param p2, "options"    # Lcom/facebook/imagepipeline/common/ImageDecodeOptions;

    .prologue
    .line 157
    iget-object v1, p0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;->mPlatformDecoder:Lcom/facebook/imagepipeline/platform/PlatformDecoder;

    iget-object v2, p2, Lcom/facebook/imagepipeline/common/ImageDecodeOptions;->bitmapConfig:Landroid/graphics/Bitmap$Config;

    .line 158
    invoke-interface {v1, p1, v2}, Lcom/facebook/imagepipeline/platform/PlatformDecoder;->decodeFromEncodedImage(Lcom/facebook/imagepipeline/image/EncodedImage;Landroid/graphics/Bitmap$Config;)Lcom/facebook/common/references/CloseableReference;

    move-result-object v0

    .line 160
    .local v0, "bitmapReference":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Landroid/graphics/Bitmap;>;"
    :try_start_0
    new-instance v1, Lcom/facebook/imagepipeline/image/CloseableStaticBitmap;

    sget-object v2, Lcom/facebook/imagepipeline/image/ImmutableQualityInfo;->FULL_QUALITY:Lcom/facebook/imagepipeline/image/QualityInfo;

    .line 163
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getRotationAngle()I

    move-result v3

    invoke-direct {v1, v0, v2, v3}, Lcom/facebook/imagepipeline/image/CloseableStaticBitmap;-><init>(Lcom/facebook/common/references/CloseableReference;Lcom/facebook/imagepipeline/image/QualityInfo;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 165
    invoke-virtual {v0}, Lcom/facebook/common/references/CloseableReference;->close()V

    .line 160
    return-object v1

    .line 165
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lcom/facebook/common/references/CloseableReference;->close()V

    throw v1
.end method
