package io.sentry.connection;

import io.sentry.event.Event;
/* loaded from: classes3.dex */
public interface EventSendCallback {
    void onFailure(Event event, Exception exc);

    void onSuccess(Event event);
}
