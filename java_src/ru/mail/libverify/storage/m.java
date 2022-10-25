package ru.mail.libverify.storage;

import android.content.Context;
import android.location.Location;
import android.net.Uri;
import android.os.Build;
import android.provider.Settings;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import ru.mail.libverify.fetcher.FetcherService;
import ru.mail.libverify.gcm.GcmRegisterService;
import ru.mail.libverify.requests.response.SmsInfo;
import ru.mail.libverify.sms.IncomingSmsReceiver;
import ru.mail.libverify.storage.c;
import ru.mail.libverify.utils.AlarmReceiver;
import ru.mail.libverify.utils.BatteryLevelReceiver;
import ru.mail.libverify.utils.ScreenStateReceiver;
import ru.mail.libverify.utils.SystemRestartReceiver;
import ru.mail.libverify.utils.VerificationService;
import ru.mail.libverify.utils.f;
import ru.mail.libverify.utils.json.JsonParseException;
import ru.mail.libverify.utils.network.NetworkCheckService;
import ru.mail.libverify.utils.network.NetworkStateReceiver;
/* loaded from: classes3.dex */
public final class m implements l {
    private static final HashMap<String, String> a;
    private final a b;
    private String c;
    private volatile String d;
    private volatile c e;
    private volatile Context f;
    @Nullable
    private volatile u g;
    private volatile o h;
    private volatile String i;
    private volatile String j;
    private volatile p k;
    private volatile ru.mail.libverify.accounts.d l;
    private volatile r m;
    private volatile ru.mail.libverify.accounts.b n;
    private volatile ru.mail.libverify.sms.c o;
    private volatile Locale p;
    private volatile String q;
    private volatile n r;
    private volatile Map<String, String> s;
    private volatile boolean t;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class a implements c.a {
        private a() {
        }

        /* synthetic */ a(m mVar, byte b) {
            this();
        }

        @Override // ru.mail.libverify.storage.c.a
        public final o a() {
            return m.this.z();
        }
    }

    static {
        HashMap<String, String> hashMap = new HashMap<>();
        a = hashMap;
        hashMap.put("instance_broadcast_on_demand", AppEventsConstants.EVENT_PARAM_VALUE_YES);
        a.put("instance_intercept_sms", AppEventsConstants.EVENT_PARAM_VALUE_NO);
        a.put("instance_single_fetcher", AppEventsConstants.EVENT_PARAM_VALUE_YES);
        a.put("instance_safety_net", AppEventsConstants.EVENT_PARAM_VALUE_YES);
        a.put("instance_account_check_sms", AppEventsConstants.EVENT_PARAM_VALUE_NO);
        a.put("instance_track_package", AppEventsConstants.EVENT_PARAM_VALUE_NO);
        a.put("instance_send_call_stats", AppEventsConstants.EVENT_PARAM_VALUE_YES);
        a.put("instance_update_alarms", AppEventsConstants.EVENT_PARAM_VALUE_YES);
        a.put("instance_background_verify", AppEventsConstants.EVENT_PARAM_VALUE_YES);
    }

    public m(@NonNull Context context) {
        this.b = new a(this, (byte) 0);
        this.t = false;
        this.f = context;
        this.e = new t(this.b);
    }

    public m(@NonNull Context context, @NonNull String str, @NonNull String str2) {
        this.b = new a(this, (byte) 0);
        this.t = false;
        this.f = context;
        this.e = new f(this.b, str, str2);
    }

    public static String N() {
        return "297109036349";
    }

    private r O() {
        if (this.m == null) {
            synchronized (this) {
                if (this.m == null) {
                    this.m = new r(z());
                }
            }
        }
        return this.m;
    }

    private void P() {
        if (this.e == null) {
            throw new IllegalStateException("param field must be initialized");
        }
    }

    @NonNull
    private Map<String, String> Q() {
        Map<String, String> map = this.s;
        if (map != null) {
            return map;
        }
        String a2 = z().a("instance_api_endpoints");
        if (this.s == null) {
            synchronized (this) {
                if (this.s == null) {
                    try {
                        if (TextUtils.isEmpty(a2)) {
                            this.s = new HashMap();
                        } else {
                            this.s = ru.mail.libverify.utils.json.a.c(a2, String.class);
                        }
                    } catch (JsonParseException e) {
                        ru.mail.libverify.utils.d.a("InstanceData", "failed to restore api endpoints", e);
                        z().d("instance_api_endpoints").a();
                        this.s = new HashMap();
                    }
                }
            }
        }
        return this.s;
    }

