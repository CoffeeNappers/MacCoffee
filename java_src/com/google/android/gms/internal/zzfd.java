package com.google.android.gms.internal;

import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.text.TextUtils;
import android.view.View;
import android.view.WindowManager;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.internal.NativeProtocol;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.vk.media.camera.CameraUtilsEffects;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Future;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public final class zzfd {
    public static final zzfe zzbpj = new zzfe() { // from class: com.google.android.gms.internal.zzfd.1
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
        }
    };
    public static final zzfe zzbpk = new zzfe() { // from class: com.google.android.gms.internal.zzfd.9
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            String str = map.get("urls");
            if (TextUtils.isEmpty(str)) {
                zzkx.zzdi("URLs missing in canOpenURLs GMSG.");
                return;
            }
            String[] split = str.split(",");
            HashMap hashMap = new HashMap();
            PackageManager packageManager = zzmdVar.getContext().getPackageManager();
            for (String str2 : split) {
                String[] split2 = str2.split(";", 2);
                hashMap.put(str2, Boolean.valueOf(packageManager.resolveActivity(new Intent(split2.length > 1 ? split2[1].trim() : "android.intent.action.VIEW", Uri.parse(split2[0].trim())), 65536) != null));
            }
            zzmdVar.zza("openableURLs", hashMap);
        }
    };
    public static final zzfe zzbpl = new zzfe() { // from class: com.google.android.gms.internal.zzfd.10
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            PackageManager packageManager = zzmdVar.getContext().getPackageManager();
            try {
                try {
                    JSONArray jSONArray = new JSONObject(map.get("data")).getJSONArray("intents");
                    JSONObject jSONObject = new JSONObject();
                    for (int i = 0; i < jSONArray.length(); i++) {
                        try {
                            JSONObject jSONObject2 = jSONArray.getJSONObject(i);
                            String optString = jSONObject2.optString("id");
                            String optString2 = jSONObject2.optString("u");
                            String optString3 = jSONObject2.optString("i");
                            String optString4 = jSONObject2.optString("m");
                            String optString5 = jSONObject2.optString(TtmlNode.TAG_P);
                            String optString6 = jSONObject2.optString("c");
                            jSONObject2.optString("f");
                            jSONObject2.optString("e");
                            Intent intent = new Intent();
                            if (!TextUtils.isEmpty(optString2)) {
                                intent.setData(Uri.parse(optString2));
                            }
                            if (!TextUtils.isEmpty(optString3)) {
                                intent.setAction(optString3);
                            }
                            if (!TextUtils.isEmpty(optString4)) {
                                intent.setType(optString4);
                            }
                            if (!TextUtils.isEmpty(optString5)) {
                                intent.setPackage(optString5);
                            }
                            if (!TextUtils.isEmpty(optString6)) {
                                String[] split = optString6.split(CameraUtilsEffects.FILE_DELIM, 2);
                                if (split.length == 2) {
                                    intent.setComponent(new ComponentName(split[0], split[1]));
                                }
                            }
                            try {
                                jSONObject.put(optString, packageManager.resolveActivity(intent, 65536) != null);
                            } catch (JSONException e) {
                                zzkx.zzb("Error constructing openable urls response.", e);
                            }
                        } catch (JSONException e2) {
                            zzkx.zzb("Error parsing the intent data.", e2);
                        }
                    }
                    zzmdVar.zzb("openableIntents", jSONObject);
                } catch (JSONException e3) {
                    zzmdVar.zzb("openableIntents", new JSONObject());
                }
            } catch (JSONException e4) {
                zzmdVar.zzb("openableIntents", new JSONObject());
            }
        }
    };
    public static final zzfe zzbpm = new zzfe() { // from class: com.google.android.gms.internal.zzfd.11
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            Uri uri;
            zzav zzxe;
            String str = map.get("u");
            if (str == null) {
                zzkx.zzdi("URL missing from click GMSG.");
                return;
            }
            Uri parse = Uri.parse(str);
            try {
                zzxe = zzmdVar.zzxe();
            } catch (zzaw e) {
                String valueOf = String.valueOf(str);
                zzkx.zzdi(valueOf.length() != 0 ? "Unable to append parameter to URL: ".concat(valueOf) : new String("Unable to append parameter to URL: "));
            }
            if (zzxe != null && zzxe.zzc(parse)) {
                uri = zzxe.zza(parse, zzmdVar.getContext(), zzmdVar.getView());
                Future future = (Future) new zzll(zzmdVar.getContext(), zzmdVar.zzxf().zzda, uri.toString()).zzrz();
            }
            uri = parse;
            Future future2 = (Future) new zzll(zzmdVar.getContext(), zzmdVar.zzxf().zzda, uri.toString()).zzrz();
        }
    };
    public static final zzfe zzbpn = new zzfe() { // from class: com.google.android.gms.internal.zzfd.12
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            com.google.android.gms.ads.internal.overlay.zzd zzxa = zzmdVar.zzxa();
            if (zzxa != null) {
                zzxa.close();
                return;
            }
            com.google.android.gms.ads.internal.overlay.zzd zzxb = zzmdVar.zzxb();
            if (zzxb != null) {
                zzxb.close();
            } else {
                zzkx.zzdi("A GMSG tried to close something that wasn't an overlay.");
            }
        }
    };
    public static final zzfe zzbpo = new zzfe() { // from class: com.google.android.gms.internal.zzfd.13
        private void zzd(zzmd zzmdVar) {
            zzkx.zzdh("Received support message, responding.");
            com.google.android.gms.ads.internal.zzd zzec = zzmdVar.zzec();
            if (zzec != null && zzec.zzamr != null) {
                zzmdVar.getContext();
            }
            JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.put("event", "checkSupport");
                jSONObject.put("supports", false);
                zzmdVar.zzb("appStreaming", jSONObject);
            } catch (Throwable th) {
            }
        }

        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            if ("checkSupport".equals(map.get(NativeProtocol.WEB_DIALOG_ACTION))) {
                zzd(zzmdVar);
                return;
            }
            com.google.android.gms.ads.internal.overlay.zzd zzxa = zzmdVar.zzxa();
            if (zzxa == null) {
                return;
            }
            zzxa.zzg(zzmdVar, map);
        }
    };
    public static final zzfe zzbpp = new zzfe() { // from class: com.google.android.gms.internal.zzfd.14
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            zzmdVar.zzal(AppEventsConstants.EVENT_PARAM_VALUE_YES.equals(map.get("custom_close")));
        }
    };
    public static final zzfe zzbpq = new zzfe() { // from class: com.google.android.gms.internal.zzfd.15
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            String str = map.get("u");
            if (str == null) {
                zzkx.zzdi("URL missing from httpTrack GMSG.");
            } else {
                Future future = (Future) new zzll(zzmdVar.getContext(), zzmdVar.zzxf().zzda, str).zzrz();
            }
        }
    };
    public static final zzfe zzbpr = new zzfe() { // from class: com.google.android.gms.internal.zzfd.16
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            String valueOf = String.valueOf(map.get("string"));
            zzkx.zzdh(valueOf.length() != 0 ? "Received log message: ".concat(valueOf) : new String("Received log message: "));
        }
    };
    public static final zzfe zzbps = new zzfe() { // from class: com.google.android.gms.internal.zzfd.2
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            com.google.android.gms.ads.internal.formats.zzg zzxs = zzmdVar.zzxs();
            if (zzxs != null) {
                zzxs.zzmu();
            }
        }
    };
    public static final zzfe zzbpt = new zzfe() { // from class: com.google.android.gms.internal.zzfd.3
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            String str = map.get("tx");
            String str2 = map.get("ty");
            String str3 = map.get("td");
            try {
                int parseInt = Integer.parseInt(str);
                int parseInt2 = Integer.parseInt(str2);
                int parseInt3 = Integer.parseInt(str3);
                zzav zzxe = zzmdVar.zzxe();
                if (zzxe == null) {
                    return;
                }
                zzxe.zzaz().zza(parseInt, parseInt2, parseInt3);
            } catch (NumberFormatException e) {
                zzkx.zzdi("Could not parse touch parameters from gmsg.");
            }
        }
    };
    public static final zzfe zzbpu = new zzfe() { // from class: com.google.android.gms.internal.zzfd.4
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            if (!zzdr.zzbhd.get().booleanValue()) {
                return;
            }
            zzmdVar.zzam(!Boolean.parseBoolean(map.get("disabled")));
        }
    };
    public static final zzfe zzbpv = new zzfe() { // from class: com.google.android.gms.internal.zzfd.5
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            String str = map.get(NativeProtocol.WEB_DIALOG_ACTION);
            if ("pause".equals(str)) {
                zzmdVar.zzey();
            } else if (!"resume".equals(str)) {
            } else {
                zzmdVar.zzez();
            }
        }
    };
    public static final zzfe zzbpw = new zzfo();
    public static final zzfe zzbpx = new zzfp();
    public static final zzfe zzbpy = new zzft();
    public static final zzfe zzbpz = new zzfc();
    public static final zzfm zzbqa = new zzfm();
    public static final zzfe zzbqb = new zzfe() { // from class: com.google.android.gms.internal.zzfd.6
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            if (map.keySet().contains(TtmlNode.START)) {
                zzmdVar.zzxc().zzyb();
            } else if (map.keySet().contains("stop")) {
                zzmdVar.zzxc().zzyc();
            } else if (!map.keySet().contains("cancel")) {
            } else {
                zzmdVar.zzxc().zzyd();
            }
        }
    };
    public static final zzfe zzbqc = new zzfe() { // from class: com.google.android.gms.internal.zzfd.7
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            if (map.keySet().contains(TtmlNode.START)) {
                zzmdVar.zzan(true);
            }
            if (map.keySet().contains("stop")) {
                zzmdVar.zzan(false);
            }
        }
    };
    public static final zzfe zzbqd = new zzfe() { // from class: com.google.android.gms.internal.zzfd.8
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            zzmdVar.zza("locationReady", com.google.android.gms.ads.internal.zzu.zzgm().zza((View) zzmdVar, (WindowManager) zzmdVar.getContext().getSystemService("window")));
            zzkx.zzdi("GET LOCATION COMPILED");
        }
    };
}
