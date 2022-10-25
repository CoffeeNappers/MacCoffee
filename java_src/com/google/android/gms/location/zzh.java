package com.google.android.gms.location;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
/* loaded from: classes2.dex */
public interface zzh extends IInterface {

    /* loaded from: classes2.dex */
    public static abstract class zza extends Binder implements zzh {

        /* renamed from: com.google.android.gms.location.zzh$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes2.dex */
        private static class C0150zza implements zzh {
            private IBinder zzajq;

            C0150zza(IBinder iBinder) {
                this.zzajq = iBinder;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.zzajq;
            }

            @Override // com.google.android.gms.location.zzh
            public void onLocationAvailability(LocationAvailability locationAvailability) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.ILocationCallback");
                    if (locationAvailability != null) {
                        obtain.writeInt(1);
                        locationAvailability.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.zzajq.transact(2, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.location.zzh
            public void onLocationResult(LocationResult locationResult) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.ILocationCallback");
                    if (locationResult != null) {
                        obtain.writeInt(1);
                        locationResult.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.zzajq.transact(1, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }
        }

        public zza() {
            attachInterface(this, "com.google.android.gms.location.ILocationCallback");
        }

        public static zzh zzhb(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.location.ILocationCallback");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof zzh)) ? new C0150zza(iBinder) : (zzh) queryLocalInterface;
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            LocationAvailability locationAvailability = null;
            LocationResult locationResult = null;
            switch (i) {
                case 1:
                    parcel.enforceInterface("com.google.android.gms.location.ILocationCallback");
                    if (parcel.readInt() != 0) {
                        locationResult = LocationResult.CREATOR.createFromParcel(parcel);
                    }
                    onLocationResult(locationResult);
                    return true;
                case 2:
                    parcel.enforceInterface("com.google.android.gms.location.ILocationCallback");
                    if (parcel.readInt() != 0) {
                        locationAvailability = LocationAvailability.CREATOR.createFromParcel(parcel);
                    }
                    onLocationAvailability(locationAvailability);
                    return true;
                case 1598968902:
                    parcel2.writeString("com.google.android.gms.location.ILocationCallback");
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }
    }

    void onLocationAvailability(LocationAvailability locationAvailability) throws RemoteException;

    void onLocationResult(LocationResult locationResult) throws RemoteException;
}