    @Nullable
    private String R() {
        AdvertisingIdClient.Info advertisingIdInfo;
        ru.mail.libverify.utils.d.c("InstanceData", "getAdvertisingId - query android id");
        try {
            advertisingIdInfo = AdvertisingIdClient.getAdvertisingIdInfo(this.f);
        } catch (GooglePlayServicesNotAvailableException e) {
            ru.mail.libverify.utils.d.a("InstanceData", "getAdvertisingId - Google Play services is not available entirely", e);
        } catch (GooglePlayServicesRepairableException e2) {
            ru.mail.libverify.utils.d.a("InstanceData", "getAdvertisingId - error", e2);
        } catch (IOException e3) {
            ru.mail.libverify.utils.d.a("InstanceData", "getAdvertisingId - Unrecoverable error connecting to Google Play services (e.g.,\nthe old version of the service doesn't support getting AdvertisingId)", e3);
        } catch (Exception e4) {
            ru.mail.libverify.utils.d.a("InstanceData", "getAdvertisingId - unknown error", e4);
        }
        if (advertisingIdInfo.isLimitAdTrackingEnabled()) {
            ru.mail.libverify.utils.d.b("InstanceData", "getAdvertisingId - Google Play AdvertisingId usage blocked by a user");
            return null;
        } else if (TextUtils.isEmpty(advertisingIdInfo.getId())) {
            return z().a("instance_advertising_id");
        } else {
            z().a("instance_advertising_id", advertisingIdInfo.getId()).a();
            return advertisingIdInfo.getId();
        }
    }

