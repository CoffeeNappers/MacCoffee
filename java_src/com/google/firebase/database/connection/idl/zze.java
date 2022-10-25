package com.google.firebase.database.connection.idl;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.firebase.database.connection.idl.zzf;
/* loaded from: classes2.dex */
public interface zze extends IInterface {

    /* loaded from: classes2.dex */
    public static abstract class zza extends Binder implements zze {

        /* renamed from: com.google.firebase.database.connection.idl.zze$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes2.dex */
        private static class C0226zza implements zze {
            private IBinder zzajq;

            C0226zza(IBinder iBinder) {
                this.zzajq = iBinder;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.zzajq;
            }

            @Override // com.google.firebase.database.connection.idl.zze
            public void zza(boolean z, zzf zzfVar) throws RemoteException {
                int i = 1;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IConnectionAuthTokenProvider");
                    if (!z) {
                        i = 0;
                    }
                    obtain.writeInt(i);
                    obtain.writeStrongBinder(zzfVar != null ? zzfVar.asBinder() : null);
                    this.zzajq.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public zza() {
            attachInterface(this, "com.google.firebase.database.connection.idl.IConnectionAuthTokenProvider");
        }

        public static zze zzme(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.firebase.database.connection.idl.IConnectionAuthTokenProvider");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof zze)) ? new C0226zza(iBinder) : (zze) queryLocalInterface;
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            switch (i) {
                case 1:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IConnectionAuthTokenProvider");
                    zza(parcel.readInt() != 0, zzf.zza.zzmf(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 1598968902:
                    parcel2.writeString("com.google.firebase.database.connection.idl.IConnectionAuthTokenProvider");
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }
    }

    void zza(boolean z, zzf zzfVar) throws RemoteException;
}
