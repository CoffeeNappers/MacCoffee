.class public Lcom/wmspanel/libstream/gles/EglSurfaceBase;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x12
.end annotation


# static fields
.field protected static final TAG:Ljava/lang/String; = "GLUtil"


# instance fields
.field private mEGLSurface:Landroid/opengl/EGLSurface;

.field protected mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

.field private mHeight:I

.field private mWidth:I


# direct methods
.method protected constructor <init>(Lcom/wmspanel/libstream/gles/EglCore;)V
    .locals 2
    .param p1, "eglCore"    # Lcom/wmspanel/libstream/gles/EglCore;

    .prologue
    const/4 v1, -0x1

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    .line 47
    iput v1, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mWidth:I

    .line 48
    iput v1, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mHeight:I

    .line 51
    iput-object p1, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    .line 52
    return-void
.end method


# virtual methods
.method public createOffscreenSurface(II)V
    .locals 2
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 75
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    if-eq v0, v1, :cond_0

    .line 76
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "surface already created"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 78
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    invoke-virtual {v0, p1, p2}, Lcom/wmspanel/libstream/gles/EglCore;->createOffscreenSurface(II)Landroid/opengl/EGLSurface;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    .line 79
    iput p1, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mWidth:I

    .line 80
    iput p2, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mHeight:I

    .line 81
    return-void
.end method

.method public createWindowSurface(Ljava/lang/Object;)V
    .locals 2
    .param p1, "surface"    # Ljava/lang/Object;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    if-eq v0, v1, :cond_0

    .line 61
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "surface already created"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 63
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    invoke-virtual {v0, p1}, Lcom/wmspanel/libstream/gles/EglCore;->createWindowSurface(Ljava/lang/Object;)Landroid/opengl/EGLSurface;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    .line 69
    return-void
.end method

.method public getHeight()I
    .locals 3

    .prologue
    .line 102
    iget v0, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mHeight:I

    if-gez v0, :cond_0

    .line 103
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    iget-object v1, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    const/16 v2, 0x3056

    invoke-virtual {v0, v1, v2}, Lcom/wmspanel/libstream/gles/EglCore;->querySurface(Landroid/opengl/EGLSurface;I)I

    move-result v0

    .line 105
    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mHeight:I

    goto :goto_0
.end method

.method public getWidth()I
    .locals 3

    .prologue
    .line 91
    iget v0, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mWidth:I

    if-gez v0, :cond_0

    .line 92
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    iget-object v1, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    const/16 v2, 0x3057

    invoke-virtual {v0, v1, v2}, Lcom/wmspanel/libstream/gles/EglCore;->querySurface(Landroid/opengl/EGLSurface;I)I

    move-result v0

    .line 94
    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mWidth:I

    goto :goto_0
.end method

.method public makeCurrent()V
    .locals 2

    .prologue
    .line 122
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    iget-object v1, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/gles/EglCore;->makeCurrent(Landroid/opengl/EGLSurface;)V

    .line 123
    return-void
.end method

.method public makeCurrentReadFrom(Lcom/wmspanel/libstream/gles/EglSurfaceBase;)V
    .locals 3
    .param p1, "readSurface"    # Lcom/wmspanel/libstream/gles/EglSurfaceBase;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    iget-object v1, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    iget-object v2, p1, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v0, v1, v2}, Lcom/wmspanel/libstream/gles/EglCore;->makeCurrent(Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;)V

    .line 131
    return-void
.end method

.method public readPixels()Ljava/nio/ByteBuffer;
    .locals 7

    .prologue
    const/4 v0, 0x0

    .line 202
    iget-object v1, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    iget-object v2, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v1, v2}, Lcom/wmspanel/libstream/gles/EglCore;->isCurrent(Landroid/opengl/EGLSurface;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 203
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Expected EGL context/surface is not current"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 205
    :cond_0
    invoke-virtual {p0}, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->getWidth()I

    move-result v2

    .line 206
    invoke-virtual {p0}, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->getHeight()I

    move-result v3

    .line 207
    mul-int v1, v2, v3

    mul-int/lit8 v1, v1, 0x4

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 208
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v6, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 209
    const/16 v4, 0x1908

    const/16 v5, 0x1401

    move v1, v0

    invoke-static/range {v0 .. v6}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 211
    const-string/jumbo v0, "glReadPixels"

    invoke-static {v0}, Lcom/wmspanel/libstream/gles/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 212
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 213
    return-object v6
.end method

.method public releaseEglSurface()V
    .locals 2

    .prologue
    .line 113
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    iget-object v1, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/gles/EglCore;->releaseSurface(Landroid/opengl/EGLSurface;)V

    .line 114
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    .line 115
    const/4 v0, -0x1

    iput v0, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mHeight:I

    iput v0, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mWidth:I

    .line 116
    return-void
.end method

.method public saveFrame(Ljava/io/File;)V
    .locals 8
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 161
    iget-object v1, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    iget-object v2, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v1, v2}, Lcom/wmspanel/libstream/gles/EglCore;->isCurrent(Landroid/opengl/EGLSurface;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 162
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Expected EGL context/surface is not current"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 177
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v7

    .line 179
    invoke-virtual {p0}, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->getWidth()I

    move-result v2

    .line 180
    invoke-virtual {p0}, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->getHeight()I

    move-result v3

    .line 181
    mul-int v1, v2, v3

    mul-int/lit8 v1, v1, 0x4

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 182
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v6, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 183
    const/16 v4, 0x1908

    const/16 v5, 0x1401

    move v1, v0

    invoke-static/range {v0 .. v6}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 185
    const-string/jumbo v0, "glReadPixels"

    invoke-static {v0}, Lcom/wmspanel/libstream/gles/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 186
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 188
    const/4 v4, 0x0

    .line 190
    :try_start_0
    new-instance v1, Ljava/io/BufferedOutputStream;

    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v0}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 191
    :try_start_1
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 192
    invoke-virtual {v0, v6}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 193
    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v5, 0x5a

    invoke-virtual {v0, v4, v5, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 194
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 196
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->close()V

    .line 198
    :cond_1
    const-string/jumbo v0, "GLUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Saved "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " frame as \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    return-void

    .line 196
    :catchall_0
    move-exception v0

    move-object v1, v4

    :goto_0
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->close()V

    :cond_2
    throw v0

    :catchall_1
    move-exception v0

    goto :goto_0
.end method

.method public setPresentationTime(J)V
    .locals 3
    .param p1, "nsecs"    # J

    .prologue
    .line 152
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    iget-object v1, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v0, v1, p1, p2}, Lcom/wmspanel/libstream/gles/EglCore;->setPresentationTime(Landroid/opengl/EGLSurface;J)V

    .line 153
    return-void
.end method

.method public swapBuffers()Z
    .locals 3

    .prologue
    .line 139
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    iget-object v1, p0, Lcom/wmspanel/libstream/gles/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/gles/EglCore;->swapBuffers(Landroid/opengl/EGLSurface;)Z

    move-result v0

    .line 140
    if-nez v0, :cond_0

    .line 141
    const-string/jumbo v1, "GLUtil"

    const-string/jumbo v2, "WARNING: swapBuffers() failed"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    :cond_0
    return v0
.end method
