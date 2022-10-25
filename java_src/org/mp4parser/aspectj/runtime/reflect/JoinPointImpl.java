package org.mp4parser.aspectj.runtime.reflect;

import org.mp4parser.aspectj.lang.JoinPoint;
import org.mp4parser.aspectj.lang.ProceedingJoinPoint;
import org.mp4parser.aspectj.lang.Signature;
import org.mp4parser.aspectj.lang.reflect.SourceLocation;
import org.mp4parser.aspectj.runtime.internal.AroundClosure;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public class JoinPointImpl implements ProceedingJoinPoint {
    Object _this;
    private AroundClosure arc;
    Object[] args;
    JoinPoint.StaticPart staticPart;
    Object target;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static class StaticPartImpl implements JoinPoint.StaticPart {
        private int id;
        String kind;
        Signature signature;
        SourceLocation sourceLocation;

        public StaticPartImpl(int id, String kind, Signature signature, SourceLocation sourceLocation) {
            this.kind = kind;
            this.signature = signature;
            this.sourceLocation = sourceLocation;
            this.id = id;
        }

        @Override // org.mp4parser.aspectj.lang.JoinPoint.StaticPart
        public int getId() {
            return this.id;
        }

        @Override // org.mp4parser.aspectj.lang.JoinPoint.StaticPart
        public String getKind() {
            return this.kind;
        }

        @Override // org.mp4parser.aspectj.lang.JoinPoint.StaticPart
        public Signature getSignature() {
            return this.signature;
        }

        @Override // org.mp4parser.aspectj.lang.JoinPoint.StaticPart
        public SourceLocation getSourceLocation() {
            return this.sourceLocation;
        }

        String toString(StringMaker sm) {
            StringBuffer buf = new StringBuffer();
            buf.append(sm.makeKindName(getKind()));
            buf.append("(");
            buf.append(((SignatureImpl) getSignature()).toString(sm));
            buf.append(")");
            return buf.toString();
        }

        @Override // org.mp4parser.aspectj.lang.JoinPoint.StaticPart
        public final String toString() {
            return toString(StringMaker.middleStringMaker);
        }

        @Override // org.mp4parser.aspectj.lang.JoinPoint.StaticPart
        public final String toShortString() {
            return toString(StringMaker.shortStringMaker);
        }

        @Override // org.mp4parser.aspectj.lang.JoinPoint.StaticPart
        public final String toLongString() {
            return toString(StringMaker.longStringMaker);
        }
    }

    /* loaded from: classes3.dex */
    static class EnclosingStaticPartImpl extends StaticPartImpl implements JoinPoint.EnclosingStaticPart {
        public EnclosingStaticPartImpl(int count, String kind, Signature signature, SourceLocation sourceLocation) {
            super(count, kind, signature, sourceLocation);
        }
    }

    public JoinPointImpl(JoinPoint.StaticPart staticPart, Object _this, Object target, Object[] args) {
        this.staticPart = staticPart;
        this._this = _this;
        this.target = target;
        this.args = args;
    }

    @Override // org.mp4parser.aspectj.lang.JoinPoint
    public Object getThis() {
        return this._this;
    }

    @Override // org.mp4parser.aspectj.lang.JoinPoint
    public Object getTarget() {
        return this.target;
    }

    @Override // org.mp4parser.aspectj.lang.JoinPoint
    public Object[] getArgs() {
        if (this.args == null) {
            this.args = new Object[0];
        }
        Object[] argsCopy = new Object[this.args.length];
        System.arraycopy(this.args, 0, argsCopy, 0, this.args.length);
        return argsCopy;
    }

    @Override // org.mp4parser.aspectj.lang.JoinPoint
    public JoinPoint.StaticPart getStaticPart() {
        return this.staticPart;
    }

    @Override // org.mp4parser.aspectj.lang.JoinPoint
    public String getKind() {
        return this.staticPart.getKind();
    }

    @Override // org.mp4parser.aspectj.lang.JoinPoint
    public Signature getSignature() {
        return this.staticPart.getSignature();
    }

    @Override // org.mp4parser.aspectj.lang.JoinPoint
    public SourceLocation getSourceLocation() {
        return this.staticPart.getSourceLocation();
    }

    @Override // org.mp4parser.aspectj.lang.JoinPoint
    public final String toString() {
        return this.staticPart.toString();
    }

    @Override // org.mp4parser.aspectj.lang.JoinPoint
    public final String toShortString() {
        return this.staticPart.toShortString();
    }

    @Override // org.mp4parser.aspectj.lang.JoinPoint
    public final String toLongString() {
        return this.staticPart.toLongString();
    }

    @Override // org.mp4parser.aspectj.lang.ProceedingJoinPoint
    public void set$AroundClosure(AroundClosure arc) {
        this.arc = arc;
    }

    @Override // org.mp4parser.aspectj.lang.ProceedingJoinPoint
    public Object proceed() throws Throwable {
        if (this.arc == null) {
            return null;
        }
        return this.arc.run(this.arc.getState());
    }

    @Override // org.mp4parser.aspectj.lang.ProceedingJoinPoint
    public Object proceed(Object[] adviceBindings) throws Throwable {
        char c = 1;
        if (this.arc == null) {
            return null;
        }
        int flags = this.arc.getFlags();
        if ((1048576 & flags) != 0) {
        }
        boolean thisTargetTheSame = (65536 & flags) != 0;
        boolean hasThis = (flags & 4096) != 0;
        boolean bindsThis = (flags & 256) != 0;
        boolean hasTarget = (flags & 16) != 0;
        boolean bindsTarget = (flags & 1) != 0;
        Object[] state = this.arc.getState();
        int firstArgumentIndexIntoAdviceBindings = 0;
        int firstArgumentIndexIntoState = 0 + (hasThis ? 1 : 0);
        int firstArgumentIndexIntoState2 = firstArgumentIndexIntoState + ((!hasTarget || thisTargetTheSame) ? 0 : 1);
        if (hasThis && bindsThis) {
            firstArgumentIndexIntoAdviceBindings = 1;
            state[0] = adviceBindings[0];
        }
        if (hasTarget && bindsTarget) {
            if (thisTargetTheSame) {
                firstArgumentIndexIntoAdviceBindings = (bindsThis ? 1 : 0) + 1;
                if (!bindsThis) {
                    c = 0;
                }
                state[0] = adviceBindings[c];
            } else {
                firstArgumentIndexIntoAdviceBindings = (hasThis ? 1 : 0) + 1;
                char c2 = hasThis ? (char) 1 : (char) 0;
                if (!hasThis) {
                    c = 0;
                }
                state[c2] = adviceBindings[c];
            }
        }
        for (int i = firstArgumentIndexIntoAdviceBindings; i < adviceBindings.length; i++) {
            state[(i - firstArgumentIndexIntoAdviceBindings) + firstArgumentIndexIntoState2] = adviceBindings[i];
        }
        return this.arc.run(state);
    }
}
