package org.mp4parser.aspectj.runtime.reflect;

import org.mp4parser.aspectj.lang.reflect.MemberSignature;
/* loaded from: classes3.dex */
abstract class MemberSignatureImpl extends SignatureImpl implements MemberSignature {
    /* JADX INFO: Access modifiers changed from: package-private */
    public MemberSignatureImpl(int modifiers, String name, Class declaringType) {
        super(modifiers, name, declaringType);
    }

    public MemberSignatureImpl(String stringRep) {
        super(stringRep);
    }
}
