package com.google.android.gms.internal;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.Thread;
import java.net.Socket;
import java.net.URI;
import java.net.UnknownHostException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
/* loaded from: classes2.dex */
public class zzamv {
    private final zzamy bjA;
    private final URI bjx;
    private static final AtomicInteger bjs = new AtomicInteger(0);
    private static final Charset bjt = Charset.forName("UTF-8");
    private static ThreadFactory bjC = Executors.defaultThreadFactory();
    private static zzamu bjD = new zzamu() { // from class: com.google.android.gms.internal.zzamv.1
        @Override // com.google.android.gms.internal.zzamu
        public void zza(Thread thread, String str) {
            thread.setName(str);
        }
    };
    private volatile zza bju = zza.NONE;
    private volatile Socket bjv = null;
    private zzamw bjw = null;
    private final int yr = bjs.incrementAndGet();
    private final Thread bjB = getThreadFactory().newThread(new Runnable() { // from class: com.google.android.gms.internal.zzamv.2
        @Override // java.lang.Runnable
        public void run() {
            zzamv.this.n();
        }
    });
    private final zzana bjy = new zzana(this);
    private final zzanb bjz = new zzanb(this, "TubeSock", this.yr);

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public enum zza {
        NONE,
        CONNECTING,
        CONNECTED,
        DISCONNECTING,
        DISCONNECTED
    }

    public zzamv(URI uri, String str, Map<String, String> map) {
        this.bjx = uri;
        this.bjA = new zzamy(uri, str, map);
    }

