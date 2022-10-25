package org.mp4parser.aspectj.runtime.reflect;

import org.mp4parser.aspectj.lang.JoinPoint;
import org.mp4parser.aspectj.lang.reflect.UnlockSignature;
/* loaded from: classes3.dex */
class UnlockSignatureImpl extends SignatureImpl implements UnlockSignature {
    private Class parameterType;

    /* JADX INFO: Access modifiers changed from: package-private */
    public UnlockSignatureImpl(Class c) {
        super(8, JoinPoint.SYNCHRONIZATION_UNLOCK, c);
        this.parameterType = c;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public UnlockSignatureImpl(String stringRep) {
        super(stringRep);
    }

    @Override // org.mp4parser.aspectj.runtime.reflect.SignatureImpl
    protected String createToString(StringMaker sm) {
        if (this.parameterType == null) {
            this.parameterType = extractType(3);
        }
        return new StringBuffer().append("unlock(").append(sm.makeTypeName(this.parameterType)).append(")").toString();
    }

    public Class getParameterType() {
        if (this.parameterType == null) {
            this.parameterType = extractType(3);
        }
        return this.parameterType;
    }
}
