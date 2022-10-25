package org.mp4parser.aspectj.internal.lang.reflect;

import org.mp4parser.aspectj.lang.reflect.PointcutExpression;
/* loaded from: classes3.dex */
public class PointcutExpressionImpl implements PointcutExpression {
    private String expression;

    public PointcutExpressionImpl(String aPointcutExpression) {
        this.expression = aPointcutExpression;
    }

    @Override // org.mp4parser.aspectj.lang.reflect.PointcutExpression
    public String asString() {
        return this.expression;
    }

    public String toString() {
        return asString();
    }
}
