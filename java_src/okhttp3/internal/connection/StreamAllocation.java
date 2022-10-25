package okhttp3.internal.connection;

import java.io.IOException;
import java.lang.ref.Reference;
import java.lang.ref.WeakReference;
import java.util.concurrent.TimeUnit;
import okhttp3.Address;
import okhttp3.ConnectionPool;
import okhttp3.OkHttpClient;
import okhttp3.Route;
import okhttp3.internal.Internal;
import okhttp3.internal.Util;
import okhttp3.internal.http.HttpCodec;
import okhttp3.internal.http1.Http1Codec;
import okhttp3.internal.http2.ConnectionShutdownException;
import okhttp3.internal.http2.ErrorCode;
import okhttp3.internal.http2.Http2Codec;
import okhttp3.internal.http2.StreamResetException;
/* loaded from: classes3.dex */
public final class StreamAllocation {
    static final /* synthetic */ boolean $assertionsDisabled;
    public final Address address;
    private final Object callStackTrace;
    private boolean canceled;
    private HttpCodec codec;
    private RealConnection connection;
    private final ConnectionPool connectionPool;
    private int refusedStreamCount;
    private boolean released;
    private Route route;
    private final RouteSelector routeSelector;

    static {
        $assertionsDisabled = !StreamAllocation.class.desiredAssertionStatus();
    }

    public StreamAllocation(ConnectionPool connectionPool, Address address, Object callStackTrace) {
        this.connectionPool = connectionPool;
        this.address = address;
        this.routeSelector = new RouteSelector(address, routeDatabase());
        this.callStackTrace = callStackTrace;
    }

    public HttpCodec newStream(OkHttpClient client, boolean doExtensiveHealthChecks) {
        HttpCodec resultCodec;
        int connectTimeout = client.connectTimeoutMillis();
        int readTimeout = client.readTimeoutMillis();
        int writeTimeout = client.writeTimeoutMillis();
        boolean connectionRetryEnabled = client.retryOnConnectionFailure();
        try {
            RealConnection resultConnection = findHealthyConnection(connectTimeout, readTimeout, writeTimeout, connectionRetryEnabled, doExtensiveHealthChecks);
            if (resultConnection.http2Connection != null) {
                resultCodec = new Http2Codec(client, this, resultConnection.http2Connection);
            } else {
                resultConnection.socket().setSoTimeout(readTimeout);
                resultConnection.source.timeout().timeout(readTimeout, TimeUnit.MILLISECONDS);
                resultConnection.sink.timeout().timeout(writeTimeout, TimeUnit.MILLISECONDS);
                resultCodec = new Http1Codec(client, this, resultConnection.source, resultConnection.sink);
            }
            synchronized (this.connectionPool) {
                this.codec = resultCodec;
            }
            return resultCodec;
        } catch (IOException e) {
            throw new RouteException(e);
        }
    }

    private RealConnection findHealthyConnection(int connectTimeout, int readTimeout, int writeTimeout, boolean connectionRetryEnabled, boolean doExtensiveHealthChecks) throws IOException {
        RealConnection candidate;
        while (true) {
            candidate = findConnection(connectTimeout, readTimeout, writeTimeout, connectionRetryEnabled);
            synchronized (this.connectionPool) {
                if (candidate.successCount != 0) {
                    if (candidate.isHealthy(doExtensiveHealthChecks)) {
                        break;
                    }
                    noNewStreams();
                } else {
                    break;
                }
            }
        }
        return candidate;
    }

    private RealConnection findConnection(int connectTimeout, int readTimeout, int writeTimeout, boolean connectionRetryEnabled) throws IOException {
        synchronized (this.connectionPool) {
            if (this.released) {
                throw new IllegalStateException("released");
            }
            if (this.codec != null) {
                throw new IllegalStateException("codec != null");
            }
            if (this.canceled) {
                throw new IOException("Canceled");
            }
            RealConnection allocatedConnection = this.connection;
            if (allocatedConnection == null || allocatedConnection.noNewStreams) {
                RealConnection pooledConnection = Internal.instance.get(this.connectionPool, this.address, this);
                if (pooledConnection != null) {
                    this.connection = pooledConnection;
                    return pooledConnection;
                }
                Route selectedRoute = this.route;
                if (selectedRoute == null) {
                    selectedRoute = this.routeSelector.next();
                    synchronized (this.connectionPool) {
                        this.route = selectedRoute;
                        this.refusedStreamCount = 0;
                    }
                }
                RealConnection newConnection = new RealConnection(selectedRoute);
                synchronized (this.connectionPool) {
                    acquire(newConnection);
                    Internal.instance.put(this.connectionPool, newConnection);
                    this.connection = newConnection;
                    if (this.canceled) {
                        throw new IOException("Canceled");
                    }
                }
                newConnection.connect(connectTimeout, readTimeout, writeTimeout, this.address.connectionSpecs(), connectionRetryEnabled);
                routeDatabase().connected(newConnection.route());
                return newConnection;
            }
            return allocatedConnection;
        }
    }

