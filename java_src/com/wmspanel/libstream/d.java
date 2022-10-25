package com.wmspanel.libstream;

import android.net.Uri;
import android.os.Handler;
import android.os.SystemClock;
import android.util.Log;
import com.vk.media.camera.CameraUtilsEffects;
import com.wmspanel.libstream.Streamer;
import java.io.IOException;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.util.Iterator;
import java.util.Map;
import java.util.Queue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public class d {
    private static final String TAG = "ConnectionManager";
    private Map<Integer, a> E;
    private Selector F;
    private Thread H;
    private Queue<a> K;
    private Map<Integer, b> M;
    private Streamer.Listener mListener;
    private StreamBuffer mStreamBuffer;
    private int G = 0;
    private long I = -1;
    private long J = -1;
    private long L = 0;
    private String mUserAgent = "Larix/1.0.28";

    /* JADX INFO: Access modifiers changed from: package-private */
    public d(StreamBuffer streamBuffer) {
        if (streamBuffer == null) {
            throw new IllegalArgumentException();
        }
        this.mStreamBuffer = streamBuffer;
        this.E = new ConcurrentHashMap();
        this.K = new ConcurrentLinkedQueue();
        this.M = new ConcurrentHashMap();
        try {
            this.F = Selector.open();
        } catch (IOException e) {
            Log.e(TAG, Log.getStackTraceString(e));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setListener(Streamer.Listener listener) {
        this.mListener = listener;
    }

    private void r() {
        if (this.H == null) {
            this.H = new Thread() { // from class: com.wmspanel.libstream.d.1
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    d.this.I = SystemClock.uptimeMillis();
                    while (!isInterrupted()) {
                        try {
                            d.this.F.select(250L);
                            Iterator<SelectionKey> it = d.this.F.selectedKeys().iterator();
                            while (true) {
                                if (it.hasNext()) {
                                    SelectionKey next = it.next();
                                    if (next.isValid()) {
                                        next.readyOps();
                                        a aVar = (a) next.attachment();
                                        if (aVar == null) {
                                            Log.e(d.TAG, "connection is null");
                                            break;
                                        }
                                        aVar.a(next);
                                    }
                                }
                            }
                            d.this.F.selectedKeys().clear();
                            d.this.s();
                            d.this.t();
                            d.this.u();
                        } catch (IOException e) {
                            Log.e(d.TAG, Log.getStackTraceString(e));
                            return;
                        }
                    }
                }
            };
            this.H.start();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void s() throws IOException {
        long uptimeMillis = SystemClock.uptimeMillis();
        if (uptimeMillis - this.I >= 500) {
            this.I = uptimeMillis;
            while (true) {
                a poll = this.K.poll();
                if (poll != null) {
                    poll.connect();
                } else {
                    return;
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void t() {
        long uptimeMillis = SystemClock.uptimeMillis();
        if (uptimeMillis - this.J >= 200) {
            this.J = uptimeMillis;
            for (SelectionKey selectionKey : this.F.keys()) {
                if (selectionKey.isValid()) {
                    a aVar = (a) selectionKey.attachment();
                    if (aVar == null) {
                        Log.e(TAG, "null connection");
                    } else if (aVar.b() == 0) {
                        aVar.d();
                    }
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void u() {
        if (this.L == 0) {
            this.L = System.currentTimeMillis();
            return;
        }
        long currentTimeMillis = System.currentTimeMillis();
        if (currentTimeMillis - this.L > 2000) {
            for (SelectionKey selectionKey : this.F.keys()) {
                a aVar = (a) selectionKey.attachment();
                if (aVar == null) {
                    Log.e(TAG, "null connection");
                } else {
                    aVar.e();
                }
            }
            this.L = currentTimeMillis;
        }
    }

    private void v() {
        if (this.H != null) {
            try {
                this.H.interrupt();
                this.H.join();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            } finally {
                this.H = null;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Selector w() {
        return this.F;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public StreamBuffer x() {
        return this.mStreamBuffer;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public synchronized int a(ConnectionConfig connectionConfig, Streamer.Listener listener) {
        int i;
        String str;
        a iVar;
        int indexOf;
        String str2 = null;
        synchronized (this) {
            try {
                String str3 = connectionConfig.uri;
                Uri parse = Uri.parse(connectionConfig.uri);
                String scheme = parse.getScheme();
                if (scheme == null) {
                    Log.e(TAG, "failed to parse scheme, uri=" + parse);
                    i = -1;
                } else {
                    String userInfo = parse.getUserInfo();
                    if (userInfo != null) {
                        String[] split = userInfo.split(":");
                        if (split.length == 2) {
                            str = split[0];
                            str2 = split[1];
                        } else {
                            str = null;
                        }
                        if (connectionConfig.uri.indexOf("@") != -1) {
                            str3 = scheme + "://" + connectionConfig.uri.substring(indexOf + 1);
                        }
                    } else {
                        str = null;
                    }
                    if (connectionConfig.username != null && connectionConfig.password != null) {
                        str = connectionConfig.username;
                        str2 = connectionConfig.password;
                    }
                    String host = parse.getHost();
                    if (host == null) {
                        Log.e(TAG, "failed to parse host, uri=" + parse);
                        i = -1;
                    } else {
                        int port = parse.getPort();
                        if (scheme.equalsIgnoreCase("rtsp")) {
                            if (-1 == port) {
                                port = 554;
                            }
                            int i2 = this.G + 1;
                            this.G = i2;
                            iVar = new m(this, i2, connectionConfig.mode, str3, host, port, str, str2);
                        } else if (scheme.equalsIgnoreCase("rtmp")) {
                            if (-1 == port) {
                                port = 1935;
                            }
                            String[] split2 = connectionConfig.uri.split(CameraUtilsEffects.FILE_DELIM);
                            if (split2.length < 5) {
                                Log.e(TAG, "failed to get rtmp app & stream, uri=" + parse);
                                i = -1;
                            } else {
                                String str4 = split2[3];
                                for (int i3 = 4; i3 < split2.length - 1; i3++) {
                                    str4 = str4 + CameraUtilsEffects.FILE_DELIM + split2[i3];
                                }
                                String str5 = split2[split2.length - 1];
                                int i4 = this.G + 1;
                                this.G = i4;
                                iVar = new i(this, i4, connectionConfig.mode, str3, host, port, str4, str5);
                                Streamer.a aVar = new Streamer.a();
                                aVar.dB = connectionConfig.auth;
                                aVar.username = connectionConfig.username;
                                aVar.password = connectionConfig.password;
                                ((i) iVar).a(aVar);
                                if (connectionConfig.auth == Streamer.AUTH.LLNW) {
                                    b bVar = new b();
                                    bVar.uri = str3;
                                    bVar.mode = connectionConfig.mode;
                                    bVar.s = host;
                                    bVar.port = port;
                                    bVar.t = str4;
                                    bVar.u = str5;
                                    bVar.auth = connectionConfig.auth;
                                    bVar.username = connectionConfig.username;
                                    bVar.password = connectionConfig.password;
                                    this.M.put(Integer.valueOf(this.G), bVar);
                                }
                            }
                        } else {
                            Log.e(TAG, "unsupported scheme=" + scheme);
                            i = -1;
                        }
                        if (iVar == null) {
                            Log.e(TAG, "failed to create connection, uri=" + parse);
                            i = -1;
                        } else {
                            a(iVar);
                            i = this.G;
                        }
                    }
                }
            } catch (Exception e) {
                Log.e(TAG, Log.getStackTraceString(e));
                i = -1;
            }
        }
        return i;
    }

    private void a(a aVar) {
        this.E.put(Integer.valueOf(this.G), aVar);
        r();
        this.K.add(aVar);
        this.F.wakeup();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public synchronized void releaseConnection(int connectionId) {
        this.M.remove(Integer.valueOf(connectionId));
        a remove = this.E.remove(Integer.valueOf(connectionId));
        if (remove != null) {
            remove.release();
            if (this.E.isEmpty()) {
                v();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void release() {
        for (Map.Entry<Integer, a> entry : this.E.entrySet()) {
            entry.getValue().close();
        }
        this.E.clear();
        this.M.clear();
        v();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long getBytesSent(int connectionId) {
        a aVar = this.E.get(Integer.valueOf(connectionId));
        if (aVar == null) {
            return 0L;
        }
        return aVar.g();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long getBytesRecv(int connectionId) {
        a aVar = this.E.get(Integer.valueOf(connectionId));
        if (aVar == null) {
            return 0L;
        }
        return aVar.h();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long getAudioPacketsSent(int connectionId) {
        a aVar = this.E.get(Integer.valueOf(connectionId));
        if (aVar == null) {
            return 0L;
        }
        return aVar.i();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long getAudioPacketsLost(int connectionId) {
        a aVar = this.E.get(Integer.valueOf(connectionId));
        if (aVar == null) {
            return 0L;
        }
        return aVar.j();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long getVideoPacketsSent(int connectionId) {
        a aVar = this.E.get(Integer.valueOf(connectionId));
        if (aVar == null) {
            return 0L;
        }
        return aVar.k();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long getVideoPacketsLost(int connectionId) {
        a aVar = this.E.get(Integer.valueOf(connectionId));
        if (aVar == null) {
            return 0L;
        }
        return aVar.l();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean y() {
        return this.E.isEmpty();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setUserAgent(String userAgent) {
        this.mUserAgent = userAgent;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String z() {
        return this.mUserAgent;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void a(int i, String str) {
        b bVar = this.M.get(Integer.valueOf(i));
        if (bVar != null) {
            bVar.v = str;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void a(final int i, final Streamer.CONNECTION_STATE connection_state, final Streamer.STATUS status) {
        Handler handler;
        boolean z;
        b bVar = this.M.get(Integer.valueOf(i));
        if (bVar != null && connection_state == Streamer.CONNECTION_STATE.DISCONNECTED && status == Streamer.STATUS.AUTH_FAIL && bVar.auth == Streamer.AUTH.LLNW && bVar.username != null && bVar.password != null && !bVar.username.isEmpty() && !bVar.password.isEmpty() && bVar.v != null && !bVar.v.isEmpty()) {
            releaseConnection(i);
            Streamer.a aVar = new Streamer.a();
            aVar.dB = bVar.auth;
            aVar.username = bVar.username;
            aVar.password = bVar.password;
            aVar.v = bVar.v;
            try {
                i iVar = new i(this, i, bVar.mode, bVar.uri, bVar.s, bVar.port, bVar.t, bVar.u);
                iVar.a(aVar);
                a(iVar);
                z = false;
            } catch (Exception e) {
                z = true;
            }
            if (!z) {
                return;
            }
        }
        if (this.mListener != null && (handler = this.mListener.getHandler()) != null) {
            handler.post(new Runnable() { // from class: com.wmspanel.libstream.d.2
                @Override // java.lang.Runnable
                public void run() {
                    d.this.mListener.onConnectionStateChanged(i, connection_state, status);
                }
            });
        }
    }
}
