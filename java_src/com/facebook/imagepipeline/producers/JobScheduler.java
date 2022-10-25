package com.facebook.imagepipeline.producers;

import android.os.SystemClock;
import com.facebook.common.internal.VisibleForTesting;
import com.facebook.imagepipeline.image.EncodedImage;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import javax.annotation.concurrent.GuardedBy;
/* loaded from: classes.dex */
public class JobScheduler {
    static final String QUEUE_TIME_KEY = "queueTime";
    private final Executor mExecutor;
    private final JobRunnable mJobRunnable;
    private final int mMinimumJobIntervalMs;
    private final Runnable mDoJobRunnable = new Runnable() { // from class: com.facebook.imagepipeline.producers.JobScheduler.1
        @Override // java.lang.Runnable
        public void run() {
            JobScheduler.this.doJob();
        }
    };
    private final Runnable mSubmitJobRunnable = new Runnable() { // from class: com.facebook.imagepipeline.producers.JobScheduler.2
        @Override // java.lang.Runnable
        public void run() {
            JobScheduler.this.submitJob();
        }
    };
    @VisibleForTesting
    @GuardedBy("this")
    EncodedImage mEncodedImage = null;
    @VisibleForTesting
    @GuardedBy("this")
    boolean mIsLast = false;
    @VisibleForTesting
    @GuardedBy("this")
    JobState mJobState = JobState.IDLE;
    @VisibleForTesting
    @GuardedBy("this")
    long mJobSubmitTime = 0;
    @VisibleForTesting
    @GuardedBy("this")
    long mJobStartTime = 0;

    /* loaded from: classes.dex */
    public interface JobRunnable {
        void run(EncodedImage encodedImage, boolean z);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @VisibleForTesting
    /* loaded from: classes.dex */
    public enum JobState {
        IDLE,
        QUEUED,
        RUNNING,
        RUNNING_AND_PENDING
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @VisibleForTesting
    /* loaded from: classes.dex */
    public static class JobStartExecutorSupplier {
        private static ScheduledExecutorService sJobStarterExecutor;

        JobStartExecutorSupplier() {
        }

        static ScheduledExecutorService get() {
            if (sJobStarterExecutor == null) {
                sJobStarterExecutor = Executors.newSingleThreadScheduledExecutor();
            }
            return sJobStarterExecutor;
        }
    }

    public JobScheduler(Executor executor, JobRunnable jobRunnable, int minimumJobIntervalMs) {
        this.mExecutor = executor;
        this.mJobRunnable = jobRunnable;
        this.mMinimumJobIntervalMs = minimumJobIntervalMs;
    }

    public void clearJob() {
        EncodedImage oldEncodedImage;
        synchronized (this) {
            oldEncodedImage = this.mEncodedImage;
            this.mEncodedImage = null;
            this.mIsLast = false;
        }
        EncodedImage.closeSafely(oldEncodedImage);
    }

    public boolean updateJob(EncodedImage encodedImage, boolean isLast) {
        EncodedImage oldEncodedImage;
        if (!shouldProcess(encodedImage, isLast)) {
            return false;
        }
        synchronized (this) {
            oldEncodedImage = this.mEncodedImage;
            this.mEncodedImage = EncodedImage.cloneOrNull(encodedImage);
            this.mIsLast = isLast;
        }
        EncodedImage.closeSafely(oldEncodedImage);
        return true;
    }

    public boolean scheduleJob() {
        long now = SystemClock.uptimeMillis();
        long when = 0;
        boolean shouldEnqueue = false;
        synchronized (this) {
            if (!shouldProcess(this.mEncodedImage, this.mIsLast)) {
                return false;
            }
            switch (this.mJobState) {
                case IDLE:
                    when = Math.max(this.mJobStartTime + this.mMinimumJobIntervalMs, now);
                    shouldEnqueue = true;
                    this.mJobSubmitTime = now;
                    this.mJobState = JobState.QUEUED;
                    break;
                case RUNNING:
                    this.mJobState = JobState.RUNNING_AND_PENDING;
                    break;
            }
            if (shouldEnqueue) {
                enqueueJob(when - now);
            }
            return true;
        }
    }

    private void enqueueJob(long delay) {
        if (delay > 0) {
            JobStartExecutorSupplier.get().schedule(this.mSubmitJobRunnable, delay, TimeUnit.MILLISECONDS);
        } else {
            this.mSubmitJobRunnable.run();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void submitJob() {
        this.mExecutor.execute(this.mDoJobRunnable);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doJob() {
        EncodedImage input;
        boolean isLast;
        long now = SystemClock.uptimeMillis();
        synchronized (this) {
            input = this.mEncodedImage;
            isLast = this.mIsLast;
            this.mEncodedImage = null;
            this.mIsLast = false;
            this.mJobState = JobState.RUNNING;
            this.mJobStartTime = now;
        }
        try {
            if (shouldProcess(input, isLast)) {
                this.mJobRunnable.run(input, isLast);
            }
        } finally {
            EncodedImage.closeSafely(input);
            onJobFinished();
        }
    }

    private void onJobFinished() {
        long now = SystemClock.uptimeMillis();
        long when = 0;
        boolean shouldEnqueue = false;
        synchronized (this) {
            if (this.mJobState == JobState.RUNNING_AND_PENDING) {
                when = Math.max(this.mJobStartTime + this.mMinimumJobIntervalMs, now);
                shouldEnqueue = true;
                this.mJobSubmitTime = now;
                this.mJobState = JobState.QUEUED;
            } else {
                this.mJobState = JobState.IDLE;
            }
        }
        if (shouldEnqueue) {
            enqueueJob(when - now);
        }
    }

    private static boolean shouldProcess(EncodedImage encodedImage, boolean isLast) {
        return isLast || EncodedImage.isValid(encodedImage);
    }

    public synchronized long getQueuedTime() {
        return this.mJobStartTime - this.mJobSubmitTime;
    }
}
