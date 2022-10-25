package com.google.android.gms.dynamic;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.google.android.gms.common.GoogleApiAvailability;
import com.google.android.gms.dynamic.LifecycleDelegate;
import java.util.Iterator;
import java.util.LinkedList;
/* loaded from: classes2.dex */
public abstract class zza<T extends LifecycleDelegate> {
    private T PT;
    private Bundle PU;
    private LinkedList<InterfaceC0062zza> PV;
    private final zzf<T> PW = (zzf<T>) new zzf<T>() { // from class: com.google.android.gms.dynamic.zza.1
        @Override // com.google.android.gms.dynamic.zzf
        public void zza(T t) {
            zza.this.PT = t;
            Iterator it = zza.this.PV.iterator();
            while (it.hasNext()) {
                ((InterfaceC0062zza) it.next()).zzb(zza.this.PT);
            }
            zza.this.PV.clear();
            zza.this.PU = null;
        }
    };

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: com.google.android.gms.dynamic.zza$zza  reason: collision with other inner class name */
    /* loaded from: classes2.dex */
    public interface InterfaceC0062zza {
        int getState();

        void zzb(LifecycleDelegate lifecycleDelegate);
    }

    private void zza(Bundle bundle, InterfaceC0062zza interfaceC0062zza) {
        if (this.PT != null) {
            interfaceC0062zza.zzb(this.PT);
            return;
        }
        if (this.PV == null) {
            this.PV = new LinkedList<>();
        }
        this.PV.add(interfaceC0062zza);
        if (bundle != null) {
            if (this.PU == null) {
                this.PU = (Bundle) bundle.clone();
            } else {
                this.PU.putAll(bundle);
            }
        }
        zza(this.PW);
    }

    @VisibleForTesting
    static void zza(FrameLayout frameLayout, GoogleApiAvailability googleApiAvailability) {
        final Context context = frameLayout.getContext();
        int isGooglePlayServicesAvailable = googleApiAvailability.isGooglePlayServicesAvailable(context);
        String zzi = com.google.android.gms.common.internal.zzg.zzi(context, isGooglePlayServicesAvailable);
        String zzk = com.google.android.gms.common.internal.zzg.zzk(context, isGooglePlayServicesAvailable);
        LinearLayout linearLayout = new LinearLayout(frameLayout.getContext());
        linearLayout.setOrientation(1);
        linearLayout.setLayoutParams(new FrameLayout.LayoutParams(-2, -2));
        frameLayout.addView(linearLayout);
        TextView textView = new TextView(frameLayout.getContext());
        textView.setLayoutParams(new FrameLayout.LayoutParams(-2, -2));
        textView.setText(zzi);
        linearLayout.addView(textView);
        final Intent zzb = googleApiAvailability.zzb(context, isGooglePlayServicesAvailable, null);
        if (zzb != null) {
            Button button = new Button(context);
            button.setId(16908313);
            button.setLayoutParams(new FrameLayout.LayoutParams(-2, -2));
            button.setText(zzk);
            linearLayout.addView(button);
            button.setOnClickListener(new View.OnClickListener() { // from class: com.google.android.gms.dynamic.zza.5
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    try {
                        context.startActivity(zzb);
                    } catch (ActivityNotFoundException e) {
                        Log.e("DeferredLifecycleHelper", "Failed to start resolution intent", e);
                    }
                }
            });
        }
    }

    public static void zzb(FrameLayout frameLayout) {
        zza(frameLayout, GoogleApiAvailability.getInstance());
    }

    private void zznj(int i) {
        while (!this.PV.isEmpty() && this.PV.getLast().getState() >= i) {
            this.PV.removeLast();
        }
    }

    public void onCreate(final Bundle bundle) {
        zza(bundle, new InterfaceC0062zza() { // from class: com.google.android.gms.dynamic.zza.3
            @Override // com.google.android.gms.dynamic.zza.InterfaceC0062zza
            public int getState() {
                return 1;
            }

            @Override // com.google.android.gms.dynamic.zza.InterfaceC0062zza
            public void zzb(LifecycleDelegate lifecycleDelegate) {
                zza.this.PT.onCreate(bundle);
            }
        });
    }

    public View onCreateView(final LayoutInflater layoutInflater, final ViewGroup viewGroup, final Bundle bundle) {
        final FrameLayout frameLayout = new FrameLayout(layoutInflater.getContext());
        zza(bundle, new InterfaceC0062zza() { // from class: com.google.android.gms.dynamic.zza.4
            @Override // com.google.android.gms.dynamic.zza.InterfaceC0062zza
            public int getState() {
                return 2;
            }

            @Override // com.google.android.gms.dynamic.zza.InterfaceC0062zza
            public void zzb(LifecycleDelegate lifecycleDelegate) {
                frameLayout.removeAllViews();
                frameLayout.addView(zza.this.PT.onCreateView(layoutInflater, viewGroup, bundle));
            }
        });
        if (this.PT == null) {
            zza(frameLayout);
        }
        return frameLayout;
    }

    public void onDestroy() {
        if (this.PT != null) {
            this.PT.onDestroy();
        } else {
            zznj(1);
        }
    }

    public void onDestroyView() {
        if (this.PT != null) {
            this.PT.onDestroyView();
        } else {
            zznj(2);
        }
    }

    public void onInflate(final Activity activity, final Bundle bundle, final Bundle bundle2) {
        zza(bundle2, new InterfaceC0062zza() { // from class: com.google.android.gms.dynamic.zza.2
            @Override // com.google.android.gms.dynamic.zza.InterfaceC0062zza
            public int getState() {
                return 0;
            }

            @Override // com.google.android.gms.dynamic.zza.InterfaceC0062zza
            public void zzb(LifecycleDelegate lifecycleDelegate) {
                zza.this.PT.onInflate(activity, bundle, bundle2);
            }
        });
    }

    public void onLowMemory() {
        if (this.PT != null) {
            this.PT.onLowMemory();
        }
    }

    public void onPause() {
        if (this.PT != null) {
            this.PT.onPause();
        } else {
            zznj(5);
        }
    }

    public void onResume() {
        zza((Bundle) null, new InterfaceC0062zza() { // from class: com.google.android.gms.dynamic.zza.7
            @Override // com.google.android.gms.dynamic.zza.InterfaceC0062zza
            public int getState() {
                return 5;
            }

            @Override // com.google.android.gms.dynamic.zza.InterfaceC0062zza
            public void zzb(LifecycleDelegate lifecycleDelegate) {
                zza.this.PT.onResume();
            }
        });
    }

    public void onSaveInstanceState(Bundle bundle) {
        if (this.PT != null) {
            this.PT.onSaveInstanceState(bundle);
        } else if (this.PU == null) {
        } else {
            bundle.putAll(this.PU);
        }
    }

    public void onStart() {
        zza((Bundle) null, new InterfaceC0062zza() { // from class: com.google.android.gms.dynamic.zza.6
            @Override // com.google.android.gms.dynamic.zza.InterfaceC0062zza
            public int getState() {
                return 4;
            }

            @Override // com.google.android.gms.dynamic.zza.InterfaceC0062zza
            public void zzb(LifecycleDelegate lifecycleDelegate) {
                zza.this.PT.onStart();
            }
        });
    }

    public void onStop() {
        if (this.PT != null) {
            this.PT.onStop();
        } else {
            zznj(4);
        }
    }

    protected void zza(FrameLayout frameLayout) {
        zzb(frameLayout);
    }

    protected abstract void zza(zzf<T> zzfVar);

    public T zzbdo() {
        return this.PT;
    }
}
