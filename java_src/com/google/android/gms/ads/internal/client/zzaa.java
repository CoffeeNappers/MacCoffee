package com.google.android.gms.ads.internal.client;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;
/* loaded from: classes.dex */
public interface zzaa extends IInterface {

    /* loaded from: classes.dex */
    public static abstract class zza extends Binder implements zzaa {

        /* renamed from: com.google.android.gms.ads.internal.client.zzaa$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes.dex */
        private static class C0005zza implements zzaa {
            private IBinder zzajq;

            C0005zza(IBinder iBinder) {
                this.zzajq = iBinder;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.zzajq;
            }

            @Override // com.google.android.gms.ads.internal.client.zzaa
            public IBinder zza(com.google.android.gms.dynamic.zzd zzdVar, int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.client.IMobileAdsSettingManagerCreator");
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    obtain.writeInt(i);
                    this.zzajq.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readStrongBinder();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public static zzaa zzv(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.ads.internal.client.IMobileAdsSettingManagerCreator");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof zzaa)) ? new C0005zza(iBinder) : (zzaa) queryLocalInterface;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            switch (i) {
                case 1:
                    parcel.enforceInterface("com.google.android.gms.ads.internal.client.IMobileAdsSettingManagerCreator");
                    IBinder zza = zza(zzd.zza.zzfd(parcel.readStrongBinder()), parcel.readInt());
                    parcel2.writeNoException();
                    parcel2.writeStrongBinder(zza);
                    return true;
                case 1598968902:
                    parcel2.writeString("com.google.android.gms.ads.internal.client.IMobileAdsSettingManagerCreator");
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }
    }

    IBinder zza(com.google.android.gms.dynamic.zzd zzdVar, int i) throws RemoteException;
}
