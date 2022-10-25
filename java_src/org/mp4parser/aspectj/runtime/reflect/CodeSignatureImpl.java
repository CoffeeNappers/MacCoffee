package org.mp4parser.aspectj.runtime.reflect;

import org.mp4parser.aspectj.lang.reflect.CodeSignature;
/* loaded from: classes3.dex */
abstract class CodeSignatureImpl extends MemberSignatureImpl implements CodeSignature {
    Class[] exceptionTypes;
    String[] parameterNames;
    Class[] parameterTypes;

    /* JADX INFO: Access modifiers changed from: package-private */
    public CodeSignatureImpl(int modifiers, String name, Class declaringType, Class[] parameterTypes, String[] parameterNames, Class[] exceptionTypes) {
        super(modifiers, name, declaringType);
        this.parameterTypes = parameterTypes;
        this.parameterNames = parameterNames;
        this.exceptionTypes = exceptionTypes;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public CodeSignatureImpl(String stringRep) {
        super(stringRep);
    }

    @Override // org.mp4parser.aspectj.lang.reflect.CodeSignature
    public Class[] getParameterTypes() {
        if (this.parameterTypes == null) {
            this.parameterTypes = extractTypes(3);
        }
        return this.parameterTypes;
    }

    @Override // org.mp4parser.aspectj.lang.reflect.CodeSignature
    public String[] getParameterNames() {
        if (this.parameterNames == null) {
            this.parameterNames = extractStrings(4);
        }
        return this.parameterNames;
    }

    @Override // org.mp4parser.aspectj.lang.reflect.CodeSignature
    public Class[] getExceptionTypes() {
        if (this.exceptionTypes == null) {
            this.exceptionTypes = extractTypes(5);
        }
        return this.exceptionTypes;
    }
}
