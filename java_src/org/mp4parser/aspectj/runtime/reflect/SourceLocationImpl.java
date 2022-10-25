package org.mp4parser.aspectj.runtime.reflect;

import org.mp4parser.aspectj.lang.reflect.SourceLocation;
/* loaded from: classes3.dex */
class SourceLocationImpl implements SourceLocation {
    String fileName;
    int line;
    Class withinType;

    /* JADX INFO: Access modifiers changed from: package-private */
    public SourceLocationImpl(Class withinType, String fileName, int line) {
        this.withinType = withinType;
        this.fileName = fileName;
        this.line = line;
    }

    @Override // org.mp4parser.aspectj.lang.reflect.SourceLocation
    public Class getWithinType() {
        return this.withinType;
    }

    @Override // org.mp4parser.aspectj.lang.reflect.SourceLocation
    public String getFileName() {
        return this.fileName;
    }

    @Override // org.mp4parser.aspectj.lang.reflect.SourceLocation
    public int getLine() {
        return this.line;
    }

    @Override // org.mp4parser.aspectj.lang.reflect.SourceLocation
    public int getColumn() {
        return -1;
    }

    public String toString() {
        return new StringBuffer().append(getFileName()).append(":").append(getLine()).toString();
    }
}
