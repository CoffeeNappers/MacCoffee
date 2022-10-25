package com.my.tracker.providers;

import android.bluetooth.BluetoothAdapter;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Looper;
import android.text.TextUtils;
/* compiled from: NetworkInfoDataProvider.java */
/* loaded from: classes2.dex */
public final class h extends a {
    private boolean a;
    private String b;
    private String c;
    private int d = -1;

    public final boolean a() {
        return this.a;
    }

    public final void b(Context context) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            com.my.tracker.a.a("NetworkInfoDataProvider: You must not call collectData method from main thread");
            return;
        }
        this.a = true;
        this.b = "";
        this.c = "";
        if (com.my.tracker.utils.d.a("android.permission.ACCESS_NETWORK_STATE", context)) {
            try {
                NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
                if (activeNetworkInfo != null) {
                    this.a = activeNetworkInfo.isConnected();
                    this.b = activeNetworkInfo.getTypeName() != null ? activeNetworkInfo.getTypeName() : "";
                    if (activeNetworkInfo.getType() == 0) {
                        this.c = activeNetworkInfo.getSubtypeName() != null ? activeNetworkInfo.getSubtypeName() : "";
                    } else {
                        this.c = activeNetworkInfo.getTypeName() != null ? activeNetworkInfo.getTypeName() : "";
                    }
                } else {
                    this.a = false;
                }
            } catch (SecurityException e) {
                com.my.tracker.a.a("No permissions for access to network state");
            }
        }
        if (!com.my.tracker.utils.d.a() && com.my.tracker.utils.d.a("android.permission.BLUETOOTH", context)) {
            try {
                BluetoothAdapter defaultAdapter = BluetoothAdapter.getDefaultAdapter();
                if (defaultAdapter != null) {
                    if (defaultAdapter.isEnabled()) {
                        this.d = 1;
                    } else {
                        this.d = 0;
                    }
                }
            } catch (SecurityException e2) {
                com.my.tracker.a.a("Permission android.permission.BLUETOOTH check was positive, but still got security exception on the bluetooth provider");
            }
        }
    }

    public final void a(com.my.tracker.builders.a aVar) {
        if (!TextUtils.isEmpty(this.b) || !TextUtils.isEmpty(this.c)) {
            aVar.a(this.b, this.c);
        }
        if (this.d != -1) {
            aVar.d(this.d);
        }
    }
}
