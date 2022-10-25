package io.sentry;

import io.sentry.event.Breadcrumb;
import io.sentry.event.Event;
import io.sentry.event.EventBuilder;
import io.sentry.event.User;
import java.util.concurrent.atomic.AtomicBoolean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes3.dex */
public final class Sentry {
    private static final Logger logger = LoggerFactory.getLogger(Sentry.class);
    private static volatile SentryClient storedClient = null;
    private static AtomicBoolean autoInitAttempted = new AtomicBoolean(false);

    private Sentry() {
    }

    public static SentryClient init() {
        return init(null, null);
    }

    public static SentryClient init(SentryClientFactory sentryClientFactory) {
        return init(null, sentryClientFactory);
    }

    public static SentryClient init(String dsn) {
        return init(dsn, null);
    }

    public static SentryClient init(String dsn, SentryClientFactory sentryClientFactory) {
        SentryClient sentryClient = SentryClientFactory.sentryClient(dsn, sentryClientFactory);
        setStoredClient(sentryClient);
        return sentryClient;
    }

    public static SentryClient getStoredClient() {
        if (storedClient != null) {
            return storedClient;
        }
        synchronized (Sentry.class) {
            if (storedClient == null && !autoInitAttempted.get()) {
                autoInitAttempted.set(true);
                init();
            }
        }
        return storedClient;
    }

    public static void setStoredClient(SentryClient client) {
        if (storedClient != null) {
            logger.warn("Overwriting statically stored SentryClient instance {} with {}.", storedClient, client);
        }
        storedClient = client;
    }

    public static void capture(Event event) {
        getStoredClient().sendEvent(event);
    }

    public static void capture(Throwable throwable) {
        getStoredClient().sendException(throwable);
    }

    public static void capture(String message) {
        getStoredClient().sendMessage(message);
    }

    public static void capture(EventBuilder eventBuilder) {
        getStoredClient().sendEvent(eventBuilder);
    }

    public static void record(Breadcrumb breadcrumb) {
        getStoredClient().getContext().recordBreadcrumb(breadcrumb);
    }

    public static void setUser(User user) {
        getStoredClient().getContext().setUser(user);
    }

    public static void clearContext() {
        getStoredClient().getContext().clear();
    }

    public static void close() {
        if (storedClient != null) {
            storedClient.closeConnection();
            storedClient = null;
            autoInitAttempted.set(false);
        }
    }
}
