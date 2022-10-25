package io.sentry.marshaller.json;

import com.fasterxml.jackson.core.JsonGenerator;
import io.sentry.event.interfaces.MessageInterface;
import io.sentry.util.Util;
import java.io.IOException;
/* loaded from: classes3.dex */
public class MessageInterfaceBinding implements InterfaceBinding<MessageInterface> {
    public static final int DEFAULT_MAX_MESSAGE_LENGTH = 1000;
    private static final String FORMATTED_PARAMETER = "formatted";
    private static final String MESSAGE_PARAMETER = "message";
    private static final String PARAMS_PARAMETER = "params";
    private final int maxMessageLength;

    public MessageInterfaceBinding() {
        this.maxMessageLength = 1000;
    }

    public MessageInterfaceBinding(int maxMessageLength) {
        this.maxMessageLength = maxMessageLength;
    }

    @Override // io.sentry.marshaller.json.InterfaceBinding
    public void writeInterface(JsonGenerator generator, MessageInterface messageInterface) throws IOException {
        generator.writeStartObject();
        generator.writeStringField("message", Util.trimString(messageInterface.getMessage(), this.maxMessageLength));
        generator.writeArrayFieldStart("params");
        for (String parameter : messageInterface.getParameters()) {
            generator.writeString(parameter);
        }
        generator.writeEndArray();
        if (messageInterface.getFormatted() != null) {
            generator.writeStringField(FORMATTED_PARAMETER, Util.trimString(messageInterface.getFormatted(), this.maxMessageLength));
        }
        generator.writeEndObject();
    }
}