    private Socket createSocket() {
        String scheme = this.bjx.getScheme();
        String host = this.bjx.getHost();
        int port = this.bjx.getPort();
        if (scheme != null && scheme.equals("ws")) {
            try {
                return new Socket(host, port == -1 ? 80 : port);
            } catch (UnknownHostException e) {
                String valueOf = String.valueOf(host);
                throw new zzamx(valueOf.length() != 0 ? "unknown host: ".concat(valueOf) : new String("unknown host: "), e);
            } catch (IOException e2) {
                String valueOf2 = String.valueOf(this.bjx);
                throw new zzamx(new StringBuilder(String.valueOf(valueOf2).length() + 31).append("error while creating socket to ").append(valueOf2).toString(), e2);
            }
        } else if (scheme == null || !scheme.equals("wss")) {
            String valueOf3 = String.valueOf(scheme);
            throw new zzamx(valueOf3.length() != 0 ? "unsupported protocol: ".concat(valueOf3) : new String("unsupported protocol: "));
        } else {
            if (port == -1) {
                port = 443;
            }
            try {
                SSLSocket sSLSocket = (SSLSocket) SSLSocketFactory.getDefault().createSocket(host, port);
                if (HttpsURLConnection.getDefaultHostnameVerifier().verify(host, sSLSocket.getSession())) {
                    return sSLSocket;
                }
                String valueOf4 = String.valueOf(this.bjx);
                throw new zzamx(new StringBuilder(String.valueOf(valueOf4).length() + 39).append("Error while verifying secure socket to ").append(valueOf4).toString());
            } catch (UnknownHostException e3) {
                String valueOf5 = String.valueOf(host);
                throw new zzamx(valueOf5.length() != 0 ? "unknown host: ".concat(valueOf5) : new String("unknown host: "), e3);
            } catch (IOException e4) {
                String valueOf6 = String.valueOf(this.bjx);
                throw new zzamx(new StringBuilder(String.valueOf(valueOf6).length() + 38).append("error while creating secure socket to ").append(valueOf6).toString(), e4);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static ThreadFactory getThreadFactory() {
        return bjC;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static zzamu h() {
        return bjD;
    }

    private synchronized void k() {
        if (this.bju != zza.DISCONNECTED) {
            this.bjy.r();
            this.bjz.u();
            if (this.bjv != null) {
                try {
                    this.bjv.close();
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
            this.bju = zza.DISCONNECTED;
            this.bjw.onClose();
        }
    }

    private void l() {
        try {
            this.bju = zza.DISCONNECTING;
            this.bjz.u();
            this.bjz.zzb((byte) 8, true, new byte[0]);
        } catch (IOException e) {
            this.bjw.zza(new zzamx("Failed to send close frame", e));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void n() {
        boolean z;
        try {
            Socket createSocket = createSocket();
            synchronized (this) {
                this.bjv = createSocket;
                if (this.bju == zza.DISCONNECTED) {
                    try {
                        this.bjv.close();
                        this.bjv = null;
                        return;
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
                }
                DataInputStream dataInputStream = new DataInputStream(createSocket.getInputStream());
                OutputStream outputStream = createSocket.getOutputStream();
                outputStream.write(this.bjA.p());
                byte[] bArr = new byte[1000];
                ArrayList arrayList = new ArrayList();
                int i = 0;
                boolean z2 = false;
                while (!z2) {
                    int read = dataInputStream.read();
                    if (read == -1) {
                        throw new zzamx("Connection closed before handshake was complete");
                    }
                    bArr[i] = (byte) read;
                    i++;
                    if (bArr[i - 1] == 10 && bArr[i - 2] == 13) {
                        String str = new String(bArr, bjt);
                        if (str.trim().equals("")) {
                            z = true;
                        } else {
                            arrayList.add(str.trim());
                            z = z2;
                        }
                        z2 = z;
                        bArr = new byte[1000];
                        i = 0;
                    } else if (i == 1000) {
                        String valueOf = String.valueOf(new String(bArr, bjt));
                        throw new zzamx(valueOf.length() != 0 ? "Unexpected long line in handshake: ".concat(valueOf) : new String("Unexpected long line in handshake: "));
                    }
                }
                this.bjA.zzsz((String) arrayList.get(0));
                arrayList.remove(0);
                HashMap<String, String> hashMap = new HashMap<>();
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    String[] split = ((String) it.next()).split(": ", 2);
                    hashMap.put(split[0], split[1]);
                }
                this.bjA.zzd(hashMap);
                this.bjz.zzb(outputStream);
                this.bjy.zza(dataInputStream);
                this.bju = zza.CONNECTED;
                this.bjz.o().start();
                this.bjw.zzctt();
                this.bjy.run();
            }
        } catch (zzamx e2) {
            this.bjw.zza(e2);
        } catch (IOException e3) {
            zzamw zzamwVar = this.bjw;
            String valueOf2 = String.valueOf(e3.getMessage());
            zzamwVar.zza(new zzamx(valueOf2.length() != 0 ? "error while connecting: ".concat(valueOf2) : new String("error while connecting: "), e3));
        } finally {
            close();
        }
    }

    private synchronized void zza(byte b, byte[] bArr) {
        if (this.bju != zza.CONNECTED) {
            this.bjw.zza(new zzamx("error while sending data: not connected"));
        } else {
            try {
                this.bjz.zzb(b, true, bArr);
            } catch (IOException e) {
                this.bjw.zza(new zzamx("Failed to send frame", e));
                close();
            }
        }
    }

    public static void zza(ThreadFactory threadFactory, zzamu zzamuVar) {
        bjC = threadFactory;
        bjD = zzamuVar;
    }

    public synchronized void close() {
        switch (this.bju) {
            case NONE:
                this.bju = zza.DISCONNECTED;
                break;
            case CONNECTING:
                k();
                break;
            case CONNECTED:
                l();
                break;
        }
    }

    public synchronized void connect() {
        if (this.bju != zza.NONE) {
            this.bjw.zza(new zzamx("connect() already called"));
            close();
        } else {
            zzamu h = h();
            Thread o = o();
            String valueOf = String.valueOf("TubeSockReader-");
            h.zza(o, new StringBuilder(String.valueOf(valueOf).length() + 11).append(valueOf).append(this.yr).toString());
            this.bju = zza.CONNECTING;
            o().start();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzamw i() {
        return this.bjw;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void j() {
        k();
    }

    public void m() throws InterruptedException {
        if (this.bjz.o().getState() != Thread.State.NEW) {
            this.bjz.o().join();
        }
        o().join();
    }

    Thread o() {
        return this.bjB;
    }

    public void zza(zzamw zzamwVar) {
        this.bjw = zzamwVar;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public synchronized void zzaw(byte[] bArr) {
        zza((byte) 10, bArr);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzb(zzamx zzamxVar) {
        this.bjw.zza(zzamxVar);
        if (this.bju == zza.CONNECTED) {
            close();
        }
        k();
    }

    public synchronized void zzsp(String str) {
        zza((byte) 1, str.getBytes(bjt));
    }
}
