package com.google.android.gms.common.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;
/* loaded from: classes2.dex */
public interface zzu extends IInterface {

    /* loaded from: classes2.dex */
    public static abstract class zza extends Binder implements zzu {

        /* renamed from: com.google.android.gms.common.internal.zzu$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes2.dex */
        private static class C0054zza implements zzu {
            private IBinder zzajq;

            C0054zza(IBinder iBinder) {
                this.zzajq = iBinder;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.zzajq;
            }

            @Override // com.google.android.gms.common.internal.zzu
            public com.google.android.gms.dynamic.zzd zzawi() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.common.internal.IGoogleCertificatesApi");
                    this.zzajq.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzd.zza.zzfd(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.common.internal.zzu
            public com.google.android.gms.dynamic.zzd zzawj() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.common.internal.IGoogleCertificatesApi");
                    this.zzajq.transact(2, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzd.zza.zzfd(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.common.internal.zzu
            public boolean zzd(String str, com.google.android.gms.dynamic.zzd zzdVar) throws RemoteException {
                boolean z = false;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.common.internal.IGoogleCertificatesApi");
                    obtain.writeString(str);
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    this.zzajq.transact(3, obtain, obtain2, 0);
                    obtain2.readException();
                    if (obtain2.readInt() != 0) {
                        z = true;
                    }
                    return z;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.common.internal.zzu
            public boolean zze(String str, com.google.android.gms.dynamic.zzd zzdVar) throws RemoteException {
                boolean z = false;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.common.internal.IGoogleCertificatesApi");
                    obtain.writeString(str);
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    this.zzajq.transact(4, obtain, obtain2, 0);
                    obtain2.readException();
                    if (obtain2.readInt() != 0) {
                        z = true;
                    }
                    return z;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public static zzu zzdv(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.common.internal.IGoogleCertificatesApi");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof zzu)) ? new C0054zza(iBinder) : (zzu) queryLocalInterface;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            IBinder iBinder = null;
            int i3 = 0;
            switch (i) {
                case 1:
                    parcel.enforceInterface("com.google.android.gms.common.internal.IGoogleCertificatesApi");
                    com.google.android.gms.dynamic.zzd zzawi = zzawi();
                    parcel2.writeNoException();
                    if (zzawi != null) {
                        iBinder = zzawi.asBinder();
                    }
                    parcel2.writeStrongBinder(iBinder);
                    return true;
                case 2:
                    parcel.enforceInterface("com.google.android.gms.common.internal.IGoogleCertificatesApi");
                    com.google.android.gms.dynamic.zzd zzawj = zzawj();
                    parcel2.writeNoException();
                    if (zzawj != null) {
                        iBinder = zzawj.asBinder();
                    }
                    parcel2.writeStrongBinder(iBinder);
                    return true;
                case 3:
                    parcel.enforceInterface("com.google.android.gms.common.internal.IGoogleCertificatesApi");
                    boolean zzd = zzd(parcel.readString(), zzd.zza.zzfd(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    parcel2.writeInt(zzd ? 1 : 0);
                    return true;
                case 4:
                    parcel.enforceInterface("com.google.android.gms.common.internal.IGoogleCertificatesApi");
                    boolean zze = zze(parcel.readString(), zzd.zza.zzfd(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    if (zze) {
                        i3 = 1;
                    }
                    parcel2.writeInt(i3);
                    return true;
                case 1598968902:
                    parcel2.writeString("com.google.android.gms.common.internal.IGoogleCertificatesApi");
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }
    }

    com.google.android.gms.dynamic.zzd zzawi() throws RemoteException;

    com.google.android.gms.dynamic.zzd zzawj() throws RemoteException;

    boolean zzd(String str, com.google.android.gms.dynamic.zzd zzdVar) throws RemoteException;

    boolean zze(String str, com.google.android.gms.dynamic.zzd zzdVar) throws RemoteException;
}
