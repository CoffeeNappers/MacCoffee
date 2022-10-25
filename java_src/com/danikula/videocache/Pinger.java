package com.danikula.videocache;

import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.util.Arrays;
import java.util.Locale;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class Pinger {
    private static final Logger LOG = LoggerFactory.getLogger("Pinger");
    private static final String PING_REQUEST = "ping";
    private static final String PING_RESPONSE = "ping ok";
    private final String host;
    private final ExecutorService pingExecutor = Executors.newSingleThreadExecutor();
    private final int port;

    /* JADX INFO: Access modifiers changed from: package-private */
    public Pinger(String host, int port) {
        this.host = (String) Preconditions.checkNotNull(host);
        this.port = port;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean ping(int maxAttempts, int startTimeout) {
        boolean pinged;
        Preconditions.checkArgument(maxAttempts >= 1);
        Preconditions.checkArgument(startTimeout > 0);
        int timeout = startTimeout;
        int attempts = 0;
        while (attempts < maxAttempts) {
            try {
                Future<Boolean> pingFuture = this.pingExecutor.submit(new PingCallable());
                pinged = pingFuture.get(timeout, TimeUnit.MILLISECONDS).booleanValue();
            } catch (InterruptedException e) {
                e = e;
                LOG.error("Error pinging server due to unexpected error", (Throwable) e);
            } catch (ExecutionException e2) {
                e = e2;
                LOG.error("Error pinging server due to unexpected error", (Throwable) e);
            } catch (TimeoutException e3) {
                LOG.warn("Error pinging server (attempt: " + attempts + ", timeout: " + timeout + "). ");
            }
            if (pinged) {
                return true;
            }
            attempts++;
            timeout *= 2;
        }
        String error = String.format("Error pinging server (attempts: %d, max timeout: %d). If you see this message, please, email me danikula@gmail.com or create issue here https://github.com/danikula/AndroidVideoCache/issues", Integer.valueOf(attempts), Integer.valueOf(timeout / 2));
        LOG.error(error, (Throwable) new ProxyCacheException(error));
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isPingRequest(String request) {
        return PING_REQUEST.equals(request);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void responseToPing(Socket socket) throws IOException {
        OutputStream out = socket.getOutputStream();
        out.write("HTTP/1.1 200 OK\n\n".getBytes());
        out.write(PING_RESPONSE.getBytes());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean pingServer() throws ProxyCacheException {
        String pingUrl = getPingUrl();
        HttpUrlSource source = new HttpUrlSource(pingUrl);
        try {
            try {
                byte[] expectedResponse = PING_RESPONSE.getBytes();
                source.open(0);
                byte[] response = new byte[expectedResponse.length];
                source.read(response);
                boolean pingOk = Arrays.equals(expectedResponse, response);
                LOG.info("Ping response: `" + new String(response) + "`, pinged? " + pingOk);
                source.close();
                return pingOk;
            } catch (ProxyCacheException e) {
                LOG.error("Error reading ping response", (Throwable) e);
                source.close();
                return false;
            }
        } catch (Throwable th) {
            source.close();
            throw th;
        }
    }

    private String getPingUrl() {
        return String.format(Locale.US, "http://%s:%d/%s", this.host, Integer.valueOf(this.port), PING_REQUEST);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class PingCallable implements Callable<Boolean> {
        private PingCallable() {
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.concurrent.Callable
        /* renamed from: call */
        public Boolean mo179call() throws Exception {
            return Boolean.valueOf(Pinger.this.pingServer());
        }
    }
}
