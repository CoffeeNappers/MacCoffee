package com.google.android.gms.ads.internal.formats;

import android.content.Context;
import android.view.MotionEvent;
import android.view.View;
import java.lang.ref.WeakReference;
import java.util.Map;
import org.json.JSONObject;
/* loaded from: classes.dex */
public interface zzi {

    /* loaded from: classes.dex */
    public interface zza {
        String getCustomTemplateId();

        void zzb(zzi zziVar);

        String zzmq();

        com.google.android.gms.ads.internal.formats.zza zzmr();
    }

    Context getContext();

    void zza(View view, String str, JSONObject jSONObject, Map<String, WeakReference<View>> map, View view2);

    void zza(View view, Map<String, WeakReference<View>> map, JSONObject jSONObject, View view2);

    void zzb(View view, Map<String, WeakReference<View>> map);

    void zzc(View view, Map<String, WeakReference<View>> map);

    void zzd(MotionEvent motionEvent);

    void zzd(View view, Map<String, WeakReference<View>> map);

    void zzj(View view);

    View zzmy();
}
