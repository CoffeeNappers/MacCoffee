package org.mp4parser.aspectj.internal.lang.reflect;

import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import java.lang.reflect.Method;
import java.util.StringTokenizer;
import org.mp4parser.aspectj.lang.reflect.AjType;
import org.mp4parser.aspectj.lang.reflect.AjTypeSystem;
import org.mp4parser.aspectj.lang.reflect.Pointcut;
import org.mp4parser.aspectj.lang.reflect.PointcutExpression;
/* loaded from: classes3.dex */
public class PointcutImpl implements Pointcut {
    private final Method baseMethod;
    private final AjType declaringType;
    private final String name;
    private String[] parameterNames;
    private final PointcutExpression pc;

    /* JADX INFO: Access modifiers changed from: protected */
    public PointcutImpl(String name, String pc, Method method, AjType declaringType, String pNames) {
        this.parameterNames = new String[0];
        this.name = name;
        this.pc = new PointcutExpressionImpl(pc);
        this.baseMethod = method;
        this.declaringType = declaringType;
        this.parameterNames = splitOnComma(pNames);
    }

    @Override // org.mp4parser.aspectj.lang.reflect.Pointcut
    public PointcutExpression getPointcutExpression() {
        return this.pc;
    }

    @Override // org.mp4parser.aspectj.lang.reflect.Pointcut
    public String getName() {
        return this.name;
    }

    @Override // org.mp4parser.aspectj.lang.reflect.Pointcut
    public int getModifiers() {
        return this.baseMethod.getModifiers();
    }

    @Override // org.mp4parser.aspectj.lang.reflect.Pointcut
    public AjType<?>[] getParameterTypes() {
        Class<?>[] baseParamTypes = this.baseMethod.getParameterTypes();
        AjType<?>[] ajParamTypes = new AjType[baseParamTypes.length];
        for (int i = 0; i < ajParamTypes.length; i++) {
            ajParamTypes[i] = AjTypeSystem.getAjType(baseParamTypes[i]);
        }
        return ajParamTypes;
    }

    @Override // org.mp4parser.aspectj.lang.reflect.Pointcut
    public AjType getDeclaringType() {
        return this.declaringType;
    }

    @Override // org.mp4parser.aspectj.lang.reflect.Pointcut
    public String[] getParameterNames() {
        return this.parameterNames;
    }

    private String[] splitOnComma(String s) {
        StringTokenizer strTok = new StringTokenizer(s, ",");
        String[] ret = new String[strTok.countTokens()];
        for (int i = 0; i < ret.length; i++) {
            ret[i] = strTok.nextToken().trim();
        }
        return ret;
    }

    public String toString() {
        StringBuffer sb = new StringBuffer();
        sb.append(getName());
        sb.append("(");
        AjType<?>[] ptypes = getParameterTypes();
        for (int i = 0; i < ptypes.length; i++) {
            sb.append(ptypes[i].getName());
            if (this.parameterNames != null && this.parameterNames[i] != null) {
                sb.append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
                sb.append(this.parameterNames[i]);
            }
            if (i + 1 < ptypes.length) {
                sb.append(",");
            }
        }
        sb.append(") : ");
        sb.append(getPointcutExpression().asString());
        return sb.toString();
    }
}
