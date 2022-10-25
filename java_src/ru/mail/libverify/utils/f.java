package ru.mail.libverify.utils;

import android.text.TextUtils;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import io.fabric.sdk.android.services.network.HttpRequest;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLSocketFactory;
import ru.mail.libverify.utils.e;
/* loaded from: classes3.dex */
public final class f implements e {
    private final String a;
    private final byte[] b;
    private final HttpURLConnection c;
    private final boolean d;
    private boolean e;
    private boolean f;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: ru.mail.libverify.utils.f$1  reason: invalid class name */
    /* loaded from: classes3.dex */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] a = new int[e.a.a().length];

        static {
            try {
                a[e.a.a - 1] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                a[e.a.b - 1] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                a[e.a.c - 1] = 3;
            } catch (NoSuchFieldError e3) {
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class a implements ru.mail.libverify.utils.a {
        private final HttpURLConnection a;
        private final String b;
        private byte[] c;
        private boolean d;

        private a(String str) {
            this.b = str;
            try {
                this.a = (HttpURLConnection) new URL(str).openConnection();
                b(30000);
                c(30000);
                a();
            } catch (MalformedURLException e) {
                throw new ClientException(e);
            }
        }

        public /* synthetic */ a(String str, byte b) {
            this(str);
        }

        @Override // ru.mail.libverify.utils.a
        public final ru.mail.libverify.utils.a a() {
            this.a.setInstanceFollowRedirects(false);
            return this;
        }

        @Override // ru.mail.libverify.utils.a
        public final ru.mail.libverify.utils.a a(int i) {
            switch (AnonymousClass1.a[i - 1]) {
                case 1:
                    this.a.setRequestMethod(HttpRequest.METHOD_GET);
                    this.a.setDoInput(true);
                    this.a.setDoOutput(false);
                    break;
                case 2:
                    this.a.setRequestMethod(HttpRequest.METHOD_POST);
                    this.a.setDoInput(true);
                    this.a.setDoOutput(true);
                    break;
                case 3:
                    this.a.setRequestMethod(HttpRequest.METHOD_HEAD);
                    this.a.setDoInput(false);
                    this.a.setDoOutput(false);
                    break;
            }
            return this;
        }

        @Override // ru.mail.libverify.utils.a
        public final ru.mail.libverify.utils.a a(String str) {
            if (!TextUtils.isEmpty(str)) {
                a(e.a.b);
                this.c = str.getBytes("UTF-8");
                this.a.addRequestProperty("Content-Type", HttpRequest.CONTENT_TYPE_FORM);
                this.a.setRequestProperty("Charset", "utf-8");
                this.a.setRequestProperty("Content-Length", Integer.toString(str.length()));
            }
            return this;
        }

        @Override // ru.mail.libverify.utils.a
        public final ru.mail.libverify.utils.a a(String str, String str2) {
            this.a.addRequestProperty(str, str2);
            return this;
        }

        @Override // ru.mail.libverify.utils.a
        public final ru.mail.libverify.utils.a a(SSLSocketFactory sSLSocketFactory) {
            if (this.a instanceof HttpsURLConnection) {
                ((HttpsURLConnection) this.a).setSSLSocketFactory(sSLSocketFactory);
            }
            return this;
        }

        @Override // ru.mail.libverify.utils.a
        public final ru.mail.libverify.utils.a a(boolean z) {
            if (z) {
                this.a.addRequestProperty("Connection", "Keep-Alive");
            } else {
                this.a.addRequestProperty("Connection", "Close");
            }
            return this;
        }

        @Override // ru.mail.libverify.utils.a
        public final ru.mail.libverify.utils.a b(int i) {
            this.a.setConnectTimeout(i);
            return this;
        }

        @Override // ru.mail.libverify.utils.a
        public final e b() {
            return new f(this.b, this.c, this.a, this.d, (byte) 0);
        }

        @Override // ru.mail.libverify.utils.a
        public final ru.mail.libverify.utils.a c(int i) {
            this.a.setReadTimeout(i);
            return this;
        }
    }

    private f(String str, byte[] bArr, HttpURLConnection httpURLConnection, boolean z) {
        this.a = str;
        this.b = bArr;
        this.c = httpURLConnection;
        this.d = z;
    }

    /* synthetic */ f(String str, byte[] bArr, HttpURLConnection httpURLConnection, boolean z, byte b) {
        this(str, bArr, httpURLConnection, z);
    }

    private static void a(InputStream inputStream) {
        if (inputStream == null) {
            return;
        }
        try {
            do {
            } while (inputStream.read(new byte[1024]) >= 0);
            try {
                inputStream.close();
            } catch (IOException e) {
                d.a("HttpConnection.emptyAndClose", e.toString());
            }
        } catch (Throwable th) {
            try {
                inputStream.close();
            } catch (IOException e2) {
                d.a("HttpConnection.emptyAndClose", e2.toString());
            }
            throw th;
        }
    }

    private void b(String str) {
        if (this.e) {
            return;
        }
        this.e = true;
        try {
            d.c(str, this.a);
            StringBuilder sb = new StringBuilder();
            for (String str2 : this.c.getRequestProperties().keySet()) {
                sb.append(str2).append(" : ").append(this.c.getRequestProperty(str2)).append('\n');
            }
            d.c(str, sb.toString());
        } catch (Exception e) {
        }
    }

    private int c() {
        b("HttpConnection.getResponseCode");
        if (Thread.interrupted()) {
            throw new ClientException("The thread has been cancelled before the request start");
        }
        try {
            int responseCode = this.c.getResponseCode();
            c("HttpConnection.getResponseCode'1");
            return responseCode;
        } catch (IOException e) {
            int responseCode2 = this.c.getResponseCode();
            c("HttpConnection.getResponseCode'2");
            return responseCode2;
        }
    }

    private void c(String str) {
        if (this.f) {
            return;
        }
        this.f = true;
        try {
            StringBuilder sb = new StringBuilder();
            sb.append("contentLength : ").append(this.c.getContentLength()).append('\n');
            for (String str2 : this.c.getHeaderFields().keySet()) {
                sb.append(str2).append(" : ").append(this.c.getHeaderField(str2)).append('\n');
            }
            d.c(str, sb.toString());
        } catch (Exception e) {
        }
    }

    private void d() {
        b("HttpConnection.emptyAndClose");
        try {
            a(this.c.getInputStream());
        } catch (IOException e) {
            d.c("HttpConnection.emptyAndClose", e.toString());
        }
        try {
            a(this.c.getErrorStream());
        } catch (IOException e2) {
            d.c("HttpConnection.emptyAndClose", e2.toString());
        }
        c("HttpConnection.emptyAndClose");
        this.c.disconnect();
    }

    private InputStream e() {
        InputStream errorStream;
        b("HttpConnection.getInputStream");
        try {
            errorStream = this.c.getInputStream();
            try {
                a(this.c.getErrorStream());
            } catch (IOException e) {
                d.c("getInputStream''1", e.toString());
            }
        } catch (FileNotFoundException e2) {
            errorStream = this.c.getErrorStream();
            d.c("getInputStream''2", e2.toString());
            if (errorStream == null) {
                throw new IOException("errorStream is null");
            }
        }
        c("HttpConnection.getInputStream");
        return errorStream;
    }

    @Override // ru.mail.libverify.utils.e
    public final String a() {
        String a2;
        DataOutputStream dataOutputStream;
        b("HttpConnection.getResponseAsString");
        try {
            if (TextUtils.equals(this.c.getRequestMethod(), HttpRequest.METHOD_POST) && this.b != null) {
                if (Thread.interrupted()) {
                    d();
                    throw new ClientException("The thread has been cancelled before post data");
                }
                d.c("HttpConnection.getResponseAsString", "post data started");
                try {
                    dataOutputStream = new DataOutputStream(this.c.getOutputStream());
                    try {
                        dataOutputStream.write(this.b);
                        dataOutputStream.flush();
                        d.c("HttpConnection.getResponseAsString", "post data completed");
                        dataOutputStream.close();
                    } catch (Throwable th) {
                        th = th;
                        if (dataOutputStream != null) {
                            dataOutputStream.close();
                        }
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    dataOutputStream = null;
                }
            }
            int c = c();
            if (Thread.interrupted()) {
                d();
                throw new ClientException("The thread has been cancelled after connection start");
            } else if (c != 200) {
                d();
                throw new ServerException(c);
            } else {
                InputStream e = e();
                String str = "UTF-8";
                if (this.d && (a2 = a("Content-Type")) != null) {
                    String[] split = a2.replace(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR, "").split(";");
                    int length = split.length;
                    int i = 0;
                    while (true) {
                        if (i >= length) {
                            break;
                        }
                        String str2 = split[i];
                        if (str2.startsWith("charset=")) {
                            str = str2.split("=", 2)[1];
                            break;
                        }
                        i++;
                    }
                }
                StringBuilder sb = new StringBuilder(1024);
                InputStreamReader inputStreamReader = new InputStreamReader(e, str);
                BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
                while (true) {
                    String readLine = bufferedReader.readLine();
                    if (readLine == null) {
                        bufferedReader.close();
                        inputStreamReader.close();
                        String sb2 = sb.toString();
                        c("HttpConnection.getResponseAsString");
                        d.c("HttpConnection.getResponseAsString", sb2);
                        e.close();
                        return sb2;
                    }
                    sb.append(readLine);
                }
            }
        } finally {
            this.c.disconnect();
        }
    }

    @Override // ru.mail.libverify.utils.e
    public final String a(String str) {
        b("HttpConnection.getHeaderField");
        String headerField = this.c.getHeaderField(str);
        c("HttpConnection.getHeaderField");
        return headerField;
    }

    @Override // ru.mail.libverify.utils.e
    public final void b() {
        b("HttpConnection.disconnect");
        this.c.disconnect();
    }
}
