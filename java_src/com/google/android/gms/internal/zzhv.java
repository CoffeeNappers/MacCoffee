package com.google.android.gms.internal;

import com.facebook.internal.NativeProtocol;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzhv {
    private final zzmd zzbnz;
    private final String zzbzk;

    public zzhv(zzmd zzmdVar) {
        this(zzmdVar, "");
    }

    public zzhv(zzmd zzmdVar, String str) {
        this.zzbnz = zzmdVar;
        this.zzbzk = str;
    }

    public void zza(int i, int i2, int i3, int i4, float f, int i5) {
        try {
            this.zzbnz.zzb("onScreenInfoChanged", new JSONObject().put("width", i).put("height", i2).put("maxSizeWidth", i3).put("maxSizeHeight", i4).put("density", f).put("rotation", i5));
        } catch (JSONException e) {
            zzkx.zzb("Error occured while obtaining screen information.", e);
        }
    }

    public void zzb(int i, int i2, int i3, int i4) {
        try {
            this.zzbnz.zzb("onSizeChanged", new JSONObject().put("x", i).put("y", i2).put("width", i3).put("height", i4));
        } catch (JSONException e) {
            zzkx.zzb("Error occured while dispatching size change.", e);
        }
    }

    public void zzc(int i, int i2, int i3, int i4) {
        try {
            this.zzbnz.zzb("onDefaultPositionReceived", new JSONObject().put("x", i).put("y", i2).put("width", i3).put("height", i4));
        } catch (JSONException e) {
            zzkx.zzb("Error occured while dispatching default position.", e);
        }
    }

    public void zzcb(String str) {
        try {
            this.zzbnz.zzb("onError", new JSONObject().put("message", str).put(NativeProtocol.WEB_DIALOG_ACTION, this.zzbzk));
        } catch (JSONException e) {
            zzkx.zzb("Error occurred while dispatching error event.", e);
        }
    }

    public void zzcc(String str) {
        try {
            this.zzbnz.zzb("onReadyEventReceived", new JSONObject().put("js", str));
        } catch (JSONException e) {
            zzkx.zzb("Error occured while dispatching ready Event.", e);
        }
    }

    public void zzcd(String str) {
        try {
            this.zzbnz.zzb("onStateChanged", new JSONObject().put("state", str));
        } catch (JSONException e) {
            zzkx.zzb("Error occured while dispatching state change.", e);
        }
    }
}
