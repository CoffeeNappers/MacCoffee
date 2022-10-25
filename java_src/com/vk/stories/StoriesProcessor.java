package com.vk.stories;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.os.Handler;
import android.os.Looper;
import bolts.Task;
import com.vk.attachpicker.util.BitmapUtils;
import com.vk.core.util.FileUtils;
import com.vk.core.util.GcTrigger;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes2.dex */
public class StoriesProcessor {
    public static final int MAX_PHOTO_HEIGHT = 1920;
    public static final int MAX_PHOTO_WIDTH = 1080;
    public static final int MAX_VIDEO_HEIGHT = 1280;
    public static final long MAX_VIDEO_LENGTH = 15000;
    public static final int MAX_VIDEO_WIDTH = 720;
    private static final Paint bitmapPaint = new Paint(2);
    private static final Executor imageExecutor = Executors.newSingleThreadExecutor();
    private static final Handler handler = new Handler(Looper.getMainLooper());

    /* loaded from: classes2.dex */
    public interface ImageProcessingCallback {
        void onFailure();

        void onSuccess(File file);
    }

    /* loaded from: classes2.dex */
    public interface ImageProcessingCallback2 {
        void onSuccess(File file, File file2);
    }

    public static int[] imageSize(float targetAr) {
        return size(targetAr, MAX_PHOTO_WIDTH, MAX_PHOTO_HEIGHT);
    }

    public static int[] videoSize(float targetAr, int videoWidth, int videoHeight) {
        return (videoWidth <= 0 || videoHeight <= 0) ? size(targetAr, 720, 1280) : size(targetAr, Math.min(720, videoWidth), Math.min(1280, videoHeight));
    }

    private static int[] size(float targetAr, int maxWidth, int maxHeght) {
        float idealAspectRatio = maxWidth / maxHeght;
        return Math.abs(targetAr - idealAspectRatio) < 0.001f ? new int[]{maxWidth, maxHeght} : targetAr < idealAspectRatio ? new int[]{(int) (maxHeght * targetAr), maxHeght} : new int[]{maxWidth, (int) (maxWidth / targetAr)};
    }

    private static Bitmap processOverlay(Bitmap image, Bitmap overlay, int targetW, int targetH) {
        Bitmap resultBitmap = BitmapUtils.centerCropBitmap(image, targetW, targetH);
        if (overlay != null) {
            Canvas canvas = new Canvas(resultBitmap);
            canvas.drawBitmap(overlay, 0.0f, 0.0f, bitmapPaint);
        }
        return resultBitmap;
    }

    public static void processImage(Bitmap image, Bitmap overlay, int targetW, int targetH, boolean temporary, ImageProcessingCallback imageProcessingCallback) {
        imageExecutor.execute(StoriesProcessor$$Lambda$1.lambdaFactory$(image, overlay, targetW, targetH, temporary, imageProcessingCallback));
    }

    public static /* synthetic */ void lambda$processImage$2(Bitmap image, Bitmap overlay, int targetW, int targetH, boolean temporary, ImageProcessingCallback imageProcessingCallback) {
        File resultFile;
        GcTrigger.DEFAULT.runGc();
        Bitmap resultBitmap = processOverlay(image, overlay, targetW, targetH);
        if (temporary) {
            resultFile = FileUtils.getTempUploadJpgImageFile();
        } else {
            resultFile = FileUtils.getPhotoFile();
        }
        try {
            FileOutputStream fos = new FileOutputStream(resultFile);
            resultBitmap.compress(Bitmap.CompressFormat.JPEG, 86, fos);
            fos.close();
            handler.post(StoriesProcessor$$Lambda$5.lambdaFactory$(imageProcessingCallback, resultFile));
        } catch (Exception e) {
            FileUtils.deleteFile(resultFile);
            handler.post(StoriesProcessor$$Lambda$6.lambdaFactory$(imageProcessingCallback));
        }
    }

    public static void saveOverlayImage(Bitmap overlay, Bitmap videoPreview, int targetW, int targetH, ImageProcessingCallback2 imageProcessingCallback) {
        GcTrigger.DEFAULT.runGc();
        AtomicReference<File> overlayPath = new AtomicReference<>();
        AtomicReference<File> videoPreviewPath = new AtomicReference<>();
        Collection<Task<?>> tasks = new ArrayList<>();
        if (overlay != null) {
            Task saveOverlayTask = Task.call(StoriesProcessor$$Lambda$2.lambdaFactory$(overlay, overlayPath));
            tasks.add(saveOverlayTask);
        }
        if (videoPreview != null) {
            Task saveVideoPreviewTask = Task.call(StoriesProcessor$$Lambda$3.lambdaFactory$(overlay, videoPreview, targetW, targetH, videoPreviewPath));
            tasks.add(saveVideoPreviewTask);
        }
        Task.whenAll(tasks).onSuccess(StoriesProcessor$$Lambda$4.lambdaFactory$(imageProcessingCallback, overlayPath, videoPreviewPath), Task.UI_THREAD_EXECUTOR);
    }

    public static /* synthetic */ Object lambda$saveOverlayImage$3(Bitmap overlay, AtomicReference overlayPath) throws Exception {
        File resultFile = FileUtils.getTempUploadPngImageFile();
        try {
            FileOutputStream fos = new FileOutputStream(resultFile);
            overlay.compress(Bitmap.CompressFormat.PNG, 100, fos);
            fos.close();
            overlayPath.set(resultFile);
            return null;
        } catch (Exception e) {
            FileUtils.deleteFile(resultFile);
            return null;
        }
    }

    public static /* synthetic */ Object lambda$saveOverlayImage$4(Bitmap overlay, Bitmap videoPreview, int targetW, int targetH, AtomicReference videoPreviewPath) throws Exception {
        Bitmap resultBitmap;
        File resultFile = FileUtils.getTempUploadJpgImageFile();
        if (overlay != null && videoPreview != null) {
            try {
                resultBitmap = processOverlay(videoPreview, overlay, targetW, targetH);
            } catch (Exception e) {
                FileUtils.deleteFile(resultFile);
                return null;
            }
        } else {
            resultBitmap = videoPreview;
        }
        FileOutputStream fos = new FileOutputStream(resultFile);
        resultBitmap.compress(Bitmap.CompressFormat.JPEG, 80, fos);
        fos.close();
        videoPreviewPath.set(resultFile);
        return null;
    }
}
