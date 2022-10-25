package com.google.android.gms.auth.api.signin.internal;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.LoaderManager;
import android.support.v4.content.Loader;
import android.util.Log;
import android.view.accessibility.AccessibilityEvent;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.GoogleSignInApi;
import com.google.android.gms.auth.api.signin.SignInAccount;
import com.google.android.gms.common.annotation.KeepName;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Status;
@KeepName
/* loaded from: classes2.dex */
public class SignInHubActivity extends FragmentActivity {
    private zzk jM;
    private SignInConfiguration jN;
    private boolean jO;
    private int jP;
    private Intent jQ;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class zza implements LoaderManager.LoaderCallbacks<Void> {
        private zza() {
        }

        @Override // android.support.v4.app.LoaderManager.LoaderCallbacks
        public Loader<Void> onCreateLoader(int i, Bundle bundle) {
            return new zzb(SignInHubActivity.this, GoogleApiClient.zzarc());
        }

        @Override // android.support.v4.app.LoaderManager.LoaderCallbacks
        public void onLoaderReset(Loader<Void> loader) {
        }

        @Override // android.support.v4.app.LoaderManager.LoaderCallbacks
        /* renamed from: zza */
        public void onLoadFinished(Loader<Void> loader, Void r5) {
            SignInHubActivity.this.setResult(SignInHubActivity.this.jP, SignInHubActivity.this.jQ);
            SignInHubActivity.this.finish();
        }
    }

    private void zza(int i, Intent intent) {
        if (intent != null) {
            SignInAccount signInAccount = (SignInAccount) intent.getParcelableExtra(GoogleSignInApi.EXTRA_SIGN_IN_ACCOUNT);
            if (signInAccount != null && signInAccount.zzaiz() != null) {
                GoogleSignInAccount zzaiz = signInAccount.zzaiz();
                this.jM.zzb(zzaiz, this.jN.zzajk());
                intent.removeExtra(GoogleSignInApi.EXTRA_SIGN_IN_ACCOUNT);
                intent.putExtra("googleSignInAccount", zzaiz);
                this.jO = true;
                this.jP = i;
                this.jQ = intent;
                zzajl();
                return;
            } else if (intent.hasExtra("errorCode")) {
                zzdn(intent.getIntExtra("errorCode", 8));
                return;
            }
        }
        zzdn(8);
    }

    private void zzajl() {
        getSupportLoaderManager().initLoader(0, null, new zza());
    }

    private void zzdn(int i) {
        Status status = new Status(i);
        Intent intent = new Intent();
        intent.putExtra("googleSignInStatus", status);
        setResult(0, intent);
        finish();
    }

    private void zzj(Intent intent) {
        intent.setPackage("com.google.android.gms");
        intent.putExtra("config", this.jN);
        try {
            startActivityForResult(intent, 40962);
        } catch (ActivityNotFoundException e) {
            Log.w("AuthSignInClient", "Could not launch sign in Intent. Google Play Service is probably being updated...");
            zzdn(8);
        }
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        return true;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v4.app.FragmentActivity, android.app.Activity
    public void onActivityResult(int i, int i2, Intent intent) {
        setResult(0);
        switch (i) {
            case 40962:
                zza(i2, intent);
                return;
            default:
                return;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.jM = zzk.zzba(this);
        Intent intent = getIntent();
        if (!"com.google.android.gms.auth.GOOGLE_SIGN_IN".equals(intent.getAction())) {
            String valueOf = String.valueOf(intent.getAction());
            Log.e("AuthSignInClient", valueOf.length() != 0 ? "Unknown action: ".concat(valueOf) : new String("Unknown action: "));
            finish();
        }
        this.jN = (SignInConfiguration) intent.getParcelableExtra("config");
        if (this.jN == null) {
            Log.e("AuthSignInClient", "Activity started with invalid configuration.");
            setResult(0);
            finish();
        } else if (bundle == null) {
            zzj(new Intent("com.google.android.gms.auth.GOOGLE_SIGN_IN"));
        } else {
            this.jO = bundle.getBoolean("signingInGoogleApiClients");
            if (!this.jO) {
                return;
            }
            this.jP = bundle.getInt("signInResultCode");
            this.jQ = (Intent) bundle.getParcelable("signInResultData");
            zzajl();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v4.app.FragmentActivity, android.app.Activity
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putBoolean("signingInGoogleApiClients", this.jO);
        if (this.jO) {
            bundle.putInt("signInResultCode", this.jP);
            bundle.putParcelable("signInResultData", this.jQ);
        }
    }
}
