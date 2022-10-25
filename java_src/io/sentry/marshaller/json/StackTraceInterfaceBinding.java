package io.sentry.marshaller.json;

import com.fasterxml.jackson.core.JsonGenerator;
import io.sentry.event.interfaces.SentryStackTraceElement;
import io.sentry.event.interfaces.StackTraceInterface;
import java.io.IOException;
import java.util.Collection;
import java.util.Collections;
import java.util.Map;
/* loaded from: classes3.dex */
public class StackTraceInterfaceBinding implements InterfaceBinding<StackTraceInterface> {
    private static final String ABSOLUTE_PATH_PARAMETER = "abs_path";
    private static final String COL_NO_PARAMETER = "colno";
    private static final String CONTEXT_LINE_PARAMETER = "context_line";
    private static final String FILENAME_PARAMETER = "filename";
    private static final String FRAMES_PARAMETER = "frames";
    private static final String FUNCTION_PARAMETER = "function";
    private static final String IN_APP_PARAMETER = "in_app";
    private static final String LINE_NO_PARAMETER = "lineno";
    private static final String MODULE_PARAMETER = "module";
    private static final String PLATFORM_PARAMTER = "platform";
    private static final String POST_CONTEXT_PARAMETER = "post_context";
    private static final String PRE_CONTEXT_PARAMETER = "pre_context";
    private static final String VARIABLES_PARAMETER = "vars";
    private Collection<String> inAppFrames = Collections.emptyList();
    private boolean removeCommonFramesWithEnclosing = true;

    private void writeFrame(JsonGenerator generator, SentryStackTraceElement stackTraceElement, boolean commonWithEnclosing) throws IOException {
        generator.writeStartObject();
        generator.writeStringField(FILENAME_PARAMETER, stackTraceElement.getFileName());
        generator.writeStringField(MODULE_PARAMETER, stackTraceElement.getModule());
        boolean inApp = (!this.removeCommonFramesWithEnclosing || !commonWithEnclosing) && isFrameInApp(stackTraceElement);
        generator.writeBooleanField(IN_APP_PARAMETER, inApp);
        generator.writeStringField(FUNCTION_PARAMETER, stackTraceElement.getFunction());
        generator.writeNumberField(LINE_NO_PARAMETER, stackTraceElement.getLineno());
        if (stackTraceElement.getColno() != null) {
            generator.writeNumberField(COL_NO_PARAMETER, stackTraceElement.getColno().intValue());
        }
        if (stackTraceElement.getPlatform() != null) {
            generator.writeStringField("platform", stackTraceElement.getPlatform());
        }
        if (stackTraceElement.getAbsPath() != null) {
            generator.writeStringField(ABSOLUTE_PATH_PARAMETER, stackTraceElement.getAbsPath());
        }
        if (stackTraceElement.getLocals() != null && !stackTraceElement.getLocals().isEmpty()) {
            generator.writeObjectFieldStart(VARIABLES_PARAMETER);
            for (Map.Entry<String, Object> varEntry : stackTraceElement.getLocals().entrySet()) {
                String name = varEntry.getKey();
                Object value = varEntry.getValue();
                if (value == null) {
                    generator.writeNullField(name);
                } else {
                    generator.writeObjectField(name, value);
                }
            }
            generator.writeEndObject();
        }
        generator.writeEndObject();
    }

    private boolean isFrameInApp(SentryStackTraceElement stackTraceElement) {
        for (String inAppFrame : this.inAppFrames) {
            String className = stackTraceElement.getModule();
            if (className.startsWith(inAppFrame)) {
                return true;
            }
        }
        return false;
    }

    @Override // io.sentry.marshaller.json.InterfaceBinding
    public void writeInterface(JsonGenerator generator, StackTraceInterface stackTraceInterface) throws IOException {
        generator.writeStartObject();
        generator.writeArrayFieldStart(FRAMES_PARAMETER);
        SentryStackTraceElement[] sentryStackTrace = stackTraceInterface.getStackTrace();
        int commonWithEnclosing = stackTraceInterface.getFramesCommonWithEnclosing();
        int i = sentryStackTrace.length - 1;
        int commonWithEnclosing2 = commonWithEnclosing;
        while (i >= 0) {
            int commonWithEnclosing3 = commonWithEnclosing2 - 1;
            writeFrame(generator, sentryStackTrace[i], commonWithEnclosing2 > 0);
            i--;
            commonWithEnclosing2 = commonWithEnclosing3;
        }
        generator.writeEndArray();
        generator.writeEndObject();
    }

    public void setRemoveCommonFramesWithEnclosing(boolean removeCommonFramesWithEnclosing) {
        this.removeCommonFramesWithEnclosing = removeCommonFramesWithEnclosing;
    }

    public void setInAppFrames(Collection<String> inAppFrames) {
        this.inAppFrames = inAppFrames;
    }
}
