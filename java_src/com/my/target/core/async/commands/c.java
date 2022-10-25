package com.my.target.core.async.commands;

import android.content.Context;
import com.my.target.Tracer;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
/* compiled from: LoadAdCommand.java */
/* loaded from: classes2.dex */
public class c extends com.my.target.core.async.commands.a<com.my.target.core.models.c> {
    protected com.my.target.core.models.d e;
    protected com.my.target.core.a f;

    @Override // com.my.target.core.async.commands.a, com.my.target.core.async.commands.b
    public final /* bridge */ /* synthetic */ String a() {
        return super.a();
    }

    public c(com.my.target.core.models.d dVar, com.my.target.core.a aVar, Context context) {
        super(context);
        this.e = dVar;
        this.f = aVar;
    }

    public c(Context context) {
        super(context);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Type inference failed for: r0v6, types: [T, com.my.target.core.models.c] */
    @Override // com.my.target.core.async.commands.a
    public void c() {
        if (this.e != null && this.f != null) {
            String d = d();
            a aVar = new a();
            for (int i = 0; i < 3; i++) {
                aVar.a(d);
                if (aVar.a) {
                    break;
                }
            }
            if (aVar.a) {
                this.c = new com.my.target.core.models.c(this.f.a());
                ((com.my.target.core.models.c) this.c).a(d);
                com.my.target.core.parsers.b.a(aVar.c, (com.my.target.core.models.c) this.c, this.f, this.e, this.b);
                return;
            }
            this.d = aVar.d;
        }
    }

    private String d() {
        String str;
        try {
            com.my.target.core.providers.d.a().c().a(this.f.f());
            com.my.target.core.providers.d.a().c().b(this.f.g());
            com.my.target.core.providers.d.a().a(this.b);
            if (!com.my.target.core.utils.h.a()) {
                com.my.target.core.utils.h.a(com.my.target.core.providers.d.a().b().getData());
            }
        } catch (Throwable th) {
            Tracer.d("Error collecting data: " + th);
        }
        HashMap hashMap = new HashMap();
        com.my.target.core.providers.d.a().putDataTo(hashMap);
        if (this.f.b() != null) {
            this.f.b().putDataTo(hashMap);
        }
        hashMap.put("formats", this.f.c());
        hashMap.put("adman_ver", "4.6.4");
        if (this.f.e()) {
            a(hashMap);
        }
        String m = this.e.m();
        boolean z = true;
        String str2 = m;
        for (Map.Entry entry : hashMap.entrySet()) {
            String str3 = (String) entry.getValue();
            if (str3 != null) {
                String str4 = (String) entry.getKey();
                try {
                    str3 = URLEncoder.encode(str3, "UTF-8");
                } catch (UnsupportedEncodingException e) {
                    Tracer.d(e.getMessage());
                }
                if (z) {
                    z = false;
                    str2 = str2 + "?" + str4 + "=" + str3;
                } else {
                    str = str2 + "&" + str4 + "=" + str3;
                }
            } else {
                str = str2;
            }
            str2 = str;
        }
        return str2;
    }

    private static void a(Map<String, String> map) {
        Set<String> a2 = com.my.target.core.models.c.a().a();
        if (a2 != null && a2.size() > 0) {
            String str = "";
            Iterator<String> it = a2.iterator();
            while (true) {
                String str2 = str;
                if (it.hasNext()) {
                    str = str2 + it.next() + ",";
                } else {
                    String substring = str2.substring(0, str2.length() - 1);
                    map.put("exb", substring);
                    Tracer.d("Exclude list: " + substring);
                    return;
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* compiled from: LoadAdCommand.java */
    /* loaded from: classes2.dex */
    public static final class a {
        boolean a;
        int b;
        String c;
        String d;

        /* JADX INFO: Access modifiers changed from: package-private */
        public final void a(String str) {
            HttpURLConnection httpURLConnection;
            HttpURLConnection httpURLConnection2 = null;
            this.a = true;
            this.b = -1;
            this.c = null;
            this.d = null;
            try {
                Tracer.d("send ad request: " + str);
                httpURLConnection = (HttpURLConnection) new URL(str).openConnection();
            } catch (Throwable th) {
                th = th;
            }
            try {
                httpURLConnection.setReadTimeout(10000);
                httpURLConnection.setConnectTimeout(10000);
                httpURLConnection.setInstanceFollowRedirects(true);
                httpURLConnection.setRequestProperty("connection", "close");
                httpURLConnection.connect();
                this.b = httpURLConnection.getResponseCode();
                if (this.b == 200) {
                    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
                    StringBuilder sb = new StringBuilder();
                    while (true) {
                        String readLine = bufferedReader.readLine();
                        if (readLine == null) {
                            break;
                        }
                        sb.append(readLine);
                    }
                    bufferedReader.close();
                    this.c = sb.toString();
                } else if (this.b != 204) {
                    this.a = false;
                    Tracer.d("ad request error: response code " + this.b);
                }
                if (httpURLConnection != null) {
                    httpURLConnection.disconnect();
                }
            } catch (Throwable th2) {
                httpURLConnection2 = httpURLConnection;
                th = th2;
                try {
                    this.a = false;
                    Tracer.d("ad request error: " + th.getMessage());
                } finally {
                    if (httpURLConnection2 != null) {
                        httpURLConnection2.disconnect();
                    }
                }
            }
        }
    }
}
