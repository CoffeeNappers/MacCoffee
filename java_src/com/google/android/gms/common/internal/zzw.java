package com.google.android.gms.common.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;
/* loaded from: classes2.dex */
public interface zzw extends IInterface {

    /* loaded from: classes2.dex */
    public static abstract class zza extends Binder implements zzw {

        /* renamed from: com.google.android.gms.common.internal.zzw$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes2.dex */
        private static class C0056zza implements zzw {
            private IBinder zzajq;

            C0056zza(IBinder iBinder) {
                this.zzajq = iBinder;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.zzajq;
            }

            @Override // com.google.android.gms.common.internal.zzw
            public com.google.android.gms.dynamic.zzd zza(com.google.android.gms.dynamic.zzd zzdVar, int i, int i2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.common.internal.ISignInButtonCreator");
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    obtain.writeInt(i);
                    obtain.writeInt(i2);
                    this.zzajq.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzd.zza.zzfd(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.common.internal.zzw
            public com.google.android.gms.dynamic.zzd zza(com.google.android.gms.dynamic.zzd zzdVar, SignInButtonConfig signInButtonConfig) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.common.internal.ISignInButtonCreator");
                    obtain.writeStrongBinder(zzdVar != null ? zzdVar.asBinder() : null);
                    if (signInButtonConfig != null) {
                        obtain.writeInt(1);
                        signInButtonConfig.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.zzajq.transact(2, obtain, obtain2, 0);
                    obtain2.readException();
                    return zzd.zza.zzfd(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public static zzw zzdx(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.common.internal.ISignInButtonCreator");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof zzw)) ? new C0056zza(iBinder) : (zzw) queryLocalInterface;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            IBinder iBinder = null;
            switch (i) {
                case 1:
                    parcel.enforceInterface("com.google.android.gms.common.internal.ISignInButtonCreator");
                    com.google.android.gms.dynamic.zzd zza = zza(zzd.zza.zzfd(parcel.readStrongBinder()), parcel.readInt(), parcel.readInt());
                    parcel2.writeNoException();
                    parcel2.writeStrongBinder(zza != null ? zza.asBinder() : null);
                    return true;
                case 2:
                    parcel.enforceInterface("com.google.android.gms.common.internal.ISignInButtonCreator");
                    com.google.android.gms.dynamic.zzd zza2 = zza(zzd.zza.zzfd(parcel.readStrongBinder()), parcel.readInt() != 0 ? SignInButtonConfig.CREATOR.createFromParcel(parcel) : null);
                    parcel2.writeNoException();
                    if (zza2 != null) {
                        iBinder = zza2.asBinder();
                    }
                    parcel2.writeStrongBinder(iBinder);
                    return true;
                case 1598968902:
                    parcel2.writeString("com.google.android.gms.common.internal.ISignInButtonCreator");
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }
    }

    com.google.android.gms.dynamic.zzd zza(com.google.android.gms.dynamic.zzd zzdVar, int i, int i2) throws RemoteException;

    com.google.android.gms.dynamic.zzd zza(com.google.android.gms.dynamic.zzd zzdVar, SignInButtonConfig signInButtonConfig) throws RemoteException;
}
