package com.vkontakte.android.audio.utils;

import android.os.AsyncTask;
import android.support.annotation.NonNull;
import java.util.Comparator;
import java.util.WeakHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public abstract class AsyncTaskCompat<Params, Progress, Result> extends AsyncTask<Params, Progress, Result> {
    private static final PriorityExecutors QUICK_EXECUTORS = new PriorityExecutors(Runtime.getRuntime().availableProcessors());
    private static final PriorityExecutors SLOW_EXECUTORS = new PriorityExecutors(4);

    public void executeQuick(Priority priority, Params... params) {
        executeOnExecutor(QUICK_EXECUTORS.getExecutor(priority), params);
    }

    public void executeQuick(Params... params) {
        executeQuick(Priority.MEDIUM, params);
    }

    public void executeSlow(Priority priority, Params... params) {
        executeOnExecutor(SLOW_EXECUTORS.getExecutor(priority), params);
    }

    public void executeSlow(Params... params) {
        executeSlow(Priority.MEDIUM, params);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class PriorityExecutors implements Comparator<Runnable> {
        private final Executor mExecutor;
        private final PriorityExecutor[] mExecutors = new PriorityExecutor[Priority.VALUES.length];
        private final WeakHashMap<Runnable, Priority> mRunnablePriorityMap;

        public PriorityExecutors(int poolSize) {
            this.mExecutor = new ThreadPoolExecutor(poolSize, poolSize, 0L, TimeUnit.SECONDS, new PriorityBlockingQueue(10, this));
            for (int i = 0; i < this.mExecutors.length; i++) {
                this.mExecutors[i] = new PriorityExecutor(Priority.VALUES[i]);
            }
            this.mRunnablePriorityMap = new WeakHashMap<>();
        }

        @Override // java.util.Comparator
        public int compare(Runnable lhs, Runnable rhs) {
            int lhsPriorityOrdinal;
            int rhsPriorityOrdinal;
            synchronized (this.mRunnablePriorityMap) {
                lhsPriorityOrdinal = this.mRunnablePriorityMap.get(lhs).ordinal();
                rhsPriorityOrdinal = this.mRunnablePriorityMap.get(rhs).ordinal();
            }
            return Utils.compareIntegers(lhsPriorityOrdinal, rhsPriorityOrdinal);
        }

        public Executor getExecutor(Priority priority) {
            return this.mExecutors[priority.ordinal()];
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* loaded from: classes2.dex */
        public class PriorityExecutor implements Executor {
            private final Priority mPriority;

            public PriorityExecutor(Priority priority) {
                this.mPriority = priority;
            }

            @Override // java.util.concurrent.Executor
            public void execute(@NonNull Runnable command) {
                synchronized (PriorityExecutors.this.mRunnablePriorityMap) {
                    PriorityExecutors.this.mRunnablePriorityMap.put(command, this.mPriority);
                }
                PriorityExecutors.this.mExecutor.execute(command);
            }
        }
    }
}
