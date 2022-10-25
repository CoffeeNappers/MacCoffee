package com.google.android.gms.ads.internal.cache;

import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.gms.ads.internal.zzu;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkx;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public class CacheOffering extends AbstractSafeParcelable {
    public static final Parcelable.Creator<CacheOffering> CREATOR = new zzd();
    @Nullable
    public final String url;
    public final int version;
    public final long zzayd;
    public final String zzaye;
    public final String zzayf;
    public final String zzayg;
    public final Bundle zzayh;
    public final boolean zzayi;

    /* JADX INFO: Access modifiers changed from: package-private */
    public CacheOffering(int i, @Nullable String str, long j, String str2, String str3, String str4, Bundle bundle, boolean z) {
        this.version = i;
        this.url = str;
        this.zzayd = j;
        this.zzaye = str2 == null ? "" : str2;
        this.zzayf = str3 == null ? "" : str3;
        this.zzayg = str4 == null ? "" : str4;
        this.zzayh = bundle == null ? new Bundle() : bundle;
        this.zzayi = z;
    }

    @Nullable
    public static CacheOffering zzak(String str) {
        return zze(Uri.parse(str));
    }

    @Nullable
    public static CacheOffering zze(Uri uri) {
        try {
            if (!"gcache".equals(uri.getScheme())) {
                return null;
            }
            List<String> pathSegments = uri.getPathSegments();
            if (pathSegments.size() != 2) {
                zzkx.zzdi(new StringBuilder(62).append("Expected 2 path parts for namespace and id, found :").append(pathSegments.size()).toString());
                return null;
            }
            String str = pathSegments.get(0);
            String str2 = pathSegments.get(1);
            String host = uri.getHost();
            String queryParameter = uri.getQueryParameter("url");
            boolean equals = AppEventsConstants.EVENT_PARAM_VALUE_YES.equals(uri.getQueryParameter("read_only"));
            String queryParameter2 = uri.getQueryParameter("expiration");
            long parseLong = queryParameter2 == null ? 0L : Long.parseLong(queryParameter2);
            Bundle bundle = new Bundle();
            for (String str3 : zzu.zzgo().zzh(uri)) {
                if (str3.startsWith("tag.")) {
                    bundle.putString(str3.substring("tag.".length()), uri.getQueryParameter(str3));
                }
            }
            return new CacheOffering(1, queryParameter, parseLong, host, str, str2, bundle, equals);
        } catch (NullPointerException | NumberFormatException e) {
            zzkx.zzc("Unable to parse Uri into cache offering.", e);
            return null;
        }
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzd.zza(this, parcel, i);
    }
}
