package com.google.android.gms.common.api;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentSender;
import android.os.Bundle;
import android.util.Log;
import com.facebook.internal.NativeProtocol;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GoogleApiAvailability;
import com.google.android.gms.internal.zzrh;
/* loaded from: classes2.dex */
public class GoogleApiActivity extends Activity implements DialogInterface.OnCancelListener {
    protected int xD = 0;

    public static PendingIntent zza(Context context, PendingIntent pendingIntent, int i) {
        return zza(context, pendingIntent, i, true);
    }

    public static PendingIntent zza(Context context, PendingIntent pendingIntent, int i, boolean z) {
        return PendingIntent.getActivity(context, 0, zzb(context, pendingIntent, i, z), 134217728);
    }

    private void zza(int i, zzrh zzrhVar) {
        switch (i) {
            case -1:
                zzrhVar.zzarm();
                return;
            case 0:
                zzrhVar.zza(new ConnectionResult(13, null), getIntent().getIntExtra("failing_client_id", -1));
                return;
            default:
                return;
        }
    }

    private void zzarb() {
        Bundle extras = getIntent().getExtras();
        if (extras == null) {
            Log.e("GoogleApiActivity", "Activity started without extras");
            finish();
            return;
        }
        PendingIntent pendingIntent = (PendingIntent) extras.get("pending_intent");
        Integer num = (Integer) extras.get(NativeProtocol.BRIDGE_ARG_ERROR_CODE);
        if (pendingIntent == null && num == null) {
            Log.e("GoogleApiActivity", "Activity started without resolution");
            finish();
        } else if (pendingIntent == null) {
            GoogleApiAvailability.getInstance().showErrorDialogFragment(this, num.intValue(), 2, this);
            this.xD = 1;
        } else {
            try {
                startIntentSenderForResult(pendingIntent.getIntentSender(), 1, null, 0, 0, 0);
                this.xD = 1;
            } catch (IntentSender.SendIntentException e) {
                Log.e("GoogleApiActivity", "Failed to launch pendingIntent", e);
                finish();
            }
        }
    }

    public static Intent zzb(Context context, PendingIntent pendingIntent, int i, boolean z) {
        Intent intent = new Intent(context, GoogleApiActivity.class);
        intent.putExtra("pending_intent", pendingIntent);
        intent.putExtra("failing_client_id", i);
        intent.putExtra("notify_manager", z);
        return intent;
    }

    @Override // android.app.Activity
    protected void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i == 1) {
            boolean booleanExtra = getIntent().getBooleanExtra("notify_manager", true);
            this.xD = 0;
            setResultCode(i2);
            if (booleanExtra) {
                zza(i2, zzrh.zzbx(this));
            }
        } else if (i == 2) {
            this.xD = 0;
            setResultCode(i2);
        }
        finish();
    }

    @Override // android.content.DialogInterface.OnCancelListener
    public void onCancel(DialogInterface dialogInterface) {
        this.xD = 0;
        setResult(0);
        finish();
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle != null) {
            this.xD = bundle.getInt("resolution");
        }
        if (this.xD != 1) {
            zzarb();
        }
    }

    @Override // android.app.Activity
    protected void onSaveInstanceState(Bundle bundle) {
        bundle.putInt("resolution", this.xD);
        super.onSaveInstanceState(bundle);
    }

    protected void setResultCode(int i) {
        setResult(i);
    }
}
