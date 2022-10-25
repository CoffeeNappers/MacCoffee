package com.google.android.gms.internal;

import com.google.firebase.database.DatabaseException;
import com.vk.media.camera.CameraUtilsEffects;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzakf {
    private final List<String> bfQ = new ArrayList();
    private int bfR;

    private zzakf(zzajq zzajqVar) throws DatabaseException {
        this.bfR = 0;
        Iterator<zzalz> it = zzajqVar.iterator();
        while (it.hasNext()) {
            this.bfQ.add(it.next().asString());
        }
        this.bfR = Math.max(1, this.bfQ.size());
        for (int i = 0; i < this.bfQ.size(); i++) {
            this.bfR = zza(this.bfQ.get(i)) + this.bfR;
        }
        zzcmr();
    }

    private static int zza(CharSequence charSequence) {
        int i = 0;
        int length = charSequence.length();
        int i2 = 0;
        while (i < length) {
            char charAt = charSequence.charAt(i);
            if (charAt <= 127) {
                i2++;
            } else if (charAt <= 2047) {
                i2 += 2;
            } else if (Character.isHighSurrogate(charAt)) {
                i2 += 4;
                i++;
            } else {
                i2 += 3;
            }
            i++;
        }
        return i2;
    }

    public static void zza(zzajq zzajqVar, Object obj) throws DatabaseException {
        new zzakf(zzajqVar).zzbr(obj);
    }

    private void zzbr(Object obj) throws DatabaseException {
        if (obj instanceof Map) {
            Map map = (Map) obj;
            for (String str : map.keySet()) {
                if (!str.startsWith(".")) {
                    zzsw(str);
                    zzbr(map.get(str));
                    zzcwh();
                }
            }
        } else if (obj instanceof List) {
            List list = (List) obj;
            for (int i = 0; i < list.size(); i++) {
                zzsw(Integer.toString(i));
                zzbr(list.get(i));
                zzcwh();
            }
        }
    }

    private void zzcmr() throws DatabaseException {
        if (this.bfR > 768) {
            String valueOf = String.valueOf("Data has a key path longer than 768 bytes (");
            throw new DatabaseException(new StringBuilder(String.valueOf(valueOf).length() + 13).append(valueOf).append(this.bfR).append(").").toString());
        } else if (this.bfQ.size() <= 32) {
        } else {
            String valueOf2 = String.valueOf("Path specified exceeds the maximum depth that can be written (32) or object contains a cycle ");
            String valueOf3 = String.valueOf(zzcwi());
            throw new DatabaseException(valueOf3.length() != 0 ? valueOf2.concat(valueOf3) : new String(valueOf2));
        }
    }

    private String zzcwh() {
        String remove = this.bfQ.remove(this.bfQ.size() - 1);
        this.bfR -= zza(remove);
        if (this.bfQ.size() > 0) {
            this.bfR--;
        }
        return remove;
    }

    private String zzcwi() {
        if (this.bfQ.size() == 0) {
            return "";
        }
        String valueOf = String.valueOf(zze(CameraUtilsEffects.FILE_DELIM, this.bfQ));
        return new StringBuilder(String.valueOf(valueOf).length() + 10).append("in path '").append(valueOf).append("'").toString();
    }

    private static String zze(String str, List<String> list) {
        StringBuilder sb = new StringBuilder();
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 < list.size()) {
                if (i2 > 0) {
                    sb.append(str);
                }
                sb.append(list.get(i2));
                i = i2 + 1;
            } else {
                return sb.toString();
            }
        }
    }

    private void zzsw(String str) throws DatabaseException {
        if (this.bfQ.size() > 0) {
            this.bfR++;
        }
        this.bfQ.add(str);
        this.bfR += zza(str);
        zzcmr();
    }
}
