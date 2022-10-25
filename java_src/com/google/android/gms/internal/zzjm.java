package com.google.android.gms.internal;

import android.content.Context;
import android.graphics.Color;
import android.location.Location;
import android.os.Build;
import android.os.Bundle;
import android.os.Debug;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.facebook.internal.AnalyticsEvents;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.client.SearchAdRequestParcel;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.internal.zzjv;
import com.vkontakte.android.FragmentWrapperActivity;
import io.fabric.sdk.android.services.network.HttpRequest;
import io.reactivex.annotations.SchedulerSupport;
import io.sentry.marshaller.json.JsonMarshaller;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public final class zzjm {
    private static final SimpleDateFormat zzcny = new SimpleDateFormat("yyyyMMdd", Locale.US);

    /* JADX WARN: Removed duplicated region for block: B:55:0x0157 A[Catch: JSONException -> 0x0261, TryCatch #0 {JSONException -> 0x0261, blocks: (B:2:0x0000, B:4:0x0034, B:7:0x003c, B:9:0x0048, B:11:0x0054, B:12:0x005e, B:14:0x007f, B:15:0x008f, B:17:0x00a4, B:18:0x00ac, B:20:0x00b3, B:22:0x00b9, B:24:0x00d5, B:31:0x00f5, B:35:0x0103, B:36:0x0107, B:40:0x0115, B:41:0x0119, B:45:0x0127, B:47:0x012d, B:49:0x0132, B:50:0x0136, B:52:0x013e, B:53:0x0140, B:55:0x0157, B:56:0x0161, B:65:0x028a, B:64:0x0286, B:63:0x0282, B:28:0x00e3, B:30:0x00ec), top: B:70:0x0000 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static com.google.android.gms.ads.internal.request.AdResponseParcel zza(android.content.Context r47, com.google.android.gms.ads.internal.request.AdRequestInfoParcel r48, java.lang.String r49) {
        /*
            Method dump skipped, instructions count: 666
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzjm.zza(android.content.Context, com.google.android.gms.ads.internal.request.AdRequestInfoParcel, java.lang.String):com.google.android.gms.ads.internal.request.AdResponseParcel");
    }

    @Nullable
    private static List<String> zza(@Nullable JSONArray jSONArray, @Nullable List<String> list) throws JSONException {
        if (jSONArray == null) {
            return null;
        }
        if (list == null) {
            list = new LinkedList<>();
        }
        for (int i = 0; i < jSONArray.length(); i++) {
            list.add(jSONArray.getString(i));
        }
        return list;
    }

    @Nullable
    public static JSONObject zza(Context context, zzjj zzjjVar) {
        AdSizeParcel[] adSizeParcelArr;
        AdSizeParcel[] adSizeParcelArr2;
        AdRequestInfoParcel adRequestInfoParcel = zzjjVar.zzcmx;
        Location location = zzjjVar.zzayt;
        zzjr zzjrVar = zzjjVar.zzcmy;
        Bundle bundle = zzjjVar.zzckb;
        JSONObject jSONObject = zzjjVar.zzcmz;
        try {
            HashMap hashMap = new HashMap();
            hashMap.put("extra_caps", zzdr.zzbit.get());
            if (zzjjVar.zzckj.size() > 0) {
                hashMap.put("eid", TextUtils.join(",", zzjjVar.zzckj));
            }
            if (adRequestInfoParcel.zzcjt != null) {
                hashMap.put("ad_pos", adRequestInfoParcel.zzcjt);
            }
            zza(hashMap, adRequestInfoParcel.zzcju);
            if (adRequestInfoParcel.zzarm.zzazs != null) {
                boolean z = false;
                boolean z2 = false;
                for (AdSizeParcel adSizeParcel : adRequestInfoParcel.zzarm.zzazs) {
                    if (!adSizeParcel.zzazu && !z2) {
                        hashMap.put("format", adSizeParcel.zzazq);
                        z2 = true;
                    }
                    if (adSizeParcel.zzazu && !z) {
                        hashMap.put("fluid", "height");
                        z = true;
                    }
                    if (z2 && z) {
                        break;
                    }
                }
            } else {
                hashMap.put("format", adRequestInfoParcel.zzarm.zzazq);
                if (adRequestInfoParcel.zzarm.zzazu) {
                    hashMap.put("fluid", "height");
                }
            }
            if (adRequestInfoParcel.zzarm.width == -1) {
                hashMap.put("smart_w", "full");
            }
            if (adRequestInfoParcel.zzarm.height == -2) {
                hashMap.put("smart_h", "auto");
            }
            if (adRequestInfoParcel.zzarm.zzazs != null) {
                StringBuilder sb = new StringBuilder();
                boolean z3 = false;
                for (AdSizeParcel adSizeParcel2 : adRequestInfoParcel.zzarm.zzazs) {
                    if (adSizeParcel2.zzazu) {
                        z3 = true;
                    } else {
                        if (sb.length() != 0) {
                            sb.append("|");
                        }
                        sb.append(adSizeParcel2.width == -1 ? (int) (adSizeParcel2.widthPixels / zzjrVar.zzavd) : adSizeParcel2.width);
                        sb.append("x");
                        sb.append(adSizeParcel2.height == -2 ? (int) (adSizeParcel2.heightPixels / zzjrVar.zzavd) : adSizeParcel2.height);
                    }
                }
                if (z3) {
                    if (sb.length() != 0) {
                        sb.insert(0, "|");
                    }
                    sb.insert(0, "320x50");
                }
                hashMap.put("sz", sb);
            }
            if (adRequestInfoParcel.zzcka != 0) {
                hashMap.put("native_version", Integer.valueOf(adRequestInfoParcel.zzcka));
                hashMap.put("native_templates", adRequestInfoParcel.zzase);
                hashMap.put("native_image_orientation", zzc(adRequestInfoParcel.zzasa));
                if (!adRequestInfoParcel.zzckk.isEmpty()) {
                    hashMap.put("native_custom_templates", adRequestInfoParcel.zzckk);
                }
            }
            if (adRequestInfoParcel.zzarm.zzazv) {
                hashMap.put("ene", true);
            }
            hashMap.put("slotname", adRequestInfoParcel.zzarg);
            hashMap.put("pn", adRequestInfoParcel.applicationInfo.packageName);
            if (adRequestInfoParcel.zzcjv != null) {
                hashMap.put("vc", Integer.valueOf(adRequestInfoParcel.zzcjv.versionCode));
            }
            hashMap.put("ms", zzjjVar.zzcjw);
            hashMap.put("seq_num", adRequestInfoParcel.zzcjx);
            hashMap.put("session_id", adRequestInfoParcel.zzcjy);
            hashMap.put("js", adRequestInfoParcel.zzari.zzda);
            zza(hashMap, zzjrVar, zzjjVar.zzcmv, adRequestInfoParcel.zzckx, zzjjVar.zzcmu);
            zza(hashMap, zzjjVar.zzcmw);
            hashMap.put(JsonMarshaller.PLATFORM, Build.MANUFACTURER);
            hashMap.put("submodel", Build.MODEL);
            if (location != null) {
                zza(hashMap, location);
            } else if (adRequestInfoParcel.zzcju.versionCode >= 2 && adRequestInfoParcel.zzcju.zzayt != null) {
                zza(hashMap, adRequestInfoParcel.zzcju.zzayt);
            }
            if (adRequestInfoParcel.versionCode >= 2) {
                hashMap.put("quality_signals", adRequestInfoParcel.zzcjz);
            }
            if (adRequestInfoParcel.versionCode >= 4 && adRequestInfoParcel.zzckc) {
                hashMap.put("forceHttps", Boolean.valueOf(adRequestInfoParcel.zzckc));
            }
            if (bundle != null) {
                hashMap.put("content_info", bundle);
            }
            if (adRequestInfoParcel.versionCode >= 5) {
                hashMap.put("u_sd", Float.valueOf(adRequestInfoParcel.zzavd));
                hashMap.put("sh", Integer.valueOf(adRequestInfoParcel.zzckf));
                hashMap.put("sw", Integer.valueOf(adRequestInfoParcel.zzcke));
            } else {
                hashMap.put("u_sd", Float.valueOf(zzjrVar.zzavd));
                hashMap.put("sh", Integer.valueOf(zzjrVar.zzckf));
                hashMap.put("sw", Integer.valueOf(zzjrVar.zzcke));
            }
            if (adRequestInfoParcel.versionCode >= 6) {
                if (!TextUtils.isEmpty(adRequestInfoParcel.zzckg)) {
                    try {
                        hashMap.put("view_hierarchy", new JSONObject(adRequestInfoParcel.zzckg));
                    } catch (JSONException e) {
                        zzkx.zzc("Problem serializing view hierarchy to JSON", e);
                    }
                }
                hashMap.put("correlation_id", Long.valueOf(adRequestInfoParcel.zzckh));
            }
            if (adRequestInfoParcel.versionCode >= 7) {
                hashMap.put("request_id", adRequestInfoParcel.zzcki);
            }
            if (adRequestInfoParcel.versionCode >= 11 && adRequestInfoParcel.zzckm != null) {
                hashMap.put("capability", adRequestInfoParcel.zzckm.toBundle());
            }
            if (adRequestInfoParcel.versionCode >= 12 && !TextUtils.isEmpty(adRequestInfoParcel.zzckn)) {
                hashMap.put("anchor", adRequestInfoParcel.zzckn);
            }
            if (adRequestInfoParcel.versionCode >= 13) {
                hashMap.put("android_app_volume", Float.valueOf(adRequestInfoParcel.zzcko));
            }
            if (adRequestInfoParcel.versionCode >= 18) {
                hashMap.put("android_app_muted", Boolean.valueOf(adRequestInfoParcel.zzcku));
            }
            if (adRequestInfoParcel.versionCode >= 14 && adRequestInfoParcel.zzckp > 0) {
                hashMap.put("target_api", Integer.valueOf(adRequestInfoParcel.zzckp));
            }
            if (adRequestInfoParcel.versionCode >= 15) {
                hashMap.put("scroll_index", Integer.valueOf(adRequestInfoParcel.zzckq == -1 ? -1 : adRequestInfoParcel.zzckq));
            }
            if (adRequestInfoParcel.versionCode >= 16) {
                hashMap.put("_activity_context", Boolean.valueOf(adRequestInfoParcel.zzckr));
            }
            if (adRequestInfoParcel.versionCode >= 18) {
                if (!TextUtils.isEmpty(adRequestInfoParcel.zzckv)) {
                    try {
                        hashMap.put("app_settings", new JSONObject(adRequestInfoParcel.zzckv));
                    } catch (JSONException e2) {
                        zzkx.zzc("Problem creating json from app settings", e2);
                    }
                }
                hashMap.put("render_in_browser", Boolean.valueOf(adRequestInfoParcel.zzbvo));
            }
            if (adRequestInfoParcel.versionCode >= 18) {
                hashMap.put("android_num_video_cache_tasks", Integer.valueOf(adRequestInfoParcel.zzckw));
            }
            zza(hashMap);
            hashMap.put("cache_state", jSONObject);
            if (adRequestInfoParcel.versionCode >= 19) {
                hashMap.put("gct", adRequestInfoParcel.zzcky);
            }
            if (zzkx.zzbi(2)) {
                String valueOf = String.valueOf(com.google.android.gms.ads.internal.zzu.zzgm().zzap(hashMap).toString(2));
                zzkx.v(valueOf.length() != 0 ? "Ad Request JSON: ".concat(valueOf) : new String("Ad Request JSON: "));
            }
            return com.google.android.gms.ads.internal.zzu.zzgm().zzap(hashMap);
        } catch (JSONException e3) {
            String valueOf2 = String.valueOf(e3.getMessage());
            zzkx.zzdi(valueOf2.length() != 0 ? "Problem serializing ad request to JSON: ".concat(valueOf2) : new String("Problem serializing ad request to JSON: "));
            return null;
        }
    }

    private static void zza(HashMap<String, Object> hashMap) {
        Bundle bundle = new Bundle();
        Bundle bundle2 = new Bundle();
        bundle2.putString("cl", "135396225");
        bundle2.putString("rapid_rc", "dev");
        bundle2.putString("rapid_rollup", HttpRequest.METHOD_HEAD);
        bundle.putBundle("build_meta", bundle2);
        bundle.putString("mf", Boolean.toString(zzdr.zzbiv.get().booleanValue()));
        hashMap.put("sdk_env", bundle);
    }

    private static void zza(HashMap<String, Object> hashMap, Location location) {
        HashMap hashMap2 = new HashMap();
        Float valueOf = Float.valueOf(location.getAccuracy() * 1000.0f);
        Long valueOf2 = Long.valueOf(location.getTime() * 1000);
        Long valueOf3 = Long.valueOf((long) (location.getLatitude() * 1.0E7d));
        Long valueOf4 = Long.valueOf((long) (location.getLongitude() * 1.0E7d));
        hashMap2.put("radius", valueOf);
        hashMap2.put("lat", valueOf3);
        hashMap2.put("long", valueOf4);
        hashMap2.put("time", valueOf2);
        hashMap.put("uule", hashMap2);
    }

    private static void zza(HashMap<String, Object> hashMap, AdRequestParcel adRequestParcel) {
        String zzvl = zzkv.zzvl();
        if (zzvl != null) {
            hashMap.put("abf", zzvl);
        }
        if (adRequestParcel.zzayl != -1) {
            hashMap.put("cust_age", zzcny.format(new Date(adRequestParcel.zzayl)));
        }
        if (adRequestParcel.extras != null) {
            hashMap.put("extras", adRequestParcel.extras);
        }
        if (adRequestParcel.zzaym != -1) {
            hashMap.put("cust_gender", Integer.valueOf(adRequestParcel.zzaym));
        }
        if (adRequestParcel.zzayn != null) {
            hashMap.put("kw", adRequestParcel.zzayn);
        }
        if (adRequestParcel.zzayp != -1) {
            hashMap.put("tag_for_child_directed_treatment", Integer.valueOf(adRequestParcel.zzayp));
        }
        if (adRequestParcel.zzayo) {
            hashMap.put("adtest", "on");
        }
        if (adRequestParcel.versionCode >= 2) {
            if (adRequestParcel.zzayq) {
                hashMap.put("d_imp_hdr", 1);
            }
            if (!TextUtils.isEmpty(adRequestParcel.zzayr)) {
                hashMap.put("ppid", adRequestParcel.zzayr);
            }
            if (adRequestParcel.zzays != null) {
                zza(hashMap, adRequestParcel.zzays);
            }
        }
        if (adRequestParcel.versionCode >= 3 && adRequestParcel.zzayu != null) {
            hashMap.put("url", adRequestParcel.zzayu);
        }
        if (adRequestParcel.versionCode >= 5) {
            if (adRequestParcel.zzayw != null) {
                hashMap.put("custom_targeting", adRequestParcel.zzayw);
            }
            if (adRequestParcel.zzayx != null) {
                hashMap.put("category_exclusions", adRequestParcel.zzayx);
            }
            if (adRequestParcel.zzayy != null) {
                hashMap.put("request_agent", adRequestParcel.zzayy);
            }
        }
        if (adRequestParcel.versionCode >= 6 && adRequestParcel.zzayz != null) {
            hashMap.put("request_pkg", adRequestParcel.zzayz);
        }
        if (adRequestParcel.versionCode >= 7) {
            hashMap.put("is_designed_for_families", Boolean.valueOf(adRequestParcel.zzaza));
        }
    }

    private static void zza(HashMap<String, Object> hashMap, SearchAdRequestParcel searchAdRequestParcel) {
        String str;
        String str2 = null;
        if (Color.alpha(searchAdRequestParcel.zzbbx) != 0) {
            hashMap.put("acolor", zzaz(searchAdRequestParcel.zzbbx));
        }
        if (Color.alpha(searchAdRequestParcel.backgroundColor) != 0) {
            hashMap.put("bgcolor", zzaz(searchAdRequestParcel.backgroundColor));
        }
        if (Color.alpha(searchAdRequestParcel.zzbby) != 0 && Color.alpha(searchAdRequestParcel.zzbbz) != 0) {
            hashMap.put("gradientto", zzaz(searchAdRequestParcel.zzbby));
            hashMap.put("gradientfrom", zzaz(searchAdRequestParcel.zzbbz));
        }
        if (Color.alpha(searchAdRequestParcel.zzbca) != 0) {
            hashMap.put("bcolor", zzaz(searchAdRequestParcel.zzbca));
        }
        hashMap.put("bthick", Integer.toString(searchAdRequestParcel.zzbcb));
        switch (searchAdRequestParcel.zzbcc) {
            case 0:
                str = SchedulerSupport.NONE;
                break;
            case 1:
                str = "dashed";
                break;
            case 2:
                str = "dotted";
                break;
            case 3:
                str = "solid";
                break;
            default:
                str = null;
                break;
        }
        if (str != null) {
            hashMap.put("btype", str);
        }
        switch (searchAdRequestParcel.zzbcd) {
            case 0:
                str2 = "light";
                break;
            case 1:
                str2 = "medium";
                break;
            case 2:
                str2 = "dark";
                break;
        }
        if (str2 != null) {
            hashMap.put("callbuttoncolor", str2);
        }
        if (searchAdRequestParcel.zzbce != null) {
            hashMap.put("channel", searchAdRequestParcel.zzbce);
        }
        if (Color.alpha(searchAdRequestParcel.zzbcf) != 0) {
            hashMap.put("dcolor", zzaz(searchAdRequestParcel.zzbcf));
        }
        if (searchAdRequestParcel.zzbcg != null) {
            hashMap.put("font", searchAdRequestParcel.zzbcg);
        }
        if (Color.alpha(searchAdRequestParcel.zzbch) != 0) {
            hashMap.put("hcolor", zzaz(searchAdRequestParcel.zzbch));
        }
        hashMap.put("headersize", Integer.toString(searchAdRequestParcel.zzbci));
        if (searchAdRequestParcel.zzbcj != null) {
            hashMap.put("q", searchAdRequestParcel.zzbcj);
        }
    }

    private static void zza(HashMap<String, Object> hashMap, zzjr zzjrVar, zzjv.zza zzaVar, Bundle bundle, Bundle bundle2) {
        hashMap.put("am", Integer.valueOf(zzjrVar.zzcps));
        hashMap.put("cog", zzac(zzjrVar.zzcpt));
        hashMap.put("coh", zzac(zzjrVar.zzcpu));
        if (!TextUtils.isEmpty(zzjrVar.zzcpv)) {
            hashMap.put("carrier", zzjrVar.zzcpv);
        }
        hashMap.put("gl", zzjrVar.zzcpw);
        if (zzjrVar.zzcpx) {
            hashMap.put("simulator", 1);
        }
        if (zzjrVar.zzcpy) {
            hashMap.put("is_sidewinder", 1);
        }
        hashMap.put("ma", zzac(zzjrVar.zzcpz));
        hashMap.put("sp", zzac(zzjrVar.zzcqa));
        hashMap.put("hl", zzjrVar.zzcqb);
        if (!TextUtils.isEmpty(zzjrVar.zzcqc)) {
            hashMap.put("mv", zzjrVar.zzcqc);
        }
        hashMap.put("muv", Integer.valueOf(zzjrVar.zzcqd));
        if (zzjrVar.zzcqe != -2) {
            hashMap.put("cnt", Integer.valueOf(zzjrVar.zzcqe));
        }
        hashMap.put("gnt", Integer.valueOf(zzjrVar.zzcqf));
        hashMap.put("pt", Integer.valueOf(zzjrVar.zzcqg));
        hashMap.put("rm", Integer.valueOf(zzjrVar.zzcqh));
        hashMap.put("riv", Integer.valueOf(zzjrVar.zzcqi));
        Bundle bundle3 = new Bundle();
        bundle3.putString("build", zzjrVar.zzcqn);
        Bundle bundle4 = new Bundle();
        bundle4.putBoolean("is_charging", zzjrVar.zzcqk);
        bundle4.putDouble("battery_level", zzjrVar.zzcqj);
        bundle3.putBundle("battery", bundle4);
        Bundle bundle5 = new Bundle();
        bundle5.putInt("active_network_state", zzjrVar.zzcqm);
        bundle5.putBoolean("active_network_metered", zzjrVar.zzcql);
        if (zzaVar != null) {
            Bundle bundle6 = new Bundle();
            bundle6.putInt("predicted_latency_micros", zzaVar.zzcqt);
            bundle6.putLong("predicted_down_throughput_bps", zzaVar.zzcqu);
            bundle6.putLong("predicted_up_throughput_bps", zzaVar.zzcqv);
            bundle5.putBundle("predictions", bundle6);
        }
        bundle3.putBundle("network", bundle5);
        Bundle bundle7 = new Bundle();
        bundle7.putBoolean("is_browser_custom_tabs_capable", zzjrVar.zzcqo);
        bundle3.putBundle("browser", bundle7);
        if (bundle != null) {
            bundle3.putBundle("android_mem_info", zzg(bundle));
        }
        Bundle bundle8 = new Bundle();
        bundle8.putBundle("parental_controls", bundle2);
        bundle3.putBundle("play_store", bundle8);
        hashMap.put("device", bundle3);
    }

    private static void zza(HashMap<String, Object> hashMap, String str) {
        Bundle bundle = new Bundle();
        bundle.putString("doritos", str);
        hashMap.put("pii", bundle);
    }

    private static Integer zzac(boolean z) {
        return Integer.valueOf(z ? 1 : 0);
    }

    private static String zzaz(int i) {
        return String.format(Locale.US, "#%06x", Integer.valueOf(16777215 & i));
    }

    private static String zzc(NativeAdOptionsParcel nativeAdOptionsParcel) {
        switch (nativeAdOptionsParcel != null ? nativeAdOptionsParcel.zzbok : 0) {
            case 1:
                return "portrait";
            case 2:
                return "landscape";
            default:
                return "any";
        }
    }

    public static JSONObject zzc(AdResponseParcel adResponseParcel) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        if (adResponseParcel.zzcbo != null) {
            jSONObject.put("ad_base_url", adResponseParcel.zzcbo);
        }
        if (adResponseParcel.zzcle != null) {
            jSONObject.put("ad_size", adResponseParcel.zzcle);
        }
        jSONObject.put(AnalyticsEvents.PARAMETER_SHARE_DIALOG_SHOW_NATIVE, adResponseParcel.zzazt);
        if (adResponseParcel.zzazt) {
            jSONObject.put("ad_json", adResponseParcel.body);
        } else {
            jSONObject.put("ad_html", adResponseParcel.body);
        }
        if (adResponseParcel.zzclg != null) {
            jSONObject.put("debug_dialog", adResponseParcel.zzclg);
        }
        if (adResponseParcel.zzclx != null) {
            jSONObject.put("debug_signals", adResponseParcel.zzclx);
        }
        if (adResponseParcel.zzcla != -1) {
            jSONObject.put("interstitial_timeout", adResponseParcel.zzcla / 1000.0d);
        }
        if (adResponseParcel.orientation == com.google.android.gms.ads.internal.zzu.zzgo().zzvx()) {
            jSONObject.put(FragmentWrapperActivity.ORIENTATION_KEY, "portrait");
        } else if (adResponseParcel.orientation == com.google.android.gms.ads.internal.zzu.zzgo().zzvw()) {
            jSONObject.put(FragmentWrapperActivity.ORIENTATION_KEY, "landscape");
        }
        if (adResponseParcel.zzbvk != null) {
            jSONObject.put("click_urls", zzl(adResponseParcel.zzbvk));
        }
        if (adResponseParcel.zzbvl != null) {
            jSONObject.put("impression_urls", zzl(adResponseParcel.zzbvl));
        }
        if (adResponseParcel.zzcld != null) {
            jSONObject.put("manual_impression_urls", zzl(adResponseParcel.zzcld));
        }
        if (adResponseParcel.zzclj != null) {
            jSONObject.put("active_view", adResponseParcel.zzclj);
        }
        jSONObject.put("ad_is_javascript", adResponseParcel.zzclh);
        if (adResponseParcel.zzcli != null) {
            jSONObject.put("ad_passback_url", adResponseParcel.zzcli);
        }
        jSONObject.put("mediation", adResponseParcel.zzclb);
        jSONObject.put("custom_render_allowed", adResponseParcel.zzclk);
        jSONObject.put("content_url_opted_out", adResponseParcel.zzcll);
        jSONObject.put("content_vertical_opted_out", adResponseParcel.zzcly);
        jSONObject.put("prefetch", adResponseParcel.zzclm);
        if (adResponseParcel.zzbvq != -1) {
            jSONObject.put("refresh_interval_milliseconds", adResponseParcel.zzbvq);
        }
        if (adResponseParcel.zzclc != -1) {
            jSONObject.put("mediation_config_cache_time_milliseconds", adResponseParcel.zzclc);
        }
        if (!TextUtils.isEmpty(adResponseParcel.zzclp)) {
            jSONObject.put("gws_query_id", adResponseParcel.zzclp);
        }
        jSONObject.put("fluid", adResponseParcel.zzazu ? "height" : "");
        jSONObject.put("native_express", adResponseParcel.zzazv);
        if (adResponseParcel.zzclr != null) {
            jSONObject.put("video_start_urls", zzl(adResponseParcel.zzclr));
        }
        if (adResponseParcel.zzcls != null) {
            jSONObject.put("video_complete_urls", zzl(adResponseParcel.zzcls));
        }
        if (adResponseParcel.zzclq != null) {
            jSONObject.put("rewards", adResponseParcel.zzclq.zzue());
        }
        jSONObject.put("use_displayed_impression", adResponseParcel.zzclt);
        jSONObject.put("auto_protection_configuration", adResponseParcel.zzclu);
        jSONObject.put("render_in_browser", adResponseParcel.zzbvo);
        return jSONObject;
    }

    private static Bundle zzg(Bundle bundle) {
        Bundle bundle2 = new Bundle();
        bundle2.putString("runtime_free", Long.toString(bundle.getLong("runtime_free_memory", -1L)));
        bundle2.putString("runtime_max", Long.toString(bundle.getLong("runtime_max_memory", -1L)));
        bundle2.putString("runtime_total", Long.toString(bundle.getLong("runtime_total_memory", -1L)));
        Debug.MemoryInfo memoryInfo = (Debug.MemoryInfo) bundle.getParcelable("debug_memory_info");
        if (memoryInfo != null) {
            bundle2.putString("debug_info_dalvik_private_dirty", Integer.toString(memoryInfo.dalvikPrivateDirty));
            bundle2.putString("debug_info_dalvik_pss", Integer.toString(memoryInfo.dalvikPss));
            bundle2.putString("debug_info_dalvik_shared_dirty", Integer.toString(memoryInfo.dalvikSharedDirty));
            bundle2.putString("debug_info_native_private_dirty", Integer.toString(memoryInfo.nativePrivateDirty));
            bundle2.putString("debug_info_native_pss", Integer.toString(memoryInfo.nativePss));
            bundle2.putString("debug_info_native_shared_dirty", Integer.toString(memoryInfo.nativeSharedDirty));
            bundle2.putString("debug_info_other_private_dirty", Integer.toString(memoryInfo.otherPrivateDirty));
            bundle2.putString("debug_info_other_pss", Integer.toString(memoryInfo.otherPss));
            bundle2.putString("debug_info_other_shared_dirty", Integer.toString(memoryInfo.otherSharedDirty));
        }
        return bundle2;
    }

    @Nullable
    static JSONArray zzl(List<String> list) throws JSONException {
        JSONArray jSONArray = new JSONArray();
        for (String str : list) {
            jSONArray.put(str);
        }
        return jSONArray;
    }
}
