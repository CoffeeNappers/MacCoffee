package com.google.android.gms.tagmanager;

import android.content.Context;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.util.concurrent.LinkedBlockingQueue;
/* loaded from: classes2.dex */
class zzav extends Thread implements zzau {
    private static zzav aFv;
    private final LinkedBlockingQueue<Runnable> aFu;
    private volatile zzaw aFw;
    private volatile boolean mClosed;
    private final Context mContext;
    private volatile boolean zzcbf;

    private zzav(Context context) {
        super("GAThread");
        this.aFu = new LinkedBlockingQueue<>();
        this.zzcbf = false;
        this.mClosed = false;
        if (context != null) {
            this.mContext = context.getApplicationContext();
        } else {
            this.mContext = context;
        }
        start();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static zzav zzee(Context context) {
        if (aFv == null) {
            aFv = new zzav(context);
        }
        return aFv;
    }

    private String zzg(Throwable th) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        PrintStream printStream = new PrintStream(byteArrayOutputStream);
        th.printStackTrace(printStream);
        printStream.flush();
        return new String(byteArrayOutputStream.toByteArray());
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        while (!this.mClosed) {
            try {
                try {
                    Runnable take = this.aFu.take();
                    if (!this.zzcbf) {
                        take.run();
                    }
                } catch (InterruptedException e) {
                    zzbo.zzdh(e.toString());
                }
            } catch (Throwable th) {
                String valueOf = String.valueOf(zzg(th));
                zzbo.e(valueOf.length() != 0 ? "Error on Google TagManager Thread: ".concat(valueOf) : new String("Error on Google TagManager Thread: "));
                zzbo.e("Google TagManager is shutting down.");
                this.zzcbf = true;
            }
        }
    }

    void zzl(final String str, final long j) {
        zzp(new Runnable() { // from class: com.google.android.gms.tagmanager.zzav.1
            @Override // java.lang.Runnable
            public void run() {
                if (zzav.this.aFw == null) {
                    zzdc zzcgt = zzdc.zzcgt();
                    zzcgt.zza(zzav.this.mContext, this);
                    zzav.this.aFw = zzcgt.zzcgw();
                }
                zzav.this.aFw.zzg(j, str);
            }
        });
    }

    @Override // com.google.android.gms.tagmanager.zzau
    public void zzp(Runnable runnable) {
        this.aFu.add(runnable);
    }

    @Override // com.google.android.gms.tagmanager.zzau
    public void zzpk(String str) {
        zzl(str, System.currentTimeMillis());
    }
}
