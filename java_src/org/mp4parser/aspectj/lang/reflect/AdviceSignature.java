package org.mp4parser.aspectj.lang.reflect;

import java.lang.reflect.Method;
/* loaded from: classes3.dex */
public interface AdviceSignature extends CodeSignature {
    Method getAdvice();

    Class getReturnType();
}
