package com.vk.attachpicker.imageeditor.output;

import android.content.Context;
import android.graphics.Bitmap;
import android.opengl.GLES20;
import android.provider.MediaStore;
import com.google.android.gms.gcm.Task;
import com.vk.attachpicker.imageeditor.GLRenderer;
import com.vk.attachpicker.imageeditor.input.GLTextureOutputRenderer;
import com.vk.media.camera.CameraUtilsEffects;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;
/* loaded from: classes2.dex */
public class JPGFileEndpoint extends GLRenderer implements GLTextureInputRenderer {
    private Context context;
    private int curNumber = 1;
    protected int[] depthRenderBuffer;
    private String filePath;
    protected int[] frameBuffer;
    private boolean increment;
    private boolean storeToMedia;
    protected int[] texture_out;

    public JPGFileEndpoint(Context context, boolean storeToMedia, String filePath, boolean increment) {
        this.context = context;
        this.storeToMedia = storeToMedia;
        this.filePath = filePath;
        this.increment = increment;
        this.textureVertices = new FloatBuffer[4];
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
        String filePathName;
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
        if (this.increment) {
            filePathName = this.filePath + this.curNumber + ".jpg";
            this.curNumber++;
        } else {
            filePathName = this.filePath + ".jpg";
        }
        try {
            OutputStream out = new FileOutputStream(new File(filePathName));
            image.compress(Bitmap.CompressFormat.JPEG, 87, out);
            out.flush();
            out.close();
            if (this.storeToMedia) {
                String[] name = this.filePath.split(CameraUtilsEffects.FILE_DELIM);
                MediaStore.Images.Media.insertImage(this.context.getContentResolver(), filePathName, name[name.length - 1], "");
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        }
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
        setWidth(source.getWidth());
        setHeight(source.getHeight());
        onDrawFrame();
    }
}
