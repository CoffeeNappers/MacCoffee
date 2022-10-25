package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.MainThread;
import java.io.FileDescriptor;
import java.io.PrintWriter;
/* loaded from: classes2.dex */
public class zzro {
    protected final zzrp Bf;

    /* JADX INFO: Access modifiers changed from: protected */
    public zzro(zzrp zzrpVar) {
        this.Bf = zzrpVar;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static zzrp zzc(zzrn zzrnVar) {
        return zzrnVar.zzatv() ? zzsd.zza(zzrnVar.zzatx()) : zzrq.zzt(zzrnVar.zzatw());
    }

    public static zzrp zzs(Activity activity) {
        return zzc(new zzrn(activity));
    }

    @MainThread
    public void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
    }

    public Activity getActivity() {
        return this.Bf.zzaty();
    }

    @MainThread
    public void onActivityResult(int i, int i2, Intent intent) {
    }

    @MainThread
    public void onCreate(Bundle bundle) {
    }

    @MainThread
    public void onDestroy() {
    }

    @MainThread
    public void onSaveInstanceState(Bundle bundle) {
    }

    @MainThread
    public void onStart() {
    }

    @MainThread
    public void onStop() {
    }
}
