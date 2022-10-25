package com.vk.core.util;

import android.app.DownloadManager;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.text.TextUtils;
import android.widget.Toast;
import com.facebook.common.media.MediaUtils;
import com.facebook.imagepipeline.image.EncodedImage;
import com.vk.attachpicker.util.CameraUtils;
import com.vk.imageloader.VKImageLoader;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Utils;
import java.io.File;
import java.io.InputStream;
/* loaded from: classes2.dex */
public class DownloadUtils {
    public static void downloadFile(Context context, String filename, String url) {
        if (!TextUtils.isEmpty(url)) {
            String mimeType = MediaUtils.extractMime(url);
            boolean isVideo = MediaUtils.isVideo(mimeType);
            boolean isPhoto = MediaUtils.isPhoto(mimeType);
            boolean shouldBeAddedToGallery = isPhoto || isVideo;
            String targetFileName = getTargetFileName(filename, url);
            File targetFile = FileUtils.getDownloadFile(targetFileName);
            if (isPhoto) {
                EncodedImage encodedImage = VKImageLoader.getDiskCacheEntry(Uri.parse(url));
                InputStream inputStream = encodedImage == null ? null : encodedImage.getInputStream();
                if (inputStream != null) {
                    try {
                        if (targetFile.exists() || targetFile.createNewFile()) {
                            Utils.copyInputStreamToFile(inputStream, targetFile, DownloadUtils$$Lambda$1.lambdaFactory$(context, targetFile));
                        }
                    } catch (Exception e) {
                        L.e(e, new Object[0]);
                    }
                    if (shouldBeAddedToGallery) {
                        CameraUtils.addMediaToGallery(context, targetFile, null);
                        return;
                    }
                    return;
                }
            }
            Uri downloadUri = Uri.parse(url);
            DownloadManager.Request req = new DownloadManager.Request(downloadUri);
            req.setDestinationUri(Uri.fromFile(targetFile));
            if (Build.VERSION.SDK_INT >= 14) {
                req.setNotificationVisibility(1);
                req.allowScanningByMediaScanner();
            }
            DownloadManager mgr = (DownloadManager) context.getSystemService("download");
            if (mgr != null) {
                try {
                    mgr.enqueue(req);
                } catch (IllegalArgumentException e2) {
                    L.e(e2, new Object[0]);
                    startDownloadManagerHack(context);
                }
            }
        }
    }

    public static /* synthetic */ void lambda$downloadFile$1(Context context, File targetFile, Boolean b) {
        if (b.booleanValue()) {
            ViewUtils.post(DownloadUtils$$Lambda$2.lambdaFactory$(context, targetFile));
        }
    }

    private static void startDownloadManagerHack(Context context) {
        if (context != null) {
            try {
                context.startActivity(new Intent("android.settings.APPLICATION_DETAILS_SETTINGS").setData(Uri.parse("package:com.android.providers.downloads")));
            } catch (ActivityNotFoundException e) {
                L.e(e, new Object[0]);
                context.startActivity(new Intent("android.settings.MANAGE_APPLICATIONS_SETTINGS"));
            }
            Toast.makeText(context, "Please enable download manager", 1).show();
        }
    }

    private static String getTargetFileName(String filename, String url) {
        Uri downloadUri = Uri.parse(url);
        String downloadFileName = downloadUri.getLastPathSegment();
        if (!TextUtils.isEmpty(filename)) {
            String fixedTargetName = filename.replace('/', '_');
            return !fixedTargetName.contains(".") ? downloadFileName : fixedTargetName;
        }
        return downloadFileName;
    }
}
