package io.sentry.connection;

import io.sentry.event.Event;
import java.io.Closeable;
/* loaded from: classes3.dex */
public interface Connection extends Closeable {
    void addEventSendCallback(EventSendCallback eventSendCallback);

    void send(Event event) throws ConnectionException;
}
