package io.sentry.event.helper;

import io.sentry.event.EventBuilder;
import io.sentry.event.interfaces.HttpInterface;
import io.sentry.event.interfaces.UserInterface;
import io.sentry.servlet.SentryServletRequestListener;
import javax.servlet.http.HttpServletRequest;
/* loaded from: classes3.dex */
public class HttpEventBuilderHelper implements EventBuilderHelper {
    private final RemoteAddressResolver remoteAddressResolver;

    public HttpEventBuilderHelper() {
        this.remoteAddressResolver = new BasicRemoteAddressResolver();
    }

    public HttpEventBuilderHelper(RemoteAddressResolver remoteAddressResolver) {
        this.remoteAddressResolver = remoteAddressResolver;
    }

    @Override // io.sentry.event.helper.EventBuilderHelper
    public void helpBuildingEvent(EventBuilder eventBuilder) {
        HttpServletRequest servletRequest = SentryServletRequestListener.getServletRequest();
        if (servletRequest != null) {
            addHttpInterface(eventBuilder, servletRequest);
            addUserInterface(eventBuilder, servletRequest);
        }
    }

    private void addHttpInterface(EventBuilder eventBuilder, HttpServletRequest servletRequest) {
        eventBuilder.withSentryInterface(new HttpInterface(servletRequest, this.remoteAddressResolver), false);
    }

    private void addUserInterface(EventBuilder eventBuilder, HttpServletRequest servletRequest) {
        String username = null;
        if (servletRequest.getUserPrincipal() != null) {
            username = servletRequest.getUserPrincipal().getName();
        }
        UserInterface userInterface = new UserInterface(null, username, this.remoteAddressResolver.getRemoteAddress(servletRequest), null);
        eventBuilder.withSentryInterface(userInterface, false);
    }

    public RemoteAddressResolver getRemoteAddressResolver() {
        return this.remoteAddressResolver;
    }
}
