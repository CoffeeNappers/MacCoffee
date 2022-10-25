package com.google.android.gms.ads;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.os.RemoteException;
import android.view.View;
import android.view.ViewGroup;
import com.google.android.gms.ads.internal.client.zzm;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.internal.zzhy;
/* loaded from: classes.dex */
public class AdActivity extends Activity {
    public static final String CLASS_NAME = "com.google.android.gms.ads.AdActivity";
    public static final String SIMPLE_CLASS_NAME = "AdActivity";
    private zzhy zzakb;

    private void zzds() {
        if (this.zzakb != null) {
            try {
                this.zzakb.zzds();
            } catch (RemoteException e) {
                zzb.zzc("Could not forward setContentViewSet to ad overlay:", e);
            }
        }
    }

    @Override // android.app.Activity
    protected void onActivityResult(int i, int i2, Intent intent) {
        try {
            this.zzakb.onActivityResult(i, i2, intent);
        } catch (Exception e) {
            zzb.zzc("Could not forward onActivityResult to ad overlay:", e);
        }
        super.onActivityResult(i, i2, intent);
    }

    @Override // android.app.Activity
    public void onBackPressed() {
        boolean z = true;
        try {
            if (this.zzakb != null) {
                z = this.zzakb.zzpn();
            }
        } catch (RemoteException e) {
            zzb.zzc("Could not forward onBackPressed to ad overlay:", e);
        }
        if (z) {
            super.onBackPressed();
        }
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        try {
            this.zzakb.zzn(zze.zzac(configuration));
        } catch (RemoteException e) {
            zzb.zzc("Failed to wrap configuration.", e);
        }
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.zzakb = zzm.zzks().zzc(this);
        if (this.zzakb == null) {
            zzb.zzdi("Could not create ad overlay.");
            finish();
            return;
        }
        try {
            this.zzakb.onCreate(bundle);
        } catch (RemoteException e) {
            zzb.zzc("Could not forward onCreate to ad overlay:", e);
            finish();
        }
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        try {
            if (this.zzakb != null) {
                this.zzakb.onDestroy();
            }
        } catch (RemoteException e) {
            zzb.zzc("Could not forward onDestroy to ad overlay:", e);
        }
        super.onDestroy();
    }

    @Override // android.app.Activity
    protected void onPause() {
        try {
            if (this.zzakb != null) {
                this.zzakb.onPause();
            }
        } catch (RemoteException e) {
            zzb.zzc("Could not forward onPause to ad overlay:", e);
            finish();
        }
        super.onPause();
    }

    @Override // android.app.Activity
    protected void onRestart() {
        super.onRestart();
        try {
            if (this.zzakb == null) {
                return;
            }
            this.zzakb.onRestart();
        } catch (RemoteException e) {
            zzb.zzc("Could not forward onRestart to ad overlay:", e);
            finish();
        }
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        try {
            if (this.zzakb == null) {
                return;
            }
            this.zzakb.onResume();
        } catch (RemoteException e) {
            zzb.zzc("Could not forward onResume to ad overlay:", e);
            finish();
        }
    }

    @Override // android.app.Activity
    protected void onSaveInstanceState(Bundle bundle) {
        try {
            if (this.zzakb != null) {
                this.zzakb.onSaveInstanceState(bundle);
            }
        } catch (RemoteException e) {
            zzb.zzc("Could not forward onSaveInstanceState to ad overlay:", e);
            finish();
        }
        super.onSaveInstanceState(bundle);
    }

    @Override // android.app.Activity
    protected void onStart() {
        super.onStart();
        try {
            if (this.zzakb == null) {
                return;
            }
            this.zzakb.onStart();
        } catch (RemoteException e) {
            zzb.zzc("Could not forward onStart to ad overlay:", e);
            finish();
        }
    }

    @Override // android.app.Activity
    protected void onStop() {
        try {
            if (this.zzakb != null) {
                this.zzakb.onStop();
            }
        } catch (RemoteException e) {
            zzb.zzc("Could not forward onStop to ad overlay:", e);
            finish();
        }
        super.onStop();
    }

    @Override // android.app.Activity
    public void setContentView(int i) {
        super.setContentView(i);
        zzds();
    }

    @Override // android.app.Activity
    public void setContentView(View view) {
        super.setContentView(view);
        zzds();
    }

    @Override // android.app.Activity
    public void setContentView(View view, ViewGroup.LayoutParams layoutParams) {
        super.setContentView(view, layoutParams);
        zzds();
    }
}
