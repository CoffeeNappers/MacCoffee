package io.sentry.connection;

import io.sentry.SentryClient;
import io.sentry.environment.SentryEnvironment;
import io.sentry.event.Event;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes3.dex */
public class AsyncConnection implements Connection {
    private final Connection actualConnection;
    private volatile boolean closed;
    private final ExecutorService executorService;
    private boolean gracefulShutdown;
    private final ShutDownHook shutDownHook = new ShutDownHook();
    private final long shutdownTimeout;
    private static final Logger logger = LoggerFactory.getLogger(AsyncConnection.class);
    private static final Logger lockdownLogger = LoggerFactory.getLogger(SentryClient.class.getName() + ".lockdown");

    public AsyncConnection(Connection actualConnection, ExecutorService executorService, boolean gracefulShutdown, long shutdownTimeout) {
        this.actualConnection = actualConnection;
        if (executorService == null) {
            this.executorService = Executors.newSingleThreadExecutor();
        } else {
            this.executorService = executorService;
        }
        if (gracefulShutdown) {
            this.gracefulShutdown = gracefulShutdown;
            addShutdownHook();
        }
        this.shutdownTimeout = shutdownTimeout;
    }

    private void addShutdownHook() {
        Runtime.getRuntime().addShutdownHook(this.shutDownHook);
    }

    @Override // io.sentry.connection.Connection
    public void send(Event event) {
        if (!this.closed) {
            this.executorService.execute(new EventSubmitter(event));
        }
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
        doClose();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doClose() throws IOException {
        logger.info("Gracefully shutdown sentry threads.");
        this.closed = true;
        this.executorService.shutdown();
        try {
            if (this.shutdownTimeout == -1) {
                while (!this.executorService.awaitTermination(5000L, TimeUnit.MILLISECONDS)) {
                    logger.info("Still waiting on async executor to terminate.");
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

    /* loaded from: classes3.dex */
    private final class EventSubmitter implements Runnable {
        private final Event event;

        private EventSubmitter(Event event) {
            this.event = event;
        }

        @Override // java.lang.Runnable
        public void run() {
            SentryEnvironment.startManagingThread();
            try {
                try {
                    try {
                        AsyncConnection.this.actualConnection.send(this.event);
                        SentryEnvironment.stopManagingThread();
                    } catch (LockedDownException e) {
                        AsyncConnection.lockdownLogger.warn("The connection to Sentry is currently locked down.", (Throwable) e);
                        SentryEnvironment.stopManagingThread();
                    }
                } catch (Exception e2) {
                    AsyncConnection.logger.error("An exception occurred while sending the event to Sentry.", (Throwable) e2);
                    SentryEnvironment.stopManagingThread();
                }
            } catch (Throwable th) {
                SentryEnvironment.stopManagingThread();
                throw th;
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
                    AsyncConnection.logger.info("Automatic shutdown of the async connection");
                    AsyncConnection.this.doClose();
                } catch (Exception e) {
                    AsyncConnection.logger.error("An exception occurred while closing the connection.", (Throwable) e);
                } finally {
                    SentryEnvironment.stopManagingThread();
                }
            }
        }
    }
}
