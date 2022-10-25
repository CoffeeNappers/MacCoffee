package io.sentry.context;

import io.sentry.event.Breadcrumb;
import io.sentry.event.User;
import io.sentry.util.CircularFifoQueue;
import java.io.Serializable;
import java.util.Iterator;
import java.util.UUID;
/* loaded from: classes3.dex */
public class Context implements Serializable {
    private static final int DEFAULT_BREADCRUMB_LIMIT = 100;
    private CircularFifoQueue<Breadcrumb> breadcrumbs;
    private UUID lastEventId;
    private User user;

    public Context() {
        this(100);
    }

    public Context(int breadcrumbLimit) {
        this.breadcrumbs = new CircularFifoQueue<>(breadcrumbLimit);
    }

    public void clear() {
        this.breadcrumbs.clear();
        this.lastEventId = null;
        this.user = null;
    }

    public Iterator<Breadcrumb> getBreadcrumbs() {
        return this.breadcrumbs.iterator();
    }

    public void recordBreadcrumb(Breadcrumb breadcrumb) {
        this.breadcrumbs.add(breadcrumb);
    }

    public void setLastEventId(UUID id) {
        this.lastEventId = id;
    }

    public UUID getLastEventId() {
        return this.lastEventId;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void clearUser() {
        setUser(null);
    }

    public User getUser() {
        return this.user;
    }
}
