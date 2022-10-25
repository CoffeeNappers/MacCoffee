package io.sentry.buffer;

import io.sentry.event.Event;
import java.util.Iterator;
/* loaded from: classes3.dex */
public interface Buffer {
    void add(Event event);

    void discard(Event event);

    Iterator<Event> getEvents();
}
