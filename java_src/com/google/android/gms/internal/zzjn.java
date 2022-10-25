package com.google.android.gms.internal;

import com.google.android.gms.internal.zzgh;
import java.util.Map;
import java.util.concurrent.Future;
@zzji
/* loaded from: classes.dex */
public final class zzjn {
    private String zzcec;
    private String zzcnz;
    zzgh.zzc zzcob;
    private final Object zzako = new Object();
    private zzlq<zzjq> zzcoa = new zzlq<>();
    public final zzfe zzcoc = new zzfe() { // from class: com.google.android.gms.internal.zzjn.1
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            synchronized (zzjn.this.zzako) {
                if (zzjn.this.zzcoa.isDone()) {
                    return;
                }
                if (!zzjn.this.zzcec.equals(map.get("request_id"))) {
                    return;
                }
                zzjq zzjqVar = new zzjq(1, map);
                String valueOf = String.valueOf(zzjqVar.getType());
                String valueOf2 = String.valueOf(zzjqVar.zztm());
                zzkx.zzdi(new StringBuilder(String.valueOf(valueOf).length() + 24 + String.valueOf(valueOf2).length()).append("Invalid ").append(valueOf).append(" request error: ").append(valueOf2).toString());
                zzjn.this.zzcoa.zzh(zzjqVar);
            }
        }
    };
    public final zzfe zzcod = new zzfe() { // from class: com.google.android.gms.internal.zzjn.2
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            synchronized (zzjn.this.zzako) {
                if (zzjn.this.zzcoa.isDone()) {
                    return;
                }
                zzjq zzjqVar = new zzjq(-2, map);
                if (!zzjn.this.zzcec.equals(zzjqVar.getRequestId())) {
                    return;
                }
                String url = zzjqVar.getUrl();
                if (url == null) {
                    zzkx.zzdi("URL missing in loadAdUrl GMSG.");
                    return;
                }
                if (url.contains("%40mediation_adapters%40")) {
                    String replaceAll = url.replaceAll("%40mediation_adapters%40", zzkv.zza(zzmdVar.getContext(), map.get("check_adapters"), zzjn.this.zzcnz));
                    zzjqVar.setUrl(replaceAll);
                    String valueOf = String.valueOf(replaceAll);
                    zzkx.v(valueOf.length() != 0 ? "Ad request URL modified to ".concat(valueOf) : new String("Ad request URL modified to "));
                }
                zzjn.this.zzcoa.zzh(zzjqVar);
            }
        }
    };
    public final zzfe zzcoe = new zzfe() { // from class: com.google.android.gms.internal.zzjn.3
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            synchronized (zzjn.this.zzako) {
                if (zzjn.this.zzcoa.isDone()) {
                    return;
                }
                zzjq zzjqVar = new zzjq(-2, map);
                if (!zzjn.this.zzcec.equals(zzjqVar.getRequestId())) {
                    return;
                }
                zzjqVar.zztq();
                zzjn.this.zzcoa.zzh(zzjqVar);
            }
        }
    };

    public zzjn(String str, String str2) {
        this.zzcnz = str2;
        this.zzcec = str;
    }

    public void zzb(zzgh.zzc zzcVar) {
        this.zzcob = zzcVar;
    }

    public zzgh.zzc zztj() {
        return this.zzcob;
    }

    public Future<zzjq> zztk() {
        return this.zzcoa;
    }

    public void zztl() {
    }
}
