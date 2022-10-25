package com.vk.media.utils;
/* loaded from: classes2.dex */
public class RenderShaders {
    public static final String FRAGMENT_SHADER_OES = "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 vTextureCoord;\nuniform samplerExternalOES sTexture;\nvoid main() {\n  gl_FragColor = texture2D(sTexture, vTextureCoord);\n}\n";
    public static final String FRAGMENT_SHADER_RGB = "precision mediump float;\nvarying vec2 vTextureCoord;\nuniform sampler2D sTexture;\nvoid main() {\n  gl_FragColor = texture2D(sTexture, vTextureCoord);\n}\n";
    public static final String FRAGMENT_SHADER_YUV = "precision mediump float;\nvarying vec2 vTextureCoord;\nuniform sampler2D sTexture;\nvoid main() {\n  vec4 yuv = texture2D(sTexture, vTextureCoord);\n  //gl_FragColor = yuv;\n  float r = yuv.x + 1.13983 * (yuv.z - 0.5);\n  float g = yuv.x - 0.39465 * (yuv.y - 0.5) - 0.58060 * (yuv.z - 0.5);\n  float b = yuv.x + 2.03211 * (yuv.y - 0.5);\n  gl_FragColor = vec4(r, g, b, 1.0);\n}\n";
    private static final String FRAGMENT_SHADER_YUV_TEXTURES = "precision mediump float;\nvarying vec2 vTextureCoord;\nuniform sampler2D y_tex;\nuniform sampler2D u_tex;\nuniform sampler2D v_tex;\nvoid main() {\n  float y = texture2D(y_tex, vTextureCoord).r;\n  float u = texture2D(u_tex, vTextureCoord).r - .5;\n  float v = texture2D(v_tex, vTextureCoord).r - .5;\n  gl_FragColor = vec4(y + 1.403 * v,                       y - 0.344 * u - 0.714 * v,                       y + 1.77 * u, 1);\n}\n";
    public static final String TAG = "RenderShaders";
    public static final String VERTEX_SHADER = "uniform mat4 uMVPMatrix;\nuniform mat4 uSTMatrix;\nattribute vec4 aPosition;\nattribute vec4 aTextureCoord;\nvarying vec2 vTextureCoord;\nvoid main() {\n  gl_Position = uMVPMatrix * aPosition;\n  vTextureCoord = (uSTMatrix * aTextureCoord).xy;\n}\n";
}
