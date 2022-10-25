package io.sentry.event.helper;

import io.sentry.SentryClient;
import io.sentry.context.Context;
import io.sentry.event.Breadcrumb;
import io.sentry.event.EventBuilder;
import io.sentry.event.User;
import io.sentry.event.interfaces.UserInterface;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes3.dex */
public class ContextBuilderHelper implements EventBuilderHelper {
    private SentryClient sentryClient;

    public ContextBuilderHelper(SentryClient sentryClient) {
        this.sentryClient = sentryClient;
    }

    @Override // io.sentry.event.helper.EventBuilderHelper
    public void helpBuildingEvent(EventBuilder eventBuilder) {
        List<Breadcrumb> breadcrumbs = new ArrayList<>();
        Context context = this.sentryClient.getContext();
        Iterator<Breadcrumb> breadcrumbIterator = context.getBreadcrumbs();
        while (breadcrumbIterator.hasNext()) {
            breadcrumbs.add(breadcrumbIterator.next());
        }
        if (!breadcrumbs.isEmpty()) {
            eventBuilder.withBreadcrumbs(breadcrumbs);
        }
        if (context.getUser() != null) {
            eventBuilder.withSentryInterface(fromUser(context.getUser()));
        }
    }

    private UserInterface fromUser(User user) {
        return new UserInterface(user.getId(), user.getUsername(), user.getIpAddress(), user.getEmail());
    }
}
