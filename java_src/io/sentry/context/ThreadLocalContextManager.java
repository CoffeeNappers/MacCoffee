package io.sentry.context;
/* loaded from: classes3.dex */
public class ThreadLocalContextManager implements ContextManager {
    private final ThreadLocal<Context> context = new ThreadLocal<Context>() { // from class: io.sentry.context.ThreadLocalContextManager.1
        /* JADX INFO: Access modifiers changed from: protected */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.lang.ThreadLocal
        /* renamed from: initialValue */
        public Context mo1200initialValue() {
            return new Context();
        }
    };

    @Override // io.sentry.context.ContextManager
    public Context getContext() {
        return this.context.get();
    }
}
