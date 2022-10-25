package org.mp4parser.aspectj.runtime.reflect;

import java.lang.reflect.Constructor;
import org.mp4parser.aspectj.lang.reflect.ConstructorSignature;
/* loaded from: classes3.dex */
class ConstructorSignatureImpl extends CodeSignatureImpl implements ConstructorSignature {
    private Constructor constructor;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ConstructorSignatureImpl(int modifiers, Class declaringType, Class[] parameterTypes, String[] parameterNames, Class[] exceptionTypes) {
        super(modifiers, "<init>", declaringType, parameterTypes, parameterNames, exceptionTypes);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ConstructorSignatureImpl(String stringRep) {
        super(stringRep);
    }

    @Override // org.mp4parser.aspectj.runtime.reflect.SignatureImpl, org.mp4parser.aspectj.lang.Signature
    public String getName() {
        return "<init>";
    }

    @Override // org.mp4parser.aspectj.runtime.reflect.SignatureImpl
    protected String createToString(StringMaker sm) {
        StringBuffer buf = new StringBuffer();
        buf.append(sm.makeModifiersString(getModifiers()));
        buf.append(sm.makePrimaryTypeName(getDeclaringType(), getDeclaringTypeName()));
        sm.addSignature(buf, getParameterTypes());
        sm.addThrows(buf, getExceptionTypes());
        return buf.toString();
    }

    @Override // org.mp4parser.aspectj.lang.reflect.ConstructorSignature
    public Constructor getConstructor() {
        if (this.constructor == null) {
            try {
                this.constructor = getDeclaringType().getDeclaredConstructor(getParameterTypes());
            } catch (Exception e) {
            }
        }
        return this.constructor;
    }
}
