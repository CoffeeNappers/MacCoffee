package com.google.android.gms.internal;

import android.os.Bundle;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.google.android.gms.internal.zzjb;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzjd implements zzjb.zza<com.google.android.gms.ads.internal.formats.zzd> {
    private final boolean zzciy;
    private final boolean zzciz;

    public zzjd(boolean z, boolean z2) {
        this.zzciy = z;
        this.zzciz = z2;
    }

    private zzmd zzb(zzlt<zzmd> zzltVar) {
        try {
            return zzltVar.get(zzdr.zzbje.get().intValue(), TimeUnit.SECONDS);
        } catch (InterruptedException e) {
            zzkx.zzc("InterruptedException occurred while waiting for video to load", e);
            Thread.currentThread().interrupt();
            return null;
        } catch (CancellationException e2) {
            e = e2;
            zzkx.zzc("Exception occurred while waiting for video to load", e);
            return null;
        } catch (ExecutionException e3) {
            e = e3;
            zzkx.zzc("Exception occurred while waiting for video to load", e);
            return null;
        } catch (TimeoutException e4) {
            e = e4;
            zzkx.zzc("Exception occurred while waiting for video to load", e);
            return null;
        }
    }

    @Override // com.google.android.gms.internal.zzjb.zza
    /* renamed from: zzb */
    public com.google.android.gms.ads.internal.formats.zzd zza(zzjb zzjbVar, JSONObject jSONObject) throws JSONException, InterruptedException, ExecutionException {
        List<zzlt<com.google.android.gms.ads.internal.formats.zzc>> zza = zzjbVar.zza(jSONObject, "images", true, this.zzciy, this.zzciz);
        zzlt<com.google.android.gms.ads.internal.formats.zzc> zza2 = zzjbVar.zza(jSONObject, "app_icon", true, this.zzciy);
        zzlt<zzmd> zzc = zzjbVar.zzc(jSONObject, "video");
        zzlt<com.google.android.gms.ads.internal.formats.zza> zzf = zzjbVar.zzf(jSONObject);
        ArrayList arrayList = new ArrayList();
        for (zzlt<com.google.android.gms.ads.internal.formats.zzc> zzltVar : zza) {
            arrayList.add(zzltVar.get());
        }
        zzmd zzb = zzb(zzc);
        return new com.google.android.gms.ads.internal.formats.zzd(jSONObject.getString("headline"), arrayList, jSONObject.getString(TtmlNode.TAG_BODY), zza2.get(), jSONObject.getString("call_to_action"), jSONObject.optDouble("rating", -1.0d), jSONObject.optString("store"), jSONObject.optString("price"), zzf.get(), new Bundle(), zzb != null ? zzb.zzxn() : null, zzb != null ? zzb.getView() : null);
    }
}
