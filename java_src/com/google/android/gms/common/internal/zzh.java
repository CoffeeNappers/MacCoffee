package com.google.android.gms.common.internal;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.DialogInterface;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.v4.app.Fragment;
import android.util.Log;
import com.google.android.gms.internal.zzrp;
/* loaded from: classes2.dex */
public abstract class zzh implements DialogInterface.OnClickListener {
    public static zzh zza(final Activity activity, final Intent intent, final int i) {
        return new zzh() { // from class: com.google.android.gms.common.internal.zzh.1
            @Override // com.google.android.gms.common.internal.zzh
            public void zzavx() {
                if (intent != null) {
                    activity.startActivityForResult(intent, i);
                }
            }
        };
    }

    public static zzh zza(@NonNull final Fragment fragment, final Intent intent, final int i) {
        return new zzh() { // from class: com.google.android.gms.common.internal.zzh.2
            @Override // com.google.android.gms.common.internal.zzh
            public void zzavx() {
                if (intent != null) {
                    fragment.startActivityForResult(intent, i);
                }
            }
        };
    }

    public static zzh zza(@NonNull final zzrp zzrpVar, final Intent intent, final int i) {
        return new zzh() { // from class: com.google.android.gms.common.internal.zzh.3
            @Override // com.google.android.gms.common.internal.zzh
            @TargetApi(11)
            public void zzavx() {
                if (intent != null) {
                    zzrpVar.startActivityForResult(intent, i);
                }
            }
        };
    }

    @Override // android.content.DialogInterface.OnClickListener
    public void onClick(DialogInterface dialogInterface, int i) {
        try {
            try {
                zzavx();
                dialogInterface.dismiss();
            } catch (ActivityNotFoundException e) {
                Log.e("DialogRedirect", "Failed to start resolution intent", e);
                dialogInterface.dismiss();
            }
        } catch (Throwable th) {
            dialogInterface.dismiss();
            throw th;
        }
    }

    protected abstract void zzavx();
}
