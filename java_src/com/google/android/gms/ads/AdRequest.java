package com.google.android.gms.ads;

import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import com.google.ads.mediation.admob.AdMobAdapter;
import com.google.android.gms.ads.internal.client.zzad;
import com.google.android.gms.ads.mediation.MediationAdapter;
import com.google.android.gms.ads.mediation.NetworkExtras;
import com.google.android.gms.ads.mediation.customevent.CustomEvent;
import com.google.android.gms.common.internal.zzaa;
import java.util.Date;
import java.util.Set;
/* loaded from: classes.dex */
public final class AdRequest {
    public static final String DEVICE_ID_EMULATOR = zzad.DEVICE_ID_EMULATOR;
    public static final int ERROR_CODE_INTERNAL_ERROR = 0;
    public static final int ERROR_CODE_INVALID_REQUEST = 1;
    public static final int ERROR_CODE_NETWORK_ERROR = 2;
    public static final int ERROR_CODE_NO_FILL = 3;
    public static final int GENDER_FEMALE = 2;
    public static final int GENDER_MALE = 1;
    public static final int GENDER_UNKNOWN = 0;
    public static final int MAX_CONTENT_URL_LENGTH = 512;
    private final zzad zzakf;

    /* loaded from: classes.dex */
    public static final class Builder {
        private final zzad.zza zzakg = new zzad.zza();

        public Builder() {
            this.zzakg.zzan(AdRequest.DEVICE_ID_EMULATOR);
        }

        public Builder addCustomEventExtrasBundle(Class<? extends CustomEvent> cls, Bundle bundle) {
            this.zzakg.zzb(cls, bundle);
            return this;
        }

        public Builder addKeyword(String str) {
            this.zzakg.zzam(str);
            return this;
        }

        public Builder addNetworkExtras(NetworkExtras networkExtras) {
            this.zzakg.zza(networkExtras);
            return this;
        }

        public Builder addNetworkExtrasBundle(Class<? extends MediationAdapter> cls, Bundle bundle) {
            this.zzakg.zza(cls, bundle);
            if (cls.equals(AdMobAdapter.class) && bundle.getBoolean("_emulatorLiveAds")) {
                this.zzakg.zzao(AdRequest.DEVICE_ID_EMULATOR);
            }
            return this;
        }

        public Builder addTestDevice(String str) {
            this.zzakg.zzan(str);
            return this;
        }

        public AdRequest build() {
            return new AdRequest(this);
        }

        public Builder setBirthday(Date date) {
            this.zzakg.zza(date);
            return this;
        }

        public Builder setContentUrl(String str) {
            zzaa.zzb(str, "Content URL must be non-null.");
            zzaa.zzh(str, "Content URL must be non-empty.");
            zzaa.zzb(str.length() <= 512, "Content URL must not exceed %d in length.  Provided length was %d.", 512, Integer.valueOf(str.length()));
            this.zzakg.zzap(str);
            return this;
        }

        public Builder setGender(int i) {
            this.zzakg.zzx(i);
            return this;
        }

        public Builder setIsDesignedForFamilies(boolean z) {
            this.zzakg.zzp(z);
            return this;
        }

        public Builder setLocation(Location location) {
            this.zzakg.zzb(location);
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

    private AdRequest(Builder builder) {
        this.zzakf = new zzad(builder.zzakg);
    }

    public Date getBirthday() {
        return this.zzakf.getBirthday();
    }

    public String getContentUrl() {
        return this.zzakf.getContentUrl();
    }

    public <T extends CustomEvent> Bundle getCustomEventExtrasBundle(Class<T> cls) {
        return this.zzakf.getCustomEventExtrasBundle(cls);
    }

    public int getGender() {
        return this.zzakf.getGender();
    }

    public Set<String> getKeywords() {
        return this.zzakf.getKeywords();
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

    public boolean isTestDevice(Context context) {
        return this.zzakf.isTestDevice(context);
    }

    public zzad zzdt() {
        return this.zzakf;
    }
}
