package com.my.tracker.async.commands;

import android.content.Context;
import io.fabric.sdk.android.services.network.HttpRequest;
import java.io.BufferedOutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.zip.GZIPOutputStream;
/* compiled from: AbstractHttpCommand.java */
/* loaded from: classes2.dex */
public abstract class c extends b {
    protected String b;
    protected com.my.tracker.b c;
    protected Map<String, String> d;

    public c(String str, com.my.tracker.b bVar, Context context) {
        super(context);
        this.d = new HashMap();
        this.b = str;
        this.c = bVar;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void d() {
        boolean z = true;
        try {
            com.my.tracker.providers.e.a().c().a(this.c != null && this.c.w());
            if (this.c == null || !this.c.u()) {
                z = false;
            }
            com.my.tracker.providers.e.a().e().a(z);
            com.my.tracker.providers.e.a().b(this.a);
        } catch (Throwable th) {
            com.my.tracker.a.a("Error collecting data: " + th);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final boolean e() {
        try {
            com.my.tracker.providers.e.a().b().b(this.a);
            return com.my.tracker.providers.e.a().b().a();
        } catch (Throwable th) {
            return true;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final boolean a(String str) {
        HttpURLConnection httpURLConnection;
        HttpURLConnection httpURLConnection2 = null;
        try {
            String str2 = this.b;
            com.my.tracker.a.a("send POST request: " + str2);
            httpURLConnection = (HttpURLConnection) new URL(str2).openConnection();
        } catch (Throwable th) {
            th = th;
        }
        try {
            httpURLConnection.setConnectTimeout(10000);
            httpURLConnection.setReadTimeout(10000);
            httpURLConnection.setInstanceFollowRedirects(true);
            httpURLConnection.setRequestMethod(HttpRequest.METHOD_POST);
            httpURLConnection.setRequestProperty("connection", "close");
            httpURLConnection.setRequestProperty("Content-Type", "application/json");
            httpURLConnection.setRequestProperty(HttpRequest.HEADER_CONTENT_ENCODING, HttpRequest.ENCODING_GZIP);
            httpURLConnection.setUseCaches(false);
            httpURLConnection.setDoOutput(true);
            GZIPOutputStream gZIPOutputStream = new GZIPOutputStream(new BufferedOutputStream(httpURLConnection.getOutputStream()));
            gZIPOutputStream.write(str.getBytes());
            gZIPOutputStream.flush();
            gZIPOutputStream.close();
            int responseCode = httpURLConnection.getResponseCode();
            boolean z = responseCode == 200 || responseCode == 204;
            httpURLConnection.disconnect();
            if (!z) {
                com.my.tracker.a.a("send request failed. response code: " + responseCode);
            }
            return z;
        } catch (Throwable th2) {
            httpURLConnection2 = httpURLConnection;
            th = th2;
            com.my.tracker.a.a("Error: " + th);
            if (httpURLConnection2 != null) {
                httpURLConnection2.disconnect();
            }
            return false;
        }
    }
}
