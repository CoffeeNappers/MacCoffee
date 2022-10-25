package com.google.android.gms.internal;

import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.InetAddress;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.sql.Timestamp;
import java.util.BitSet;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.UUID;
import org.slf4j.Marker;
/* loaded from: classes2.dex */
public final class zzaqn {
    public static final zzapk<Class> bqj = new zzapk<Class>() { // from class: com.google.android.gms.internal.zzaqn.1
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, Class cls) throws IOException {
            if (cls == null) {
                zzaqrVar.bA();
            } else {
                String valueOf = String.valueOf(cls.getName());
                throw new UnsupportedOperationException(new StringBuilder(String.valueOf(valueOf).length() + 76).append("Attempted to serialize java.lang.Class: ").append(valueOf).append(". Forgot to register a type adapter?").toString());
            }
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzo */
        public Class zzb(zzaqp zzaqpVar) throws IOException {
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            throw new UnsupportedOperationException("Attempted to deserialize a java.lang.Class. Forgot to register a type adapter?");
        }
    };
    public static final zzapl bqk = zza(Class.class, bqj);
    public static final zzapk<BitSet> bql = new zzapk<BitSet>() { // from class: com.google.android.gms.internal.zzaqn.12
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, BitSet bitSet) throws IOException {
            if (bitSet == null) {
                zzaqrVar.bA();
                return;
            }
            zzaqrVar.bw();
            for (int i = 0; i < bitSet.length(); i++) {
                zzaqrVar.zzcs(bitSet.get(i) ? 1 : 0);
            }
            zzaqrVar.bx();
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzx */
        public BitSet zzb(zzaqp zzaqpVar) throws IOException {
            boolean z;
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            BitSet bitSet = new BitSet();
            zzaqpVar.beginArray();
            zzaqq bq = zzaqpVar.bq();
            int i = 0;
            while (bq != zzaqq.END_ARRAY) {
                switch (AnonymousClass26.bpW[bq.ordinal()]) {
                    case 1:
                        if (zzaqpVar.nextInt() == 0) {
                            z = false;
                            break;
                        } else {
                            z = true;
                            break;
                        }
                    case 2:
                        z = zzaqpVar.nextBoolean();
                        break;
                    case 3:
                        String nextString = zzaqpVar.nextString();
                        try {
                            if (Integer.parseInt(nextString) == 0) {
                                z = false;
                                break;
                            } else {
                                z = true;
                                break;
                            }
                        } catch (NumberFormatException e) {
                            String valueOf = String.valueOf(nextString);
                            throw new zzaph(valueOf.length() != 0 ? "Error: Expecting: bitset number value (1, 0), Found: ".concat(valueOf) : new String("Error: Expecting: bitset number value (1, 0), Found: "));
                        }
                    default:
                        String valueOf2 = String.valueOf(bq);
                        throw new zzaph(new StringBuilder(String.valueOf(valueOf2).length() + 27).append("Invalid bitset value type: ").append(valueOf2).toString());
                }
                if (z) {
                    bitSet.set(i);
                }
                i++;
                bq = zzaqpVar.bq();
            }
            zzaqpVar.endArray();
            return bitSet;
        }
    };
    public static final zzapl bqm = zza(BitSet.class, bql);
    public static final zzapk<Boolean> bqn = new zzapk<Boolean>() { // from class: com.google.android.gms.internal.zzaqn.23
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, Boolean bool) throws IOException {
            if (bool == null) {
                zzaqrVar.bA();
            } else {
                zzaqrVar.zzdh(bool.booleanValue());
            }
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzae */
        public Boolean zzb(zzaqp zzaqpVar) throws IOException {
            if (zzaqpVar.bq() != zzaqq.NULL) {
                return zzaqpVar.bq() == zzaqq.STRING ? Boolean.valueOf(Boolean.parseBoolean(zzaqpVar.nextString())) : Boolean.valueOf(zzaqpVar.nextBoolean());
            }
            zzaqpVar.nextNull();
            return null;
        }
    };
    public static final zzapk<Boolean> bqo = new zzapk<Boolean>() { // from class: com.google.android.gms.internal.zzaqn.27
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, Boolean bool) throws IOException {
            zzaqrVar.zzut(bool == null ? "null" : bool.toString());
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzae */
        public Boolean zzb(zzaqp zzaqpVar) throws IOException {
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            return Boolean.valueOf(zzaqpVar.nextString());
        }
    };
    public static final zzapl bqp = zza(Boolean.TYPE, Boolean.class, bqn);
    public static final zzapk<Number> bqq = new zzapk<Number>() { // from class: com.google.android.gms.internal.zzaqn.28
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, Number number) throws IOException {
            zzaqrVar.zza(number);
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzg */
        public Number zzb(zzaqp zzaqpVar) throws IOException {
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            try {
                return Byte.valueOf((byte) zzaqpVar.nextInt());
            } catch (NumberFormatException e) {
                throw new zzaph(e);
            }
        }
    };
    public static final zzapl bqr = zza(Byte.TYPE, Byte.class, bqq);
    public static final zzapk<Number> bqs = new zzapk<Number>() { // from class: com.google.android.gms.internal.zzaqn.29
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, Number number) throws IOException {
            zzaqrVar.zza(number);
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzg */
        public Number zzb(zzaqp zzaqpVar) throws IOException {
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            try {
                return Short.valueOf((short) zzaqpVar.nextInt());
            } catch (NumberFormatException e) {
                throw new zzaph(e);
            }
        }
    };
    public static final zzapl bqt = zza(Short.TYPE, Short.class, bqs);
    public static final zzapk<Number> bqu = new zzapk<Number>() { // from class: com.google.android.gms.internal.zzaqn.30
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, Number number) throws IOException {
            zzaqrVar.zza(number);
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzg */
        public Number zzb(zzaqp zzaqpVar) throws IOException {
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            try {
                return Integer.valueOf(zzaqpVar.nextInt());
            } catch (NumberFormatException e) {
                throw new zzaph(e);
            }
        }
    };
    public static final zzapl bqv = zza(Integer.TYPE, Integer.class, bqu);
    public static final zzapk<Number> bqw = new zzapk<Number>() { // from class: com.google.android.gms.internal.zzaqn.31
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, Number number) throws IOException {
            zzaqrVar.zza(number);
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzg */
        public Number zzb(zzaqp zzaqpVar) throws IOException {
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            try {
                return Long.valueOf(zzaqpVar.nextLong());
            } catch (NumberFormatException e) {
                throw new zzaph(e);
            }
        }
    };
    public static final zzapk<Number> bqx = new zzapk<Number>() { // from class: com.google.android.gms.internal.zzaqn.32
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, Number number) throws IOException {
            zzaqrVar.zza(number);
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzg */
        public Number zzb(zzaqp zzaqpVar) throws IOException {
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            return Float.valueOf((float) zzaqpVar.nextDouble());
        }
    };
    public static final zzapk<Number> bqy = new zzapk<Number>() { // from class: com.google.android.gms.internal.zzaqn.2
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, Number number) throws IOException {
            zzaqrVar.zza(number);
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzg */
        public Number zzb(zzaqp zzaqpVar) throws IOException {
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            return Double.valueOf(zzaqpVar.nextDouble());
        }
    };
    public static final zzapk<Number> bqz = new zzapk<Number>() { // from class: com.google.android.gms.internal.zzaqn.3
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, Number number) throws IOException {
            zzaqrVar.zza(number);
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzg */
        public Number zzb(zzaqp zzaqpVar) throws IOException {
            zzaqq bq = zzaqpVar.bq();
            switch (bq) {
                case NUMBER:
                    return new zzapv(zzaqpVar.nextString());
                case BOOLEAN:
                case STRING:
                default:
                    String valueOf = String.valueOf(bq);
                    throw new zzaph(new StringBuilder(String.valueOf(valueOf).length() + 23).append("Expecting number, got: ").append(valueOf).toString());
                case NULL:
                    zzaqpVar.nextNull();
                    return null;
            }
        }
    };
    public static final zzapl bqA = zza(Number.class, bqz);
    public static final zzapk<Character> bqB = new zzapk<Character>() { // from class: com.google.android.gms.internal.zzaqn.4
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, Character ch) throws IOException {
            zzaqrVar.zzut(ch == null ? null : String.valueOf(ch));
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzp */
        public Character zzb(zzaqp zzaqpVar) throws IOException {
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            String nextString = zzaqpVar.nextString();
            if (nextString.length() == 1) {
                return Character.valueOf(nextString.charAt(0));
            }
            String valueOf = String.valueOf(nextString);
            throw new zzaph(valueOf.length() != 0 ? "Expecting character, got: ".concat(valueOf) : new String("Expecting character, got: "));
        }
    };
    public static final zzapl bqC = zza(Character.TYPE, Character.class, bqB);
    public static final zzapk<String> bqD = new zzapk<String>() { // from class: com.google.android.gms.internal.zzaqn.5
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, String str) throws IOException {
            zzaqrVar.zzut(str);
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzq */
        public String zzb(zzaqp zzaqpVar) throws IOException {
            zzaqq bq = zzaqpVar.bq();
            if (bq != zzaqq.NULL) {
                return bq == zzaqq.BOOLEAN ? Boolean.toString(zzaqpVar.nextBoolean()) : zzaqpVar.nextString();
            }
            zzaqpVar.nextNull();
            return null;
        }
    };
    public static final zzapk<BigDecimal> bqE = new zzapk<BigDecimal>() { // from class: com.google.android.gms.internal.zzaqn.6
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, BigDecimal bigDecimal) throws IOException {
            zzaqrVar.zza(bigDecimal);
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzr */
        public BigDecimal zzb(zzaqp zzaqpVar) throws IOException {
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            try {
                return new BigDecimal(zzaqpVar.nextString());
            } catch (NumberFormatException e) {
                throw new zzaph(e);
            }
        }
    };
    public static final zzapk<BigInteger> bqF = new zzapk<BigInteger>() { // from class: com.google.android.gms.internal.zzaqn.7
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, BigInteger bigInteger) throws IOException {
            zzaqrVar.zza(bigInteger);
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzs */
        public BigInteger zzb(zzaqp zzaqpVar) throws IOException {
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            try {
                return new BigInteger(zzaqpVar.nextString());
            } catch (NumberFormatException e) {
                throw new zzaph(e);
            }
        }
    };
    public static final zzapl bqG = zza(String.class, bqD);
    public static final zzapk<StringBuilder> bqH = new zzapk<StringBuilder>() { // from class: com.google.android.gms.internal.zzaqn.8
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, StringBuilder sb) throws IOException {
            zzaqrVar.zzut(sb == null ? null : sb.toString());
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzt */
        public StringBuilder zzb(zzaqp zzaqpVar) throws IOException {
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            return new StringBuilder(zzaqpVar.nextString());
        }
    };
    public static final zzapl bqI = zza(StringBuilder.class, bqH);
    public static final zzapk<StringBuffer> bqJ = new zzapk<StringBuffer>() { // from class: com.google.android.gms.internal.zzaqn.9
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, StringBuffer stringBuffer) throws IOException {
            zzaqrVar.zzut(stringBuffer == null ? null : stringBuffer.toString());
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzu */
        public StringBuffer zzb(zzaqp zzaqpVar) throws IOException {
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            return new StringBuffer(zzaqpVar.nextString());
        }
    };
    public static final zzapl bqK = zza(StringBuffer.class, bqJ);
    public static final zzapk<URL> bqL = new zzapk<URL>() { // from class: com.google.android.gms.internal.zzaqn.10
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, URL url) throws IOException {
            zzaqrVar.zzut(url == null ? null : url.toExternalForm());
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzv */
        public URL zzb(zzaqp zzaqpVar) throws IOException {
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            String nextString = zzaqpVar.nextString();
            if ("null".equals(nextString)) {
                return null;
            }
            return new URL(nextString);
        }
    };
    public static final zzapl bqM = zza(URL.class, bqL);
    public static final zzapk<URI> bqN = new zzapk<URI>() { // from class: com.google.android.gms.internal.zzaqn.11
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, URI uri) throws IOException {
            zzaqrVar.zzut(uri == null ? null : uri.toASCIIString());
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzw */
        public URI zzb(zzaqp zzaqpVar) throws IOException {
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            try {
                String nextString = zzaqpVar.nextString();
                if ("null".equals(nextString)) {
                    return null;
                }
                return new URI(nextString);
            } catch (URISyntaxException e) {
                throw new zzaoz(e);
            }
        }
    };
    public static final zzapl bqO = zza(URI.class, bqN);
    public static final zzapk<InetAddress> bqP = new zzapk<InetAddress>() { // from class: com.google.android.gms.internal.zzaqn.13
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, InetAddress inetAddress) throws IOException {
            zzaqrVar.zzut(inetAddress == null ? null : inetAddress.getHostAddress());
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzy */
        public InetAddress zzb(zzaqp zzaqpVar) throws IOException {
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            return InetAddress.getByName(zzaqpVar.nextString());
        }
    };
    public static final zzapl bqQ = zzb(InetAddress.class, bqP);
    public static final zzapk<UUID> bqR = new zzapk<UUID>() { // from class: com.google.android.gms.internal.zzaqn.14
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, UUID uuid) throws IOException {
            zzaqrVar.zzut(uuid == null ? null : uuid.toString());
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzz */
        public UUID zzb(zzaqp zzaqpVar) throws IOException {
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            return UUID.fromString(zzaqpVar.nextString());
        }
    };
    public static final zzapl bqS = zza(UUID.class, bqR);
    public static final zzapl bqT = new zzapl() { // from class: com.google.android.gms.internal.zzaqn.15
        @Override // com.google.android.gms.internal.zzapl
        public <T> zzapk<T> zza(zzaos zzaosVar, zzaqo<T> zzaqoVar) {
            if (zzaqoVar.bB() != Timestamp.class) {
                return null;
            }
            final zzapk<T> zzk = zzaosVar.zzk(Date.class);
            return (zzapk<T>) new zzapk<Timestamp>() { // from class: com.google.android.gms.internal.zzaqn.15.1
                @Override // com.google.android.gms.internal.zzapk
                public void zza(zzaqr zzaqrVar, Timestamp timestamp) throws IOException {
                    zzk.zza(zzaqrVar, timestamp);
                }

                @Override // com.google.android.gms.internal.zzapk
                /* renamed from: zzaa */
                public Timestamp zzb(zzaqp zzaqpVar) throws IOException {
                    Date date = (Date) zzk.zzb(zzaqpVar);
                    if (date != null) {
                        return new Timestamp(date.getTime());
                    }
                    return null;
                }
            };
        }
    };
    public static final zzapk<Calendar> bqU = new zzapk<Calendar>() { // from class: com.google.android.gms.internal.zzaqn.16
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, Calendar calendar) throws IOException {
            if (calendar == null) {
                zzaqrVar.bA();
                return;
            }
            zzaqrVar.by();
            zzaqrVar.zzus("year");
            zzaqrVar.zzcs(calendar.get(1));
            zzaqrVar.zzus("month");
            zzaqrVar.zzcs(calendar.get(2));
            zzaqrVar.zzus("dayOfMonth");
            zzaqrVar.zzcs(calendar.get(5));
            zzaqrVar.zzus("hourOfDay");
            zzaqrVar.zzcs(calendar.get(11));
            zzaqrVar.zzus("minute");
            zzaqrVar.zzcs(calendar.get(12));
            zzaqrVar.zzus("second");
            zzaqrVar.zzcs(calendar.get(13));
            zzaqrVar.bz();
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzab */
        public Calendar zzb(zzaqp zzaqpVar) throws IOException {
            int i = 0;
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            zzaqpVar.beginObject();
            int i2 = 0;
            int i3 = 0;
            int i4 = 0;
            int i5 = 0;
            int i6 = 0;
            while (zzaqpVar.bq() != zzaqq.END_OBJECT) {
                String nextName = zzaqpVar.nextName();
                int nextInt = zzaqpVar.nextInt();
                if ("year".equals(nextName)) {
                    i6 = nextInt;
                } else if ("month".equals(nextName)) {
                    i5 = nextInt;
                } else if ("dayOfMonth".equals(nextName)) {
                    i4 = nextInt;
                } else if ("hourOfDay".equals(nextName)) {
                    i3 = nextInt;
                } else if ("minute".equals(nextName)) {
                    i2 = nextInt;
                } else if ("second".equals(nextName)) {
                    i = nextInt;
                }
            }
            zzaqpVar.endObject();
            return new GregorianCalendar(i6, i5, i4, i3, i2, i);
        }
    };
    public static final zzapl bqV = zzb(Calendar.class, GregorianCalendar.class, bqU);
    public static final zzapk<Locale> bqW = new zzapk<Locale>() { // from class: com.google.android.gms.internal.zzaqn.17
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, Locale locale) throws IOException {
            zzaqrVar.zzut(locale == null ? null : locale.toString());
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzac */
        public Locale zzb(zzaqp zzaqpVar) throws IOException {
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            StringTokenizer stringTokenizer = new StringTokenizer(zzaqpVar.nextString(), EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR);
            String nextToken = stringTokenizer.hasMoreElements() ? stringTokenizer.nextToken() : null;
            String nextToken2 = stringTokenizer.hasMoreElements() ? stringTokenizer.nextToken() : null;
            String nextToken3 = stringTokenizer.hasMoreElements() ? stringTokenizer.nextToken() : null;
            return (nextToken2 == null && nextToken3 == null) ? new Locale(nextToken) : nextToken3 == null ? new Locale(nextToken, nextToken2) : new Locale(nextToken, nextToken2, nextToken3);
        }
    };
    public static final zzapl bqX = zza(Locale.class, bqW);
    public static final zzapk<zzaoy> bqY = new zzapk<zzaoy>() { // from class: com.google.android.gms.internal.zzaqn.18
        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, zzaoy zzaoyVar) throws IOException {
            if (zzaoyVar == null || zzaoyVar.aY()) {
                zzaqrVar.bA();
            } else if (zzaoyVar.aX()) {
                zzape bb = zzaoyVar.bb();
                if (bb.be()) {
                    zzaqrVar.zza(bb.aT());
                } else if (bb.bd()) {
                    zzaqrVar.zzdh(bb.getAsBoolean());
                } else {
                    zzaqrVar.zzut(bb.aU());
                }
            } else if (zzaoyVar.aV()) {
                zzaqrVar.bw();
                Iterator<zzaoy> it = zzaoyVar.ba().iterator();
                while (it.hasNext()) {
                    zza(zzaqrVar, it.next());
                }
                zzaqrVar.bx();
            } else if (!zzaoyVar.aW()) {
                String valueOf = String.valueOf(zzaoyVar.getClass());
                throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf).length() + 15).append("Couldn't write ").append(valueOf).toString());
            } else {
                zzaqrVar.by();
                for (Map.Entry<String, zzaoy> entry : zzaoyVar.aZ().entrySet()) {
                    zzaqrVar.zzus(entry.getKey());
                    zza(zzaqrVar, entry.getValue());
                }
                zzaqrVar.bz();
            }
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzad */
        public zzaoy zzb(zzaqp zzaqpVar) throws IOException {
            switch (AnonymousClass26.bpW[zzaqpVar.bq().ordinal()]) {
                case 1:
                    return new zzape((Number) new zzapv(zzaqpVar.nextString()));
                case 2:
                    return new zzape(Boolean.valueOf(zzaqpVar.nextBoolean()));
                case 3:
                    return new zzape(zzaqpVar.nextString());
                case 4:
                    zzaqpVar.nextNull();
                    return zzapa.bou;
                case 5:
                    zzaov zzaovVar = new zzaov();
                    zzaqpVar.beginArray();
                    while (zzaqpVar.hasNext()) {
                        zzaovVar.zzc((zzaoy) zzb(zzaqpVar));
                    }
                    zzaqpVar.endArray();
                    return zzaovVar;
                case 6:
                    zzapb zzapbVar = new zzapb();
                    zzaqpVar.beginObject();
                    while (zzaqpVar.hasNext()) {
                        zzapbVar.zza(zzaqpVar.nextName(), (zzaoy) zzb(zzaqpVar));
                    }
                    zzaqpVar.endObject();
                    return zzapbVar;
                default:
                    throw new IllegalArgumentException();
            }
        }
    };
    public static final zzapl bqZ = zzb(zzaoy.class, bqY);
    public static final zzapl bra = new zzapl() { // from class: com.google.android.gms.internal.zzaqn.19
        @Override // com.google.android.gms.internal.zzapl
        public <T> zzapk<T> zza(zzaos zzaosVar, zzaqo<T> zzaqoVar) {
            Class bB = zzaqoVar.bB();
            if (!Enum.class.isAssignableFrom(bB) || bB == Enum.class) {
                return null;
            }
            if (!bB.isEnum()) {
                bB = (Class<? super Object>) bB.getSuperclass();
            }
            return new zza(bB);
        }
    };

    /* loaded from: classes2.dex */
    private static final class zza<T extends Enum<T>> extends zzapk<T> {
        private final Map<String, T> brk = new HashMap();
        private final Map<T, String> brl = new HashMap();

        public zza(Class<T> cls) {
            T[] enumConstants;
            try {
                for (T t : cls.getEnumConstants()) {
                    String name = t.name();
                    zzapn zzapnVar = (zzapn) cls.getField(name).getAnnotation(zzapn.class);
                    if (zzapnVar != null) {
                        name = zzapnVar.value();
                        String[] bh = zzapnVar.bh();
                        for (String str : bh) {
                            this.brk.put(str, t);
                        }
                    }
                    String str2 = name;
                    this.brk.put(str2, t);
                    this.brl.put(t, str2);
                }
            } catch (NoSuchFieldException e) {
                throw new AssertionError();
            }
        }

        public void zza(zzaqr zzaqrVar, T t) throws IOException {
            zzaqrVar.zzut(t == null ? null : this.brl.get(t));
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.google.android.gms.internal.zzapk
        public /* bridge */ /* synthetic */ void zza(zzaqr zzaqrVar, Object obj) throws IOException {
            zza(zzaqrVar, (zzaqr) ((Enum) obj));
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzaf */
        public T zzb(zzaqp zzaqpVar) throws IOException {
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            return this.brk.get(zzaqpVar.nextString());
        }
    }

    public static <TT> zzapl zza(final zzaqo<TT> zzaqoVar, final zzapk<TT> zzapkVar) {
        return new zzapl() { // from class: com.google.android.gms.internal.zzaqn.20
            @Override // com.google.android.gms.internal.zzapl
            public <T> zzapk<T> zza(zzaos zzaosVar, zzaqo<T> zzaqoVar2) {
                if (zzaqoVar2.equals(zzaqo.this)) {
                    return zzapkVar;
                }
                return null;
            }
        };
    }

    public static <TT> zzapl zza(final Class<TT> cls, final zzapk<TT> zzapkVar) {
        return new zzapl() { // from class: com.google.android.gms.internal.zzaqn.21
            public String toString() {
                String valueOf = String.valueOf(cls.getName());
                String valueOf2 = String.valueOf(zzapkVar);
                return new StringBuilder(String.valueOf(valueOf).length() + 23 + String.valueOf(valueOf2).length()).append("Factory[type=").append(valueOf).append(",adapter=").append(valueOf2).append("]").toString();
            }

            @Override // com.google.android.gms.internal.zzapl
            public <T> zzapk<T> zza(zzaos zzaosVar, zzaqo<T> zzaqoVar) {
                if (zzaqoVar.bB() == cls) {
                    return zzapkVar;
                }
                return null;
            }
        };
    }

    public static <TT> zzapl zza(final Class<TT> cls, final Class<TT> cls2, final zzapk<? super TT> zzapkVar) {
        return new zzapl() { // from class: com.google.android.gms.internal.zzaqn.22
            public String toString() {
                String valueOf = String.valueOf(cls2.getName());
                String valueOf2 = String.valueOf(cls.getName());
                String valueOf3 = String.valueOf(zzapkVar);
                return new StringBuilder(String.valueOf(valueOf).length() + 24 + String.valueOf(valueOf2).length() + String.valueOf(valueOf3).length()).append("Factory[type=").append(valueOf).append(Marker.ANY_NON_NULL_MARKER).append(valueOf2).append(",adapter=").append(valueOf3).append("]").toString();
            }

            @Override // com.google.android.gms.internal.zzapl
            public <T> zzapk<T> zza(zzaos zzaosVar, zzaqo<T> zzaqoVar) {
                Class<? super T> bB = zzaqoVar.bB();
                if (bB == cls || bB == cls2) {
                    return zzapkVar;
                }
                return null;
            }
        };
    }

    public static <TT> zzapl zzb(final Class<TT> cls, final zzapk<TT> zzapkVar) {
        return new zzapl() { // from class: com.google.android.gms.internal.zzaqn.25
            public String toString() {
                String valueOf = String.valueOf(cls.getName());
                String valueOf2 = String.valueOf(zzapkVar);
                return new StringBuilder(String.valueOf(valueOf).length() + 32 + String.valueOf(valueOf2).length()).append("Factory[typeHierarchy=").append(valueOf).append(",adapter=").append(valueOf2).append("]").toString();
            }

            @Override // com.google.android.gms.internal.zzapl
            public <T> zzapk<T> zza(zzaos zzaosVar, zzaqo<T> zzaqoVar) {
                if (cls.isAssignableFrom(zzaqoVar.bB())) {
                    return zzapkVar;
                }
                return null;
            }
        };
    }

    public static <TT> zzapl zzb(final Class<TT> cls, final Class<? extends TT> cls2, final zzapk<? super TT> zzapkVar) {
        return new zzapl() { // from class: com.google.android.gms.internal.zzaqn.24
            public String toString() {
                String valueOf = String.valueOf(cls.getName());
                String valueOf2 = String.valueOf(cls2.getName());
                String valueOf3 = String.valueOf(zzapkVar);
                return new StringBuilder(String.valueOf(valueOf).length() + 24 + String.valueOf(valueOf2).length() + String.valueOf(valueOf3).length()).append("Factory[type=").append(valueOf).append(Marker.ANY_NON_NULL_MARKER).append(valueOf2).append(",adapter=").append(valueOf3).append("]").toString();
            }

            @Override // com.google.android.gms.internal.zzapl
            public <T> zzapk<T> zza(zzaos zzaosVar, zzaqo<T> zzaqoVar) {
                Class<? super T> bB = zzaqoVar.bB();
                if (bB == cls || bB == cls2) {
                    return zzapkVar;
                }
                return null;
            }
        };
    }
}
