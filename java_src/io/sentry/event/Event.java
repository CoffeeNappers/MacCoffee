package io.sentry.event;

import io.sentry.event.interfaces.SentryInterface;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
/* loaded from: classes3.dex */
public class Event implements Serializable {
    private String checksum;
    private String culprit;
    private String dist;
    private String environment;
    private List<String> fingerprint;
    private final UUID id;
    private Level level;
    private String logger;
    private String message;
    private String platform;
    private String release;
    private Sdk sdk;
    private String serverName;
    private Date timestamp;
    private Map<String, String> tags = new HashMap();
    private List<Breadcrumb> breadcrumbs = new ArrayList();
    private Map<String, Map<String, Object>> contexts = new HashMap();
    private transient Map<String, Object> extra = new HashMap();
    private Map<String, SentryInterface> sentryInterfaces = new HashMap();

    /* loaded from: classes3.dex */
    public enum Level {
        FATAL,
        ERROR,
        WARNING,
        INFO,
        DEBUG
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Event(UUID id) {
        if (id == null) {
            throw new IllegalArgumentException("The id can't be null");
        }
        this.id = id;
    }

    public UUID getId() {
        return this.id;
    }

    public String getMessage() {
        return this.message;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setMessage(String message) {
        this.message = message;
    }

    public Date getTimestamp() {
        if (this.timestamp != null) {
            return (Date) this.timestamp.clone();
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    public Level getLevel() {
        return this.level;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setLevel(Level level) {
        this.level = level;
    }

    public String getLogger() {
        return this.logger;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setLogger(String logger) {
        this.logger = logger;
    }

    public String getPlatform() {
        return this.platform;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setPlatform(String platform) {
        this.platform = platform;
    }

    public Sdk getSdk() {
        return this.sdk;
    }

    public void setSdk(Sdk sdk) {
        this.sdk = sdk;
    }

    public String getCulprit() {
        return this.culprit;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setCulprit(String culprit) {
        this.culprit = culprit;
    }

    public List<Breadcrumb> getBreadcrumbs() {
        return this.breadcrumbs;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setBreadcrumbs(List<Breadcrumb> breadcrumbs) {
        this.breadcrumbs = breadcrumbs;
    }

    public Map<String, Map<String, Object>> getContexts() {
        return this.contexts;
    }

    public void setContexts(Map<String, Map<String, Object>> contexts) {
        this.contexts = contexts;
    }

    public Map<String, String> getTags() {
        return this.tags;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setTags(Map<String, String> tags) {
        this.tags = tags;
    }

    public String getServerName() {
        return this.serverName;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setServerName(String serverName) {
        this.serverName = serverName;
    }

    public String getRelease() {
        return this.release;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setRelease(String release) {
        this.release = release;
    }

    public String getDist() {
        return this.dist;
    }

    public void setDist(String dist) {
        this.dist = dist;
    }

    public String getEnvironment() {
        return this.environment;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setEnvironment(String environment) {
        this.environment = environment;
    }

    public Map<String, Object> getExtra() {
        return this.extra;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setExtra(Map<String, Object> extra) {
        this.extra = extra;
    }

    public List<String> getFingerprint() {
        return this.fingerprint;
    }

    public void setFingerprint(List<String> fingerprint) {
        this.fingerprint = fingerprint;
    }

    public String getChecksum() {
        return this.checksum;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setChecksum(String checksum) {
        this.checksum = checksum;
    }

    public Map<String, SentryInterface> getSentryInterfaces() {
        return this.sentryInterfaces;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setSentryInterfaces(Map<String, SentryInterface> sentryInterfaces) {
        this.sentryInterfaces = sentryInterfaces;
    }

    private void readObject(ObjectInputStream stream) throws IOException, ClassNotFoundException {
        stream.defaultReadObject();
        this.extra = (Map) stream.readObject();
    }

    private void writeObject(ObjectOutputStream stream) throws IOException {
        stream.defaultWriteObject();
        stream.writeObject(convertToSerializable(this.extra));
    }

    private static HashMap<String, ? super Serializable> convertToSerializable(Map<String, Object> objectMap) {
        HashMap<String, ? super Serializable> serializableMap = new HashMap<>(objectMap.size());
        for (Map.Entry<String, Object> objectEntry : objectMap.entrySet()) {
            if (objectEntry.getValue() instanceof Serializable) {
                serializableMap.put(objectEntry.getKey(), (Serializable) objectEntry.getValue());
            } else {
                serializableMap.put(objectEntry.getKey(), objectEntry.getValue().toString());
            }
        }
        return serializableMap;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        return this.id.equals(((Event) o).id);
    }

    public int hashCode() {
        return this.id.hashCode();
    }

    public String toString() {
        return "Event{level=" + this.level + ", message='" + this.message + "', logger='" + this.logger + "'}";
    }
}
