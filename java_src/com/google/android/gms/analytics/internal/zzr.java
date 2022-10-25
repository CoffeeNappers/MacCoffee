package com.google.android.gms.analytics.internal;

import android.content.pm.ApplicationInfo;
import android.text.TextUtils;
import java.util.HashSet;
import java.util.Set;
/* loaded from: classes2.dex */
public class zzr {
    private final zzf ao;
    private volatile Boolean eb;
    private String ec;
    private Set<Integer> ed;

    /* JADX INFO: Access modifiers changed from: protected */
    public zzr(zzf zzfVar) {
        com.google.android.gms.common.internal.zzaa.zzy(zzfVar);
        this.ao = zzfVar;
    }

    public boolean zzaef() {
        if (this.eb == null) {
            synchronized (this) {
                if (this.eb == null) {
                    ApplicationInfo applicationInfo = this.ao.getContext().getApplicationInfo();
                    String zzayz = com.google.android.gms.common.util.zzt.zzayz();
                    if (applicationInfo != null) {
                        String str = applicationInfo.processName;
                        this.eb = Boolean.valueOf(str != null && str.equals(zzayz));
                    }
                    if ((this.eb == null || !this.eb.booleanValue()) && "com.google.android.gms.analytics".equals(zzayz)) {
                        this.eb = Boolean.TRUE;
                    }
                    if (this.eb == null) {
                        this.eb = Boolean.TRUE;
                        this.ao.zzaca().zzew("My process not in the list of running processes");
                    }
                }
            }
        }
        return this.eb.booleanValue();
    }

    public boolean zzaeg() {
        return zzy.em.get().booleanValue();
    }

    public int zzaeh() {
        return zzy.eF.get().intValue();
    }

    public int zzaei() {
        return zzy.eJ.get().intValue();
    }

    public int zzaej() {
        return zzy.eK.get().intValue();
    }

    public int zzaek() {
        return zzy.eL.get().intValue();
    }

    public long zzael() {
        return zzy.eu.get().longValue();
    }

    public long zzaem() {
        return zzy.et.get().longValue();
    }

    public long zzaen() {
        return zzy.ex.get().longValue();
    }

    public long zzaeo() {
        return zzy.ey.get().longValue();
    }

    public int zzaep() {
        return zzy.ez.get().intValue();
    }

    public int zzaeq() {
        return zzy.eA.get().intValue();
    }

    public long zzaer() {
        return zzy.eN.get().intValue();
    }

    public String zzaes() {
        return zzy.eC.get();
    }

    public String zzaet() {
        return zzy.eB.get();
    }

    public String zzaeu() {
        return zzy.eD.get();
    }

    public String zzaev() {
        return zzy.eE.get();
    }

    public zzm zzaew() {
        return zzm.zzfb(zzy.eG.get());
    }

    public zzo zzaex() {
        return zzo.zzfc(zzy.eH.get());
    }

    public Set<Integer> zzaey() {
        String str = zzy.eM.get();
        if (this.ed == null || this.ec == null || !this.ec.equals(str)) {
            String[] split = TextUtils.split(str, ",");
            HashSet hashSet = new HashSet();
            for (String str2 : split) {
                try {
                    hashSet.add(Integer.valueOf(Integer.parseInt(str2)));
                } catch (NumberFormatException e) {
                }
            }
            this.ec = str;
            this.ed = hashSet;
        }
        return this.ed;
    }

    public long zzaez() {
        return zzy.eV.get().longValue();
    }

    public long zzafa() {
        return zzy.eW.get().longValue();
    }

    public long zzafb() {
        return zzy.eZ.get().longValue();
    }

    public int zzafc() {
        return zzy.eq.get().intValue();
    }

    public int zzafd() {
        return zzy.es.get().intValue();
    }

    public String zzafe() {
        return "google_analytics_v4.db";
    }

    public String zzaff() {
        return "google_analytics2_v4.db";
    }

    public int zzafg() {
        return zzy.eP.get().intValue();
    }

    public int zzafh() {
        return zzy.eQ.get().intValue();
    }

    public long zzafi() {
        return zzy.eR.get().longValue();
    }

    public long zzafj() {
        return zzy.fa.get().longValue();
    }
}
