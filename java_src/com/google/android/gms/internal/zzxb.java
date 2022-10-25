package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.internal.zzxa;
/* loaded from: classes2.dex */
public interface zzxb extends IInterface {

    /* loaded from: classes2.dex */
    public static abstract class zza extends Binder implements zzxb {

        /* renamed from: com.google.android.gms.internal.zzxb$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes2.dex */
        private static class C0142zza implements zzxb {
            private IBinder zzajq;

            C0142zza(IBinder iBinder) {
                this.zzajq = iBinder;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.zzajq;
            }

            @Override // com.google.android.gms.internal.zzxb
            public void zza(zzxa zzxaVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.safetynet.internal.ISafetyNetService");
                    obtain.writeStrongBinder(zzxaVar != null ? zzxaVar.asBinder() : null);
                    this.zzajq.transact(2, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.zzxb
            public void zza(zzxa zzxaVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.safetynet.internal.ISafetyNetService");
                    obtain.writeStrongBinder(zzxaVar != null ? zzxaVar.asBinder() : null);
                    obtain.writeString(str);
                    this.zzajq.transact(6, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.zzxb
            public void zza(zzxa zzxaVar, String str, int[] iArr, int i, String str2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.safetynet.internal.ISafetyNetService");
                    obtain.writeStrongBinder(zzxaVar != null ? zzxaVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeIntArray(iArr);
                    obtain.writeInt(i);
                    obtain.writeString(str2);
                    this.zzajq.transact(3, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.zzxb
            public void zza(zzxa zzxaVar, byte[] bArr) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.safetynet.internal.ISafetyNetService");
                    obtain.writeStrongBinder(zzxaVar != null ? zzxaVar.asBinder() : null);
                    obtain.writeByteArray(bArr);
                    this.zzajq.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.zzxb
            public void zza(zzxa zzxaVar, byte[] bArr, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.safetynet.internal.ISafetyNetService");
                    obtain.writeStrongBinder(zzxaVar != null ? zzxaVar.asBinder() : null);
                    obtain.writeByteArray(bArr);
                    obtain.writeString(str);
                    this.zzajq.transact(7, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.zzxb
            public void zzb(zzxa zzxaVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.safetynet.internal.ISafetyNetService");
                    obtain.writeStrongBinder(zzxaVar != null ? zzxaVar.asBinder() : null);
                    this.zzajq.transact(4, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.zzxb
            public void zzc(zzxa zzxaVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.safetynet.internal.ISafetyNetService");
                    obtain.writeStrongBinder(zzxaVar != null ? zzxaVar.asBinder() : null);
                    this.zzajq.transact(5, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public static zzxb zzkq(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.safetynet.internal.ISafetyNetService");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof zzxb)) ? new C0142zza(iBinder) : (zzxb) queryLocalInterface;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            switch (i) {
                case 1:
                    parcel.enforceInterface("com.google.android.gms.safetynet.internal.ISafetyNetService");
                    zza(zzxa.zza.zzkp(parcel.readStrongBinder()), parcel.createByteArray());
                    parcel2.writeNoException();
                    return true;
                case 2:
                    parcel.enforceInterface("com.google.android.gms.safetynet.internal.ISafetyNetService");
                    zza(zzxa.zza.zzkp(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 3:
                    parcel.enforceInterface("com.google.android.gms.safetynet.internal.ISafetyNetService");
                    zza(zzxa.zza.zzkp(parcel.readStrongBinder()), parcel.readString(), parcel.createIntArray(), parcel.readInt(), parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 4:
                    parcel.enforceInterface("com.google.android.gms.safetynet.internal.ISafetyNetService");
                    zzb(zzxa.zza.zzkp(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 5:
                    parcel.enforceInterface("com.google.android.gms.safetynet.internal.ISafetyNetService");
                    zzc(zzxa.zza.zzkp(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 6:
                    parcel.enforceInterface("com.google.android.gms.safetynet.internal.ISafetyNetService");
                    zza(zzxa.zza.zzkp(parcel.readStrongBinder()), parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 7:
                    parcel.enforceInterface("com.google.android.gms.safetynet.internal.ISafetyNetService");
                    zza(zzxa.zza.zzkp(parcel.readStrongBinder()), parcel.createByteArray(), parcel.readString());
                    parcel2.writeNoException();
                    return true;
                case 1598968902:
                    parcel2.writeString("com.google.android.gms.safetynet.internal.ISafetyNetService");
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }
    }

    void zza(zzxa zzxaVar) throws RemoteException;

    void zza(zzxa zzxaVar, String str) throws RemoteException;

    void zza(zzxa zzxaVar, String str, int[] iArr, int i, String str2) throws RemoteException;

    void zza(zzxa zzxaVar, byte[] bArr) throws RemoteException;

    void zza(zzxa zzxaVar, byte[] bArr, String str) throws RemoteException;

    void zzb(zzxa zzxaVar) throws RemoteException;

    void zzc(zzxa zzxaVar) throws RemoteException;
}
