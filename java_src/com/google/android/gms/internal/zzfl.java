package com.google.android.gms.internal;

import android.app.ActivityManager;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.common.util.UriUtil;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.google.android.gms.ads.internal.overlay.AdLauncherIntentInfoParcel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
@zzji
/* loaded from: classes.dex */
public final class zzfl implements zzfe {
    private final com.google.android.gms.ads.internal.zze zzbqt;
    private final zzhq zzbqu;
    private final zzfg zzbqw;

    /* loaded from: classes2.dex */
    public static class zza {
        private final zzmd zzbnz;

        public zza(zzmd zzmdVar) {
            this.zzbnz = zzmdVar;
        }

        public Intent zza(Context context, Map<String, String> map) {
            List<ActivityManager.RunningAppProcessInfo> runningAppProcesses;
            ResolveInfo zza;
            ActivityManager activityManager = (ActivityManager) context.getSystemService("activity");
            String str = map.get("u");
            if (TextUtils.isEmpty(str)) {
                return null;
            }
            if (this.zzbnz != null) {
                str = com.google.android.gms.ads.internal.zzu.zzgm().zza(this.zzbnz, str);
            }
            Uri parse = Uri.parse(str);
            boolean parseBoolean = Boolean.parseBoolean(map.get("use_first_package"));
            boolean parseBoolean2 = Boolean.parseBoolean(map.get("use_running_process"));
            Uri build = UriUtil.HTTP_SCHEME.equalsIgnoreCase(parse.getScheme()) ? parse.buildUpon().scheme(UriUtil.HTTPS_SCHEME).build() : UriUtil.HTTPS_SCHEME.equalsIgnoreCase(parse.getScheme()) ? parse.buildUpon().scheme(UriUtil.HTTP_SCHEME).build() : null;
            ArrayList<ResolveInfo> arrayList = new ArrayList<>();
            Intent zzf = zzf(parse);
            Intent zzf2 = zzf(build);
            ResolveInfo zza2 = zza(context, zzf, arrayList);
            if (zza2 != null) {
                return zza(zzf, zza2);
            }
            if (zzf2 != null && (zza = zza(context, zzf2)) != null) {
                Intent zza3 = zza(zzf, zza);
                if (zza(context, zza3) != null) {
                    return zza3;
                }
            }
            if (arrayList.size() == 0) {
                return zzf;
            }
            if (parseBoolean2 && activityManager != null && (runningAppProcesses = activityManager.getRunningAppProcesses()) != null) {
                Iterator<ResolveInfo> it = arrayList.iterator();
                while (it.hasNext()) {
                    ResolveInfo next = it.next();
                    for (ActivityManager.RunningAppProcessInfo runningAppProcessInfo : runningAppProcesses) {
                        if (runningAppProcessInfo.processName.equals(next.activityInfo.packageName)) {
                            return zza(zzf, next);
                        }
                    }
                }
            }
            return parseBoolean ? zza(zzf, arrayList.get(0)) : zzf;
        }

        public Intent zza(Intent intent, ResolveInfo resolveInfo) {
            Intent intent2 = new Intent(intent);
            intent2.setClassName(resolveInfo.activityInfo.packageName, resolveInfo.activityInfo.name);
            return intent2;
        }

        public ResolveInfo zza(Context context, Intent intent) {
            return zza(context, intent, new ArrayList<>());
        }

        public ResolveInfo zza(Context context, Intent intent, ArrayList<ResolveInfo> arrayList) {
            ResolveInfo resolveInfo;
            PackageManager packageManager = context.getPackageManager();
            if (packageManager == null) {
                return null;
            }
            List<ResolveInfo> queryIntentActivities = packageManager.queryIntentActivities(intent, 65536);
            ResolveInfo resolveActivity = packageManager.resolveActivity(intent, 65536);
            if (queryIntentActivities != null && resolveActivity != null) {
                int i = 0;
                while (true) {
                    int i2 = i;
                    if (i2 >= queryIntentActivities.size()) {
                        break;
                    }
                    ResolveInfo resolveInfo2 = queryIntentActivities.get(i2);
                    if (resolveActivity != null && resolveActivity.activityInfo.name.equals(resolveInfo2.activityInfo.name)) {
                        resolveInfo = resolveActivity;
                        break;
                    }
                    i = i2 + 1;
                }
            }
            resolveInfo = null;
            arrayList.addAll(queryIntentActivities);
            return resolveInfo;
        }

