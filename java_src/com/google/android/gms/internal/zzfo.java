package com.google.android.gms.internal;

import android.content.Context;
import android.graphics.Color;
import android.os.SystemClock;
import android.text.TextUtils;
import android.view.MotionEvent;
import com.facebook.internal.NativeProtocol;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import java.util.Map;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public final class zzfo implements zzfe {
    private boolean zzbqz;

    private static int zza(Context context, Map<String, String> map, String str, int i) {
        String str2 = map.get(str);
        if (str2 != null) {
            try {
                return com.google.android.gms.ads.internal.client.zzm.zzkr().zzb(context, Integer.parseInt(str2));
            } catch (NumberFormatException e) {
                zzkx.zzdi(new StringBuilder(String.valueOf(str).length() + 34 + String.valueOf(str2).length()).append("Could not parse ").append(str).append(" in a video GMSG: ").append(str2).toString());
                return i;
            }
        }
        return i;
    }

    @Override // com.google.android.gms.internal.zzfe
    public void zza(zzmd zzmdVar, Map<String, String> map) {
        int i;
        int i2;
        String str = map.get(NativeProtocol.WEB_DIALOG_ACTION);
        if (str == null) {
            zzkx.zzdi("Action missing from video GMSG.");
            return;
        }
        if (zzkx.zzbi(3)) {
            JSONObject jSONObject = new JSONObject(map);
            jSONObject.remove("google.afma.Notify_dt");
            String valueOf = String.valueOf(jSONObject.toString());
            zzkx.zzdg(new StringBuilder(String.valueOf(str).length() + 13 + String.valueOf(valueOf).length()).append("Video GMSG: ").append(str).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(valueOf).toString());
        }
        if ("background".equals(str)) {
            String str2 = map.get(TtmlNode.ATTR_TTS_COLOR);
            if (TextUtils.isEmpty(str2)) {
                zzkx.zzdi("Color parameter missing from color video GMSG.");
                return;
            }
            try {
                zzmdVar.setBackgroundColor(Color.parseColor(str2));
                return;
            } catch (IllegalArgumentException e) {
                zzkx.zzdi("Invalid color parameter in video GMSG.");
                return;
            }
        }
        zzmc zzxk = zzmdVar.zzxk();
        if (zzxk == null) {
            zzkx.zzdi("Could not get underlay container for a video GMSG.");
            return;
        }
        boolean equals = "new".equals(str);
        boolean equals2 = "position".equals(str);
        if (equals || equals2) {
            Context context = zzmdVar.getContext();
            int zza = zza(context, map, "x", 0);
            int zza2 = zza(context, map, "y", 0);
            int zza3 = zza(context, map, "w", -1);
            int zza4 = zza(context, map, "h", -1);
            if (zzdr.zzbjh.get().booleanValue()) {
                i = Math.min(zza3, zzmdVar.getMeasuredWidth() - zza);
                zza4 = Math.min(zza4, zzmdVar.getMeasuredHeight() - zza2);
            } else {
                i = zza3;
            }
            try {
                i2 = Integer.parseInt(map.get("player"));
            } catch (NumberFormatException e2) {
                i2 = 0;
            }
            boolean parseBoolean = Boolean.parseBoolean(map.get("spherical"));
            if (!equals || zzxk.zzwv() != null) {
                zzxk.zze(zza, zza2, i, zza4);
                return;
            } else {
                zzxk.zza(zza, zza2, i, zza4, i2, parseBoolean);
                return;
            }
        }
        com.google.android.gms.ads.internal.overlay.zzk zzwv = zzxk.zzwv();
        if (zzwv == null) {
            com.google.android.gms.ads.internal.overlay.zzk.zzi(zzmdVar);
        } else if ("click".equals(str)) {
            Context context2 = zzmdVar.getContext();
            int zza5 = zza(context2, map, "x", 0);
            int zza6 = zza(context2, map, "y", 0);
            long uptimeMillis = SystemClock.uptimeMillis();
            MotionEvent obtain = MotionEvent.obtain(uptimeMillis, uptimeMillis, 0, zza5, zza6, 0);
            zzwv.zzf(obtain);
            obtain.recycle();
        } else if ("currentTime".equals(str)) {
            String str3 = map.get("time");
            if (str3 == null) {
                zzkx.zzdi("Time parameter missing from currentTime video GMSG.");
                return;
            }
            try {
                zzwv.seekTo((int) (Float.parseFloat(str3) * 1000.0f));
            } catch (NumberFormatException e3) {
                String valueOf2 = String.valueOf(str3);
                zzkx.zzdi(valueOf2.length() != 0 ? "Could not parse time parameter from currentTime video GMSG: ".concat(valueOf2) : new String("Could not parse time parameter from currentTime video GMSG: "));
            }
        } else if ("hide".equals(str)) {
            zzwv.setVisibility(4);
        } else if ("load".equals(str)) {
            zzwv.zznt();
        } else if ("muted".equals(str)) {
            if (Boolean.parseBoolean(map.get("muted"))) {
                zzwv.zzqh();
            } else {
                zzwv.zzqi();
            }
        } else if ("pause".equals(str)) {
            zzwv.pause();
        } else if ("play".equals(str)) {
            zzwv.play();
        } else if ("show".equals(str)) {
            zzwv.setVisibility(0);
        } else if ("src".equals(str)) {
            zzwv.zzce(map.get("src"));
        } else if ("touchMove".equals(str)) {
            Context context3 = zzmdVar.getContext();
            zzwv.zza(zza(context3, map, "dx", 0), zza(context3, map, "dy", 0));
            if (this.zzbqz) {
                return;
            }
            zzmdVar.zzxa().zzpt();
            this.zzbqz = true;
        } else if (!"volume".equals(str)) {
            if ("watermark".equals(str)) {
                zzwv.zzqj();
                return;
            }
            String valueOf3 = String.valueOf(str);
            zzkx.zzdi(valueOf3.length() != 0 ? "Unknown video action: ".concat(valueOf3) : new String("Unknown video action: "));
        } else {
            String str4 = map.get("volume");
            if (str4 == null) {
                zzkx.zzdi("Level parameter missing from volume video GMSG.");
                return;
            }
            try {
                zzwv.zzb(Float.parseFloat(str4));
            } catch (NumberFormatException e4) {
                String valueOf4 = String.valueOf(str4);
                zzkx.zzdi(valueOf4.length() != 0 ? "Could not parse volume parameter from volume video GMSG: ".concat(valueOf4) : new String("Could not parse volume parameter from volume video GMSG: "));
            }
        }
    }
}
