package android.support.v4.net;

import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.support.annotation.RestrictTo;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
/* loaded from: classes.dex */
public final class ConnectivityManagerCompat {
    private static final ConnectivityManagerCompatImpl IMPL;
    public static final int RESTRICT_BACKGROUND_STATUS_DISABLED = 1;
    public static final int RESTRICT_BACKGROUND_STATUS_ENABLED = 3;
    public static final int RESTRICT_BACKGROUND_STATUS_WHITELISTED = 2;

    /* loaded from: classes.dex */
    interface ConnectivityManagerCompatImpl {
        int getRestrictBackgroundStatus(ConnectivityManager connectivityManager);

        boolean isActiveNetworkMetered(ConnectivityManager connectivityManager);
    }

    @Retention(RetentionPolicy.SOURCE)
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    /* loaded from: classes.dex */
    public @interface RestrictBackgroundStatus {
    }

    /* loaded from: classes.dex */
    static class BaseConnectivityManagerCompatImpl implements ConnectivityManagerCompatImpl {
        BaseConnectivityManagerCompatImpl() {
        }

        @Override // android.support.v4.net.ConnectivityManagerCompat.ConnectivityManagerCompatImpl
        public boolean isActiveNetworkMetered(ConnectivityManager cm) {
            NetworkInfo info = cm.getActiveNetworkInfo();
            if (info == null) {
                return true;
            }
            int type = info.getType();
            switch (type) {
                case 0:
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                default:
                    return true;
                case 1:
                    return false;
            }
        }

        @Override // android.support.v4.net.ConnectivityManagerCompat.ConnectivityManagerCompatImpl
        public int getRestrictBackgroundStatus(ConnectivityManager cm) {
            return 3;
        }
    }

    /* loaded from: classes.dex */
    static class HoneycombMR2ConnectivityManagerCompatImpl extends BaseConnectivityManagerCompatImpl {
        HoneycombMR2ConnectivityManagerCompatImpl() {
        }

        @Override // android.support.v4.net.ConnectivityManagerCompat.BaseConnectivityManagerCompatImpl, android.support.v4.net.ConnectivityManagerCompat.ConnectivityManagerCompatImpl
        public boolean isActiveNetworkMetered(ConnectivityManager cm) {
            return ConnectivityManagerCompatHoneycombMR2.isActiveNetworkMetered(cm);
        }
    }

    /* loaded from: classes.dex */
    static class JellyBeanConnectivityManagerCompatImpl extends HoneycombMR2ConnectivityManagerCompatImpl {
        JellyBeanConnectivityManagerCompatImpl() {
        }

        @Override // android.support.v4.net.ConnectivityManagerCompat.HoneycombMR2ConnectivityManagerCompatImpl, android.support.v4.net.ConnectivityManagerCompat.BaseConnectivityManagerCompatImpl, android.support.v4.net.ConnectivityManagerCompat.ConnectivityManagerCompatImpl
        public boolean isActiveNetworkMetered(ConnectivityManager cm) {
            return ConnectivityManagerCompatJellyBean.isActiveNetworkMetered(cm);
        }
    }

    /* loaded from: classes.dex */
    static class Api24ConnectivityManagerCompatImpl extends JellyBeanConnectivityManagerCompatImpl {
        Api24ConnectivityManagerCompatImpl() {
        }

        @Override // android.support.v4.net.ConnectivityManagerCompat.BaseConnectivityManagerCompatImpl, android.support.v4.net.ConnectivityManagerCompat.ConnectivityManagerCompatImpl
        public int getRestrictBackgroundStatus(ConnectivityManager cm) {
            return ConnectivityManagerCompatApi24.getRestrictBackgroundStatus(cm);
        }
    }

    static {
        if (Build.VERSION.SDK_INT >= 24) {
            IMPL = new Api24ConnectivityManagerCompatImpl();
        } else if (Build.VERSION.SDK_INT >= 16) {
            IMPL = new JellyBeanConnectivityManagerCompatImpl();
        } else if (Build.VERSION.SDK_INT >= 13) {
            IMPL = new HoneycombMR2ConnectivityManagerCompatImpl();
        } else {
            IMPL = new BaseConnectivityManagerCompatImpl();
        }
    }

    public static boolean isActiveNetworkMetered(ConnectivityManager cm) {
        return IMPL.isActiveNetworkMetered(cm);
    }

    public static NetworkInfo getNetworkInfoFromBroadcast(ConnectivityManager cm, Intent intent) {
        NetworkInfo info = (NetworkInfo) intent.getParcelableExtra("networkInfo");
        if (info != null) {
            return cm.getNetworkInfo(info.getType());
        }
        return null;
    }

    public static int getRestrictBackgroundStatus(ConnectivityManager cm) {
        return IMPL.getRestrictBackgroundStatus(cm);
    }

    private ConnectivityManagerCompat() {
    }
}
