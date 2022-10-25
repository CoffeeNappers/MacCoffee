package com.vkontakte.android.audio.player.proxy;

import android.content.Context;
import android.net.Uri;
import android.os.SystemClock;
import android.text.TextUtils;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.utils.Utils;
import com.vkontakte.android.utils.L;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
/* loaded from: classes2.dex */
public final class PlayerProxy extends Thread {
    static final String LOG_TAG = "PlayerProxy";
    private static final String PARAM_MID = "mid";
    private static final String PARAM_SALT = "SALT";
    private static final String PARAM_URL = "url";
    private static final int[] PORTS = {48329, 12846, 4986, 24779};
    private static PlayerProxy sInstance;
    private static int sPort;
    private int mClientCounter;
    private final Context mContext;
    private final ServerSocketChannel mSocket;

    private PlayerProxy(Context context) throws IOException {
        this.mContext = context.getApplicationContext();
        IOException exception = null;
        ServerSocketChannel socket = null;
        int[] iArr = PORTS;
        int length = iArr.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                break;
            }
            int port = iArr[i];
            try {
                socket = ServerSocketChannel.open();
                socket.socket().bind(new InetSocketAddress(port));
                sPort = port;
                exception = null;
                break;
            } catch (IOException e) {
                exception = e;
                i++;
            }
        }
        if (exception != null) {
            throw exception;
        }
        this.mSocket = socket;
    }

    public static synchronized void startThread(Context context) throws IOException {
        synchronized (PlayerProxy.class) {
            if (sInstance == null) {
                sInstance = new PlayerProxy(context);
                sInstance.start();
            }
        }
    }

    public static synchronized void stopThread() {
        synchronized (PlayerProxy.class) {
            if (sInstance != null) {
                sInstance.interrupt();
                sInstance = null;
                sPort = 0;
            }
            ClientThread.stopAll();
        }
    }

    public static synchronized void cache(Context context, MusicTrack... tracks) {
        synchronized (PlayerProxy.class) {
            if (sInstance != null) {
                ClientThread.cache(context, tracks);
            }
        }
    }

    public static synchronized String createUrl(String mid, String url) {
        String builder;
        synchronized (PlayerProxy.class) {
            if (sInstance == null) {
                throw new RuntimeException("Proxy has not been initialized");
            }
            Uri.Builder builder2 = Uri.parse("http://127.0.0.1:" + Integer.toString(sPort)).buildUpon();
            builder2.appendQueryParameter(PARAM_MID, mid);
            if (!TextUtils.isEmpty(url)) {
                builder2.appendQueryParameter("url", url);
            }
            builder2.appendQueryParameter(PARAM_SALT, String.valueOf(SystemClock.elapsedRealtime()));
            builder = builder2.toString();
        }
        return builder;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        super.run();
        while (!isInterrupted()) {
            try {
                SocketChannel socket = this.mSocket.accept();
                this.mClientCounter++;
                L.d(LOG_TAG, "Client accepted", "client", Integer.valueOf(this.mClientCounter));
                new ReadQueryDataThread(socket, this.mClientCounter).start();
            } catch (IOException e) {
                L.e(e, new Object[0]);
            }
        }
    }

    @Override // java.lang.Thread
    public void interrupt() {
        super.interrupt();
        Utils.closeCloseable(this.mSocket);
    }

    /* loaded from: classes2.dex */
    private class ReadQueryDataThread extends Thread {
        private final int mClient;
        private final SocketChannel mSocket;

        public ReadQueryDataThread(SocketChannel socket, int client) {
            this.mSocket = socket;
            this.mClient = client;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            super.run();
            try {
                QueryData queryData = QueryData.read(this.mSocket, this.mClient);
                String mid = queryData.parameters.get(PlayerProxy.PARAM_MID);
                String url = queryData.parameters.get("url");
                ClientThread.play(PlayerProxy.this.mContext, mid, url, this.mSocket, queryData, this.mClient);
            } catch (Exception e) {
                L.e(e, new Object[0]);
            }
        }
    }
}
