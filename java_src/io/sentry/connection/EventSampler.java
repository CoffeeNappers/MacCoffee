package io.sentry.connection;

import io.sentry.event.Event;
/* loaded from: classes3.dex */
public interface EventSampler {
    boolean shouldSendEvent(Event event);
}
