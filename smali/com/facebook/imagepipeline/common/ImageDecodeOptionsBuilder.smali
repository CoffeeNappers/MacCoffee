.class public Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;
.super Ljava/lang/Object;
.source "ImageDecodeOptionsBuilder.java"


# instance fields
.field private mBitmapConfig:Landroid/graphics/Bitmap$Config;

.field private mDecodeAllFrames:Z

.field private mDecodePreviewFrame:Z

.field private mForceStaticImage:Z

.field private mMinDecodeIntervalMs:I

.field private mUseLastFrameForPreview:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/16 v0, 0x64

    iput v0, p0, Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;->mMinDecodeIntervalMs:I

    .line 24
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v0, p0, Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;->mBitmapConfig:Landroid/graphics/Bitmap$Config;

    .line 27
    return-void
.end method


# virtual methods
.method public build()Lcom/facebook/imagepipeline/common/ImageDecodeOptions;
    .locals 1

    .prologue
    .line 174
    new-instance v0, Lcom/facebook/imagepipeline/common/ImageDecodeOptions;

    invoke-direct {v0, p0}, Lcom/facebook/imagepipeline/common/ImageDecodeOptions;-><init>(Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;)V

    return-object v0
.end method

.method public getBitmapConfig()Landroid/graphics/Bitmap$Config;
    .locals 1

    .prologue
    .line 157
    iget-object v0, p0, Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;->mBitmapConfig:Landroid/graphics/Bitmap$Config;

    return-object v0
.end method

.method public getDecodeAllFrames()Z
    .locals 1

    .prologue
    .line 115
    iget-boolean v0, p0, Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;->mDecodeAllFrames:Z

    return v0
.end method

.method public getDecodePreviewFrame()Z
    .locals 1

    .prologue
    .line 84
    iget-boolean v0, p0, Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;->mDecodePreviewFrame:Z

    return v0
.end method

.method public getForceStaticImage()Z
    .locals 1

    .prologue
    .line 148
    iget-boolean v0, p0, Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;->mForceStaticImage:Z

    return v0
.end method

.method public getMinDecodeIntervalMs()I
    .locals 1

    .prologue
    .line 64
    iget v0, p0, Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;->mMinDecodeIntervalMs:I

    return v0
.end method

.method public getUseLastFrameForPreview()Z
    .locals 1

    .prologue
    .line 93
    iget-boolean v0, p0, Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;->mUseLastFrameForPreview:Z

    return v0
.end method

.method public setBitmapConfig(Landroid/graphics/Bitmap$Config;)V
    .locals 0
    .param p1, "bitmapConfig"    # Landroid/graphics/Bitmap$Config;

    .prologue
    .line 165
    iput-object p1, p0, Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;->mBitmapConfig:Landroid/graphics/Bitmap$Config;

    .line 166
    return-void
.end method

.method public setDecodeAllFrames(Z)Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;
    .locals 0
    .param p1, "decodeAllFrames"    # Z

    .prologue
    .line 127
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;->mDecodeAllFrames:Z

    .line 128
    return-object p0
.end method

.method public setDecodePreviewFrame(Z)Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;
    .locals 0
    .param p1, "decodePreviewFrame"    # Z

    .prologue
    .line 74
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;->mDecodePreviewFrame:Z

    .line 75
    return-object p0
.end method

.method public setForceStaticImage(Z)Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;
    .locals 0
    .param p1, "forceStaticImage"    # Z

    .prologue
    .line 138
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;->mForceStaticImage:Z

    .line 139
    return-object p0
.end method

.method public setFrom(Lcom/facebook/imagepipeline/common/ImageDecodeOptions;)Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;
    .locals 1
    .param p1, "options"    # Lcom/facebook/imagepipeline/common/ImageDecodeOptions;

    .prologue
    .line 36
    iget-boolean v0, p1, Lcom/facebook/imagepipeline/common/ImageDecodeOptions;->decodePreviewFrame:Z

    iput-boolean v0, p0, Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;->mDecodePreviewFrame:Z

    .line 37
    iget-boolean v0, p1, Lcom/facebook/imagepipeline/common/ImageDecodeOptions;->useLastFrameForPreview:Z

    iput-boolean v0, p0, Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;->mUseLastFrameForPreview:Z

    .line 38
    iget-boolean v0, p1, Lcom/facebook/imagepipeline/common/ImageDecodeOptions;->decodeAllFrames:Z

    iput-boolean v0, p0, Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;->mDecodeAllFrames:Z

    .line 39
    iget-boolean v0, p1, Lcom/facebook/imagepipeline/common/ImageDecodeOptions;->forceStaticImage:Z

    iput-boolean v0, p0, Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;->mForceStaticImage:Z

    .line 40
    iget-object v0, p1, Lcom/facebook/imagepipeline/common/ImageDecodeOptions;->bitmapConfig:Landroid/graphics/Bitmap$Config;

    iput-object v0, p0, Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;->mBitmapConfig:Landroid/graphics/Bitmap$Config;

    .line 41
    return-object p0
.end method

.method public setMinDecodeIntervalMs(I)Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;
    .locals 0
    .param p1, "intervalMs"    # I

    .prologue
    .line 54
    iput p1, p0, Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;->mMinDecodeIntervalMs:I

    .line 55
    return-object p0
.end method

.method public setUseLastFrameForPreview(Z)Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;
    .locals 0
    .param p1, "useLastFrameForPreview"    # Z

    .prologue
    .line 103
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/common/ImageDecodeOptionsBuilder;->mUseLastFrameForPreview:Z

    .line 104
    return-object p0
.end method
