package org.mp4parser.aspectj.internal.lang.reflect;

import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import org.mp4parser.aspectj.lang.reflect.AjType;
import org.mp4parser.aspectj.lang.reflect.AjTypeSystem;
import org.mp4parser.aspectj.lang.reflect.InterTypeMethodDeclaration;
/* loaded from: classes3.dex */
public class InterTypeMethodDeclarationImpl extends InterTypeDeclarationImpl implements InterTypeMethodDeclaration {
    private Method baseMethod;
    private AjType<?>[] exceptionTypes;
    private Type[] genericParameterTypes;
    private Type genericReturnType;
    private String name;
    private int parameterAdjustmentFactor;
    private AjType<?>[] parameterTypes;
    private AjType<?> returnType;

    public InterTypeMethodDeclarationImpl(AjType<?> decType, String target, int mods, String name, Method itdInterMethod) {
        super(decType, target, mods);
        this.parameterAdjustmentFactor = 1;
        this.name = name;
        this.baseMethod = itdInterMethod;
    }

    public InterTypeMethodDeclarationImpl(AjType<?> decType, AjType<?> targetType, Method base, int modifiers) {
        super(decType, targetType, modifiers);
        this.parameterAdjustmentFactor = 1;
        this.parameterAdjustmentFactor = 0;
        this.name = base.getName();
        this.baseMethod = base;
    }

    @Override // org.mp4parser.aspectj.lang.reflect.InterTypeMethodDeclaration
    public String getName() {
        return this.name;
    }

    @Override // org.mp4parser.aspectj.lang.reflect.InterTypeMethodDeclaration
    public AjType<?> getReturnType() {
        return AjTypeSystem.getAjType(this.baseMethod.getReturnType());
    }

    @Override // org.mp4parser.aspectj.lang.reflect.InterTypeMethodDeclaration
    public Type getGenericReturnType() {
        Type gRet = this.baseMethod.getGenericReturnType();
        if (gRet instanceof Class) {
            return AjTypeSystem.getAjType((Class) gRet);
        }
        return gRet;
    }

    @Override // org.mp4parser.aspectj.lang.reflect.InterTypeMethodDeclaration
    public AjType<?>[] getParameterTypes() {
        Class<?>[] baseTypes = this.baseMethod.getParameterTypes();
        AjType<?>[] ret = new AjType[baseTypes.length - this.parameterAdjustmentFactor];
        for (int i = this.parameterAdjustmentFactor; i < baseTypes.length; i++) {
            ret[i - this.parameterAdjustmentFactor] = AjTypeSystem.getAjType(baseTypes[i]);
        }
        return ret;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // org.mp4parser.aspectj.lang.reflect.InterTypeMethodDeclaration
    public Type[] getGenericParameterTypes() {
        Type[] baseTypes = this.baseMethod.getGenericParameterTypes();
        Type[] ret = new AjType[baseTypes.length - this.parameterAdjustmentFactor];
        for (int i = this.parameterAdjustmentFactor; i < baseTypes.length; i++) {
            if (baseTypes[i] instanceof Class) {
                ret[i - this.parameterAdjustmentFactor] = AjTypeSystem.getAjType((Class) baseTypes[i]);
            } else {
                ret[i - this.parameterAdjustmentFactor] = baseTypes[i];
            }
        }
        return ret;
    }

    @Override // org.mp4parser.aspectj.lang.reflect.InterTypeMethodDeclaration
    public TypeVariable<Method>[] getTypeParameters() {
        return this.baseMethod.getTypeParameters();
    }

    @Override // org.mp4parser.aspectj.lang.reflect.InterTypeMethodDeclaration
    public AjType<?>[] getExceptionTypes() {
        Class<?>[] baseTypes = this.baseMethod.getExceptionTypes();
        AjType<?>[] ret = new AjType[baseTypes.length];
        for (int i = 0; i < baseTypes.length; i++) {
            ret[i] = AjTypeSystem.getAjType(baseTypes[i]);
        }
        return ret;
    }

    public String toString() {
        StringBuffer sb = new StringBuffer();
        sb.append(Modifier.toString(getModifiers()));
        sb.append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
        sb.append(getReturnType().toString());
        sb.append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
        sb.append(this.targetTypeName);
        sb.append(".");
        sb.append(getName());
        sb.append("(");
        AjType<?>[] pTypes = getParameterTypes();
        for (int i = 0; i < pTypes.length - 1; i++) {
            sb.append(pTypes[i].toString());
            sb.append(", ");
        }
        if (pTypes.length > 0) {
            sb.append(pTypes[pTypes.length - 1].toString());
        }
        sb.append(")");
        return sb.toString();
    }
}
