package io.sentry.jvmti;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes3.dex */
public final class Frame {
    private final LocalVariable[] locals;

    public Frame(LocalVariable[] locals) {
        this.locals = locals;
    }

    public Map<String, Object> getLocals() {
        if (this.locals == null || this.locals.length == 0) {
            return Collections.emptyMap();
        }
        Map<String, Object> localsMap = new HashMap<>();
        LocalVariable[] arr$ = this.locals;
        for (LocalVariable localVariable : arr$) {
            if (localVariable != null) {
                localsMap.put(localVariable.getName(), localVariable.getValue());
            }
        }
        return localsMap;
    }

    public String toString() {
        return "Frame{, locals=" + Arrays.toString(this.locals) + '}';
    }

    /* loaded from: classes3.dex */
    public static final class LocalVariable {
        final String name;
        final Object value;

        private LocalVariable(String name, Object value) {
            this.name = name;
            this.value = value;
        }

        public String getName() {
            return this.name;
        }

        public Object getValue() {
            return this.value;
        }

        public String toString() {
            return "LocalVariable{name='" + this.name + "', value=" + this.value + '}';
        }
    }
}
