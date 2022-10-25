package com.google.android.gms.internal;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes2.dex */
public class zzalj {
    private final zzalw aZR;
    private final zzajn bdk;

    public zzalj(zzajj zzajjVar) {
        this.bdk = zzajjVar.zzcur();
        this.aZR = zzajjVar.zzss("EventRaiser");
    }

    public void zzax(List<? extends zzalh> list) {
        if (this.aZR.zzcyu()) {
            this.aZR.zzi(new StringBuilder(28).append("Raising ").append(list.size()).append(" event(s)").toString(), new Object[0]);
        }
        final ArrayList arrayList = new ArrayList(list);
        this.bdk.zzq(new Runnable() { // from class: com.google.android.gms.internal.zzalj.1
            @Override // java.lang.Runnable
            public void run() {
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    zzalh zzalhVar = (zzalh) it.next();
                    if (zzalj.this.aZR.zzcyu()) {
                        zzalw zzalwVar = zzalj.this.aZR;
                        String valueOf = String.valueOf(zzalhVar.toString());
                        zzalwVar.zzi(valueOf.length() != 0 ? "Raising ".concat(valueOf) : new String("Raising "), new Object[0]);
                    }
                    zzalhVar.zzcxk();
                }
            }
        });
    }
}
