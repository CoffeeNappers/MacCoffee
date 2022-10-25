package com.google.android.gms.ads.internal.formats;

import android.graphics.Color;
import android.graphics.drawable.Drawable;
import com.google.android.gms.internal.zzji;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public class zza {
    private static final int zzbmk = Color.rgb(12, 174, 206);
    private static final int zzbml = Color.rgb(204, 204, 204);
    static final int zzbmm = zzbml;
    static final int zzbmn = zzbmk;
    private final int mBackgroundColor;
    private final int mTextColor;
    private final String zzbmo;
    private final List<Drawable> zzbmp;
    private final int zzbmq;
    private final int zzbmr;
    private final int zzbms;

    public zza(String str, List<Drawable> list, Integer num, Integer num2, Integer num3, int i, int i2) {
        this.zzbmo = str;
        this.zzbmp = list;
        this.mBackgroundColor = num != null ? num.intValue() : zzbmm;
        this.mTextColor = num2 != null ? num2.intValue() : zzbmn;
        this.zzbmq = num3 != null ? num3.intValue() : 12;
        this.zzbmr = i;
        this.zzbms = i2;
    }

    public int getBackgroundColor() {
        return this.mBackgroundColor;
    }

    public String getText() {
        return this.zzbmo;
    }

    public int getTextColor() {
        return this.mTextColor;
    }

    public int getTextSize() {
        return this.zzbmq;
    }

    public List<Drawable> zzmj() {
        return this.zzbmp;
    }

    public int zzmk() {
        return this.zzbmr;
    }

    public int zzml() {
        return this.zzbms;
    }
}
