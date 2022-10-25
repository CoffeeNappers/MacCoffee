package io.sentry;

import io.sentry.connection.Connection;
import io.sentry.connection.EventSendCallback;
import io.sentry.connection.LockedDownException;
import io.sentry.context.Context;
import io.sentry.context.ContextManager;
import io.sentry.event.Event;
import io.sentry.event.EventBuilder;
import io.sentry.event.helper.EventBuilderHelper;
import io.sentry.event.interfaces.ExceptionInterface;
import io.sentry.util.Util;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes3.dex */
public class SentryClient {
    private final Connection connection;
    private final ContextManager contextManager;
    protected String dist;
    protected String environment;
    protected String release;
    protected String serverName;
    private static final Logger logger = LoggerFactory.getLogger(SentryClient.class);
    private static final Logger lockdownLogger = LoggerFactory.getLogger(SentryClient.class.getName() + ".lockdown");
    protected Map<String, String> tags = new HashMap();
    protected Set<String> extraTags = new HashSet();
    private final List<EventBuilderHelper> builderHelpers = new CopyOnWriteArrayList();

    public SentryClient(Connection connection, ContextManager contextManager) {
        this.connection = connection;
        this.contextManager = contextManager;
    }

    public void runBuilderHelpers(EventBuilder eventBuilder) {
        for (EventBuilderHelper builderHelper : this.builderHelpers) {
            builderHelper.helpBuildingEvent(eventBuilder);
        }
    }

    public void sendEvent(Event event) {
        try {
            try {
                this.connection.send(event);
                getContext().setLastEventId(event.getId());
            } catch (LockedDownException e) {
                lockdownLogger.warn("The connection to Sentry is currently locked down.", (Throwable) e);
                getContext().setLastEventId(event.getId());
            } catch (Exception e2) {
                logger.error("An exception occurred while sending the event to Sentry.", (Throwable) e2);
                getContext().setLastEventId(event.getId());
            }
        } catch (Throwable th) {
            getContext().setLastEventId(event.getId());
            throw th;
        }
    }

    public void sendEvent(EventBuilder eventBuilder) {
        if (!Util.isNullOrEmpty(this.release)) {
            eventBuilder.withRelease(this.release.trim());
            if (!Util.isNullOrEmpty(this.dist)) {
                eventBuilder.withDist(this.dist.trim());
            }
        }
        if (!Util.isNullOrEmpty(this.environment)) {
            eventBuilder.withEnvironment(this.environment.trim());
        }
        if (!Util.isNullOrEmpty(this.serverName)) {
            eventBuilder.withServerName(this.serverName.trim());
        }
        for (Map.Entry<String, String> tagEntry : this.tags.entrySet()) {
            eventBuilder.withTag(tagEntry.getKey(), tagEntry.getValue());
        }
        runBuilderHelpers(eventBuilder);
        Event event = eventBuilder.build();
        sendEvent(event);
    }

    public void sendMessage(String message) {
        EventBuilder eventBuilder = new EventBuilder().withMessage(message).withLevel(Event.Level.INFO);
        sendEvent(eventBuilder);
    }

    public void sendException(Throwable throwable) {
        EventBuilder eventBuilder = new EventBuilder().withMessage(throwable.getMessage()).withLevel(Event.Level.ERROR).withSentryInterface(new ExceptionInterface(throwable));
        sendEvent(eventBuilder);
    }

    public void removeBuilderHelper(EventBuilderHelper builderHelper) {
        logger.debug("Removing '{}' from the list of builder helpers.", builderHelper);
        this.builderHelpers.remove(builderHelper);
    }

    public void addBuilderHelper(EventBuilderHelper builderHelper) {
        logger.debug("Adding '{}' to the list of builder helpers.", builderHelper);
        this.builderHelpers.add(builderHelper);
    }

    public List<EventBuilderHelper> getBuilderHelpers() {
        return Collections.unmodifiableList(this.builderHelpers);
    }

    public void closeConnection() {
        try {
            this.connection.close();
        } catch (IOException e) {
            throw new RuntimeException("Couldn't close the Sentry connection", e);
        }
    }

    public Context getContext() {
        return this.contextManager.getContext();
    }

    public String getRelease() {
        return this.release;
    }

    public String getDist() {
        return this.dist;
    }

    public String getEnvironment() {
        return this.environment;
    }

    public String getServerName() {
        return this.serverName;
    }

    public Map<String, String> getTags() {
        return Collections.unmodifiableMap(this.tags);
    }

    public Set<String> getExtraTags() {
        return Collections.unmodifiableSet(this.extraTags);
    }

    public void setRelease(String release) {
        this.release = release;
    }

    public void setDist(String dist) {
        this.dist = dist;
    }

    public void setEnvironment(String environment) {
        this.environment = environment;
    }

    public void setServerName(String serverName) {
        this.serverName = serverName;
    }

    public void addTag(String name, String value) {
        this.tags.put(name, value);
    }

    public void setTags(Map<String, String> tags) {
        if (tags == null) {
            this.tags = new HashMap();
        } else {
            this.tags = tags;
        }
    }

    public void setExtraTags(Set<String> extraTags) {
        if (extraTags == null) {
            this.extraTags = new HashSet();
        } else {
            this.extraTags = extraTags;
        }
    }

    public void addExtraTag(String extraName) {
        this.extraTags.add(extraName);
    }

    void addEventSendCallback(EventSendCallback eventSendCallback) {
        this.connection.addEventSendCallback(eventSendCallback);
    }

    public String toString() {
        return "SentryClient{release='" + this.release + "', dist='" + this.dist + "', environment='" + this.environment + "', serverName='" + this.serverName + "', tags=" + this.tags + ", extraTags=" + this.extraTags + ", connection=" + this.connection + ", builderHelpers=" + this.builderHelpers + ", contextManager=" + this.contextManager + '}';
    }
}
