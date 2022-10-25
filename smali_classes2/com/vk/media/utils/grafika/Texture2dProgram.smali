.class public Lcom/vk/media/utils/grafika/Texture2dProgram;
.super Ljava/lang/Object;
.source "Texture2dProgram.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;
    }
.end annotation


# static fields
.field private static final FRAGMENT_SHADER_2D:Ljava/lang/String; = "precision mediump float;\nvarying vec2 vTextureCoord;\nuniform sampler2D sTexture;\nvoid main() {\n    gl_FragColor = texture2D(sTexture, vTextureCoord);\n}\n"

.field private static final FRAGMENT_SHADER_EXT:Ljava/lang/String; = "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 vTextureCoord;\nuniform samplerExternalOES sTexture;\nvoid main() {\n    gl_FragColor = texture2D(sTexture, vTextureCoord);\n}\n"

.field private static final FRAGMENT_SHADER_EXT_BW:Ljava/lang/String; = "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 vTextureCoord;\nuniform samplerExternalOES sTexture;\nvoid main() {\n    vec4 tc = texture2D(sTexture, vTextureCoord);\n    float color = tc.r * 0.3 + tc.g * 0.59 + tc.b * 0.11;\n    gl_FragColor = vec4(color, color, color, 1.0);\n}\n"

.field private static final FRAGMENT_SHADER_EXT_FILT:Ljava/lang/String; = "#extension GL_OES_EGL_image_external : require\n#define KERNEL_SIZE 9\nprecision highp float;\nvarying vec2 vTextureCoord;\nuniform samplerExternalOES sTexture;\nuniform float uKernel[KERNEL_SIZE];\nuniform vec2 uTexOffset[KERNEL_SIZE];\nuniform float uColorAdjust;\nvoid main() {\n    int i = 0;\n    vec4 sum = vec4(0.0);\n    if (vTextureCoord.x < vTextureCoord.y - 0.005) {\n        for (i = 0; i < KERNEL_SIZE; i++) {\n            vec4 texc = texture2D(sTexture, vTextureCoord + uTexOffset[i]);\n            sum += texc * uKernel[i];\n        }\n    sum += uColorAdjust;\n    } else if (vTextureCoord.x > vTextureCoord.y + 0.005) {\n        sum = texture2D(sTexture, vTextureCoord);\n    } else {\n        sum.r = 1.0;\n    }\n    gl_FragColor = sum;\n}\n"

.field public static final KERNEL_SIZE:I = 0x9

.field private static final TAG:Ljava/lang/String; = "MediaUtils"

.field private static final VERTEX_SHADER:Ljava/lang/String; = "uniform mat4 uMVPMatrix;\nuniform mat4 uTexMatrix;\nattribute vec4 aPosition;\nattribute vec4 aTextureCoord;\nvarying vec2 vTextureCoord;\nvoid main() {\n    gl_Position = uMVPMatrix * aPosition;\n    vTextureCoord = (uTexMatrix * aTextureCoord).xy;\n}\n"


# instance fields
.field private mColorAdjust:F

