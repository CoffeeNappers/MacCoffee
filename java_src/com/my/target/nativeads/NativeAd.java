package com.my.target.nativeads;

import android.content.Context;
import android.widget.ImageView;
import com.my.target.Tracer;
import com.my.target.ads.CustomParams;
import com.my.target.core.facades.b;
import com.my.target.nativeads.banners.NativePromoBanner;
import com.my.target.nativeads.models.ImageData;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class NativeAd extends b<NativePromoBanner> {
    private static final List<String> supportedFormats = new ArrayList<String>() { // from class: com.my.target.nativeads.NativeAd.1
        {
            add("promo");
        }
    };

    /* loaded from: classes2.dex */
    public interface NativeAdListener extends b.a<NativeAd> {
    }

    public static void loadImageToView(ImageData imageData, ImageView imageView) {
        if (imageData == null || imageView == null) {
            Tracer.i("AbstractNativeAd: invalid or null arguments");
        } else {
            com.my.target.core.net.b.a().a(imageData, imageView);
        }
    }

    public NativeAd(int i, Context context) {
        this(i, context, null);
    }

    public NativeAd(int i, Context context, CustomParams customParams) {
        super(i, supportedFormats, context, customParams);
        Tracer.i("NativeAd created. Version: 4.6.4");
    }
}
