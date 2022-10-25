package io.reactivex.internal.subscribers;

import com.google.android.exoplayer2.C;
import io.reactivex.FlowableSubscriber;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import java.util.concurrent.atomic.AtomicLong;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public abstract class SinglePostCompleteSubscriber<T, R> extends AtomicLong implements FlowableSubscriber<T>, Subscription {
    static final long COMPLETE_MASK = Long.MIN_VALUE;
    static final long REQUEST_MASK = Long.MAX_VALUE;
    private static final long serialVersionUID = 7917814472626990048L;
    protected final Subscriber<? super R> actual;
    protected long produced;
    protected Subscription s;
    protected R value;

    public SinglePostCompleteSubscriber(Subscriber<? super R> actual) {
        this.actual = actual;
    }

    @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
    public void onSubscribe(Subscription s) {
        if (SubscriptionHelper.validate(this.s, s)) {
            this.s = s;
            this.actual.onSubscribe(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void complete(R n) {
        long p = this.produced;
        if (p != 0) {
            BackpressureHelper.produced(this, p);
        }
        while (true) {
            long r = get();
            if ((r & Long.MIN_VALUE) != 0) {
                onDrop(n);
                return;
            } else if ((Long.MAX_VALUE & r) != 0) {
                lazySet(C.TIME_UNSET);
                this.actual.onNext(n);
                this.actual.onComplete();
                return;
            } else {
                this.value = n;
                if (compareAndSet(0L, Long.MIN_VALUE)) {
                    return;
                }
                this.value = null;
            }
        }
    }

    protected void onDrop(R n) {
    }

    @Override // org.reactivestreams.Subscription
    public final void request(long n) {
        long r;
        long u;
        if (SubscriptionHelper.validate(n)) {
            do {
                r = get();
                if ((r & Long.MIN_VALUE) != 0) {
                    if (compareAndSet(Long.MIN_VALUE, C.TIME_UNSET)) {
                        this.actual.onNext((R) this.value);
                        this.actual.onComplete();
                        return;
                    }
                    return;
                }
                u = BackpressureHelper.addCap(r, n);
            } while (!compareAndSet(r, u));
            this.s.request(n);
        }
    }

    @Override // org.reactivestreams.Subscription
    public void cancel() {
        this.s.cancel();
    }
}
