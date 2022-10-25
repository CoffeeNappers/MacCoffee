package io.sentry.event;

import io.sentry.environment.SentryEnvironment;
import io.sentry.event.Event;
import io.sentry.event.interfaces.SentryInterface;
import io.sentry.event.interfaces.SentryStackTraceElement;
import java.net.InetAddress;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.Callable;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.zip.CRC32;
import java.util.zip.Checksum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes3.dex */
public class EventBuilder {
    public static final String DEFAULT_HOSTNAME = "unavailable";
    public static final String DEFAULT_PLATFORM = "java";
    private boolean alreadyBuilt;
    private final Event event;
    private Set<String> sdkIntegrations;
    public static final long HOSTNAME_CACHE_DURATION = TimeUnit.HOURS.toMillis(5);
    private static final Charset UTF_8 = Charset.forName("UTF-8");
    private static final HostnameCache HOSTNAME_CACHE = new HostnameCache(HOSTNAME_CACHE_DURATION);

    public EventBuilder() {
        this(UUID.randomUUID());
    }

    public EventBuilder(UUID eventId) {
        this.alreadyBuilt = false;
        this.sdkIntegrations = new HashSet();
        this.event = new Event(eventId);
    }

    private static String calculateChecksum(String string) {
        byte[] bytes = string.getBytes(UTF_8);
        Checksum checksum = new CRC32();
        checksum.update(bytes, 0, bytes.length);
        return Long.toHexString(checksum.getValue()).toUpperCase();
    }

    private void autoSetMissingValues() {
        if (this.event.getTimestamp() == null) {
            this.event.setTimestamp(new Date());
        }
        if (this.event.getPlatform() == null) {
            this.event.setPlatform(DEFAULT_PLATFORM);
        }
        if (this.event.getSdk() == null) {
            this.event.setSdk(new Sdk(SentryEnvironment.SDK_NAME, SentryEnvironment.SDK_VERSION, this.sdkIntegrations));
        }
        if (this.event.getServerName() == null) {
            this.event.setServerName(HOSTNAME_CACHE.getHostname());
        }
    }

    private void makeImmutable() {
        this.event.setTags(Collections.unmodifiableMap(this.event.getTags()));
        this.event.setBreadcrumbs(Collections.unmodifiableList(this.event.getBreadcrumbs()));
        Map<String, Map<String, Object>> tempContexts = new HashMap<>();
        for (Map.Entry<String, Map<String, Object>> contextEntry : this.event.getContexts().entrySet()) {
            tempContexts.put(contextEntry.getKey(), Collections.unmodifiableMap(contextEntry.getValue()));
        }
        this.event.setContexts(Collections.unmodifiableMap(tempContexts));
        this.event.setExtra(Collections.unmodifiableMap(this.event.getExtra()));
        this.event.setSentryInterfaces(Collections.unmodifiableMap(this.event.getSentryInterfaces()));
    }

    public EventBuilder withMessage(String message) {
        this.event.setMessage(message);
        return this;
    }

    public EventBuilder withTimestamp(Date timestamp) {
        this.event.setTimestamp(timestamp);
        return this;
    }

    public EventBuilder withLevel(Event.Level level) {
        this.event.setLevel(level);
        return this;
    }

    public EventBuilder withRelease(String release) {
        this.event.setRelease(release);
        return this;
    }

    public EventBuilder withDist(String dist) {
        this.event.setDist(dist);
        return this;
    }

    public EventBuilder withEnvironment(String environment) {
        this.event.setEnvironment(environment);
        return this;
    }

    public EventBuilder withLogger(String logger) {
        this.event.setLogger(logger);
        return this;
    }

    public EventBuilder withPlatform(String platform) {
        this.event.setPlatform(platform);
        return this;
    }

    public EventBuilder withSdkIntegration(String integration) {
        this.sdkIntegrations.add(integration);
        return this;
    }

    public EventBuilder withCulprit(SentryStackTraceElement frame) {
        return withCulprit(buildCulpritString(frame.getModule(), frame.getFunction(), frame.getFileName(), frame.getLineno()));
    }

    public EventBuilder withCulprit(StackTraceElement frame) {
        return withCulprit(buildCulpritString(frame.getClassName(), frame.getMethodName(), frame.getFileName(), frame.getLineNumber()));
    }

