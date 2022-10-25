package io.sentry.context;
/* loaded from: classes3.dex */
public class SingletonContextManager implements ContextManager {
    private final Context context = new Context();

    @Override // io.sentry.context.ContextManager
    public Context getContext() {
        return this.context;
    }
}
