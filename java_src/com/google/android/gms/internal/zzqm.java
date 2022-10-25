package com.google.android.gms.internal;

import android.support.annotation.NonNull;
import android.util.Log;
import android.util.SparseArray;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient;
import java.io.FileDescriptor;
import java.io.PrintWriter;
/* loaded from: classes2.dex */
public class zzqm extends zzqp {
    private final SparseArray<zza> yq;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class zza implements GoogleApiClient.OnConnectionFailedListener {
        public final int yr;
        public final GoogleApiClient ys;
        public final GoogleApiClient.OnConnectionFailedListener yt;

        public zza(int i, GoogleApiClient googleApiClient, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            this.yr = i;
            this.ys = googleApiClient;
            this.yt = onConnectionFailedListener;
            googleApiClient.registerConnectionFailedListener(this);
        }

        public void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
            printWriter.append((CharSequence) str).append("GoogleApiClient #").print(this.yr);
            printWriter.println(":");
            this.ys.dump(String.valueOf(str).concat("  "), fileDescriptor, printWriter, strArr);
        }

        @Override // com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener
        public void onConnectionFailed(@NonNull ConnectionResult connectionResult) {
            String valueOf = String.valueOf(connectionResult);
            Log.d("AutoManageHelper", new StringBuilder(String.valueOf(valueOf).length() + 27).append("beginFailureResolution for ").append(valueOf).toString());
            zzqm.this.zzb(connectionResult, this.yr);
        }

        public void zzarn() {
            this.ys.unregisterConnectionFailedListener(this);
            this.ys.disconnect();
        }
    }

    private zzqm(zzrp zzrpVar) {
        super(zzrpVar);
        this.yq = new SparseArray<>();
        this.Bf.zza("AutoManageHelper", this);
    }

    public static zzqm zza(zzrn zzrnVar) {
        zzrp zzc = zzc(zzrnVar);
        zzqm zzqmVar = (zzqm) zzc.zza("AutoManageHelper", zzqm.class);
        return zzqmVar != null ? zzqmVar : new zzqm(zzc);
    }

    @Override // com.google.android.gms.internal.zzro
    public void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 < this.yq.size()) {
                this.yq.valueAt(i2).dump(str, fileDescriptor, printWriter, strArr);
                i = i2 + 1;
            } else {
                return;
            }
        }
    }

    @Override // com.google.android.gms.internal.zzqp, com.google.android.gms.internal.zzro
    public void onStart() {
        super.onStart();
        boolean z = this.mStarted;
        String valueOf = String.valueOf(this.yq);
        Log.d("AutoManageHelper", new StringBuilder(String.valueOf(valueOf).length() + 14).append("onStart ").append(z).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(valueOf).toString());
        if (!this.yz) {
            int i = 0;
            while (true) {
                int i2 = i;
                if (i2 >= this.yq.size()) {
                    return;
                }
                this.yq.valueAt(i2).ys.connect();
                i = i2 + 1;
            }
        }
    }

    @Override // com.google.android.gms.internal.zzqp, com.google.android.gms.internal.zzro
    public void onStop() {
        super.onStop();
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 < this.yq.size()) {
                this.yq.valueAt(i2).ys.disconnect();
                i = i2 + 1;
            } else {
                return;
            }
        }
    }

    public void zza(int i, GoogleApiClient googleApiClient, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        com.google.android.gms.common.internal.zzaa.zzb(googleApiClient, "GoogleApiClient instance cannot be null");
        com.google.android.gms.common.internal.zzaa.zza(this.yq.indexOfKey(i) < 0, new StringBuilder(54).append("Already managing a GoogleApiClient with id ").append(i).toString());
        Log.d("AutoManageHelper", new StringBuilder(54).append("starting AutoManage for client ").append(i).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(this.mStarted).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(this.yz).toString());
        this.yq.put(i, new zza(i, googleApiClient, onConnectionFailedListener));
        if (!this.mStarted || this.yz) {
            return;
        }
        String valueOf = String.valueOf(googleApiClient);
        Log.d("AutoManageHelper", new StringBuilder(String.valueOf(valueOf).length() + 11).append("connecting ").append(valueOf).toString());
        googleApiClient.connect();
    }

    @Override // com.google.android.gms.internal.zzqp
    protected void zza(ConnectionResult connectionResult, int i) {
        Log.w("AutoManageHelper", "Unresolved error while connecting client. Stopping auto-manage.");
        if (i < 0) {
            Log.wtf("AutoManageHelper", "AutoManageLifecycleHelper received onErrorResolutionFailed callback but no failing client ID is set", new Exception());
            return;
        }
        zza zzaVar = this.yq.get(i);
        if (zzaVar == null) {
            return;
        }
        zzfs(i);
        GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener = zzaVar.yt;
        if (onConnectionFailedListener == null) {
            return;
        }
        onConnectionFailedListener.onConnectionFailed(connectionResult);
    }

    @Override // com.google.android.gms.internal.zzqp
    protected void zzarm() {
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 < this.yq.size()) {
                this.yq.valueAt(i2).ys.connect();
                i = i2 + 1;
            } else {
                return;
            }
        }
    }

    public void zzfs(int i) {
        zza zzaVar = this.yq.get(i);
        this.yq.remove(i);
        if (zzaVar != null) {
            zzaVar.zzarn();
        }
    }
}
