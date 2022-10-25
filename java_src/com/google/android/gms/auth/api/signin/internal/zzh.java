package com.google.android.gms.auth.api.signin.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.auth.api.signin.internal.zzg;
/* loaded from: classes2.dex */
public interface zzh extends IInterface {

    /* loaded from: classes2.dex */
    public static abstract class zza extends Binder implements zzh {

        /* renamed from: com.google.android.gms.auth.api.signin.internal.zzh$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes2.dex */
        private static class C0045zza implements zzh {
            private IBinder zzajq;

            C0045zza(IBinder iBinder) {
                this.zzajq = iBinder;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.zzajq;
            }

            @Override // com.google.android.gms.auth.api.signin.internal.zzh
            public void zza(zzg zzgVar, GoogleSignInOptions googleSignInOptions) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.auth.api.signin.internal.ISignInService");
                    obtain.writeStrongBinder(zzgVar != null ? zzgVar.asBinder() : null);
                    if (googleSignInOptions != null) {
                        obtain.writeInt(1);
                        googleSignInOptions.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.zzajq.transact(101, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.auth.api.signin.internal.zzh
            public void zzb(zzg zzgVar, GoogleSignInOptions googleSignInOptions) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.auth.api.signin.internal.ISignInService");
                    obtain.writeStrongBinder(zzgVar != null ? zzgVar.asBinder() : null);
                    if (googleSignInOptions != null) {
                        obtain.writeInt(1);
                        googleSignInOptions.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.zzajq.transact(102, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.auth.api.signin.internal.zzh
            public void zzc(zzg zzgVar, GoogleSignInOptions googleSignInOptions) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.auth.api.signin.internal.ISignInService");
                    obtain.writeStrongBinder(zzgVar != null ? zzgVar.asBinder() : null);
                    if (googleSignInOptions != null) {
                        obtain.writeInt(1);
                        googleSignInOptions.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.zzajq.transact(103, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public static zzh zzcm(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.auth.api.signin.internal.ISignInService");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof zzh)) ? new C0045zza(iBinder) : (zzh) queryLocalInterface;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            GoogleSignInOptions googleSignInOptions = null;
            switch (i) {
                case 101:
                    parcel.enforceInterface("com.google.android.gms.auth.api.signin.internal.ISignInService");
                    zzg zzcl = zzg.zza.zzcl(parcel.readStrongBinder());
                    if (parcel.readInt() != 0) {
                        googleSignInOptions = GoogleSignInOptions.CREATOR.createFromParcel(parcel);
                    }
                    zza(zzcl, googleSignInOptions);
                    parcel2.writeNoException();
                    return true;
                case 102:
                    parcel.enforceInterface("com.google.android.gms.auth.api.signin.internal.ISignInService");
                    zzg zzcl2 = zzg.zza.zzcl(parcel.readStrongBinder());
                    if (parcel.readInt() != 0) {
                        googleSignInOptions = GoogleSignInOptions.CREATOR.createFromParcel(parcel);
                    }
                    zzb(zzcl2, googleSignInOptions);
                    parcel2.writeNoException();
                    return true;
                case 103:
                    parcel.enforceInterface("com.google.android.gms.auth.api.signin.internal.ISignInService");
                    zzg zzcl3 = zzg.zza.zzcl(parcel.readStrongBinder());
                    if (parcel.readInt() != 0) {
                        googleSignInOptions = GoogleSignInOptions.CREATOR.createFromParcel(parcel);
                    }
                    zzc(zzcl3, googleSignInOptions);
                    parcel2.writeNoException();
                    return true;
                case 1598968902:
                    parcel2.writeString("com.google.android.gms.auth.api.signin.internal.ISignInService");
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }
    }

    void zza(zzg zzgVar, GoogleSignInOptions googleSignInOptions) throws RemoteException;

    void zzb(zzg zzgVar, GoogleSignInOptions googleSignInOptions) throws RemoteException;

    void zzc(zzg zzgVar, GoogleSignInOptions googleSignInOptions) throws RemoteException;
}