        public Intent zzf(Uri uri) {
            if (uri == null) {
                return null;
            }
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.addFlags(268435456);
            intent.setData(uri);
            intent.setAction("android.intent.action.VIEW");
            return intent;
        }
    }

    public zzfl(zzfg zzfgVar, com.google.android.gms.ads.internal.zze zzeVar, zzhq zzhqVar) {
        this.zzbqw = zzfgVar;
        this.zzbqt = zzeVar;
        this.zzbqu = zzhqVar;
    }

    private static boolean zzd(Map<String, String> map) {
        return AppEventsConstants.EVENT_PARAM_VALUE_YES.equals(map.get("custom_close"));
    }

    private static int zze(Map<String, String> map) {
        String str = map.get("o");
        if (str != null) {
            if (TtmlNode.TAG_P.equalsIgnoreCase(str)) {
                return com.google.android.gms.ads.internal.zzu.zzgo().zzvx();
            }
            if ("l".equalsIgnoreCase(str)) {
                return com.google.android.gms.ads.internal.zzu.zzgo().zzvw();
            }
            if ("c".equalsIgnoreCase(str)) {
                return com.google.android.gms.ads.internal.zzu.zzgo().zzvy();
            }
        }
        return -1;
    }

    private static void zzf(zzmd zzmdVar, Map<String, String> map) {
        Context context = zzmdVar.getContext();
        if (TextUtils.isEmpty(map.get("u"))) {
            zzkx.zzdi("Destination url cannot be empty.");
            return;
        }
        try {
            zzmdVar.zzxc().zza(new AdLauncherIntentInfoParcel(new zza(zzmdVar).zza(context, map)));
        } catch (ActivityNotFoundException e) {
            zzkx.zzdi(e.getMessage());
        }
    }

    private void zzs(boolean z) {
        if (this.zzbqu != null) {
            this.zzbqu.zzt(z);
        }
    }

    @Override // com.google.android.gms.internal.zzfe
    public void zza(zzmd zzmdVar, Map<String, String> map) {
        String str = map.get("a");
        if (str == null) {
            zzkx.zzdi("Action missing from an open GMSG.");
        } else if (this.zzbqt != null && !this.zzbqt.zzfe()) {
            this.zzbqt.zzy(map.get("u"));
        } else {
            zzme zzxc = zzmdVar.zzxc();
            if ("expand".equalsIgnoreCase(str)) {
                if (zzmdVar.zzxg()) {
                    zzkx.zzdi("Cannot expand WebView that is already expanded.");
                    return;
                }
                zzs(false);
                zzxc.zza(zzd(map), zze(map));
            } else if ("webapp".equalsIgnoreCase(str)) {
                String str2 = map.get("u");
                zzs(false);
                if (str2 != null) {
                    zzxc.zza(zzd(map), zze(map), str2);
                } else {
                    zzxc.zza(zzd(map), zze(map), map.get("html"), map.get("baseurl"));
                }
            } else if (!"in_app_purchase".equalsIgnoreCase(str)) {
                if ("app".equalsIgnoreCase(str) && "true".equalsIgnoreCase(map.get("system_browser"))) {
                    zzs(true);
                    zzf(zzmdVar, map);
                    return;
                }
                zzs(true);
                String str3 = map.get("u");
                zzxc.zza(new AdLauncherIntentInfoParcel(map.get("i"), !TextUtils.isEmpty(str3) ? com.google.android.gms.ads.internal.zzu.zzgm().zza(zzmdVar, str3) : str3, map.get("m"), map.get(TtmlNode.TAG_P), map.get("c"), map.get("f"), map.get("e")));
            } else {
                String str4 = map.get("product_id");
                String str5 = map.get("report_urls");
                if (this.zzbqw == null) {
                    return;
                }
                if (str5 == null || str5.isEmpty()) {
                    this.zzbqw.zza(str4, new ArrayList<>());
                } else {
                    this.zzbqw.zza(str4, new ArrayList<>(Arrays.asList(str5.split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR))));
                }
            }
        }
    }
}
