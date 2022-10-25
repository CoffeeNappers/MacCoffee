package org.mp4parser.aspectj.lang.reflect;
/* loaded from: classes3.dex */
public interface Pointcut {
    AjType getDeclaringType();

    int getModifiers();

    String getName();

    String[] getParameterNames();

    AjType<?>[] getParameterTypes();

    PointcutExpression getPointcutExpression();
}
