.class public final Lcom/wmspanel/libstream/gles/EglCore;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x12
.end annotation


# static fields
.field private static final EGL_RECORDABLE_ANDROID:I = 0x3142

.field public static final FLAG_RECORDABLE:I = 0x1

.field public static final FLAG_TRY_GLES3:I = 0x2

.field private static final TAG:Ljava/lang/String; = "GLUtil"


# instance fields
.field private mEGLConfig:Landroid/opengl/EGLConfig;

.field private mEGLContext:Landroid/opengl/EGLContext;

.field private mEGLDisplay:Landroid/opengl/EGLDisplay;

.field private mGlVersion:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 68
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/wmspanel/libstream/gles/EglCore;-><init>(Landroid/opengl/EGLContext;I)V

    .line 69
    return-void
.end method

.method public constructor <init>(Landroid/opengl/EGLContext;I)V
    .locals 8
    .param p1, "sharedContext"    # Landroid/opengl/EGLContext;
    .param p2, "flags"    # I

    .prologue
    const/4 v2, 0x0

    const/4 v7, 0x1

    const/4 v6, 0x2

    const/4 v5, 0x3

    const/4 v4, 0x0

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    iput-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    .line 57
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    .line 58
    iput-object v2, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLConfig:Landroid/opengl/EGLConfig;

    .line 59
    const/4 v0, -0x1

    iput v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mGlVersion:I

    .line 78
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-eq v0, v1, :cond_0

    .line 79
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "EGL already set up"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 82
    :cond_0
    if-nez p1, :cond_1

    .line 83
    sget-object p1, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 86
    :cond_1
    invoke-static {v4}, Landroid/opengl/EGL14;->eglGetDisplay(I)Landroid/opengl/EGLDisplay;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    .line 87
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-ne v0, v1, :cond_2

    .line 88
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "unable to get EGL14 display"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 90
    :cond_2
    new-array v0, v6, [I

    .line 91
    iget-object v1, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v1, v0, v4, v0, v7}, Landroid/opengl/EGL14;->eglInitialize(Landroid/opengl/EGLDisplay;[II[II)Z

    move-result v0

    if-nez v0, :cond_3

    .line 92
    iput-object v2, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    .line 93
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "unable to initialize EGL14"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 97
    :cond_3
    and-int/lit8 v0, p2, 0x2

    if-eqz v0, :cond_4

    .line 99
    invoke-direct {p0, p2, v5}, Lcom/wmspanel/libstream/gles/EglCore;->getConfig(II)Landroid/opengl/EGLConfig;

    move-result-object v0

    .line 100
    if-eqz v0, :cond_4

    .line 101
    new-array v1, v5, [I

    fill-array-data v1, :array_0

    .line 105
    iget-object v2, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v2, v0, p1, v1, v4}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    move-result-object v1

    .line 108
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    move-result v2

    const/16 v3, 0x3000

    if-ne v2, v3, :cond_4

    .line 110
    iput-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLConfig:Landroid/opengl/EGLConfig;

    .line 111
    iput-object v1, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    .line 112
    iput v5, p0, Lcom/wmspanel/libstream/gles/EglCore;->mGlVersion:I

    .line 116
    :cond_4
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    if-ne v0, v1, :cond_6

    .line 118
    invoke-direct {p0, p2, v6}, Lcom/wmspanel/libstream/gles/EglCore;->getConfig(II)Landroid/opengl/EGLConfig;

    move-result-object v0

    .line 119
    if-nez v0, :cond_5

    .line 120
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Unable to find a suitable EGLConfig"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 122
    :cond_5
    new-array v1, v5, [I

    fill-array-data v1, :array_1

    .line 126
    iget-object v2, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v2, v0, p1, v1, v4}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    move-result-object v1

    .line 128
    const-string/jumbo v2, "eglCreateContext"

    invoke-direct {p0, v2}, Lcom/wmspanel/libstream/gles/EglCore;->checkEglError(Ljava/lang/String;)V

    .line 129
    iput-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLConfig:Landroid/opengl/EGLConfig;

    .line 130
    iput-object v1, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    .line 131
    iput v6, p0, Lcom/wmspanel/libstream/gles/EglCore;->mGlVersion:I

    .line 135
    :cond_6
    new-array v0, v7, [I

    .line 136
    iget-object v1, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v2, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    const/16 v3, 0x3098

    invoke-static {v1, v2, v3, v0, v4}, Landroid/opengl/EGL14;->eglQueryContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;I[II)Z

    .line 138
    const-string/jumbo v1, "GLUtil"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "EGLContext created, client version "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget v0, v0, v4

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    return-void

    .line 101
    nop

    :array_0
    .array-data 4
        0x3098
        0x3
        0x3038
    .end array-data

    .line 122
    :array_1
    .array-data 4
        0x3098
        0x2
        0x3038
    .end array-data
.end method

.method private checkEglError(Ljava/lang/String;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 371
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    move-result v0

    const/16 v1, 0x3000

    if-eq v0, v1, :cond_0

    .line 372
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ": EGL error: 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 374
    :cond_0
    return-void
.end method

.method private getConfig(II)Landroid/opengl/EGLConfig;
    .locals 9
    .param p1, "flags"    # I
    .param p2, "version"    # I

    .prologue
    const/4 v3, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x1

    const/16 v6, 0x8

    const/4 v2, 0x0

    .line 148
    .line 149
    if-lt p2, v8, :cond_2

    .line 150
    const/16 v0, 0x44

    .line 156
    :goto_0
    const/16 v1, 0xd

    new-array v1, v1, [I

    const/16 v4, 0x3024

    aput v4, v1, v2

    aput v6, v1, v7

    const/4 v4, 0x2

    const/16 v5, 0x3023

    aput v5, v1, v4

    aput v6, v1, v8

    const/16 v4, 0x3022

    aput v4, v1, v3

    const/4 v3, 0x5

    aput v6, v1, v3

    const/4 v3, 0x6

    const/16 v4, 0x3021

    aput v4, v1, v3

    const/4 v3, 0x7

    aput v6, v1, v3

    const/16 v3, 0x3040

    aput v3, v1, v6

    const/16 v3, 0x9

    aput v0, v1, v3

    const/16 v0, 0xa

    const/16 v3, 0x3038

    aput v3, v1, v0

    const/16 v0, 0xb

    aput v2, v1, v0

    const/16 v0, 0xc

    const/16 v3, 0x3038

    aput v3, v1, v0

    .line 167
    and-int/lit8 v0, p1, 0x1

    if-eqz v0, :cond_0

    .line 168
    array-length v0, v1

    add-int/lit8 v0, v0, -0x3

    const/16 v3, 0x3142

    aput v3, v1, v0

    .line 169
    array-length v0, v1

    add-int/lit8 v0, v0, -0x2

    aput v7, v1, v0

    .line 171
    :cond_0
    new-array v3, v7, [Landroid/opengl/EGLConfig;

    .line 172
    new-array v6, v7, [I

    .line 173
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    array-length v5, v3

    move v4, v2

    move v7, v2

    invoke-static/range {v0 .. v7}, Landroid/opengl/EGL14;->eglChooseConfig(Landroid/opengl/EGLDisplay;[II[Landroid/opengl/EGLConfig;II[II)Z

    move-result v0

    if-nez v0, :cond_1

    .line 175
    const-string/jumbo v0, "GLUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "unable to find RGB8888 / "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " EGLConfig"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    const/4 v0, 0x0

    .line 178
    :goto_1
    return-object v0

    :cond_1
    aget-object v0, v3, v2

    goto :goto_1

    :cond_2
    move v0, v3

    goto :goto_0
.end method

.method public static logCurrent(Ljava/lang/String;)V
    .locals 6
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 359
    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentDisplay()Landroid/opengl/EGLDisplay;

    move-result-object v0

    .line 360
    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentContext()Landroid/opengl/EGLContext;

    move-result-object v1

    .line 361
    const/16 v2, 0x3059

    invoke-static {v2}, Landroid/opengl/EGL14;->eglGetCurrentSurface(I)Landroid/opengl/EGLSurface;

    move-result-object v2

    .line 362
    const-string/jumbo v3, "GLUtil"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Current EGL ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "): display="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v4, ", context="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", surface="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 364
    return-void
.end method


# virtual methods
.method public createOffscreenSurface(II)Landroid/opengl/EGLSurface;
    .locals 4
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    const/4 v3, 0x0

    .line 254
    const/4 v0, 0x5

    new-array v0, v0, [I

    const/16 v1, 0x3057

    aput v1, v0, v3

    const/4 v1, 0x1

    aput p1, v0, v1

    const/4 v1, 0x2

    const/16 v2, 0x3056

    aput v2, v0, v1

    const/4 v1, 0x3

    aput p2, v0, v1

    const/4 v1, 0x4

    const/16 v2, 0x3038

    aput v2, v0, v1

    .line 259
    iget-object v1, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v2, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLConfig:Landroid/opengl/EGLConfig;

    invoke-static {v1, v2, v0, v3}, Landroid/opengl/EGL14;->eglCreatePbufferSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;[II)Landroid/opengl/EGLSurface;

    move-result-object v0

    .line 261
    const-string/jumbo v1, "eglCreatePbufferSurface"

    invoke-direct {p0, v1}, Lcom/wmspanel/libstream/gles/EglCore;->checkEglError(Ljava/lang/String;)V

    .line 262
    if-nez v0, :cond_0

    .line 263
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "surface was null"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 265
    :cond_0
    return-object v0
.end method

.method public createWindowSurface(Ljava/lang/Object;)Landroid/opengl/EGLSurface;
    .locals 4
    .param p1, "surface"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 233
    instance-of v0, p1, Landroid/view/Surface;

    if-nez v0, :cond_0

    instance-of v0, p1, Landroid/graphics/SurfaceTexture;

    if-nez v0, :cond_0

    .line 234
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "invalid surface: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 238
    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/16 v1, 0x3038

    aput v1, v0, v3

    .line 241
    iget-object v1, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v2, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLConfig:Landroid/opengl/EGLConfig;

    invoke-static {v1, v2, p1, v0, v3}, Landroid/opengl/EGL14;->eglCreateWindowSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Ljava/lang/Object;[II)Landroid/opengl/EGLSurface;

    move-result-object v0

    .line 243
    const-string/jumbo v1, "eglCreateWindowSurface"

    invoke-direct {p0, v1}, Lcom/wmspanel/libstream/gles/EglCore;->checkEglError(Ljava/lang/String;)V

    .line 244
    if-nez v0, :cond_1

    .line 245
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "surface was null"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 247
    :cond_1
    return-object v0
.end method

.method protected finalize()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 206
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-eq v0, v1, :cond_0

    .line 211
    const-string/jumbo v0, "GLUtil"

    const-string/jumbo v1, "WARNING: EglCore was not explicitly released -- state may be leaked"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    invoke-virtual {p0}, Lcom/wmspanel/libstream/gles/EglCore;->release()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 215
    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 217
    return-void

    .line 215
    :catchall_0
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method

.method public getGlVersion()I
    .locals 1

    .prologue
    .line 348
    iget v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mGlVersion:I

    return v0
.end method

.method public isCurrent(Landroid/opengl/EGLSurface;)Z
    .locals 2
    .param p1, "eglSurface"    # Landroid/opengl/EGLSurface;

    .prologue
    .line 324
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentContext()Landroid/opengl/EGLContext;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/opengl/EGLContext;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x3059

    .line 325
    invoke-static {v0}, Landroid/opengl/EGL14;->eglGetCurrentSurface(I)Landroid/opengl/EGLSurface;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/opengl/EGLSurface;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 324
    :goto_0
    return v0

    .line 325
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public makeCurrent(Landroid/opengl/EGLSurface;)V
    .locals 2
    .param p1, "eglSurface"    # Landroid/opengl/EGLSurface;

    .prologue
    .line 272
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-ne v0, v1, :cond_0

    .line 274
    const-string/jumbo v0, "GLUtil"

    const-string/jumbo v1, "NOTE: makeCurrent w/o display"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    invoke-static {v0, p1, p1, v1}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 277
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "eglMakeCurrent failed"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 279
    :cond_1
    return-void
.end method

.method public makeCurrent(Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;)V
    .locals 2
    .param p1, "drawSurface"    # Landroid/opengl/EGLSurface;
    .param p2, "readSurface"    # Landroid/opengl/EGLSurface;

    .prologue
    .line 285
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-ne v0, v1, :cond_0

    .line 287
    const-string/jumbo v0, "GLUtil"

    const-string/jumbo v1, "NOTE: makeCurrent w/o display"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    invoke-static {v0, p1, p2, v1}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 290
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "eglMakeCurrent(draw,read) failed"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 292
    :cond_1
    return-void
.end method

.method public makeNothingCurrent()V
    .locals 4

    .prologue
    .line 298
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 300
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "eglMakeCurrent failed"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 302
    :cond_0
    return-void
.end method

.method public queryString(I)Ljava/lang/String;
    .locals 1
    .param p1, "what"    # I

    .prologue
    .line 341
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v0, p1}, Landroid/opengl/EGL14;->eglQueryString(Landroid/opengl/EGLDisplay;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public querySurface(Landroid/opengl/EGLSurface;I)I
    .locals 3
    .param p1, "eglSurface"    # Landroid/opengl/EGLSurface;
    .param p2, "what"    # I

    .prologue
    const/4 v2, 0x0

    .line 332
    const/4 v0, 0x1

    new-array v0, v0, [I

    .line 333
    iget-object v1, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v1, p1, p2, v0, v2}, Landroid/opengl/EGL14;->eglQuerySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;I[II)Z

    .line 334
    aget v0, v0, v2

    return v0
.end method

.method public release()V
    .locals 4

    .prologue
    .line 188
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-eq v0, v1, :cond_0

    .line 191
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 193
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroyContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)Z

    .line 194
    invoke-static {}, Landroid/opengl/EGL14;->eglReleaseThread()Z

    .line 195
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v0}, Landroid/opengl/EGL14;->eglTerminate(Landroid/opengl/EGLDisplay;)Z

    .line 198
    :cond_0
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    iput-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    .line 199
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    .line 200
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLConfig:Landroid/opengl/EGLConfig;

    .line 201
    return-void
.end method

.method public releaseSurface(Landroid/opengl/EGLSurface;)V
    .locals 1
    .param p1, "eglSurface"    # Landroid/opengl/EGLSurface;

    .prologue
    .line 224
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v0, p1}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 225
    return-void
.end method

.method public setPresentationTime(Landroid/opengl/EGLSurface;J)V
    .locals 2
    .param p1, "eglSurface"    # Landroid/opengl/EGLSurface;
    .param p2, "nsecs"    # J

    .prologue
    .line 317
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v0, p1, p2, p3}, Landroid/opengl/EGLExt;->eglPresentationTimeANDROID(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;J)Z

    .line 318
    return-void
.end method

.method public swapBuffers(Landroid/opengl/EGLSurface;)Z
    .locals 1
    .param p1, "eglSurface"    # Landroid/opengl/EGLSurface;

    .prologue
    .line 310
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v0, p1}, Landroid/opengl/EGL14;->eglSwapBuffers(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    move-result v0

    return v0
.end method
