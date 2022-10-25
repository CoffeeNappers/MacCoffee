package com.google.android.gms.ads.search;

import android.content.Context;
import android.graphics.Color;
import android.location.Location;
import android.os.Bundle;
import com.google.android.gms.ads.internal.client.zzad;
import com.google.android.gms.ads.mediation.MediationAdapter;
import com.google.android.gms.ads.mediation.NetworkExtras;
import com.google.android.gms.ads.mediation.customevent.CustomEvent;
/* loaded from: classes.dex */
public final class SearchAdRequest {
    public static final int BORDER_TYPE_DASHED = 1;
    public static final int BORDER_TYPE_DOTTED = 2;
    public static final int BORDER_TYPE_NONE = 0;
    public static final int BORDER_TYPE_SOLID = 3;
    public static final int CALL_BUTTON_COLOR_DARK = 2;
    public static final int CALL_BUTTON_COLOR_LIGHT = 0;
    public static final int CALL_BUTTON_COLOR_MEDIUM = 1;
    public static final String DEVICE_ID_EMULATOR = zzad.DEVICE_ID_EMULATOR;
    public static final int ERROR_CODE_INTERNAL_ERROR = 0;
    public static final int ERROR_CODE_INVALID_REQUEST = 1;
    public static final int ERROR_CODE_NETWORK_ERROR = 2;
    public static final int ERROR_CODE_NO_FILL = 3;
    private final int ac;
    private final int ad;
    private final int ae;
    private final int af;
    private final int ag;
    private final int ah;
    private final int ai;
    private final String aj;
    private final int ak;
    private final String al;
    private final int am;
    private final int an;
    private final int mBackgroundColor;
    private final zzad zzakf;
    private final String zzapy;

    /* loaded from: classes.dex */
    public static final class Builder {
        private int ac;
        private int ad;
        private int ae;
        private int af;
        private int ag;
        private int ai;
        private String aj;
        private int ak;
        private String al;
        private int am;
        private int an;
        private int mBackgroundColor;
        private String zzapy;
        private final zzad.zza zzakg = new zzad.zza();
        private int ah = 0;

        public Builder addCustomEventExtrasBundle(Class<? extends CustomEvent> cls, Bundle bundle) {
            this.zzakg.zzb(cls, bundle);
            return this;
        }

        public Builder addNetworkExtras(NetworkExtras networkExtras) {
            this.zzakg.zza(networkExtras);
            return this;
        }

        public Builder addNetworkExtrasBundle(Class<? extends MediationAdapter> cls, Bundle bundle) {
            this.zzakg.zza(cls, bundle);
            return this;
        }

        public Builder addTestDevice(String str) {
            this.zzakg.zzan(str);
            return this;
        }

        public SearchAdRequest build() {
            return new SearchAdRequest(this);
        }

        public Builder setAnchorTextColor(int i) {
            this.ac = i;
            return this;
        }

        public Builder setBackgroundColor(int i) {
            this.mBackgroundColor = i;
            this.ad = Color.argb(0, 0, 0, 0);
            this.ae = Color.argb(0, 0, 0, 0);
            return this;
        }

        public Builder setBackgroundGradient(int i, int i2) {
            this.mBackgroundColor = Color.argb(0, 0, 0, 0);
            this.ad = i2;
            this.ae = i;
            return this;
        }

        public Builder setBorderColor(int i) {
            this.af = i;
            return this;
        }

        public Builder setBorderThickness(int i) {
            this.ag = i;
            return this;
        }

        public Builder setBorderType(int i) {
            this.ah = i;
            return this;
        }

        public Builder setCallButtonColor(int i) {
            this.ai = i;
            return this;
        }

        public Builder setCustomChannels(String str) {
            this.aj = str;
            return this;
        }

        public Builder setDescriptionTextColor(int i) {
            this.ak = i;
            return this;
        }

        public Builder setFontFace(String str) {
            this.al = str;
            return this;
        }

        public Builder setHeaderTextColor(int i) {
            this.am = i;
            return this;
        }

        public Builder setHeaderTextSize(int i) {
            this.an = i;
            return this;
        }

        public Builder setLocation(Location location) {
            this.zzakg.zzb(location);
            return this;
        }

        public Builder setQuery(String str) {
            this.zzapy = str;
            return this;
        }

        public Builder setRequestAgent(String str) {
            this.zzakg.zzar(str);
            return this;
        }

        public Builder tagForChildDirectedTreatment(boolean z) {
            this.zzakg.zzo(z);
            return this;
        }
    }

    private SearchAdRequest(Builder builder) {
        this.ac = builder.ac;
        this.mBackgroundColor = builder.mBackgroundColor;
        this.ad = builder.ad;
        this.ae = builder.ae;
        this.af = builder.af;
        this.ag = builder.ag;
        this.ah = builder.ah;
        this.ai = builder.ai;
        this.aj = builder.aj;
        this.ak = builder.ak;
        this.al = builder.al;
        this.am = builder.am;
        this.an = builder.an;
        this.zzapy = builder.zzapy;
        this.zzakf = new zzad(builder.zzakg, this);
    }

    public int getAnchorTextColor() {
        return this.ac;
    }

    public int getBackgroundColor() {
        return this.mBackgroundColor;
    }

    public int getBackgroundGradientBottom() {
        return this.ad;
    }

    public int getBackgroundGradientTop() {
        return this.ae;
    }

    public int getBorderColor() {
        return this.af;
    }

    public int getBorderThickness() {
        return this.ag;
    }

    public int getBorderType() {
        return this.ah;
    }

    public int getCallButtonColor() {
        return this.ai;
    }

    public String getCustomChannels() {
        return this.aj;
    }

    public <T extends CustomEvent> Bundle getCustomEventExtrasBundle(Class<T> cls) {
        return this.zzakf.getCustomEventExtrasBundle(cls);
    }

    public int getDescriptionTextColor() {
        return this.ak;
    }

    public String getFontFace() {
        return this.al;
    }

    public int getHeaderTextColor() {
        return this.am;
    }

    public int getHeaderTextSize() {
        return this.an;
    }

    public Location getLocation() {
        return this.zzakf.getLocation();
    }

    @Deprecated
    public <T extends NetworkExtras> T getNetworkExtras(Class<T> cls) {
        return (T) this.zzakf.getNetworkExtras(cls);
    }

    public <T extends MediationAdapter> Bundle getNetworkExtrasBundle(Class<T> cls) {
        return this.zzakf.getNetworkExtrasBundle(cls);
    }

    public String getQuery() {
        return this.zzapy;
    }

    public boolean isTestDevice(Context context) {
        return this.zzakf.isTestDevice(context);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzad zzdt() {
        return this.zzakf;
    }
}
