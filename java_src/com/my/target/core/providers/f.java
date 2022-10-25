package com.my.target.core.providers;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import com.my.target.Tracer;
/* compiled from: NetworkInfoDataProvider.java */
/* loaded from: classes2.dex */
public final class f extends a {
    private boolean a;
    private String b;

    public final synchronized void a(Context context) {
        removeAll();
        this.a = true;
        this.b = "";
        try {
            NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
            if (activeNetworkInfo != null) {
                this.a = activeNetworkInfo.isConnected();
                this.b = activeNetworkInfo.getTypeName();
                addParam("connection", this.b);
                if (activeNetworkInfo.getType() == 0) {
                    addParam("connection_type", activeNetworkInfo.getSubtypeName() != null ? activeNetworkInfo.getSubtypeName() : "");
                } else {
                    addParam("connection_type", activeNetworkInfo.getTypeName() != null ? activeNetworkInfo.getTypeName() : "");
                }
            }
        } catch (SecurityException e) {
            Tracer.d("No permissions for access to network state");
        }
    }
}
