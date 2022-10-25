package io.sentry.marshaller.json;

import com.facebook.internal.ServerProtocol;
import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonGenerator;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.UserNotification;
import io.fabric.sdk.android.services.network.HttpRequest;
import io.sentry.event.Breadcrumb;
import io.sentry.event.Event;
import io.sentry.event.Sdk;
import io.sentry.event.interfaces.SentryInterface;
import io.sentry.marshaller.Marshaller;
import io.sentry.util.Util;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.UUID;
import java.util.zip.GZIPOutputStream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes3.dex */
public class JsonMarshaller implements Marshaller {
    public static final String BREADCRUMBS = "breadcrumbs";
    public static final String CHECKSUM = "checksum";
    public static final String CONTEXTS = "contexts";
    public static final String CULPRIT = "culprit";
    public static final int DEFAULT_MAX_MESSAGE_LENGTH = 1000;
    public static final String DIST = "dist";
    public static final String ENVIRONMENT = "environment";
    public static final String EVENT_ID = "event_id";
    public static final String EXTRA = "extra";
    public static final String FINGERPRINT = "fingerprint";
    public static final String LEVEL = "level";
    public static final String LOGGER = "logger";
    public static final String MESSAGE = "message";
    public static final String MODULES = "modules";
    public static final String PLATFORM = "platform";
    public static final String RELEASE = "release";
    public static final String SDK = "sdk";
    public static final String SERVER_NAME = "server_name";
    public static final String TAGS = "tags";
    public static final String TIMESTAMP = "timestamp";
    private boolean compression;
    private final Map<Class<? extends SentryInterface>, InterfaceBinding<?>> interfaceBindings;
    private final JsonFactory jsonFactory;
    private final int maxMessageLength;
    private static final ThreadLocal<DateFormat> ISO_FORMAT = new ThreadLocal<DateFormat>() { // from class: io.sentry.marshaller.json.JsonMarshaller.1
        /* JADX INFO: Access modifiers changed from: protected */
        @Override // java.lang.ThreadLocal
        public DateFormat initialValue() {
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
            dateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
            return dateFormat;
        }
    };
    private static final Logger logger = LoggerFactory.getLogger(JsonMarshaller.class);

    public JsonMarshaller() {
        this.jsonFactory = new JsonFactory();
        this.interfaceBindings = new HashMap();
        this.compression = true;
        this.maxMessageLength = 1000;
    }

    public JsonMarshaller(int maxMessageLength) {
        this.jsonFactory = new JsonFactory();
        this.interfaceBindings = new HashMap();
        this.compression = true;
        this.maxMessageLength = maxMessageLength;
    }

    @Override // io.sentry.marshaller.Marshaller
    public void marshall(Event event, OutputStream destination) throws IOException {
        OutputStream destination2 = new Marshaller.UncloseableOutputStream(destination);
        OutputStream destination3 = this.compression ? new GZIPOutputStream(destination2) : destination2;
        try {
            try {
                JsonGenerator generator = this.jsonFactory.createGenerator(destination3);
                Throwable th = null;
                try {
                    writeContent(generator, event);
                    if (generator != null) {
                        if (0 != 0) {
                            try {
                                generator.close();
                            } catch (Throwable x2) {
                                th.addSuppressed(x2);
                            }
                        } else {
                            generator.close();
                        }
                    }
                } catch (Throwable th2) {
                    try {
                        throw th2;
                    } catch (Throwable th3) {
                        if (generator != null) {
                            if (th2 != null) {
                                try {
                                    generator.close();
                                } catch (Throwable x22) {
                                    th2.addSuppressed(x22);
                                }
                            } else {
                                generator.close();
                            }
                        }
                        throw th3;
                    }
                }
            } catch (IOException e) {
                logger.error("An exception occurred while serialising the event.", (Throwable) e);
                try {
                    destination3.close();
                } catch (IOException e2) {
                    logger.error("An exception occurred while serialising the event.", (Throwable) e2);
                }
            }
        } finally {
            try {
                destination3.close();
            } catch (IOException e3) {
                logger.error("An exception occurred while serialising the event.", (Throwable) e3);
            }
        }
    }

