package com.google.android.gms.ads.internal.request;

import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable;
import com.google.android.gms.ads.internal.zzu;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkx;
import java.io.DataInputStream;
import java.io.IOException;
@zzji
/* loaded from: classes.dex */
public final class LargeParcelTeleporter extends AbstractSafeParcelable {
    public static final Parcelable.Creator<LargeParcelTeleporter> CREATOR = new zzm();
    final int mVersionCode;
    ParcelFileDescriptor zzcme;
    private Parcelable zzcmf;
    private boolean zzcmg;

    /* JADX INFO: Access modifiers changed from: package-private */
    public LargeParcelTeleporter(int i, ParcelFileDescriptor parcelFileDescriptor) {
        this.mVersionCode = i;
        this.zzcme = parcelFileDescriptor;
        this.zzcmf = null;
        this.zzcmg = true;
    }

    public LargeParcelTeleporter(SafeParcelable safeParcelable) {
        this.mVersionCode = 1;
        this.zzcme = null;
        this.zzcmf = safeParcelable;
        this.zzcmg = false;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        if (this.zzcme == null) {
            Parcel obtain = Parcel.obtain();
            try {
                this.zzcmf.writeToParcel(obtain, 0);
                byte[] marshall = obtain.marshall();
                obtain.recycle();
                this.zzcme = zzj(marshall);
            } catch (Throwable th) {
                obtain.recycle();
                throw th;
            }
        }
        zzm.zza(this, parcel, i);
    }

    public <T extends SafeParcelable> T zza(Parcelable.Creator<T> creator) {
        if (this.zzcmg) {
            if (this.zzcme == null) {
                zzkx.e("File descriptor is empty, returning null.");
                return null;
            }
            DataInputStream dataInputStream = new DataInputStream(new ParcelFileDescriptor.AutoCloseInputStream(this.zzcme));
            try {
                try {
                    byte[] bArr = new byte[dataInputStream.readInt()];
                    dataInputStream.readFully(bArr, 0, bArr.length);
                    com.google.android.gms.common.util.zzo.zzb(dataInputStream);
                    Parcel obtain = Parcel.obtain();
                    try {
                        obtain.unmarshall(bArr, 0, bArr.length);
                        obtain.setDataPosition(0);
                        this.zzcmf = creator.createFromParcel(obtain);
                        obtain.recycle();
                        this.zzcmg = false;
                    } catch (Throwable th) {
                        obtain.recycle();
                        throw th;
                    }
                } catch (IOException e) {
                    throw new IllegalStateException("Could not read from parcel file descriptor", e);
                }
            } catch (Throwable th2) {
                com.google.android.gms.common.util.zzo.zzb(dataInputStream);
                throw th2;
            }
        }
        return (T) this.zzcmf;
    }

    protected <T> ParcelFileDescriptor zzj(final byte[] bArr) {
        final ParcelFileDescriptor.AutoCloseOutputStream autoCloseOutputStream;
        try {
            ParcelFileDescriptor[] createPipe = ParcelFileDescriptor.createPipe();
            autoCloseOutputStream = new ParcelFileDescriptor.AutoCloseOutputStream(createPipe[1]);
            try {
                new Thread(new Runnable() { // from class: com.google.android.gms.ads.internal.request.LargeParcelTeleporter.1
                    /* JADX WARN: Removed duplicated region for block: B:16:0x0039  */
                    /* JADX WARN: Removed duplicated region for block: B:18:0x003f  */
                    @Override // java.lang.Runnable
                    /*
                        Code decompiled incorrectly, please refer to instructions dump.
                        To view partially-correct add '--show-bad-code' argument
                    */
                    public void run() {
                        /*
                            r4 = this;
                            r2 = 0
                            java.io.DataOutputStream r1 = new java.io.DataOutputStream     // Catch: java.io.IOException -> L17 java.lang.Throwable -> L35
                            java.io.OutputStream r0 = r2     // Catch: java.io.IOException -> L17 java.lang.Throwable -> L35
                            r1.<init>(r0)     // Catch: java.io.IOException -> L17 java.lang.Throwable -> L35
                            byte[] r0 = r3     // Catch: java.lang.Throwable -> L43 java.io.IOException -> L45
                            int r0 = r0.length     // Catch: java.lang.Throwable -> L43 java.io.IOException -> L45
                            r1.writeInt(r0)     // Catch: java.lang.Throwable -> L43 java.io.IOException -> L45
                            byte[] r0 = r3     // Catch: java.lang.Throwable -> L43 java.io.IOException -> L45
                            r1.write(r0)     // Catch: java.lang.Throwable -> L43 java.io.IOException -> L45
                            com.google.android.gms.common.util.zzo.zzb(r1)
                        L16:
                            return
                        L17:
                            r0 = move-exception
                            r1 = r2
                        L19:
                            java.lang.String r2 = "Error transporting the ad response"
                            com.google.android.gms.internal.zzkx.zzb(r2, r0)     // Catch: java.lang.Throwable -> L43
                            com.google.android.gms.internal.zzkr r2 = com.google.android.gms.ads.internal.zzu.zzgq()     // Catch: java.lang.Throwable -> L43
                            java.lang.String r3 = "LargeParcelTeleporter.pipeData.1"
                            r2.zza(r0, r3)     // Catch: java.lang.Throwable -> L43
                            if (r1 != 0) goto L31
                            java.io.OutputStream r0 = r2
                            com.google.android.gms.common.util.zzo.zzb(r0)
                            goto L16
                        L31:
                            com.google.android.gms.common.util.zzo.zzb(r1)
                            goto L16
                        L35:
                            r0 = move-exception
                            r1 = r2
                        L37:
                            if (r1 != 0) goto L3f
                            java.io.OutputStream r1 = r2
                            com.google.android.gms.common.util.zzo.zzb(r1)
                        L3e:
                            throw r0
                        L3f:
                            com.google.android.gms.common.util.zzo.zzb(r1)
                            goto L3e
                        L43:
                            r0 = move-exception
                            goto L37
                        L45:
                            r0 = move-exception
                            goto L19
                        */
                        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.ads.internal.request.LargeParcelTeleporter.AnonymousClass1.run():void");
                    }
                }).start();
                return createPipe[0];
            } catch (IOException e) {
                e = e;
                zzkx.zzb("Error transporting the ad response", e);
                zzu.zzgq().zza(e, "LargeParcelTeleporter.pipeData.2");
                com.google.android.gms.common.util.zzo.zzb(autoCloseOutputStream);
                return null;
            }
        } catch (IOException e2) {
            e = e2;
            autoCloseOutputStream = null;
        }
    }
}
