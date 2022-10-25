package com.google.android.gms.internal;

import android.content.Context;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzaf;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Iterator;
import java.util.LinkedList;
/* loaded from: classes2.dex */
public abstract class zzar implements zzaq {
    protected MotionEvent zzagj;
    protected LinkedList<MotionEvent> zzagk = new LinkedList<>();
    protected long zzagl = 0;
    protected long zzagm = 0;
    protected long zzagn = 0;
    protected long zzago = 0;
    protected long zzagp = 0;
    protected long zzagq = 0;
    protected long zzagr = 0;
    private boolean zzags = false;
    protected boolean zzagt = false;
    protected DisplayMetrics zzagu;

    /* JADX INFO: Access modifiers changed from: protected */
    public zzar(Context context) {
        try {
            zzan.zzau();
            this.zzagu = context.getResources().getDisplayMetrics();
        } catch (Throwable th) {
        }
    }

    private String zza(Context context, String str, boolean z, View view, byte[] bArr) {
        zzaf.zza zza;
        boolean z2 = true;
        zzad.zza zzaVar = null;
        if (bArr != null && bArr.length > 0) {
            try {
                zzaVar = zzad.zza.zzc(bArr);
            } catch (zzarz e) {
            }
        }
        try {
            if (z) {
                zza = zza(context, view);
                this.zzags = true;
            } else {
                zza = zza(context, zzaVar);
            }
            if (zza == null || zza.cz() == 0) {
                return Integer.toString(5);
            }
            if (zzb(z)) {
                z2 = false;
            }
            return zzan.zza(zza, str, z2);
        } catch (UnsupportedEncodingException e2) {
            return Integer.toString(7);
        } catch (NoSuchAlgorithmException e3) {
            return Integer.toString(7);
        } catch (Throwable th) {
            return Integer.toString(3);
        }
    }

    private static boolean zza(zzbd zzbdVar) {
        return (zzbdVar == null || zzbdVar.zzff == null || zzbdVar.zzair == null) ? false : true;
    }

    private boolean zzb(zzbd zzbdVar) {
        return (this.zzagu == null || zzbdVar == null || zzbdVar.zzfd == null || zzbdVar.zzais == null) ? false : true;
    }

    private static boolean zzb(boolean z) {
        if (!zzdr.zzbho.get().booleanValue()) {
            return true;
        }
        return zzdr.zzbij.get().booleanValue() && z;
    }

    protected abstract long zza(StackTraceElement[] stackTraceElementArr) throws zzaz;

    protected abstract zzaf.zza zza(Context context, View view);

    protected abstract zzaf.zza zza(Context context, zzad.zza zzaVar);

    @Override // com.google.android.gms.internal.zzaq
    public String zza(Context context, String str, View view) {
        return zza(context, str, true, view, null);
    }

    public String zza(Context context, byte[] bArr) {
        if (!zzbe.zzdg() || !zzdr.zzbii.get().booleanValue()) {
            return zza(context, null, false, null, bArr);
        }
        throw new IllegalStateException("The caller must not be called from the UI thread.");
    }

    @Override // com.google.android.gms.internal.zzaq
    public void zza(int i, int i2, int i3) {
        if (this.zzagj != null) {
            this.zzagj.recycle();
        }
        if (this.zzagu != null) {
            this.zzagj = MotionEvent.obtain(0L, i3, 1, i * this.zzagu.density, i2 * this.zzagu.density, 0.0f, 0.0f, 0, 0.0f, 0.0f, 0, 0);
        } else {
            this.zzagj = null;
        }
        this.zzagt = false;
    }

    @Override // com.google.android.gms.internal.zzaq
    public void zza(MotionEvent motionEvent) {
        if (this.zzags) {
            this.zzago = 0L;
            this.zzagn = 0L;
            this.zzagm = 0L;
            this.zzagl = 0L;
            this.zzagp = 0L;
            this.zzagr = 0L;
            this.zzagq = 0L;
            Iterator<MotionEvent> it = this.zzagk.iterator();
            while (it.hasNext()) {
                it.next().recycle();
            }
            this.zzagk.clear();
            this.zzagj = null;
            this.zzags = false;
        }
        switch (motionEvent.getAction()) {
            case 0:
                this.zzagl++;
                break;
            case 1:
                this.zzagj = MotionEvent.obtain(motionEvent);
                this.zzagk.add(this.zzagj);
                if (this.zzagk.size() > 6) {
                    this.zzagk.remove().recycle();
                }
                this.zzagn++;
                try {
                    this.zzagp = zza(new Throwable().getStackTrace());
                    break;
                } catch (zzaz e) {
                    break;
                }
            case 2:
                this.zzagm += motionEvent.getHistorySize() + 1;
                if (zzdr.zzbhw.get().booleanValue() || zzdr.zzbhr.get().booleanValue()) {
                    try {
                        zzbd zzb = zzb(motionEvent);
                        if (zza(zzb)) {
                            this.zzagq += zzb.zzff.longValue() + zzb.zzair.longValue();
                        }
                        if (zzb(zzb)) {
                            this.zzagr = zzb.zzais.longValue() + zzb.zzfd.longValue() + this.zzagr;
                            break;
                        }
                    } catch (zzaz e2) {
                        break;
                    }
                }
                break;
            case 3:
                this.zzago++;
                break;
        }
        this.zzagt = true;
    }

    protected abstract zzbd zzb(MotionEvent motionEvent) throws zzaz;

    @Override // com.google.android.gms.internal.zzaq
    public String zzb(Context context) {
        if (!zzbe.zzdg() || !zzdr.zzbii.get().booleanValue()) {
            return zza(context, null, false, null, null);
        }
        throw new IllegalStateException("The caller must not be called from the UI thread.");
    }

    public String zzb(Context context, String str) {
        return zza(context, str, (View) null);
    }
}
