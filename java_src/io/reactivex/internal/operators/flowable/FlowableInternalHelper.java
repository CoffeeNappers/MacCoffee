package io.reactivex.internal.operators.flowable;

import io.reactivex.Emitter;
import io.reactivex.Flowable;
import io.reactivex.Scheduler;
import io.reactivex.flowables.ConnectableFlowable;
import io.reactivex.functions.Action;
import io.reactivex.functions.BiConsumer;
import io.reactivex.functions.BiFunction;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.Functions;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.TimeUnit;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableInternalHelper {
    private FlowableInternalHelper() {
        throw new IllegalStateException("No instances!");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class SimpleGenerator<T, S> implements BiFunction<S, Emitter<T>, S> {
        final Consumer<Emitter<T>> consumer;

        /* JADX WARN: Multi-variable type inference failed */
        @Override // io.reactivex.functions.BiFunction
        public /* bridge */ /* synthetic */ Object apply(Object x0, Object x1) throws Exception {
            return apply((SimpleGenerator<T, S>) x0, (Emitter) ((Emitter) x1));
        }

        SimpleGenerator(Consumer<Emitter<T>> consumer) {
            this.consumer = consumer;
        }

        public S apply(S t1, Emitter<T> t2) throws Exception {
            this.consumer.accept(t2);
            return t1;
        }
    }

    public static <T, S> BiFunction<S, Emitter<T>, S> simpleGenerator(Consumer<Emitter<T>> consumer) {
        return new SimpleGenerator(consumer);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class SimpleBiGenerator<T, S> implements BiFunction<S, Emitter<T>, S> {
        final BiConsumer<S, Emitter<T>> consumer;

        /* JADX WARN: Multi-variable type inference failed */
        @Override // io.reactivex.functions.BiFunction
        public /* bridge */ /* synthetic */ Object apply(Object x0, Object x1) throws Exception {
            return apply((SimpleBiGenerator<T, S>) x0, (Emitter) ((Emitter) x1));
        }

        SimpleBiGenerator(BiConsumer<S, Emitter<T>> consumer) {
            this.consumer = consumer;
        }

        public S apply(S t1, Emitter<T> t2) throws Exception {
            this.consumer.accept(t1, t2);
            return t1;
        }
    }

    public static <T, S> BiFunction<S, Emitter<T>, S> simpleBiGenerator(BiConsumer<S, Emitter<T>> consumer) {
        return new SimpleBiGenerator(consumer);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class ItemDelayFunction<T, U> implements Function<T, Publisher<T>> {
        final Function<? super T, ? extends Publisher<U>> itemDelay;

        /* JADX WARN: Multi-variable type inference failed */
        @Override // io.reactivex.functions.Function
        /* renamed from: apply */
        public /* bridge */ /* synthetic */ Object mo1190apply(Object x0) throws Exception {
            return mo1190apply((ItemDelayFunction<T, U>) x0);
        }

        ItemDelayFunction(Function<? super T, ? extends Publisher<U>> itemDelay) {
            this.itemDelay = itemDelay;
        }

        @Override // io.reactivex.functions.Function
        /* renamed from: apply  reason: collision with other method in class */
        public Publisher<T> mo1190apply(T v) throws Exception {
            return new FlowableTakePublisher(this.itemDelay.mo1190apply(v), 1L).map(Functions.justFunction(v)).defaultIfEmpty(v);
        }
    }

    public static <T, U> Function<T, Publisher<T>> itemDelay(Function<? super T, ? extends Publisher<U>> itemDelay) {
        return new ItemDelayFunction(itemDelay);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class SubscriberOnNext<T> implements Consumer<T> {
        final Subscriber<T> subscriber;

        SubscriberOnNext(Subscriber<T> subscriber) {
            this.subscriber = subscriber;
        }

        @Override // io.reactivex.functions.Consumer
        public void accept(T v) throws Exception {
            this.subscriber.onNext(v);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class SubscriberOnError<T> implements Consumer<Throwable> {
        final Subscriber<T> subscriber;

        SubscriberOnError(Subscriber<T> subscriber) {
            this.subscriber = subscriber;
        }

        @Override // io.reactivex.functions.Consumer
        public void accept(Throwable v) throws Exception {
            this.subscriber.onError(v);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class SubscriberOnComplete<T> implements Action {
        final Subscriber<T> subscriber;

        SubscriberOnComplete(Subscriber<T> subscriber) {
            this.subscriber = subscriber;
        }

        @Override // io.reactivex.functions.Action
        public void run() throws Exception {
            this.subscriber.onComplete();
        }
    }

    public static <T> Consumer<T> subscriberOnNext(Subscriber<T> subscriber) {
        return new SubscriberOnNext(subscriber);
    }

    public static <T> Consumer<Throwable> subscriberOnError(Subscriber<T> subscriber) {
        return new SubscriberOnError(subscriber);
    }

    public static <T> Action subscriberOnComplete(Subscriber<T> subscriber) {
        return new SubscriberOnComplete(subscriber);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class FlatMapWithCombinerInner<U, R, T> implements Function<U, R> {
        private final BiFunction<? super T, ? super U, ? extends R> combiner;
        private final T t;

        FlatMapWithCombinerInner(BiFunction<? super T, ? super U, ? extends R> combiner, T t) {
            this.combiner = combiner;
            this.t = t;
        }

        @Override // io.reactivex.functions.Function
        /* renamed from: apply */
        public R mo1190apply(U w) throws Exception {
            return this.combiner.apply((T) this.t, w);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class FlatMapWithCombinerOuter<T, R, U> implements Function<T, Publisher<R>> {
        private final BiFunction<? super T, ? super U, ? extends R> combiner;
        private final Function<? super T, ? extends Publisher<? extends U>> mapper;

        /* JADX WARN: Multi-variable type inference failed */
        @Override // io.reactivex.functions.Function
        /* renamed from: apply */
        public /* bridge */ /* synthetic */ Object mo1190apply(Object x0) throws Exception {
            return mo1190apply((FlatMapWithCombinerOuter<T, R, U>) x0);
        }

        FlatMapWithCombinerOuter(BiFunction<? super T, ? super U, ? extends R> combiner, Function<? super T, ? extends Publisher<? extends U>> mapper) {
            this.combiner = combiner;
            this.mapper = mapper;
        }

        @Override // io.reactivex.functions.Function
        /* renamed from: apply  reason: collision with other method in class */
        public Publisher<R> mo1190apply(T t) throws Exception {
            return new FlowableMapPublisher(this.mapper.mo1190apply(t), new FlatMapWithCombinerInner(this.combiner, t));
        }
    }

    public static <T, U, R> Function<T, Publisher<R>> flatMapWithCombiner(Function<? super T, ? extends Publisher<? extends U>> mapper, BiFunction<? super T, ? super U, ? extends R> combiner) {
        return new FlatMapWithCombinerOuter(combiner, mapper);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class FlatMapIntoIterable<T, U> implements Function<T, Publisher<U>> {
        private final Function<? super T, ? extends Iterable<? extends U>> mapper;

        /* JADX WARN: Multi-variable type inference failed */
        @Override // io.reactivex.functions.Function
        /* renamed from: apply */
        public /* bridge */ /* synthetic */ Object mo1190apply(Object x0) throws Exception {
            return mo1190apply((FlatMapIntoIterable<T, U>) x0);
        }

        FlatMapIntoIterable(Function<? super T, ? extends Iterable<? extends U>> mapper) {
            this.mapper = mapper;
        }

        @Override // io.reactivex.functions.Function
        /* renamed from: apply  reason: collision with other method in class */
        public Publisher<U> mo1190apply(T t) throws Exception {
            return new FlowableFromIterable(this.mapper.mo1190apply(t));
        }
    }

    public static <T, U> Function<T, Publisher<U>> flatMapIntoIterable(Function<? super T, ? extends Iterable<? extends U>> mapper) {
        return new FlatMapIntoIterable(mapper);
    }

    public static <T> Callable<ConnectableFlowable<T>> replayCallable(Flowable<T> parent) {
        return new ReplayCallable(parent);
    }

    public static <T> Callable<ConnectableFlowable<T>> replayCallable(Flowable<T> parent, int bufferSize) {
        return new BufferedReplayCallable(parent, bufferSize);
    }

    public static <T> Callable<ConnectableFlowable<T>> replayCallable(Flowable<T> parent, int bufferSize, long time, TimeUnit unit, Scheduler scheduler) {
        return new BufferedTimedReplay(parent, bufferSize, time, unit, scheduler);
    }

    public static <T> Callable<ConnectableFlowable<T>> replayCallable(Flowable<T> parent, long time, TimeUnit unit, Scheduler scheduler) {
        return new TimedReplay(parent, time, unit, scheduler);
    }

    public static <T, R> Function<Flowable<T>, Publisher<R>> replayFunction(Function<? super Flowable<T>, ? extends Publisher<R>> selector, Scheduler scheduler) {
        return new ReplayFunction(selector, scheduler);
    }

    /* loaded from: classes3.dex */
    public enum RequestMax implements Consumer<Subscription> {
        INSTANCE;

        @Override // io.reactivex.functions.Consumer
        public void accept(Subscription t) throws Exception {
            t.request(Long.MAX_VALUE);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class ZipIterableFunction<T, R> implements Function<List<Publisher<? extends T>>, Publisher<? extends R>> {
        private final Function<? super Object[], ? extends R> zipper;

        @Override // io.reactivex.functions.Function
        /* renamed from: apply */
        public /* bridge */ /* synthetic */ Object mo1190apply(Object x0) throws Exception {
            return apply((List) ((List) x0));
        }

        ZipIterableFunction(Function<? super Object[], ? extends R> zipper) {
            this.zipper = zipper;
        }

        public Publisher<? extends R> apply(List<Publisher<? extends T>> list) {
            return Flowable.zipIterable(list, this.zipper, false, Flowable.bufferSize());
        }
    }

    public static <T, R> Function<List<Publisher<? extends T>>, Publisher<? extends R>> zipIterable(Function<? super Object[], ? extends R> zipper) {
        return new ZipIterableFunction(zipper);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class ReplayCallable<T> implements Callable<ConnectableFlowable<T>> {
        private final Flowable<T> parent;

        ReplayCallable(Flowable<T> parent) {
            this.parent = parent;
        }

        @Override // java.util.concurrent.Callable
        /* renamed from: call */
        public ConnectableFlowable<T> mo1173call() {
            return this.parent.replay();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class BufferedReplayCallable<T> implements Callable<ConnectableFlowable<T>> {
        private final int bufferSize;
        private final Flowable<T> parent;

        BufferedReplayCallable(Flowable<T> parent, int bufferSize) {
            this.parent = parent;
            this.bufferSize = bufferSize;
        }

        @Override // java.util.concurrent.Callable
        /* renamed from: call */
        public ConnectableFlowable<T> mo1168call() {
            return this.parent.replay(this.bufferSize);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class BufferedTimedReplay<T> implements Callable<ConnectableFlowable<T>> {
        private final int bufferSize;
        private final Flowable<T> parent;
        private final Scheduler scheduler;
        private final long time;
        private final TimeUnit unit;

        BufferedTimedReplay(Flowable<T> parent, int bufferSize, long time, TimeUnit unit, Scheduler scheduler) {
            this.parent = parent;
            this.bufferSize = bufferSize;
            this.time = time;
            this.unit = unit;
            this.scheduler = scheduler;
        }

        @Override // java.util.concurrent.Callable
        /* renamed from: call */
        public ConnectableFlowable<T> mo1169call() {
            return this.parent.replay(this.bufferSize, this.time, this.unit, this.scheduler);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class TimedReplay<T> implements Callable<ConnectableFlowable<T>> {
        private final Flowable<T> parent;
        private final Scheduler scheduler;
        private final long time;
        private final TimeUnit unit;

        TimedReplay(Flowable<T> parent, long time, TimeUnit unit, Scheduler scheduler) {
            this.parent = parent;
            this.time = time;
            this.unit = unit;
            this.scheduler = scheduler;
        }

        @Override // java.util.concurrent.Callable
        /* renamed from: call */
        public ConnectableFlowable<T> mo1174call() {
            return this.parent.replay(this.time, this.unit, this.scheduler);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class ReplayFunction<T, R> implements Function<Flowable<T>, Publisher<R>> {
        private final Scheduler scheduler;
        private final Function<? super Flowable<T>, ? extends Publisher<R>> selector;

        @Override // io.reactivex.functions.Function
        /* renamed from: apply */
        public /* bridge */ /* synthetic */ Object mo1190apply(Object x0) throws Exception {
            return apply((Flowable) ((Flowable) x0));
        }

        ReplayFunction(Function<? super Flowable<T>, ? extends Publisher<R>> selector, Scheduler scheduler) {
            this.selector = selector;
            this.scheduler = scheduler;
        }

        public Publisher<R> apply(Flowable<T> t) throws Exception {
            return Flowable.fromPublisher(this.selector.mo1190apply(t)).observeOn(this.scheduler);
        }
    }
}
