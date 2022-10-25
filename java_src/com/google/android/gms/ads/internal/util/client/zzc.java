package com.google.android.gms.ads.internal.util.client;

import android.support.annotation.Nullable;
import android.support.annotation.WorkerThread;
import com.google.android.gms.ads.internal.client.zzm;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.internal.zzji;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
@zzji
/* loaded from: classes.dex */
public class zzc implements zza.InterfaceC0034zza {
    @Nullable
    private final String zzbre;

    public zzc() {
        this(null);
    }

    public zzc(@Nullable String str) {
        this.zzbre = str;
    }

    @Override // com.google.android.gms.ads.internal.util.client.zza.InterfaceC0034zza
    @WorkerThread
    public void zzv(String str) {
        try {
            String valueOf = String.valueOf(str);
            zzb.zzdg(valueOf.length() != 0 ? "Pinging URL: ".concat(valueOf) : new String("Pinging URL: "));
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(str).openConnection();
            try {
                zzm.zzkr().zza(true, httpURLConnection, this.zzbre);
                int responseCode = httpURLConnection.getResponseCode();
                if (responseCode < 200 || responseCode >= 300) {
                    zzb.zzdi(new StringBuilder(String.valueOf(str).length() + 65).append("Received non-success response code ").append(responseCode).append(" from pinging URL: ").append(str).toString());
                }
            } finally {
                httpURLConnection.disconnect();
            }
        } catch (IOException e) {
            String valueOf2 = String.valueOf(e.getMessage());
            zzb.zzdi(new StringBuilder(String.valueOf(str).length() + 27 + String.valueOf(valueOf2).length()).append("Error while pinging URL: ").append(str).append(". ").append(valueOf2).toString());
        } catch (IndexOutOfBoundsException e2) {
            String valueOf3 = String.valueOf(e2.getMessage());
            zzb.zzdi(new StringBuilder(String.valueOf(str).length() + 32 + String.valueOf(valueOf3).length()).append("Error while parsing ping URL: ").append(str).append(". ").append(valueOf3).toString());
        } catch (RuntimeException e3) {
            String valueOf4 = String.valueOf(e3.getMessage());
            zzb.zzdi(new StringBuilder(String.valueOf(str).length() + 27 + String.valueOf(valueOf4).length()).append("Error while pinging URL: ").append(str).append(". ").append(valueOf4).toString());
        }
    }
}
