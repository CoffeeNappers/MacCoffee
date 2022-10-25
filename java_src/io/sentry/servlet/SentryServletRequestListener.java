package io.sentry.servlet;

import io.sentry.Sentry;
import io.sentry.SentryClient;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes3.dex */
public class SentryServletRequestListener implements ServletRequestListener {
    private static final Logger logger = LoggerFactory.getLogger(SentryServletRequestListener.class);
    private static final ThreadLocal<HttpServletRequest> THREAD_REQUEST = new ThreadLocal<>();

    public static HttpServletRequest getServletRequest() {
        return THREAD_REQUEST.get();
    }

    public void requestDestroyed(ServletRequestEvent servletRequestEvent) {
        THREAD_REQUEST.remove();
        try {
            SentryClient sentryClient = Sentry.getStoredClient();
            if (sentryClient != null) {
                sentryClient.getContext().clear();
            }
        } catch (Exception e) {
            logger.error("Error clearing Context state.", (Throwable) e);
        }
    }

    public void requestInitialized(ServletRequestEvent servletRequestEvent) {
        HttpServletRequest servletRequest = servletRequestEvent.getServletRequest();
        if (servletRequest instanceof HttpServletRequest) {
            THREAD_REQUEST.set(servletRequest);
        }
    }
}
