package com.google.android.gms.common.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
/* loaded from: classes2.dex */
public interface zzr extends IInterface {

    /* loaded from: classes2.dex */
    public static abstract class zza extends Binder implements zzr {
        public zza() {
            attachInterface(this, "com.google.android.gms.common.internal.ICertData");
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            switch (i) {
                case 1:
                    parcel.enforceInterface("com.google.android.gms.common.internal.ICertData");
                    com.google.android.gms.dynamic.zzd zzaqn = zzaqn();
                    parcel2.writeNoException();
                    parcel2.writeStrongBinder(zzaqn != null ? zzaqn.asBinder() : null);
                    return true;
                case 2:
                    parcel.enforceInterface("com.google.android.gms.common.internal.ICertData");
                    int zzaqo = zzaqo();
                    parcel2.writeNoException();
                    parcel2.writeInt(zzaqo);
                    return true;
                case 1598968902:
                    parcel2.writeString("com.google.android.gms.common.internal.ICertData");
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }
    }

    com.google.android.gms.dynamic.zzd zzaqn() throws RemoteException;

    int zzaqo() throws RemoteException;
}
