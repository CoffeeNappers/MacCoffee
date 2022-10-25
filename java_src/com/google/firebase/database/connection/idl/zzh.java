package com.google.firebase.database.connection.idl;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;
import com.google.firebase.database.connection.idl.zze;
import com.google.firebase.database.connection.idl.zzg;
import com.google.firebase.database.connection.idl.zzi;
import com.google.firebase.database.connection.idl.zzj;
import java.util.List;
/* loaded from: classes2.dex */
public interface zzh extends IInterface {

    /* loaded from: classes2.dex */
    public static abstract class zza extends Binder implements zzh {

        /* renamed from: com.google.firebase.database.connection.idl.zzh$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes2.dex */
        private static class C0229zza implements zzh {
            private IBinder zzajq;

            C0229zza(IBinder iBinder) {
                this.zzajq = iBinder;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.zzajq;
            }

            @Override // com.google.firebase.database.connection.idl.zzh
            public void compareAndPut(List<String> list, com.google.android.gms.dynamic.zzd zzdVar, String str, zzj zzjVar) throws RemoteException {
                IBinder iBinder = null;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnection");
                    obtain.writeStringList(list);
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    obtain.writeString(str);
                    if (zzjVar != null) {
                        iBinder = zzjVar.asBinder();
                    }
                    obtain.writeStrongBinder(iBinder);
                    this.zzajq.transact(9, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.database.connection.idl.zzh
            public void initialize() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnection");
                    this.zzajq.transact(2, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.database.connection.idl.zzh
            public void interrupt(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnection");
                    obtain.writeString(str);
                    this.zzajq.transact(14, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.database.connection.idl.zzh
            public boolean isInterrupted(String str) throws RemoteException {
                boolean z = false;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnection");
                    obtain.writeString(str);
                    this.zzajq.transact(16, obtain, obtain2, 0);
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

            @Override // com.google.firebase.database.connection.idl.zzh
            public void listen(List<String> list, com.google.android.gms.dynamic.zzd zzdVar, zzg zzgVar, long j, zzj zzjVar) throws RemoteException {
                IBinder iBinder = null;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnection");
                    obtain.writeStringList(list);
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    obtain.writeStrongBinder(zzgVar != null ? zzgVar.asBinder() : null);
                    obtain.writeLong(j);
                    if (zzjVar != null) {
                        iBinder = zzjVar.asBinder();
                    }
                    obtain.writeStrongBinder(iBinder);
                    this.zzajq.transact(5, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.database.connection.idl.zzh
            public void merge(List<String> list, com.google.android.gms.dynamic.zzd zzdVar, zzj zzjVar) throws RemoteException {
                IBinder iBinder = null;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnection");
                    obtain.writeStringList(list);
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    if (zzjVar != null) {
                        iBinder = zzjVar.asBinder();
                    }
                    obtain.writeStrongBinder(iBinder);
                    this.zzajq.transact(10, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.database.connection.idl.zzh
            public void onDisconnectCancel(List<String> list, zzj zzjVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnection");
                    obtain.writeStringList(list);
                    obtain.writeStrongBinder(zzjVar != null ? zzjVar.asBinder() : null);
                    this.zzajq.transact(13, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.database.connection.idl.zzh
            public void onDisconnectMerge(List<String> list, com.google.android.gms.dynamic.zzd zzdVar, zzj zzjVar) throws RemoteException {
                IBinder iBinder = null;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnection");
                    obtain.writeStringList(list);
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    if (zzjVar != null) {
                        iBinder = zzjVar.asBinder();
                    }
                    obtain.writeStrongBinder(iBinder);
                    this.zzajq.transact(12, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.database.connection.idl.zzh
            public void onDisconnectPut(List<String> list, com.google.android.gms.dynamic.zzd zzdVar, zzj zzjVar) throws RemoteException {
                IBinder iBinder = null;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnection");
                    obtain.writeStringList(list);
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    if (zzjVar != null) {
                        iBinder = zzjVar.asBinder();
                    }
                    obtain.writeStrongBinder(iBinder);
                    this.zzajq.transact(11, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.database.connection.idl.zzh
            public void purgeOutstandingWrites() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnection");
                    this.zzajq.transact(7, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.database.connection.idl.zzh
            public void put(List<String> list, com.google.android.gms.dynamic.zzd zzdVar, zzj zzjVar) throws RemoteException {
                IBinder iBinder = null;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnection");
                    obtain.writeStringList(list);
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    if (zzjVar != null) {
                        iBinder = zzjVar.asBinder();
                    }
                    obtain.writeStrongBinder(iBinder);
                    this.zzajq.transact(8, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.database.connection.idl.zzh
            public void refreshAuthToken() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnection");
                    this.zzajq.transact(4, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.database.connection.idl.zzh
            public void refreshAuthToken2(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnection");
                    obtain.writeString(str);
                    this.zzajq.transact(17, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.database.connection.idl.zzh
            public void resume(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnection");
                    obtain.writeString(str);
                    this.zzajq.transact(15, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.database.connection.idl.zzh
            public void setup(ConnectionConfig connectionConfig, zze zzeVar, com.google.android.gms.dynamic.zzd zzdVar, zzi zziVar) throws RemoteException {
                IBinder iBinder = null;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnection");
                    if (connectionConfig != null) {
                        obtain.writeInt(1);
                        connectionConfig.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeStrongBinder(zzeVar != null ? zzeVar.asBinder() : null);
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    if (zziVar != null) {
                        iBinder = zziVar.asBinder();
                    }
                    obtain.writeStrongBinder(iBinder);
                    this.zzajq.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.database.connection.idl.zzh
            public void shutdown() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnection");
                    this.zzajq.transact(3, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.database.connection.idl.zzh
            public void unlisten(List<String> list, com.google.android.gms.dynamic.zzd zzdVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.database.connection.idl.IPersistentConnection");
                    obtain.writeStringList(list);
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    this.zzajq.transact(6, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public zza() {
            attachInterface(this, "com.google.firebase.database.connection.idl.IPersistentConnection");
        }

        public static zzh asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.firebase.database.connection.idl.IPersistentConnection");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof zzh)) ? new C0229zza(iBinder) : (zzh) queryLocalInterface;
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            switch (i) {
                case 1:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnection");
                    setup(parcel.readInt() != 0 ? ConnectionConfig.CREATOR.createFromParcel(parcel) : null, zze.zza.zzme(parcel.readStrongBinder()), zzd.zza.zzfd(parcel.readStrongBinder()), zzi.zza.zzmh(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 2:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnection");
                    initialize();
                    parcel2.writeNoException();
                    return true;
                case 3:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnection");
                    shutdown();
                    parcel2.writeNoException();
                    return true;
                case 4:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnection");
                    refreshAuthToken();
                    parcel2.writeNoException();
                    return true;
                case 5:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnection");
                    listen(parcel.createStringArrayList(), zzd.zza.zzfd(parcel.readStrongBinder()), zzg.zza.zzmg(parcel.readStrongBinder()), parcel.readLong(), zzj.zza.zzmi(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 6:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnection");
                    unlisten(parcel.createStringArrayList(), zzd.zza.zzfd(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 7:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnection");
                    purgeOutstandingWrites();
                    parcel2.writeNoException();
                    return true;
                case 8:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnection");
                    put(parcel.createStringArrayList(), zzd.zza.zzfd(parcel.readStrongBinder()), zzj.zza.zzmi(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 9:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnection");
                    compareAndPut(parcel.createStringArrayList(), zzd.zza.zzfd(parcel.readStrongBinder()), parcel.readString(), zzj.zza.zzmi(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 10:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnection");
                    merge(parcel.createStringArrayList(), zzd.zza.zzfd(parcel.readStrongBinder()), zzj.zza.zzmi(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 11:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnection");
                    onDisconnectPut(parcel.createStringArrayList(), zzd.zza.zzfd(parcel.readStrongBinder()), zzj.zza.zzmi(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 12:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnection");
                    onDisconnectMerge(parcel.createStringArrayList(), zzd.zza.zzfd(parcel.readStrongBinder()), zzj.zza.zzmi(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 13:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnection");
                    onDisconnectCancel(parcel.createStringArrayList(), zzj.zza.zzmi(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 14:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnection");
                    interrupt(parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 15:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnection");
                    resume(parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 16:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnection");
                    boolean isInterrupted = isInterrupted(parcel.readString());
                    parcel2.writeNoException();
                    parcel2.writeInt(isInterrupted ? 1 : 0);
                    return true;
                case 17:
                    parcel.enforceInterface("com.google.firebase.database.connection.idl.IPersistentConnection");
                    refreshAuthToken2(parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 1598968902:
                    parcel2.writeString("com.google.firebase.database.connection.idl.IPersistentConnection");
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }
    }

    void compareAndPut(List<String> list, com.google.android.gms.dynamic.zzd zzdVar, String str, zzj zzjVar) throws RemoteException;

    void initialize() throws RemoteException;

    void interrupt(String str) throws RemoteException;

    boolean isInterrupted(String str) throws RemoteException;

    void listen(List<String> list, com.google.android.gms.dynamic.zzd zzdVar, zzg zzgVar, long j, zzj zzjVar) throws RemoteException;

    void merge(List<String> list, com.google.android.gms.dynamic.zzd zzdVar, zzj zzjVar) throws RemoteException;

    void onDisconnectCancel(List<String> list, zzj zzjVar) throws RemoteException;

    void onDisconnectMerge(List<String> list, com.google.android.gms.dynamic.zzd zzdVar, zzj zzjVar) throws RemoteException;

    void onDisconnectPut(List<String> list, com.google.android.gms.dynamic.zzd zzdVar, zzj zzjVar) throws RemoteException;

    void purgeOutstandingWrites() throws RemoteException;

    void put(List<String> list, com.google.android.gms.dynamic.zzd zzdVar, zzj zzjVar) throws RemoteException;

    void refreshAuthToken() throws RemoteException;

    void refreshAuthToken2(String str) throws RemoteException;

    void resume(String str) throws RemoteException;

    void setup(ConnectionConfig connectionConfig, zze zzeVar, com.google.android.gms.dynamic.zzd zzdVar, zzi zziVar) throws RemoteException;

    void shutdown() throws RemoteException;

    void unlisten(List<String> list, com.google.android.gms.dynamic.zzd zzdVar) throws RemoteException;
}
