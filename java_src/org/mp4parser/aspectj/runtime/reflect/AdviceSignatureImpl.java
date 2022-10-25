package org.mp4parser.aspectj.runtime.reflect;

import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import java.lang.reflect.Method;
import org.mp4parser.aspectj.lang.reflect.AdviceSignature;
/* loaded from: classes3.dex */
class AdviceSignatureImpl extends CodeSignatureImpl implements AdviceSignature {
    private Method adviceMethod;
    Class returnType;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AdviceSignatureImpl(int modifiers, String name, Class declaringType, Class[] parameterTypes, String[] parameterNames, Class[] exceptionTypes, Class returnType) {
        super(modifiers, name, declaringType, parameterTypes, parameterNames, exceptionTypes);
        this.adviceMethod = null;
        this.returnType = returnType;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public AdviceSignatureImpl(String stringRep) {
        super(stringRep);
        this.adviceMethod = null;
    }

    @Override // org.mp4parser.aspectj.lang.reflect.AdviceSignature
    public Class getReturnType() {
        if (this.returnType == null) {
            this.returnType = extractType(6);
        }
        return this.returnType;
    }

    @Override // org.mp4parser.aspectj.runtime.reflect.SignatureImpl
    protected String createToString(StringMaker sm) {
        StringBuffer buf = new StringBuffer();
        if (sm.includeArgs) {
            buf.append(sm.makeTypeName(getReturnType()));
        }
        if (sm.includeArgs) {
            buf.append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
        }
        buf.append(sm.makePrimaryTypeName(getDeclaringType(), getDeclaringTypeName()));
        buf.append(".");
        buf.append(toAdviceName(getName()));
        sm.addSignature(buf, getParameterTypes());
        sm.addThrows(buf, getExceptionTypes());
        return buf.toString();
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private java.lang.String toAdviceName(java.lang.String r5) {
        /*
            r4 = this;
            r2 = 36
            int r2 = r5.indexOf(r2)
            r3 = -1
            if (r2 != r3) goto La
        L9:
            return r5
        La:
            java.util.StringTokenizer r0 = new java.util.StringTokenizer
            java.lang.String r2 = "$"
            r0.<init>(r5, r2)
        L12:
            boolean r2 = r0.hasMoreTokens()
            if (r2 == 0) goto L9
            java.lang.String r1 = r0.nextToken()
            java.lang.String r2 = "before"
            boolean r2 = r1.startsWith(r2)
            if (r2 != 0) goto L37
            java.lang.String r2 = "after"
            boolean r2 = r1.startsWith(r2)
            if (r2 != 0) goto L37
            java.lang.String r2 = "around"
            boolean r2 = r1.startsWith(r2)
            if (r2 == 0) goto L12
        L37:
            r5 = r1
            goto L9
        */
        throw new UnsupportedOperationException("Method not decompiled: org.mp4parser.aspectj.runtime.reflect.AdviceSignatureImpl.toAdviceName(java.lang.String):java.lang.String");
    }

    @Override // org.mp4parser.aspectj.lang.reflect.AdviceSignature
    public Method getAdvice() {
        if (this.adviceMethod == null) {
            try {
                this.adviceMethod = getDeclaringType().getDeclaredMethod(getName(), getParameterTypes());
            } catch (Exception e) {
            }
        }
        return this.adviceMethod;
    }
}
