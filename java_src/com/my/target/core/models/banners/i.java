package com.my.target.core.models.banners;

import com.my.target.nativeads.banners.NativePromoCard;
import com.my.target.nativeads.models.ImageData;
/* compiled from: NativeAdCard.java */
/* loaded from: classes2.dex */
public final class i extends a implements NativePromoCard {
    private String a;
    private String b;
    private ImageData c;

    @Override // com.my.target.nativeads.banners.NativePromoCard
    public final String getDescription() {
        return this.b;
    }

    @Override // com.my.target.nativeads.banners.NativePromoCard
    public final ImageData getImage() {
        return this.c;
    }

    @Override // com.my.target.nativeads.banners.NativePromoCard
    public final String getTitle() {
        return this.a;
    }

    public final void a(String str) {
        this.b = str;
    }

    public final void a(ImageData imageData) {
        this.c = imageData;
    }

    public final void b(String str) {
        this.a = str;
    }

    public i(String str, String str2) {
        super(str, str2);
    }
}
