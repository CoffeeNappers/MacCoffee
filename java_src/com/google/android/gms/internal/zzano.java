package com.google.android.gms.internal;

import com.google.firebase.database.DatabaseException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.regex.Pattern;
/* loaded from: classes2.dex */
public class zzano {
    private static final Pattern bkm = Pattern.compile("[\\[\\]\\.#$]");
    private static final Pattern bkn = Pattern.compile("[\\[\\]\\.#\\$\\/\\u0000-\\u001F\\u007F]");

    private static boolean zzap(zzajq zzajqVar) {
        zzalz zzcvj = zzajqVar.zzcvj();
        return zzcvj == null || !zzcvj.asString().startsWith(".");
    }

    public static void zzaq(zzajq zzajqVar) throws DatabaseException {
        if (!zzap(zzajqVar)) {
            String valueOf = String.valueOf(zzajqVar.toString());
            throw new DatabaseException(valueOf.length() != 0 ? "Invalid write location: ".concat(valueOf) : new String("Invalid write location: "));
        }
    }

    public static void zzbx(Object obj) {
        if (!(obj instanceof Map)) {
            if (!(obj instanceof List)) {
                return;
            }
            for (Object obj2 : (List) obj) {
                zzbx(obj2);
            }
            return;
        }
        Map map = (Map) obj;
        if (map.containsKey(".sv")) {
            return;
        }
        for (Map.Entry entry : map.entrySet()) {
            zztn((String) entry.getKey());
            zzbx(entry.getValue());
        }
    }

    public static Map<zzajq, zzaml> zzc(zzajq zzajqVar, Map<String, Object> map) throws DatabaseException {
        TreeMap treeMap = new TreeMap();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            zzajq zzajqVar2 = new zzajq(entry.getKey());
            Object value = entry.getValue();
            zzakf.zza(zzajqVar.zzh(zzajqVar2), value);
            String asString = !zzajqVar2.isEmpty() ? zzajqVar2.zzcvm().asString() : "";
            if (asString.equals(".sv") || asString.equals(".value")) {
                String valueOf = String.valueOf(zzajqVar2);
                throw new DatabaseException(new StringBuilder(String.valueOf(valueOf).length() + 40 + String.valueOf(asString).length()).append("Path '").append(valueOf).append("' contains disallowed child name: ").append(asString).toString());
            } else if (asString.equals(".priority") && !zzamp.zzq(zzamm.zzbt(value))) {
                String valueOf2 = String.valueOf(zzajqVar2);
                throw new DatabaseException(new StringBuilder(String.valueOf(valueOf2).length() + 83).append("Path '").append(valueOf2).append("' contains invalid priority (must be a string, double, ServerValue, or null).").toString());
            } else {
                zzbx(value);
                treeMap.put(zzajqVar2, zzamm.zzbt(value));
            }
        }
        zzajq zzajqVar3 = null;
        Iterator it = treeMap.keySet().iterator();
        while (true) {
            zzajq zzajqVar4 = zzajqVar3;
            if (it.hasNext()) {
                zzajqVar3 = (zzajq) it.next();
                zzann.zzcx(zzajqVar4 == null || zzajqVar4.compareTo(zzajqVar3) < 0);
                if (zzajqVar4 != null && zzajqVar4.zzi(zzajqVar3)) {
                    String valueOf3 = String.valueOf(zzajqVar4);
                    String valueOf4 = String.valueOf(zzajqVar3);
                    throw new DatabaseException(new StringBuilder(String.valueOf(valueOf3).length() + 42 + String.valueOf(valueOf4).length()).append("Path '").append(valueOf3).append("' is an ancestor of '").append(valueOf4).append("' in an update.").toString());
                }
            } else {
                return treeMap;
            }
        }
    }

    private static boolean zzth(String str) {
        return !bkm.matcher(str).find();
    }

    public static void zzti(String str) throws DatabaseException {
        if (!zzth(str)) {
            throw new DatabaseException(new StringBuilder(String.valueOf(str).length() + 101).append("Invalid Firebase Database path: ").append(str).append(". Firebase Database paths must not contain '.', '#', '$', '[', or ']'").toString());
        }
    }

    public static void zztj(String str) throws DatabaseException {
        if (str.startsWith(".info")) {
            zzti(str.substring(5));
        } else if (str.startsWith("/.info")) {
            zzti(str.substring(6));
        } else {
            zzti(str);
        }
    }

    private static boolean zztk(String str) {
        return str != null && str.length() > 0 && (str.equals(".value") || str.equals(".priority") || (!str.startsWith(".") && !bkn.matcher(str).find()));
    }

    private static boolean zztl(String str) {
        return str.equals(".info") || !bkn.matcher(str).find();
    }

    public static void zztm(String str) throws DatabaseException {
        if (str == null || zztl(str)) {
            return;
        }
        throw new DatabaseException(new StringBuilder(String.valueOf(str).length() + 68).append("Invalid key: ").append(str).append(". Keys must not contain '/', '.', '#', '$', '[', or ']'").toString());
    }

    public static void zztn(String str) throws DatabaseException {
        if (!zztk(str)) {
            throw new DatabaseException(new StringBuilder(String.valueOf(str).length() + 68).append("Invalid key: ").append(str).append(". Keys must not contain '/', '.', '#', '$', '[', or ']'").toString());
        }
    }
}
