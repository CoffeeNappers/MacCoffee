package com.google.android.gms.analytics.internal;

import android.text.TextUtils;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import io.fabric.sdk.android.services.common.CommonUtils;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.Locale;
/* loaded from: classes.dex */
public class zza extends zzd {
    public static boolean cC;
    private AdvertisingIdClient.Info cD;
    private final zzal cE;
    private String cF;
    private boolean cG;
    private Object cH;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zza(zzf zzfVar) {
        super(zzfVar);
        this.cG = false;
        this.cH = new Object();
        this.cE = new zzal(zzfVar.zzabz());
    }

    private boolean zza(AdvertisingIdClient.Info info, AdvertisingIdClient.Info info2) {
        String str;
        String str2 = null;
        String id = info2 == null ? null : info2.getId();
        if (TextUtils.isEmpty(id)) {
            return true;
        }
        String zzady = zzacf().zzady();
        synchronized (this.cH) {
            if (!this.cG) {
                this.cF = zzabq();
                this.cG = true;
            } else if (TextUtils.isEmpty(this.cF)) {
                if (info != null) {
                    str2 = info.getId();
                }
                if (str2 == null) {
                    String valueOf = String.valueOf(id);
                    String valueOf2 = String.valueOf(zzady);
                    return zzer(valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf));
                }
                String valueOf3 = String.valueOf(str2);
                String valueOf4 = String.valueOf(zzady);
                this.cF = zzeq(valueOf4.length() != 0 ? valueOf3.concat(valueOf4) : new String(valueOf3));
            }
            String valueOf5 = String.valueOf(id);
            String valueOf6 = String.valueOf(zzady);
            String zzeq = zzeq(valueOf6.length() != 0 ? valueOf5.concat(valueOf6) : new String(valueOf5));
            if (TextUtils.isEmpty(zzeq)) {
                return false;
            }
            if (zzeq.equals(this.cF)) {
                return true;
            }
            if (!TextUtils.isEmpty(this.cF)) {
                zzes("Resetting the client id because Advertising Id changed.");
                str = zzacf().zzadz();
                zza("New client Id", str);
            } else {
                str = zzady;
            }
            String valueOf7 = String.valueOf(id);
            String valueOf8 = String.valueOf(str);
            return zzer(valueOf8.length() != 0 ? valueOf7.concat(valueOf8) : new String(valueOf7));
        }
    }

    private synchronized AdvertisingIdClient.Info zzabo() {
        if (this.cE.zzz(1000L)) {
            this.cE.start();
            AdvertisingIdClient.Info zzabp = zzabp();
            if (zza(this.cD, zzabp)) {
                this.cD = zzabp;
            } else {
                zzew("Failed to reset client id on adid change. Not using adid");
                this.cD = new AdvertisingIdClient.Info("", false);
            }
        }
        return this.cD;
    }

    private static String zzeq(String str) {
        MessageDigest zzfl = zzao.zzfl(CommonUtils.MD5_INSTANCE);
        if (zzfl == null) {
            return null;
        }
        return String.format(Locale.US, "%032X", new BigInteger(1, zzfl.digest(str.getBytes())));
    }

    private boolean zzer(String str) {
        try {
            String zzeq = zzeq(str);
            zzes("Storing hashed adid.");
            FileOutputStream openFileOutput = getContext().openFileOutput("gaClientIdData", 0);
            openFileOutput.write(zzeq.getBytes());
            openFileOutput.close();
            this.cF = zzeq;
            return true;
        } catch (IOException e) {
            zze("Error creating hash file", e);
            return false;
        }
    }

    public boolean zzabc() {
        zzacj();
        AdvertisingIdClient.Info zzabo = zzabo();
        return zzabo != null && !zzabo.isLimitAdTrackingEnabled();
    }

    public String zzabn() {
        zzacj();
        AdvertisingIdClient.Info zzabo = zzabo();
        String id = zzabo != null ? zzabo.getId() : null;
        if (TextUtils.isEmpty(id)) {
            return null;
        }
        return id;
    }

    protected AdvertisingIdClient.Info zzabp() {
        try {
            return AdvertisingIdClient.getAdvertisingIdInfo(getContext());
        } catch (IllegalStateException e) {
            zzev("IllegalStateException getting Ad Id Info. If you would like to see Audience reports, please ensure that you have added '<meta-data android:name=\"com.google.android.gms.version\" android:value=\"@integer/google_play_services_version\" />' to your application manifest file. See http://goo.gl/naFqQk for details.");
            return null;
        } catch (Throwable th) {
            if (cC) {
                return null;
            }
            cC = true;
            zzd("Error getting advertiser id", th);
            return null;
        }
    }

    protected String zzabq() {
        String str = null;
        try {
            FileInputStream openFileInput = getContext().openFileInput("gaClientIdData");
            byte[] bArr = new byte[128];
            int read = openFileInput.read(bArr, 0, 128);
            if (openFileInput.available() > 0) {
                zzev("Hash file seems corrupted, deleting it.");
                openFileInput.close();
                getContext().deleteFile("gaClientIdData");
            } else if (read <= 0) {
                zzes("Hash file is empty.");
                openFileInput.close();
            } else {
                String str2 = new String(bArr, 0, read);
                try {
                    openFileInput.close();
                    str = str2;
                } catch (FileNotFoundException e) {
                    str = str2;
                } catch (IOException e2) {
                    str = str2;
                    e = e2;
                    zzd("Error reading Hash file, deleting it", e);
                    getContext().deleteFile("gaClientIdData");
                    return str;
                }
            }
        } catch (FileNotFoundException e3) {
        } catch (IOException e4) {
            e = e4;
        }
        return str;
    }

    @Override // com.google.android.gms.analytics.internal.zzd
    protected void zzzy() {
    }
}
