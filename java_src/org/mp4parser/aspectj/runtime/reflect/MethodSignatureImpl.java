package org.mp4parser.aspectj.runtime.reflect;

import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import java.lang.reflect.Method;
import java.util.HashSet;
import java.util.Set;
import org.mp4parser.aspectj.lang.reflect.MethodSignature;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public class MethodSignatureImpl extends CodeSignatureImpl implements MethodSignature {
    private Method method;
    Class returnType;

    /* JADX INFO: Access modifiers changed from: package-private */
    public MethodSignatureImpl(int modifiers, String name, Class declaringType, Class[] parameterTypes, String[] parameterNames, Class[] exceptionTypes, Class returnType) {
        super(modifiers, name, declaringType, parameterTypes, parameterNames, exceptionTypes);
        this.returnType = returnType;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public MethodSignatureImpl(String stringRep) {
        super(stringRep);
    }

    @Override // org.mp4parser.aspectj.lang.reflect.MethodSignature
    public Class getReturnType() {
        if (this.returnType == null) {
            this.returnType = extractType(6);
        }
        return this.returnType;
    }

    @Override // org.mp4parser.aspectj.runtime.reflect.SignatureImpl
    protected String createToString(StringMaker sm) {
        StringBuffer buf = new StringBuffer();
        buf.append(sm.makeModifiersString(getModifiers()));
        if (sm.includeArgs) {
            buf.append(sm.makeTypeName(getReturnType()));
        }
        if (sm.includeArgs) {
            buf.append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
        }
        buf.append(sm.makePrimaryTypeName(getDeclaringType(), getDeclaringTypeName()));
        buf.append(".");
        buf.append(getName());
        sm.addSignature(buf, getParameterTypes());
        sm.addThrows(buf, getExceptionTypes());
        return buf.toString();
    }

    @Override // org.mp4parser.aspectj.lang.reflect.MethodSignature
    public Method getMethod() {
        if (this.method == null) {
            Class dtype = getDeclaringType();
            try {
                this.method = dtype.getDeclaredMethod(getName(), getParameterTypes());
            } catch (NoSuchMethodException e) {
                Set searched = new HashSet();
                searched.add(dtype);
                this.method = search(dtype, getName(), getParameterTypes(), searched);
            }
        }
        return this.method;
    }

    private Method search(Class type, String name, Class[] params, Set searched) {
        if (type == null) {
            return null;
        }
        if (!searched.contains(type)) {
            searched.add(type);
            try {
                return type.getDeclaredMethod(name, params);
            } catch (NoSuchMethodException e) {
            }
        }
        Method m = search(type.getSuperclass(), name, params, searched);
        if (m == null) {
            Class[] superinterfaces = type.getInterfaces();
            if (superinterfaces != null) {
                for (Class cls : superinterfaces) {
                    Method m2 = search(cls, name, params, searched);
                    if (m2 != null) {
                        return m2;
                    }
                }
            }
            return null;
        }
        return m;
    }
}
