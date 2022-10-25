package com.google.android.gms.internal;

import android.text.TextUtils;
import com.facebook.internal.NativeProtocol;
import io.sentry.marshaller.json.JsonMarshaller;
import java.util.Map;
@zzji
/* loaded from: classes.dex */
public final class zzfc implements zzfe {
    private void zzc(zzmd zzmdVar, Map<String, String> map) {
        String str = map.get("label");
        String str2 = map.get("start_label");
        String str3 = map.get(JsonMarshaller.TIMESTAMP);
        if (TextUtils.isEmpty(str)) {
            zzkx.zzdi("No label given for CSI tick.");
        } else if (TextUtils.isEmpty(str3)) {
            zzkx.zzdi("No timestamp given for CSI tick.");
        } else {
            try {
                long zzd = zzd(Long.parseLong(str3));
                if (TextUtils.isEmpty(str2)) {
                    str2 = "native:view_load";
                }
                zzmdVar.zzxm().zza(str, str2, zzd);
            } catch (NumberFormatException e) {
                zzkx.zzc("Malformed timestamp for CSI tick.", e);
            }
        }
    }

    private long zzd(long j) {
        return (j - com.google.android.gms.ads.internal.zzu.zzgs().currentTimeMillis()) + com.google.android.gms.ads.internal.zzu.zzgs().elapsedRealtime();
    }

    private void zzd(zzmd zzmdVar, Map<String, String> map) {
        String str = map.get("value");
        if (TextUtils.isEmpty(str)) {
            zzkx.zzdi("No value given for CSI experiment.");
            return;
        }
        zzdz zzly = zzmdVar.zzxm().zzly();
        if (zzly == null) {
            zzkx.zzdi("No ticker for WebView, dropping experiment ID.");
        } else {
            zzly.zzg("e", str);
        }
    }

    private void zze(zzmd zzmdVar, Map<String, String> map) {
        String str = map.get("name");
        String str2 = map.get("value");
        if (TextUtils.isEmpty(str2)) {
            zzkx.zzdi("No value given for CSI extra.");
        } else if (TextUtils.isEmpty(str)) {
            zzkx.zzdi("No name given for CSI extra.");
        } else {
            zzdz zzly = zzmdVar.zzxm().zzly();
            if (zzly == null) {
                zzkx.zzdi("No ticker for WebView, dropping extra parameter.");
            } else {
                zzly.zzg(str, str2);
            }
        }
    }

    @Override // com.google.android.gms.internal.zzfe
    public void zza(zzmd zzmdVar, Map<String, String> map) {
        String str = map.get(NativeProtocol.WEB_DIALOG_ACTION);
        if ("tick".equals(str)) {
            zzc(zzmdVar, map);
        } else if ("experiment".equals(str)) {
            zzd(zzmdVar, map);
        } else if (!JsonMarshaller.EXTRA.equals(str)) {
        } else {
            zze(zzmdVar, map);
        }
    }
}
