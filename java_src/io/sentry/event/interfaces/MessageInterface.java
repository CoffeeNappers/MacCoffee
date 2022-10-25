package io.sentry.event.interfaces;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
/* loaded from: classes3.dex */
public class MessageInterface implements SentryInterface {
    public static final String MESSAGE_INTERFACE = "sentry.interfaces.Message";
    private final String formatted;
    private final String message;
    private final List<String> parameters;

    public MessageInterface(String message) {
        this(message, Collections.emptyList());
    }

    public MessageInterface(String message, String... params) {
        this(message, Arrays.asList(params));
    }

    public MessageInterface(String message, List<String> parameters) {
        this(message, parameters, null);
    }

    public MessageInterface(String message, List<String> parameters, String formatted) {
        this.message = message;
        this.parameters = Collections.unmodifiableList(new ArrayList(parameters));
        this.formatted = formatted;
    }

    @Override // io.sentry.event.interfaces.SentryInterface
    public String getInterfaceName() {
        return MESSAGE_INTERFACE;
    }

    public String getMessage() {
        return this.message;
    }

    public List<String> getParameters() {
        return this.parameters;
    }

    public String getFormatted() {
        return this.formatted;
    }

    public String toString() {
        return "MessageInterface{message='" + this.message + "', parameters=" + this.parameters + ", formatted=" + this.formatted + '}';
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        MessageInterface that = (MessageInterface) o;
        return Objects.equals(this.message, that.message) && Objects.equals(this.parameters, that.parameters) && Objects.equals(this.formatted, that.formatted);
    }

    public int hashCode() {
        return Objects.hash(this.message, this.parameters, this.formatted);
    }
}