    private String buildCulpritString(String className, String methodName, String fileName, int lineNumber) {
        StringBuilder sb = new StringBuilder();
        sb.append(className).append(".").append(methodName);
        if (fileName != null && !fileName.isEmpty()) {
            sb.append("(").append(fileName);
            if (lineNumber >= 0) {
                sb.append(":").append(lineNumber);
            }
            sb.append(")");
        }
        return sb.toString();
    }

    public EventBuilder withCulprit(String culprit) {
        this.event.setCulprit(culprit);
        return this;
    }

    public EventBuilder withTag(String tagKey, String tagValue) {
        this.event.getTags().put(tagKey, tagValue);
        return this;
    }

    public EventBuilder withBreadcrumbs(List<Breadcrumb> breadcrumbs) {
        this.event.setBreadcrumbs(breadcrumbs);
        return this;
    }

    public EventBuilder withContexts(Map<String, Map<String, Object>> contexts) {
        this.event.setContexts(contexts);
        return this;
    }

    public EventBuilder withServerName(String serverName) {
        this.event.setServerName(serverName);
        return this;
    }

    public EventBuilder withExtra(String extraName, Object extraValue) {
        this.event.getExtra().put(extraName, extraValue);
        return this;
    }

    public EventBuilder withFingerprint(String... fingerprint) {
        List<String> list = new ArrayList<>(fingerprint.length);
        Collections.addAll(list, fingerprint);
        this.event.setFingerprint(list);
        return this;
    }

    public EventBuilder withFingerprint(List<String> fingerprint) {
        this.event.setFingerprint(fingerprint);
        return this;
    }

    public EventBuilder withChecksumFor(String contentToChecksum) {
        return withChecksum(calculateChecksum(contentToChecksum));
    }

    public EventBuilder withChecksum(String checksum) {
        this.event.setChecksum(checksum);
        return this;
    }

    public EventBuilder withSentryInterface(SentryInterface sentryInterface) {
        return withSentryInterface(sentryInterface, true);
    }

    public EventBuilder withSentryInterface(SentryInterface sentryInterface, boolean replace) {
        if (replace || !this.event.getSentryInterfaces().containsKey(sentryInterface.getInterfaceName())) {
            this.event.getSentryInterfaces().put(sentryInterface.getInterfaceName(), sentryInterface);
        }
        return this;
    }

    public synchronized Event build() {
        if (this.alreadyBuilt) {
            throw new IllegalStateException("A message can't be built twice");
        }
        autoSetMissingValues();
        makeImmutable();
        this.alreadyBuilt = true;
        return this.event;
    }

    public Event getEvent() {
        return this.event;
    }

    public String toString() {
        return "EventBuilder{event=" + this.event + ", alreadyBuilt=" + this.alreadyBuilt + '}';
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static final class HostnameCache {
        public static final long GET_HOSTNAME_TIMEOUT = TimeUnit.SECONDS.toMillis(1);
        private static final Logger logger = LoggerFactory.getLogger(HostnameCache.class);
        private final long cacheDuration;
        private long expirationTimestamp;
        private String hostname;

        private HostnameCache(long cacheDuration) {
            this.hostname = EventBuilder.DEFAULT_HOSTNAME;
            this.cacheDuration = cacheDuration;
        }

        public String getHostname() {
            if (this.expirationTimestamp < System.currentTimeMillis()) {
                updateCache();
            }
            return this.hostname;
        }

        public void updateCache() {
            FutureTask<String> futureTask = new FutureTask<>(new HostRetriever());
            try {
                new Thread(futureTask).start();
                logger.debug("Updating the hostname cache");
                this.hostname = futureTask.get(GET_HOSTNAME_TIMEOUT, TimeUnit.MILLISECONDS);
                this.expirationTimestamp = System.currentTimeMillis() + this.cacheDuration;
            } catch (Exception e) {
                futureTask.cancel(true);
                this.expirationTimestamp = System.currentTimeMillis() + TimeUnit.SECONDS.toMillis(1L);
                logger.warn("Localhost hostname lookup failed, keeping the value '{}'", this.hostname, e);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* loaded from: classes3.dex */
        public static final class HostRetriever implements Callable<String> {
            private HostRetriever() {
            }

            @Override // java.util.concurrent.Callable
            public String call() throws Exception {
                return InetAddress.getLocalHost().getCanonicalHostName();
            }
        }
    }
}
