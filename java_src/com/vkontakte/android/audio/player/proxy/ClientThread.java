package com.vkontakte.android.audio.player.proxy;

import android.content.Context;
import android.net.Uri;
import android.os.SystemClock;
import android.support.v4.util.Pair;
import android.text.TextUtils;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.gms.gcm.Task;
import com.vk.analytics.Analytics;
import com.vk.core.network.Network;
import com.vkontakte.android.audio.MusicApp;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.proxy.FileInfo;
import com.vkontakte.android.audio.player.proxy.QueryData;
import com.vkontakte.android.audio.utils.Utils;
import com.vkontakte.android.utils.L;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.SocketException;
import java.nio.ByteBuffer;
import java.nio.channels.ClosedChannelException;
import java.nio.channels.SocketChannel;
import java.util.Collections;
import java.util.LinkedList;
import okhttp3.Request;
import okhttp3.Response;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public final class ClientThread extends Thread {
    private static final int MAX_CACHED_TRACKS = 3;
    private static volatile ClientThread sClientThread;
    private final Context mContext;
    private boolean mHeaderSent;
    private final String mMid;
    private final QueryData mQueryData;
    private final SocketChannel mSocket;
    private boolean mSocketClosed;
    private String mUrl;
    private static final LinkedList<String> LAST_PLAYED_MIDS = new LinkedList<>();
    private static final LinkedList<MusicTrack> CACHE_QUEUE = new LinkedList<>();

    private ClientThread(Context context, String mid, String url, SocketChannel socket, QueryData queryData, int client) {
        this.mContext = context.getApplicationContext();
        this.mMid = mid;
        this.mUrl = url;
        this.mSocket = socket;
        this.mQueryData = queryData;
        L.v("PlayerProxy", "Client created", "mid", mid, "client", Integer.valueOf(client));
    }

    public static synchronized void cache(Context context, MusicTrack... tracks) {
        synchronized (ClientThread.class) {
            if (tracks.length > 0) {
                CACHE_QUEUE.clear();
                Collections.addAll(CACHE_QUEUE, tracks);
                if (sClientThread == null) {
                    cacheNext(context, null);
                } else if (!sClientThread.hasSocket() && !TextUtils.equals(sClientThread.getMid(), CACHE_QUEUE.peek().getMid())) {
                    cacheNext(context, null);
                }
            }
        }
    }

    public static synchronized void play(Context context, String mid, String url, SocketChannel socket, QueryData queryData, int client) {
        synchronized (ClientThread.class) {
            boolean removed = LAST_PLAYED_MIDS.remove(mid);
            LAST_PLAYED_MIDS.add(mid);
            if (!removed && LAST_PLAYED_MIDS.size() > 3) {
                LAST_PLAYED_MIDS.poll();
            }
            if (sClientThread != null) {
                sClientThread.interrupt();
            }
            sClientThread = new ClientThread(context, mid, url, socket, queryData, client);
            sClientThread.start();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static synchronized void stopAll() {
        synchronized (ClientThread.class) {
            CACHE_QUEUE.clear();
            if (sClientThread != null) {
                sClientThread.interrupt();
                sClientThread = null;
            }
        }
    }

    private static synchronized void cacheNext(Context context, String currentMid) {
        synchronized (ClientThread.class) {
            if (sClientThread != null) {
                sClientThread.interrupt();
                sClientThread = null;
            }
            if (currentMid != null) {
                while (true) {
                    MusicTrack track = CACHE_QUEUE.peek();
                    if (track == null || !TextUtils.equals(track.getMid(), currentMid)) {
                        break;
                    }
                    CACHE_QUEUE.poll();
                }
            }
            MusicTrack track2 = CACHE_QUEUE.peek();
            if (track2 != null) {
                try {
                    sClientThread = new ClientThread(context, track2.getMid(), track2.url, null, null, -CACHE_QUEUE.size());
                    sClientThread.start();
                } catch (Exception e) {
                    Analytics.logException(e);
                }
            }
        }
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        if (this.mSocket == null) {
            SystemClock.sleep(1000L);
            if (isInterrupted()) {
                return;
            }
        }
        try {
            try {
                if (this.mUrl == null || (!this.mUrl.startsWith("file:") && !this.mUrl.startsWith("content:"))) {
                    handleHttp();
                } else {
                    handleUri();
                }
                SystemClock.sleep(1000L);
                if (this.mSocket != null) {
                    synchronized (this.mSocket) {
                        if (!this.mSocketClosed) {
                            this.mSocketClosed = true;
                            Utils.closeCloseable(this.mSocket);
                        }
                    }
                }
                synchronized (ClientThread.class) {
                    if (sClientThread == this) {
                        sClientThread.interrupt();
                        sClientThread = null;
                        cacheNext(this.mContext, this.mMid);
                    }
                }
            } catch (Exception e) {
                L.e(e, new Object[0]);
                if (this.mSocket != null) {
                    synchronized (this.mSocket) {
                        if (!this.mSocketClosed) {
                            this.mSocketClosed = true;
                            Utils.closeCloseable(this.mSocket);
                        }
                    }
                }
                synchronized (ClientThread.class) {
                    if (sClientThread == this) {
                        sClientThread.interrupt();
                        sClientThread = null;
                        cacheNext(this.mContext, this.mMid);
                    }
                }
            }
        } catch (Throwable th) {
            if (this.mSocket != null) {
                synchronized (this.mSocket) {
                    if (!this.mSocketClosed) {
                        this.mSocketClosed = true;
                        Utils.closeCloseable(this.mSocket);
                    }
                }
            }
            synchronized (ClientThread.class) {
                if (sClientThread == this) {
                    sClientThread.interrupt();
                    sClientThread = null;
                    cacheNext(this.mContext, this.mMid);
                }
                throw th;
            }
        }
    }

    private void handleUri() {
        if (this.mSocket != null) {
            try {
                boolean isXored = !this.mUrl.startsWith("content://");
                try {
                    InputStream in = this.mContext.getContentResolver().openInputStream(Uri.parse(this.mUrl));
                    if (in == null) {
                        sendHeaderError(404, "Not found");
                        throw new IOException("Input stream is null");
                    }
                    try {
                        QueryData.Range range = this.mQueryData.getRange();
                        if (range != null && !range.isValid()) {
                            sendHeaderError(416, "Requested Range Not Satisfiable");
                            throw new IOException("Requested Range not satisfiable");
                        }
                        sendHeaderSuccess(range, in.available());
                        L.v("PlayerProxy", "Sending file");
                        byte[] buff = new byte[Task.EXTRAS_LIMIT_BYTES];
                        ByteBuffer buffer = ByteBuffer.wrap(buff);
                        if (range != null) {
                            for (long skipCount = range.from; skipCount > 0; skipCount -= in.skip(skipCount)) {
                            }
                        }
                        long elapsed = (range == null || range.to == null) ? Long.MAX_VALUE : (range.to.longValue() - range.from) + 1;
                        long pos = range != null ? range.from : 0L;
                        do {
                            int len = in.read(buff, 0, (int) Math.min(buff.length, elapsed));
                            if (len >= 0) {
                                if (isXored) {
                                    Utils.doXor(buff, len, pos);
                                    pos += len;
                                }
                                buffer.rewind();
                                buffer.limit(len);
                                while (buffer.hasRemaining()) {
                                    writeToTheSocket(buffer);
                                }
                                elapsed -= len;
                                if (elapsed <= 0) {
                                }
                            }
                            L.v("PlayerProxy", "File sent");
                            return;
                        } while (!isInterrupted());
                    } finally {
                        Utils.closeCloseable(in);
                    }
                } catch (FileNotFoundException e) {
                    sendHeaderError(404, "Not Found");
                    throw e;
                }
            } catch (SocketException e2) {
                e = e2;
                L.v("PlayerProxy", "Error", "exception", e);
            } catch (ClosedChannelException e3) {
                e = e3;
                L.v("PlayerProxy", "Error", "exception", e);
            } catch (Exception e4) {
                L.e(e4, new Object[0]);
                L.v("PlayerProxy", "Error", "exception", e4);
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:142:0x0498, code lost:
        if (r45 <= 0) goto L101;
     */
    /* JADX WARN: Code restructure failed: missing block: B:143:0x049a, code lost:
        r31.addRange(r39.from, (r39.from + r45) - 1);
        r31.save();
     */
    /* JADX WARN: Code restructure failed: missing block: B:145:0x04b2, code lost:
        com.vkontakte.android.utils.L.v("PlayerProxy", "Part downloaded");
        com.vkontakte.android.audio.utils.Utils.closeCloseable(r34);
     */
    /* JADX WARN: Code restructure failed: missing block: B:190:?, code lost:
        return;
     */
    /* JADX WARN: Finally extract failed */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void handleHttp() {
        /*
            Method dump skipped, instructions count: 1318
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vkontakte.android.audio.player.proxy.ClientThread.handleHttp():void");
    }

    private static Pair<Response, String> requestWithUpdateUrl(FileInfo.Part part, String mid, String url) throws IOException {
        L.d("Old link", mid, url);
        if (url == null) {
            try {
                url = MusicApp.getActualLink(mid);
            } catch (Exception e) {
                L.e(e, new Object[0]);
            }
            return Pair.create(request(part, url), url);
        }
        L.d(part, url);
        Response response = request(part, url);
        int statusCode = response.code();
        if (statusCode == 404) {
            try {
                url = MusicApp.getActualLink(mid);
                L.d("New link", mid, url);
                response = request(part, url);
            } catch (Exception e2) {
                L.e(e2, new Object[0]);
            }
        }
        return Pair.create(response, url);
    }

    private static Response request(FileInfo.Part part, String url) throws IOException {
        L.d(url);
        Request.Builder builder = new Request.Builder().url(url).get();
        if (part.to >= 0) {
            builder.header("Range", "bytes=" + Long.toString(part.from) + "-" + Long.toString(part.to));
        } else {
            builder.header("Range", "bytes=" + Long.toString(part.from) + "-");
        }
        Response response = Network.getDefaultClient().newCall(builder.build()).execute();
        L.d(Integer.valueOf(response.code()));
        return response;
    }

    @Override // java.lang.Thread
    public void interrupt() {
        super.interrupt();
        if (this.mSocket != null) {
            synchronized (this.mSocket) {
                if (!this.mSocketClosed) {
                    this.mSocketClosed = true;
                    Utils.closeCloseable(this.mSocket);
                }
            }
        }
    }

    private boolean hasSocket() {
        return this.mSocket != null;
    }

    public String getMid() {
        return this.mMid;
    }

    private boolean sendHeaderSuccess(FileInfo fileInfo, QueryData.Range range) throws IOException {
        if (this.mSocket == null || this.mHeaderSent) {
            return false;
        }
        if (range == null) {
            sendLine("HTTP/1.1 200 OK");
        } else {
            sendLine("HTTP/1.1 206 Partial content");
        }
        sendLine("Server: local proxy server");
        String contentType = fileInfo.getContentType();
        if (!TextUtils.isEmpty(contentType)) {
            sendLine("Content-Type: " + contentType);
        }
        sendLine("Connection: close");
        if (range == null) {
            sendLine("Accept-Ranges: bytes");
        }
        long contentLength = fileInfo.getContentLength();
        if (range == null) {
            sendLine("Content-Length: " + contentLength);
        } else {
            long to = range.to == null ? contentLength - 1 : range.to.longValue();
            sendLine("Content-Range: bytes " + range.from + '-' + to + '/' + contentLength);
            sendLine("Content-Length: " + Long.toString((to - range.from) + 1));
        }
        sendLine("");
        this.mHeaderSent = true;
        return true;
    }

    private boolean sendHeaderSuccess(QueryData.Range range, long contentLength) throws IOException {
        if (this.mSocket == null || this.mHeaderSent) {
            return false;
        }
        if (range == null) {
            sendLine("HTTP/1.1 200 OK");
        } else {
            sendLine("HTTP/1.1 206 Partial content");
        }
        sendLine("Server: local proxy server");
        sendLine("Connection: close");
        if (range == null) {
            sendLine("Accept-Ranges: bytes");
        }
        if (range == null) {
            sendLine("Content-Length: " + contentLength);
        } else {
            long to = range.to == null ? contentLength - 1 : range.to.longValue();
            sendLine("Content-Range: bytes " + range.from + '-' + to + '/' + contentLength);
            sendLine("Content-Length: " + Long.toString((to - range.from) + 1));
        }
        sendLine("");
        this.mHeaderSent = true;
        return true;
    }

    private boolean sendHeaderError(int errorCode, String reason) throws IOException {
        if (this.mSocket == null || this.mHeaderSent) {
            return false;
        }
        sendLine("HTTP/1.1 " + errorCode + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + reason);
        sendLine("Server: local proxy server");
        sendLine("Connection: close");
        sendLine("Content-Type: text/plain");
        sendLine("Content-Length: 0");
        sendLine("");
        sendLine("");
        this.mHeaderSent = true;
        return true;
    }

    private void sendLine(String line) throws IOException {
        ByteBuffer buffer = ByteBuffer.wrap((line + "\r\n").getBytes());
        while (buffer.hasRemaining()) {
            writeToTheSocket(buffer);
        }
        L.v("PlayerProxy", "sendLine", "line", line);
    }

    private void writeToTheSocket(ByteBuffer buffer) throws IOException {
        this.mSocket.write(buffer);
    }
}
