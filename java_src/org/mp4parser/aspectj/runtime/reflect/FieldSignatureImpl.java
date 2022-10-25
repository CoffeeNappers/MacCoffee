package org.mp4parser.aspectj.runtime.reflect;

import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import java.lang.reflect.Field;
import org.mp4parser.aspectj.lang.reflect.FieldSignature;
/* loaded from: classes3.dex */
public class FieldSignatureImpl extends MemberSignatureImpl implements FieldSignature {
    private Field field;
    Class fieldType;

    /* JADX INFO: Access modifiers changed from: package-private */
    public FieldSignatureImpl(int modifiers, String name, Class declaringType, Class fieldType) {
        super(modifiers, name, declaringType);
        this.fieldType = fieldType;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public FieldSignatureImpl(String stringRep) {
        super(stringRep);
    }

    @Override // org.mp4parser.aspectj.lang.reflect.FieldSignature
    public Class getFieldType() {
        if (this.fieldType == null) {
            this.fieldType = extractType(3);
        }
        return this.fieldType;
    }

    @Override // org.mp4parser.aspectj.runtime.reflect.SignatureImpl
    protected String createToString(StringMaker sm) {
        StringBuffer buf = new StringBuffer();
        buf.append(sm.makeModifiersString(getModifiers()));
        if (sm.includeArgs) {
            buf.append(sm.makeTypeName(getFieldType()));
        }
        if (sm.includeArgs) {
            buf.append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
        }
        buf.append(sm.makePrimaryTypeName(getDeclaringType(), getDeclaringTypeName()));
        buf.append(".");
        buf.append(getName());
        return buf.toString();
    }

    @Override // org.mp4parser.aspectj.lang.reflect.FieldSignature
    public Field getField() {
        if (this.field == null) {
            try {
                this.field = getDeclaringType().getDeclaredField(getName());
            } catch (Exception e) {
            }
        }
        return this.field;
    }
}
