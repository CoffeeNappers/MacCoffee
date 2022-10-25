package com.google.android.gms.tagmanager;

import android.content.Context;
import android.content.res.Resources;
import com.google.android.gms.internal.zzafu;
import com.google.android.gms.internal.zzafw;
import com.google.android.gms.internal.zzai;
import com.google.android.gms.internal.zzarz;
import com.google.android.gms.internal.zzasa;
import com.google.android.gms.tagmanager.zzp;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONException;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzcv implements zzp.zzf {
    private final String aDY;
    private zzbn<zzafu.zza> aGB;
    private final ExecutorService aGI = Executors.newSingleThreadExecutor();
    private final Context mContext;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzcv(Context context, String str) {
        this.mContext = context;
        this.aDY = str;
    }

    private zzafw.zzc zza(ByteArrayOutputStream byteArrayOutputStream) {
        try {
            return zzbh.zzpm(byteArrayOutputStream.toString("UTF-8"));
        } catch (UnsupportedEncodingException e) {
            zzbo.zzdg("Failed to convert binary resource to string for JSON parsing; the file format is not UTF-8 format.");
            return null;
        } catch (JSONException e2) {
            zzbo.zzdi("Failed to extract the container from the resource file. Resource is a UTF-8 encoded string but doesn't contain a JSON container");
            return null;
        }
    }

    private zzafw.zzc zzal(byte[] bArr) {
        try {
            zzafw.zzc zzb = zzafw.zzb(zzai.zzf.zzf(bArr));
            if (zzb == null) {
                return zzb;
            }
            zzbo.v("The container was successfully loaded from the resource (using binary file)");
            return zzb;
        } catch (zzafw.zzg e) {
            zzbo.zzdi("The resource file is invalid. The container from the binary file is invalid");
            return null;
        } catch (zzarz e2) {
            zzbo.e("The resource file is corrupted. The container cannot be extracted from the binary file");
            return null;
        }
    }

    private void zzd(zzafu.zza zzaVar) throws IllegalArgumentException {
        if (zzaVar.zzxv == null && zzaVar.aMv == null) {
            throw new IllegalArgumentException("Resource and SupplementedResource are NULL.");
        }
    }

    @Override // com.google.android.gms.common.api.Releasable
    public synchronized void release() {
        this.aGI.shutdown();
    }

    @Override // com.google.android.gms.tagmanager.zzp.zzf
    public void zza(zzbn<zzafu.zza> zzbnVar) {
        this.aGB = zzbnVar;
    }

    @Override // com.google.android.gms.tagmanager.zzp.zzf
    public void zzb(final zzafu.zza zzaVar) {
        this.aGI.execute(new Runnable() { // from class: com.google.android.gms.tagmanager.zzcv.2
            @Override // java.lang.Runnable
            public void run() {
                zzcv.this.zzc(zzaVar);
            }
        });
    }

    boolean zzc(zzafu.zza zzaVar) {
        File zzcgi = zzcgi();
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(zzcgi);
            try {
                try {
                    fileOutputStream.write(zzasa.zzf(zzaVar));
                    return true;
                } catch (IOException e) {
                    zzbo.zzdi("Error writing resource to disk. Removing resource from disk.");
                    zzcgi.delete();
                    try {
                        fileOutputStream.close();
                        return false;
                    } catch (IOException e2) {
                        zzbo.zzdi("error closing stream for writing resource to disk");
                        return false;
                    }
                }
            } finally {
                try {
                    fileOutputStream.close();
                } catch (IOException e3) {
                    zzbo.zzdi("error closing stream for writing resource to disk");
                }
            }
        } catch (FileNotFoundException e4) {
            zzbo.e("Error opening resource file for writing");
            return false;
        }
    }

    @Override // com.google.android.gms.tagmanager.zzp.zzf
    public void zzcej() {
        this.aGI.execute(new Runnable() { // from class: com.google.android.gms.tagmanager.zzcv.1
            @Override // java.lang.Runnable
            public void run() {
                zzcv.this.zzcgh();
            }
        });
    }

    /* JADX WARN: Code restructure failed: missing block: B:9:0x002e, code lost:
        if (r0 == r1) goto L48;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    void zzcgh() {
        /*
            r3 = this;
            com.google.android.gms.tagmanager.zzbn<com.google.android.gms.internal.zzafu$zza> r0 = r3.aGB
            if (r0 != 0) goto Ld
            java.lang.IllegalStateException r0 = new java.lang.IllegalStateException
            java.lang.String r1 = "Callback must be set before execute"
            r0.<init>(r1)
            throw r0
        Ld:
            com.google.android.gms.tagmanager.zzbn<com.google.android.gms.internal.zzafu$zza> r0 = r3.aGB
            r0.zzcei()
            java.lang.String r0 = "Attempting to load resource from disk"
            com.google.android.gms.tagmanager.zzbo.v(r0)
            com.google.android.gms.tagmanager.zzcj r0 = com.google.android.gms.tagmanager.zzcj.zzcfz()
            com.google.android.gms.tagmanager.zzcj$zza r0 = r0.zzcga()
            com.google.android.gms.tagmanager.zzcj$zza r1 = com.google.android.gms.tagmanager.zzcj.zza.CONTAINER
            if (r0 == r1) goto L30
            com.google.android.gms.tagmanager.zzcj r0 = com.google.android.gms.tagmanager.zzcj.zzcfz()
            com.google.android.gms.tagmanager.zzcj$zza r0 = r0.zzcga()
            com.google.android.gms.tagmanager.zzcj$zza r1 = com.google.android.gms.tagmanager.zzcj.zza.CONTAINER_DEBUG
            if (r0 != r1) goto L48
        L30:
            java.lang.String r0 = r3.aDY
            com.google.android.gms.tagmanager.zzcj r1 = com.google.android.gms.tagmanager.zzcj.zzcfz()
            java.lang.String r1 = r1.getContainerId()
            boolean r0 = r0.equals(r1)
            if (r0 == 0) goto L48
            com.google.android.gms.tagmanager.zzbn<com.google.android.gms.internal.zzafu$zza> r0 = r3.aGB
            com.google.android.gms.tagmanager.zzbn$zza r1 = com.google.android.gms.tagmanager.zzbn.zza.NOT_AVAILABLE
            r0.zza(r1)
        L47:
            return
        L48:
            java.io.FileInputStream r1 = new java.io.FileInputStream     // Catch: java.io.FileNotFoundException -> L73
            java.io.File r0 = r3.zzcgi()     // Catch: java.io.FileNotFoundException -> L73
            r1.<init>(r0)     // Catch: java.io.FileNotFoundException -> L73
            java.io.ByteArrayOutputStream r0 = new java.io.ByteArrayOutputStream     // Catch: java.io.IOException -> L8a java.lang.IllegalArgumentException -> La4 java.lang.Throwable -> Lbe
            r0.<init>()     // Catch: java.io.IOException -> L8a java.lang.IllegalArgumentException -> La4 java.lang.Throwable -> Lbe
            com.google.android.gms.internal.zzafw.zzc(r1, r0)     // Catch: java.io.IOException -> L8a java.lang.IllegalArgumentException -> La4 java.lang.Throwable -> Lbe
            byte[] r0 = r0.toByteArray()     // Catch: java.io.IOException -> L8a java.lang.IllegalArgumentException -> La4 java.lang.Throwable -> Lbe
            com.google.android.gms.internal.zzafu$zza r0 = com.google.android.gms.internal.zzafu.zza.zzap(r0)     // Catch: java.io.IOException -> L8a java.lang.IllegalArgumentException -> La4 java.lang.Throwable -> Lbe
            r3.zzd(r0)     // Catch: java.io.IOException -> L8a java.lang.IllegalArgumentException -> La4 java.lang.Throwable -> Lbe
            com.google.android.gms.tagmanager.zzbn<com.google.android.gms.internal.zzafu$zza> r2 = r3.aGB     // Catch: java.io.IOException -> L8a java.lang.IllegalArgumentException -> La4 java.lang.Throwable -> Lbe
            r2.onSuccess(r0)     // Catch: java.io.IOException -> L8a java.lang.IllegalArgumentException -> La4 java.lang.Throwable -> Lbe
            r1.close()     // Catch: java.io.IOException -> L82
        L6c:
            java.lang.String r0 = "The Disk resource was successfully read."
            com.google.android.gms.tagmanager.zzbo.v(r0)
            goto L47
        L73:
            r0 = move-exception
            java.lang.String r0 = "Failed to find the resource in the disk"
            com.google.android.gms.tagmanager.zzbo.zzdg(r0)
            com.google.android.gms.tagmanager.zzbn<com.google.android.gms.internal.zzafu$zza> r0 = r3.aGB
            com.google.android.gms.tagmanager.zzbn$zza r1 = com.google.android.gms.tagmanager.zzbn.zza.NOT_AVAILABLE
            r0.zza(r1)
            goto L47
        L82:
            r0 = move-exception
            java.lang.String r0 = "Error closing stream for reading resource from disk"
            com.google.android.gms.tagmanager.zzbo.zzdi(r0)
            goto L6c
        L8a:
            r0 = move-exception
            com.google.android.gms.tagmanager.zzbn<com.google.android.gms.internal.zzafu$zza> r0 = r3.aGB     // Catch: java.lang.Throwable -> Lbe
            com.google.android.gms.tagmanager.zzbn$zza r2 = com.google.android.gms.tagmanager.zzbn.zza.IO_ERROR     // Catch: java.lang.Throwable -> Lbe
            r0.zza(r2)     // Catch: java.lang.Throwable -> Lbe
            java.lang.String r0 = "Failed to read the resource from disk"
            com.google.android.gms.tagmanager.zzbo.zzdi(r0)     // Catch: java.lang.Throwable -> Lbe
            r1.close()     // Catch: java.io.IOException -> L9c
            goto L6c
        L9c:
            r0 = move-exception
            java.lang.String r0 = "Error closing stream for reading resource from disk"
            com.google.android.gms.tagmanager.zzbo.zzdi(r0)
            goto L6c
        La4:
            r0 = move-exception
            com.google.android.gms.tagmanager.zzbn<com.google.android.gms.internal.zzafu$zza> r0 = r3.aGB     // Catch: java.lang.Throwable -> Lbe
            com.google.android.gms.tagmanager.zzbn$zza r2 = com.google.android.gms.tagmanager.zzbn.zza.IO_ERROR     // Catch: java.lang.Throwable -> Lbe
            r0.zza(r2)     // Catch: java.lang.Throwable -> Lbe
            java.lang.String r0 = "Failed to read the resource from disk. The resource is inconsistent"
            com.google.android.gms.tagmanager.zzbo.zzdi(r0)     // Catch: java.lang.Throwable -> Lbe
            r1.close()     // Catch: java.io.IOException -> Lb6
            goto L6c
        Lb6:
            r0 = move-exception
            java.lang.String r0 = "Error closing stream for reading resource from disk"
            com.google.android.gms.tagmanager.zzbo.zzdi(r0)
            goto L6c
        Lbe:
            r0 = move-exception
            r1.close()     // Catch: java.io.IOException -> Lc3
        Lc2:
            throw r0
        Lc3:
            r1 = move-exception
            java.lang.String r1 = "Error closing stream for reading resource from disk"
            com.google.android.gms.tagmanager.zzbo.zzdi(r1)
            goto Lc2
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.tagmanager.zzcv.zzcgh():void");
    }

    File zzcgi() {
        String valueOf = String.valueOf("resource_");
        String valueOf2 = String.valueOf(this.aDY);
        return new File(this.mContext.getDir("google_tagmanager", 0), valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf));
    }

    @Override // com.google.android.gms.tagmanager.zzp.zzf
    public zzafw.zzc zzzz(int i) {
        try {
            InputStream openRawResource = this.mContext.getResources().openRawResource(i);
            String valueOf = String.valueOf(this.mContext.getResources().getResourceName(i));
            zzbo.v(new StringBuilder(String.valueOf(valueOf).length() + 66).append("Attempting to load a container from the resource ID ").append(i).append(" (").append(valueOf).append(")").toString());
            try {
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                zzafw.zzc(openRawResource, byteArrayOutputStream);
                zzafw.zzc zza = zza(byteArrayOutputStream);
                if (zza != null) {
                    zzbo.v("The container was successfully loaded from the resource (using JSON file format)");
                } else {
                    zza = zzal(byteArrayOutputStream.toByteArray());
                }
                return zza;
            } catch (IOException e) {
                String valueOf2 = String.valueOf(this.mContext.getResources().getResourceName(i));
                zzbo.zzdi(new StringBuilder(String.valueOf(valueOf2).length() + 67).append("Error reading the default container with resource ID ").append(i).append(" (").append(valueOf2).append(")").toString());
                return null;
            }
        } catch (Resources.NotFoundException e2) {
            zzbo.zzdi(new StringBuilder(98).append("Failed to load the container. No default container resource found with the resource ID ").append(i).toString());
            return null;
        }
    }
}
