package org.mp4parser.aspectj.runtime.reflect;

import java.lang.reflect.Constructor;
import java.lang.reflect.Modifier;
import org.mp4parser.aspectj.lang.reflect.InitializerSignature;
/* loaded from: classes3.dex */
class InitializerSignatureImpl extends CodeSignatureImpl implements InitializerSignature {
    private Constructor constructor;

    /* JADX INFO: Access modifiers changed from: package-private */
    public InitializerSignatureImpl(int modifiers, Class declaringType) {
        super(modifiers, Modifier.isStatic(modifiers) ? "<clinit>" : "<init>", declaringType, SignatureImpl.EMPTY_CLASS_ARRAY, SignatureImpl.EMPTY_STRING_ARRAY, SignatureImpl.EMPTY_CLASS_ARRAY);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public InitializerSignatureImpl(String stringRep) {
        super(stringRep);
    }

    @Override // org.mp4parser.aspectj.runtime.reflect.SignatureImpl, org.mp4parser.aspectj.lang.Signature
    public String getName() {
        return Modifier.isStatic(getModifiers()) ? "<clinit>" : "<init>";
    }

    @Override // org.mp4parser.aspectj.runtime.reflect.SignatureImpl
    protected String createToString(StringMaker sm) {
        StringBuffer buf = new StringBuffer();
        buf.append(sm.makeModifiersString(getModifiers()));
        buf.append(sm.makePrimaryTypeName(getDeclaringType(), getDeclaringTypeName()));
        buf.append(".");
        buf.append(getName());
        return buf.toString();
    }

    @Override // org.mp4parser.aspectj.lang.reflect.InitializerSignature
    public Constructor getInitializer() {
        if (this.constructor == null) {
            try {
                this.constructor = getDeclaringType().getDeclaredConstructor(getParameterTypes());
            } catch (Exception e) {
            }
        }
        return this.constructor;
    }
}
