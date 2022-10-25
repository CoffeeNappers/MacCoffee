package com.google.android.gms.internal;

import android.app.Dialog;
import android.app.PendingIntent;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.MainThread;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GoogleApiAvailability;
import com.google.android.gms.common.api.GoogleApiActivity;
import com.google.android.gms.internal.zzrj;
/* loaded from: classes2.dex */
public abstract class zzqp extends zzro implements DialogInterface.OnCancelListener {
    protected boolean mStarted;
    protected final GoogleApiAvailability xP;
    private ConnectionResult yA;
    private int yB;
    private final Handler yC;
    protected boolean yz;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class zza implements Runnable {
        private zza() {
        }

        @Override // java.lang.Runnable
        @MainThread
        public void run() {
            if (!zzqp.this.mStarted) {
                return;
            }
            if (zzqp.this.yA.hasResolution()) {
                zzqp.this.Bf.startActivityForResult(GoogleApiActivity.zzb(zzqp.this.getActivity(), zzqp.this.yA.getResolution(), zzqp.this.yB, false), 1);
            } else if (zzqp.this.xP.isUserResolvableError(zzqp.this.yA.getErrorCode())) {
                zzqp.this.xP.zza(zzqp.this.getActivity(), zzqp.this.Bf, zzqp.this.yA.getErrorCode(), 2, zzqp.this);
            } else if (zzqp.this.yA.getErrorCode() != 18) {
                zzqp.this.zza(zzqp.this.yA, zzqp.this.yB);
            } else {
                final Dialog zza = zzqp.this.xP.zza(zzqp.this.getActivity(), zzqp.this);
                zzqp.this.xP.zza(zzqp.this.getActivity().getApplicationContext(), new zzrj.zza() { // from class: com.google.android.gms.internal.zzqp.zza.1
                    @Override // com.google.android.gms.internal.zzrj.zza
                    public void zzarr() {
                        zzqp.this.zzarq();
                        if (zza.isShowing()) {
                            zza.dismiss();
                        }
                    }
                });
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzqp(zzrp zzrpVar) {
        this(zzrpVar, GoogleApiAvailability.getInstance());
    }

    zzqp(zzrp zzrpVar, GoogleApiAvailability googleApiAvailability) {
        super(zzrpVar);
        this.yB = -1;
        this.yC = new Handler(Looper.getMainLooper());
        this.xP = googleApiAvailability;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // com.google.android.gms.internal.zzro
    public void onActivityResult(int i, int i2, Intent intent) {
        boolean z = true;
        switch (i) {
            case 1:
                if (i2 != -1) {
                    if (i2 == 0) {
                        this.yA = new ConnectionResult(intent != null ? intent.getIntExtra("<<ResolutionFailureErrorDetail>>", 13) : 13, null);
                    }
                    z = false;
                    break;
                }
                break;
            case 2:
                int isGooglePlayServicesAvailable = this.xP.isGooglePlayServicesAvailable(getActivity());
                if (isGooglePlayServicesAvailable != 0) {
                    z = false;
                }
                if (this.yA.getErrorCode() == 18 && isGooglePlayServicesAvailable == 18) {
                    return;
                }
                break;
            default:
                z = false;
                break;
        }
        if (z) {
            zzarq();
        } else {
            zza(this.yA, this.yB);
        }
    }

    @Override // android.content.DialogInterface.OnCancelListener
    public void onCancel(DialogInterface dialogInterface) {
        zza(new ConnectionResult(13, null), this.yB);
        zzarq();
    }

    @Override // com.google.android.gms.internal.zzro
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle != null) {
            this.yz = bundle.getBoolean("resolving_error", false);
            if (!this.yz) {
                return;
            }
            this.yB = bundle.getInt("failed_client_id", -1);
            this.yA = new ConnectionResult(bundle.getInt("failed_status"), (PendingIntent) bundle.getParcelable("failed_resolution"));
        }
    }

    @Override // com.google.android.gms.internal.zzro
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putBoolean("resolving_error", this.yz);
        if (this.yz) {
            bundle.putInt("failed_client_id", this.yB);
            bundle.putInt("failed_status", this.yA.getErrorCode());
            bundle.putParcelable("failed_resolution", this.yA.getResolution());
        }
    }

    @Override // com.google.android.gms.internal.zzro
    public void onStart() {
        super.onStart();
        this.mStarted = true;
    }

    @Override // com.google.android.gms.internal.zzro
    public void onStop() {
        super.onStop();
        this.mStarted = false;
    }

    protected abstract void zza(ConnectionResult connectionResult, int i);

    protected abstract void zzarm();

    protected void zzarq() {
        this.yB = -1;
        this.yz = false;
        this.yA = null;
        zzarm();
    }

    public void zzb(ConnectionResult connectionResult, int i) {
        if (!this.yz) {
            this.yz = true;
            this.yB = i;
            this.yA = connectionResult;
            this.yC.post(new zza());
        }
    }
}
