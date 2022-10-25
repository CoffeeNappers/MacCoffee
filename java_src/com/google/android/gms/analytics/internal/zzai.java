package com.google.android.gms.analytics.internal;

import android.content.SharedPreferences;
import android.text.TextUtils;
import android.util.Pair;
import java.util.UUID;
/* loaded from: classes.dex */
public class zzai extends zzd {
    private SharedPreferences fF;
    private long fG;
    private long fH;
    private final zza fI;

    /* loaded from: classes.dex */
    public final class zza {
        private final long fJ;
        private final String mName;

        private zza(String str, long j) {
            com.google.android.gms.common.internal.zzaa.zzib(str);
            com.google.android.gms.common.internal.zzaa.zzbt(j > 0);
            this.mName = str;
            this.fJ = j;
        }

        private void zzagu() {
            long currentTimeMillis = zzai.this.zzabz().currentTimeMillis();
            SharedPreferences.Editor edit = zzai.this.fF.edit();
            edit.remove(zzagz());
            edit.remove(zzaha());
            edit.putLong(zzagy(), currentTimeMillis);
            edit.commit();
        }

        private long zzagv() {
            long zzagx = zzagx();
            if (zzagx == 0) {
                return 0L;
            }
            return Math.abs(zzagx - zzai.this.zzabz().currentTimeMillis());
        }

        private long zzagx() {
            return zzai.this.fF.getLong(zzagy(), 0L);
        }

        private String zzagy() {
            return String.valueOf(this.mName).concat(":start");
        }

        private String zzagz() {
            return String.valueOf(this.mName).concat(":count");
        }

        public Pair<String, Long> zzagw() {
            long zzagv = zzagv();
            if (zzagv < this.fJ) {
                return null;
            }
            if (zzagv > this.fJ * 2) {
                zzagu();
                return null;
            }
            String string = zzai.this.fF.getString(zzaha(), null);
            long j = zzai.this.fF.getLong(zzagz(), 0L);
            zzagu();
            if (string != null && j > 0) {
                return new Pair<>(string, Long.valueOf(j));
            }
            return null;
        }

        protected String zzaha() {
            return String.valueOf(this.mName).concat(":value");
        }

        public void zzfg(String str) {
            if (zzagx() == 0) {
                zzagu();
            }
            if (str == null) {
                str = "";
            }
            synchronized (this) {
                long j = zzai.this.fF.getLong(zzagz(), 0L);
                if (j <= 0) {
                    SharedPreferences.Editor edit = zzai.this.fF.edit();
                    edit.putString(zzaha(), str);
                    edit.putLong(zzagz(), 1L);
                    edit.apply();
                    return;
                }
                boolean z = (UUID.randomUUID().getLeastSignificantBits() & Long.MAX_VALUE) < Long.MAX_VALUE / (j + 1);
                SharedPreferences.Editor edit2 = zzai.this.fF.edit();
                if (z) {
                    edit2.putString(zzaha(), str);
                }
                edit2.putLong(zzagz(), j + 1);
                edit2.apply();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzai(zzf zzfVar) {
        super(zzfVar);
        this.fH = -1L;
        this.fI = new zza("monitoring", zzacb().zzafj());
    }

    public long zzago() {
        zzzx();
        zzacj();
        if (this.fG == 0) {
            long j = this.fF.getLong("first_run", 0L);
            if (j != 0) {
                this.fG = j;
            } else {
                long currentTimeMillis = zzabz().currentTimeMillis();
                SharedPreferences.Editor edit = this.fF.edit();
                edit.putLong("first_run", currentTimeMillis);
                if (!edit.commit()) {
                    zzev("Failed to commit first run time");
                }
                this.fG = currentTimeMillis;
            }
        }
        return this.fG;
    }

    public zzal zzagp() {
        return new zzal(zzabz(), zzago());
    }

    public long zzagq() {
        zzzx();
        zzacj();
        if (this.fH == -1) {
            this.fH = this.fF.getLong("last_dispatch", 0L);
        }
        return this.fH;
    }

    public void zzagr() {
        zzzx();
        zzacj();
        long currentTimeMillis = zzabz().currentTimeMillis();
        SharedPreferences.Editor edit = this.fF.edit();
        edit.putLong("last_dispatch", currentTimeMillis);
        edit.apply();
        this.fH = currentTimeMillis;
    }

    public String zzags() {
        zzzx();
        zzacj();
        String string = this.fF.getString("installation_campaign", null);
        if (TextUtils.isEmpty(string)) {
            return null;
        }
        return string;
    }

    public zza zzagt() {
        return this.fI;
    }

    public void zzff(String str) {
        zzzx();
        zzacj();
        SharedPreferences.Editor edit = this.fF.edit();
        if (TextUtils.isEmpty(str)) {
            edit.remove("installation_campaign");
        } else {
            edit.putString("installation_campaign", str);
        }
        if (!edit.commit()) {
            zzev("Failed to commit campaign data");
        }
    }

    @Override // com.google.android.gms.analytics.internal.zzd
    protected void zzzy() {
        this.fF = getContext().getSharedPreferences("com.google.android.gms.analytics.prefs", 0);
    }
}
