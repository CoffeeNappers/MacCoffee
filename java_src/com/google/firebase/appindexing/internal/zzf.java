package com.google.firebase.appindexing.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.internal.zzrl;
/* loaded from: classes2.dex */
public interface zzf extends IInterface {

    /* loaded from: classes2.dex */
    public static abstract class zza extends Binder implements zzf {

        /* renamed from: com.google.firebase.appindexing.internal.zzf$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes2.dex */
        private static class C0223zza implements zzf {
            private IBinder zzajq;

            C0223zza(IBinder iBinder) {
                this.zzajq = iBinder;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.zzajq;
            }

            @Override // com.google.firebase.appindexing.internal.zzf
            public void zza(zzrl zzrlVar, UpdateTagsRequest updateTagsRequest) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.appindexing.internal.IAppIndexingService");
                    obtain.writeStrongBinder(zzrlVar != null ? zzrlVar.asBinder() : null);
                    if (updateTagsRequest != null) {
                        obtain.writeInt(1);
                        updateTagsRequest.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.zzajq.transact(4, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.appindexing.internal.zzf
            public void zza(zzrl zzrlVar, Thing[] thingArr) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.appindexing.internal.IAppIndexingService");
                    obtain.writeStrongBinder(zzrlVar != null ? zzrlVar.asBinder() : null);
                    obtain.writeTypedArray(thingArr, 0);
                    this.zzajq.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.appindexing.internal.zzf
            public void zza(zzrl zzrlVar, String[] strArr) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.appindexing.internal.IAppIndexingService");
                    obtain.writeStrongBinder(zzrlVar != null ? zzrlVar.asBinder() : null);
                    obtain.writeStringArray(strArr);
                    this.zzajq.transact(2, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.firebase.appindexing.internal.zzf
            public void zze(zzrl zzrlVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.firebase.appindexing.internal.IAppIndexingService");
                    obtain.writeStrongBinder(zzrlVar != null ? zzrlVar.asBinder() : null);
                    this.zzajq.transact(3, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public static zzf zzlz(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.firebase.appindexing.internal.IAppIndexingService");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof zzf)) ? new C0223zza(iBinder) : (zzf) queryLocalInterface;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            switch (i) {
                case 1:
                    parcel.enforceInterface("com.google.firebase.appindexing.internal.IAppIndexingService");
                    zza(zzrl.zza.zzdp(parcel.readStrongBinder()), (Thing[]) parcel.createTypedArray(Thing.CREATOR));
                    parcel2.writeNoException();
                    return true;
                case 2:
                    parcel.enforceInterface("com.google.firebase.appindexing.internal.IAppIndexingService");
                    zza(zzrl.zza.zzdp(parcel.readStrongBinder()), parcel.createStringArray());
                    parcel2.writeNoException();
                    return true;
                case 3:
                    parcel.enforceInterface("com.google.firebase.appindexing.internal.IAppIndexingService");
                    zze(zzrl.zza.zzdp(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    return true;
                case 4:
                    parcel.enforceInterface("com.google.firebase.appindexing.internal.IAppIndexingService");
                    zza(zzrl.zza.zzdp(parcel.readStrongBinder()), parcel.readInt() != 0 ? UpdateTagsRequest.CREATOR.createFromParcel(parcel) : null);
                    parcel2.writeNoException();
                    return true;
                case 1598968902:
                    parcel2.writeString("com.google.firebase.appindexing.internal.IAppIndexingService");
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }
    }

    void zza(zzrl zzrlVar, UpdateTagsRequest updateTagsRequest) throws RemoteException;

    void zza(zzrl zzrlVar, Thing[] thingArr) throws RemoteException;

    void zza(zzrl zzrlVar, String[] strArr) throws RemoteException;

    void zze(zzrl zzrlVar) throws RemoteException;
}
