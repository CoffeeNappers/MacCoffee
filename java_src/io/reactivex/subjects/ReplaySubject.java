package io.reactivex.subjects;

import io.reactivex.Observer;
import io.reactivex.Scheduler;
import io.reactivex.annotations.CheckReturnValue;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.util.NotificationLite;
import io.reactivex.plugins.RxJavaPlugins;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public final class ReplaySubject<T> extends Subject<T> {
    final ReplayBuffer<T> buffer;
    boolean done;
    final AtomicReference<ReplayDisposable<T>[]> observers = new AtomicReference<>(EMPTY);
    static final ReplayDisposable[] EMPTY = new ReplayDisposable[0];
    static final ReplayDisposable[] TERMINATED = new ReplayDisposable[0];
    private static final Object[] EMPTY_ARRAY = new Object[0];

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public interface ReplayBuffer<T> {
        void add(T t);

        void addFinal(Object obj);

        boolean compareAndSet(Object obj, Object obj2);

        Object get();

        T getValue();

        T[] getValues(T[] tArr);

        void replay(ReplayDisposable<T> replayDisposable);

        int size();
    }

    @CheckReturnValue
    public static <T> ReplaySubject<T> create() {
        return new ReplaySubject<>(new UnboundedReplayBuffer(16));
    }

    @CheckReturnValue
    public static <T> ReplaySubject<T> create(int capacityHint) {
        return new ReplaySubject<>(new UnboundedReplayBuffer(capacityHint));
    }

    @CheckReturnValue
    public static <T> ReplaySubject<T> createWithSize(int maxSize) {
        return new ReplaySubject<>(new SizeBoundReplayBuffer(maxSize));
    }

    static <T> ReplaySubject<T> createUnbounded() {
        return new ReplaySubject<>(new SizeBoundReplayBuffer(Integer.MAX_VALUE));
    }

    @CheckReturnValue
    public static <T> ReplaySubject<T> createWithTime(long maxAge, TimeUnit unit, Scheduler scheduler) {
        return new ReplaySubject<>(new SizeAndTimeBoundReplayBuffer(Integer.MAX_VALUE, maxAge, unit, scheduler));
    }

    @CheckReturnValue
    public static <T> ReplaySubject<T> createWithTimeAndSize(long maxAge, TimeUnit unit, Scheduler scheduler, int maxSize) {
        return new ReplaySubject<>(new SizeAndTimeBoundReplayBuffer(maxSize, maxAge, unit, scheduler));
    }

    ReplaySubject(ReplayBuffer<T> buffer) {
        this.buffer = buffer;
    }

    @Override // io.reactivex.Observable
    protected void subscribeActual(Observer<? super T> observer) {
        ReplayDisposable<T> rs = new ReplayDisposable<>(observer, this);
        observer.onSubscribe(rs);
        if (!rs.cancelled) {
            if (add(rs) && rs.cancelled) {
                remove(rs);
            } else {
                this.buffer.replay(rs);
            }
        }
    }

    @Override // io.reactivex.Observer
    public void onSubscribe(Disposable s) {
        if (this.done) {
            s.dispose();
        }
    }

    @Override // io.reactivex.Observer
    public void onNext(T t) {
        if (t == null) {
            onError(new NullPointerException("onNext called with null. Null values are generally not allowed in 2.x operators and sources."));
        } else if (!this.done) {
            ReplayBuffer<T> b = this.buffer;
            b.add(t);
            ReplayDisposable<T>[] arr$ = this.observers.get();
            for (ReplayDisposable<T> rs : arr$) {
                b.replay(rs);
            }
        }
    }

    @Override // io.reactivex.Observer
    public void onError(Throwable t) {
        if (t == null) {
            t = new NullPointerException("onError called with null. Null values are generally not allowed in 2.x operators and sources.");
        }
        if (this.done) {
            RxJavaPlugins.onError(t);
            return;
        }
        this.done = true;
        Object o = NotificationLite.error(t);
        ReplayBuffer<T> b = this.buffer;
        b.addFinal(o);
        ReplayDisposable<T>[] arr$ = terminate(o);
        for (ReplayDisposable<T> rs : arr$) {
            b.replay(rs);
        }
    }

    @Override // io.reactivex.Observer
    public void onComplete() {
        if (!this.done) {
            this.done = true;
            Object o = NotificationLite.complete();
            ReplayBuffer<T> b = this.buffer;
            b.addFinal(o);
            ReplayDisposable<T>[] arr$ = terminate(o);
            for (ReplayDisposable<T> rs : arr$) {
                b.replay(rs);
            }
        }
    }

    @Override // io.reactivex.subjects.Subject
    public boolean hasObservers() {
        return this.observers.get().length != 0;
    }

    int observerCount() {
        return this.observers.get().length;
    }

    @Override // io.reactivex.subjects.Subject
    public Throwable getThrowable() {
        Object o = this.buffer.get();
        if (NotificationLite.isError(o)) {
            return NotificationLite.getError(o);
        }
        return null;
    }

    public T getValue() {
        return this.buffer.getValue();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public Object[] getValues() {
        T[] b = getValues(EMPTY_ARRAY);
        if (b == EMPTY_ARRAY) {
            return new Object[0];
        }
        return b;
    }

    public T[] getValues(T[] array) {
        return this.buffer.getValues(array);
    }

    @Override // io.reactivex.subjects.Subject
    public boolean hasComplete() {
        Object o = this.buffer.get();
        return NotificationLite.isComplete(o);
    }

    @Override // io.reactivex.subjects.Subject
    public boolean hasThrowable() {
        Object o = this.buffer.get();
        return NotificationLite.isError(o);
    }

    public boolean hasValue() {
        return this.buffer.size() != 0;
    }

    int size() {
        return this.buffer.size();
    }

    boolean add(ReplayDisposable<T> rs) {
        ReplayDisposable<T>[] a;
        ReplayDisposable<T>[] b;
        do {
            a = this.observers.get();
            if (a == TERMINATED) {
                return false;
            }
            int len = a.length;
            b = new ReplayDisposable[len + 1];
            System.arraycopy(a, 0, b, 0, len);
            b[len] = rs;
        } while (!this.observers.compareAndSet(a, b));
        return true;
    }

    void remove(ReplayDisposable<T> rs) {
        ReplayDisposable<T>[] a;
        ReplayDisposable<T>[] b;
        do {
            a = this.observers.get();
            if (a != TERMINATED && a != EMPTY) {
                int len = a.length;
                int j = -1;
                int i = 0;
                while (true) {
                    if (i >= len) {
                        break;
                    } else if (a[i] != rs) {
                        i++;
                    } else {
                        j = i;
                        break;
                    }
                }
                if (j >= 0) {
                    if (len == 1) {
                        b = EMPTY;
                    } else {
                        b = new ReplayDisposable[len - 1];
                        System.arraycopy(a, 0, b, 0, j);
                        System.arraycopy(a, j + 1, b, j, (len - j) - 1);
                    }
                } else {
                    return;
                }
            } else {
                return;
            }
        } while (!this.observers.compareAndSet(a, b));
    }

    ReplayDisposable<T>[] terminate(Object terminalValue) {
        return this.buffer.compareAndSet(null, terminalValue) ? this.observers.getAndSet(TERMINATED) : TERMINATED;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class ReplayDisposable<T> extends AtomicInteger implements Disposable {
        private static final long serialVersionUID = 466549804534799122L;
        final Observer<? super T> actual;
        volatile boolean cancelled;
        Object index;
        final ReplaySubject<T> state;

        ReplayDisposable(Observer<? super T> actual, ReplaySubject<T> state) {
            this.actual = actual;
            this.state = state;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.state.remove(this);
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.cancelled;
        }
    }

    /* loaded from: classes3.dex */
    static final class UnboundedReplayBuffer<T> extends AtomicReference<Object> implements ReplayBuffer<T> {
        private static final long serialVersionUID = -733876083048047795L;
        final List<Object> buffer;
        volatile boolean done;
        volatile int size;

        UnboundedReplayBuffer(int capacityHint) {
            this.buffer = new ArrayList(ObjectHelper.verifyPositive(capacityHint, "capacityHint"));
        }

        @Override // io.reactivex.subjects.ReplaySubject.ReplayBuffer
        public void add(T value) {
            this.buffer.add(value);
            this.size++;
        }

        @Override // io.reactivex.subjects.ReplaySubject.ReplayBuffer
        public void addFinal(Object notificationLite) {
            this.buffer.add(notificationLite);
            this.size++;
            this.done = true;
        }

        @Override // io.reactivex.subjects.ReplaySubject.ReplayBuffer
        public T getValue() {
            int s = this.size;
            if (s != 0) {
                List<Object> b = this.buffer;
                T t = (T) b.get(s - 1);
                if (NotificationLite.isComplete(t) || NotificationLite.isError(t)) {
                    if (s == 1) {
                        return null;
                    }
                    Object o = b.get(s - 2);
                    return (T) o;
                }
                return t;
            }
            return null;
        }

        @Override // io.reactivex.subjects.ReplaySubject.ReplayBuffer
        public T[] getValues(T[] array) {
            int s = this.size;
            if (s == 0) {
                if (array.length != 0) {
                    array[0] = 0;
                }
                return array;
            }
            List<Object> b = this.buffer;
            Object o = b.get(s - 1);
            if ((NotificationLite.isComplete(o) || NotificationLite.isError(o)) && s - 1 == 0) {
                if (array.length != 0) {
                    array[0] = null;
                }
                return array;
            }
            if (array.length < s) {
                array = (T[]) ((Object[]) Array.newInstance(array.getClass().getComponentType(), s));
            }
            for (int i = 0; i < s; i++) {
                array[i] = b.get(i);
            }
            if (array.length > s) {
                array[s] = null;
            }
            return array;
        }

        @Override // io.reactivex.subjects.ReplaySubject.ReplayBuffer
        public void replay(ReplayDisposable<T> rs) {
            int index;
            if (rs.getAndIncrement() == 0) {
                int missed = 1;
                List<Object> b = this.buffer;
                Observer<? super T> a = rs.actual;
                Integer indexObject = (Integer) rs.index;
                if (indexObject != null) {
                    index = indexObject.intValue();
                } else {
                    index = 0;
                    rs.index = 0;
                }
                while (!rs.cancelled) {
                    int s = this.size;
                    while (s != index) {
                        if (rs.cancelled) {
                            rs.index = null;
                            return;
                        }
                        Object o = b.get(index);
                        if (this.done && index + 1 == s && index + 1 == (s = this.size)) {
                            if (NotificationLite.isComplete(o)) {
                                a.onComplete();
                            } else {
                                a.onError(NotificationLite.getError(o));
                            }
                            rs.index = null;
                            rs.cancelled = true;
                            return;
                        }
                        a.onNext(o);
                        index++;
                    }
                    if (index == this.size) {
                        rs.index = Integer.valueOf(index);
                        missed = rs.addAndGet(-missed);
                        if (missed == 0) {
                            return;
                        }
                    }
                }
                rs.index = null;
            }
        }

        @Override // io.reactivex.subjects.ReplaySubject.ReplayBuffer
        public int size() {
            int s = this.size;
            if (s != 0) {
                Object o = this.buffer.get(s - 1);
                if (NotificationLite.isComplete(o) || NotificationLite.isError(o)) {
                    return s - 1;
                }
                return s;
            }
            return 0;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class Node<T> extends AtomicReference<Node<T>> {
        private static final long serialVersionUID = 6404226426336033100L;
        final T value;

        Node(T value) {
            this.value = value;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class TimedNode<T> extends AtomicReference<TimedNode<T>> {
        private static final long serialVersionUID = 6404226426336033100L;
        final long time;
        final T value;

        TimedNode(T value, long time) {
            this.value = value;
            this.time = time;
        }
    }

    /* loaded from: classes3.dex */
    static final class SizeBoundReplayBuffer<T> extends AtomicReference<Object> implements ReplayBuffer<T> {
        private static final long serialVersionUID = 1107649250281456395L;
        volatile boolean done;
        volatile Node<Object> head;
        final int maxSize;
        int size;
        Node<Object> tail;

        SizeBoundReplayBuffer(int maxSize) {
            this.maxSize = ObjectHelper.verifyPositive(maxSize, "maxSize");
            Node<Object> h = new Node<>(null);
            this.tail = h;
            this.head = h;
        }

        void trim() {
            if (this.size > this.maxSize) {
                this.size--;
                Node<Object> h = this.head;
                this.head = h.get();
            }
        }

        @Override // io.reactivex.subjects.ReplaySubject.ReplayBuffer
        public void add(T value) {
            Node<Object> n = new Node<>(value);
            Node<Object> t = this.tail;
            this.tail = n;
            this.size++;
            t.set(n);
            trim();
        }

        @Override // io.reactivex.subjects.ReplaySubject.ReplayBuffer
        public void addFinal(Object notificationLite) {
            Node<Object> n = new Node<>(notificationLite);
            Node<Object> t = this.tail;
            this.tail = n;
            this.size++;
            t.lazySet(n);
            this.done = true;
        }

        @Override // io.reactivex.subjects.ReplaySubject.ReplayBuffer
        public T getValue() {
            Node<Object> prev = null;
            Node<Object> h = this.head;
            while (true) {
                Node<Object> next = h.get();
                if (next == null) {
                    break;
                }
                prev = h;
                h = next;
            }
            T t = (T) h.value;
            if (t == null) {
                return null;
            }
            if (NotificationLite.isComplete(t) || NotificationLite.isError(t)) {
                Object v = prev.value;
                return (T) v;
            }
            return t;
        }

        @Override // io.reactivex.subjects.ReplaySubject.ReplayBuffer
        public T[] getValues(T[] array) {
            Node<Object> h = this.head;
            int s = size();
            if (s == 0) {
                if (array.length != 0) {
                    array[0] = null;
                }
            } else {
                if (array.length < s) {
                    array = (T[]) ((Object[]) Array.newInstance(array.getClass().getComponentType(), s));
                }
                int i = 0;
                while (i != s) {
                    Node<Object> next = h.get();
                    array[i] = next.value;
                    i++;
                    h = next;
                }
                if (array.length > s) {
                    array[s] = null;
                }
            }
            return array;
        }

        @Override // io.reactivex.subjects.ReplaySubject.ReplayBuffer
        public void replay(ReplayDisposable<T> rs) {
            if (rs.getAndIncrement() == 0) {
                int missed = 1;
                Observer<? super T> a = rs.actual;
                Node<Object> index = (Node) rs.index;
                if (index == null) {
                    index = this.head;
                }
                while (!rs.cancelled) {
                    Node<Object> n = index.get();
                    if (n != null) {
                        Object o = (T) n.value;
                        if (this.done && n.get() == null) {
                            if (NotificationLite.isComplete(o)) {
                                a.onComplete();
                            } else {
                                a.onError(NotificationLite.getError(o));
                            }
                            rs.index = null;
                            rs.cancelled = true;
                            return;
                        }
                        a.onNext(o);
                        index = n;
                    } else if (index.get() == null) {
                        rs.index = index;
                        missed = rs.addAndGet(-missed);
                        if (missed == 0) {
                            return;
                        }
                    } else {
                        continue;
                    }
                }
                rs.index = null;
            }
        }

        @Override // io.reactivex.subjects.ReplaySubject.ReplayBuffer
        public int size() {
            int s = 0;
            Node<Object> h = this.head;
            while (s != Integer.MAX_VALUE) {
                Node<Object> next = h.get();
                if (next == null) {
                    Object o = h.value;
                    if (NotificationLite.isComplete(o) || NotificationLite.isError(o)) {
                        return s - 1;
                    }
                    return s;
                }
                s++;
                h = next;
            }
            return s;
        }
    }

    /* loaded from: classes3.dex */
    static final class SizeAndTimeBoundReplayBuffer<T> extends AtomicReference<Object> implements ReplayBuffer<T> {
        private static final long serialVersionUID = -8056260896137901749L;
        volatile boolean done;
        volatile TimedNode<Object> head;
        final long maxAge;
        final int maxSize;
        final Scheduler scheduler;
        int size;
        TimedNode<Object> tail;
        final TimeUnit unit;

        SizeAndTimeBoundReplayBuffer(int maxSize, long maxAge, TimeUnit unit, Scheduler scheduler) {
            this.maxSize = ObjectHelper.verifyPositive(maxSize, "maxSize");
            this.maxAge = ObjectHelper.verifyPositive(maxAge, "maxAge");
            this.unit = (TimeUnit) ObjectHelper.requireNonNull(unit, "unit is null");
            this.scheduler = (Scheduler) ObjectHelper.requireNonNull(scheduler, "scheduler is null");
            TimedNode<Object> h = new TimedNode<>(null, 0L);
            this.tail = h;
            this.head = h;
        }

        void trim() {
            if (this.size > this.maxSize) {
                this.size--;
                TimedNode<Object> h = this.head;
                this.head = h.get();
            }
            long limit = this.scheduler.now(this.unit) - this.maxAge;
            TimedNode<Object> h2 = this.head;
            while (true) {
                TimedNode<Object> next = h2.get();
                if (next == null) {
                    this.head = h2;
                    return;
                } else if (next.time > limit) {
                    this.head = h2;
                    return;
                } else {
                    h2 = next;
                }
            }
        }

        void trimFinal() {
            long limit = this.scheduler.now(this.unit) - this.maxAge;
            TimedNode<Object> h = this.head;
            while (true) {
                TimedNode<Object> next = h.get();
                if (next.get() == null) {
                    this.head = h;
                    return;
                } else if (next.time > limit) {
                    this.head = h;
                    return;
                } else {
                    h = next;
                }
            }
        }

        @Override // io.reactivex.subjects.ReplaySubject.ReplayBuffer
        public void add(T value) {
            TimedNode<Object> n = new TimedNode<>(value, this.scheduler.now(this.unit));
            TimedNode<Object> t = this.tail;
            this.tail = n;
            this.size++;
            t.set(n);
            trim();
        }

        @Override // io.reactivex.subjects.ReplaySubject.ReplayBuffer
        public void addFinal(Object notificationLite) {
            TimedNode<Object> n = new TimedNode<>(notificationLite, Long.MAX_VALUE);
            TimedNode<Object> t = this.tail;
            this.tail = n;
            this.size++;
            t.lazySet(n);
            trimFinal();
            this.done = true;
        }

        @Override // io.reactivex.subjects.ReplaySubject.ReplayBuffer
        public T getValue() {
            TimedNode<Object> prev = null;
            TimedNode<Object> h = this.head;
            while (true) {
                TimedNode<Object> next = h.get();
                if (next == null) {
                    break;
                }
                prev = h;
                h = next;
            }
            T t = (T) h.value;
            if (t == null) {
                return null;
            }
            if (NotificationLite.isComplete(t) || NotificationLite.isError(t)) {
                Object v = prev.value;
                return (T) v;
            }
            return t;
        }

        TimedNode<Object> getHead() {
            TimedNode<Object> index = this.head;
            long limit = this.scheduler.now(this.unit) - this.maxAge;
            TimedNode<Object> next = index.get();
            while (next != null) {
                long ts = next.time;
                if (ts > limit) {
                    break;
                }
                index = next;
                TimedNode<Object> next2 = index.get();
                next = next2;
            }
            return index;
        }

        @Override // io.reactivex.subjects.ReplaySubject.ReplayBuffer
        public T[] getValues(T[] array) {
            TimedNode<Object> h = getHead();
            int s = size(h);
            if (s == 0) {
                if (array.length != 0) {
                    array[0] = null;
                }
            } else {
                if (array.length < s) {
                    array = (T[]) ((Object[]) Array.newInstance(array.getClass().getComponentType(), s));
                }
                int i = 0;
                while (i != s) {
                    TimedNode<Object> next = h.get();
                    array[i] = next.value;
                    i++;
                    h = next;
                }
                if (array.length > s) {
                    array[s] = null;
                }
            }
            return array;
        }

        @Override // io.reactivex.subjects.ReplaySubject.ReplayBuffer
        public void replay(ReplayDisposable<T> rs) {
            if (rs.getAndIncrement() == 0) {
                int missed = 1;
                Observer<? super T> a = rs.actual;
                TimedNode<Object> index = (TimedNode) rs.index;
                if (index == null) {
                    index = getHead();
                }
                while (true) {
                    index = index;
                    if (rs.cancelled) {
                        rs.index = null;
                        return;
                    }
                    while (!rs.cancelled) {
                        TimedNode<Object> n = index.get();
                        if (n != null) {
                            Object o = (T) n.value;
                            if (this.done && n.get() == null) {
                                if (NotificationLite.isComplete(o)) {
                                    a.onComplete();
                                } else {
                                    a.onError(NotificationLite.getError(o));
                                }
                                rs.index = null;
                                rs.cancelled = true;
                                return;
                            }
                            a.onNext(o);
                            index = n;
                        } else if (index.get() == null) {
                            rs.index = index;
                            missed = rs.addAndGet(-missed);
                            if (missed == 0) {
                                return;
                            }
                        }
                    }
                    rs.index = null;
                    return;
                }
            }
        }

        @Override // io.reactivex.subjects.ReplaySubject.ReplayBuffer
        public int size() {
            return size(getHead());
        }

        int size(TimedNode<Object> h) {
            int s = 0;
            while (s != Integer.MAX_VALUE) {
                TimedNode<Object> next = h.get();
                if (next == null) {
                    Object o = h.value;
                    if (NotificationLite.isComplete(o) || NotificationLite.isError(o)) {
                        return s - 1;
                    }
                    return s;
                }
                s++;
                h = next;
            }
            return s;
        }
    }
}
