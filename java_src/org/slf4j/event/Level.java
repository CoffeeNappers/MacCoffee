package org.slf4j.event;

import io.fabric.sdk.android.services.network.HttpRequest;
/* loaded from: classes3.dex */
public enum Level {
    ERROR(40, "ERROR"),
    WARN(30, "WARN"),
    INFO(20, "INFO"),
    DEBUG(10, "DEBUG"),
    TRACE(0, HttpRequest.METHOD_TRACE);
    
    private int levelInt;
    private String levelStr;

    Level(int i, String s) {
        this.levelInt = i;
        this.levelStr = s;
    }

    public int toInt() {
        return this.levelInt;
    }

    @Override // java.lang.Enum
    public String toString() {
        return this.levelStr;
    }
}
