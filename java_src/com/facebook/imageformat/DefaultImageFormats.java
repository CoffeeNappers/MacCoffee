package com.facebook.imageformat;

import com.facebook.common.internal.ImmutableList;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public final class DefaultImageFormats {
    private static ImmutableList<ImageFormat> sAllDefaultFormats;
    public static final ImageFormat JPEG = new ImageFormat("JPEG", "jpeg");
    public static final ImageFormat PNG = new ImageFormat("PNG", "png");
    public static final ImageFormat GIF = new ImageFormat("GIF", "gif");
    public static final ImageFormat BMP = new ImageFormat("BMP", "bmp");
    public static final ImageFormat WEBP_SIMPLE = new ImageFormat("WEBP_SIMPLE", "webp");
    public static final ImageFormat WEBP_LOSSLESS = new ImageFormat("WEBP_LOSSLESS", "webp");
    public static final ImageFormat WEBP_EXTENDED = new ImageFormat("WEBP_EXTENDED", "webp");
    public static final ImageFormat WEBP_EXTENDED_WITH_ALPHA = new ImageFormat("WEBP_EXTENDED_WITH_ALPHA", "webp");
    public static final ImageFormat WEBP_ANIMATED = new ImageFormat("WEBP_ANIMATED", "webp");

    public static boolean isWebpFormat(ImageFormat imageFormat) {
        return isStaticWebpFormat(imageFormat) || imageFormat == WEBP_ANIMATED;
    }

    public static boolean isStaticWebpFormat(ImageFormat imageFormat) {
        return imageFormat == WEBP_SIMPLE || imageFormat == WEBP_LOSSLESS || imageFormat == WEBP_EXTENDED || imageFormat == WEBP_EXTENDED_WITH_ALPHA;
    }

    public static List<ImageFormat> getDefaultFormats() {
        if (sAllDefaultFormats == null) {
            List<ImageFormat> mDefaultFormats = new ArrayList<>(9);
            mDefaultFormats.add(JPEG);
            mDefaultFormats.add(PNG);
            mDefaultFormats.add(GIF);
            mDefaultFormats.add(BMP);
            mDefaultFormats.add(WEBP_SIMPLE);
            mDefaultFormats.add(WEBP_LOSSLESS);
            mDefaultFormats.add(WEBP_EXTENDED);
            mDefaultFormats.add(WEBP_EXTENDED_WITH_ALPHA);
            mDefaultFormats.add(WEBP_ANIMATED);
            sAllDefaultFormats = ImmutableList.copyOf((List) mDefaultFormats);
        }
        return sAllDefaultFormats;
    }

    private DefaultImageFormats() {
    }
}
