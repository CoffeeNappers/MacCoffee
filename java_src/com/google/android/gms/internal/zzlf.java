package com.google.android.gms.internal;

import android.content.Context;
import android.net.Uri;
import android.text.TextUtils;
import com.google.android.gms.internal.zzli;
import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
@zzji
/* loaded from: classes.dex */
public class zzlf {
    private final Object zzako = new Object();
    private String zzcwd = "";
    private String zzcwe = "";
    private boolean zzcwf = false;

    private Uri zze(Context context, String str, String str2) {
        Uri.Builder buildUpon = Uri.parse(str).buildUpon();
        buildUpon.appendQueryParameter("linkedDeviceId", zzam(context));
        buildUpon.appendQueryParameter("adSlotPath", str2);
        return buildUpon.build();
    }

    private void zzo(Context context, String str) {
        com.google.android.gms.ads.internal.zzu.zzgm().zza(context, zze(context, zzdr.zzbky.get(), str));
    }

    public void zza(Context context, String str, String str2, String str3) {
        Uri.Builder buildUpon = zze(context, zzdr.zzblb.get(), str3).buildUpon();
        buildUpon.appendQueryParameter("debugData", str2);
        com.google.android.gms.ads.internal.zzu.zzgm().zzc(context, str, buildUpon.build().toString());
    }

    public void zzaj(boolean z) {
        synchronized (this.zzako) {
            this.zzcwf = z;
        }
    }

    public String zzam(Context context) {
        String str;
        synchronized (this.zzako) {
            if (TextUtils.isEmpty(this.zzcwd)) {
                this.zzcwd = com.google.android.gms.ads.internal.zzu.zzgm().zzi(context, "debug_signals_id.txt");
                if (TextUtils.isEmpty(this.zzcwd)) {
                    this.zzcwd = com.google.android.gms.ads.internal.zzu.zzgm().zzvr();
                    com.google.android.gms.ads.internal.zzu.zzgm().zzd(context, "debug_signals_id.txt", this.zzcwd);
                }
            }
            str = this.zzcwd;
        }
        return str;
    }

    public void zzde(String str) {
        synchronized (this.zzako) {
            this.zzcwe = str;
        }
    }

    public void zzj(Context context, String str) {
        if (zzl(context, str)) {
            zzkx.zzdg("Device is linked for in app preview.");
        } else {
            zzo(context, str);
        }
    }

    public void zzk(Context context, String str) {
        if (zzm(context, str)) {
            zzkx.zzdg("Device is linked for debug signals.");
        } else {
            zzo(context, str);
        }
    }

    boolean zzl(Context context, String str) {
        String zzn = zzn(context, zze(context, zzdr.zzbkz.get(), str).toString());
        if (TextUtils.isEmpty(zzn)) {
            zzkx.zzdg("Not linked for in app preview.");
            return false;
        }
        zzde(zzn.trim());
        return true;
    }

    boolean zzm(Context context, String str) {
        String zzn = zzn(context, zze(context, zzdr.zzbla.get(), str).toString());
        if (TextUtils.isEmpty(zzn)) {
            zzkx.zzdg("Not linked for debug signals.");
            return false;
        }
        boolean parseBoolean = Boolean.parseBoolean(zzn.trim());
        zzaj(parseBoolean);
        return parseBoolean;
    }

    protected String zzn(Context context, final String str) {
        zzlt zza = new zzli(context).zza(str, new zzli.zza<String>() { // from class: com.google.android.gms.internal.zzlf.1
            @Override // com.google.android.gms.internal.zzli.zza
            /* renamed from: zzi */
            public String zzh(InputStream inputStream) {
                try {
                    String str2 = new String(com.google.android.gms.common.util.zzo.zza(inputStream, true), "UTF-8");
                    String str3 = str;
                    zzkx.zzdg(new StringBuilder(String.valueOf(str3).length() + 49 + String.valueOf(str2).length()).append("Response received from server. \nURL: ").append(str3).append("\n Response: ").append(str2).toString());
                    return str2;
                } catch (IOException e) {
                    String valueOf = String.valueOf(str);
                    zzkx.zzc(valueOf.length() != 0 ? "Error connecting to url: ".concat(valueOf) : new String("Error connecting to url: "), e);
                    return null;
                }
            }

            @Override // com.google.android.gms.internal.zzli.zza
            /* renamed from: zzwh */
            public String zzsw() {
                String valueOf = String.valueOf(str);
                zzkx.zzdi(valueOf.length() != 0 ? "Error getting a response from: ".concat(valueOf) : new String("Error getting a response from: "));
                return null;
            }
        });
        try {
            return (String) zza.get(zzdr.zzblc.get().intValue(), TimeUnit.MILLISECONDS);
        } catch (InterruptedException e) {
            String valueOf = String.valueOf(str);
            zzkx.zzb(valueOf.length() != 0 ? "Interrupted while retriving a response from: ".concat(valueOf) : new String("Interrupted while retriving a response from: "), e);
            zza.cancel(true);
            return null;
        } catch (TimeoutException e2) {
            String valueOf2 = String.valueOf(str);
            zzkx.zzb(valueOf2.length() != 0 ? "Timeout while retriving a response from: ".concat(valueOf2) : new String("Timeout while retriving a response from: "), e2);
            zza.cancel(true);
            return null;
        } catch (Exception e3) {
            String valueOf3 = String.valueOf(str);
            zzkx.zzb(valueOf3.length() != 0 ? "Error retriving a response from: ".concat(valueOf3) : new String("Error retriving a response from: "), e3);
            return null;
        }
    }

    public String zzwf() {
        String str;
        synchronized (this.zzako) {
            str = this.zzcwe;
        }
        return str;
    }

    public boolean zzwg() {
        boolean z;
        synchronized (this.zzako) {
            z = this.zzcwf;
        }
        return z;
    }
}
