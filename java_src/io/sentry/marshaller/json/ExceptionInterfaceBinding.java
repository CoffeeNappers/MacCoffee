package io.sentry.marshaller.json;

import com.fasterxml.jackson.core.JsonGenerator;
import io.sentry.event.interfaces.ExceptionInterface;
import io.sentry.event.interfaces.SentryException;
import io.sentry.event.interfaces.StackTraceInterface;
import java.io.IOException;
import java.util.Deque;
import java.util.Iterator;
/* loaded from: classes3.dex */
public class ExceptionInterfaceBinding implements InterfaceBinding<ExceptionInterface> {
    private static final String MODULE_PARAMETER = "module";
    private static final String STACKTRACE_PARAMETER = "stacktrace";
    private static final String TYPE_PARAMETER = "type";
    private static final String VALUE_PARAMETER = "value";
    private final InterfaceBinding<StackTraceInterface> stackTraceInterfaceBinding;

    public ExceptionInterfaceBinding(InterfaceBinding<StackTraceInterface> stackTraceInterfaceBinding) {
        this.stackTraceInterfaceBinding = stackTraceInterfaceBinding;
    }

    @Override // io.sentry.marshaller.json.InterfaceBinding
    public void writeInterface(JsonGenerator generator, ExceptionInterface exceptionInterface) throws IOException {
        Deque<SentryException> exceptions = exceptionInterface.getExceptions();
        generator.writeStartArray();
        Iterator<SentryException> iterator = exceptions.descendingIterator();
        while (iterator.hasNext()) {
            writeException(generator, iterator.next());
        }
        generator.writeEndArray();
    }

    private void writeException(JsonGenerator generator, SentryException sentryException) throws IOException {
        generator.writeStartObject();
        generator.writeStringField("type", sentryException.getExceptionClassName());
        generator.writeStringField("value", sentryException.getExceptionMessage());
        generator.writeStringField(MODULE_PARAMETER, sentryException.getExceptionPackageName());
        generator.writeFieldName(STACKTRACE_PARAMETER);
        this.stackTraceInterfaceBinding.writeInterface(generator, sentryException.getStackTraceInterface());
        generator.writeEndObject();
    }
}
