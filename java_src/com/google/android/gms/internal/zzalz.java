package com.google.android.gms.internal;

import com.vk.media.camera.CameraUtilsEffects;
/* loaded from: classes2.dex */
public class zzalz implements Comparable<zzalz> {
    static final /* synthetic */ boolean $assertionsDisabled;
    private static final zzalz biu;
    private static final zzalz biv;
    private static final zzalz biw;
    private static final zzalz bix;
    private final String zzcb;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class zza extends zzalz {
        private final int Ff;

        zza(String str, int i) {
            super(str);
            this.Ff = i;
        }

        @Override // com.google.android.gms.internal.zzalz, java.lang.Comparable
        public /* synthetic */ int compareTo(zzalz zzalzVar) {
            return super.compareTo(zzalzVar);
        }

        @Override // com.google.android.gms.internal.zzalz
        protected int intValue() {
            return this.Ff;
        }

        @Override // com.google.android.gms.internal.zzalz
        public String toString() {
            String str = ((zzalz) this).zzcb;
            return new StringBuilder(String.valueOf(str).length() + 20).append("IntegerChildName(\"").append(str).append("\")").toString();
        }

        @Override // com.google.android.gms.internal.zzalz
        protected boolean zzczc() {
            return true;
        }
    }

    static {
        $assertionsDisabled = !zzalz.class.desiredAssertionStatus();
        biu = new zzalz("[MIN_KEY]");
        biv = new zzalz("[MAX_KEY]");
        biw = new zzalz(".priority");
        bix = new zzalz(".info");
    }

    private zzalz(String str) {
        this.zzcb = str;
    }

    public static zzalz zzcyx() {
        return biu;
    }

    public static zzalz zzcyy() {
        return biv;
    }

    public static zzalz zzcyz() {
        return biw;
    }

    public static zzalz zzcza() {
        return bix;
    }

    public static zzalz zzsx(String str) {
        Integer zztg = zzann.zztg(str);
        if (zztg != null) {
            return new zza(str, zztg.intValue());
        }
        if (str.equals(".priority")) {
            return biw;
        }
        if (!$assertionsDisabled && str.contains(CameraUtilsEffects.FILE_DELIM)) {
            throw new AssertionError();
        }
        return new zzalz(str);
    }

    public String asString() {
        return this.zzcb;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof zzalz)) {
            return false;
        }
        if (this != obj) {
            return this.zzcb.equals(((zzalz) obj).zzcb);
        }
        return true;
    }

    public int hashCode() {
        return this.zzcb.hashCode();
    }

    protected int intValue() {
        return 0;
    }

    public String toString() {
        String str = this.zzcb;
        return new StringBuilder(String.valueOf(str).length() + 12).append("ChildKey(\"").append(str).append("\")").toString();
    }

    public boolean zzczb() {
        return this == biw;
    }

    protected boolean zzczc() {
        return false;
    }

    @Override // java.lang.Comparable
    /* renamed from: zzi */
    public int compareTo(zzalz zzalzVar) {
        if (this == zzalzVar) {
            return 0;
        }
        if (this == biu || zzalzVar == biv) {
            return -1;
        }
        if (zzalzVar == biu || this == biv) {
            return 1;
        }
        if (!zzczc()) {
            if (!zzalzVar.zzczc()) {
                return this.zzcb.compareTo(zzalzVar.zzcb);
            }
            return 1;
        } else if (!zzalzVar.zzczc()) {
            return -1;
        } else {
            int zzad = zzann.zzad(intValue(), zzalzVar.intValue());
            return zzad == 0 ? zzann.zzad(this.zzcb.length(), zzalzVar.zzcb.length()) : zzad;
        }
    }
}
