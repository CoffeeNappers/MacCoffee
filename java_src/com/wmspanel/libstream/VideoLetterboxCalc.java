package com.wmspanel.libstream;

import com.wmspanel.libstream.Streamer;
import com.wmspanel.libstream.VideoListener;
/* loaded from: classes3.dex */
class VideoLetterboxCalc {
    private static final String TAG = "VideoLetterboxCalc";

    VideoLetterboxCalc() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void calculateLetterboxing(VideoListener.FlipCameraInfo info, Streamer.Size streamSize) {
        double d = streamSize.width / streamSize.height;
        double d2 = info.videoSize.width / info.videoSize.height;
        double d3 = (d / d2) - 1.0d;
        info.scale_letterbox = 1.0f;
        info.scale = 1.0f;
        info.scale_landscape_pillarbox = 1.0f;
        info.scale_landscape_letterbox = 1.0f;
        info.scale_horizon = 1.0f;
        if (Math.abs(d3) < 0.01d) {
            float f = streamSize.width;
            float f2 = streamSize.height;
            float f3 = f / f2;
            info.scale = (f2 * (f2 / f)) / f;
        } else {
            float f4 = streamSize.width;
            float f5 = streamSize.height;
            float f6 = info.videoSize.width;
            float f7 = info.videoSize.height;
            float f8 = f4 / f5;
            float f9 = f6 / f7;
            if (f4 > f5) {
                info.scale = ((f5 / f6) * f7) / f4;
                if (d2 < d) {
                    info.scale_landscape_pillarbox = ((f5 / f7) * f6) / f4;
                } else {
                    info.scale_landscape_letterbox = ((f4 / f6) * f7) / f5;
                }
            } else {
                info.scale_landscape_letterbox = ((f4 / f6) * f7) / f5;
                if (f4 / f5 > f7 / f6) {
                    info.scale = ((f5 / f6) * f7) / f4;
                } else {
                    info.scale_letterbox = ((f4 / f7) * f6) / f5;
                }
            }
        }
        float f10 = streamSize.width;
        float f11 = streamSize.height;
        if (Math.abs(d3) < 0.01d && f10 > f11) {
            float f12 = info.videoSize.width;
            float f13 = info.videoSize.height;
            info.scale_horizon = f12 / (f13 * (f13 / f12));
        }
    }
}
