package com.google.android.gms.ads;

import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public final class VideoOptions {
    private final boolean zzakr;

    /* loaded from: classes.dex */
    public static final class Builder {
        private boolean zzakr = false;

        public VideoOptions build() {
            return new VideoOptions(this);
        }

        public Builder setStartMuted(boolean z) {
            this.zzakr = z;
            return this;
        }
    }

    private VideoOptions(Builder builder) {
        this.zzakr = builder.zzakr;
    }

    public boolean getStartMuted() {
        return this.zzakr;
    }
}
