package com.vk.attachpicker.imageeditor.input;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.opengl.GLES20;
import com.vk.attachpicker.imageeditor.helper.ImageHelper;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
/* loaded from: classes2.dex */
public class ImageResourceInput extends GLTextureOutputRenderer {
    private Bitmap bitmap;
    private Context context;
    private int imageHeight;
    private int imageWidth;
    private boolean newBitmap;

    public ImageResourceInput(Bitmap bitmap) {
        setImage(bitmap);
    }

    public ImageResourceInput(Context context, int resourceId) {
        this.context = context;
        setImage(resourceId);
    }

    public ImageResourceInput(String pathName) {
        setImage(pathName);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.attachpicker.imageeditor.input.GLTextureOutputRenderer, com.vk.attachpicker.imageeditor.GLRenderer
    public void drawFrame() {
        if (this.newBitmap) {
            loadTexture();
        }
        super.drawFrame();
    }

    public int getImageHeight() {
        return this.imageHeight;
    }

    public int getImageWidth() {
        return this.imageWidth;
    }

    private void loadImage(Bitmap bitmap) {
        this.bitmap = bitmap;
        this.imageWidth = bitmap.getWidth();
        this.imageHeight = bitmap.getHeight();
        setRenderSize(this.imageWidth, this.imageHeight);
        this.newBitmap = true;
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

    @Override // com.vk.attachpicker.imageeditor.input.GLTextureOutputRenderer, com.vk.attachpicker.imageeditor.GLRenderer
    public void destroy() {
        super.destroy();
        if (this.texture_in != 0) {
            int[] tex = {this.texture_in};
            GLES20.glDeleteTextures(1, tex, 0);
        }
        this.newBitmap = true;
    }

    private void loadTexture() {
        if (this.texture_in != 0) {
            int[] tex = {this.texture_in};
            GLES20.glDeleteTextures(1, tex, 0);
        }
        this.texture_in = ImageHelper.bitmapToTexture(this.bitmap);
        this.newBitmap = false;
        markAsDirty();
    }

    public void setImage(Bitmap bitmap) {
        loadImage(bitmap);
    }

    public void setImage(int resourceId) {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inScaled = false;
        loadImage(BitmapFactory.decodeResource(this.context.getResources(), resourceId, options));
    }

    public void setImage(String filePath) {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inScaled = false;
        loadImage(BitmapFactory.decodeFile(filePath, options));
    }
}
