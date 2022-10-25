package com.google.android.gms.internal;

import android.accounts.Account;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import com.google.android.gms.appdatasearch.DocumentContents;
import com.google.android.gms.appdatasearch.DocumentSection;
import com.google.android.gms.appdatasearch.RegisterSectionInfo;
import com.google.android.gms.appdatasearch.UsageInfo;
import com.google.android.gms.appindexing.Action;
import com.google.android.gms.internal.zzvw;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class zznj {
    public static DocumentSection zza(String str, zzvw.zzc zzcVar) {
        return new DocumentSection(zzasa.zzf(zzcVar), new RegisterSectionInfo.zza(str).zzaz(true).zzfs(str).zzfr("blob").zzahr());
    }

    public static UsageInfo zza(Action action, long j, String str, int i) {
        int i2;
        boolean z = false;
        Bundle bundle = new Bundle();
        bundle.putAll(action.zzahu());
        Bundle bundle2 = bundle.getBundle("object");
        Uri parse = bundle2.containsKey("id") ? Uri.parse(bundle2.getString("id")) : null;
        String string = bundle2.getString("name");
        String string2 = bundle2.getString(ServerKeys.TYPE);
        Intent zza = zznk.zza(str, Uri.parse(bundle2.getString("url")));
        DocumentContents.zza zza2 = UsageInfo.zza(zza, string, parse, string2, null);
        if (bundle.containsKey(".private:ssbContext")) {
            zza2.zza(DocumentSection.zzl(bundle.getByteArray(".private:ssbContext")));
            bundle.remove(".private:ssbContext");
        }
        if (bundle.containsKey(".private:accountName")) {
            zza2.zzb(new Account(bundle.getString(".private:accountName"), "com.google"));
            bundle.remove(".private:accountName");
        }
        if (!bundle.containsKey(".private:isContextOnly") || !bundle.getBoolean(".private:isContextOnly")) {
            i2 = 0;
        } else {
            i2 = 4;
            bundle.remove(".private:isContextOnly");
        }
        if (bundle.containsKey(".private:isDeviceOnly")) {
            z = bundle.getBoolean(".private:isDeviceOnly", false);
            bundle.remove(".private:isDeviceOnly");
        }
        zza2.zza(zza(".private:action", zzj(bundle)));
        return new UsageInfo.zza().zza(UsageInfo.zza(str, zza)).zzaa(j).zzcq(i2).zza(zza2.zzaho()).zzbb(z).zzcr(i).zzahs();
    }

    private static zzvw.zzb zzb(String str, Bundle bundle) {
        zzvw.zzb zzbVar = new zzvw.zzb();
        zzbVar.name = str;
        zzbVar.ahG = new zzvw.zzd();
        zzbVar.ahG.ahL = zzj(bundle);
        return zzbVar;
    }

    private static zzvw.zzb zzh(String str, boolean z) {
        zzvw.zzb zzbVar = new zzvw.zzb();
        zzbVar.name = str;
        zzbVar.ahG = new zzvw.zzd();
        zzbVar.ahG.ahI = z;
        return zzbVar;
    }

    public static zzvw.zzc zzj(Bundle bundle) {
        String[] strArr;
        Bundle[] bundleArr;
        ArrayList arrayList = new ArrayList();
        for (String str : bundle.keySet()) {
            Object obj = bundle.get(str);
            if (obj instanceof String) {
                arrayList.add(zzu(str, (String) obj));
            } else if (obj instanceof Bundle) {
                arrayList.add(zzb(str, (Bundle) obj));
            } else if (obj instanceof String[]) {
                for (String str2 : (String[]) obj) {
                    if (str2 != null) {
                        arrayList.add(zzu(str, str2));
                    }
                }
            } else if (obj instanceof Bundle[]) {
                for (Bundle bundle2 : (Bundle[]) obj) {
                    if (bundle2 != null) {
                        arrayList.add(zzb(str, bundle2));
                    }
                }
            } else if (obj instanceof Boolean) {
                arrayList.add(zzh(str, ((Boolean) obj).booleanValue()));
            } else {
                String valueOf = String.valueOf(obj);
                Log.e("SearchIndex", new StringBuilder(String.valueOf(valueOf).length() + 19).append("Unsupported value: ").append(valueOf).toString());
            }
        }
        zzvw.zzc zzcVar = new zzvw.zzc();
        if (bundle.containsKey(ServerKeys.TYPE)) {
            zzcVar.type = bundle.getString(ServerKeys.TYPE);
        }
        zzcVar.ahH = (zzvw.zzb[]) arrayList.toArray(new zzvw.zzb[arrayList.size()]);
        return zzcVar;
    }

    private static zzvw.zzb zzu(String str, String str2) {
        zzvw.zzb zzbVar = new zzvw.zzb();
        zzbVar.name = str;
        zzbVar.ahG = new zzvw.zzd();
        zzbVar.ahG.Fe = str2;
        return zzbVar;
    }
}