    @Override // io.sentry.marshaller.Marshaller
    public String getContentType() {
        return "application/json";
    }

    @Override // io.sentry.marshaller.Marshaller
    public String getContentEncoding() {
        if (isCompressed()) {
            return HttpRequest.ENCODING_GZIP;
        }
        return null;
    }

    private void writeContent(JsonGenerator generator, Event event) throws IOException {
        generator.writeStartObject();
        generator.writeStringField(EVENT_ID, formatId(event.getId()));
        generator.writeStringField("message", Util.trimString(event.getMessage(), this.maxMessageLength));
        generator.writeStringField(TIMESTAMP, ISO_FORMAT.get().format(event.getTimestamp()));
        generator.writeStringField("level", formatLevel(event.getLevel()));
        generator.writeStringField(LOGGER, event.getLogger());
        generator.writeStringField(PLATFORM, event.getPlatform());
        generator.writeStringField(CULPRIT, event.getCulprit());
        writeSdk(generator, event.getSdk());
        writeTags(generator, event.getTags());
        writeBreadcumbs(generator, event.getBreadcrumbs());
        writeContexts(generator, event.getContexts());
        generator.writeStringField(SERVER_NAME, event.getServerName());
        generator.writeStringField("release", event.getRelease());
        generator.writeStringField("dist", event.getDist());
        generator.writeStringField("environment", event.getEnvironment());
        writeExtras(generator, event.getExtra());
        writeCollection(generator, FINGERPRINT, event.getFingerprint());
        generator.writeStringField(CHECKSUM, event.getChecksum());
        writeInterfaces(generator, event.getSentryInterfaces());
        generator.writeEndObject();
    }

    private void writeInterfaces(JsonGenerator generator, Map<String, SentryInterface> sentryInterfaces) throws IOException {
        for (Map.Entry<String, SentryInterface> interfaceEntry : sentryInterfaces.entrySet()) {
            SentryInterface sentryInterface = interfaceEntry.getValue();
            if (this.interfaceBindings.containsKey(sentryInterface.getClass())) {
                generator.writeFieldName(interfaceEntry.getKey());
                getInterfaceBinding(sentryInterface).writeInterface(generator, interfaceEntry.getValue());
            } else {
                logger.error("Couldn't parse the content of '{}' provided in {}.", interfaceEntry.getKey(), sentryInterface);
            }
        }
    }

    private <T extends SentryInterface> InterfaceBinding<? super T> getInterfaceBinding(T sentryInterface) {
        return (InterfaceBinding<? super T>) this.interfaceBindings.get(sentryInterface.getClass());
    }

    private void writeExtras(JsonGenerator generator, Map<String, Object> extras) throws IOException {
        generator.writeObjectFieldStart(EXTRA);
        for (Map.Entry<String, Object> extra : extras.entrySet()) {
            generator.writeFieldName(extra.getKey());
            safelyWriteObject(generator, extra.getValue());
        }
        generator.writeEndObject();
    }

    private void writeCollection(JsonGenerator generator, String name, Collection<String> value) throws IOException {
        if (value != null && !value.isEmpty()) {
            generator.writeArrayFieldStart(name);
            for (String element : value) {
                generator.writeString(element);
            }
            generator.writeEndArray();
        }
    }

    private void safelyWriteObject(JsonGenerator generator, Object value) throws IOException {
        if (value != null && value.getClass().isArray()) {
            value = Arrays.asList((Object[]) value);
        }
        if (value instanceof Iterable) {
            generator.writeStartArray();
            for (Object subValue : (Iterable) value) {
                safelyWriteObject(generator, subValue);
            }
            generator.writeEndArray();
        } else if (value instanceof Map) {
            generator.writeStartObject();
            for (Map.Entry<?, ?> entry : ((Map) value).entrySet()) {
                if (entry.getKey() == null) {
                    generator.writeFieldName("null");
                } else {
                    generator.writeFieldName(entry.getKey().toString());
                }
                safelyWriteObject(generator, entry.getValue());
            }
            generator.writeEndObject();
        } else if (value == null) {
            generator.writeNull();
        } else {
            try {
                generator.writeObject(value);
            } catch (IllegalStateException e) {
                logger.debug("Couldn't marshal '{}' of type '{}', had to be converted into a String", value, value.getClass());
                generator.writeString(value.toString());
            }
        }
    }

