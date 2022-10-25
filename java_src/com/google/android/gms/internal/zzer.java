package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.internal.zzem;
/* loaded from: classes2.dex */
public interface zzer extends IInterface {

    /* loaded from: classes2.dex */
    public static abstract class zza extends Binder implements zzer {

        /* renamed from: com.google.android.gms.internal.zzer$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes2.dex */
        private static class C0091zza implements zzer {
            private IBinder zzajq;

            C0091zza(IBinder iBinder) {
                this.zzajq = iBinder;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.zzajq;
            }

            @Override // com.google.android.gms.internal.zzer
            public void zza(zzem zzemVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.formats.client.IOnContentAdLoadedListener");
                    obtain.writeStrongBinder(zzemVar != null ? zzemVar.asBinder() : null);
                    this.zzajq.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public zza() {
            attachInterface(this, "com.google.android.gms.ads.internal.formats.client.IOnContentAdLoadedListener");
        }

        public static zzer zzai(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.ads.internal.formats.client.IOnContentAdLoadedListener");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof zzer)) ? new C0091zza(iBinder) : (zzer) queryLocalInterface;
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            switch (i) {
                case 1:
                    parcel.enforceInterface("com.google.android.gms.ads.internal.formats.client.IOnContentAdLoadedListener");
                    zza(zzem.zza.zzaf(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 1598968902:
                    parcel2.writeString("com.google.android.gms.ads.internal.formats.client.IOnContentAdLoadedListener");
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }
    }

    void zza(zzem zzemVar) throws RemoteException;
}
