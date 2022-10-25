package com.google.android.gms.maps;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.os.RemoteException;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.dynamic.zzf;
import com.google.android.gms.maps.internal.IGoogleMapDelegate;
import com.google.android.gms.maps.internal.IMapViewDelegate;
import com.google.android.gms.maps.internal.MapLifecycleDelegate;
import com.google.android.gms.maps.internal.zzai;
import com.google.android.gms.maps.internal.zzt;
import com.google.android.gms.maps.model.RuntimeRemoteException;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class MapView extends FrameLayout {
    private final zzb aoP;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class zza implements MapLifecycleDelegate {
        private final ViewGroup aoQ;
        private final IMapViewDelegate aoR;
        private View aoS;

        public zza(ViewGroup viewGroup, IMapViewDelegate iMapViewDelegate) {
            this.aoR = (IMapViewDelegate) zzaa.zzy(iMapViewDelegate);
            this.aoQ = (ViewGroup) zzaa.zzy(viewGroup);
        }

        @Override // com.google.android.gms.maps.internal.MapLifecycleDelegate
        public void getMapAsync(final OnMapReadyCallback onMapReadyCallback) {
            try {
                this.aoR.getMapAsync(new zzt.zza() { // from class: com.google.android.gms.maps.MapView.zza.1
                    @Override // com.google.android.gms.maps.internal.zzt
                    public void zza(IGoogleMapDelegate iGoogleMapDelegate) throws RemoteException {
                        onMapReadyCallback.onMapReady(new GoogleMap(iGoogleMapDelegate));
                    }
                });
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        @Override // com.google.android.gms.dynamic.LifecycleDelegate
        public void onCreate(Bundle bundle) {
            try {
                this.aoR.onCreate(bundle);
                this.aoS = (View) zze.zzae(this.aoR.getView());
                this.aoQ.removeAllViews();
                this.aoQ.addView(this.aoS);
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        @Override // com.google.android.gms.dynamic.LifecycleDelegate
        public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
            throw new UnsupportedOperationException("onCreateView not allowed on MapViewDelegate");
        }

        @Override // com.google.android.gms.dynamic.LifecycleDelegate
        public void onDestroy() {
            try {
                this.aoR.onDestroy();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        @Override // com.google.android.gms.dynamic.LifecycleDelegate
        public void onDestroyView() {
            throw new UnsupportedOperationException("onDestroyView not allowed on MapViewDelegate");
        }

        public void onEnterAmbient(Bundle bundle) {
            try {
                this.aoR.onEnterAmbient(bundle);
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        public void onExitAmbient() {
            try {
                this.aoR.onExitAmbient();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        @Override // com.google.android.gms.dynamic.LifecycleDelegate
        public void onInflate(Activity activity, Bundle bundle, Bundle bundle2) {
            throw new UnsupportedOperationException("onInflate not allowed on MapViewDelegate");
        }

        @Override // com.google.android.gms.dynamic.LifecycleDelegate
        public void onLowMemory() {
            try {
                this.aoR.onLowMemory();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        @Override // com.google.android.gms.dynamic.LifecycleDelegate
        public void onPause() {
            try {
                this.aoR.onPause();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        @Override // com.google.android.gms.dynamic.LifecycleDelegate
        public void onResume() {
            try {
                this.aoR.onResume();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        @Override // com.google.android.gms.dynamic.LifecycleDelegate
        public void onSaveInstanceState(Bundle bundle) {
            try {
                this.aoR.onSaveInstanceState(bundle);
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        @Override // com.google.android.gms.dynamic.LifecycleDelegate
        public void onStart() {
            try {
                this.aoR.onStart();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        @Override // com.google.android.gms.dynamic.LifecycleDelegate
        public void onStop() {
            try {
                this.aoR.onStop();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class zzb extends com.google.android.gms.dynamic.zza<zza> {
        protected zzf<zza> aoN;
        private final List<OnMapReadyCallback> aoO = new ArrayList();
        private final ViewGroup aoU;
        private final GoogleMapOptions aoV;
        private final Context mContext;

        zzb(ViewGroup viewGroup, Context context, GoogleMapOptions googleMapOptions) {
            this.aoU = viewGroup;
            this.mContext = context;
            this.aoV = googleMapOptions;
        }

        public void getMapAsync(OnMapReadyCallback onMapReadyCallback) {
            if (zzbdo() != null) {
                zzbdo().getMapAsync(onMapReadyCallback);
            } else {
                this.aoO.add(onMapReadyCallback);
            }
        }

        public void onEnterAmbient(Bundle bundle) {
            if (zzbdo() != null) {
                zzbdo().onEnterAmbient(bundle);
            }
        }

        public void onExitAmbient() {
            if (zzbdo() != null) {
                zzbdo().onExitAmbient();
            }
        }

        @Override // com.google.android.gms.dynamic.zza
        protected void zza(zzf<zza> zzfVar) {
            this.aoN = zzfVar;
            zzbsp();
        }

        public void zzbsp() {
            if (this.aoN == null || zzbdo() != null) {
                return;
            }
            try {
                MapsInitializer.initialize(this.mContext);
                IMapViewDelegate zza = zzai.zzdm(this.mContext).zza(zze.zzac(this.mContext), this.aoV);
                if (zza == null) {
                    return;
                }
                this.aoN.zza(new zza(this.aoU, zza));
                for (OnMapReadyCallback onMapReadyCallback : this.aoO) {
                    zzbdo().getMapAsync(onMapReadyCallback);
                }
                this.aoO.clear();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            } catch (GooglePlayServicesNotAvailableException e2) {
            }
        }
    }

    public MapView(Context context) {
        super(context);
        this.aoP = new zzb(this, context, null);
        zzbsq();
    }

    public MapView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.aoP = new zzb(this, context, GoogleMapOptions.createFromAttributes(context, attributeSet));
        zzbsq();
    }

    public MapView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.aoP = new zzb(this, context, GoogleMapOptions.createFromAttributes(context, attributeSet));
        zzbsq();
    }

    public MapView(Context context, GoogleMapOptions googleMapOptions) {
        super(context);
        this.aoP = new zzb(this, context, googleMapOptions);
        zzbsq();
    }

    private void zzbsq() {
        setClickable(true);
    }

    public void getMapAsync(OnMapReadyCallback onMapReadyCallback) {
        zzaa.zzhs("getMapAsync() must be called on the main thread");
        this.aoP.getMapAsync(onMapReadyCallback);
    }

    public final void onCreate(Bundle bundle) {
        this.aoP.onCreate(bundle);
        if (this.aoP.zzbdo() == null) {
            com.google.android.gms.dynamic.zza.zzb(this);
        }
    }

    public final void onDestroy() {
        this.aoP.onDestroy();
    }

    public final void onEnterAmbient(Bundle bundle) {
        zzaa.zzhs("onEnterAmbient() must be called on the main thread");
        this.aoP.onEnterAmbient(bundle);
    }

    public final void onExitAmbient() {
        zzaa.zzhs("onExitAmbient() must be called on the main thread");
        this.aoP.onExitAmbient();
    }

    public final void onLowMemory() {
        this.aoP.onLowMemory();
    }

    public final void onPause() {
        this.aoP.onPause();
    }

    public final void onResume() {
        this.aoP.onResume();
    }

    public final void onSaveInstanceState(Bundle bundle) {
        this.aoP.onSaveInstanceState(bundle);
    }

    public final void onStart() {
        this.aoP.onStart();
    }

    public final void onStop() {
        this.aoP.onStop();
    }
}
