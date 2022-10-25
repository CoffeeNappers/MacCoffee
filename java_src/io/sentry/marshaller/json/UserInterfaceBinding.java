package io.sentry.marshaller.json;

import com.fasterxml.jackson.core.JsonGenerator;
import io.sentry.event.interfaces.UserInterface;
import java.io.IOException;
/* loaded from: classes3.dex */
public class UserInterfaceBinding implements InterfaceBinding<UserInterface> {
    private static final String EMAIL = "email";
    private static final String ID = "id";
    private static final String IP_ADDRESS = "ip_address";
    private static final String USERNAME = "username";

    @Override // io.sentry.marshaller.json.InterfaceBinding
    public void writeInterface(JsonGenerator generator, UserInterface userInterface) throws IOException {
        generator.writeStartObject();
        generator.writeStringField("id", userInterface.getId());
        generator.writeStringField(USERNAME, userInterface.getUsername());
        generator.writeStringField("email", userInterface.getEmail());
        generator.writeStringField(IP_ADDRESS, userInterface.getIpAddress());
        generator.writeEndObject();
    }
}
