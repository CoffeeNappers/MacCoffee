package com.google.android.gms.internal;

import java.lang.reflect.Type;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;
/* loaded from: classes2.dex */
final class zzaon implements zzaox<Date>, zzapg<Date> {
    private final DateFormat bnQ;
    private final DateFormat bnR;
    private final DateFormat bnS;

    zzaon() {
        this(DateFormat.getDateTimeInstance(2, 2, Locale.US), DateFormat.getDateTimeInstance(2, 2));
    }

    public zzaon(int i, int i2) {
        this(DateFormat.getDateTimeInstance(i, i2, Locale.US), DateFormat.getDateTimeInstance(i, i2));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzaon(String str) {
        this(new SimpleDateFormat(str, Locale.US), new SimpleDateFormat(str));
    }

    zzaon(DateFormat dateFormat, DateFormat dateFormat2) {
        this.bnQ = dateFormat;
        this.bnR = dateFormat2;
        this.bnS = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", Locale.US);
        this.bnS.setTimeZone(TimeZone.getTimeZone("UTC"));
    }

    private Date zza(zzaoy zzaoyVar) {
        Date parse;
        synchronized (this.bnR) {
            try {
                parse = this.bnR.parse(zzaoyVar.aU());
            } catch (ParseException e) {
                try {
                    parse = this.bnQ.parse(zzaoyVar.aU());
                } catch (ParseException e2) {
                    try {
                        parse = this.bnS.parse(zzaoyVar.aU());
                    } catch (ParseException e3) {
                        throw new zzaph(zzaoyVar.aU(), e3);
                    }
                }
            }
        }
        return parse;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(zzaon.class.getSimpleName());
        sb.append('(').append(this.bnR.getClass().getSimpleName()).append(')');
        return sb.toString();
    }

    @Override // com.google.android.gms.internal.zzapg
    public zzaoy zza(Date date, Type type, zzapf zzapfVar) {
        zzape zzapeVar;
        synchronized (this.bnR) {
            zzapeVar = new zzape(this.bnQ.format(date));
        }
        return zzapeVar;
    }

    @Override // com.google.android.gms.internal.zzaox
    /* renamed from: zza */
    public Date zzb(zzaoy zzaoyVar, Type type, zzaow zzaowVar) throws zzapc {
        if (!(zzaoyVar instanceof zzape)) {
            throw new zzapc("The date should be a string value");
        }
        Date zza = zza(zzaoyVar);
        if (type == Date.class) {
            return zza;
        }
        if (type == Timestamp.class) {
            return new Timestamp(zza.getTime());
        }
        if (type == java.sql.Date.class) {
            return new java.sql.Date(zza.getTime());
        }
        String valueOf = String.valueOf(getClass());
        String valueOf2 = String.valueOf(type);
        throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf).length() + 23 + String.valueOf(valueOf2).length()).append(valueOf).append(" cannot deserialize to ").append(valueOf2).toString());
    }
}