    private void writeSdk(JsonGenerator generator, Sdk sdk) throws IOException {
        generator.writeObjectFieldStart("sdk");
        generator.writeStringField("name", sdk.getName());
        generator.writeStringField(ServerProtocol.FALLBACK_DIALOG_PARAM_VERSION, sdk.getVersion());
        if (sdk.getIntegrations() != null && !sdk.getIntegrations().isEmpty()) {
            generator.writeArrayFieldStart("integrations");
            for (String integration : sdk.getIntegrations()) {
                generator.writeString(integration);
            }
            generator.writeEndArray();
        }
        generator.writeEndObject();
    }

    private void writeTags(JsonGenerator generator, Map<String, String> tags) throws IOException {
        generator.writeObjectFieldStart("tags");
        for (Map.Entry<String, String> tag : tags.entrySet()) {
            generator.writeStringField(tag.getKey(), tag.getValue());
        }
        generator.writeEndObject();
    }

    private void writeBreadcumbs(JsonGenerator generator, List<Breadcrumb> breadcrumbs) throws IOException {
        if (!breadcrumbs.isEmpty()) {
            generator.writeObjectFieldStart(BREADCRUMBS);
            generator.writeArrayFieldStart("values");
            for (Breadcrumb breadcrumb : breadcrumbs) {
                generator.writeStartObject();
                generator.writeNumberField(TIMESTAMP, breadcrumb.getTimestamp().getTime() / 1000);
                if (breadcrumb.getType() != null) {
                    generator.writeStringField(ServerKeys.TYPE, breadcrumb.getType().getValue());
                }
                if (breadcrumb.getLevel() != null) {
                    generator.writeStringField("level", breadcrumb.getLevel().getValue());
                }
                if (breadcrumb.getMessage() != null) {
                    generator.writeStringField("message", breadcrumb.getMessage());
                }
                if (breadcrumb.getCategory() != null) {
                    generator.writeStringField(ServerKeys.CATEGORY, breadcrumb.getCategory());
                }
                if (breadcrumb.getData() != null && !breadcrumb.getData().isEmpty()) {
                    generator.writeObjectFieldStart("data");
                    for (Map.Entry<String, String> entry : breadcrumb.getData().entrySet()) {
                        generator.writeStringField(entry.getKey(), entry.getValue());
                    }
                    generator.writeEndObject();
                }
                generator.writeEndObject();
            }
            generator.writeEndArray();
            generator.writeEndObject();
        }
    }

    private void writeContexts(JsonGenerator generator, Map<String, Map<String, Object>> contexts) throws IOException {
        if (!contexts.isEmpty()) {
            generator.writeObjectFieldStart(CONTEXTS);
            for (Map.Entry<String, Map<String, Object>> contextEntry : contexts.entrySet()) {
                generator.writeObjectFieldStart(contextEntry.getKey());
                for (Map.Entry<String, Object> innerContextEntry : contextEntry.getValue().entrySet()) {
                    generator.writeObjectField(innerContextEntry.getKey(), innerContextEntry.getValue());
                }
                generator.writeEndObject();
            }
            generator.writeEndObject();
        }
    }

    private String formatId(UUID id) {
        return id.toString().replaceAll("-", "");
    }

    private String formatLevel(Event.Level level) {
        if (level == null) {
            return null;
        }
        switch (level) {
            case DEBUG:
                return "debug";
            case FATAL:
                return "fatal";
            case WARNING:
                return "warning";
            case INFO:
                return UserNotification.LAYOUT_NEWSFEED_INFO;
            case ERROR:
                return "error";
            default:
                logger.error("The level '{}' isn't supported, this should NEVER happen, contact Sentry developers", level.name());
                return null;
        }
    }

    public <T extends SentryInterface, F extends T> void addInterfaceBinding(Class<F> sentryInterfaceClass, InterfaceBinding<T> binding) {
        this.interfaceBindings.put(sentryInterfaceClass, binding);
    }

    public void setCompression(boolean compression) {
        this.compression = compression;
    }

    public boolean isCompressed() {
        return this.compression;
    }
}
