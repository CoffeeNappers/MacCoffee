package org.mp4parser.aspectj.lang.reflect;

import java.lang.reflect.Type;
/* loaded from: classes3.dex */
public interface InterTypeConstructorDeclaration extends InterTypeDeclaration {
    AjType<?>[] getExceptionTypes();

    Type[] getGenericParameterTypes();

    AjType<?>[] getParameterTypes();
}
