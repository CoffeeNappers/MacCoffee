package com.my.tracker.providers;

import android.content.Context;
import android.net.wifi.ScanResult;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Looper;
import android.telephony.CellLocation;
import android.telephony.TelephonyManager;
import android.telephony.gsm.GsmCellLocation;
import android.text.TextUtils;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
/* compiled from: EnvironmentParamsDataProvider.java */
/* loaded from: classes2.dex */
public final class d extends com.my.tracker.providers.a {
    private C0238d a;
    private b c;
    private boolean d = true;
    private ArrayList<C0238d> b = new ArrayList<>();

    /* compiled from: EnvironmentParamsDataProvider.java */
    /* renamed from: com.my.tracker.providers.d$d  reason: collision with other inner class name */
    /* loaded from: classes2.dex */
    public static class C0238d {
        public String a;
        public String b;
        public int c;
        public int d;
        public int e;
        public int f;
    }

    public final void a(boolean z) {
        this.d = z;
    }

    public final synchronized void b(Context context) {
        int i;
        if (!this.d) {
            this.c = null;
            this.a = null;
            this.b.clear();
        } else if (Looper.myLooper() == Looper.getMainLooper()) {
            com.my.tracker.a.a("DeviceParamsDataProvider: You must not call collectData method from main thread");
        } else {
            if (com.my.tracker.utils.d.a("android.permission.ACCESS_WIFI_STATE", context)) {
                c cVar = new c(context);
                this.b.clear();
                this.a = null;
                if (cVar.a != null) {
                    WifiInfo wifiInfo = cVar.a;
                    String bssid = wifiInfo.getBSSID();
                    String str = bssid == null ? "" : bssid;
                    int linkSpeed = wifiInfo.getLinkSpeed();
                    int networkId = wifiInfo.getNetworkId();
                    int rssi = wifiInfo.getRssi();
                    String ssid = wifiInfo.getSSID();
                    if (ssid == null) {
                        ssid = "";
                    }
                    this.a = new C0238d();
                    this.a.a = ssid;
                    this.a.b = str;
                    this.a.c = rssi;
                    this.a.d = networkId;
                    this.a.e = linkSpeed;
                    com.my.tracker.a.a("current wifi: " + str + "," + ssid + "," + rssi + "," + networkId + "," + linkSpeed);
                }
                if (cVar.b != null) {
                    int i2 = 1;
                    for (ScanResult scanResult : cVar.b) {
                        if (i2 < 6) {
                            com.my.tracker.a.a(new StringBuilder().append(scanResult.level).toString());
                            String str2 = scanResult.BSSID;
                            String str3 = str2 == null ? "" : str2;
                            String str4 = scanResult.SSID;
                            if (str4 == null) {
                                str4 = "";
                            }
                            C0238d c0238d = new C0238d();
                            c0238d.a = str4;
                            c0238d.b = str3;
                            c0238d.f = scanResult.level;
                            this.b.add(c0238d);
                            com.my.tracker.a.a("wifi" + i2 + ": " + str3 + "," + str4 + "," + scanResult.level);
                            i = i2 + 1;
                        } else {
                            i = i2;
                        }
                        i2 = i;
                    }
                }
            }
            if (com.my.tracker.utils.d.a("android.permission.ACCESS_COARSE_LOCATION", context)) {
                this.c = null;
                a aVar = new a(context);
                if (aVar.a != null) {
                    this.c = new b("gsm");
                    this.c.b = aVar.a.getCid();
                    this.c.c = aVar.a.getLac();
                    if (!TextUtils.isEmpty(aVar.b)) {
                        try {
                            this.c.e = Integer.parseInt(aVar.b.substring(0, 3));
                            this.c.f = Integer.parseInt(aVar.b.substring(3));
                        } catch (Exception e) {
                        }
                    }
                    com.my.tracker.a.a("current cell: " + this.c.b + "," + this.c.c + "," + this.c.e + "," + this.c.f);
                }
            }
        }
    }

    /* compiled from: EnvironmentParamsDataProvider.java */
    /* loaded from: classes2.dex */
    private static class c {
        public WifiInfo a;
        public List<ScanResult> b;

        public c(Context context) {
            try {
                WifiManager wifiManager = (WifiManager) context.getSystemService("wifi");
                if (wifiManager.isWifiEnabled()) {
                    this.a = wifiManager.getConnectionInfo();
                    if (d.c(context)) {
                        this.b = wifiManager.getScanResults();
                    }
                    if (this.b != null) {
                        Collections.sort(this.b, new Comparator<ScanResult>() { // from class: com.my.tracker.providers.d.c.1
                            @Override // java.util.Comparator
                            public final /* bridge */ /* synthetic */ int compare(ScanResult scanResult, ScanResult scanResult2) {
                                ScanResult scanResult3 = scanResult;
                                ScanResult scanResult4 = scanResult2;
                                if (scanResult3.level < scanResult4.level) {
                                    return 1;
                                }
                                return scanResult3.level > scanResult4.level ? -1 : 0;
                            }
                        });
                    }
                }
            } catch (SecurityException e) {
                com.my.tracker.a.a("Permission android.permission.ACCESS_WIFI_STATE check was positive, but still got security exception on the wifi provider");
            }
        }
    }

    /* compiled from: EnvironmentParamsDataProvider.java */
    /* loaded from: classes2.dex */
    private static class a {
        public GsmCellLocation a;
        public String b;

        public a(Context context) {
            TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService(SignupPhoneFragment.KEY_PHONE);
            try {
                CellLocation cellLocation = d.c(context) ? telephonyManager.getCellLocation() : null;
                if (cellLocation != null && (cellLocation instanceof GsmCellLocation)) {
                    this.a = (GsmCellLocation) cellLocation;
                }
                this.b = telephonyManager.getNetworkOperator();
            } catch (SecurityException e) {
                com.my.tracker.a.a("Permission android.permission.ACCESS_COARSE_LOCATION check was positive, but still got security exception on the cell provider");
            }
        }
    }

    /* compiled from: EnvironmentParamsDataProvider.java */
    /* loaded from: classes2.dex */
    public static class b {
        public String a;
        public int b = -1;
        public int c = -1;
        public int d = -1;
        public int e = -1;
        public int f = -1;

        public b(String str) {
            this.a = str;
        }
    }

    public final void a(com.my.tracker.builders.a aVar) {
        if (this.d) {
            aVar.a(this.c, this.a, this.b);
        }
    }

    static /* synthetic */ boolean c(Context context) {
        return com.my.tracker.utils.d.a("android.permission.ACCESS_FINE_LOCATION", context) && com.my.tracker.utils.d.a("android.permission.ACCESS_COARSE_LOCATION", context);
    }
}
