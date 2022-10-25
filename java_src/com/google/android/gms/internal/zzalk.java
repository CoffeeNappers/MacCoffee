package com.google.android.gms.internal;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzalk {
    static final /* synthetic */ boolean $assertionsDisabled;
    public static final zzalk bhG;
    private Integer bhH;
    private zza bhI;
    private zzaml bhJ = null;
    private zzalz bhK = null;
    private zzaml bhL = null;
    private zzalz bhM = null;
    private zzamf bhC = zzamo.b();
    private String bhN = null;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public enum zza {
        LEFT,
        RIGHT
    }

    static {
        $assertionsDisabled = !zzalk.class.desiredAssertionStatus();
        bhG = new zzalk();
    }

    public static zzalk zzcd(Map<String, Object> map) {
        zzalk zzalkVar = new zzalk();
        zzalkVar.bhH = (Integer) map.get("l");
        if (map.containsKey("sp")) {
            zzalkVar.bhJ = zze(zzamm.zzbt(map.get("sp")));
            String str = (String) map.get("sn");
            if (str != null) {
                zzalkVar.bhK = zzalz.zzsx(str);
            }
        }
        if (map.containsKey("ep")) {
            zzalkVar.bhL = zze(zzamm.zzbt(map.get("ep")));
            String str2 = (String) map.get("en");
            if (str2 != null) {
                zzalkVar.bhM = zzalz.zzsx(str2);
            }
        }
        String str3 = (String) map.get("vf");
        if (str3 != null) {
            zzalkVar.bhI = str3.equals("l") ? zza.LEFT : zza.RIGHT;
        }
        String str4 = (String) map.get("i");
        if (str4 != null) {
            zzalkVar.bhC = zzamf.zzsy(str4);
        }
        return zzalkVar;
    }

    private zzalk zzcyb() {
        zzalk zzalkVar = new zzalk();
        zzalkVar.bhH = this.bhH;
        zzalkVar.bhJ = this.bhJ;
        zzalkVar.bhK = this.bhK;
        zzalkVar.bhL = this.bhL;
        zzalkVar.bhM = this.bhM;
        zzalkVar.bhI = this.bhI;
        zzalkVar.bhC = this.bhC;
        return zzalkVar;
    }

    private static zzaml zze(zzaml zzamlVar) {
        if ((zzamlVar instanceof zzamr) || (zzamlVar instanceof zzaly) || (zzamlVar instanceof zzamd) || (zzamlVar instanceof zzame)) {
            return zzamlVar;
        }
        if (zzamlVar instanceof zzamj) {
            return new zzamd(Double.valueOf(((Long) zzamlVar.getValue()).doubleValue()), zzamp.c());
        }
        String valueOf = String.valueOf(zzamlVar.getValue());
        throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 43).append("Unexpected value passed to normalizeValue: ").append(valueOf).toString());
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        zzalk zzalkVar = (zzalk) obj;
        if (this.bhH == null ? zzalkVar.bhH != null : !this.bhH.equals(zzalkVar.bhH)) {
            return false;
        }
        if (this.bhC == null ? zzalkVar.bhC != null : !this.bhC.equals(zzalkVar.bhC)) {
            return false;
        }
        if (this.bhM == null ? zzalkVar.bhM != null : !this.bhM.equals(zzalkVar.bhM)) {
            return false;
        }
        if (this.bhL == null ? zzalkVar.bhL != null : !this.bhL.equals(zzalkVar.bhL)) {
            return false;
        }
        if (this.bhK == null ? zzalkVar.bhK != null : !this.bhK.equals(zzalkVar.bhK)) {
            return false;
        }
        if (this.bhJ == null ? zzalkVar.bhJ != null : !this.bhJ.equals(zzalkVar.bhJ)) {
            return false;
        }
        return zzcyc() == zzalkVar.zzcyc();
    }

    public int getLimit() {
        if (!zzcxy()) {
            throw new IllegalArgumentException("Cannot get limit if limit has not been set");
        }
        return this.bhH.intValue();
    }

    public int hashCode() {
        int i = 0;
        int hashCode = ((this.bhM != null ? this.bhM.hashCode() : 0) + (((this.bhL != null ? this.bhL.hashCode() : 0) + (((this.bhK != null ? this.bhK.hashCode() : 0) + (((this.bhJ != null ? this.bhJ.hashCode() : 0) + (((zzcyc() ? 1231 : 1237) + ((this.bhH != null ? this.bhH.intValue() : 0) * 31)) * 31)) * 31)) * 31)) * 31)) * 31;
        if (this.bhC != null) {
            i = this.bhC.hashCode();
        }
        return hashCode + i;
    }

    public boolean isDefault() {
        return zzcye() && this.bhC.equals(zzamo.b());
    }

    public boolean isValid() {
        return !zzcxs() || !zzcxv() || !zzcxy() || zzcxz();
    }

    public String toString() {
        return zzcyd().toString();
    }

    public zzalk zza(zzamf zzamfVar) {
        zzalk zzcyb = zzcyb();
        zzcyb.bhC = zzamfVar;
        return zzcyb;
    }

    public zzalk zza(zzaml zzamlVar, zzalz zzalzVar) {
        if ($assertionsDisabled || zzamlVar.zzcze() || zzamlVar.isEmpty()) {
            zzann.zzcx(!(zzamlVar instanceof zzamj));
            zzalk zzcyb = zzcyb();
            zzcyb.bhJ = zzamlVar;
            zzcyb.bhK = zzalzVar;
            return zzcyb;
        }
        throw new AssertionError();
    }

    public zzalk zzafy(int i) {
        zzalk zzcyb = zzcyb();
        zzcyb.bhH = Integer.valueOf(i);
        zzcyb.bhI = zza.LEFT;
        return zzcyb;
    }

    public zzalk zzafz(int i) {
        zzalk zzcyb = zzcyb();
        zzcyb.bhH = Integer.valueOf(i);
        zzcyb.bhI = zza.RIGHT;
        return zzcyb;
    }

    public zzalk zzb(zzaml zzamlVar, zzalz zzalzVar) {
        if ($assertionsDisabled || zzamlVar.zzcze() || zzamlVar.isEmpty()) {
            zzann.zzcx(!(zzamlVar instanceof zzamj));
            zzalk zzcyb = zzcyb();
            zzcyb.bhL = zzamlVar;
            zzcyb.bhM = zzalzVar;
            return zzcyb;
        }
        throw new AssertionError();
    }

    public boolean zzcxs() {
        return this.bhJ != null;
    }

    public zzaml zzcxt() {
        if (!zzcxs()) {
            throw new IllegalArgumentException("Cannot get index start value if start has not been set");
        }
        return this.bhJ;
    }

    public zzalz zzcxu() {
        if (!zzcxs()) {
            throw new IllegalArgumentException("Cannot get index start name if start has not been set");
        }
        return this.bhK != null ? this.bhK : zzalz.zzcyx();
    }

    public boolean zzcxv() {
        return this.bhL != null;
    }

    public zzaml zzcxw() {
        if (!zzcxv()) {
            throw new IllegalArgumentException("Cannot get index end value if start has not been set");
        }
        return this.bhL;
    }

    public zzalz zzcxx() {
        if (!zzcxv()) {
            throw new IllegalArgumentException("Cannot get index end name if start has not been set");
        }
        return this.bhM != null ? this.bhM : zzalz.zzcyy();
    }

    public boolean zzcxy() {
        return this.bhH != null;
    }

    public boolean zzcxz() {
        return zzcxy() && this.bhI != null;
    }

    public zzamf zzcya() {
        return this.bhC;
    }

    public boolean zzcyc() {
        return this.bhI != null ? this.bhI == zza.LEFT : zzcxs();
    }

    public Map<String, Object> zzcyd() {
        HashMap hashMap = new HashMap();
        if (zzcxs()) {
            hashMap.put("sp", this.bhJ.getValue());
            if (this.bhK != null) {
                hashMap.put("sn", this.bhK.asString());
            }
        }
        if (zzcxv()) {
            hashMap.put("ep", this.bhL.getValue());
            if (this.bhM != null) {
                hashMap.put("en", this.bhM.asString());
            }
        }
        if (this.bhH != null) {
            hashMap.put("l", this.bhH);
            zza zzaVar = this.bhI;
            if (zzaVar == null) {
                zzaVar = zzcxs() ? zza.LEFT : zza.RIGHT;
            }
            switch (zzaVar) {
                case LEFT:
                    hashMap.put("vf", "l");
                    break;
                case RIGHT:
                    hashMap.put("vf", "r");
                    break;
            }
        }
        if (!this.bhC.equals(zzamo.b())) {
            hashMap.put("i", this.bhC.zzczt());
        }
        return hashMap;
    }

    public boolean zzcye() {
        return !zzcxs() && !zzcxv() && !zzcxy();
    }

    public String zzcyf() {
        if (this.bhN == null) {
            try {
                this.bhN = zzane.zzce(zzcyd());
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        return this.bhN;
    }

    public zzals zzcyg() {
        return zzcye() ? new zzalq(zzcya()) : zzcxy() ? new zzalr(this) : new zzalt(this);
    }
}
