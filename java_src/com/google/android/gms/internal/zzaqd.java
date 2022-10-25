package com.google.android.gms.internal;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;
/* loaded from: classes2.dex */
public final class zzaqd extends zzapk<Date> {
    public static final zzapl bpG = new zzapl() { // from class: com.google.android.gms.internal.zzaqd.1
        @Override // com.google.android.gms.internal.zzapl
        public <T> zzapk<T> zza(zzaos zzaosVar, zzaqo<T> zzaqoVar) {
            if (zzaqoVar.bB() == Date.class) {
                return new zzaqd();
            }
            return null;
        }
    };
    private final DateFormat bnQ = DateFormat.getDateTimeInstance(2, 2, Locale.US);
    private final DateFormat bnR = DateFormat.getDateTimeInstance(2, 2);
    private final DateFormat bnS = bp();

    private static DateFormat bp() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", Locale.US);
        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
        return simpleDateFormat;
    }

    private synchronized Date zzur(String str) {
        Date parse;
        try {
            parse = this.bnR.parse(str);
        } catch (ParseException e) {
            try {
                parse = this.bnQ.parse(str);
            } catch (ParseException e2) {
                try {
                    parse = this.bnS.parse(str);
                } catch (ParseException e3) {
                    throw new zzaph(str, e3);
                }
            }
        }
        return parse;
    }

    @Override // com.google.android.gms.internal.zzapk
    public synchronized void zza(zzaqr zzaqrVar, Date date) throws IOException {
        if (date == null) {
            zzaqrVar.bA();
        } else {
            zzaqrVar.zzut(this.bnQ.format(date));
        }
    }

    @Override // com.google.android.gms.internal.zzapk
    /* renamed from: zzk */
    public Date zzb(zzaqp zzaqpVar) throws IOException {
        if (zzaqpVar.bq() == zzaqq.NULL) {
            zzaqpVar.nextNull();
            return null;
        }
        return zzur(zzaqpVar.nextString());
    }
}
