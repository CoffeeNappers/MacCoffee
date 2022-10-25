package io.sentry.environment;

import java.util.ResourceBundle;
import java.util.concurrent.atomic.AtomicInteger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes3.dex */
public final class SentryEnvironment {
    public static final String SDK_NAME = "sentry-java";
    public static final String SDK_VERSION = ResourceBundle.getBundle("sentry-build").getString("build.name");
    protected static final ThreadLocal<AtomicInteger> SENTRY_THREAD = new ThreadLocal<AtomicInteger>() { // from class: io.sentry.environment.SentryEnvironment.1
        /* JADX INFO: Access modifiers changed from: protected */
        @Override // java.lang.ThreadLocal
        public AtomicInteger initialValue() {
            return new AtomicInteger();
        }
    };
    private static final Logger logger = LoggerFactory.getLogger(SentryEnvironment.class);

    private SentryEnvironment() {
    }

    public static void startManagingThread() {
        try {
            if (isManagingThread()) {
                logger.warn("Thread already managed by Sentry");
            }
        } finally {
            SENTRY_THREAD.get().incrementAndGet();
        }
    }

    public static void stopManagingThread() {
        try {
            if (!isManagingThread()) {
                startManagingThread();
                logger.warn("Thread not yet managed by Sentry");
            }
        } finally {
            SENTRY_THREAD.get().decrementAndGet();
        }
    }

    public static boolean isManagingThread() {
        return SENTRY_THREAD.get().get() > 0;
    }

    public static String getSentryName() {
        return "sentry-java/" + SDK_VERSION;
    }
}
