package com.google.android.gms.internal;

import android.util.Base64OutputStream;
import com.google.android.gms.internal.zzdg;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Locale;
import java.util.PriorityQueue;
@zzji
/* loaded from: classes.dex */
public class zzdd {
    private final int zzaxh;
    private final zzdc zzaxj = new zzdf();
    private final int zzaxg = 6;
    private final int zzaxi = 0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class zza {
        ByteArrayOutputStream zzaxl = new ByteArrayOutputStream(4096);
        Base64OutputStream zzaxm = new Base64OutputStream(this.zzaxl, 10);

        /* JADX WARN: Type inference failed for: r2v0, types: [java.io.ByteArrayOutputStream, android.util.Base64OutputStream] */
        public String toString() {
            String str;
            try {
                this.zzaxm.close();
            } catch (IOException e) {
                zzkx.zzb("HashManager: Unable to convert to Base64.", e);
            }
            try {
                this.zzaxl.close();
                str = this.zzaxl.toString();
            } catch (IOException e2) {
                zzkx.zzb("HashManager: Unable to convert to Base64.", e2);
                str = "";
            } finally {
                this.zzaxl = null;
                this.zzaxm = null;
            }
            return str;
        }

        public void write(byte[] bArr) throws IOException {
            this.zzaxm.write(bArr);
        }
    }

    public zzdd(int i) {
        this.zzaxh = i;
    }

    public String zza(ArrayList<String> arrayList) {
        StringBuffer stringBuffer = new StringBuffer();
        Iterator<String> it = arrayList.iterator();
        while (it.hasNext()) {
            stringBuffer.append(it.next().toLowerCase(Locale.US));
            stringBuffer.append('\n');
        }
        return zzah(stringBuffer.toString());
    }

    String zzah(String str) {
        String[] split = str.split("\n");
        if (split.length == 0) {
            return "";
        }
        zza zzjs = zzjs();
        PriorityQueue priorityQueue = new PriorityQueue(this.zzaxh, new Comparator<zzdg.zza>() { // from class: com.google.android.gms.internal.zzdd.1
            @Override // java.util.Comparator
            /* renamed from: zza */
            public int compare(zzdg.zza zzaVar, zzdg.zza zzaVar2) {
                int i = zzaVar.zzaxp - zzaVar2.zzaxp;
                return i != 0 ? i : (int) (zzaVar.value - zzaVar2.value);
            }
        });
        for (String str2 : split) {
            String[] zzaj = zzde.zzaj(str2);
            if (zzaj.length != 0) {
                zzdg.zza(zzaj, this.zzaxh, this.zzaxg, priorityQueue);
            }
        }
        Iterator it = priorityQueue.iterator();
        while (it.hasNext()) {
            try {
                zzjs.write(this.zzaxj.zzag(((zzdg.zza) it.next()).zzaxo));
            } catch (IOException e) {
                zzkx.zzb("Error while writing hash to byteStream", e);
            }
        }
        return zzjs.toString();
    }

    zza zzjs() {
        return new zza();
    }
}
