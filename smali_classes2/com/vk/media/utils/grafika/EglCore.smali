.class public final Lcom/vk/media/utils/grafika/EglCore;
.super Ljava/lang/Object;
.source "EglCore.java"


# static fields
.field private static final EGL_RECORDABLE_ANDROID:I = 0x3142

.field public static final FLAG_RECORDABLE:I = 0x1

.field public static final FLAG_TRY_GLES3:I = 0x2

.field private static final TAG:Ljava/lang/String; = "MediaUtils"


# instance fields
.field private mEGLConfig:Landroid/opengl/EGLConfig;

.field private mEGLContext:Landroid/opengl/EGLContext;

.field private mEGLDisplay:Landroid/opengl/EGLDisplay;

.field private mGlVersion:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 65
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/vk/media/utils/grafika/EglCore;-><init>(Landroid/opengl/EGLContext;I)V

    .line 66
    return-void
.end method

.method public constructor <init>(Landroid/opengl/EGLContext;I)V
    .locals 13
    .param p1, "sharedContext"    # Landroid/opengl/EGLContext;
    .param p2, "flags"    # I

    .prologue
    const/4 v12, 0x0

    const/4 v11, 0x1

    const/4 v10, 0x2

    const/4 v8, 0x3

    const/4 v9, 0x0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    sget-object v6, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    iput-object v6, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    .line 54
    sget-object v6, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v6, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    .line 55
    iput-object v12, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLConfig:Landroid/opengl/EGLConfig;

    .line 56
    const/4 v6, -0x1

    iput v6, p0, Lcom/vk/media/utils/grafika/EglCore;->mGlVersion:I

    .line 75
    iget-object v6, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v7, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-eq v6, v7, :cond_0

    .line 76
    new-instance v6, Ljava/lang/RuntimeException;

    const-string/jumbo v7, "EGL already set up"

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 79
    :cond_0
    if-nez p1, :cond_1

    .line 80
    sget-object p1, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 83
    :cond_1
    invoke-static {v9}, Landroid/opengl/EGL14;->eglGetDisplay(I)Landroid/opengl/EGLDisplay;

    move-result-object v6

    iput-object v6, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    .line 84
    iget-object v6, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v7, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-ne v6, v7, :cond_2

    .line 85
    new-instance v6, Ljava/lang/RuntimeException;

    const-string/jumbo v7, "unable to get EGL14 display"

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 87
    :cond_2
    new-array v5, v10, [I

    .line 88
    .local v5, "version":[I
    iget-object v6, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v6, v5, v9, v5, v11}, Landroid/opengl/EGL14;->eglInitialize(Landroid/opengl/EGLDisplay;[II[II)Z

    move-result v6

    if-nez v6, :cond_3

    .line 89
    iput-object v12, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    .line 90
    new-instance v6, Ljava/lang/RuntimeException;

    const-string/jumbo v7, "unable to initialize EGL14"

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 94
    :cond_3
    and-int/lit8 v6, p2, 0x2

    if-eqz v6, :cond_4

    .line 96
    invoke-direct {p0, p2, v8}, Lcom/vk/media/utils/grafika/EglCore;->getConfig(II)Landroid/opengl/EGLConfig;

    move-result-object v2

    .line 97
    .local v2, "config":Landroid/opengl/EGLConfig;
    if-eqz v2, :cond_4

    .line 98
    new-array v1, v8, [I

    fill-array-data v1, :array_0

    .line 102
    .local v1, "attrib3_list":[I
    iget-object v6, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v6, v2, p1, v1, v9}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    move-result-object v3

    .line 105
    .local v3, "context":Landroid/opengl/EGLContext;
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    move-result v6

    const/16 v7, 0x3000

    if-ne v6, v7, :cond_4

    .line 107
    iput-object v2, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLConfig:Landroid/opengl/EGLConfig;

    .line 108
    iput-object v3, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    .line 109
    iput v8, p0, Lcom/vk/media/utils/grafika/EglCore;->mGlVersion:I

    .line 113
    .end local v1    # "attrib3_list":[I
    .end local v2    # "config":Landroid/opengl/EGLConfig;
    .end local v3    # "context":Landroid/opengl/EGLContext;
    :cond_4
    iget-object v6, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    sget-object v7, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    if-ne v6, v7, :cond_6

    .line 115
    invoke-direct {p0, p2, v10}, Lcom/vk/media/utils/grafika/EglCore;->getConfig(II)Landroid/opengl/EGLConfig;

    move-result-object v2

    .line 116
    .restart local v2    # "config":Landroid/opengl/EGLConfig;
    if-nez v2, :cond_5

    .line 117
    new-instance v6, Ljava/lang/RuntimeException;

    const-string/jumbo v7, "Unable to find a suitable EGLConfig"

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 119
    :cond_5
    new-array v0, v8, [I

    fill-array-data v0, :array_1

    .line 123
    .local v0, "attrib2_list":[I
    iget-object v6, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v6, v2, p1, v0, v9}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    move-result-object v3

    .line 125
    .restart local v3    # "context":Landroid/opengl/EGLContext;
    const-string/jumbo v6, "eglCreateContext"

    invoke-direct {p0, v6}, Lcom/vk/media/utils/grafika/EglCore;->checkEglError(Ljava/lang/String;)V

    .line 126
    iput-object v2, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLConfig:Landroid/opengl/EGLConfig;

    .line 127
    iput-object v3, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    .line 128
    iput v10, p0, Lcom/vk/media/utils/grafika/EglCore;->mGlVersion:I

    .line 132
    .end local v0    # "attrib2_list":[I
    .end local v2    # "config":Landroid/opengl/EGLConfig;
    .end local v3    # "context":Landroid/opengl/EGLContext;
    :cond_6
    new-array v4, v11, [I

    .line 133
    .local v4, "values":[I
    iget-object v6, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v7, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    const/16 v8, 0x3098

    invoke-static {v6, v7, v8, v4, v9}, Landroid/opengl/EGL14;->eglQueryContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;I[II)Z

    .line 135
    const-string/jumbo v6, "MediaUtils"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "EGLContext created, client version "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    aget v8, v4, v9

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    return-void

    .line 98
    nop

    :array_0
    .array-data 4
        0x3098
        0x3
        0x3038
    .end array-data

    .line 119
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
    .line 368
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    move-result v0

    .local v0, "error":I
    const/16 v1, 0x3000

    if-eq v0, v1, :cond_0

    .line 369
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ": EGL error: 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 371
    :cond_0
    return-void
.end method

.method private getConfig(II)Landroid/opengl/EGLConfig;
    .locals 11
    .param p1, "flags"    # I
    .param p2, "version"    # I

    .prologue
    const/16 v10, 0x3038

    const/4 v9, 0x3

    const/4 v7, 0x1

    const/16 v5, 0x8

    const/4 v2, 0x0

    .line 145
    const/4 v8, 0x4

    .line 146
    .local v8, "renderableType":I
    if-lt p2, v9, :cond_0

    .line 147
    or-int/lit8 v8, v8, 0x40

    .line 153
    :cond_0
    const/16 v0, 0xd

    new-array v1, v0, [I

    const/16 v0, 0x3024

    aput v0, v1, v2

    aput v5, v1, v7

    const/4 v0, 0x2

    const/16 v4, 0x3023

    aput v4, v1, v0

    aput v5, v1, v9

    const/4 v0, 0x4

    const/16 v4, 0x3022

    aput v4, v1, v0

    const/4 v0, 0x5

    aput v5, v1, v0

    const/4 v0, 0x6

    const/16 v4, 0x3021

    aput v4, v1, v0

    const/4 v0, 0x7

    aput v5, v1, v0

    const/16 v0, 0x3040

    aput v0, v1, v5

    const/16 v0, 0x9

    aput v8, v1, v0

    const/16 v0, 0xa

    aput v10, v1, v0

    const/16 v0, 0xb

    aput v2, v1, v0

    const/16 v0, 0xc

    aput v10, v1, v0

    .line 164
    .local v1, "attribList":[I
    and-int/lit8 v0, p1, 0x1

    if-eqz v0, :cond_1

    .line 165
    array-length v0, v1

    add-int/lit8 v0, v0, -0x3

    const/16 v4, 0x3142

    aput v4, v1, v0

    .line 166
    array-length v0, v1

    add-int/lit8 v0, v0, -0x2

    aput v7, v1, v0

    .line 168
    :cond_1
    new-array v3, v7, [Landroid/opengl/EGLConfig;

    .line 169
    .local v3, "configs":[Landroid/opengl/EGLConfig;
    new-array v6, v7, [I

    .line 170
    .local v6, "numConfigs":[I
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    array-length v5, v3

    move v4, v2

    move v7, v2

    invoke-static/range {v0 .. v7}, Landroid/opengl/EGL14;->eglChooseConfig(Landroid/opengl/EGLDisplay;[II[Landroid/opengl/EGLConfig;II[II)Z

    move-result v0

    if-nez v0, :cond_2

    .line 172
    const-string/jumbo v0, "MediaUtils"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "unable to find RGB8888 / "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v4, " EGLConfig"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    const/4 v0, 0x0

    .line 175
    :goto_0
    return-object v0

    :cond_2
    aget-object v0, v3, v2

    goto :goto_0
.end method

.method public static logCurrent(Ljava/lang/String;)V
    .locals 6
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 356
    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentDisplay()Landroid/opengl/EGLDisplay;

    move-result-object v1

    .line 357
    .local v1, "display":Landroid/opengl/EGLDisplay;
    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentContext()Landroid/opengl/EGLContext;

    move-result-object v0

    .line 358
    .local v0, "context":Landroid/opengl/EGLContext;
    const/16 v3, 0x3059

    invoke-static {v3}, Landroid/opengl/EGL14;->eglGetCurrentSurface(I)Landroid/opengl/EGLSurface;

    move-result-object v2

    .line 359
    .local v2, "surface":Landroid/opengl/EGLSurface;
    const-string/jumbo v3, "MediaUtils"

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

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", context="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", surface="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 361
    return-void
.end method


# virtual methods
.method public createOffscreenSurface(II)Landroid/opengl/EGLSurface;
    .locals 5
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    const/4 v4, 0x0

    .line 251
    const/4 v2, 0x5

    new-array v1, v2, [I

    const/16 v2, 0x3057

    aput v2, v1, v4

    const/4 v2, 0x1

    aput p1, v1, v2

    const/4 v2, 0x2

    const/16 v3, 0x3056

    aput v3, v1, v2

    const/4 v2, 0x3

    aput p2, v1, v2

    const/4 v2, 0x4

    const/16 v3, 0x3038

    aput v3, v1, v2

    .line 256
    .local v1, "surfaceAttribs":[I
    iget-object v2, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v3, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLConfig:Landroid/opengl/EGLConfig;

    invoke-static {v2, v3, v1, v4}, Landroid/opengl/EGL14;->eglCreatePbufferSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;[II)Landroid/opengl/EGLSurface;

    move-result-object v0

    .line 258
    .local v0, "eglSurface":Landroid/opengl/EGLSurface;
    const-string/jumbo v2, "eglCreatePbufferSurface"

    invoke-direct {p0, v2}, Lcom/vk/media/utils/grafika/EglCore;->checkEglError(Ljava/lang/String;)V

    .line 259
    if-nez v0, :cond_0

    .line 260
    new-instance v2, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "surface was null"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 262
    :cond_0
    return-object v0
.end method

.method public createWindowSurface(Ljava/lang/Object;)Landroid/opengl/EGLSurface;
    .locals 5
    .param p1, "surface"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    .line 230
    instance-of v2, p1, Landroid/view/Surface;

    if-nez v2, :cond_0

    instance-of v2, p1, Landroid/graphics/SurfaceTexture;

    if-nez v2, :cond_0

    .line 231
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "invalid surface: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 235
    :cond_0
    const/4 v2, 0x1

    new-array v1, v2, [I

    const/16 v2, 0x3038

    aput v2, v1, v4

    .line 238
    .local v1, "surfaceAttribs":[I
    iget-object v2, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v3, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLConfig:Landroid/opengl/EGLConfig;

    invoke-static {v2, v3, p1, v1, v4}, Landroid/opengl/EGL14;->eglCreateWindowSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Ljava/lang/Object;[II)Landroid/opengl/EGLSurface;

    move-result-object v0

    .line 240
    .local v0, "eglSurface":Landroid/opengl/EGLSurface;
    const-string/jumbo v2, "eglCreateWindowSurface"

    invoke-direct {p0, v2}, Lcom/vk/media/utils/grafika/EglCore;->checkEglError(Ljava/lang/String;)V

    .line 241
    if-nez v0, :cond_1

    .line 242
    new-instance v2, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "surface was null"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 244
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
    .line 203
    :try_start_0
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-eq v0, v1, :cond_0

    .line 208
    const-string/jumbo v0, "MediaUtils"

    const-string/jumbo v1, "WARNING: EglCore was not explicitly released -- state may be leaked"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 209
    invoke-virtual {p0}, Lcom/vk/media/utils/grafika/EglCore;->release()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 212
    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 214
    return-void

    .line 212
    :catchall_0
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method

.method public getGlVersion()I
    .locals 1

    .prologue
    .line 345
    iget v0, p0, Lcom/vk/media/utils/grafika/EglCore;->mGlVersion:I

    return v0
.end method

.method public isCurrent(Landroid/opengl/EGLSurface;)Z
    .locals 2
    .param p1, "eglSurface"    # Landroid/opengl/EGLSurface;

    .prologue
    .line 321
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentContext()Landroid/opengl/EGLContext;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/opengl/EGLContext;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x3059

    .line 322
    invoke-static {v0}, Landroid/opengl/EGL14;->eglGetCurrentSurface(I)Landroid/opengl/EGLSurface;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/opengl/EGLSurface;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public makeCurrent(Landroid/opengl/EGLSurface;)V
    .locals 2
    .param p1, "eglSurface"    # Landroid/opengl/EGLSurface;

    .prologue
    .line 269
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-ne v0, v1, :cond_0

    .line 271
    const-string/jumbo v0, "MediaUtils"

    const-string/jumbo v1, "NOTE: makeCurrent w/o display"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    :cond_0
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    invoke-static {v0, p1, p1, v1}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 274
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "eglMakeCurrent failed"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 276
    :cond_1
    return-void
.end method

.method public makeCurrent(Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;)V
    .locals 2
    .param p1, "drawSurface"    # Landroid/opengl/EGLSurface;
    .param p2, "readSurface"    # Landroid/opengl/EGLSurface;

    .prologue
    .line 282
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-ne v0, v1, :cond_0

    .line 284
    const-string/jumbo v0, "MediaUtils"

    const-string/jumbo v1, "NOTE: makeCurrent w/o display"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    :cond_0
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    invoke-static {v0, p1, p2, v1}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 287
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "eglMakeCurrent(draw,read) failed"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 289
    :cond_1
    return-void
.end method

.method public makeNothingCurrent()V
    .locals 4

    .prologue
    .line 295
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 297
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "eglMakeCurrent failed"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 299
    :cond_0
    return-void
.end method

.method public queryString(I)Ljava/lang/String;
    .locals 1
    .param p1, "what"    # I

    .prologue
    .line 338
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

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

    .line 329
    const/4 v1, 0x1

    new-array v0, v1, [I

    .line 330
    .local v0, "value":[I
    iget-object v1, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v1, p1, p2, v0, v2}, Landroid/opengl/EGL14;->eglQuerySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;I[II)Z

    .line 331
    aget v1, v0, v2

    return v1
.end method

.method public release()V
    .locals 4

    .prologue
    .line 185
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-eq v0, v1, :cond_0

    .line 188
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 190
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroyContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)Z

    .line 191
    invoke-static {}, Landroid/opengl/EGL14;->eglReleaseThread()Z

    .line 192
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v0}, Landroid/opengl/EGL14;->eglTerminate(Landroid/opengl/EGLDisplay;)Z

    .line 195
    :cond_0
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    iput-object v0, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    .line 196
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLContext:Landroid/opengl/EGLContext;

    .line 197
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLConfig:Landroid/opengl/EGLConfig;

    .line 198
    return-void
.end method

.method public releaseSurface(Landroid/opengl/EGLSurface;)V
    .locals 1
    .param p1, "eglSurface"    # Landroid/opengl/EGLSurface;

    .prologue
    .line 221
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v0, p1}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 222
    return-void
.end method

.method public setPresentationTime(Landroid/opengl/EGLSurface;J)V
    .locals 2
    .param p1, "eglSurface"    # Landroid/opengl/EGLSurface;
    .param p2, "nsecs"    # J

    .prologue
    .line 314
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v0, p1, p2, p3}, Landroid/opengl/EGLExt;->eglPresentationTimeANDROID(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;J)Z

    .line 315
    return-void
.end method

.method public swapBuffers(Landroid/opengl/EGLSurface;)Z
    .locals 1
    .param p1, "eglSurface"    # Landroid/opengl/EGLSurface;

    .prologue
    .line 307
    iget-object v0, p0, Lcom/vk/media/utils/grafika/EglCore;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v0, p1}, Landroid/opengl/EGL14;->eglSwapBuffers(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    move-result v0

    return v0
.end method
