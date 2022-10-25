package com.google.firebase.database.connection.idl;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
/* loaded from: classes2.dex */
public interface zzg extends IInterface {

    /* loaded from: classes2.dex */
    public static abstract class zza extends Binder implements zzg {

        /* renamed from: com.google.firebase.database.connection.idl.zzg$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes2.dex */
        private static class C0228zza implements zzg {
            private IBinder zzajq;

            C0228zza(IBinder iBinder) {
                this.zzajq = iBinder;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.zzajq;
            }

            @Override // com.google.firebase.database.connection.idl.zzg
            public String zzcsm() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IListenHashProvider");
                    this.zzajq.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readString();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.database.connection.idl.zzg
            public boolean zzcsn() throws RemoteException {
                boolean z = false;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IListenHashProvider");
                    this.zzajq.transact(2, obtain, obtain2, 0);
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

            @Override // com.google.firebase.database.connection.idl.zzg
            public CompoundHashParcelable zzctw() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IListenHashProvider");
                    this.zzajq.transact(3, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? CompoundHashParcelable.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public zza() {
            attachInterface(this, "com.google.firebase.database.connection.idl.IListenHashProvider");
        }

        public static zzg zzmg(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.firebase.database.connection.idl.IListenHashProvider");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof zzg)) ? new C0228zza(iBinder) : (zzg) queryLocalInterface;
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            int i3 = 0;
            switch (i) {
                case 1:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IListenHashProvider");
                    String zzcsm = zzcsm();
                    parcel2.writeNoException();
                    parcel2.writeString(zzcsm);
                    return true;
                case 2:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IListenHashProvider");
                    boolean zzcsn = zzcsn();
                    parcel2.writeNoException();
                    if (zzcsn) {
                        i3 = 1;
                    }
                    parcel2.writeInt(i3);
                    return true;
                case 3:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IListenHashProvider");
                    CompoundHashParcelable zzctw = zzctw();
                    parcel2.writeNoException();
                    if (zzctw == null) {
                        parcel2.writeInt(0);
                        return true;
                    }
                    parcel2.writeInt(1);
                    zzctw.writeToParcel(parcel2, 1);
                    return true;
                case 1598968902:
                    parcel2.writeString("com.google.firebase.database.connection.idl.IListenHashProvider");
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }
    }

    String zzcsm() throws RemoteException;

    boolean zzcsn() throws RemoteException;

    CompoundHashParcelable zzctw() throws RemoteException;
}
