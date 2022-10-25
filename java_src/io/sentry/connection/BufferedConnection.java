package io.sentry.connection;

import io.sentry.buffer.Buffer;
import io.sentry.environment.SentryEnvironment;
import io.sentry.event.Event;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes3.dex */
public class BufferedConnection implements Connection {
    private static final Logger logger = LoggerFactory.getLogger(BufferedConnection.class);
    private Connection actualConnection;
    private Buffer buffer;
    private boolean gracefulShutdown;
    private long shutdownTimeout;
    private final ShutDownHook shutDownHook = new ShutDownHook();
    private final ScheduledExecutorService executorService = Executors.newSingleThreadScheduledExecutor(new ThreadFactory() { // from class: io.sentry.connection.BufferedConnection.1
        @Override // java.util.concurrent.ThreadFactory
        public Thread newThread(Runnable r) {
            Thread thread = new Thread(r);
            thread.setDaemon(true);
            return thread;
        }
    });
    private volatile boolean closed = false;

    public BufferedConnection(Connection actualConnection, Buffer buffer, long flushtime, boolean gracefulShutdown, long shutdownTimeout) {
        this.actualConnection = actualConnection;
        this.buffer = buffer;
        this.gracefulShutdown = gracefulShutdown;
        this.shutdownTimeout = shutdownTimeout;
        if (gracefulShutdown) {
            Runtime.getRuntime().addShutdownHook(this.shutDownHook);
        }
        Flusher flusher = new Flusher(flushtime);
        this.executorService.scheduleWithFixedDelay(flusher, flushtime, flushtime, TimeUnit.MILLISECONDS);
    }

    @Override // io.sentry.connection.Connection
    public void send(Event event) {
        this.actualConnection.send(event);
        this.buffer.discard(event);
    }

    @Override // io.sentry.connection.Connection
    public void addEventSendCallback(EventSendCallback eventSendCallback) {
        this.actualConnection.addEventSendCallback(eventSendCallback);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.gracefulShutdown) {
            this.shutDownHook.enabled = false;
        }
        this.closed = true;
        this.executorService.shutdown();
        try {
            if (this.shutdownTimeout == -1) {
                while (!this.executorService.awaitTermination(5000L, TimeUnit.MILLISECONDS)) {
                    logger.info("Still waiting on buffer flusher executor to terminate.");
                }
            } else if (!this.executorService.awaitTermination(this.shutdownTimeout, TimeUnit.MILLISECONDS)) {
                logger.warn("Graceful shutdown took too much time, forcing the shutdown.");
                List<Runnable> tasks = this.executorService.shutdownNow();
                logger.info("{} tasks failed to execute before the shutdown.", Integer.valueOf(tasks.size()));
            }
            logger.info("Shutdown finished.");
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            logger.error("Graceful shutdown interrupted, forcing the shutdown.");
            List<Runnable> tasks2 = this.executorService.shutdownNow();
            logger.info("{} tasks failed to execute before the shutdown.", Integer.valueOf(tasks2.size()));
        } finally {
            this.actualConnection.close();
        }
    }

    public Connection wrapConnectionWithBufferWriter(final Connection connectionToWrap) {
        return new Connection() { // from class: io.sentry.connection.BufferedConnection.2
            final Connection wrappedConnection;

            {
                this.wrappedConnection = connectionToWrap;
            }

            @Override // io.sentry.connection.Connection
            public void send(Event event) throws ConnectionException {
                try {
                    BufferedConnection.this.buffer.add(event);
                } catch (Exception e) {
                    BufferedConnection.logger.error("Exception occurred while attempting to add Event to buffer: ", (Throwable) e);
                }
                this.wrappedConnection.send(event);
            }

            @Override // io.sentry.connection.Connection
            public void addEventSendCallback(EventSendCallback eventSendCallback) {
                this.wrappedConnection.addEventSendCallback(eventSendCallback);
            }

            @Override // java.io.Closeable, java.lang.AutoCloseable
            public void close() throws IOException {
                this.wrappedConnection.close();
            }
        };
    }

    /* loaded from: classes3.dex */
    private class Flusher implements Runnable {
        private long minAgeMillis;

        Flusher(long minAgeMillis) {
            this.minAgeMillis = minAgeMillis;
        }

        @Override // java.lang.Runnable
        public void run() {
            Event event;
            BufferedConnection.logger.trace("Running Flusher");
            SentryEnvironment.startManagingThread();
            try {
                Iterator<Event> events = BufferedConnection.this.buffer.getEvents();
                while (events.hasNext() && !BufferedConnection.this.closed) {
                    event = events.next();
                    long now = System.currentTimeMillis();
                    long eventTime = event.getTimestamp().getTime();
                    long age = now - eventTime;
                    if (age < this.minAgeMillis) {
                        BufferedConnection.logger.trace("Ignoring buffered event because it only " + age + "ms old.");
                        return;
                    }
                    BufferedConnection.logger.trace("Flusher attempting to send Event: " + event.getId());
                    BufferedConnection.this.send(event);
                    BufferedConnection.logger.trace("Flusher successfully sent Event: " + event.getId());
                }
                BufferedConnection.logger.trace("Flusher run exiting, no more events to send.");
            } catch (Exception e) {
                BufferedConnection.logger.debug("Flusher failed to send Event: " + event.getId(), (Throwable) e);
                BufferedConnection.logger.trace("Flusher run exiting early.");
            } finally {
                SentryEnvironment.stopManagingThread();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public final class ShutDownHook extends Thread {
        private volatile boolean enabled;

        private ShutDownHook() {
            this.enabled = true;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            if (this.enabled) {
                SentryEnvironment.startManagingThread();
                try {
                    BufferedConnection.logger.info("Automatic shutdown of the buffered connection");
                    BufferedConnection.this.close();
                } catch (Exception e) {
                    BufferedConnection.logger.error("An exception occurred while closing the connection.", (Throwable) e);
                } finally {
                    SentryEnvironment.stopManagingThread();
                }
            }
        }
    }
}
