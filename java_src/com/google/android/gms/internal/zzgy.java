package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.ads.mediation.AdUrlAdapter;
import com.google.ads.mediation.MediationAdapter;
import com.google.ads.mediation.MediationServerParameters;
import com.google.ads.mediation.admob.AdMobAdapter;
import com.google.android.gms.ads.mediation.NetworkExtras;
import com.google.android.gms.ads.mediation.customevent.CustomEvent;
import com.google.android.gms.ads.mediation.customevent.CustomEventAdapter;
import com.google.android.gms.ads.mediation.customevent.CustomEventExtras;
import com.google.android.gms.internal.zzgz;
import java.util.Map;
@zzji
/* loaded from: classes.dex */
public final class zzgy extends zzgz.zza {
    private Map<Class<? extends NetworkExtras>, NetworkExtras> zzbxf;

    private <NETWORK_EXTRAS extends com.google.ads.mediation.NetworkExtras, SERVER_PARAMETERS extends MediationServerParameters> zzha zzbw(String str) throws RemoteException {
        try {
            Class<?> cls = Class.forName(str, false, zzgy.class.getClassLoader());
            if (MediationAdapter.class.isAssignableFrom(cls)) {
                MediationAdapter mediationAdapter = (MediationAdapter) cls.newInstance();
                return new zzhl(mediationAdapter, (com.google.ads.mediation.NetworkExtras) this.zzbxf.get(mediationAdapter.getAdditionalParametersType()));
            } else if (com.google.android.gms.ads.mediation.MediationAdapter.class.isAssignableFrom(cls)) {
                return new zzhg((com.google.android.gms.ads.mediation.MediationAdapter) cls.newInstance());
            } else {
                com.google.android.gms.ads.internal.util.client.zzb.zzdi(new StringBuilder(String.valueOf(str).length() + 64).append("Could not instantiate mediation adapter: ").append(str).append(" (not a valid adapter).").toString());
                throw new RemoteException();
            }
        } catch (Throwable th) {
            return zzbx(str);
        }
    }

    private zzha zzbx(String str) throws RemoteException {
        try {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Reflection failed, retrying using direct instantiation");
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc(new StringBuilder(String.valueOf(str).length() + 43).append("Could not instantiate mediation adapter: ").append(str).append(". ").toString(), th);
        }
        if ("com.google.ads.mediation.admob.AdMobAdapter".equals(str)) {
            return new zzhg(new AdMobAdapter());
        }
        if ("com.google.ads.mediation.AdUrlAdapter".equals(str)) {
            return new zzhg(new AdUrlAdapter());
        }
        if ("com.google.android.gms.ads.mediation.customevent.CustomEventAdapter".equals(str)) {
            return new zzhg(new CustomEventAdapter());
        }
        if ("com.google.ads.mediation.customevent.CustomEventAdapter".equals(str)) {
            com.google.ads.mediation.customevent.CustomEventAdapter customEventAdapter = new com.google.ads.mediation.customevent.CustomEventAdapter();
            return new zzhl(customEventAdapter, (CustomEventExtras) this.zzbxf.get(customEventAdapter.getAdditionalParametersType()));
        }
        throw new RemoteException();
    }

    @Override // com.google.android.gms.internal.zzgz
    public zzha zzbu(String str) throws RemoteException {
        return zzbw(str);
    }

    @Override // com.google.android.gms.internal.zzgz
    public boolean zzbv(String str) throws RemoteException {
        try {
            return CustomEvent.class.isAssignableFrom(Class.forName(str, false, zzgy.class.getClassLoader()));
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdi(new StringBuilder(String.valueOf(str).length() + 80).append("Could not load custom event implementation class: ").append(str).append(", assuming old implementation.").toString());
            return false;
        }
    }

    public void zzi(Map<Class<? extends NetworkExtras>, NetworkExtras> map) {
        this.zzbxf = map;
    }
}
