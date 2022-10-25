package org.mp4parser.aspectj.internal.lang.reflect;

import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.lang.reflect.Type;
import org.mp4parser.aspectj.lang.reflect.AjType;
import org.mp4parser.aspectj.lang.reflect.AjTypeSystem;
import org.mp4parser.aspectj.lang.reflect.InterTypeFieldDeclaration;
/* loaded from: classes3.dex */
public class InterTypeFieldDeclarationImpl extends InterTypeDeclarationImpl implements InterTypeFieldDeclaration {
    private Type genericType;
    private String name;
    private AjType<?> type;

    public InterTypeFieldDeclarationImpl(AjType<?> decType, String target, int mods, String name, AjType<?> type, Type genericType) {
        super(decType, target, mods);
        this.name = name;
        this.type = type;
        this.genericType = genericType;
    }

    public InterTypeFieldDeclarationImpl(AjType<?> decType, AjType<?> targetType, Field base) {
        super(decType, targetType, base.getModifiers());
        this.name = base.getName();
        this.type = AjTypeSystem.getAjType(base.getType());
        Type gt = base.getGenericType();
        if (gt instanceof Class) {
            this.genericType = AjTypeSystem.getAjType((Class) gt);
        } else {
            this.genericType = gt;
        }
    }

    @Override // org.mp4parser.aspectj.lang.reflect.InterTypeFieldDeclaration
    public String getName() {
        return this.name;
    }

    @Override // org.mp4parser.aspectj.lang.reflect.InterTypeFieldDeclaration
    public AjType<?> getType() {
        return this.type;
    }

    @Override // org.mp4parser.aspectj.lang.reflect.InterTypeFieldDeclaration
    public Type getGenericType() {
        return this.genericType;
    }

    public String toString() {
        StringBuffer sb = new StringBuffer();
        sb.append(Modifier.toString(getModifiers()));
        sb.append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
        sb.append(getType().toString());
        sb.append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
        sb.append(this.targetTypeName);
        sb.append(".");
        sb.append(getName());
        return sb.toString();
    }
}
