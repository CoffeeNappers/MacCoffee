package io.sentry.event.interfaces;

import io.sentry.jvmti.Frame;
import java.util.Map;
import java.util.Objects;
/* loaded from: classes3.dex */
public class SentryStackTraceElement {
    private final String absPath;
    private final Integer colno;
    private final String fileName;
    private final String function;
    private final int lineno;
    private final Map<String, Object> locals;
    private final String module;
    private final String platform;

    public SentryStackTraceElement(String module, String function, String fileName, int lineno, Integer colno, String absPath, String platform, Map<String, Object> locals) {
        this.module = module;
        this.function = function;
        this.fileName = fileName;
        this.lineno = lineno;
        this.colno = colno;
        this.absPath = absPath;
        this.platform = platform;
        this.locals = locals;
    }

    public String getModule() {
        return this.module;
    }

    public String getFunction() {
        return this.function;
    }

    public String getFileName() {
        return this.fileName;
    }

    public int getLineno() {
        return this.lineno;
    }

    public Integer getColno() {
        return this.colno;
    }

    public String getAbsPath() {
        return this.absPath;
    }

    public String getPlatform() {
        return this.platform;
    }

    public Map<String, Object> getLocals() {
        return this.locals;
    }

    public static SentryStackTraceElement[] fromStackTraceElements(StackTraceElement[] stackTraceElements) {
        return fromStackTraceElements(stackTraceElements, null);
    }

    public static SentryStackTraceElement[] fromStackTraceElements(StackTraceElement[] stackTraceElements, Frame[] cachedFrames) {
        SentryStackTraceElement[] sentryStackTraceElements = new SentryStackTraceElement[stackTraceElements.length];
        for (int i = 0; i < stackTraceElements.length; i++) {
            sentryStackTraceElements[i] = fromStackTraceElement(stackTraceElements[i], cachedFrames != null ? cachedFrames[i].getLocals() : null);
        }
        return sentryStackTraceElements;
    }

    public static SentryStackTraceElement fromStackTraceElement(StackTraceElement stackTraceElement) {
        return fromStackTraceElement(stackTraceElement, null);
    }

    private static SentryStackTraceElement fromStackTraceElement(StackTraceElement stackTraceElement, Map<String, Object> locals) {
        return new SentryStackTraceElement(stackTraceElement.getClassName(), stackTraceElement.getMethodName(), stackTraceElement.getFileName(), stackTraceElement.getLineNumber(), null, null, null, locals);
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        SentryStackTraceElement that = (SentryStackTraceElement) o;
        return this.lineno == that.lineno && Objects.equals(this.module, that.module) && Objects.equals(this.function, that.function) && Objects.equals(this.fileName, that.fileName) && Objects.equals(this.colno, that.colno) && Objects.equals(this.absPath, that.absPath) && Objects.equals(this.platform, that.platform) && Objects.equals(this.locals, that.locals);
    }

    public int hashCode() {
        return Objects.hash(this.module, this.function, this.fileName, Integer.valueOf(this.lineno), this.colno, this.absPath, this.platform, this.locals);
    }

    public String toString() {
        return "SentryStackTraceElement{module='" + this.module + "', function='" + this.function + "', fileName='" + this.fileName + "', lineno=" + this.lineno + ", colno=" + this.colno + ", absPath='" + this.absPath + "', platform='" + this.platform + "', locals='" + this.locals + "'}";
    }
}
