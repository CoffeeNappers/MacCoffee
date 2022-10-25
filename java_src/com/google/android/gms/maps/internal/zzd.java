package com.google.android.gms.maps.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.maps.model.internal.zzf;
/* loaded from: classes2.dex */
public interface zzd extends IInterface {

    /* loaded from: classes2.dex */
    public static abstract class zza extends Binder implements zzd {

        /* renamed from: com.google.android.gms.maps.internal.zzd$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes2.dex */
        private static class C0171zza implements zzd {
            private IBinder zzajq;

            C0171zza(IBinder iBinder) {
                this.zzajq = iBinder;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.zzajq;
            }

            @Override // com.google.android.gms.maps.internal.zzd
            public com.google.android.gms.dynamic.zzd zzh(com.google.android.gms.maps.model.internal.zzf zzfVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.internal.IInfoWindowAdapter");
                    obtain.writeStrongBinder(zzfVar != null ? zzfVar.asBinder() : null);
                    this.zzajq.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzd.zza.zzfd(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.internal.zzd
            public com.google.android.gms.dynamic.zzd zzi(com.google.android.gms.maps.model.internal.zzf zzfVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.internal.IInfoWindowAdapter");
                    obtain.writeStrongBinder(zzfVar != null ? zzfVar.asBinder() : null);
                    this.zzajq.transact(2, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzd.zza.zzfd(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public zza() {
            attachInterface(this, "com.google.android.gms.maps.internal.IInfoWindowAdapter");
        }

        public static zzd zzht(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.maps.internal.IInfoWindowAdapter");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof zzd)) ? new C0171zza(iBinder) : (zzd) queryLocalInterface;
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
                    parcel.enforceInterface("com.google.android.gms.maps.internal.IInfoWindowAdapter");
                    com.google.android.gms.dynamic.zzd zzh = zzh(zzf.zza.zzjk(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    if (zzh != null) {
                        iBinder = zzh.asBinder();
                    }
                    parcel2.writeStrongBinder(iBinder);
                    return true;
                case 2:
                    parcel.enforceInterface("com.google.android.gms.maps.internal.IInfoWindowAdapter");
                    com.google.android.gms.dynamic.zzd zzi = zzi(zzf.zza.zzjk(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    if (zzi != null) {
                        iBinder = zzi.asBinder();
                    }
                    parcel2.writeStrongBinder(iBinder);
                    return true;
                case 1598968902:
                    parcel2.writeString("com.google.android.gms.maps.internal.IInfoWindowAdapter");
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }
    }

    com.google.android.gms.dynamic.zzd zzh(com.google.android.gms.maps.model.internal.zzf zzfVar) throws RemoteException;

    com.google.android.gms.dynamic.zzd zzi(com.google.android.gms.maps.model.internal.zzf zzfVar) throws RemoteException;
}
