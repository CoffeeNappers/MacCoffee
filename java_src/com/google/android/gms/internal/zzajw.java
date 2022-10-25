package com.google.android.gms.internal;

import com.google.android.gms.internal.zzajy;
import com.google.android.gms.internal.zzama;
import io.sentry.marshaller.json.JsonMarshaller;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzajw {
    public static zzajh zza(zzajh zzajhVar, Map<String, Object> map) {
        zzajh zzcue = zzajh.zzcue();
        Iterator<Map.Entry<zzajq, zzaml>> it = zzajhVar.iterator();
        while (true) {
            zzajh zzajhVar2 = zzcue;
            if (it.hasNext()) {
                Map.Entry<zzajq, zzaml> next = it.next();
                zzcue = zzajhVar2.zze(next.getKey(), zza(next.getValue(), map));
            } else {
                return zzajhVar2;
            }
        }
    }

    public static zzajy zza(zzajy zzajyVar, final Map<String, Object> map) {
        final zzajy zzajyVar2 = new zzajy();
        zzajyVar.zza(new zzajq(""), new zzajy.zzb() { // from class: com.google.android.gms.internal.zzajw.1
            @Override // com.google.android.gms.internal.zzajy.zzb
            public void zzf(zzajq zzajqVar, zzaml zzamlVar) {
                zzajy.this.zzh(zzajqVar, zzajw.zza(zzamlVar, (Map<String, Object>) map));
            }
        });
        return zzajyVar2;
    }

    public static zzaml zza(zzaml zzamlVar, final Map<String, Object> map) {
        Object value = zzamlVar.zzczf().getValue();
        if (value instanceof Map) {
            Map map2 = (Map) value;
            if (map2.containsKey(".sv")) {
                value = map.get((String) map2.get(".sv"));
            }
        }
        zzaml zzbu = zzamp.zzbu(value);
        if (zzamlVar.zzcze()) {
            Object zza = zza(zzamlVar.getValue(), map);
            return (!zza.equals(zzamlVar.getValue()) || !zzbu.equals(zzamlVar.zzczf())) ? zzamm.zza(zza, zzbu) : zzamlVar;
        } else if (zzamlVar.isEmpty()) {
            return zzamlVar;
        } else {
            zzama zzamaVar = (zzama) zzamlVar;
            final zzajx zzajxVar = new zzajx(zzamaVar);
            zzamaVar.zza(new zzama.zza() { // from class: com.google.android.gms.internal.zzajw.2
                @Override // com.google.android.gms.internal.zzama.zza
                public void zzb(zzalz zzalzVar, zzaml zzamlVar2) {
                    zzaml zza2 = zzajw.zza(zzamlVar2, (Map<String, Object>) map);
                    if (zza2 != zzamlVar2) {
                        zzajxVar.zzg(new zzajq(zzalzVar.asString()), zza2);
                    }
                }
            });
            return !zzajxVar.zzcvw().zzczf().equals(zzbu) ? zzajxVar.zzcvw().zzg(zzbu) : zzajxVar.zzcvw();
        }
    }

    public static Object zza(Object obj, Map<String, Object> map) {
        if (obj instanceof Map) {
            Map map2 = (Map) obj;
            if (!map2.containsKey(".sv")) {
                return obj;
            }
            String str = (String) map2.get(".sv");
            return map.containsKey(str) ? map.get(str) : obj;
        }
        return obj;
    }

    public static Map<String, Object> zza(zzanf zzanfVar) {
        HashMap hashMap = new HashMap();
        hashMap.put(JsonMarshaller.TIMESTAMP, Long.valueOf(zzanfVar.z()));
        return hashMap;
    }
}
