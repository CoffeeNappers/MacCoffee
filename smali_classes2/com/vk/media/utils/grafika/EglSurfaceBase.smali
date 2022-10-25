.class public Lcom/vk/media/utils/grafika/EglSurfaceBase;
.super Ljava/lang/Object;
.source "EglSurfaceBase.java"


# static fields
.field protected static final TAG:Ljava/lang/String; = "MediaUtils"


# instance fields
.field private mEGLSurface:Landroid/opengl/EGLSurface;

.field protected mEglCore:Lcom/vk/media/utils/grafika/EglCore;

.field private mHeight:I

.field private mWidth:I


# direct methods
.method protected constructor <init>(Lcom/vk/media/utils/grafika/EglCore;)V
    .locals 2
    .param p1, "eglCore"    # Lcom/vk/media/utils/grafika/EglCore;

    .prologue
    const/4 v1, -0x1

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    .line 44
    iput v1, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mWidth:I

    .line 45
    iput v1, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mHeight:I

    .line 48
    iput-object p1, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEglCore:Lcom/vk/media/utils/grafika/EglCore;

    .line 49
    return-void
.end method


# virtual methods
.method public createOffscreenSurface(II)V
    .locals 2
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 72
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    if-eq v0, v1, :cond_0

    .line 73
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "surface already created"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 75
    :cond_0
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEglCore:Lcom/vk/media/utils/grafika/EglCore;

    invoke-virtual {v0, p1, p2}, Lcom/vk/media/utils/grafika/EglCore;->createOffscreenSurface(II)Landroid/opengl/EGLSurface;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    .line 76
    iput p1, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mWidth:I

    .line 77
    iput p2, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mHeight:I

    .line 78
    return-void
.end method

.method public createWindowSurface(Ljava/lang/Object;)V
    .locals 2
    .param p1, "surface"    # Ljava/lang/Object;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    if-eq v0, v1, :cond_0

    .line 58
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "surface already created"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 60
    :cond_0
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEglCore:Lcom/vk/media/utils/grafika/EglCore;

    invoke-virtual {v0, p1}, Lcom/vk/media/utils/grafika/EglCore;->createWindowSurface(Ljava/lang/Object;)Landroid/opengl/EGLSurface;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    .line 66
    return-void
.end method

.method public getHeight()I
    .locals 3

    .prologue
    .line 99
    iget v0, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mHeight:I

    if-gez v0, :cond_0

    .line 100
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEglCore:Lcom/vk/media/utils/grafika/EglCore;

    iget-object v1, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    const/16 v2, 0x3056

    invoke-virtual {v0, v1, v2}, Lcom/vk/media/utils/grafika/EglCore;->querySurface(Landroid/opengl/EGLSurface;I)I

    move-result v0

    .line 102
    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mHeight:I

    goto :goto_0
.end method

.method public getWidth()I
    .locals 3

    .prologue
    .line 88
    iget v0, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mWidth:I

    if-gez v0, :cond_0

    .line 89
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEglCore:Lcom/vk/media/utils/grafika/EglCore;

    iget-object v1, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    const/16 v2, 0x3057

    invoke-virtual {v0, v1, v2}, Lcom/vk/media/utils/grafika/EglCore;->querySurface(Landroid/opengl/EGLSurface;I)I

    move-result v0

    .line 91
    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mWidth:I

    goto :goto_0
.end method

.method public makeCurrent()V
    .locals 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEglCore:Lcom/vk/media/utils/grafika/EglCore;

    iget-object v1, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v0, v1}, Lcom/vk/media/utils/grafika/EglCore;->makeCurrent(Landroid/opengl/EGLSurface;)V

    .line 120
    return-void
.end method

.method public makeCurrentReadFrom(Lcom/vk/media/utils/grafika/EglSurfaceBase;)V
    .locals 3
    .param p1, "readSurface"    # Lcom/vk/media/utils/grafika/EglSurfaceBase;

    .prologue
    .line 127
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEglCore:Lcom/vk/media/utils/grafika/EglCore;

    iget-object v1, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    iget-object v2, p1, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v0, v1, v2}, Lcom/vk/media/utils/grafika/EglCore;->makeCurrent(Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;)V

    .line 128
    return-void
.end method

