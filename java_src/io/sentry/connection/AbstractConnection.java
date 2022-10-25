package io.sentry.connection;

import io.sentry.environment.SentryEnvironment;
import io.sentry.event.Event;
import java.util.HashSet;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes3.dex */
public abstract class AbstractConnection implements Connection {
    public static final String SENTRY_PROTOCOL_VERSION = "6";
    private static final Logger logger = LoggerFactory.getLogger(AbstractConnection.class);
    private final String authHeader;
    private LockdownManager lockdownManager = new LockdownManager();
    private Set<EventSendCallback> eventSendCallbacks = new HashSet();

    protected abstract void doSend(Event event) throws ConnectionException;

    /* JADX INFO: Access modifiers changed from: protected */
    public AbstractConnection(String publicKey, String secretKey) {
        this.authHeader = "Sentry sentry_version=6,sentry_client=" + SentryEnvironment.getSentryName() + ",sentry_key=" + publicKey + ",sentry_secret=" + secretKey;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String getAuthHeader() {
        return this.authHeader;
    }

    @Override // io.sentry.connection.Connection
    public final void send(Event event) throws ConnectionException {
        try {
            if (this.lockdownManager.isLockedDown()) {
                throw new LockedDownException("Dropping an Event due to lockdown: " + event);
            }
            doSend(event);
            for (EventSendCallback eventSendCallback : this.eventSendCallbacks) {
                try {
                    eventSendCallback.onSuccess(event);
                } catch (Exception exc) {
                    logger.warn("An exception occurred while running an EventSendCallback.onSuccess: " + eventSendCallback.getClass().getName(), (Throwable) exc);
                }
            }
            this.lockdownManager.resetState();
        } catch (ConnectionException e) {
            for (EventSendCallback eventSendCallback2 : this.eventSendCallbacks) {
                try {
                    eventSendCallback2.onFailure(event, e);
                } catch (Exception exc2) {
                    logger.warn("An exception occurred while running an EventSendCallback.onFailure: " + eventSendCallback2.getClass().getName(), (Throwable) exc2);
                }
            }
            logger.warn("An exception due to the connection occurred, a lockdown will be initiated.", (Throwable) e);
            this.lockdownManager.setState(e);
            throw e;
        }
    }

    @Override // io.sentry.connection.Connection
    public void addEventSendCallback(EventSendCallback eventSendCallback) {
        this.eventSendCallbacks.add(eventSendCallback);
    }
}
