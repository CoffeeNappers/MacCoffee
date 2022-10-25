package com.vkontakte.android.upload;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.AssetFileDescriptor;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.media.ExifInterface;
import android.net.Uri;
import android.os.Environment;
import android.os.Parcel;
import android.os.Parcelable;
import android.preference.PreferenceManager;
import com.facebook.imagepipeline.common.RotationOptions;
import com.vk.imageloader.VKImageLoader;
import com.vkontakte.android.FragmentWrapperActivity;
import com.vkontakte.android.Log;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.auth.configs.ProfilerConfig;
import com.vkontakte.android.data.BenchmarkTracker;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes3.dex */
public abstract class PhotoUploadTask<S extends Parcelable> extends HTTPFileUploadTask<S> {
    public static final String METHOD_NAME = "photo.upload";
    private static final BenchmarkTracker benchmarkTracker = BenchmarkTracker.getInstance();
    private boolean disableDownscale;
    private final ProfilerConfig profilerConfig;
    private final boolean profilerEnabled;

    public PhotoUploadTask(Context context, String fileName) {
        super(context, fileName);
        this.profilerConfig = VKAccountManager.getCurrent().getProfilerConfig();
        this.profilerEnabled = this.profilerConfig != null && this.profilerConfig.isApiRequests();
        this.disableDownscale = false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PhotoUploadTask(Parcel in) {
        super(in);
        boolean z = true;
        this.profilerConfig = VKAccountManager.getCurrent().getProfilerConfig();
        this.profilerEnabled = this.profilerConfig != null && this.profilerConfig.isApiRequests();
        this.disableDownscale = false;
        this.disableDownscale = in.readByte() != 1 ? false : z;
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    protected String preProcessFile() {
        Bitmap bmp;
        String realName;
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(this.context);
        if (!prefs.getBoolean("compressPhotos", true)) {
            return null;
        }
        String res = null;
        try {
            BitmapFactory.Options opts = new BitmapFactory.Options();
            opts.inJustDecodeBounds = true;
            AssetFileDescriptor f = this.context.getContentResolver().openAssetFileDescriptor(Uri.parse(this.file), "r");
            FileInputStream is = f.createInputStream();
            BitmapFactory.decodeStream(is, null, opts);
            is.getChannel().position(0L);
            Log.i("vk", "in img size " + opts.outWidth + "x" + opts.outHeight);
            if ((opts.outWidth > opts.outHeight && opts.outWidth > 1280) || (opts.outWidth <= opts.outHeight && opts.outHeight > 1024)) {
                float sample = 1.0f;
                Log.i("vk", "disableDownscale " + this.disableDownscale);
                if (!this.disableDownscale) {
                    if (opts.outWidth > opts.outHeight) {
                        sample = Math.max(opts.outWidth, opts.outHeight) / 1280.0f;
                    } else {
                        sample = Math.max(opts.outWidth, opts.outHeight) / 1024.0f;
                    }
                }
                Log.d("vk", "sample size=" + sample);
                Log.d("vk", "new size=" + (opts.outWidth / sample) + "x" + (opts.outHeight / sample));
                opts.inJustDecodeBounds = false;
                opts.inSampleSize = (int) Math.floor(sample);
                try {
                    bmp = BitmapFactory.decodeStream(is, null, opts);
                } catch (OutOfMemoryError e) {
                    Log.w("vk", "fallback!");
                    VKImageLoader.clearMemoryCache();
                    bmp = BitmapFactory.decodeStream(is, null, opts);
                }
                File vkDir = new File(Environment.getExternalStorageDirectory(), ".vkontakte");
                if (!vkDir.exists()) {
                    vkDir.mkdirs();
                }
                File outfile = new File(Environment.getExternalStorageDirectory(), ".vkontakte/temp_upload.jpg");
                int rotation = 0;
                if (this.file.startsWith("content:")) {
                    try {
                        String[] projection = {FragmentWrapperActivity.ORIENTATION_KEY};
                        Cursor c = this.context.getContentResolver().query(Uri.parse(this.file), projection, null, null, null);
                        if (c.moveToFirst()) {
                            rotation = c.getInt(0);
                        }
                        Log.i("vk", "img rotation is " + rotation);
                    } catch (Exception e2) {
                    }
                }
                if ((!this.file.startsWith("content:") || rotation == 0) && (realName = UploadUtils.resolvePath(Uri.parse(this.file))) != null) {
                    ExifInterface exif = new ExifInterface(realName);
                    int o = exif.getAttributeInt("Orientation", 0);
                    Log.i("vk", "Exif orientation " + o);
                    switch (o) {
                        case 1:
                            rotation = 0;
                            break;
                        case 3:
                            rotation = RotationOptions.ROTATE_180;
                            break;
                        case 6:
                            rotation = 90;
                            break;
                        case 8:
                            rotation = RotationOptions.ROTATE_270;
                            break;
                    }
                }
                if (rotation != 0) {
                    Matrix matrix = new Matrix();
                    matrix.preRotate(rotation);
                    try {
                        bmp = Bitmap.createBitmap(bmp, 0, 0, bmp.getWidth(), bmp.getHeight(), matrix, false);
                    } catch (OutOfMemoryError e3) {
                        VKImageLoader.clearMemoryCache();
                        bmp = Bitmap.createBitmap(bmp, 0, 0, bmp.getWidth(), bmp.getHeight(), matrix, false);
                    }
                }
                FileOutputStream out = new FileOutputStream(outfile);
                bmp.compress(Bitmap.CompressFormat.JPEG, 90, out);
                Log.i("vk", "out img size = " + bmp.getWidth() + " x " + bmp.getHeight());
                out.close();
                String path = UploadUtils.resolvePath(Uri.parse(this.file));
                copyExifLocation(path, outfile.getAbsolutePath());
                Log.d("vk", "file size = " + outfile.length());
                res = outfile.getAbsolutePath();
            }
            is.close();
            f.close();
            return res;
        } catch (Throwable x) {
            Log.w("vk", x);
            return res;
        }
    }

    public boolean isDisableDownscale() {
        return this.disableDownscale;
    }

    public void setDisableDownscale(boolean disableDownscale) {
        this.disableDownscale = disableDownscale;
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    protected void trackSuccessfulUpload(int totalTime, long byteSize) {
        if (this.profilerEnabled) {
            benchmarkTracker.addSuccessApiMeasurement(METHOD_NAME, totalTime, 0, byteSize);
        }
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    protected void trackErrorApiUpload(int totalTime) {
        if (this.profilerEnabled) {
            benchmarkTracker.addErrorApiMeasurement(METHOD_NAME, totalTime, 0);
        }
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask
    protected void trackFailureUpload() {
        if (this.profilerEnabled) {
            benchmarkTracker.countFailedApiMeasurement(METHOD_NAME);
        }
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask, com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeByte((byte) (this.disableDownscale ? 1 : 0));
    }

    private void copyExifLocation(String from, String to) {
        try {
            ExifInterface srcExif = new ExifInterface(from);
            ExifInterface dstExif = new ExifInterface(to);
            List<String> attrs = Arrays.asList("GPSAltitude", "GPSAltitudeRef", "GPSLatitude", "GPSLatitudeRef", "GPSLongitude", "GPSLongitudeRef", "Make", "Model");
            for (String attr : attrs) {
                if (srcExif.getAttribute(attr) != null) {
                    dstExif.setAttribute(attr, srcExif.getAttribute(attr));
                }
            }
            dstExif.saveAttributes();
        } catch (Exception e) {
        }
    }
}
