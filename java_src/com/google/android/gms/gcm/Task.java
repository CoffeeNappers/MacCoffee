package com.google.android.gms.gcm;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.CallSuper;
import android.util.Log;
import com.google.android.gms.common.internal.zzaa;
/* loaded from: classes.dex */
public abstract class Task implements Parcelable {
    public static final int EXTRAS_LIMIT_BYTES = 10240;
    public static final int NETWORK_STATE_ANY = 2;
    public static final int NETWORK_STATE_CONNECTED = 0;
    public static final int NETWORK_STATE_UNMETERED = 1;
    protected static final long UNINITIALIZED = -1;
    private final String aht;
    private final boolean ahu;
    private final boolean ahv;
    private final int ahw;
    private final boolean ahx;
    private final boolean ahy;
    private final zzc ahz;
    private final Bundle mExtras;
    private final String mTag;

    /* loaded from: classes2.dex */
    public static abstract class Builder {
        protected zzc ahA = zzc.aho;
        protected Bundle extras;
        protected String gcmTaskService;
        protected boolean isPersisted;
        protected int requiredNetworkState;
        protected boolean requiresCharging;
        protected String tag;
        protected boolean updateCurrent;

        /* renamed from: build */
        public abstract Task mo399build();

        /* JADX INFO: Access modifiers changed from: protected */
        @CallSuper
        public void checkConditions() {
            zzaa.zzb(this.gcmTaskService != null, "Must provide an endpoint for this task by calling setService(ComponentName).");
            GcmNetworkManager.zzki(this.tag);
            Task.zza(this.ahA);
            if (this.isPersisted) {
                Task.zzak(this.extras);
            }
        }

        /* renamed from: setExtras */
        public abstract Builder mo400setExtras(Bundle bundle);

        /* renamed from: setPersisted */
        public abstract Builder mo401setPersisted(boolean z);

        /* renamed from: setRequiredNetwork */
        public abstract Builder mo402setRequiredNetwork(int i);

        /* renamed from: setRequiresCharging */
        public abstract Builder mo403setRequiresCharging(boolean z);

        /* renamed from: setService */
        public abstract Builder mo404setService(Class<? extends GcmTaskService> cls);

        /* renamed from: setTag */
        public abstract Builder mo405setTag(String str);

        /* renamed from: setUpdateCurrent */
        public abstract Builder mo406setUpdateCurrent(boolean z);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Deprecated
    public Task(Parcel parcel) {
        boolean z = true;
        Log.e("Task", "Constructing a Task object using a parcel.");
        this.aht = parcel.readString();
        this.mTag = parcel.readString();
        this.ahu = parcel.readInt() == 1;
        this.ahv = parcel.readInt() != 1 ? false : z;
        this.ahw = 2;
        this.ahx = false;
        this.ahy = false;
        this.ahz = zzc.aho;
        this.mExtras = null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Task(Builder builder) {
        this.aht = builder.gcmTaskService;
        this.mTag = builder.tag;
        this.ahu = builder.updateCurrent;
        this.ahv = builder.isPersisted;
        this.ahw = builder.requiredNetworkState;
        this.ahx = builder.requiresCharging;
        this.ahy = false;
        this.mExtras = builder.extras;
        this.ahz = builder.ahA != null ? builder.ahA : zzc.aho;
    }

    public static void zza(zzc zzcVar) {
        if (zzcVar != null) {
            int zzbnv = zzcVar.zzbnv();
            if (zzbnv != 1 && zzbnv != 0) {
                throw new IllegalArgumentException(new StringBuilder(45).append("Must provide a valid RetryPolicy: ").append(zzbnv).toString());
            }
            int zzbnw = zzcVar.zzbnw();
            int zzbnx = zzcVar.zzbnx();
            if (zzbnv == 0 && zzbnw < 0) {
                throw new IllegalArgumentException(new StringBuilder(52).append("InitialBackoffSeconds can't be negative: ").append(zzbnw).toString());
            }
            if (zzbnv == 1 && zzbnw < 10) {
                throw new IllegalArgumentException("RETRY_POLICY_LINEAR must have an initial backoff at least 10 seconds.");
            }
            if (zzbnx >= zzbnw) {
                return;
            }
            throw new IllegalArgumentException(new StringBuilder(77).append("MaximumBackoffSeconds must be greater than InitialBackoffSeconds: ").append(zzcVar.zzbnx()).toString());
        }
    }

    private static boolean zzah(Object obj) {
        return (obj instanceof Integer) || (obj instanceof Long) || (obj instanceof Double) || (obj instanceof String) || (obj instanceof Boolean);
    }

    public static void zzak(Bundle bundle) {
        if (bundle != null) {
            Parcel obtain = Parcel.obtain();
            bundle.writeToParcel(obtain, 0);
            int dataSize = obtain.dataSize();
            if (dataSize > 10240) {
                obtain.recycle();
                String valueOf = String.valueOf("Extras exceeding maximum size(10240 bytes): ");
                throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf).length() + 11).append(valueOf).append(dataSize).toString());
            }
            obtain.recycle();
            for (String str : bundle.keySet()) {
                if (!zzah(bundle.get(str))) {
                    throw new IllegalArgumentException("Only the following extra parameter types are supported: Integer, Long, Double, String, and Boolean. ");
                }
            }
        }
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public Bundle getExtras() {
        return this.mExtras;
    }

    public int getRequiredNetwork() {
        return this.ahw;
    }

    public boolean getRequiresCharging() {
        return this.ahx;
    }

    public String getServiceName() {
        return this.aht;
    }

    public String getTag() {
        return this.mTag;
    }

    public boolean isPersisted() {
        return this.ahv;
    }

    public boolean isUpdateCurrent() {
        return this.ahu;
    }

    public void toBundle(Bundle bundle) {
        bundle.putString("tag", this.mTag);
        bundle.putBoolean("update_current", this.ahu);
        bundle.putBoolean("persisted", this.ahv);
        bundle.putString("service", this.aht);
        bundle.putInt("requiredNetwork", this.ahw);
        bundle.putBoolean("requiresCharging", this.ahx);
        bundle.putBoolean("requiresIdle", this.ahy);
        bundle.putBundle("retryStrategy", this.ahz.zzaj(new Bundle()));
        bundle.putBundle("extras", this.mExtras);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        int i2 = 1;
        parcel.writeString(this.aht);
        parcel.writeString(this.mTag);
        parcel.writeInt(this.ahu ? 1 : 0);
        if (!this.ahv) {
            i2 = 0;
        }
        parcel.writeInt(i2);
    }
}
