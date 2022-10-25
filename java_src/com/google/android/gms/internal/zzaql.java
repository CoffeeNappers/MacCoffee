package com.google.android.gms.internal;

import java.io.IOException;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
/* loaded from: classes2.dex */
public final class zzaql extends zzapk<Time> {
    public static final zzapl bpG = new zzapl() { // from class: com.google.android.gms.internal.zzaql.1
        @Override // com.google.android.gms.internal.zzapl
        public <T> zzapk<T> zza(zzaos zzaosVar, zzaqo<T> zzaqoVar) {
            if (zzaqoVar.bB() == Time.class) {
                return new zzaql();
            }
            return null;
        }
    };
    private final DateFormat bqg = new SimpleDateFormat("hh:mm:ss a");

    @Override // com.google.android.gms.internal.zzapk
    public synchronized void zza(zzaqr zzaqrVar, Time time) throws IOException {
        zzaqrVar.zzut(time == null ? null : this.bqg.format((Date) time));
    }

    @Override // com.google.android.gms.internal.zzapk
    /* renamed from: zzn */
    public synchronized Time zzb(zzaqp zzaqpVar) throws IOException {
        Time time;
        if (zzaqpVar.bq() == zzaqq.NULL) {
            zzaqpVar.nextNull();
            time = null;
        } else {
            try {
                time = new Time(this.bqg.parse(zzaqpVar.nextString()).getTime());
            } catch (ParseException e) {
                throw new zzaph(e);
            }
        }
        return time;
    }
}
