.class public Lcom/vk/media/camera/CameraUtils$Frame;
.super Ljava/lang/Object;
.source "CameraUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/camera/CameraUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Frame"
.end annotation


# instance fields
.field private mHeight:I

.field private mPixels:Ljava/nio/IntBuffer;

.field private mRotation:I

.field private mTimestamp:J

.field private mWidth:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 249
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 250
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mPixels:Ljava/nio/IntBuffer;

    .line 251
    iput v1, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mWidth:I

    .line 252
    iput v1, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mHeight:I

    .line 253
    iput v1, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mRotation:I

    .line 254
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mTimestamp:J

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 2

    .prologue
    .line 315
    iget v0, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mWidth:I

    iget v1, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mHeight:I

    mul-int/2addr v0, v1

    if-lez v0, :cond_0

    .line 316
    iget-object v0, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mPixels:Ljava/nio/IntBuffer;

    invoke-virtual {v0}, Ljava/nio/IntBuffer;->array()[I

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 318
    :cond_0
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mTimestamp:J

    .line 319
    return-void
.end method

.method public exists()Z
    .locals 2

    .prologue
    .line 283
    iget v0, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mHeight:I

    iget v1, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mWidth:I

    mul-int/2addr v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 280
    iget v0, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mHeight:I

    return v0
.end method

.method public getPixels()Ljava/nio/IntBuffer;
    .locals 1

    .prologue
    .line 271
    iget-object v0, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mPixels:Ljava/nio/IntBuffer;

    invoke-virtual {v0}, Ljava/nio/IntBuffer;->rewind()Ljava/nio/Buffer;

    .line 272
    iget-object v0, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mPixels:Ljava/nio/IntBuffer;

    return-object v0
.end method

.method public getTimestamp()J
    .locals 2

    .prologue
    .line 286
    iget-wide v0, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mTimestamp:J

    return-wide v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 276
    iget v0, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mWidth:I

    return v0
.end method

.method public pull(Lcom/vk/media/camera/CameraUtils$Frame;)V
    .locals 4
    .param p1, "frame"    # Lcom/vk/media/camera/CameraUtils$Frame;

    .prologue
    const/4 v3, 0x0

    .line 257
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraUtils$Frame;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 268
    :goto_0
    return-void

    .line 260
    :cond_0
    iget v0, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mWidth:I

    iget v1, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mHeight:I

    invoke-virtual {p1, v0, v1}, Lcom/vk/media/camera/CameraUtils$Frame;->resize(II)Z

    .line 261
    iget-object v0, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mPixels:Ljava/nio/IntBuffer;

    invoke-virtual {v0}, Ljava/nio/IntBuffer;->rewind()Ljava/nio/Buffer;

    .line 262
    iget-object v0, p1, Lcom/vk/media/camera/CameraUtils$Frame;->mPixels:Ljava/nio/IntBuffer;

    invoke-virtual {v0}, Ljava/nio/IntBuffer;->rewind()Ljava/nio/Buffer;

    .line 264
    iget-object v0, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mPixels:Ljava/nio/IntBuffer;

    invoke-virtual {v0}, Ljava/nio/IntBuffer;->array()[I

    move-result-object v0

    iget-object v1, p1, Lcom/vk/media/camera/CameraUtils$Frame;->mPixels:Ljava/nio/IntBuffer;

    invoke-virtual {v1}, Ljava/nio/IntBuffer;->array()[I

    move-result-object v1

    iget-object v2, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mPixels:Ljava/nio/IntBuffer;

    invoke-virtual {v2}, Ljava/nio/IntBuffer;->limit()I

    move-result v2

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 265
    iget-wide v0, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mTimestamp:J

    iput-wide v0, p1, Lcom/vk/media/camera/CameraUtils$Frame;->mTimestamp:J

    .line 266
    iget v0, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mWidth:I

    iput v0, p1, Lcom/vk/media/camera/CameraUtils$Frame;->mWidth:I

    .line 267
    iget v0, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mHeight:I

    iput v0, p1, Lcom/vk/media/camera/CameraUtils$Frame;->mHeight:I

    goto :goto_0
.end method

.method public resize(II)Z
    .locals 2
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 305
    iget v0, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mWidth:I

    iget v1, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mHeight:I

    mul-int/2addr v0, v1

    mul-int v1, p1, p2

    if-eq v0, v1, :cond_0

    .line 306
    iput p1, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mWidth:I

    .line 307
    iput p2, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mHeight:I

    .line 308
    iget v0, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mWidth:I

    iget v1, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mHeight:I

    mul-int/2addr v0, v1

    invoke-static {v0}, Ljava/nio/IntBuffer;->allocate(I)Ljava/nio/IntBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mPixels:Ljava/nio/IntBuffer;

    .line 309
    const/4 v0, 0x1

    .line 311
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setRotation(I)V
    .locals 2
    .param p1, "rotation"    # I

    .prologue
    .line 294
    iget v1, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mRotation:I

    if-eq v1, p1, :cond_2

    .line 295
    const/16 v1, 0x5a

    if-eq p1, v1, :cond_0

    const/16 v1, 0x10e

    if-ne p1, v1, :cond_1

    .line 296
    :cond_0
    iget v0, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mWidth:I

    .line 297
    .local v0, "tmp":I
    iget v1, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mHeight:I

    iput v1, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mWidth:I

    .line 298
    iput v0, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mHeight:I

    .line 300
    .end local v0    # "tmp":I
    :cond_1
    iput p1, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mRotation:I

    .line 302
    :cond_2
    return-void
.end method

.method public setTimestamp(J)V
    .locals 1
    .param p1, "timestamp"    # J

    .prologue
    .line 290
    iput-wide p1, p0, Lcom/vk/media/camera/CameraUtils$Frame;->mTimestamp:J

    .line 291
    return-void
.end method
