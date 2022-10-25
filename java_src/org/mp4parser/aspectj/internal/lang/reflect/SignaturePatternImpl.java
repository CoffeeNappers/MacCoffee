package org.mp4parser.aspectj.internal.lang.reflect;

import org.mp4parser.aspectj.lang.reflect.SignaturePattern;
/* loaded from: classes3.dex */
public class SignaturePatternImpl implements SignaturePattern {
    private String sigPattern;

    public SignaturePatternImpl(String pattern) {
        this.sigPattern = pattern;
    }

    @Override // org.mp4parser.aspectj.lang.reflect.SignaturePattern
    public String asString() {
        return this.sigPattern;
    }

    public String toString() {
        return asString();
    }
}
