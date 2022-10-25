package com.vk.media.utils;

import android.graphics.Bitmap;
import android.hardware.Camera;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import com.facebook.imagepipeline.common.RotationOptions;
/* loaded from: classes2.dex */
public class MediaUtils {

    /* loaded from: classes2.dex */
    public static class Size {
        public int height;
        public int width;

        public Size(int w, int h) {
            this.width = w;
            this.height = h;
        }

        public Size(Camera.Size size) {
            this.width = size.width;
            this.height = size.height;
        }

        public int getWidth() {
            return this.width;
        }

        public int getHeight() {
            return this.height;
        }
    }

    /* loaded from: classes2.dex */
    public static class VideoInfo extends Size {
        public int durationMs;
        public Bitmap preview;

        public VideoInfo(int w, int h) {
            super(w, h);
        }
    }

    public static VideoInfo getVideoPreview(Uri uri) {
        return getVideoInfo(uri, true);
    }

    public static Size getVideoSize(Uri uri) {
        return getVideoInfo(uri, false);
    }

    public static int getVideoDurationMs(Uri uri) {
        try {
            MediaMetadataRetriever retriever = new MediaMetadataRetriever();
            retriever.setDataSource(uri.getEncodedPath());
            int duration = Integer.parseInt(retriever.extractMetadata(9));
            retriever.release();
            return duration;
        } catch (Exception e) {
            return 0;
        }
    }

    private static VideoInfo getVideoInfo(Uri uri, boolean withPreview) {
        try {
            MediaMetadataRetriever retriever = new MediaMetadataRetriever();
            retriever.setDataSource(uri.getEncodedPath());
            int videoWidth = Integer.parseInt(retriever.extractMetadata(18));
            int videoHeight = Integer.parseInt(retriever.extractMetadata(19));
            int rotation = Integer.parseInt(retriever.extractMetadata(24));
            if (rotation % RotationOptions.ROTATE_180 != 0) {
                videoWidth = videoHeight;
                videoHeight = videoWidth;
            }
            VideoInfo info = new VideoInfo(videoWidth, videoHeight);
            if (withPreview) {
                info.preview = retriever.getFrameAtTime();
                info.durationMs = Integer.parseInt(retriever.extractMetadata(9));
            }
            retriever.release();
            return info;
        } catch (Exception e) {
            return null;
        }
    }
}
