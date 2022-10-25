package com.my.target.core.providers;

import android.content.Context;
import android.location.Location;
import android.location.LocationManager;
import android.net.wifi.ScanResult;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.telephony.CellLocation;
import android.telephony.TelephonyManager;
import android.telephony.gsm.GsmCellLocation;
import android.text.TextUtils;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.my.target.Tracer;
import com.my.target.core.utils.l;
import com.vkontakte.android.data.UserNotification;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
/* compiled from: EnvironmentParamsDataProvider.java */
/* loaded from: classes2.dex */
public final class c extends com.my.target.core.providers.a {
    private boolean a = true;
    private boolean b = true;

    public final void a(boolean z) {
        this.b = z;
    }

    public final void b(boolean z) {
        this.a = z;
    }

    public final synchronized void a(Context context) {
        Location lastKnownLocation;
        Location location;
        float f;
        long j;
        int i;
        String str = null;
        int i2 = -1;
        synchronized (this) {
            removeAll();
            if (this.a) {
                if (a("android.permission.ACCESS_FINE_LOCATION", context) || a("android.permission.ACCESS_COARSE_LOCATION", context)) {
                    float f2 = Float.MAX_VALUE;
                    long j2 = 0;
                    LocationManager locationManager = (LocationManager) context.getSystemService(FirebaseAnalytics.Param.LOCATION);
                    Location location2 = null;
                    for (String str2 : locationManager.getAllProviders()) {
                        try {
                            lastKnownLocation = locationManager.getLastKnownLocation(str2);
                        } catch (SecurityException e) {
                            Tracer.d("No permissions for get geo data");
                        }
                        if (lastKnownLocation != null) {
                            Tracer.d("locationProvider: " + str2);
                            float accuracy = lastKnownLocation.getAccuracy();
                            long time = lastKnownLocation.getTime();
                            if (location2 == null || (time > j2 && accuracy < f2)) {
                                location = lastKnownLocation;
                                f = accuracy;
                                j = time;
                                j2 = j;
                                f2 = f;
                                location2 = location;
                                str = str2;
                            }
                        }
                        str2 = str;
                        location = location2;
                        f = f2;
                        j = j2;
                        j2 = j;
                        f2 = f;
                        location2 = location;
                        str = str2;
                    }
                    if (location2 != null) {
                        addParam(FirebaseAnalytics.Param.LOCATION, location2.getLatitude() + "," + location2.getLongitude() + "," + location2.getAccuracy() + "," + location2.getSpeed() + "," + (j2 / 1000));
                        addParam("location_provider", str);
                        Tracer.d("location: " + location2.getLatitude() + ", " + location2.getLongitude() + " accuracy = " + location2.getAccuracy() + " speed = " + location2.getSpeed() + " time = " + (j2 / 1000) + "  provider: " + str);
                    }
                }
                if (this.b) {
                    if (a("android.permission.ACCESS_WIFI_STATE", context)) {
                        c(context);
                    }
                    if (a("android.permission.ACCESS_COARSE_LOCATION", context)) {
                        a aVar = new a(context);
                        if (aVar.a != null) {
                            if (!TextUtils.isEmpty(aVar.b)) {
                                try {
                                    i = Integer.parseInt(aVar.b.substring(0, 3));
                                    try {
                                        i2 = Integer.parseInt(aVar.b.substring(3));
                                    } catch (Exception e2) {
                                    }
                                } catch (Exception e3) {
                                    i = -1;
                                }
                            } else {
                                i = -1;
                            }
                            addParam(UserNotification.BUTTON_STYLE_CELL, "gsm," + aVar.a.getCid() + "," + aVar.a.getLac() + "," + i + "," + i2);
                            Tracer.d("cell: gsm," + aVar.a.getCid() + "," + aVar.a.getLac() + "," + i + "," + i2);
                        }
                    }
                }
            }
        }
    }

    private void c(Context context) {
        b bVar = new b(context);
        if (bVar.a != null) {
            WifiInfo wifiInfo = bVar.a;
            String bssid = wifiInfo.getBSSID();
            if (bssid == null) {
                bssid = "";
            }
            int linkSpeed = wifiInfo.getLinkSpeed();
            int networkId = wifiInfo.getNetworkId();
            int rssi = wifiInfo.getRssi();
            String ssid = wifiInfo.getSSID();
            if (ssid == null) {
                ssid = "";
            }
            addParam("wifi", bssid + "," + ssid + "," + rssi + "," + networkId + "," + linkSpeed);
            Tracer.d("mac: " + wifiInfo.getMacAddress());
            Tracer.d("ip: " + wifiInfo.getIpAddress());
            Tracer.d("wifi: " + bssid + "," + ssid + "," + rssi + "," + networkId + "," + linkSpeed);
        }
        if (bVar.b != null) {
            int i = 1;
            Iterator<ScanResult> it = bVar.b.iterator();
            while (true) {
                int i2 = i;
                if (it.hasNext()) {
                    ScanResult next = it.next();
                    if (i2 < 6) {
                        Tracer.d(new StringBuilder().append(next.level).toString());
                        String str = next.BSSID;
                        if (str == null) {
                            str = "";
                        }
                        String str2 = next.SSID;
                        if (str2 == null) {
                            str2 = "";
                        }
                        addParam("wifi" + i2, str + "," + str2 + "," + next.level);
                        Tracer.d("wifi" + i2 + ": " + str + "," + str2 + "," + next.level);
                        i = i2 + 1;
                    } else {
                        i = i2;
                    }
                } else {
                    return;
                }
            }
        }
    }

    private static boolean a(String str, Context context) {
        int i = -1;
        try {
            i = context.checkCallingOrSelfPermission(str);
        } catch (Throwable th) {
            Tracer.d("unable to check " + str + " permission! Unexpected throwable in Context.checkCallingOrSelfPermission() method: " + th.getMessage());
        }
        return i == 0;
    }

    /* compiled from: EnvironmentParamsDataProvider.java */
    /* loaded from: classes2.dex */
    private static class a {
        public GsmCellLocation a;
        public String b;

        public a(Context context) {
            TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService(SignupPhoneFragment.KEY_PHONE);
            try {
                CellLocation cellLocation = c.b(context) ? telephonyManager.getCellLocation() : null;
                if (cellLocation != null && (cellLocation instanceof GsmCellLocation)) {
                    this.a = (GsmCellLocation) cellLocation;
                    this.b = telephonyManager.getNetworkOperator();
                }
            } catch (SecurityException e) {
                Tracer.d("No permissions for access to coarse state");
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: EnvironmentParamsDataProvider.java */
    /* loaded from: classes2.dex */
    public static class b {
        public WifiInfo a;
        public List<ScanResult> b;

        public b(Context context) {
            try {
                WifiManager wifiManager = (WifiManager) context.getSystemService("wifi");
                if (wifiManager.isWifiEnabled()) {
                    this.a = wifiManager.getConnectionInfo();
                    if (!l.c(24) || c.b(context)) {
                        this.b = wifiManager.getScanResults();
                    }
                    if (this.b != null) {
                        Collections.sort(this.b, new Comparator<ScanResult>() { // from class: com.my.target.core.providers.c.b.1
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
                Tracer.d("No permissions for access to wifi state");
            }
        }
    }

    static /* synthetic */ boolean b(Context context) {
        return a("android.permission.ACCESS_FINE_LOCATION", context) || a("android.permission.ACCESS_COARSE_LOCATION", context);
    }
}
