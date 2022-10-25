package com.google.android.gms.internal;

import com.google.android.gms.internal.zzax;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public class zzbx {
    protected static final String TAG = zzbx.class.getSimpleName();
    private final String className;
    private final zzbc zzagd;
    private final String zzaji;
    private List<Class> zzajl;
    private final int zzajj = 2;
    private volatile Method zzajk = null;
    private CountDownLatch zzajm = new CountDownLatch(1);

    public zzbx(zzbc zzbcVar, String str, String str2, List<Class> list) {
        this.zzagd = zzbcVar;
        this.className = str;
        this.zzaji = str2;
        this.zzajl = new ArrayList(list);
        this.zzagd.zzcm().submit(new Runnable() { // from class: com.google.android.gms.internal.zzbx.1
            @Override // java.lang.Runnable
            public void run() {
                zzbx.this.zzdp();
            }
        });
    }

    private String zzd(byte[] bArr, String str) throws zzax.zza, UnsupportedEncodingException {
        return new String(this.zzagd.zzco().zzc(bArr, str), "UTF-8");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzdp() {
        try {
            Class loadClass = this.zzagd.zzcn().loadClass(zzd(this.zzagd.zzcp(), this.className));
            if (loadClass == null) {
                return;
            }
            this.zzajk = loadClass.getMethod(zzd(this.zzagd.zzcp(), this.zzaji), (Class[]) this.zzajl.toArray(new Class[this.zzajl.size()]));
            if (this.zzajk != null) {
            }
        } catch (zzax.zza e) {
        } catch (UnsupportedEncodingException e2) {
        } catch (ClassNotFoundException e3) {
        } catch (NoSuchMethodException e4) {
        } catch (NullPointerException e5) {
        } finally {
            this.zzajm.countDown();
        }
    }

    public Method zzdq() {
        if (this.zzajk != null) {
            return this.zzajk;
        }
        try {
            if (!this.zzajm.await(2L, TimeUnit.SECONDS)) {
                return null;
            }
            return this.zzajk;
        } catch (InterruptedException e) {
            return null;
        }
    }
}