    private void a(@NonNull String str, @Nullable Boolean bool) {
        if (bool == null) {
            return;
        }
        if (bool.booleanValue()) {
            z().a(str, AppEventsConstants.EVENT_PARAM_VALUE_YES);
        } else {
            z().a(str, AppEventsConstants.EVENT_PARAM_VALUE_NO);
        }
        a(str, bool.booleanValue());
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    private void a(@NonNull String str, boolean z) {
        char c;
        switch (str.hashCode()) {
            case -1121254165:
                if (str.equals("instance_send_call_stats")) {
                    c = '\b';
                    break;
                }
                c = 65535;
                break;
            case -867566589:
                if (str.equals("instance_broadcast_on_demand")) {
                    c = 0;
                    break;
                }
                c = 65535;
                break;
            case -565591910:
                if (str.equals("instance_safety_net")) {
                    c = 5;
                    break;
                }
                c = 65535;
                break;
            case 179899982:
                if (str.equals("instance_update_alarms")) {
                    c = 2;
                    break;
                }
                c = 65535;
                break;
            case 682306778:
                if (str.equals("instance_single_fetcher")) {
                    c = 4;
                    break;
                }
                c = 65535;
                break;
            case 849252136:
                if (str.equals("instance_track_package")) {
                    c = 7;
                    break;
                }
                c = 65535;
                break;
            case 1102840704:
                if (str.equals("instance_background_verify")) {
                    c = 3;
                    break;
                }
                c = 65535;
                break;
            case 1271208498:
                if (str.equals("instance_intercept_sms")) {
                    c = 1;
                    break;
                }
                c = 65535;
                break;
            case 1880219878:
                if (str.equals("instance_account_check_sms")) {
                    c = 6;
                    break;
                }
                c = 65535;
                break;
            default:
                c = 65535;
                break;
        }
        switch (c) {
            case 0:
                if (z) {
                    e.a(this.f, this);
                    return;
                } else {
                    e.a(this.f, this, -1);
                    return;
                }
            case 1:
                if (z) {
                    if (!c("instance_broadcast_on_demand")) {
                        return;
                    }
                    e.a(this.f, IncomingSmsReceiver.class, 4);
                    return;
                } else if (!c("instance_broadcast_on_demand")) {
                    return;
                } else {
                    e.a(this.f, IncomingSmsReceiver.class);
                    return;
                }
            case 2:
                if (z) {
                    if (!c("instance_broadcast_on_demand")) {
                        return;
                    }
                    e.a(this.f, SystemRestartReceiver.class, 32);
                    return;
                } else if (!c("instance_broadcast_on_demand")) {
                    return;
                } else {
                    e.a(this.f, SystemRestartReceiver.class);
                    return;
                }
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case '\b':
                return;
            default:
                throw new IllegalArgumentException();
        }
    }

    public static boolean a(@NonNull Context context) {
        return i.b(context);
    }

    public static boolean a(@NonNull Context context, @NonNull String str) {
        SmsInfo b;
        if (TextUtils.isEmpty(str) || (b = s.b(context)) == null || b.getSourceNumbers() == null) {
            return false;
        }
        return b.getSourceNumbers().contains(str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean c(@NonNull String str) {
        String a2 = z().a(str);
        return a2 == null ? TextUtils.equals(a.get(str), AppEventsConstants.EVENT_PARAM_VALUE_YES) : TextUtils.equals(a2, AppEventsConstants.EVENT_PARAM_VALUE_YES);
    }

    @Override // ru.mail.libverify.storage.l
    public final void A() {
        ru.mail.libverify.utils.d.c("InstanceData", "prepare internal members");
        ScreenStateReceiver.a(this.f);
        i.a(this.f);
        g();
        h();
        n();
        b();
        O().a();
        for (String str : a.keySet()) {
            a(str, c(str));
        }
        ru.mail.libverify.utils.d.c("InstanceData", "current features:\n %s", null);
    }

    @Override // ru.mail.libverify.storage.l
    public final void B() {
        GcmRegisterService.a(z());
    }

    @Override // ru.mail.libverify.storage.l
    public final boolean C() {
        return GcmRegisterService.a(this.f, z());
    }

    @Override // ru.mail.libverify.storage.l
    public final void D() {
        AlarmReceiver.b(this.f);
    }

    @Override // ru.mail.libverify.storage.l
    public final void E() {
        AlarmReceiver.e(this.f);
    }

    @Override // ru.mail.libverify.storage.l
    public final void F() {
        AlarmReceiver.a(this.f);
    }

    @Override // ru.mail.libverify.storage.l
    @NonNull
    public final k G() {
        return new h(this);
    }

    @Override // ru.mail.libverify.storage.l
    public final void H() {
        VerificationService.a();
    }

    @Override // ru.mail.libverify.storage.l
    public final void I() {
        if (c("instance_broadcast_on_demand")) {
            e.a(this.f, FetcherService.class, 56);
        }
        FetcherService.a(this.f);
    }

    @Override // ru.mail.libverify.storage.l
    public final void J() {
        NetworkCheckService.a(this.f);
    }

    @Override // ru.mail.libverify.storage.l
    @NonNull
    public final n K() {
        if (this.r == null) {
            synchronized (this) {
                if (this.r == null) {
                    this.r = new n() { // from class: ru.mail.libverify.storage.m.1
                        @Override // ru.mail.libverify.storage.n
                        public final Boolean accountCheckWithSms() {
                            return Boolean.valueOf(m.this.c("instance_account_check_sms"));
                        }

                        @Override // ru.mail.libverify.storage.n
                        public final Boolean backgroundVerify() {
                            return Boolean.valueOf(m.this.c("instance_background_verify"));
                        }

                        @Override // ru.mail.libverify.storage.n
                        public final Boolean broadcastOnDemand() {
                            return Boolean.valueOf(m.this.c("instance_broadcast_on_demand"));
                        }

                        @Override // ru.mail.libverify.storage.n
                        public final Boolean interceptAlienSms() {
                            return Boolean.valueOf(m.this.c("instance_intercept_sms"));
                        }

                        @Override // ru.mail.libverify.storage.n
                        public final Boolean sendCallStats() {
                            return Boolean.valueOf(m.this.c("instance_send_call_stats"));
                        }

                        @Override // ru.mail.libverify.storage.n
                        public final Boolean singleFetcher() {
                            return Boolean.valueOf(m.this.c("instance_single_fetcher"));
                        }

                        @Override // ru.mail.libverify.storage.n
                        public final Boolean trackPackageUpdate() {
                            return Boolean.valueOf(m.this.c("instance_track_package"));
                        }

                        @Override // ru.mail.libverify.storage.n
                        public final Boolean updateAlarms() {
                            return Boolean.valueOf(m.this.c("instance_update_alarms"));
                        }

                        @Override // ru.mail.libverify.storage.n
                        public final Boolean useSafetyNet() {
                            return Boolean.valueOf(m.this.c("instance_safety_net"));
                        }
                    };
                }
            }
        }
        return this.r;
    }

    @Override // ru.mail.libverify.storage.l
    @Nullable
    public final SmsInfo L() {
        return s.b(this.f);
    }

    @Override // ru.mail.libverify.storage.l
    public final boolean M() {
        return s.a(this.f);
    }

    @Override // ru.mail.libverify.storage.k
    public final String a() {
        P();
        return this.e.a();
    }

    @Override // ru.mail.libverify.storage.k
    public final String a(@NonNull String str, @NonNull String str2) {
        return O().a(str, str2);
    }

    @Override // ru.mail.libverify.storage.k
    public final ru.mail.libverify.utils.a a(@NonNull String str) {
        String str2;
        try {
            Map<String, String> Q = Q();
            if (!Q.isEmpty()) {
                str2 = str;
                for (Map.Entry<String, String> entry : Q.entrySet()) {
                    try {
                        str2 = (TextUtils.isEmpty(entry.getKey()) || TextUtils.isEmpty(entry.getValue())) ? str2 : str2.replace(entry.getKey(), entry.getValue());
                    } catch (Exception e) {
                        e = e;
                        ru.mail.libverify.utils.d.a("InstanceData", e, "failed to replace token in url %s", str2);
                        return new f.a(str2, (byte) 0);
                    }
                }
            } else {
                str2 = str;
            }
        } catch (Exception e2) {
            e = e2;
            str2 = str;
        }
        return new f.a(str2, (byte) 0);
    }

    @Override // ru.mail.libverify.storage.l
    public final void a(int i) {
        AlarmReceiver.a(this.f, i);
    }

    public final void a(@NonNull Context context, @NonNull String str, @NonNull String str2) {
        this.f = context;
        this.e = new f(this.b, str, str2);
        u uVar = this.g;
        if (uVar != null) {
            uVar.a();
        }
    }

    @Override // ru.mail.libverify.storage.l
    public final void a(@NonNull Object obj) {
        VerificationService.a(obj);
        if (c("instance_broadcast_on_demand")) {
            e.a(this.f, obj);
        }
    }

    @Override // ru.mail.libverify.storage.l
    public final void a(@NonNull Object obj, boolean z, int i) {
        VerificationService.a(this.f, obj, z);
        if (c("instance_broadcast_on_demand")) {
            e.a(this.f, obj, i);
        }
    }

    @Override // ru.mail.libverify.storage.l
    public final void a(@NonNull String str, int i) {
        AlarmReceiver.a(this.f, str, i);
    }

    @Override // ru.mail.libverify.storage.l
    public final void a(@NonNull Locale locale) {
        this.p = locale;
        z().a("instance_custom_locale", ru.mail.libverify.utils.m.a(locale)).a();
    }

    @Override // ru.mail.libverify.storage.l
    public final void a(@Nullable SmsInfo smsInfo) {
        s.a(this.f, smsInfo);
    }

    @Override // ru.mail.libverify.storage.l
    public final void a(@NonNull n nVar) {
        a("instance_broadcast_on_demand", nVar.broadcastOnDemand());
        a("instance_intercept_sms", nVar.interceptAlienSms());
        a("instance_single_fetcher", nVar.singleFetcher());
        a("instance_safety_net", nVar.useSafetyNet());
        a("instance_account_check_sms", nVar.accountCheckWithSms());
        a("instance_track_package", nVar.trackPackageUpdate());
        a("instance_send_call_stats", nVar.sendCallStats());
        a("instance_update_alarms", nVar.updateAlarms());
        a("instance_background_verify", nVar.backgroundVerify());
        ru.mail.libverify.utils.d.c("InstanceData", "instance features changed:\n %s", null);
        z().a();
    }

    @Override // ru.mail.libverify.storage.l
    public final void a(@Nullable u uVar) {
        this.g = uVar;
    }

    @Override // ru.mail.libverify.storage.l
    public final void a(boolean z) {
        if (z) {
            z().d("instance_block_location").a();
        } else {
            z().a("instance_block_location", Boolean.TRUE.toString()).a();
        }
    }

    @Override // ru.mail.libverify.storage.l
    public final boolean a(@NonNull Map<String, String> map) {
        try {
            HashMap hashMap = new HashMap();
            String[] split = "https://clientapi.mail.ru/".split(";");
            if (split.length == 0) {
                throw new IllegalArgumentException("At least one api host must be provided");
            }
            for (String str : split) {
                String host = Uri.parse(str).getHost();
                if (TextUtils.isEmpty(host)) {
                    throw new IllegalArgumentException("Host name must be non empty");
                }
                String str2 = map.get(host);
                if (!TextUtils.isEmpty(str2) && !TextUtils.equals(host, str2)) {
                    hashMap.put(host, str2);
                }
            }
            if (!hashMap.isEmpty()) {
                ru.mail.libverify.utils.d.b("InstanceData", "set api endpoints %s", hashMap);
                this.s = hashMap;
                z().a("instance_api_endpoints", ru.mail.libverify.utils.json.a.a(hashMap)).a();
                return true;
            }
            ru.mail.libverify.utils.d.b("InstanceData", "reset api endpoints");
            this.s = new HashMap();
            z().d("instance_api_endpoints").a();
            return false;
        } catch (Exception e) {
            ru.mail.libverify.utils.d.a("InstanceData", "failed to set api endpoints", e);
            return false;
        }
    }

    @Override // ru.mail.libverify.storage.k
    public final String b() {
        P();
        return this.e.b();
    }

    @Override // ru.mail.libverify.storage.l
    public final void b(boolean z) {
        if (c("instance_broadcast_on_demand") && z) {
            e.a(this.f, FetcherService.class);
        }
        FetcherService.b(this.f);
    }

    @Override // ru.mail.libverify.storage.k
    public final boolean b(@Nullable String str) {
        return ru.mail.libverify.utils.j.a(this.f, str);
    }

    @Override // ru.mail.libverify.storage.k
    public final String c() {
        if (this.c == null) {
            this.c = Integer.toString(ru.mail.libverify.utils.m.a(this.f));
        }
        return this.c;
    }

    @Override // ru.mail.libverify.storage.k
    public final Context d() {
        return this.f;
    }

    @Override // ru.mail.libverify.storage.k
    public final String e() {
        return i.a(this.f);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        m mVar = (m) obj;
        if (!this.e.equals(mVar.e)) {
            return false;
        }
        return this.f.equals(mVar.f);
    }

    @Override // ru.mail.libverify.storage.k
    public final String f() {
        if (this.d == null) {
            synchronized (this) {
                if (this.d == null) {
                    this.d = ru.mail.libverify.utils.m.a(i.a(this.f));
                }
            }
        }
        return this.d;
    }

    @Override // ru.mail.libverify.storage.k
    public final String g() {
        if (this.i == null) {
            synchronized (this) {
                if (this.i == null) {
                    this.i = R();
                }
            }
        }
        return this.i;
    }

    @Override // ru.mail.libverify.storage.k
    public final String h() {
        if (this.j == null) {
            synchronized (this) {
                if (this.j == null) {
                    String string = Settings.Secure.getString(this.f.getContentResolver(), "android_id");
                    if (TextUtils.isEmpty(string)) {
                        string = System.getProperty("ro.serialno");
                    }
                    this.j = string;
                }
            }
        }
        return this.j;
    }

    public final int hashCode() {
        return (this.e.hashCode() * 31) + this.f.hashCode();
    }

    @Override // ru.mail.libverify.storage.k
    public final ru.mail.libverify.utils.k i() {
        return ScreenStateReceiver.b(this.f);
    }

    @Override // ru.mail.libverify.storage.k
    public final boolean j() {
        return NetworkStateReceiver.a(this.f);
    }

    @Override // ru.mail.libverify.storage.k
    public final boolean k() {
        return ru.mail.libverify.utils.m.c(this.f);
    }

    @Override // ru.mail.libverify.storage.k
    public final boolean l() {
        return BatteryLevelReceiver.a();
    }

    @Override // ru.mail.libverify.storage.k
    public final void m() {
        NetworkStateReceiver.b(this.f);
    }

    @Override // ru.mail.libverify.storage.k
    public final Location n() {
        if (!TextUtils.isEmpty(z().a("instance_block_location"))) {
            return null;
        }
        if (this.k == null) {
            synchronized (this) {
                if (this.k == null) {
                    this.k = new p(this.f);
                }
            }
        }
        return this.k.a();
    }

    @Override // ru.mail.libverify.storage.k
    public final String o() {
        return GcmRegisterService.b(this.f, z());
    }

    @Override // ru.mail.libverify.storage.k
    public final ru.mail.libverify.accounts.d p() {
        if (this.l == null) {
            synchronized (this) {
                if (this.l == null) {
                    ru.mail.libverify.utils.d.c("InstanceData", "sim card read start");
                    ru.mail.libverify.accounts.d a2 = ru.mail.libverify.accounts.f.a(this.f);
                    ru.mail.libverify.utils.d.c("InstanceData", "sim card read result %s", Boolean.valueOf(a2.l()));
                    if (!a2.l()) {
                        return a2;
                    }
                    this.l = a2;
                }
            }
        }
        return this.l;
    }

    @Override // ru.mail.libverify.storage.k
    public final ru.mail.libverify.accounts.b q() {
        if (this.n == null) {
            synchronized (this) {
                if (this.n == null) {
                    this.n = new ru.mail.libverify.accounts.c(this.f);
                }
            }
        }
        return this.n;
    }

    @Override // ru.mail.libverify.storage.k
    public final ru.mail.libverify.sms.c r() {
        if (this.o == null) {
            synchronized (this) {
                if (this.o == null) {
                    this.o = new ru.mail.libverify.sms.d(this.f);
                }
            }
        }
        return this.o;
    }

    @Override // ru.mail.libverify.storage.k
    public final String s() {
        return u().getLanguage();
    }

    @Override // ru.mail.libverify.storage.k
    public final String t() {
        return ru.mail.libverify.utils.m.a(u());
    }

    public final String toString() {
        return "InstanceData{application=" + a() + ", version='" + c() + "'}";
    }

    @Override // ru.mail.libverify.storage.k
    public final Locale u() {
        String substring;
        String str;
        Locale locale;
        if (this.p == null && !this.t) {
            synchronized (this) {
                if (this.p == null) {
                    String a2 = z().a("instance_custom_locale");
                    if (!TextUtils.isEmpty(a2)) {
                        if (TextUtils.isEmpty(a2)) {
                            locale = Locale.getDefault();
                        } else {
                            int indexOf = a2.indexOf(95);
                            if (indexOf < 0) {
                                str = a2;
                                substring = "";
                            } else {
                                String substring2 = a2.substring(0, indexOf);
                                substring = a2.substring(indexOf + 1);
                                str = substring2;
                            }
                            locale = new Locale(str.length() == 2 ? str.toLowerCase(Locale.US) : "", substring.length() == 2 ? substring.toUpperCase(Locale.US) : "");
                        }
                        this.p = locale;
                    }
                }
                this.t = true;
            }
        }
        return this.p == null ? Locale.getDefault() : this.p;
    }

    @Override // ru.mail.libverify.storage.k
    public final String v() {
        return O().a();
    }

    @Override // ru.mail.libverify.storage.k
    public final String w() {
        String str = Build.MANUFACTURER;
        String str2 = Build.MODEL;
        return str2.startsWith(str) ? ru.mail.libverify.utils.m.f(str2) : str.equalsIgnoreCase("HTC") ? "HTC " + str2 : ru.mail.libverify.utils.m.f(str) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + str2;
    }

    @Override // ru.mail.libverify.storage.k
    public final String x() {
        if (!c("instance_send_call_stats")) {
            return null;
        }
        if (this.q == null) {
            synchronized (this) {
                if (this.q == null) {
                    this.q = g.a(this);
                }
            }
        }
        return this.q;
    }

    @Override // ru.mail.libverify.storage.l
    public final void y() {
        synchronized (this) {
            this.d = null;
        }
        i.c(this.f);
        O().b();
    }

    @Override // ru.mail.libverify.storage.l
    @NonNull
    public final o z() {
        if (this.h == null) {
            synchronized (this) {
                if (this.h == null) {
                    this.h = new q(this.f);
                }
            }
        }
        return this.h;
    }
}
