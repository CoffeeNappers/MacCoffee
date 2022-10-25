package bolts;
/* loaded from: classes.dex */
public class ExecutorException extends RuntimeException {
    public ExecutorException(Exception e) {
        super("An exception was thrown by an Executor", e);
    }
}
