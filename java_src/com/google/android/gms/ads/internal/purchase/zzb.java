package com.google.android.gms.ads.internal.purchase;

import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkx;
@zzji
/* loaded from: classes.dex */
public class zzb {
    private final Context mContext;
    Object zzcfd;
    private final boolean zzcfe;

    public zzb(Context context) {
        this(context, true);
    }

    public zzb(Context context, boolean z) {
        this.mContext = context;
        this.zzcfe = z;
    }

    public void destroy() {
        this.zzcfd = null;
    }

    public void zzav(IBinder iBinder) {
        try {
            this.zzcfd = this.mContext.getClassLoader().loadClass("com.android.vending.billing.IInAppBillingService$Stub").getDeclaredMethod("asInterface", IBinder.class).invoke(null, iBinder);
        } catch (Exception e) {
            if (!this.zzcfe) {
                return;
            }
            zzkx.zzdi("IInAppBillingService is not available, please add com.android.vending.billing.IInAppBillingService to project.");
        }
    }

    public int zzb(int i, String str, String str2) {
        try {
            Class<?> loadClass = this.mContext.getClassLoader().loadClass("com.android.vending.billing.IInAppBillingService");
            return ((Integer) loadClass.getDeclaredMethod("isBillingSupported", Integer.TYPE, String.class, String.class).invoke(loadClass.cast(this.zzcfd), Integer.valueOf(i), str, str2)).intValue();
        } catch (Exception e) {
            if (this.zzcfe) {
                zzkx.zzc("IInAppBillingService is not available, please add com.android.vending.billing.IInAppBillingService to project.", e);
            }
            return 5;
        }
    }

    public Bundle zzb(String str, String str2, String str3) {
        try {
            Class<?> loadClass = this.mContext.getClassLoader().loadClass("com.android.vending.billing.IInAppBillingService");
            return (Bundle) loadClass.getDeclaredMethod("getBuyIntent", Integer.TYPE, String.class, String.class, String.class, String.class).invoke(loadClass.cast(this.zzcfd), 3, str, str2, "inapp", str3);
        } catch (Exception e) {
            if (this.zzcfe) {
                zzkx.zzc("IInAppBillingService is not available, please add com.android.vending.billing.IInAppBillingService to project.", e);
            }
            return null;
        }
    }

    public int zzl(String str, String str2) {
        try {
            Class<?> loadClass = this.mContext.getClassLoader().loadClass("com.android.vending.billing.IInAppBillingService");
            return ((Integer) loadClass.getDeclaredMethod("consumePurchase", Integer.TYPE, String.class, String.class).invoke(loadClass.cast(this.zzcfd), 3, str, str2)).intValue();
        } catch (Exception e) {
            if (this.zzcfe) {
                zzkx.zzc("IInAppBillingService is not available, please add com.android.vending.billing.IInAppBillingService to project.", e);
            }
            return 5;
        }
    }

    public Bundle zzm(String str, String str2) {
        try {
            Class<?> loadClass = this.mContext.getClassLoader().loadClass("com.android.vending.billing.IInAppBillingService");
            return (Bundle) loadClass.getDeclaredMethod("getPurchases", Integer.TYPE, String.class, String.class, String.class).invoke(loadClass.cast(this.zzcfd), 3, str, "inapp", str2);
        } catch (Exception e) {
            if (this.zzcfe) {
                zzkx.zzc("IInAppBillingService is not available, please add com.android.vending.billing.IInAppBillingService to project.", e);
            }
            return null;
        }
    }
}
