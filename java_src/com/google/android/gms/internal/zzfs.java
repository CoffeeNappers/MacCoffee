package com.google.android.gms.internal;

import android.content.Context;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.gms.common.api.Releasable;
import com.vkontakte.android.data.ServerKeys;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;
@zzji
/* loaded from: classes.dex */
public abstract class zzfs implements Releasable {
    protected Context mContext;
    protected String zzbre;
    protected WeakReference<zzmd> zzbrf;

    public zzfs(zzmd zzmdVar) {
        this.mContext = zzmdVar.getContext();
        this.zzbre = com.google.android.gms.ads.internal.zzu.zzgm().zzh(this.mContext, zzmdVar.zzxf().zzda);
        this.zzbrf = new WeakReference<>(zzmdVar);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zza(String str, Map<String, String> map) {
        zzmd zzmdVar = this.zzbrf.get();
        if (zzmdVar != null) {
            zzmdVar.zza(str, map);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String zzbi(String str) {
        char c = 65535;
        switch (str.hashCode()) {
            case -1396664534:
                if (str.equals("badUrl")) {
                    c = 6;
                    break;
                }
                break;
            case -1347010958:
                if (str.equals("inProgress")) {
                    c = 2;
                    break;
                }
                break;
            case -918817863:
                if (str.equals("downloadTimeout")) {
                    c = 7;
                    break;
                }
                break;
            case -659376217:
                if (str.equals("contentLengthMissing")) {
                    c = 3;
                    break;
                }
                break;
            case -642208130:
                if (str.equals("playerFailed")) {
                    c = 1;
                    break;
                }
                break;
            case -354048396:
                if (str.equals("sizeExceeded")) {
                    c = '\b';
                    break;
                }
                break;
            case -32082395:
                if (str.equals("externalAbort")) {
                    c = '\t';
                    break;
                }
                break;
            case 96784904:
                if (str.equals("error")) {
                    c = 0;
                    break;
                }
                break;
            case 580119100:
                if (str.equals("expireFailed")) {
                    c = 5;
                    break;
                }
                break;
            case 725497484:
                if (str.equals("noCacheDir")) {
                    c = 4;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
            case 1:
            case 2:
            case 3:
                return "internal";
            case 4:
            case 5:
                return "io";
            case 6:
            case 7:
                return "network";
            case '\b':
            case '\t':
                return "policy";
            default:
                return "internal";
        }
    }

    public abstract void abort();

    @Override // com.google.android.gms.common.api.Releasable
    public void release() {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zza(final String str, final String str2, final int i) {
        com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.internal.zzfs.2
            @Override // java.lang.Runnable
            public void run() {
                HashMap hashMap = new HashMap();
                hashMap.put("event", "precacheComplete");
                hashMap.put("src", str);
                hashMap.put("cachedSrc", str2);
                hashMap.put("totalBytes", Integer.toString(i));
                zzfs.this.zza("onPrecacheEvent", hashMap);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zza(final String str, final String str2, final int i, final int i2, final boolean z) {
        com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.internal.zzfs.1
            @Override // java.lang.Runnable
            public void run() {
                HashMap hashMap = new HashMap();
                hashMap.put("event", "precacheProgress");
                hashMap.put("src", str);
                hashMap.put("cachedSrc", str2);
                hashMap.put("bytesLoaded", Integer.toString(i));
                hashMap.put("totalBytes", Integer.toString(i2));
                hashMap.put("cacheReady", z ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
                zzfs.this.zza("onPrecacheEvent", hashMap);
            }
        });
    }

    public void zza(final String str, final String str2, final String str3, @Nullable final String str4) {
        com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.internal.zzfs.3
            @Override // java.lang.Runnable
            public void run() {
                HashMap hashMap = new HashMap();
                hashMap.put("event", "precacheCanceled");
                hashMap.put("src", str);
                if (!TextUtils.isEmpty(str2)) {
                    hashMap.put("cachedSrc", str2);
                }
                hashMap.put(ServerKeys.TYPE, zzfs.this.zzbi(str3));
                hashMap.put("reason", str3);
                if (!TextUtils.isEmpty(str4)) {
                    hashMap.put("message", str4);
                }
                zzfs.this.zza("onPrecacheEvent", hashMap);
            }
        });
    }

    public abstract boolean zzbg(String str);

    /* JADX INFO: Access modifiers changed from: protected */
    public String zzbh(String str) {
        return com.google.android.gms.ads.internal.client.zzm.zzkr().zzdf(str);
    }
}
