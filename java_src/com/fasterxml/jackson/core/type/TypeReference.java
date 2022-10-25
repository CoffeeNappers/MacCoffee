package com.fasterxml.jackson.core.type;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
/* loaded from: classes.dex */
public abstract class TypeReference<T> implements Comparable<TypeReference<T>> {
    protected final Type _type;

    @Override // java.lang.Comparable
    public /* bridge */ /* synthetic */ int compareTo(Object x0) {
        return compareTo((TypeReference) ((TypeReference) x0));
    }

    protected TypeReference() {
        Type superClass = getClass().getGenericSuperclass();
        if (superClass instanceof Class) {
            throw new IllegalArgumentException("Internal error: TypeReference constructed without actual type information");
        }
        this._type = ((ParameterizedType) superClass).getActualTypeArguments()[0];
    }

    public Type getType() {
        return this._type;
    }

    public int compareTo(TypeReference<T> o) {
        return 0;
    }
}
