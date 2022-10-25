package com.google.android.gms.maps.model.internal;

import android.graphics.Bitmap;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;
/* loaded from: classes2.dex */
public interface zza extends IInterface {

    /* renamed from: com.google.android.gms.maps.model.internal.zza$zza  reason: collision with other inner class name */
    /* loaded from: classes2.dex */
    public static abstract class AbstractBinderC0195zza extends Binder implements zza {

        /* renamed from: com.google.android.gms.maps.model.internal.zza$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes2.dex */
        private static class C0196zza implements zza {
            private IBinder zzajq;

            C0196zza(IBinder iBinder) {
                this.zzajq = iBinder;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.zzajq;
            }

            @Override // com.google.android.gms.maps.model.internal.zza
            public com.google.android.gms.dynamic.zzd zzbtc() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
                    this.zzajq.transact(4, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzd.zza.zzfd(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.model.internal.zza
            public com.google.android.gms.dynamic.zzd zze(Bitmap bitmap) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
                    if (bitmap != null) {
                        obtain.writeInt(1);
                        bitmap.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.zzajq.transact(6, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzd.zza.zzfd(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.model.internal.zza
            public com.google.android.gms.dynamic.zzd zzi(float f) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
                    obtain.writeFloat(f);
                    this.zzajq.transact(5, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzd.zza.zzfd(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.model.internal.zza
            public com.google.android.gms.dynamic.zzd zzlg(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
                    obtain.writeString(str);
                    this.zzajq.transact(2, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzd.zza.zzfd(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.model.internal.zza
            public com.google.android.gms.dynamic.zzd zzlh(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
                    obtain.writeString(str);
                    this.zzajq.transact(3, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzd.zza.zzfd(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.model.internal.zza
            public com.google.android.gms.dynamic.zzd zzli(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
                    obtain.writeString(str);
                    this.zzajq.transact(7, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzd.zza.zzfd(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.model.internal.zza
            public com.google.android.gms.dynamic.zzd zzxa(int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
                    obtain.writeInt(i);
                    this.zzajq.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzd.zza.zzfd(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public static zza zzjf(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof zza)) ? new C0196zza(iBinder) : (zza) queryLocalInterface;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            IBinder iBinder = null;
            switch (i) {
                case 1:
                    parcel.enforceInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
                    com.google.android.gms.dynamic.zzd zzxa = zzxa(parcel.readInt());
                    parcel2.writeNoException();
                    parcel2.writeStrongBinder(zzxa != null ? zzxa.asBinder() : null);
                    return true;
                case 2:
                    parcel.enforceInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
                    com.google.android.gms.dynamic.zzd zzlg = zzlg(parcel.readString());
                    parcel2.writeNoException();
                    if (zzlg != null) {
                        iBinder = zzlg.asBinder();
                    }
                    parcel2.writeStrongBinder(iBinder);
                    return true;
                case 3:
                    parcel.enforceInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
                    com.google.android.gms.dynamic.zzd zzlh = zzlh(parcel.readString());
                    parcel2.writeNoException();
                    if (zzlh != null) {
                        iBinder = zzlh.asBinder();
                    }
                    parcel2.writeStrongBinder(iBinder);
                    return true;
                case 4:
                    parcel.enforceInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
                    com.google.android.gms.dynamic.zzd zzbtc = zzbtc();
                    parcel2.writeNoException();
                    if (zzbtc != null) {
                        iBinder = zzbtc.asBinder();
                    }
                    parcel2.writeStrongBinder(iBinder);
                    return true;
                case 5:
                    parcel.enforceInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
                    com.google.android.gms.dynamic.zzd zzi = zzi(parcel.readFloat());
                    parcel2.writeNoException();
                    if (zzi != null) {
                        iBinder = zzi.asBinder();
                    }
                    parcel2.writeStrongBinder(iBinder);
                    return true;
                case 6:
                    parcel.enforceInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
                    com.google.android.gms.dynamic.zzd zze = zze(parcel.readInt() != 0 ? (Bitmap) Bitmap.CREATOR.createFromParcel(parcel) : null);
                    parcel2.writeNoException();
                    if (zze != null) {
                        iBinder = zze.asBinder();
                    }
                    parcel2.writeStrongBinder(iBinder);
                    return true;
                case 7:
                    parcel.enforceInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
                    com.google.android.gms.dynamic.zzd zzli = zzli(parcel.readString());
                    parcel2.writeNoException();
                    if (zzli != null) {
                        iBinder = zzli.asBinder();
                    }
                    parcel2.writeStrongBinder(iBinder);
                    return true;
                case 1598968902:
                    parcel2.writeString("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }
    }

    com.google.android.gms.dynamic.zzd zzbtc() throws RemoteException;

    com.google.android.gms.dynamic.zzd zze(Bitmap bitmap) throws RemoteException;

    com.google.android.gms.dynamic.zzd zzi(float f) throws RemoteException;

    com.google.android.gms.dynamic.zzd zzlg(String str) throws RemoteException;

    com.google.android.gms.dynamic.zzd zzlh(String str) throws RemoteException;

    com.google.android.gms.dynamic.zzd zzli(String str) throws RemoteException;

    com.google.android.gms.dynamic.zzd zzxa(int i) throws RemoteException;
}
