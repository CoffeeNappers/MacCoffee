package bolts;

import java.util.Locale;
import java.util.concurrent.CancellationException;
/* loaded from: classes.dex */
public class CancellationToken {
    private final CancellationTokenSource tokenSource;

    /* JADX INFO: Access modifiers changed from: package-private */
    public CancellationToken(CancellationTokenSource tokenSource) {
        this.tokenSource = tokenSource;
    }

    public boolean isCancellationRequested() {
        return this.tokenSource.isCancellationRequested();
    }

    public CancellationTokenRegistration register(Runnable action) {
        return this.tokenSource.register(action);
    }

    public void throwIfCancellationRequested() throws CancellationException {
        this.tokenSource.throwIfCancellationRequested();
    }

    public String toString() {
        return String.format(Locale.US, "%s@%s[cancellationRequested=%s]", getClass().getName(), Integer.toHexString(hashCode()), Boolean.toString(this.tokenSource.isCancellationRequested()));
    }
}
