package com.danikula.videocache;

import java.lang.Thread;
import java.util.concurrent.atomic.AtomicInteger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class ProxyCache {
    private static final Logger LOG = LoggerFactory.getLogger("ProxyCache");
    private static final int MAX_READ_SOURCE_ATTEMPTS = 1;
    private final Cache cache;
    private final Source source;
    private volatile Thread sourceReaderThread;
    private volatile boolean stopped;
    private final Object wc = new Object();
    private final Object stopLock = new Object();
    private volatile int percentsAvailable = -1;
    private final AtomicInteger readSourceErrorsCount = new AtomicInteger();

    public ProxyCache(Source source, Cache cache) {
        this.source = (Source) Preconditions.checkNotNull(source);
        this.cache = (Cache) Preconditions.checkNotNull(cache);
    }

    public int read(byte[] buffer, long offset, int length) throws ProxyCacheException {
        ProxyCacheUtils.assertBuffer(buffer, offset, length);
        while (!this.cache.isCompleted() && this.cache.available() < length + offset && !this.stopped) {
            readSourceAsync();
            waitForSourceData();
            checkReadSourceErrorsCount();
        }
        int read = this.cache.read(buffer, offset, length);
        if (this.cache.isCompleted() && this.percentsAvailable != 100) {
            this.percentsAvailable = 100;
            onCachePercentsAvailableChanged(100);
        }
        return read;
    }

    private void checkReadSourceErrorsCount() throws ProxyCacheException {
        int errorsCount = this.readSourceErrorsCount.get();
        if (errorsCount >= 1) {
            this.readSourceErrorsCount.set(0);
            throw new ProxyCacheException("Error reading source " + errorsCount + " times");
        }
    }

    public void shutdown() {
        synchronized (this.stopLock) {
            LOG.debug("Shutdown proxy for " + this.source);
            try {
                this.stopped = true;
                if (this.sourceReaderThread != null) {
                    this.sourceReaderThread.interrupt();
                }
                this.cache.close();
            } catch (ProxyCacheException e) {
                onError(e);
            }
        }
    }

    private synchronized void readSourceAsync() throws ProxyCacheException {
        boolean readingInProgress = (this.sourceReaderThread == null || this.sourceReaderThread.getState() == Thread.State.TERMINATED) ? false : true;
        if (!this.stopped && !this.cache.isCompleted() && !readingInProgress) {
            this.sourceReaderThread = new Thread(new SourceReaderRunnable(), "Source reader for " + this.source);
            this.sourceReaderThread.start();
        }
    }

    private void waitForSourceData() throws ProxyCacheException {
        synchronized (this.wc) {
            try {
                this.wc.wait(1000L);
            } catch (InterruptedException e) {
                throw new ProxyCacheException("Waiting source data is interrupted!", e);
            }
        }
    }

    private void notifyNewCacheDataAvailable(long cacheAvailable, long sourceAvailable) {
        onCacheAvailable(cacheAvailable, sourceAvailable);
        synchronized (this.wc) {
            this.wc.notifyAll();
        }
    }

    protected void onCacheAvailable(long cacheAvailable, long sourceLength) {
        boolean sourceLengthKnown = true;
        boolean zeroLengthSource = sourceLength == 0;
        int percents = zeroLengthSource ? 100 : (int) ((100 * cacheAvailable) / sourceLength);
        boolean percentsChanged = percents != this.percentsAvailable;
        if (sourceLength < 0) {
            sourceLengthKnown = false;
        }
        if (sourceLengthKnown && percentsChanged) {
            onCachePercentsAvailableChanged(percents);
        }
        this.percentsAvailable = percents;
    }

    protected void onCachePercentsAvailableChanged(int percentsAvailable) {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void readSource() {
        int sourceAvailable = -1;
        int offset = 0;
        try {
            int offset2 = this.cache.available();
            this.source.open(offset2);
            sourceAvailable = this.source.length();
            byte[] buffer = new byte[8192];
            while (true) {
                int readBytes = this.source.read(buffer);
                if (readBytes == -1) {
                    tryComplete();
                    onSourceRead();
                    return;
                }
                synchronized (this.stopLock) {
                    if (isStopped()) {
                        return;
                    }
                    this.cache.append(buffer, readBytes);
                }
                offset2 = offset + readBytes;
                notifyNewCacheDataAvailable(offset2, sourceAvailable);
            }
        } catch (Throwable e) {
            try {
                this.readSourceErrorsCount.incrementAndGet();
                onError(e);
            } finally {
                closeSource();
                notifyNewCacheDataAvailable(offset, sourceAvailable);
            }
        }
    }

    private void onSourceRead() {
        this.percentsAvailable = 100;
        onCachePercentsAvailableChanged(this.percentsAvailable);
    }

    private void tryComplete() throws ProxyCacheException {
        synchronized (this.stopLock) {
            if (!isStopped() && this.cache.available() == this.source.length()) {
                this.cache.complete();
            }
        }
    }

    private boolean isStopped() {
        return Thread.currentThread().isInterrupted() || this.stopped;
    }

    private void closeSource() {
        try {
            this.source.close();
        } catch (ProxyCacheException e) {
            onError(new ProxyCacheException("Error closing source " + this.source, e));
        }
    }

    protected final void onError(Throwable e) {
        boolean interruption = e instanceof InterruptedProxyCacheException;
        if (interruption) {
            LOG.debug("ProxyCache is interrupted");
        } else {
            LOG.error("ProxyCache error", e);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class SourceReaderRunnable implements Runnable {
        private SourceReaderRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            ProxyCache.this.readSource();
        }
    }
}
