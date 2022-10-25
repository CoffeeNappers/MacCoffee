package com.vk.attachpicker.imageeditor.output;

import android.graphics.Bitmap;
import android.opengl.GLES20;
import com.google.android.gms.gcm.Task;
import com.vk.attachpicker.imageeditor.GLRenderer;
import com.vk.attachpicker.imageeditor.input.GLTextureOutputRenderer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;
/* loaded from: classes2.dex */
public class BitmapOutput extends GLRenderer implements GLTextureInputRenderer {
    private BitmapOutputCallback callback;
    protected int[] depthRenderBuffer;
    protected int[] frameBuffer;
    protected int outputHeight;
    protected int outputWidth;
    protected int[] texture_out;

    /* loaded from: classes2.dex */
    public interface BitmapOutputCallback {
        void bitmapCreated(BitmapOutput bitmapOutput, Bitmap bitmap);
    }

    public BitmapOutput(int outputWidth, int outputHeight, BitmapOutputCallback callback) {
        this.callback = callback;
        this.textureVertices = new FloatBuffer[4];
        this.outputWidth = outputWidth;
        this.outputHeight = outputHeight;
        float[] texData0 = {0.0f, 1.0f, 1.0f, 1.0f, 0.0f, 0.0f, 1.0f, 0.0f};
        this.textureVertices[0] = ByteBuffer.allocateDirect(texData0.length * 4).order(ByteOrder.nativeOrder()).asFloatBuffer();
        this.textureVertices[0].put(texData0).position(0);
        float[] texData1 = {1.0f, 1.0f, 1.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f};
        this.textureVertices[1] = ByteBuffer.allocateDirect(texData1.length * 4).order(ByteOrder.nativeOrder()).asFloatBuffer();
        this.textureVertices[1].put(texData1).position(0);
        float[] texData2 = {1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 0.0f, 1.0f};
        this.textureVertices[2] = ByteBuffer.allocateDirect(texData2.length * 4).order(ByteOrder.nativeOrder()).asFloatBuffer();
        this.textureVertices[2].put(texData2).position(0);
        float[] texData3 = {0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 0.0f, 1.0f, 1.0f};
        this.textureVertices[3] = ByteBuffer.allocateDirect(texData3.length * 4).order(ByteOrder.nativeOrder()).asFloatBuffer();
        this.textureVertices[3].put(texData3).position(0);
    }

    @Override // com.vk.attachpicker.imageeditor.GLRenderer
    public void destroy() {
        super.destroy();
        if (this.frameBuffer != null) {
            GLES20.glDeleteFramebuffers(1, this.frameBuffer, 0);
            this.frameBuffer = null;
        }
        if (this.texture_out != null) {
            GLES20.glDeleteTextures(1, this.texture_out, 0);
            this.texture_out = null;
        }
        if (this.depthRenderBuffer != null) {
            GLES20.glDeleteRenderbuffers(1, this.depthRenderBuffer, 0);
            this.depthRenderBuffer = null;
        }
    }

    @Override // com.vk.attachpicker.imageeditor.GLRenderer
    public void drawFrame() {
        if (this.frameBuffer == null) {
            if (getWidth() != 0 && getHeight() != 0) {
                initFBO();
            } else {
                return;
            }
        }
        GLES20.glBindFramebuffer(36160, this.frameBuffer[0]);
        super.drawFrame();
        int[] pixels = new int[getWidth() * getHeight()];
        IntBuffer intBuffer = IntBuffer.wrap(pixels);
        intBuffer.position(0);
        GLES20.glReadPixels(0, 0, getWidth(), getHeight(), 6408, 5121, intBuffer);
        GLES20.glBindFramebuffer(36160, 0);
        for (int i = 0; i < pixels.length; i++) {
            pixels[i] = (pixels[i] & (-16711936)) | ((pixels[i] >> 16) & 255) | ((pixels[i] << 16) & 16711680);
        }
        Bitmap image = Bitmap.createBitmap(pixels, getWidth(), getHeight(), Bitmap.Config.ARGB_8888);
        this.callback.bitmapCreated(this, image);
    }

    @Override // com.vk.attachpicker.imageeditor.GLRenderer
    protected void handleSizeChange() {
        initFBO();
    }

    private void initFBO() {
        if (this.frameBuffer != null) {
            GLES20.glDeleteFramebuffers(1, this.frameBuffer, 0);
            this.frameBuffer = null;
        }
        if (this.texture_out != null) {
            GLES20.glDeleteTextures(1, this.texture_out, 0);
            this.texture_out = null;
        }
        if (this.depthRenderBuffer != null) {
            GLES20.glDeleteRenderbuffers(1, this.depthRenderBuffer, 0);
            this.depthRenderBuffer = null;
        }
        this.frameBuffer = new int[1];
        this.texture_out = new int[1];
        this.depthRenderBuffer = new int[1];
        GLES20.glGenFramebuffers(1, this.frameBuffer, 0);
        GLES20.glGenRenderbuffers(1, this.depthRenderBuffer, 0);
        GLES20.glGenTextures(1, this.texture_out, 0);
        GLES20.glBindFramebuffer(36160, this.frameBuffer[0]);
        GLES20.glActiveTexture(33984);
        GLES20.glBindTexture(3553, this.texture_out[0]);
        GLES20.glTexImage2D(3553, 0, 6408, getWidth(), getHeight(), 0, 6408, 5121, null);
        GLES20.glTexParameteri(3553, 10242, 33071);
        GLES20.glTexParameteri(3553, 10243, 33071);
        GLES20.glTexParameteri(3553, Task.EXTRAS_LIMIT_BYTES, 9729);
        GLES20.glTexParameteri(3553, 10241, 9729);
        GLES20.glFramebufferTexture2D(36160, 36064, 3553, this.texture_out[0], 0);
        GLES20.glBindRenderbuffer(36161, this.depthRenderBuffer[0]);
        GLES20.glRenderbufferStorage(36161, 33189, getWidth(), getHeight());
        GLES20.glFramebufferRenderbuffer(36160, 36096, 36161, this.depthRenderBuffer[0]);
        int status = GLES20.glCheckFramebufferStatus(36160);
        if (status != 36053) {
            throw new RuntimeException(this + ": Failed to set up render buffer with status " + status + " and error " + GLES20.glGetError());
        }
    }

    @Override // com.vk.attachpicker.imageeditor.output.GLTextureInputRenderer
    public void newTextureReady(int texture, GLTextureOutputRenderer source, boolean newData) {
        this.texture_in = texture;
        setWidth(this.outputWidth);
        setHeight(this.outputHeight);
        onDrawFrame();
    }
}
