package com.google.android.gms.internal;

import com.google.ads.AdRequest;
import com.google.ads.AdSize;
import com.google.ads.mediation.MediationAdRequest;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import java.util.Date;
import java.util.HashSet;
@zzji
/* loaded from: classes.dex */
public final class zzhn {

    /* renamed from: com.google.android.gms.internal.zzhn$1  reason: invalid class name */
    /* loaded from: classes2.dex */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] zzbxr;

        static {
            try {
                zzbxs[AdRequest.ErrorCode.INTERNAL_ERROR.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                zzbxs[AdRequest.ErrorCode.INVALID_REQUEST.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                zzbxs[AdRequest.ErrorCode.NETWORK_ERROR.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                zzbxs[AdRequest.ErrorCode.NO_FILL.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            zzbxr = new int[AdRequest.Gender.values().length];
            try {
                zzbxr[AdRequest.Gender.FEMALE.ordinal()] = 1;
            } catch (NoSuchFieldError e5) {
            }
            try {
                zzbxr[AdRequest.Gender.MALE.ordinal()] = 2;
            } catch (NoSuchFieldError e6) {
            }
            try {
                zzbxr[AdRequest.Gender.UNKNOWN.ordinal()] = 3;
            } catch (NoSuchFieldError e7) {
            }
        }
    }

    public static int zza(AdRequest.ErrorCode errorCode) {
        switch (errorCode) {
            case INVALID_REQUEST:
                return 1;
            case NETWORK_ERROR:
                return 2;
            case NO_FILL:
                return 3;
            default:
                return 0;
        }
    }

    public static AdRequest.Gender zzag(int i) {
        switch (i) {
            case 1:
                return AdRequest.Gender.MALE;
            case 2:
                return AdRequest.Gender.FEMALE;
            default:
                return AdRequest.Gender.UNKNOWN;
        }
    }

    public static AdSize zzc(AdSizeParcel adSizeParcel) {
        AdSize[] adSizeArr = {AdSize.SMART_BANNER, AdSize.BANNER, AdSize.IAB_MRECT, AdSize.IAB_BANNER, AdSize.IAB_LEADERBOARD, AdSize.IAB_WIDE_SKYSCRAPER};
        for (int i = 0; i < 6; i++) {
            if (adSizeArr[i].getWidth() == adSizeParcel.width && adSizeArr[i].getHeight() == adSizeParcel.height) {
                return adSizeArr[i];
            }
        }
        return new AdSize(com.google.android.gms.ads.zza.zza(adSizeParcel.width, adSizeParcel.height, adSizeParcel.zzazq));
    }

    public static MediationAdRequest zzs(AdRequestParcel adRequestParcel) {
        return new MediationAdRequest(new Date(adRequestParcel.zzayl), zzag(adRequestParcel.zzaym), adRequestParcel.zzayn != null ? new HashSet(adRequestParcel.zzayn) : null, adRequestParcel.zzayo, adRequestParcel.zzayt);
    }
}
