package ru.mail.libverify.requests;

import android.location.Location;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.facebook.internal.ServerProtocol;
import com.google.android.exoplayer2.util.MimeTypes;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
import io.sentry.marshaller.json.JsonMarshaller;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import javax.net.ssl.SSLException;
import ru.mail.libverify.requests.i;
import ru.mail.libverify.requests.response.ClientApiResponseBase;
import ru.mail.libverify.utils.ClientException;
import ru.mail.libverify.utils.e;
import ru.mail.libverify.utils.json.JsonParseException;
/* loaded from: classes3.dex */
public abstract class e<T extends ClientApiResponseBase> {
    private static final String[] b = "https://clientapi.mail.ru/".split(";");
    private static final String[] c = "clientapi_mail_ru".split(";");
    private static int d = 0;
    private static SimpleDateFormat e;
    protected final ru.mail.libverify.storage.k a;
    private String f;
    private Long g;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static class a extends TreeMap<String, String> {
        int a = 0;

        /* JADX INFO: Access modifiers changed from: package-private */
        public a() {
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public a(String str) {
            for (String str2 : str.split("&")) {
                String[] split = str2.split("=");
                put(split[0], split[1]);
            }
        }

        @Override // java.util.TreeMap, java.util.AbstractMap, java.util.Map
        /* renamed from: a */
        public final String put(String str, String str2) {
            if (str == null || str2 == null) {
                throw new IllegalArgumentException(String.format("Wrong request params key = %s, value = %s", str, str2));
            }
            this.a += str.length() + str2.length() + 2;
            return (String) super.put(str, str2);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public e(@NonNull ru.mail.libverify.storage.k kVar) {
        this.a = kVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public T a(@NonNull ru.mail.libverify.utils.e eVar) {
        try {
            if (r()) {
                String a2 = eVar.a("Last-Modified");
                if (!TextUtils.isEmpty(a2)) {
                    try {
                        this.g = Long.valueOf(x().parse(a2).getTime());
                        ru.mail.libverify.utils.d.c("ClientApiRequest", "header %s value %s (%d)", "Last-Modified", a2, this.g);
                    } catch (ParseException e2) {
                        ru.mail.libverify.utils.c.a("ClientApiRequest", "failed to parse last modified timestamp from the response", e2);
                    }
                }
            }
            T a3 = a(eVar.a());
            if (a3 == null) {
                throw new JsonParseException("Response can't be null");
            }
            a3.setOwner(this);
            return a3;
        } catch (SSLException e3) {
            if (!t()) {
                throw e3;
            }
            ru.mail.libverify.utils.d.a("ClientApiRequest", "failed to validate pinned certificate", e3);
            throw new ClientException(e3);
        }
    }

    private static void a(StringBuilder sb, Map.Entry<String, String> entry) {
        if (TextUtils.isEmpty(entry.getValue())) {
            throw new IllegalArgumentException(String.format(Locale.US, "Url argument %s can't be empty", entry.getKey()));
        }
        if (!TextUtils.isEmpty(sb)) {
            sb.append("&");
        }
        sb.append(entry.getKey()).append("=").append(URLEncoder.encode(entry.getValue(), "UTF-8"));
    }

    public static void i() {
        if (b.length == 1) {
            return;
        }
        synchronized (e.class) {
            d = 0;
            ru.mail.libverify.utils.d.b("ClientApiRequest", "reset api host to %d", Integer.valueOf(d));
        }
    }

    private String v() {
        ru.mail.libverify.utils.d.c("ClientApiRequest", "buildRequestUrlUnsigned start");
        a a2 = a();
        StringBuilder sb = new StringBuilder(a2.a);
        for (Map.Entry<String, String> entry : a2.entrySet()) {
            a(sb, entry);
        }
        String format = String.format(Locale.US, "%s%s?%s", d(), e(), sb);
        sb.setLength(0);
        ru.mail.libverify.utils.d.c("ClientApiRequest", "buildRequestUrlUnsigned end");
        return format;
    }

    private static String w() {
        String str;
        if (c.length == 0) {
            throw new IllegalArgumentException("Wrong api certificate config");
        }
        if (c.length == 1) {
            return c[0];
        }
        synchronized (e.class) {
            if (d >= c.length) {
                throw new IllegalArgumentException("Wrong api certificate config");
            }
            str = c[d];
        }
        return str;
    }

    private static SimpleDateFormat x() {
        if (e == null) {
            synchronized (e.class) {
                if (e == null) {
                    e = new SimpleDateFormat("EEE, dd MMM y HH:mm:ss 'GMT'", Locale.US);
                    e.setTimeZone(TimeZone.getTimeZone("GMT"));
                }
            }
        }
        return e;
    }

    @NonNull
    public final Future<T> a(@NonNull ExecutorService executorService, @Nullable i.b<T> bVar) {
        return new i(executorService, new Callable<T>() { // from class: ru.mail.libverify.requests.e.1
            @Override // java.util.concurrent.Callable
            public final /* synthetic */ Object call() {
                return e.this.k();
            }
        }, null, bVar).a();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public a a() {
        a aVar = new a();
        if (b() && this.a.p() != null) {
            ru.mail.libverify.accounts.d p = this.a.p();
            String i = p.i();
            String j = p.j();
            String b2 = p.b();
            String f = p.f();
            String c2 = p.c();
            String d2 = p.d();
            String e2 = p.e();
            if (!TextUtils.isEmpty(f)) {
                aVar.put("imei", f);
            }
            if (!TextUtils.isEmpty(b2)) {
                aVar.put("imsi", b2);
            }
            if (!TextUtils.isEmpty(j)) {
                aVar.put("iso_country_code", j);
            }
            if (!TextUtils.isEmpty(i)) {
                aVar.put("sim_phone", i);
            }
            if (!TextUtils.isEmpty(c2)) {
                aVar.put("sim_state", c2);
            }
            if (!TextUtils.isEmpty(d2)) {
                aVar.put("sim_operator", d2);
            }
            if (!TextUtils.isEmpty(e2)) {
                aVar.put("sim_operator_name", e2);
            }
        }
        aVar.put(ServerProtocol.FALLBACK_DIALOG_PARAM_VERSION, this.a.c());
        aVar.put(MimeTypes.BASE_TYPE_APPLICATION, this.a.a());
        aVar.put(JsonMarshaller.PLATFORM, AbstractSpiCall.ANDROID_CLIENT_TYPE);
        aVar.put("application_id", this.a.e());
        String g = this.a.g();
        if (!TextUtils.isEmpty(g)) {
            aVar.put("device_id", g);
        }
        String h = this.a.h();
        if (!TextUtils.isEmpty(h)) {
            aVar.put("system_id", h);
        }
        return aVar;
    }

    protected abstract T a(String str);

    /* JADX INFO: Access modifiers changed from: protected */
    public final void a(@NonNull a aVar) {
        Location n = this.a.n();
        if (n != null) {
            aVar.put("location_lat", Double.toString(n.getLatitude()));
            aVar.put("location_lon", Double.toString(n.getLongitude()));
            aVar.put("location_accuracy", Double.toString(n.getAccuracy()));
        }
    }

    protected abstract boolean b();

    public abstract m c();

    protected String d() {
        String str;
        if (b.length == 0) {
            throw new IllegalArgumentException("Wrong api host config");
        }
        if (b.length == 1) {
            return b[0];
        }
        synchronized (e.class) {
            if (d >= b.length) {
                throw new IllegalArgumentException("Wrong api host config");
            }
            str = b[d];
        }
        return str;
    }

    protected String e() {
        return String.format(Locale.US, "%s/%s", "fcgi-bin", f());
    }

    protected abstract String f();

    protected abstract l g();

    public final boolean h() {
        boolean z = false;
        if (b.length == 0) {
            throw new IllegalArgumentException("Wrong api host config");
        }
        if (b.length != 1) {
            synchronized (e.class) {
                if (d != b.length - 1) {
                    if (this.f.contains(b[d])) {
                        int i = d;
                        d++;
                        ru.mail.libverify.utils.d.b("ClientApiRequest", "switch api host from %s to %s", b[i], b[d]);
                        z = true;
                    }
                }
            }
        }
        return z;
    }

    @NonNull
    public final String j() {
        l g = g();
        if (g == null || TextUtils.isEmpty(g.a())) {
            throw new IllegalArgumentException("Request id can't be empty");
        }
        return String.format(Locale.US, "%s_%s", f(), g.a());
    }

    @NonNull
    public final T k() {
        return a(u());
    }

    @NonNull
    public final String l() {
        return f();
    }

    @Nullable
    public final Long m() {
        if (!r()) {
            return null;
        }
        return this.g;
    }

    protected boolean n() {
        return true;
    }

    protected Integer o() {
        return null;
    }

    protected Integer p() {
        return null;
    }

    protected Long q() {
        return null;
    }

    protected boolean r() {
        return false;
    }

    protected boolean s() {
        return false;
    }

    protected boolean t() {
        return false;
    }

    public final ru.mail.libverify.utils.e u() {
        if (this.f == null || !this.f.contains(d())) {
            if (n()) {
                ru.mail.libverify.utils.d.c("ClientApiRequest", "buildRequestUrlSigned start");
                a a2 = a();
                StringBuilder sb = new StringBuilder(a2.a);
                StringBuilder sb2 = new StringBuilder(a2.a);
                TreeSet<String> treeSet = new TreeSet();
                for (Map.Entry<String, String> entry : a2.entrySet()) {
                    a(sb, entry);
                    treeSet.add(entry.getKey() + URLEncoder.encode(entry.getValue(), "UTF-8"));
                }
                for (String str : treeSet) {
                    sb2.append(str);
                }
                String format = String.format(Locale.US, "%s%s?%s&signature=%s", d(), e(), sb.toString(), URLEncoder.encode(ru.mail.libverify.utils.m.b(f() + sb2.toString() + ru.mail.libverify.utils.m.c(this.a.b())), "UTF-8"));
                sb.setLength(0);
                sb2.setLength(0);
                ru.mail.libverify.utils.d.c("ClientApiRequest", "buildRequestUrlSigned end");
                this.f = format;
            } else {
                this.f = v();
            }
        }
        String str2 = this.f;
        String str3 = null;
        if (s()) {
            String[] split = str2.split("\\?");
            if (split.length == 2) {
                str2 = split[0];
                str3 = split[1];
            }
        }
        ru.mail.libverify.utils.a a3 = this.a.a(str2).a();
        if (t()) {
            a3.a(ru.mail.libverify.utils.m.c(this.a.d(), w()).getSocketFactory());
        }
        if (this.a.k()) {
            ru.mail.libverify.utils.d.c("ClientApiRequest", "keep-alive disabled because of proxy config");
            a3.a(false);
        } else {
            a3.a(true);
        }
        if (s()) {
            a3.a(e.a.b).a(str3);
        } else {
            a3.a(e.a.a);
        }
        if (o() != null) {
            a3.c(o().intValue());
        }
        if (p() != null) {
            a3.b(p().intValue());
        }
        if (q() != null) {
            a3.a("If-Modified-Since", x().format(new Date(q().longValue())));
        }
        return a3.b();
    }
}
