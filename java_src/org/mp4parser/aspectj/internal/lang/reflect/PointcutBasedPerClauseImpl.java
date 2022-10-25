package org.mp4parser.aspectj.internal.lang.reflect;

import org.mp4parser.aspectj.lang.reflect.PerClauseKind;
import org.mp4parser.aspectj.lang.reflect.PointcutBasedPerClause;
import org.mp4parser.aspectj.lang.reflect.PointcutExpression;
/* loaded from: classes3.dex */
public class PointcutBasedPerClauseImpl extends PerClauseImpl implements PointcutBasedPerClause {
    private final PointcutExpression pointcutExpression;

    public PointcutBasedPerClauseImpl(PerClauseKind kind, String pointcutExpression) {
        super(kind);
        this.pointcutExpression = new PointcutExpressionImpl(pointcutExpression);
    }

    @Override // org.mp4parser.aspectj.lang.reflect.PointcutBasedPerClause
    public PointcutExpression getPointcutExpression() {
        return this.pointcutExpression;
    }

    @Override // org.mp4parser.aspectj.internal.lang.reflect.PerClauseImpl
    public String toString() {
        StringBuffer sb = new StringBuffer();
        switch (getKind()) {
            case PERCFLOW:
                sb.append("percflow(");
                break;
            case PERCFLOWBELOW:
                sb.append("percflowbelow(");
                break;
            case PERTARGET:
                sb.append("pertarget(");
                break;
            case PERTHIS:
                sb.append("perthis(");
                break;
        }
        sb.append(this.pointcutExpression.asString());
        sb.append(")");
        return sb.toString();
    }
}