.field private mKernel:[F

.field private mProgramHandle:I

.field private mProgramType:Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;

.field private mTexOffset:[F

.field private mTextureTarget:I

.field private maPositionLoc:I

.field private maTextureCoordLoc:I

.field private msTextureHandle:I

.field private muColorAdjustLoc:I

.field private muKernelLoc:I

.field private muMVPMatrixLoc:I

.field private muTexMatrixLoc:I

.field private muTexOffsetLoc:I


# direct methods
.method public constructor <init>(Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;)V
    .locals 6
    .param p1, "programType"    # Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;

    .prologue
    const/16 v5, 0x100

    const/16 v4, 0x9

    const v2, 0x8d65

    const/4 v3, -0x1

    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 131
    new-array v0, v4, [F

    iput-object v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mKernel:[F

    .line 140
    iput-object p1, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mProgramType:Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;

    .line 142
    sget-object v0, Lcom/vk/media/utils/grafika/Texture2dProgram$1;->$SwitchMap$com$vk$media$utils$grafika$Texture2dProgram$ProgramType:[I

    invoke-virtual {p1}, Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 160
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unhandled type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 144
    :pswitch_0
    const/16 v0, 0xde1

    iput v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mTextureTarget:I

    .line 145
    const-string/jumbo v0, "uniform mat4 uMVPMatrix;\nuniform mat4 uTexMatrix;\nattribute vec4 aPosition;\nattribute vec4 aTextureCoord;\nvarying vec2 vTextureCoord;\nvoid main() {\n    gl_Position = uMVPMatrix * aPosition;\n    vTextureCoord = (uTexMatrix * aTextureCoord).xy;\n}\n"

    const-string/jumbo v1, "precision mediump float;\nvarying vec2 vTextureCoord;\nuniform sampler2D sTexture;\nvoid main() {\n    gl_FragColor = texture2D(sTexture, vTextureCoord);\n}\n"

    invoke-static {v0, v1}, Lcom/vk/media/utils/grafika/GlUtil;->createProgram(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mProgramHandle:I

    .line 162
    :goto_0
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mProgramHandle:I

    if-nez v0, :cond_0

    .line 163
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Unable to create program"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 148
    :pswitch_1
    iput v2, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mTextureTarget:I

    .line 149
    const-string/jumbo v0, "uniform mat4 uMVPMatrix;\nuniform mat4 uTexMatrix;\nattribute vec4 aPosition;\nattribute vec4 aTextureCoord;\nvarying vec2 vTextureCoord;\nvoid main() {\n    gl_Position = uMVPMatrix * aPosition;\n    vTextureCoord = (uTexMatrix * aTextureCoord).xy;\n}\n"

    const-string/jumbo v1, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 vTextureCoord;\nuniform samplerExternalOES sTexture;\nvoid main() {\n    gl_FragColor = texture2D(sTexture, vTextureCoord);\n}\n"

    invoke-static {v0, v1}, Lcom/vk/media/utils/grafika/GlUtil;->createProgram(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mProgramHandle:I

    goto :goto_0

    .line 152
    :pswitch_2
    iput v2, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mTextureTarget:I

    .line 153
    const-string/jumbo v0, "uniform mat4 uMVPMatrix;\nuniform mat4 uTexMatrix;\nattribute vec4 aPosition;\nattribute vec4 aTextureCoord;\nvarying vec2 vTextureCoord;\nvoid main() {\n    gl_Position = uMVPMatrix * aPosition;\n    vTextureCoord = (uTexMatrix * aTextureCoord).xy;\n}\n"

    const-string/jumbo v1, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 vTextureCoord;\nuniform samplerExternalOES sTexture;\nvoid main() {\n    vec4 tc = texture2D(sTexture, vTextureCoord);\n    float color = tc.r * 0.3 + tc.g * 0.59 + tc.b * 0.11;\n    gl_FragColor = vec4(color, color, color, 1.0);\n}\n"

    invoke-static {v0, v1}, Lcom/vk/media/utils/grafika/GlUtil;->createProgram(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mProgramHandle:I

    goto :goto_0

    .line 156
    :pswitch_3
    iput v2, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mTextureTarget:I

    .line 157
    const-string/jumbo v0, "uniform mat4 uMVPMatrix;\nuniform mat4 uTexMatrix;\nattribute vec4 aPosition;\nattribute vec4 aTextureCoord;\nvarying vec2 vTextureCoord;\nvoid main() {\n    gl_Position = uMVPMatrix * aPosition;\n    vTextureCoord = (uTexMatrix * aTextureCoord).xy;\n}\n"

    const-string/jumbo v1, "#extension GL_OES_EGL_image_external : require\n#define KERNEL_SIZE 9\nprecision highp float;\nvarying vec2 vTextureCoord;\nuniform samplerExternalOES sTexture;\nuniform float uKernel[KERNEL_SIZE];\nuniform vec2 uTexOffset[KERNEL_SIZE];\nuniform float uColorAdjust;\nvoid main() {\n    int i = 0;\n    vec4 sum = vec4(0.0);\n    if (vTextureCoord.x < vTextureCoord.y - 0.005) {\n        for (i = 0; i < KERNEL_SIZE; i++) {\n            vec4 texc = texture2D(sTexture, vTextureCoord + uTexOffset[i]);\n            sum += texc * uKernel[i];\n        }\n    sum += uColorAdjust;\n    } else if (vTextureCoord.x > vTextureCoord.y + 0.005) {\n        sum = texture2D(sTexture, vTextureCoord);\n    } else {\n        sum.r = 1.0;\n    }\n    gl_FragColor = sum;\n}\n"

    invoke-static {v0, v1}, Lcom/vk/media/utils/grafika/GlUtil;->createProgram(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mProgramHandle:I

    goto :goto_0

    .line 165
    :cond_0
    const-string/jumbo v0, "MediaUtils"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Created program "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mProgramHandle:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mProgramHandle:I

    const-string/jumbo v1, "aPosition"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->maPositionLoc:I

    .line 170
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->maPositionLoc:I

    const-string/jumbo v1, "aPosition"

    invoke-static {v0, v1}, Lcom/vk/media/utils/grafika/GlUtil;->checkLocation(ILjava/lang/String;)V

    .line 171
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mProgramHandle:I

    const-string/jumbo v1, "aTextureCoord"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->maTextureCoordLoc:I

    .line 172
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->maTextureCoordLoc:I

    const-string/jumbo v1, "aTextureCoord"

    invoke-static {v0, v1}, Lcom/vk/media/utils/grafika/GlUtil;->checkLocation(ILjava/lang/String;)V

    .line 173
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mProgramHandle:I

    const-string/jumbo v1, "uMVPMatrix"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muMVPMatrixLoc:I

    .line 174
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muMVPMatrixLoc:I

    const-string/jumbo v1, "uMVPMatrix"

    invoke-static {v0, v1}, Lcom/vk/media/utils/grafika/GlUtil;->checkLocation(ILjava/lang/String;)V

    .line 175
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mProgramHandle:I

    const-string/jumbo v1, "uTexMatrix"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muTexMatrixLoc:I

    .line 176
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muTexMatrixLoc:I

    const-string/jumbo v1, "uTexMatrix"

    invoke-static {v0, v1}, Lcom/vk/media/utils/grafika/GlUtil;->checkLocation(ILjava/lang/String;)V

    .line 177
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mProgramHandle:I

    const-string/jumbo v1, "uKernel"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muKernelLoc:I

    .line 178
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muKernelLoc:I

    if-gez v0, :cond_1

    .line 180
    iput v3, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muKernelLoc:I

    .line 181
    iput v3, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muTexOffsetLoc:I

    .line 182
    iput v3, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muColorAdjustLoc:I

    .line 194
    :goto_1
    return-void

    .line 185
    :cond_1
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mProgramHandle:I

    const-string/jumbo v1, "uTexOffset"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muTexOffsetLoc:I

    .line 186
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muTexOffsetLoc:I

    const-string/jumbo v1, "uTexOffset"

    invoke-static {v0, v1}, Lcom/vk/media/utils/grafika/GlUtil;->checkLocation(ILjava/lang/String;)V

    .line 187
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mProgramHandle:I

    const-string/jumbo v1, "uColorAdjust"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muColorAdjustLoc:I

    .line 188
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muColorAdjustLoc:I

    const-string/jumbo v1, "uColorAdjust"

    invoke-static {v0, v1}, Lcom/vk/media/utils/grafika/GlUtil;->checkLocation(ILjava/lang/String;)V

    .line 191
    new-array v0, v4, [F

    fill-array-data v0, :array_0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vk/media/utils/grafika/Texture2dProgram;->setKernel([FF)V

    .line 192
    invoke-virtual {p0, v5, v5}, Lcom/vk/media/utils/grafika/Texture2dProgram;->setTexSize(II)V

    goto :goto_1

    .line 142
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch

    .line 191
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method


# virtual methods
.method public createTextureObject()I
    .locals 7

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    const v6, 0x812f

    const v5, 0x8d65

    const/16 v4, 0xde1

    .line 221
    new-array v1, v2, [I

    .line 222
    .local v1, "textures":[I
    invoke-static {v2, v1, v3}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 223
    const-string/jumbo v2, "glGenTextures"

    invoke-static {v2}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 225
    aget v0, v1, v3

    .line 226
    .local v0, "texId":I
    iget v2, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mTextureTarget:I

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 227
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "glBindTexture "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 229
    iget v2, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mTextureTarget:I

    if-ne v2, v5, :cond_1

    .line 230
    const/16 v2, 0x2801

    const/high16 v3, 0x46180000    # 9728.0f

    invoke-static {v5, v2, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 232
    const/16 v2, 0x2800

    const v3, 0x46180400    # 9729.0f

    invoke-static {v5, v2, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 234
    const/16 v2, 0x2802

    invoke-static {v5, v2, v6}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 236
    const/16 v2, 0x2803

    invoke-static {v5, v2, v6}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 238
    const-string/jumbo v2, "glTexParameter"

    invoke-static {v2}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 248
    :cond_0
    :goto_0
    return v0

    .line 239
    :cond_1
    iget v2, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mTextureTarget:I

    if-ne v2, v4, :cond_0

    .line 240
    const/16 v2, 0x2800

    const/16 v3, 0x2601

    invoke-static {v4, v2, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 241
    const/16 v2, 0x2801

    const/16 v3, 0x2601

    invoke-static {v4, v2, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 242
    const/16 v2, 0x2802

    invoke-static {v4, v2, v6}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 243
    const/16 v2, 0x2803

    invoke-static {v4, v2, v6}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 245
    iget v2, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mProgramHandle:I

    const-string/jumbo v3, "sTexture"

    invoke-static {v2, v3}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->msTextureHandle:I

    goto :goto_0
.end method

.method public draw([FLjava/nio/FloatBuffer;IIII[FLjava/nio/FloatBuffer;II)V
    .locals 6
    .param p1, "mvpMatrix"    # [F
    .param p2, "vertexBuffer"    # Ljava/nio/FloatBuffer;
    .param p3, "firstVertex"    # I
    .param p4, "vertexCount"    # I
    .param p5, "coordsPerVertex"    # I
    .param p6, "vertexStride"    # I
    .param p7, "texMatrix"    # [F
    .param p8, "texBuffer"    # Ljava/nio/FloatBuffer;
    .param p9, "textureId"    # I
    .param p10, "texStride"    # I

    .prologue
    .line 300
    const-string/jumbo v0, "draw start"

    invoke-static {v0}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 303
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mProgramHandle:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 304
    const-string/jumbo v0, "glUseProgram"

    invoke-static {v0}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 307
    const v0, 0x84c0

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 308
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mTextureTarget:I

    invoke-static {v0, p9}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 311
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muMVPMatrixLoc:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, p1, v3}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 312
    const-string/jumbo v0, "glUniformMatrix4fv"

    invoke-static {v0}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 315
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muTexMatrixLoc:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, p7, v3}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 316
    const-string/jumbo v0, "glUniformMatrix4fv"

    invoke-static {v0}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 319
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->maPositionLoc:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 320
    const-string/jumbo v0, "glEnableVertexAttribArray"

    invoke-static {v0}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 323
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->maPositionLoc:I

    const/16 v2, 0x1406

    const/4 v3, 0x0

    move v1, p5

    move v4, p6

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 325
    const-string/jumbo v0, "glVertexAttribPointer"

    invoke-static {v0}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 328
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->maTextureCoordLoc:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 329
    const-string/jumbo v0, "glEnableVertexAttribArray"

    invoke-static {v0}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 332
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->maTextureCoordLoc:I

    const/4 v1, 0x2

    const/16 v2, 0x1406

    const/4 v3, 0x0

    move/from16 v4, p10

    move-object v5, p8

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 334
    const-string/jumbo v0, "glVertexAttribPointer"

    invoke-static {v0}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 337
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muKernelLoc:I

    if-ltz v0, :cond_0

    .line 338
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muKernelLoc:I

    const/16 v1, 0x9

    iget-object v2, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mKernel:[F

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/GLES20;->glUniform1fv(II[FI)V

    .line 339
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muTexOffsetLoc:I

    const/16 v1, 0x9

    iget-object v2, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mTexOffset:[F

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/GLES20;->glUniform2fv(II[FI)V

    .line 340
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muColorAdjustLoc:I

    iget v1, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mColorAdjust:F

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 344
    :cond_0
    const/4 v0, 0x5

    invoke-static {v0, p3, p4}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 345
    const-string/jumbo v0, "glDrawArrays"

    invoke-static {v0}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 348
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->maPositionLoc:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 349
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->maTextureCoordLoc:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 350
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mTextureTarget:I

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 351
    const/4 v0, 0x0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 352
    return-void
.end method

.method public drawPixels([FLjava/nio/FloatBuffer;IIII[FLjava/nio/FloatBuffer;IIIILjava/nio/IntBuffer;)V
    .locals 10
    .param p1, "mvpMatrix"    # [F
    .param p2, "vertexBuffer"    # Ljava/nio/FloatBuffer;
    .param p3, "firstVertex"    # I
    .param p4, "vertexCount"    # I
    .param p5, "coordsPerVertex"    # I
    .param p6, "vertexStride"    # I
    .param p7, "texMatrix"    # [F
    .param p8, "texBuffer"    # Ljava/nio/FloatBuffer;
    .param p9, "textureId"    # I
    .param p10, "texStride"    # I
    .param p11, "width"    # I
    .param p12, "height"    # I
    .param p13, "pixels"    # Ljava/nio/IntBuffer;

    .prologue
    .line 358
    const-string/jumbo v1, "draw start"

    invoke-static {v1}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 361
    iget v1, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mProgramHandle:I

    invoke-static {v1}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 362
    const-string/jumbo v1, "glUseProgram"

    invoke-static {v1}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 365
    const v1, 0x84c0

    invoke-static {v1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 366
    iget v1, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mTextureTarget:I

    move/from16 v0, p9

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 369
    iget v1, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muMVPMatrixLoc:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v1, v2, v3, p1, v4}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 370
    const-string/jumbo v1, "glUniformMatrix4fv"

    invoke-static {v1}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 373
    iget v1, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muTexMatrixLoc:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, p7

    invoke-static {v1, v2, v3, v0, v4}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 374
    const-string/jumbo v1, "glUniformMatrix4fv"

    invoke-static {v1}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 377
    iget v1, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->maPositionLoc:I

    invoke-static {v1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 378
    const-string/jumbo v1, "glEnableVertexAttribArray"

    invoke-static {v1}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 381
    iget v1, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->maPositionLoc:I

    const/16 v3, 0x1406

    const/4 v4, 0x0

    move v2, p5

    move/from16 v5, p6

    move-object v6, p2

    invoke-static/range {v1 .. v6}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 383
    const-string/jumbo v1, "glVertexAttribPointer"

    invoke-static {v1}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 386
    iget v1, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->maTextureCoordLoc:I

    invoke-static {v1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 387
    const-string/jumbo v1, "glEnableVertexAttribArray"

    invoke-static {v1}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 390
    iget v1, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->maTextureCoordLoc:I

    const/4 v2, 0x2

    const/16 v3, 0x1406

    const/4 v4, 0x0

    move/from16 v5, p10

    move-object/from16 v6, p8

    invoke-static/range {v1 .. v6}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 392
    const-string/jumbo v1, "glVertexAttribPointer"

    invoke-static {v1}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 395
    iget v1, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muKernelLoc:I

    if-ltz v1, :cond_0

    .line 396
    iget v1, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muKernelLoc:I

    const/16 v2, 0x9

    iget-object v3, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mKernel:[F

    const/4 v4, 0x0

    invoke-static {v1, v2, v3, v4}, Landroid/opengl/GLES20;->glUniform1fv(II[FI)V

    .line 397
    iget v1, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muTexOffsetLoc:I

    const/16 v2, 0x9

    iget-object v3, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mTexOffset:[F

    const/4 v4, 0x0

    invoke-static {v1, v2, v3, v4}, Landroid/opengl/GLES20;->glUniform2fv(II[FI)V

    .line 398
    iget v1, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->muColorAdjustLoc:I

    iget v2, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mColorAdjust:F

    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 401
    :cond_0
    iget v1, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mTextureTarget:I

    const/16 v2, 0xde1

    if-ne v1, v2, :cond_1

    .line 402
    const v1, 0x84c1

    invoke-static {v1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 403
    iget v1, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mTextureTarget:I

    move/from16 v0, p9

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 404
    const/16 v1, 0xde1

    const/4 v2, 0x0

    const/16 v3, 0x1908

    const/4 v6, 0x0

    const/16 v7, 0x1908

    const/16 v8, 0x1401

    move/from16 v4, p11

    move/from16 v5, p12

    move-object/from16 v9, p13

    invoke-static/range {v1 .. v9}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 407
    iget v1, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->msTextureHandle:I

    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 408
    const-string/jumbo v1, "glTexImage2D"

    invoke-static {v1}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 412
    :cond_1
    const/4 v1, 0x5

    invoke-static {v1, p3, p4}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 413
    const-string/jumbo v1, "glDrawArrays"

    invoke-static {v1}, Lcom/vk/media/utils/grafika/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 416
    iget v1, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->maPositionLoc:I

    invoke-static {v1}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 417
    iget v1, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->maTextureCoordLoc:I

    invoke-static {v1}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 418
    iget v1, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mTextureTarget:I

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 419
    const/4 v1, 0x0

    invoke-static {v1}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 420
    return-void
.end method

.method public getProgramType()Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;
    .locals 1

    .prologue
    .line 212
    iget-object v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mProgramType:Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;

    return-object v0
.end method

.method public release()V
    .locals 3

    .prologue
    .line 203
    const-string/jumbo v0, "MediaUtils"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "deleting program "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mProgramHandle:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    iget v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mProgramHandle:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 205
    const/4 v0, -0x1

    iput v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mProgramHandle:I

    .line 206
    return-void
.end method

.method public setKernel([FF)V
    .locals 4
    .param p1, "values"    # [F
    .param p2, "colorAdj"    # F

    .prologue
    const/4 v1, 0x0

    const/16 v3, 0x9

    .line 257
    array-length v0, p1

    if-eq v0, v3, :cond_0

    .line 258
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Kernel size is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " vs. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 261
    :cond_0
    iget-object v0, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mKernel:[F

    invoke-static {p1, v1, v0, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 262
    iput p2, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mColorAdjust:F

    .line 264
    return-void
.end method

.method public setTexSize(II)V
    .locals 6
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    .line 270
    int-to-float v2, p1

    div-float v1, v3, v2

    .line 271
    .local v1, "rw":F
    int-to-float v2, p2

    div-float v0, v3, v2

    .line 274
    .local v0, "rh":F
    const/16 v2, 0x12

    new-array v2, v2, [F

    const/4 v3, 0x0

    neg-float v4, v1

    aput v4, v2, v3

    const/4 v3, 0x1

    neg-float v4, v0

    aput v4, v2, v3

    const/4 v3, 0x2

    aput v5, v2, v3

    const/4 v3, 0x3

    neg-float v4, v0

    aput v4, v2, v3

    const/4 v3, 0x4

    aput v1, v2, v3

    const/4 v3, 0x5

    neg-float v4, v0

    aput v4, v2, v3

    const/4 v3, 0x6

    neg-float v4, v1

    aput v4, v2, v3

    const/4 v3, 0x7

    aput v5, v2, v3

    const/16 v3, 0x8

    aput v5, v2, v3

    const/16 v3, 0x9

    aput v5, v2, v3

    const/16 v3, 0xa

    aput v1, v2, v3

    const/16 v3, 0xb

    aput v5, v2, v3

    const/16 v3, 0xc

    neg-float v4, v1

    aput v4, v2, v3

    const/16 v3, 0xd

    aput v0, v2, v3

    const/16 v3, 0xe

    aput v5, v2, v3

    const/16 v3, 0xf

    aput v0, v2, v3

    const/16 v3, 0x10

    aput v1, v2, v3

    const/16 v3, 0x11

    aput v0, v2, v3

    iput-object v2, p0, Lcom/vk/media/utils/grafika/Texture2dProgram;->mTexOffset:[F

    .line 280
    return-void
.end method
