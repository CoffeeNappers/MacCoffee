package com.google.android.gms.ads.formats;

import android.support.annotation.Nullable;
import com.google.android.gms.ads.VideoOptions;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public final class NativeAdOptions {
    public static final int ADCHOICES_BOTTOM_LEFT = 3;
    public static final int ADCHOICES_BOTTOM_RIGHT = 2;
    public static final int ADCHOICES_TOP_LEFT = 0;
    public static final int ADCHOICES_TOP_RIGHT = 1;
    public static final int ORIENTATION_ANY = 0;
    public static final int ORIENTATION_LANDSCAPE = 2;
    public static final int ORIENTATION_PORTRAIT = 1;
    private final boolean zzaky;
    private final int zzakz;
    private final boolean zzala;
    private final int zzalb;
    private final VideoOptions zzalc;

    /* loaded from: classes.dex */
    public @interface AdChoicesPlacement {
    }

    /* loaded from: classes.dex */
    public static final class Builder {
        private boolean zzaky = false;
        private int zzakz = 0;
        private boolean zzala = false;
        private int zzalb = 1;
        private VideoOptions zzalc;

        public NativeAdOptions build() {
            return new NativeAdOptions(this);
        }

        public Builder setAdChoicesPlacement(@AdChoicesPlacement int i) {
            this.zzalb = i;
            return this;
        }

        public Builder setImageOrientation(int i) {
            this.zzakz = i;
            return this;
        }

        public Builder setRequestMultipleImages(boolean z) {
            this.zzala = z;
            return this;
        }

        public Builder setReturnUrlsForImageAssets(boolean z) {
            this.zzaky = z;
            return this;
        }

        public Builder setVideoOptions(VideoOptions videoOptions) {
            this.zzalc = videoOptions;
            return this;
        }
    }

    private NativeAdOptions(Builder builder) {
        this.zzaky = builder.zzaky;
        this.zzakz = builder.zzakz;
        this.zzala = builder.zzala;
        this.zzalb = builder.zzalb;
        this.zzalc = builder.zzalc;
    }

    public int getAdChoicesPlacement() {
        return this.zzalb;
    }

    public int getImageOrientation() {
        return this.zzakz;
    }

    @Nullable
    public VideoOptions getVideoOptions() {
        return this.zzalc;
    }

    public boolean shouldRequestMultipleImages() {
        return this.zzala;
    }

    public boolean shouldReturnUrlsForImageAssets() {
        return this.zzaky;
    }
}
