package com.google.android.gms.tagmanager;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.gms.internal.zzafw;
import com.google.android.gms.internal.zzafz;
import com.google.android.gms.internal.zzaga;
import com.google.android.gms.internal.zzagb;
import com.google.android.gms.internal.zzai;
import com.google.android.gms.tagmanager.zzbn;
import com.google.android.gms.tagmanager.zzcj;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes2.dex */
class zzct implements Runnable {
    private final String aDY;
    private volatile String aEw;
    private final String aGA;
    private zzbn<zzai.zzj> aGB;
    private volatile zzt aGC;
    private volatile String aGD;
    private final zzaga aGz;
    private final Context mContext;

    zzct(Context context, String str, zzaga zzagaVar, zzt zztVar) {
        this.mContext = context;
        this.aGz = zzagaVar;
        this.aDY = str;
        this.aGC = zztVar;
        String valueOf = String.valueOf("/r?id=");
        String valueOf2 = String.valueOf(str);
        this.aGA = valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf);
        this.aEw = this.aGA;
        this.aGD = null;
    }

    public zzct(Context context, String str, zzt zztVar) {
        this(context, str, new zzaga(), zztVar);
    }

    private boolean zzcgc() {
        NetworkInfo activeNetworkInfo = ((ConnectivityManager) this.mContext.getSystemService("connectivity")).getActiveNetworkInfo();
        if (activeNetworkInfo == null || !activeNetworkInfo.isConnected()) {
            zzbo.v("...no network connectivity");
            return false;
        }
        return true;
    }

    private void zzcgd() {
        if (!zzcgc()) {
            this.aGB.zza(zzbn.zza.NOT_AVAILABLE);
            return;
        }
        zzbo.v("Start loading resource from network ...");
        String zzcge = zzcge();
        zzafz zzclf = this.aGz.zzclf();
        InputStream inputStream = null;
        try {
            try {
                inputStream = zzclf.zzqz(zzcge);
            } catch (zzagb e) {
                String valueOf = String.valueOf(zzcge);
                zzbo.zzdi(valueOf.length() != 0 ? "Error when loading resource for url: ".concat(valueOf) : new String("Error when loading resource for url: "));
                this.aGB.zza(zzbn.zza.SERVER_UNAVAILABLE_ERROR);
            } catch (FileNotFoundException e2) {
                String str = this.aDY;
                zzbo.zzdi(new StringBuilder(String.valueOf(zzcge).length() + 79 + String.valueOf(str).length()).append("No data is retrieved from the given url: ").append(zzcge).append(". Make sure container_id: ").append(str).append(" is correct.").toString());
                this.aGB.zza(zzbn.zza.SERVER_ERROR);
                zzclf.close();
                return;
            } catch (IOException e3) {
                String valueOf2 = String.valueOf(e3.getMessage());
                zzbo.zzc(new StringBuilder(String.valueOf(zzcge).length() + 40 + String.valueOf(valueOf2).length()).append("Error when loading resources from url: ").append(zzcge).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(valueOf2).toString(), e3);
                this.aGB.zza(zzbn.zza.IO_ERROR);
                zzclf.close();
                return;
            }
            try {
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                zzafw.zzc(inputStream, byteArrayOutputStream);
                zzai.zzj zzg = zzai.zzj.zzg(byteArrayOutputStream.toByteArray());
                String valueOf3 = String.valueOf(zzg);
                zzbo.v(new StringBuilder(String.valueOf(valueOf3).length() + 43).append("Successfully loaded supplemented resource: ").append(valueOf3).toString());
                if (zzg.zzxv == null && zzg.zzxu.length == 0) {
                    String valueOf4 = String.valueOf(this.aDY);
                    zzbo.v(valueOf4.length() != 0 ? "No change for container: ".concat(valueOf4) : new String("No change for container: "));
                }
                this.aGB.onSuccess(zzg);
                zzclf.close();
                zzbo.v("Load resource from network finished.");
            } catch (IOException e4) {
                String valueOf5 = String.valueOf(e4.getMessage());
                zzbo.zzc(new StringBuilder(String.valueOf(zzcge).length() + 51 + String.valueOf(valueOf5).length()).append("Error when parsing downloaded resources from url: ").append(zzcge).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(valueOf5).toString(), e4);
                this.aGB.zza(zzbn.zza.SERVER_ERROR);
                zzclf.close();
            }
        } catch (Throwable th) {
            zzclf.close();
            throw th;
        }
    }

    @Override // java.lang.Runnable
    public void run() {
        if (this.aGB == null) {
            throw new IllegalStateException("callback must be set before execute");
        }
        this.aGB.zzcei();
        zzcgd();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zza(zzbn<zzai.zzj> zzbnVar) {
        this.aGB = zzbnVar;
    }

    String zzcge() {
        String valueOf = String.valueOf(this.aGC.zzcep());
        String str = this.aEw;
        String valueOf2 = String.valueOf("&v=a65833898");
        String sb = new StringBuilder(String.valueOf(valueOf).length() + 0 + String.valueOf(str).length() + String.valueOf(valueOf2).length()).append(valueOf).append(str).append(valueOf2).toString();
        if (this.aGD != null && !this.aGD.trim().equals("")) {
            String valueOf3 = String.valueOf(sb);
            String valueOf4 = String.valueOf("&pv=");
            String str2 = this.aGD;
            sb = new StringBuilder(String.valueOf(valueOf3).length() + 0 + String.valueOf(valueOf4).length() + String.valueOf(str2).length()).append(valueOf3).append(valueOf4).append(str2).toString();
        }
        if (zzcj.zzcfz().zzcga().equals(zzcj.zza.CONTAINER_DEBUG)) {
            String valueOf5 = String.valueOf(sb);
            String valueOf6 = String.valueOf("&gtm_debug=x");
            return valueOf6.length() != 0 ? valueOf5.concat(valueOf6) : new String(valueOf5);
        }
        return sb;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzpa(String str) {
        if (str == null) {
            this.aEw = this.aGA;
            return;
        }
        String valueOf = String.valueOf(str);
        zzbo.zzdg(valueOf.length() != 0 ? "Setting CTFE URL path: ".concat(valueOf) : new String("Setting CTFE URL path: "));
        this.aEw = str;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzpp(String str) {
        String valueOf = String.valueOf(str);
        zzbo.zzdg(valueOf.length() != 0 ? "Setting previous container version: ".concat(valueOf) : new String("Setting previous container version: "));
        this.aGD = str;
    }
}
