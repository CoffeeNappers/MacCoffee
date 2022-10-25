package io.reactivex.android.schedulers;

import android.os.Handler;
import android.os.Message;
import io.reactivex.Scheduler;
import io.reactivex.disposables.Disposable;
import io.reactivex.disposables.Disposables;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.TimeUnit;
/* loaded from: classes3.dex */
final class HandlerScheduler extends Scheduler {
    private final Handler handler;

    /* JADX INFO: Access modifiers changed from: package-private */
    public HandlerScheduler(Handler handler) {
        this.handler = handler;
    }

    @Override // io.reactivex.Scheduler
    public Disposable scheduleDirect(Runnable run, long delay, TimeUnit unit) {
        if (run == null) {
            throw new NullPointerException("run == null");
        }
        if (unit == null) {
            throw new NullPointerException("unit == null");
        }
        ScheduledRunnable scheduled = new ScheduledRunnable(this.handler, RxJavaPlugins.onSchedule(run));
        this.handler.postDelayed(scheduled, Math.max(0L, unit.toMillis(delay)));
        return scheduled;
    }

    @Override // io.reactivex.Scheduler
    public Scheduler.Worker createWorker() {
        return new HandlerWorker(this.handler);
    }

    /* loaded from: classes3.dex */
    private static final class HandlerWorker extends Scheduler.Worker {
        private volatile boolean disposed;
        private final Handler handler;

        HandlerWorker(Handler handler) {
            this.handler = handler;
        }

        @Override // io.reactivex.Scheduler.Worker
        public Disposable schedule(Runnable run, long delay, TimeUnit unit) {
            if (run == null) {
                throw new NullPointerException("run == null");
            }
            if (unit == null) {
                throw new NullPointerException("unit == null");
            }
            if (this.disposed) {
                return Disposables.disposed();
            }
            ScheduledRunnable scheduled = new ScheduledRunnable(this.handler, RxJavaPlugins.onSchedule(run));
            Message message = Message.obtain(this.handler, scheduled);
            message.obj = this;
            this.handler.sendMessageDelayed(message, Math.max(0L, unit.toMillis(delay)));
            if (this.disposed) {
                this.handler.removeCallbacks(scheduled);
                return Disposables.disposed();
            }
            return scheduled;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.disposed = true;
            this.handler.removeCallbacksAndMessages(this);
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.disposed;
        }
    }

    /* loaded from: classes3.dex */
    private static final class ScheduledRunnable implements Runnable, Disposable {
        private final Runnable delegate;
        private volatile boolean disposed;
        private final Handler handler;

        ScheduledRunnable(Handler handler, Runnable delegate) {
            this.handler = handler;
            this.delegate = delegate;
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                this.delegate.run();
            } catch (Throwable t) {
                IllegalStateException ie = new IllegalStateException("Fatal Exception thrown on Scheduler.", t);
                RxJavaPlugins.onError(ie);
                Thread thread = Thread.currentThread();
                thread.getUncaughtExceptionHandler().uncaughtException(thread, ie);
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.disposed = true;
            this.handler.removeCallbacks(this);
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.disposed;
        }
    }
}
