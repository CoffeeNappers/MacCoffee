package com.google.android.gms.ads.internal.client;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.ads.internal.client.zzs;
import com.google.android.gms.ads.internal.client.zzu;
import com.google.android.gms.ads.internal.client.zzz;
import com.google.android.gms.ads.internal.reward.client.zzb;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.internal.zzei;
import com.google.android.gms.internal.zzgz;
import com.google.android.gms.internal.zzhy;
import com.google.android.gms.internal.zzih;
/* loaded from: classes.dex */
public interface zzx extends IInterface {

    /* loaded from: classes.dex */
    public static abstract class zza extends Binder implements zzx {

        /* JADX INFO: Access modifiers changed from: private */
        /* renamed from: com.google.android.gms.ads.internal.client.zzx$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes.dex */
        public static class C0016zza implements zzx {
            private IBinder zzajq;

            C0016zza(IBinder iBinder) {
                this.zzajq = iBinder;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.zzajq;
            }

            @Override // com.google.android.gms.ads.internal.client.zzx
            public zzs createAdLoaderBuilder(com.google.android.gms.dynamic.zzd zzdVar, String str, zzgz zzgzVar, int i) throws RemoteException {
                IBinder iBinder = null;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.client.IClientApi");
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    obtain.writeString(str);
                    if (zzgzVar != null) {
                        iBinder = zzgzVar.asBinder();
                    }
                    obtain.writeStrongBinder(iBinder);
                    obtain.writeInt(i);
                    this.zzajq.transact(3, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzs.zza.zzo(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.ads.internal.client.zzx
            public zzhy createAdOverlay(com.google.android.gms.dynamic.zzd zzdVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.client.IClientApi");
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    this.zzajq.transact(8, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzhy.zza.zzat(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.ads.internal.client.zzx
            public zzu createBannerAdManager(com.google.android.gms.dynamic.zzd zzdVar, AdSizeParcel adSizeParcel, String str, zzgz zzgzVar, int i) throws RemoteException {
                IBinder iBinder = null;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.client.IClientApi");
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    if (adSizeParcel != null) {
                        obtain.writeInt(1);
                        adSizeParcel.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeString(str);
                    if (zzgzVar != null) {
                        iBinder = zzgzVar.asBinder();
                    }
                    obtain.writeStrongBinder(iBinder);
                    obtain.writeInt(i);
                    this.zzajq.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzu.zza.zzq(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.ads.internal.client.zzx
            public zzih createInAppPurchaseManager(com.google.android.gms.dynamic.zzd zzdVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.client.IClientApi");
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    this.zzajq.transact(7, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzih.zza.zzay(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.ads.internal.client.zzx
            public zzu createInterstitialAdManager(com.google.android.gms.dynamic.zzd zzdVar, AdSizeParcel adSizeParcel, String str, zzgz zzgzVar, int i) throws RemoteException {
                IBinder iBinder = null;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.client.IClientApi");
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    if (adSizeParcel != null) {
                        obtain.writeInt(1);
                        adSizeParcel.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeString(str);
                    if (zzgzVar != null) {
                        iBinder = zzgzVar.asBinder();
                    }
                    obtain.writeStrongBinder(iBinder);
                    obtain.writeInt(i);
                    this.zzajq.transact(2, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzu.zza.zzq(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.ads.internal.client.zzx
            public zzei createNativeAdViewDelegate(com.google.android.gms.dynamic.zzd zzdVar, com.google.android.gms.dynamic.zzd zzdVar2) throws RemoteException {
                IBinder iBinder = null;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.client.IClientApi");
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    if (zzdVar2 != null) {
                        iBinder = zzdVar2.asBinder();
                    }
                    obtain.writeStrongBinder(iBinder);
                    this.zzajq.transact(5, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzei.zza.zzac(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.ads.internal.client.zzx
            public com.google.android.gms.ads.internal.reward.client.zzb createRewardedVideoAd(com.google.android.gms.dynamic.zzd zzdVar, zzgz zzgzVar, int i) throws RemoteException {
                IBinder iBinder = null;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.client.IClientApi");
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    if (zzgzVar != null) {
                        iBinder = zzgzVar.asBinder();
                    }
                    obtain.writeStrongBinder(iBinder);
                    obtain.writeInt(i);
                    this.zzajq.transact(6, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzb.zza.zzbh(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.ads.internal.client.zzx
            public zzu createSearchAdManager(com.google.android.gms.dynamic.zzd zzdVar, AdSizeParcel adSizeParcel, String str, int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.client.IClientApi");
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    if (adSizeParcel != null) {
                        obtain.writeInt(1);
                        adSizeParcel.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeString(str);
                    obtain.writeInt(i);
                    this.zzajq.transact(10, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzu.zza.zzq(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.ads.internal.client.zzx
            public zzz getMobileAdsSettingsManager(com.google.android.gms.dynamic.zzd zzdVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.client.IClientApi");
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    this.zzajq.transact(4, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzz.zza.zzu(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.ads.internal.client.zzx
            public zzz getMobileAdsSettingsManagerWithClientJarVersion(com.google.android.gms.dynamic.zzd zzdVar, int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.client.IClientApi");
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    obtain.writeInt(i);
                    this.zzajq.transact(9, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzz.zza.zzu(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public zza() {
            attachInterface(this, "com.google.android.gms.ads.internal.client.IClientApi");
        }

        public static zzx asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.ads.internal.client.IClientApi");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof zzx)) ? new C0016zza(iBinder) : (zzx) queryLocalInterface;
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            IBinder iBinder = null;
            switch (i) {
                case 1:
                    parcel.enforceInterface("com.google.android.gms.ads.internal.client.IClientApi");
                    zzu createBannerAdManager = createBannerAdManager(zzd.zza.zzfd(parcel.readStrongBinder()), parcel.readInt() != 0 ? AdSizeParcel.CREATOR.createFromParcel(parcel) : null, parcel.readString(), zzgz.zza.zzam(parcel.readStrongBinder()), parcel.readInt());
                    parcel2.writeNoException();
                    if (createBannerAdManager != null) {
                        iBinder = createBannerAdManager.asBinder();
                    }
                    parcel2.writeStrongBinder(iBinder);
                    return true;
                case 2:
                    parcel.enforceInterface("com.google.android.gms.ads.internal.client.IClientApi");
                    zzu createInterstitialAdManager = createInterstitialAdManager(zzd.zza.zzfd(parcel.readStrongBinder()), parcel.readInt() != 0 ? AdSizeParcel.CREATOR.createFromParcel(parcel) : null, parcel.readString(), zzgz.zza.zzam(parcel.readStrongBinder()), parcel.readInt());
                    parcel2.writeNoException();
                    if (createInterstitialAdManager != null) {
                        iBinder = createInterstitialAdManager.asBinder();
                    }
                    parcel2.writeStrongBinder(iBinder);
                    return true;
                case 3:
                    parcel.enforceInterface("com.google.android.gms.ads.internal.client.IClientApi");
                    zzs createAdLoaderBuilder = createAdLoaderBuilder(zzd.zza.zzfd(parcel.readStrongBinder()), parcel.readString(), zzgz.zza.zzam(parcel.readStrongBinder()), parcel.readInt());
                    parcel2.writeNoException();
                    if (createAdLoaderBuilder != null) {
                        iBinder = createAdLoaderBuilder.asBinder();
                    }
                    parcel2.writeStrongBinder(iBinder);
                    return true;
                case 4:
                    parcel.enforceInterface("com.google.android.gms.ads.internal.client.IClientApi");
                    zzz mobileAdsSettingsManager = getMobileAdsSettingsManager(zzd.zza.zzfd(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    if (mobileAdsSettingsManager != null) {
                        iBinder = mobileAdsSettingsManager.asBinder();
                    }
                    parcel2.writeStrongBinder(iBinder);
                    return true;
                case 5:
                    parcel.enforceInterface("com.google.android.gms.ads.internal.client.IClientApi");
                    zzei createNativeAdViewDelegate = createNativeAdViewDelegate(zzd.zza.zzfd(parcel.readStrongBinder()), zzd.zza.zzfd(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    if (createNativeAdViewDelegate != null) {
                        iBinder = createNativeAdViewDelegate.asBinder();
                    }
                    parcel2.writeStrongBinder(iBinder);
                    return true;
                case 6:
                    parcel.enforceInterface("com.google.android.gms.ads.internal.client.IClientApi");
                    com.google.android.gms.ads.internal.reward.client.zzb createRewardedVideoAd = createRewardedVideoAd(zzd.zza.zzfd(parcel.readStrongBinder()), zzgz.zza.zzam(parcel.readStrongBinder()), parcel.readInt());
                    parcel2.writeNoException();
                    if (createRewardedVideoAd != null) {
                        iBinder = createRewardedVideoAd.asBinder();
                    }
                    parcel2.writeStrongBinder(iBinder);
                    return true;
                case 7:
                    parcel.enforceInterface("com.google.android.gms.ads.internal.client.IClientApi");
                    zzih createInAppPurchaseManager = createInAppPurchaseManager(zzd.zza.zzfd(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    if (createInAppPurchaseManager != null) {
                        iBinder = createInAppPurchaseManager.asBinder();
                    }
                    parcel2.writeStrongBinder(iBinder);
                    return true;
                case 8:
                    parcel.enforceInterface("com.google.android.gms.ads.internal.client.IClientApi");
                    zzhy createAdOverlay = createAdOverlay(zzd.zza.zzfd(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    if (createAdOverlay != null) {
                        iBinder = createAdOverlay.asBinder();
                    }
                    parcel2.writeStrongBinder(iBinder);
                    return true;
                case 9:
                    parcel.enforceInterface("com.google.android.gms.ads.internal.client.IClientApi");
                    zzz mobileAdsSettingsManagerWithClientJarVersion = getMobileAdsSettingsManagerWithClientJarVersion(zzd.zza.zzfd(parcel.readStrongBinder()), parcel.readInt());
                    parcel2.writeNoException();
                    if (mobileAdsSettingsManagerWithClientJarVersion != null) {
                        iBinder = mobileAdsSettingsManagerWithClientJarVersion.asBinder();
                    }
                    parcel2.writeStrongBinder(iBinder);
                    return true;
                case 10:
                    parcel.enforceInterface("com.google.android.gms.ads.internal.client.IClientApi");
                    zzu createSearchAdManager = createSearchAdManager(zzd.zza.zzfd(parcel.readStrongBinder()), parcel.readInt() != 0 ? AdSizeParcel.CREATOR.createFromParcel(parcel) : null, parcel.readString(), parcel.readInt());
                    parcel2.writeNoException();
                    if (createSearchAdManager != null) {
                        iBinder = createSearchAdManager.asBinder();
                    }
                    parcel2.writeStrongBinder(iBinder);
                    return true;
                case 1598968902:
                    parcel2.writeString("com.google.android.gms.ads.internal.client.IClientApi");
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }
    }

    zzs createAdLoaderBuilder(com.google.android.gms.dynamic.zzd zzdVar, String str, zzgz zzgzVar, int i) throws RemoteException;

    zzhy createAdOverlay(com.google.android.gms.dynamic.zzd zzdVar) throws RemoteException;

    zzu createBannerAdManager(com.google.android.gms.dynamic.zzd zzdVar, AdSizeParcel adSizeParcel, String str, zzgz zzgzVar, int i) throws RemoteException;

    zzih createInAppPurchaseManager(com.google.android.gms.dynamic.zzd zzdVar) throws RemoteException;

    zzu createInterstitialAdManager(com.google.android.gms.dynamic.zzd zzdVar, AdSizeParcel adSizeParcel, String str, zzgz zzgzVar, int i) throws RemoteException;

    zzei createNativeAdViewDelegate(com.google.android.gms.dynamic.zzd zzdVar, com.google.android.gms.dynamic.zzd zzdVar2) throws RemoteException;

    com.google.android.gms.ads.internal.reward.client.zzb createRewardedVideoAd(com.google.android.gms.dynamic.zzd zzdVar, zzgz zzgzVar, int i) throws RemoteException;

    zzu createSearchAdManager(com.google.android.gms.dynamic.zzd zzdVar, AdSizeParcel adSizeParcel, String str, int i) throws RemoteException;

    zzz getMobileAdsSettingsManager(com.google.android.gms.dynamic.zzd zzdVar) throws RemoteException;

    zzz getMobileAdsSettingsManagerWithClientJarVersion(com.google.android.gms.dynamic.zzd zzdVar, int i) throws RemoteException;
}
