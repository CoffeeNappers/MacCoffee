package io.sentry.jul;

import io.sentry.Sentry;
import io.sentry.environment.SentryEnvironment;
import io.sentry.event.Event;
import io.sentry.event.EventBuilder;
import io.sentry.event.interfaces.ExceptionInterface;
import io.sentry.event.interfaces.MessageInterface;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Filter;
import java.util.logging.Handler;
import java.util.logging.Level;
import java.util.logging.LogManager;
import java.util.logging.LogRecord;
import org.slf4j.MDC;
/* loaded from: classes3.dex */
public class SentryHandler extends Handler {
    public static final String THREAD_ID = "Sentry-ThreadId";
    protected boolean printfStyle;

    public SentryHandler() {
        retrieveProperties();
        setFilter(new DropSentryFilter());
    }

    protected static Event.Level getLevel(Level level) {
        if (level.intValue() >= Level.SEVERE.intValue()) {
            return Event.Level.ERROR;
        }
        if (level.intValue() >= Level.WARNING.intValue()) {
            return Event.Level.WARNING;
        }
        if (level.intValue() >= Level.INFO.intValue()) {
            return Event.Level.INFO;
        }
        if (level.intValue() >= Level.ALL.intValue()) {
            return Event.Level.DEBUG;
        }
        return null;
    }

    protected static List<String> formatMessageParameters(Object[] parameters) {
        List<String> formattedParameters = new ArrayList<>(parameters.length);
        int len$ = parameters.length;
        for (int i$ = 0; i$ < len$; i$++) {
            Object parameter = parameters[i$];
            formattedParameters.add(parameter != null ? parameter.toString() : null);
        }
        return formattedParameters;
    }

    protected void retrieveProperties() {
        LogManager manager = LogManager.getLogManager();
        String className = SentryHandler.class.getName();
        setPrintfStyle(Boolean.valueOf(manager.getProperty(className + ".printfStyle")).booleanValue());
    }

    @Override // java.util.logging.Handler
    public void publish(LogRecord record) {
        if (isLoggable(record) && !SentryEnvironment.isManagingThread()) {
            SentryEnvironment.startManagingThread();
            try {
                EventBuilder eventBuilder = createEventBuilder(record);
                Sentry.capture(eventBuilder);
            } catch (Exception e) {
                reportError("An exception occurred while creating a new event in Sentry", e, 1);
            } finally {
                SentryEnvironment.stopManagingThread();
            }
        }
    }

    protected EventBuilder createEventBuilder(LogRecord record) {
        String formatted;
        EventBuilder eventBuilder = new EventBuilder().withSdkIntegration("java.util.logging").withLevel(getLevel(record.getLevel())).withTimestamp(new Date(record.getMillis())).withLogger(record.getLoggerName());
        String message = record.getMessage();
        if (record.getResourceBundle() != null && record.getResourceBundle().containsKey(record.getMessage())) {
            message = record.getResourceBundle().getString(record.getMessage());
        }
        String topLevelMessage = message;
        if (record.getParameters() == null) {
            eventBuilder.withSentryInterface(new MessageInterface(message));
        } else {
            List<String> parameters = formatMessageParameters(record.getParameters());
            try {
                formatted = formatMessage(message, record.getParameters());
                topLevelMessage = formatted;
            } catch (Exception e) {
                formatted = null;
            }
            eventBuilder.withSentryInterface(new MessageInterface(message, parameters, formatted));
        }
        eventBuilder.withMessage(topLevelMessage);
        Throwable throwable = record.getThrown();
        if (throwable != null) {
            eventBuilder.withSentryInterface(new ExceptionInterface(throwable));
        }
        if (record.getSourceClassName() != null && record.getSourceMethodName() != null) {
            StackTraceElement fakeFrame = new StackTraceElement(record.getSourceClassName(), record.getSourceMethodName(), null, -1);
            eventBuilder.withCulprit(fakeFrame);
        } else {
            eventBuilder.withCulprit(record.getLoggerName());
        }
        Map<String, String> mdc = MDC.getMDCAdapter().getCopyOfContextMap();
        if (mdc != null) {
            for (Map.Entry<String, String> mdcEntry : mdc.entrySet()) {
                if (Sentry.getStoredClient().getExtraTags().contains(mdcEntry.getKey())) {
                    eventBuilder.withTag(mdcEntry.getKey(), mdcEntry.getValue());
                } else {
                    eventBuilder.withExtra(mdcEntry.getKey(), mdcEntry.getValue());
                }
            }
        }
        eventBuilder.withExtra(THREAD_ID, Integer.valueOf(record.getThreadID()));
        return eventBuilder;
    }

    protected String formatMessage(String message, Object[] parameters) {
        if (this.printfStyle) {
            String formatted = String.format(message, parameters);
            return formatted;
        }
        String formatted2 = MessageFormat.format(message, parameters);
        return formatted2;
    }

    @Override // java.util.logging.Handler
    public void flush() {
    }

    @Override // java.util.logging.Handler
    public void close() throws SecurityException {
        SentryEnvironment.startManagingThread();
        try {
            try {
                Sentry.close();
                SentryEnvironment.stopManagingThread();
            } catch (Exception e) {
                reportError("An exception occurred while closing the Sentry connection", e, 3);
                SentryEnvironment.stopManagingThread();
            }
        } catch (Throwable th) {
            SentryEnvironment.stopManagingThread();
            throw th;
        }
    }

    public void setPrintfStyle(boolean printfStyle) {
        this.printfStyle = printfStyle;
    }

    /* loaded from: classes3.dex */
    private class DropSentryFilter implements Filter {
        private DropSentryFilter() {
        }

        @Override // java.util.logging.Filter
        public boolean isLoggable(LogRecord record) {
            String loggerName = record.getLoggerName();
            return loggerName == null || !loggerName.startsWith("io.sentry");
        }
    }
}
