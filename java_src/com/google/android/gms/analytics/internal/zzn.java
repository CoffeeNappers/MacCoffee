package com.google.android.gms.analytics.internal;

import android.content.Context;
import com.facebook.appevents.AppEventsConstants;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
/* loaded from: classes2.dex */
public class zzn extends zzd {
    private volatile String cj;
    private Future<String> dU;

    /* JADX INFO: Access modifiers changed from: protected */
    public zzn(zzf zzfVar) {
        super(zzfVar);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String zzaeb() {
        String zzaec = zzaec();
        try {
            return !zzq(zzacc().getContext(), zzaec) ? AppEventsConstants.EVENT_PARAM_VALUE_NO : zzaec;
        } catch (Exception e) {
            zze("Error saving clientId file", e);
            return AppEventsConstants.EVENT_PARAM_VALUE_NO;
        }
    }

    private boolean zzq(Context context, String str) {
        com.google.android.gms.common.internal.zzaa.zzib(str);
        com.google.android.gms.common.internal.zzaa.zzht("ClientId should be saved from worker thread");
        FileOutputStream fileOutputStream = null;
        try {
            try {
                zza("Storing clientId", str);
                fileOutputStream = context.openFileOutput("gaClientId", 0);
                fileOutputStream.write(str.getBytes());
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.close();
                    } catch (IOException e) {
                        zze("Failed to close clientId writing stream", e);
                    }
                }
                return true;
            } catch (Throwable th) {
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.close();
                    } catch (IOException e2) {
                        zze("Failed to close clientId writing stream", e2);
                    }
                }
                throw th;
            }
        } catch (FileNotFoundException e3) {
            zze("Error creating clientId file", e3);
            if (fileOutputStream == null) {
                return false;
            }
            try {
                fileOutputStream.close();
                return false;
            } catch (IOException e4) {
                zze("Failed to close clientId writing stream", e4);
                return false;
            }
        } catch (IOException e5) {
            zze("Error writing to clientId file", e5);
            if (fileOutputStream == null) {
                return false;
            }
            try {
                fileOutputStream.close();
                return false;
            } catch (IOException e6) {
                zze("Failed to close clientId writing stream", e6);
                return false;
            }
        }
    }

    public String zzady() {
        String str;
        zzacj();
        synchronized (this) {
            if (this.cj == null) {
                this.dU = zzacc().zzc(new Callable<String>() { // from class: com.google.android.gms.analytics.internal.zzn.1
                    @Override // java.util.concurrent.Callable
                    /* renamed from: zzaed */
                    public String call() throws Exception {
                        return zzn.this.zzaea();
                    }
                });
            }
            if (this.dU != null) {
                try {
                    this.cj = this.dU.get();
                } catch (InterruptedException e) {
                    zzd("ClientId loading or generation was interrupted", e);
                    this.cj = AppEventsConstants.EVENT_PARAM_VALUE_NO;
                } catch (ExecutionException e2) {
                    zze("Failed to load or generate client id", e2);
                    this.cj = AppEventsConstants.EVENT_PARAM_VALUE_NO;
                }
                if (this.cj == null) {
                    this.cj = AppEventsConstants.EVENT_PARAM_VALUE_NO;
                }
                zza("Loaded clientId", this.cj);
                this.dU = null;
            }
            str = this.cj;
        }
        return str;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String zzadz() {
        synchronized (this) {
            this.cj = null;
            this.dU = zzacc().zzc(new Callable<String>() { // from class: com.google.android.gms.analytics.internal.zzn.2
                @Override // java.util.concurrent.Callable
                /* renamed from: zzaed */
                public String call() throws Exception {
                    return zzn.this.zzaeb();
                }
            });
        }
        return zzady();
    }

    String zzaea() {
        String zzay = zzay(zzacc().getContext());
        return zzay == null ? zzaeb() : zzay;
    }

    protected String zzaec() {
        return UUID.randomUUID().toString().toLowerCase();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:57:0x007f A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:66:0x009b A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00ac A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r2v17 */
    /* JADX WARN: Type inference failed for: r2v21 */
    /* JADX WARN: Type inference failed for: r2v24 */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:37:0x0099 -> B:63:0x0033). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:38:0x009b -> B:63:0x0033). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:41:0x00a0 -> B:63:0x0033). Please submit an issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected java.lang.String zzay(android.content.Context r7) {
        /*
            r6 = this;
            r0 = 0
            java.lang.String r1 = "ClientId should be loaded from worker thread"
            com.google.android.gms.common.internal.zzaa.zzht(r1)
            java.lang.String r1 = "gaClientId"
            java.io.FileInputStream r2 = r7.openFileInput(r1)     // Catch: java.io.FileNotFoundException -> L7b java.io.IOException -> L8b java.lang.Throwable -> La7
            r1 = 36
            byte[] r3 = new byte[r1]     // Catch: java.lang.Throwable -> Lb8 java.io.IOException -> Lba java.io.FileNotFoundException -> Lbc
            r1 = 0
            r4 = 36
            int r4 = r2.read(r3, r1, r4)     // Catch: java.lang.Throwable -> Lb8 java.io.IOException -> Lba java.io.FileNotFoundException -> Lbc
            int r1 = r2.available()     // Catch: java.lang.Throwable -> Lb8 java.io.IOException -> Lba java.io.FileNotFoundException -> Lbc
            if (r1 <= 0) goto L3c
            java.lang.String r1 = "clientId file seems corrupted, deleting it."
            r6.zzev(r1)     // Catch: java.lang.Throwable -> Lb8 java.io.IOException -> Lba java.io.FileNotFoundException -> Lbc
            r2.close()     // Catch: java.lang.Throwable -> Lb8 java.io.IOException -> Lba java.io.FileNotFoundException -> Lbc
            java.lang.String r1 = "gaClientId"
            r7.deleteFile(r1)     // Catch: java.lang.Throwable -> Lb8 java.io.IOException -> Lba java.io.FileNotFoundException -> Lbc
            if (r2 == 0) goto L33
            r2.close()     // Catch: java.io.IOException -> L34
        L33:
            return r0
        L34:
            r1 = move-exception
            java.lang.String r2 = "Failed to close client id reading stream"
            r6.zze(r2, r1)
            goto L33
        L3c:
            r1 = 14
            if (r4 >= r1) goto L5d
            java.lang.String r1 = "clientId file is empty, deleting it."
            r6.zzev(r1)     // Catch: java.lang.Throwable -> Lb8 java.io.IOException -> Lba java.io.FileNotFoundException -> Lbc
            r2.close()     // Catch: java.lang.Throwable -> Lb8 java.io.IOException -> Lba java.io.FileNotFoundException -> Lbc
            java.lang.String r1 = "gaClientId"
            r7.deleteFile(r1)     // Catch: java.lang.Throwable -> Lb8 java.io.IOException -> Lba java.io.FileNotFoundException -> Lbc
            if (r2 == 0) goto L33
            r2.close()     // Catch: java.io.IOException -> L55
            goto L33
        L55:
            r1 = move-exception
            java.lang.String r2 = "Failed to close client id reading stream"
            r6.zze(r2, r1)
            goto L33
        L5d:
            r2.close()     // Catch: java.lang.Throwable -> Lb8 java.io.IOException -> Lba java.io.FileNotFoundException -> Lbc
            java.lang.String r1 = new java.lang.String     // Catch: java.lang.Throwable -> Lb8 java.io.IOException -> Lba java.io.FileNotFoundException -> Lbc
            r5 = 0
            r1.<init>(r3, r5, r4)     // Catch: java.lang.Throwable -> Lb8 java.io.IOException -> Lba java.io.FileNotFoundException -> Lbc
            java.lang.String r3 = "Read client id from disk"
            r6.zza(r3, r1)     // Catch: java.lang.Throwable -> Lb8 java.io.IOException -> Lba java.io.FileNotFoundException -> Lbc
            if (r2 == 0) goto L71
            r2.close()     // Catch: java.io.IOException -> L73
        L71:
            r0 = r1
            goto L33
        L73:
            r0 = move-exception
            java.lang.String r2 = "Failed to close client id reading stream"
            r6.zze(r2, r0)
            goto L71
        L7b:
            r1 = move-exception
            r1 = r0
        L7d:
            if (r1 == 0) goto L33
            r1.close()     // Catch: java.io.IOException -> L83
            goto L33
        L83:
            r1 = move-exception
            java.lang.String r2 = "Failed to close client id reading stream"
            r6.zze(r2, r1)
            goto L33
        L8b:
            r1 = move-exception
            r2 = r0
        L8d:
            java.lang.String r3 = "Error reading client id file, deleting it"
            r6.zze(r3, r1)     // Catch: java.lang.Throwable -> Lb8
            java.lang.String r1 = "gaClientId"
            r7.deleteFile(r1)     // Catch: java.lang.Throwable -> Lb8
            if (r2 == 0) goto L33
            r2.close()     // Catch: java.io.IOException -> L9f
            goto L33
        L9f:
            r1 = move-exception
            java.lang.String r2 = "Failed to close client id reading stream"
            r6.zze(r2, r1)
            goto L33
        La7:
            r1 = move-exception
            r2 = r0
            r0 = r1
        Laa:
            if (r2 == 0) goto Laf
            r2.close()     // Catch: java.io.IOException -> Lb0
        Laf:
            throw r0
        Lb0:
            r1 = move-exception
            java.lang.String r2 = "Failed to close client id reading stream"
            r6.zze(r2, r1)
            goto Laf
        Lb8:
            r0 = move-exception
            goto Laa
        Lba:
            r1 = move-exception
            goto L8d
        Lbc:
            r1 = move-exception
            r1 = r2
            goto L7d
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.analytics.internal.zzn.zzay(android.content.Context):java.lang.String");
    }

    @Override // com.google.android.gms.analytics.internal.zzd
    protected void zzzy() {
    }
}
