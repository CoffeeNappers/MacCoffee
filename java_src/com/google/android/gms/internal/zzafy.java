package com.google.android.gms.internal;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
/* loaded from: classes2.dex */
class zzafy implements zzafz {
    private HttpURLConnection aLF;

    private InputStream zzd(HttpURLConnection httpURLConnection) throws IOException {
        int responseCode = httpURLConnection.getResponseCode();
        if (responseCode == 200) {
            return httpURLConnection.getInputStream();
        }
        String sb = new StringBuilder(25).append("Bad response: ").append(responseCode).toString();
        if (responseCode == 404) {
            throw new FileNotFoundException(sb);
        }
        if (responseCode != 503) {
            throw new IOException(sb);
        }
        throw new zzagb(sb);
    }

    private void zze(HttpURLConnection httpURLConnection) {
        if (httpURLConnection != null) {
            httpURLConnection.disconnect();
        }
    }

    @Override // com.google.android.gms.internal.zzafz
    public void close() {
        zze(this.aLF);
    }

    @Override // com.google.android.gms.internal.zzafz
    public InputStream zzqz(String str) throws IOException {
        this.aLF = zzra(str);
        return zzd(this.aLF);
    }

    HttpURLConnection zzra(String str) throws IOException {
        HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(str).openConnection();
        httpURLConnection.setReadTimeout(20000);
        httpURLConnection.setConnectTimeout(20000);
        return httpURLConnection;
    }
}
