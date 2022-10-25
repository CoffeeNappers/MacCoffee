package com.google.android.gms.internal;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.util.ArrayMap;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;
/* loaded from: classes2.dex */
public final class zzsd extends Fragment implements zzrp {
    private static WeakHashMap<FragmentActivity, WeakReference<zzsd>> Bg = new WeakHashMap<>();
    private Bundle Bi;
    private Map<String, zzro> Bh = new ArrayMap();
    private int zzbtt = 0;

    public static zzsd zza(FragmentActivity fragmentActivity) {
        zzsd zzsdVar;
        WeakReference<zzsd> weakReference = Bg.get(fragmentActivity);
        if (weakReference == null || (zzsdVar = weakReference.get()) == null) {
            try {
                zzsdVar = (zzsd) fragmentActivity.getSupportFragmentManager().findFragmentByTag("SupportLifecycleFragmentImpl");
                if (zzsdVar == null || zzsdVar.isRemoving()) {
                    zzsdVar = new zzsd();
                    fragmentActivity.getSupportFragmentManager().beginTransaction().add(zzsdVar, "SupportLifecycleFragmentImpl").commitAllowingStateLoss();
                }
                Bg.put(fragmentActivity, new WeakReference<>(zzsdVar));
            } catch (ClassCastException e) {
                throw new IllegalStateException("Fragment with tag SupportLifecycleFragmentImpl is not a SupportLifecycleFragmentImpl", e);
            }
        }
        return zzsdVar;
    }

    private void zzb(final String str, @NonNull final zzro zzroVar) {
        if (this.zzbtt > 0) {
            new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: com.google.android.gms.internal.zzsd.1
                @Override // java.lang.Runnable
                public void run() {
                    if (zzsd.this.zzbtt >= 1) {
                        zzroVar.onCreate(zzsd.this.Bi != null ? zzsd.this.Bi.getBundle(str) : null);
                    }
                    if (zzsd.this.zzbtt >= 2) {
                        zzroVar.onStart();
                    }
                    if (zzsd.this.zzbtt >= 3) {
                        zzroVar.onStop();
                    }
                    if (zzsd.this.zzbtt >= 4) {
                        zzroVar.onDestroy();
                    }
                }
            });
        }
    }

    @Override // android.support.v4.app.Fragment
    public void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        super.dump(str, fileDescriptor, printWriter, strArr);
        for (zzro zzroVar : this.Bh.values()) {
            zzroVar.dump(str, fileDescriptor, printWriter, strArr);
        }
    }

    @Override // android.support.v4.app.Fragment
    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        for (zzro zzroVar : this.Bh.values()) {
            zzroVar.onActivityResult(i, i2, intent);
        }
    }

    @Override // android.support.v4.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.zzbtt = 1;
        this.Bi = bundle;
        for (Map.Entry<String, zzro> entry : this.Bh.entrySet()) {
            entry.getValue().onCreate(bundle != null ? bundle.getBundle(entry.getKey()) : null);
        }
    }

    @Override // android.support.v4.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        this.zzbtt = 4;
        for (zzro zzroVar : this.Bh.values()) {
            zzroVar.onDestroy();
        }
    }

    @Override // android.support.v4.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        if (bundle == null) {
            return;
        }
        for (Map.Entry<String, zzro> entry : this.Bh.entrySet()) {
            Bundle bundle2 = new Bundle();
            entry.getValue().onSaveInstanceState(bundle2);
            bundle.putBundle(entry.getKey(), bundle2);
        }
    }

    @Override // android.support.v4.app.Fragment
    public void onStart() {
        super.onStart();
        this.zzbtt = 2;
        for (zzro zzroVar : this.Bh.values()) {
            zzroVar.onStart();
        }
    }

    @Override // android.support.v4.app.Fragment
    public void onStop() {
        super.onStop();
        this.zzbtt = 3;
        for (zzro zzroVar : this.Bh.values()) {
            zzroVar.onStop();
        }
    }

    @Override // com.google.android.gms.internal.zzrp
    public <T extends zzro> T zza(String str, Class<T> cls) {
        return cls.cast(this.Bh.get(str));
    }

    @Override // com.google.android.gms.internal.zzrp
    public void zza(String str, @NonNull zzro zzroVar) {
        if (!this.Bh.containsKey(str)) {
            this.Bh.put(str, zzroVar);
            zzb(str, zzroVar);
            return;
        }
        throw new IllegalArgumentException(new StringBuilder(String.valueOf(str).length() + 59).append("LifecycleCallback with tag ").append(str).append(" already added to this fragment.").toString());
    }

    @Override // com.google.android.gms.internal.zzrp
    /* renamed from: zzaub */
    public FragmentActivity zzaty() {
        return getActivity();
    }
}
