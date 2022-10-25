package com.google.android.gms.internal;

import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzht {
    private final boolean zzbyw;
    private final boolean zzbyx;
    private final boolean zzbyy;
    private final boolean zzbyz;
    private final boolean zzbza;

    /* loaded from: classes2.dex */
    public static final class zza {
        private boolean zzbyw;
        private boolean zzbyx;
        private boolean zzbyy;
        private boolean zzbyz;
        private boolean zzbza;

        public zzht zzow() {
            return new zzht(this);
        }

        public zza zzu(boolean z) {
            this.zzbyw = z;
            return this;
        }

        public zza zzv(boolean z) {
            this.zzbyx = z;
            return this;
        }

        public zza zzw(boolean z) {
            this.zzbyy = z;
            return this;
        }

        public zza zzx(boolean z) {
            this.zzbyz = z;
            return this;
        }

        public zza zzy(boolean z) {
            this.zzbza = z;
            return this;
        }
    }

    private zzht(zza zzaVar) {
        this.zzbyw = zzaVar.zzbyw;
        this.zzbyx = zzaVar.zzbyx;
        this.zzbyy = zzaVar.zzbyy;
        this.zzbyz = zzaVar.zzbyz;
        this.zzbza = zzaVar.zzbza;
    }

    public JSONObject toJson() {
        try {
            return new JSONObject().put("sms", this.zzbyw).put("tel", this.zzbyx).put("calendar", this.zzbyy).put("storePicture", this.zzbyz).put("inlineVideo", this.zzbza);
        } catch (JSONException e) {
            zzkx.zzb("Error occured while obtaining the MRAID capabilities.", e);
            return null;
        }
    }
}
