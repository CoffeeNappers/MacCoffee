package com.google.android.gms.tagmanager;

import android.content.Context;
import android.net.Uri;
import com.google.android.gms.internal.zzaj;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzj extends zzdk {
    private static final String ID = com.google.android.gms.internal.zzag.ARBITRARY_PIXEL.toString();
    private static final String URL = com.google.android.gms.internal.zzah.URL.toString();
    private static final String aDR = com.google.android.gms.internal.zzah.ADDITIONAL_PARAMS.toString();
    private static final String aDS = com.google.android.gms.internal.zzah.UNREPEATABLE.toString();
    static final String aDT;
    private static final Set<String> aDU;
    private final zza aDV;
    private final Context mContext;

    /* loaded from: classes2.dex */
    public interface zza {
        zzat zzcdv();
    }

    static {
        String str = ID;
        aDT = new StringBuilder(String.valueOf(str).length() + 17).append("gtm_").append(str).append("_unrepeatable").toString();
        aDU = new HashSet();
    }

    public zzj(final Context context) {
        this(context, new zza() { // from class: com.google.android.gms.tagmanager.zzj.1
            @Override // com.google.android.gms.tagmanager.zzj.zza
            public zzat zzcdv() {
                return zzaa.zzdx(context);
            }
        });
    }

    zzj(Context context, zza zzaVar) {
        super(ID, URL);
        this.aDV = zzaVar;
        this.mContext = context;
    }

    private synchronized boolean zzop(String str) {
        boolean z = true;
        synchronized (this) {
            if (!zzor(str)) {
                if (zzoq(str)) {
                    aDU.add(str);
                } else {
                    z = false;
                }
            }
        }
        return z;
    }

    @Override // com.google.android.gms.tagmanager.zzdk
    public void zzba(Map<String, zzaj.zza> map) {
        String zzg = map.get(aDS) != null ? zzdm.zzg(map.get(aDS)) : null;
        if (zzg == null || !zzop(zzg)) {
            Uri.Builder buildUpon = Uri.parse(zzdm.zzg(map.get(URL))).buildUpon();
            zzaj.zza zzaVar = map.get(aDR);
            if (zzaVar != null) {
                Object zzl = zzdm.zzl(zzaVar);
                if (!(zzl instanceof List)) {
                    String valueOf = String.valueOf(buildUpon.build().toString());
                    zzbo.e(valueOf.length() != 0 ? "ArbitraryPixel: additional params not a list: not sending partial hit: ".concat(valueOf) : new String("ArbitraryPixel: additional params not a list: not sending partial hit: "));
                    return;
                }
                for (Object obj : (List) zzl) {
                    if (!(obj instanceof Map)) {
                        String valueOf2 = String.valueOf(buildUpon.build().toString());
                        zzbo.e(valueOf2.length() != 0 ? "ArbitraryPixel: additional params contains non-map: not sending partial hit: ".concat(valueOf2) : new String("ArbitraryPixel: additional params contains non-map: not sending partial hit: "));
                        return;
                    }
                    for (Map.Entry entry : ((Map) obj).entrySet()) {
                        buildUpon.appendQueryParameter(entry.getKey().toString(), entry.getValue().toString());
                    }
                }
            }
            String uri = buildUpon.build().toString();
            this.aDV.zzcdv().zzpg(uri);
            String valueOf3 = String.valueOf(uri);
            zzbo.v(valueOf3.length() != 0 ? "ArbitraryPixel: url = ".concat(valueOf3) : new String("ArbitraryPixel: url = "));
            if (zzg == null) {
                return;
            }
            synchronized (zzj.class) {
                aDU.add(zzg);
                zzdd.zzc(this.mContext, aDT, zzg, "true");
            }
        }
    }

    boolean zzoq(String str) {
        return this.mContext.getSharedPreferences(aDT, 0).contains(str);
    }

    boolean zzor(String str) {
        return aDU.contains(str);
    }
}