    public void streamFinished(boolean noNewStreams, HttpCodec codec) {
        synchronized (this.connectionPool) {
            if (codec != null) {
                if (codec == this.codec) {
                    if (!noNewStreams) {
                        this.connection.successCount++;
                    }
                }
            }
            throw new IllegalStateException("expected " + this.codec + " but was " + codec);
        }
        deallocate(noNewStreams, false, true);
    }

    public HttpCodec codec() {
        HttpCodec httpCodec;
        synchronized (this.connectionPool) {
            httpCodec = this.codec;
        }
        return httpCodec;
    }

    private RouteDatabase routeDatabase() {
        return Internal.instance.routeDatabase(this.connectionPool);
    }

    public synchronized RealConnection connection() {
        return this.connection;
    }

    public void release() {
        deallocate(false, true, false);
    }

    public void noNewStreams() {
        deallocate(true, false, false);
    }

    private void deallocate(boolean noNewStreams, boolean released, boolean streamFinished) {
        RealConnection connectionToClose = null;
        synchronized (this.connectionPool) {
            if (streamFinished) {
                this.codec = null;
            }
            if (released) {
                this.released = true;
            }
            if (this.connection != null) {
                if (noNewStreams) {
                    this.connection.noNewStreams = true;
                }
                if (this.codec == null && (this.released || this.connection.noNewStreams)) {
                    release(this.connection);
                    if (this.connection.allocations.isEmpty()) {
                        this.connection.idleAtNanos = System.nanoTime();
                        if (Internal.instance.connectionBecameIdle(this.connectionPool, this.connection)) {
                            connectionToClose = this.connection;
                        }
                    }
                    this.connection = null;
                }
            }
        }
        if (connectionToClose != null) {
            Util.closeQuietly(connectionToClose.socket());
        }
    }

    public void cancel() {
        HttpCodec codecToCancel;
        RealConnection connectionToCancel;
        synchronized (this.connectionPool) {
            this.canceled = true;
            codecToCancel = this.codec;
            connectionToCancel = this.connection;
        }
        if (codecToCancel != null) {
            codecToCancel.cancel();
        } else if (connectionToCancel != null) {
            connectionToCancel.cancel();
        }
    }

    public void streamFailed(IOException e) {
        boolean noNewStreams = false;
        synchronized (this.connectionPool) {
            if (e instanceof StreamResetException) {
                StreamResetException streamResetException = (StreamResetException) e;
                if (streamResetException.errorCode == ErrorCode.REFUSED_STREAM) {
                    this.refusedStreamCount++;
                }
                if (streamResetException.errorCode != ErrorCode.REFUSED_STREAM || this.refusedStreamCount > 1) {
                    noNewStreams = true;
                    this.route = null;
                }
            } else if ((this.connection != null && !this.connection.isMultiplexed()) || (e instanceof ConnectionShutdownException)) {
                noNewStreams = true;
                if (this.connection.successCount == 0) {
                    if (this.route != null && e != null) {
                        this.routeSelector.connectFailed(this.route, e);
                    }
                    this.route = null;
                }
            }
        }
        deallocate(noNewStreams, false, true);
    }

    public void acquire(RealConnection connection) {
        if ($assertionsDisabled || Thread.holdsLock(this.connectionPool)) {
            connection.allocations.add(new StreamAllocationReference(this, this.callStackTrace));
            return;
        }
        throw new AssertionError();
    }

    private void release(RealConnection connection) {
        int size = connection.allocations.size();
        for (int i = 0; i < size; i++) {
            Reference<StreamAllocation> reference = connection.allocations.get(i);
            if (reference.get() == this) {
                connection.allocations.remove(i);
                return;
            }
        }
        throw new IllegalStateException();
    }

    public boolean hasMoreRoutes() {
        return this.route != null || this.routeSelector.hasNext();
    }

    public String toString() {
        return this.address.toString();
    }

    /* loaded from: classes3.dex */
    public static final class StreamAllocationReference extends WeakReference<StreamAllocation> {
        public final Object callStackTrace;

        StreamAllocationReference(StreamAllocation referent, Object callStackTrace) {
            super(referent);
            this.callStackTrace = callStackTrace;
        }
    }
}
