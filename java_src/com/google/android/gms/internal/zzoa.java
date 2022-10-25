package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.auth.api.proxy.ProxyGrpcRequest;
import com.google.android.gms.auth.api.proxy.ProxyRequest;
import com.google.android.gms.internal.zznz;
/* loaded from: classes2.dex */
public interface zzoa extends IInterface {

    /* loaded from: classes2.dex */
    public static abstract class zza extends Binder implements zzoa {

        /* renamed from: com.google.android.gms.internal.zzoa$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes2.dex */
        private static class C0124zza implements zzoa {
            private IBinder zzajq;

            C0124zza(IBinder iBinder) {
                this.zzajq = iBinder;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.zzajq;
            }

            @Override // com.google.android.gms.internal.zzoa
            public void zza(zznz zznzVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.auth.api.internal.IAuthService");
                    obtain.writeStrongBinder(zznzVar != null ? zznzVar.asBinder() : null);
                    this.zzajq.transact(3, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.zzoa
            public void zza(zznz zznzVar, ProxyGrpcRequest proxyGrpcRequest) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.auth.api.internal.IAuthService");
                    obtain.writeStrongBinder(zznzVar != null ? zznzVar.asBinder() : null);
                    if (proxyGrpcRequest != null) {
                        obtain.writeInt(1);
                        proxyGrpcRequest.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.zzajq.transact(2, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.zzoa
            public void zza(zznz zznzVar, ProxyRequest proxyRequest) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.auth.api.internal.IAuthService");
                    obtain.writeStrongBinder(zznzVar != null ? zznzVar.asBinder() : null);
                    if (proxyRequest != null) {
                        obtain.writeInt(1);
                        proxyRequest.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.zzajq.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public static zzoa zzcj(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.auth.api.internal.IAuthService");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof zzoa)) ? new C0124zza(iBinder) : (zzoa) queryLocalInterface;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            ProxyGrpcRequest proxyGrpcRequest = null;
            ProxyRequest proxyRequest = null;
            switch (i) {
                case 1:
                    parcel.enforceInterface("com.google.android.gms.auth.api.internal.IAuthService");
                    zznz zzci = zznz.zza.zzci(parcel.readStrongBinder());
                    if (parcel.readInt() != 0) {
                        proxyRequest = ProxyRequest.CREATOR.createFromParcel(parcel);
                    }
                    zza(zzci, proxyRequest);
                    parcel2.writeNoException();
                    return true;
                case 2:
                    parcel.enforceInterface("com.google.android.gms.auth.api.internal.IAuthService");
                    zznz zzci2 = zznz.zza.zzci(parcel.readStrongBinder());
                    if (parcel.readInt() != 0) {
                        proxyGrpcRequest = ProxyGrpcRequest.CREATOR.createFromParcel(parcel);
                    }
                    zza(zzci2, proxyGrpcRequest);
                    parcel2.writeNoException();
                    return true;
                case 3:
                    parcel.enforceInterface("com.google.android.gms.auth.api.internal.IAuthService");
                    zza(zznz.zza.zzci(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 1598968902:
                    parcel2.writeString("com.google.android.gms.auth.api.internal.IAuthService");
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }
    }

    void zza(zznz zznzVar) throws RemoteException;

    void zza(zznz zznzVar, ProxyGrpcRequest proxyGrpcRequest) throws RemoteException;

    void zza(zznz zznzVar, ProxyRequest proxyRequest) throws RemoteException;
}
