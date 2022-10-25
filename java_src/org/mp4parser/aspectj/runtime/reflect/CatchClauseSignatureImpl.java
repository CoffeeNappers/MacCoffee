package org.mp4parser.aspectj.runtime.reflect;

import org.mp4parser.aspectj.lang.reflect.CatchClauseSignature;
/* loaded from: classes3.dex */
class CatchClauseSignatureImpl extends SignatureImpl implements CatchClauseSignature {
    String parameterName;
    Class parameterType;

    /* JADX INFO: Access modifiers changed from: package-private */
    public CatchClauseSignatureImpl(Class declaringType, Class parameterType, String parameterName) {
        super(0, "catch", declaringType);
        this.parameterType = parameterType;
        this.parameterName = parameterName;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public CatchClauseSignatureImpl(String stringRep) {
        super(stringRep);
    }

    @Override // org.mp4parser.aspectj.lang.reflect.CatchClauseSignature
    public Class getParameterType() {
        if (this.parameterType == null) {
            this.parameterType = extractType(3);
        }
        return this.parameterType;
    }

    @Override // org.mp4parser.aspectj.lang.reflect.CatchClauseSignature
    public String getParameterName() {
        if (this.parameterName == null) {
            this.parameterName = extractString(4);
        }
        return this.parameterName;
    }

    @Override // org.mp4parser.aspectj.runtime.reflect.SignatureImpl
    protected String createToString(StringMaker sm) {
        return new StringBuffer().append("catch(").append(sm.makeTypeName(getParameterType())).append(")").toString();
    }
}
