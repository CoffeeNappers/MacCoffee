package com.vk.attachpicker.editor;

import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.net.Uri;
import com.vk.attachpicker.crop.CropAreaProvider;
import com.vk.attachpicker.crop.CropUtils;
import com.vk.attachpicker.crop.GeometryState;
import com.vk.attachpicker.jni.Native;
import com.vk.attachpicker.mediastore.MediaStoreEntry;
import com.vk.attachpicker.util.BitmapUtils;
import com.vk.core.util.RxUtil;
import com.vk.core.util.Screen;
import com.vk.imageloader.VKImageLoader;
import com.vk.stories.StoriesProcessor;
import java.io.File;
/* loaded from: classes2.dex */
public class ImageState {
    public static final float PREVIEW_WIDTH = Math.min((int) StoriesProcessor.MAX_PHOTO_WIDTH, Screen.realWidth());
    private float autoEnhanceValue;
    private Bitmap autoFixedBitmap;
    private GeometryState autoFixedGeometryState;
    private Bitmap bigBitmap;
    private Bitmap croppedBitmap;
    private GeometryState croppedGeometryState;
    private final MediaStoreEntry entry;
    private final File file;
    private GeometryState geometryState;

    public ImageState(MediaStoreEntry entry) {
        this.entry = entry;
        this.file = null;
    }

    public ImageState(File file) {
        this.file = file;
        this.entry = null;
    }

    public GeometryState getGeometryState() {
        return this.geometryState;
    }

    public void setGeometryState(GeometryState geometryState) {
        if (this.geometryState == null) {
            this.geometryState = new GeometryState(geometryState.getWidth(), geometryState.getHeight());
        }
        this.geometryState.set(geometryState);
    }

    public Matrix getCroppedBitmapMatrix(RectF drawingRect) {
        return CropUtils.createDrawingMatrix(this.geometryState.getTransformationMatrix(), PREVIEW_WIDTH, Screen.realWidth(), drawingRect);
    }

    public synchronized Bitmap getBigBitmap() {
        if (this.bigBitmap == null || this.bigBitmap.isRecycled()) {
            System.gc();
            if (this.bigBitmap == null || this.bigBitmap.isRecycled()) {
                if (this.file != null) {
                    this.bigBitmap = (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getVeryBigBitmap(Uri.fromFile(this.file)));
                } else {
                    this.bigBitmap = (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getVeryBigBitmap(this.entry.path));
                }
            }
            this.geometryState = new GeometryState(this.bigBitmap.getWidth(), this.bigBitmap.getHeight());
            this.geometryState.resetTransformationMatrix();
        }
        return this.bigBitmap;
    }

    public synchronized Bitmap getCroppedBitmap() {
        getBigBitmap();
        if (this.croppedGeometryState == null || this.croppedBitmap == null || this.croppedBitmap.isRecycled() || !this.croppedGeometryState.equals(this.geometryState)) {
            this.croppedBitmap = CropUtils.applySquareMatrixFixed(this.bigBitmap, stubCropAreaProvider((int) PREVIEW_WIDTH), this.geometryState.getTransformationMatrix(), (int) PREVIEW_WIDTH);
            this.croppedGeometryState = new GeometryState(this.croppedBitmap.getWidth(), this.croppedBitmap.getHeight());
            this.croppedGeometryState.set(this.geometryState);
        }
        return this.croppedBitmap;
    }

    public synchronized Bitmap getAutoFixedBitmap() {
        getCroppedBitmap();
        if (this.autoFixedGeometryState == null || this.autoFixedBitmap == null || this.autoFixedBitmap.isRecycled() || !this.autoFixedGeometryState.equals(this.geometryState)) {
            this.autoFixedBitmap = this.croppedBitmap.copy(Bitmap.Config.ARGB_8888, true);
            Native.enhanceBitmap(this.autoFixedBitmap, 1.0f);
            Native.flipVerticallyBitmap(this.autoFixedBitmap);
            this.autoFixedGeometryState = new GeometryState(this.autoFixedBitmap.getWidth(), this.autoFixedBitmap.getHeight());
            this.autoFixedGeometryState.set(this.geometryState);
        }
        return this.autoFixedBitmap;
    }

    public Bitmap getCroppedBitmap(int targetWidth) {
        getBigBitmap();
        Bitmap bigCroppedBitmap = CropUtils.applySquareMatrixFixed(this.bigBitmap, stubCropAreaProvider(targetWidth), CropUtils.createScaleMatrix(this.geometryState.getTransformationMatrix(), PREVIEW_WIDTH, targetWidth), (int) PREVIEW_WIDTH);
        return bigCroppedBitmap;
    }

    public float getCroppedBitmapAspectRatio() {
        return BitmapUtils.getAspectRatio(getCroppedBitmap());
    }

    public float getAutoEnhanceValue() {
        return this.autoEnhanceValue;
    }

    public void setAutoEnhanceValue(float autoEnhanceValue) {
        this.autoEnhanceValue = autoEnhanceValue;
    }

    private CropAreaProvider stubCropAreaProvider(int targetWidth) {
        return CropUtils.createCropAreaProvider(targetWidth, (int) this.geometryState.getHeightForWidth(targetWidth));
    }
}
