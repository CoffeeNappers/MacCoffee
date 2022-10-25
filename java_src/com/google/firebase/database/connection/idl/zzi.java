package com.google.firebase.database.connection.idl;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public interface zzi extends IInterface {

    /* loaded from: classes2.dex */
    public static abstract class zza extends Binder implements zzi {

        /* renamed from: com.google.firebase.database.connection.idl.zzi$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes2.dex */
        private static class C0230zza implements zzi {
            private IBinder zzajq;

            C0230zza(IBinder iBinder) {
                this.zzajq = iBinder;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.zzajq;
            }

            @Override // com.google.firebase.database.connection.idl.zzi
            public void onDisconnect() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnectionDelegate");
                    this.zzajq.transact(4, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.database.connection.idl.zzi
            public void zza(List<String> list, com.google.android.gms.dynamic.zzd zzdVar, boolean z, long j) throws RemoteException {
                int i = 1;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnectionDelegate");
                    obtain.writeStringList(list);
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    if (!z) {
                        i = 0;
                    }
                    obtain.writeInt(i);
                    obtain.writeLong(j);
                    this.zzajq.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.database.connection.idl.zzi
            public void zza(List<String> list, List<RangeParcelable> list2, com.google.android.gms.dynamic.zzd zzdVar, long j) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnectionDelegate");
                    obtain.writeStringList(list);
                    obtain.writeTypedList(list2);
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    obtain.writeLong(j);
                    this.zzajq.transact(2, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.database.connection.idl.zzi
            public void zzap(com.google.android.gms.dynamic.zzd zzdVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnectionDelegate");
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    this.zzajq.transact(6, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.database.connection.idl.zzi
            public void zzcsp() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnectionDelegate");
                    this.zzajq.transact(3, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.database.connection.idl.zzi
            public void zzcy(boolean z) throws RemoteException {
                int i = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnectionDelegate");
                    if (z) {
                        i = 1;
                    }
                    obtain.writeInt(i);
                    this.zzajq.transact(5, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public zza() {
            attachInterface(this, "com.google.firebase.database.connection.idl.IPersistentConnectionDelegate");
        }

        public static zzi zzmh(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.firebase.database.connection.idl.IPersistentConnectionDelegate");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof zzi)) ? new C0230zza(iBinder) : (zzi) queryLocalInterface;
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            boolean z = false;
            switch (i) {
                case 1:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnectionDelegate");
                    ArrayList<String> createStringArrayList = parcel.createStringArrayList();
                    com.google.android.gms.dynamic.zzd zzfd = zzd.zza.zzfd(parcel.readStrongBinder());
                    if (parcel.readInt() != 0) {
                        z = true;
                    }
                    zza(createStringArrayList, zzfd, z, parcel.readLong());
                    parcel2.writeNoException();
                    return true;
                case 2:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnectionDelegate");
                    zza(parcel.createStringArrayList(), parcel.createTypedArrayList(RangeParcelable.CREATOR), zzd.zza.zzfd(parcel.readStrongBinder()), parcel.readLong());
                    parcel2.writeNoException();
                    return true;
                case 3:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnectionDelegate");
                    zzcsp();
                    parcel2.writeNoException();
                    return true;
                case 4:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnectionDelegate");
                    onDisconnect();
                    parcel2.writeNoException();
                    return true;
                case 5:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnectionDelegate");
                    if (parcel.readInt() != 0) {
                        z = true;
                    }
                    zzcy(z);
                    parcel2.writeNoException();
                    return true;
                case 6:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnectionDelegate");
                    zzap(zzd.zza.zzfd(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 1598968902:
                    parcel2.writeString("com.google.firebase.database.connection.idl.IPersistentConnectionDelegate");
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }
    }

    void onDisconnect() throws RemoteException;

    void zza(List<String> list, com.google.android.gms.dynamic.zzd zzdVar, boolean z, long j) throws RemoteException;

    void zza(List<String> list, List<RangeParcelable> list2, com.google.android.gms.dynamic.zzd zzdVar, long j) throws RemoteException;

    void zzap(com.google.android.gms.dynamic.zzd zzdVar) throws RemoteException;

    void zzcsp() throws RemoteException;

    void zzcy(boolean z) throws RemoteException;
}
