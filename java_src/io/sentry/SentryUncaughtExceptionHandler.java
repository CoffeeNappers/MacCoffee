package io.sentry;

import io.sentry.event.Event;
import io.sentry.event.EventBuilder;
import io.sentry.event.interfaces.ExceptionInterface;
import java.lang.Thread;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes3.dex */
public class SentryUncaughtExceptionHandler implements Thread.UncaughtExceptionHandler {
    private static final Logger logger = LoggerFactory.getLogger(SentryClientFactory.class);
    private Thread.UncaughtExceptionHandler defaultExceptionHandler;

    public SentryUncaughtExceptionHandler(Thread.UncaughtExceptionHandler defaultExceptionHandler) {
        this.defaultExceptionHandler = defaultExceptionHandler;
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public void uncaughtException(Thread thread, Throwable thrown) {
        logger.trace("Uncaught exception received.");
        EventBuilder eventBuilder = new EventBuilder().withMessage(thrown.getMessage()).withLevel(Event.Level.FATAL).withSentryInterface(new ExceptionInterface(thrown));
        try {
            Sentry.capture(eventBuilder);
        } catch (Exception e) {
            logger.error("Error sending uncaught exception to Sentry.", (Throwable) e);
        }
        if (this.defaultExceptionHandler != null) {
            this.defaultExceptionHandler.uncaughtException(thread, thrown);
        }
    }

    public static void setup() {
        Thread.UncaughtExceptionHandler currentHandler = Thread.getDefaultUncaughtExceptionHandler();
        if (currentHandler != null) {
            logger.debug("default UncaughtExceptionHandler class='" + currentHandler.getClass().getName() + "'");
        }
        if (!(currentHandler instanceof SentryUncaughtExceptionHandler)) {
            Thread.setDefaultUncaughtExceptionHandler(new SentryUncaughtExceptionHandler(currentHandler));
        }
    }
}
