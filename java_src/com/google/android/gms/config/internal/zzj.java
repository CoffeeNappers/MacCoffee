package com.google.android.gms.config.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.config.internal.zzi;
import com.google.android.gms.phenotype.Configuration;
import java.util.List;
/* loaded from: classes2.dex */
public interface zzj extends IInterface {

    /* loaded from: classes2.dex */
    public static abstract class zza extends Binder implements zzj {

        /* renamed from: com.google.android.gms.config.internal.zzj$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes2.dex */
        private static class C0061zza implements zzj {
            private IBinder zzajq;

            C0061zza(IBinder iBinder) {
                this.zzajq = iBinder;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.zzajq;
            }

            @Override // com.google.android.gms.config.internal.zzj
            public void zza(zzi zziVar, FetchConfigIpcRequest fetchConfigIpcRequest) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.config.internal.IConfigService");
                    obtain.writeStrongBinder(zziVar != null ? zziVar.asBinder() : null);
                    if (fetchConfigIpcRequest != null) {
                        obtain.writeInt(1);
                        fetchConfigIpcRequest.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.zzajq.transact(8, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.config.internal.zzj
            public void zza(zzi zziVar, String str, Configuration configuration, String str2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.config.internal.IConfigService");
                    obtain.writeStrongBinder(zziVar != null ? zziVar.asBinder() : null);
                    obtain.writeString(str);
                    if (configuration != null) {
                        obtain.writeInt(1);
                        configuration.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeString(str2);
                    this.zzajq.transact(7, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.config.internal.zzj
            public void zza(zzi zziVar, String str, String str2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.config.internal.IConfigService");
                    obtain.writeStrongBinder(zziVar != null ? zziVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    this.zzajq.transact(4, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.config.internal.zzj
            public void zza(zzi zziVar, String str, List list) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.config.internal.IConfigService");
                    obtain.writeStrongBinder(zziVar != null ? zziVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeList(list);
                    this.zzajq.transact(6, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.config.internal.zzj
            public void zzb(zzi zziVar, String str, String str2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.config.internal.IConfigService");
                    obtain.writeStrongBinder(zziVar != null ? zziVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    this.zzajq.transact(5, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public static zzj zzee(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.config.internal.IConfigService");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof zzj)) ? new C0061zza(iBinder) : (zzj) queryLocalInterface;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            FetchConfigIpcRequest fetchConfigIpcRequest = null;
            Configuration configuration = null;
            switch (i) {
                case 4:
                    parcel.enforceInterface("com.google.android.gms.config.internal.IConfigService");
                    zza(zzi.zza.zzed(parcel.readStrongBinder()), parcel.readString(), parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 5:
                    parcel.enforceInterface("com.google.android.gms.config.internal.IConfigService");
                    zzb(zzi.zza.zzed(parcel.readStrongBinder()), parcel.readString(), parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 6:
                    parcel.enforceInterface("com.google.android.gms.config.internal.IConfigService");
                    zza(zzi.zza.zzed(parcel.readStrongBinder()), parcel.readString(), parcel.readArrayList(getClass().getClassLoader()));
                    parcel2.writeNoException();
                    return true;
                case 7:
                    parcel.enforceInterface("com.google.android.gms.config.internal.IConfigService");
                    zzi zzed = zzi.zza.zzed(parcel.readStrongBinder());
                    String readString = parcel.readString();
                    if (parcel.readInt() != 0) {
                        configuration = Configuration.CREATOR.createFromParcel(parcel);
                    }
                    zza(zzed, readString, configuration, parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 8:
                    parcel.enforceInterface("com.google.android.gms.config.internal.IConfigService");
                    zzi zzed2 = zzi.zza.zzed(parcel.readStrongBinder());
                    if (parcel.readInt() != 0) {
                        fetchConfigIpcRequest = FetchConfigIpcRequest.CREATOR.createFromParcel(parcel);
                    }
                    zza(zzed2, fetchConfigIpcRequest);
                    parcel2.writeNoException();
                    return true;
                case 1598968902:
                    parcel2.writeString("com.google.android.gms.config.internal.IConfigService");
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }
    }

    void zza(zzi zziVar, FetchConfigIpcRequest fetchConfigIpcRequest) throws RemoteException;

    void zza(zzi zziVar, String str, Configuration configuration, String str2) throws RemoteException;

    void zza(zzi zziVar, String str, String str2) throws RemoteException;

    void zza(zzi zziVar, String str, List list) throws RemoteException;

    void zzb(zzi zziVar, String str, String str2) throws RemoteException;
}