.method public releaseEglSurface()V
    .locals 2

    .prologue
    .line 110
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEglCore:Lcom/vk/media/utils/grafika/EglCore;

    iget-object v1, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v0, v1}, Lcom/vk/media/utils/grafika/EglCore;->releaseSurface(Landroid/opengl/EGLSurface;)V

    .line 111
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    .line 112
    const/4 v0, -0x1

    iput v0, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mHeight:I

    iput v0, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mWidth:I

    .line 113
    return-void
.end method

.method public saveFrame(Ljava/io/File;)V
    .locals 11
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 158
    iget-object v1, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEglCore:Lcom/vk/media/utils/grafika/EglCore;

    iget-object v4, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v1, v4}, Lcom/vk/media/utils/grafika/EglCore;->isCurrent(Landroid/opengl/EGLSurface;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 159
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Expected EGL context/surface is not current"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 174
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v10

    .line 176
    .local v10, "filename":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/vk/media/utils/grafika/EglSurfaceBase;->getWidth()I

    move-result v2

    .line 177
    .local v2, "width":I
    invoke-virtual {p0}, Lcom/vk/media/utils/grafika/EglSurfaceBase;->getHeight()I

    move-result v3

    .line 178
    .local v3, "height":I
    mul-int v1, v2, v3

    mul-int/lit8 v1, v1, 0x4

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 179
    .local v6, "buf":Ljava/nio/ByteBuffer;
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v6, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 180
    const/16 v4, 0x1908

    const/16 v5, 0x1401

    move v1, v0

    invoke-static/range {v0 .. v6}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 182
    const-string/jumbo v0, "glReadPixels"

    invoke-static {v0}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 183
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 185
    const/4 v8, 0x0

    .line 187
    .local v8, "bos":Ljava/io/BufferedOutputStream;
    :try_start_0
    new-instance v9, Ljava/io/BufferedOutputStream;

    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v9, v0}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 188
    .end local v8    # "bos":Ljava/io/BufferedOutputStream;
    .local v9, "bos":Ljava/io/BufferedOutputStream;
    :try_start_1
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 189
    .local v7, "bmp":Landroid/graphics/Bitmap;
    invoke-virtual {v7, v6}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 190
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v1, 0x5a

    invoke-virtual {v7, v0, v1, v9}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 191
    invoke-virtual {v7}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 193
    if-eqz v9, :cond_1

    invoke-virtual {v9}, Ljava/io/BufferedOutputStream;->close()V

    .line 195
    :cond_1
    const-string/jumbo v0, "MediaUtils"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Saved "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v4, "x"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v4, " frame as \'"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v4, "\'"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    return-void

    .line 193
    .end local v7    # "bmp":Landroid/graphics/Bitmap;
    .end local v9    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v8    # "bos":Ljava/io/BufferedOutputStream;
    :catchall_0
    move-exception v0

    :goto_0
    if-eqz v8, :cond_2

    invoke-virtual {v8}, Ljava/io/BufferedOutputStream;->close()V

    :cond_2
    throw v0

    .end local v8    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v9    # "bos":Ljava/io/BufferedOutputStream;
    :catchall_1
    move-exception v0

    move-object v8, v9

    .end local v9    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v8    # "bos":Ljava/io/BufferedOutputStream;
    goto :goto_0
.end method

.method public setPresentationTime(J)V
    .locals 3
    .param p1, "nsecs"    # J

    .prologue
    .line 149
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEglCore:Lcom/vk/media/utils/grafika/EglCore;

    iget-object v1, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v0, v1, p1, p2}, Lcom/vk/media/utils/grafika/EglCore;->setPresentationTime(Landroid/opengl/EGLSurface;J)V

    .line 150
    return-void
.end method

.method public swapBuffers()Z
    .locals 3

    .prologue
    .line 136
    iget-object v1, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEglCore:Lcom/vk/media/utils/grafika/EglCore;

    iget-object v2, p0, Lcom/vk/media/utils/grafika/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v1, v2}, Lcom/vk/media/utils/grafika/EglCore;->swapBuffers(Landroid/opengl/EGLSurface;)Z

    move-result v0

    .line 137
    .local v0, "result":Z
    if-nez v0, :cond_0

    .line 138
    const-string/jumbo v1, "MediaUtils"

    const-string/jumbo v2, "WARNING: swapBuffers() failed"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    :cond_0
    return v0
.end method
