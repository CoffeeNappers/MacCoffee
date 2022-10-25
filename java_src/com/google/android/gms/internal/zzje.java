package com.google.android.gms.internal;

import android.os.Bundle;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.google.android.gms.internal.zzjb;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzje implements zzjb.zza<com.google.android.gms.ads.internal.formats.zze> {
    private final boolean zzciy;
    private final boolean zzciz;

    public zzje(boolean z, boolean z2) {
        this.zzciy = z;
        this.zzciz = z2;
    }

    @Override // com.google.android.gms.internal.zzjb.zza
    /* renamed from: zzc */
    public com.google.android.gms.ads.internal.formats.zze zza(zzjb zzjbVar, JSONObject jSONObject) throws JSONException, InterruptedException, ExecutionException {
        List<zzlt<com.google.android.gms.ads.internal.formats.zzc>> zza = zzjbVar.zza(jSONObject, "images", true, this.zzciy, this.zzciz);
        zzlt<com.google.android.gms.ads.internal.formats.zzc> zza2 = zzjbVar.zza(jSONObject, "secondary_image", false, this.zzciy);
        zzlt<com.google.android.gms.ads.internal.formats.zza> zzf = zzjbVar.zzf(jSONObject);
        ArrayList arrayList = new ArrayList();
        for (zzlt<com.google.android.gms.ads.internal.formats.zzc> zzltVar : zza) {
            arrayList.add(zzltVar.get());
        }
        return new com.google.android.gms.ads.internal.formats.zze(jSONObject.getString("headline"), arrayList, jSONObject.getString(TtmlNode.TAG_BODY), zza2.get(), jSONObject.getString("call_to_action"), jSONObject.getString("advertiser"), zzf.get(), new Bundle());
    }
}
