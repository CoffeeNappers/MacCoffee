.class public Lcom/vk/media/utils/RenderShaders;
.super Ljava/lang/Object;
.source "RenderShaders.java"


# static fields
.field public static final FRAGMENT_SHADER_OES:Ljava/lang/String; = "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 vTextureCoord;\nuniform samplerExternalOES sTexture;\nvoid main() {\n  gl_FragColor = texture2D(sTexture, vTextureCoord);\n}\n"

.field public static final FRAGMENT_SHADER_RGB:Ljava/lang/String; = "precision mediump float;\nvarying vec2 vTextureCoord;\nuniform sampler2D sTexture;\nvoid main() {\n  gl_FragColor = texture2D(sTexture, vTextureCoord);\n}\n"

.field public static final FRAGMENT_SHADER_YUV:Ljava/lang/String; = "precision mediump float;\nvarying vec2 vTextureCoord;\nuniform sampler2D sTexture;\nvoid main() {\n  vec4 yuv = texture2D(sTexture, vTextureCoord);\n  //gl_FragColor = yuv;\n  float r = yuv.x + 1.13983 * (yuv.z - 0.5);\n  float g = yuv.x - 0.39465 * (yuv.y - 0.5) - 0.58060 * (yuv.z - 0.5);\n  float b = yuv.x + 2.03211 * (yuv.y - 0.5);\n  gl_FragColor = vec4(r, g, b, 1.0);\n}\n"

.field private static final FRAGMENT_SHADER_YUV_TEXTURES:Ljava/lang/String; = "precision mediump float;\nvarying vec2 vTextureCoord;\nuniform sampler2D y_tex;\nuniform sampler2D u_tex;\nuniform sampler2D v_tex;\nvoid main() {\n  float y = texture2D(y_tex, vTextureCoord).r;\n  float u = texture2D(u_tex, vTextureCoord).r - .5;\n  float v = texture2D(v_tex, vTextureCoord).r - .5;\n  gl_FragColor = vec4(y + 1.403 * v,                       y - 0.344 * u - 0.714 * v,                       y + 1.77 * u, 1);\n}\n"

.field public static final TAG:Ljava/lang/String; = "RenderShaders"

.field public static final VERTEX_SHADER:Ljava/lang/String; = "uniform mat4 uMVPMatrix;\nuniform mat4 uSTMatrix;\nattribute vec4 aPosition;\nattribute vec4 aTextureCoord;\nvarying vec2 vTextureCoord;\nvoid main() {\n  gl_Position = uMVPMatrix * aPosition;\n  vTextureCoord = (uSTMatrix * aTextureCoord).xy;\n}\n"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
