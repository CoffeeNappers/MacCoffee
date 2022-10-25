package io.reactivex.internal.operators.observable;

import io.reactivex.Emitter;
import io.reactivex.Notification;
import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.Scheduler;
import io.reactivex.SingleSource;
import io.reactivex.functions.Action;
import io.reactivex.functions.BiConsumer;
import io.reactivex.functions.BiFunction;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import io.reactivex.functions.Predicate;
import io.reactivex.internal.functions.Functions;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.operators.single.SingleToObservable;
import io.reactivex.observables.ConnectableObservable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.TimeUnit;
/* loaded from: classes3.dex */
public final class ObservableInternalHelper {
    private ObservableInternalHelper() {
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
    public static final class ItemDelayFunction<T, U> implements Function<T, ObservableSource<T>> {
        final Function<? super T, ? extends ObservableSource<U>> itemDelay;

        /* JADX WARN: Multi-variable type inference failed */
        @Override // io.reactivex.functions.Function
        /* renamed from: apply  reason: collision with other method in class */
        public /* bridge */ /* synthetic */ Object mo1190apply(Object x0) throws Exception {
            return mo1190apply((ItemDelayFunction<T, U>) x0);
        }

        ItemDelayFunction(Function<? super T, ? extends ObservableSource<U>> itemDelay) {
            this.itemDelay = itemDelay;
        }

        @Override // io.reactivex.functions.Function
        /* renamed from: apply */
        public ObservableSource<T> mo1190apply(T v) throws Exception {
            return new ObservableTake(this.itemDelay.mo1190apply(v), 1L).map(Functions.justFunction(v)).defaultIfEmpty(v);
        }
    }

    public static <T, U> Function<T, ObservableSource<T>> itemDelay(Function<? super T, ? extends ObservableSource<U>> itemDelay) {
        return new ItemDelayFunction(itemDelay);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class ObserverOnNext<T> implements Consumer<T> {
        final Observer<T> observer;

        ObserverOnNext(Observer<T> observer) {
            this.observer = observer;
        }

        @Override // io.reactivex.functions.Consumer
        public void accept(T v) throws Exception {
            this.observer.onNext(v);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class ObserverOnError<T> implements Consumer<Throwable> {
        final Observer<T> observer;

        ObserverOnError(Observer<T> observer) {
            this.observer = observer;
        }

        @Override // io.reactivex.functions.Consumer
        public void accept(Throwable v) throws Exception {
            this.observer.onError(v);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class ObserverOnComplete<T> implements Action {
        final Observer<T> observer;

        ObserverOnComplete(Observer<T> observer) {
            this.observer = observer;
        }

        @Override // io.reactivex.functions.Action
        public void run() throws Exception {
            this.observer.onComplete();
        }
    }

    public static <T> Consumer<T> observerOnNext(Observer<T> observer) {
        return new ObserverOnNext(observer);
    }

    public static <T> Consumer<Throwable> observerOnError(Observer<T> observer) {
        return new ObserverOnError(observer);
    }

    public static <T> Action observerOnComplete(Observer<T> observer) {
        return new ObserverOnComplete(observer);
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
    public static final class FlatMapWithCombinerOuter<T, R, U> implements Function<T, ObservableSource<R>> {
        private final BiFunction<? super T, ? super U, ? extends R> combiner;
        private final Function<? super T, ? extends ObservableSource<? extends U>> mapper;

        /* JADX WARN: Multi-variable type inference failed */
        @Override // io.reactivex.functions.Function
        /* renamed from: apply  reason: collision with other method in class */
        public /* bridge */ /* synthetic */ Object mo1190apply(Object x0) throws Exception {
            return mo1190apply((FlatMapWithCombinerOuter<T, R, U>) x0);
        }

        FlatMapWithCombinerOuter(BiFunction<? super T, ? super U, ? extends R> combiner, Function<? super T, ? extends ObservableSource<? extends U>> mapper) {
            this.combiner = combiner;
            this.mapper = mapper;
        }

        @Override // io.reactivex.functions.Function
        /* renamed from: apply */
        public ObservableSource<R> mo1190apply(T t) throws Exception {
            return new ObservableMap(this.mapper.mo1190apply(t), new FlatMapWithCombinerInner(this.combiner, t));
        }
    }

    public static <T, U, R> Function<T, ObservableSource<R>> flatMapWithCombiner(Function<? super T, ? extends ObservableSource<? extends U>> mapper, BiFunction<? super T, ? super U, ? extends R> combiner) {
        return new FlatMapWithCombinerOuter(combiner, mapper);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class FlatMapIntoIterable<T, U> implements Function<T, ObservableSource<U>> {
        private final Function<? super T, ? extends Iterable<? extends U>> mapper;

        /* JADX WARN: Multi-variable type inference failed */
        @Override // io.reactivex.functions.Function
        /* renamed from: apply  reason: collision with other method in class */
        public /* bridge */ /* synthetic */ Object mo1190apply(Object x0) throws Exception {
            return mo1190apply((FlatMapIntoIterable<T, U>) x0);
        }

        FlatMapIntoIterable(Function<? super T, ? extends Iterable<? extends U>> mapper) {
            this.mapper = mapper;
        }

        @Override // io.reactivex.functions.Function
        /* renamed from: apply */
        public ObservableSource<U> mo1190apply(T t) throws Exception {
            return new ObservableFromIterable(this.mapper.mo1190apply(t));
        }
    }

    public static <T, U> Function<T, ObservableSource<U>> flatMapIntoIterable(Function<? super T, ? extends Iterable<? extends U>> mapper) {
        return new FlatMapIntoIterable(mapper);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public enum MapToInt implements Function<Object, Object> {
        INSTANCE;

        @Override // io.reactivex.functions.Function
        /* renamed from: apply */
        public Object mo1190apply(Object t) throws Exception {
            return 0;
        }
    }

    /* loaded from: classes3.dex */
    static final class RepeatWhenOuterHandler implements Function<Observable<Notification<Object>>, ObservableSource<?>> {
        private final Function<? super Observable<Object>, ? extends ObservableSource<?>> handler;

        RepeatWhenOuterHandler(Function<? super Observable<Object>, ? extends ObservableSource<?>> handler) {
            this.handler = handler;
        }

        @Override // io.reactivex.functions.Function
        /* renamed from: apply  reason: avoid collision after fix types in other method */
        public ObservableSource<?> mo1190apply(Observable<Notification<Object>> no) throws Exception {
            return this.handler.mo1190apply(no.map(MapToInt.INSTANCE));
        }
    }

    public static Function<Observable<Notification<Object>>, ObservableSource<?>> repeatWhenHandler(Function<? super Observable<Object>, ? extends ObservableSource<?>> handler) {
        return new RepeatWhenOuterHandler(handler);
    }

    public static <T> Callable<ConnectableObservable<T>> replayCallable(Observable<T> parent) {
        return new ReplayCallable(parent);
    }

    public static <T> Callable<ConnectableObservable<T>> replayCallable(Observable<T> parent, int bufferSize) {
        return new BufferedReplayCallable(parent, bufferSize);
    }

    public static <T> Callable<ConnectableObservable<T>> replayCallable(Observable<T> parent, int bufferSize, long time, TimeUnit unit, Scheduler scheduler) {
        return new BufferedTimedReplayCallable(parent, bufferSize, time, unit, scheduler);
    }

    public static <T> Callable<ConnectableObservable<T>> replayCallable(Observable<T> parent, long time, TimeUnit unit, Scheduler scheduler) {
        return new TimedReplayCallable(parent, time, unit, scheduler);
    }

    public static <T, R> Function<Observable<T>, ObservableSource<R>> replayFunction(Function<? super Observable<T>, ? extends ObservableSource<R>> selector, Scheduler scheduler) {
        return new ReplayFunction(selector, scheduler);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public enum ErrorMapperFilter implements Function<Notification<Object>, Throwable>, Predicate<Notification<Object>> {
        INSTANCE;

        @Override // io.reactivex.functions.Function
        /* renamed from: apply  reason: avoid collision after fix types in other method */
        public Throwable mo1190apply(Notification<Object> t) throws Exception {
            return t.getError();
        }

        @Override // io.reactivex.functions.Predicate
        public boolean test(Notification<Object> t) throws Exception {
            return t.isOnError();
        }
    }

    /* loaded from: classes3.dex */
    static final class RetryWhenInner implements Function<Observable<Notification<Object>>, ObservableSource<?>> {
        private final Function<? super Observable<Throwable>, ? extends ObservableSource<?>> handler;

        RetryWhenInner(Function<? super Observable<Throwable>, ? extends ObservableSource<?>> handler) {
            this.handler = handler;
        }

        @Override // io.reactivex.functions.Function
        /* renamed from: apply  reason: avoid collision after fix types in other method */
        public ObservableSource<?> mo1190apply(Observable<Notification<Object>> no) throws Exception {
            return this.handler.mo1190apply(no.takeWhile(ErrorMapperFilter.INSTANCE).map(ErrorMapperFilter.INSTANCE));
        }
    }

    public static <T> Function<Observable<Notification<Object>>, ObservableSource<?>> retryWhenHandler(Function<? super Observable<Throwable>, ? extends ObservableSource<?>> handler) {
        return new RetryWhenInner(handler);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class ZipIterableFunction<T, R> implements Function<List<ObservableSource<? extends T>>, ObservableSource<? extends R>> {
        private final Function<? super Object[], ? extends R> zipper;

        @Override // io.reactivex.functions.Function
        /* renamed from: apply */
        public /* bridge */ /* synthetic */ Object mo1190apply(Object x0) throws Exception {
            return apply((List) ((List) x0));
        }

        ZipIterableFunction(Function<? super Object[], ? extends R> zipper) {
            this.zipper = zipper;
        }

        public ObservableSource<? extends R> apply(List<ObservableSource<? extends T>> list) {
            return Observable.zipIterable(list, this.zipper, false, Observable.bufferSize());
        }
    }

    public static <T, R> Function<List<ObservableSource<? extends T>>, ObservableSource<? extends R>> zipIterable(Function<? super Object[], ? extends R> zipper) {
        return new ZipIterableFunction(zipper);
    }

    public static <T, R> Observable<R> switchMapSingle(Observable<T> source, Function<? super T, ? extends SingleSource<? extends R>> mapper) {
        return source.switchMap(convertSingleMapperToObservableMapper(mapper), 1);
    }

    public static <T, R> Observable<R> switchMapSingleDelayError(Observable<T> source, Function<? super T, ? extends SingleSource<? extends R>> mapper) {
        return source.switchMapDelayError(convertSingleMapperToObservableMapper(mapper), 1);
    }

    private static <T, R> Function<T, Observable<R>> convertSingleMapperToObservableMapper(Function<? super T, ? extends SingleSource<? extends R>> mapper) {
        ObjectHelper.requireNonNull(mapper, "mapper is null");
        return new ObservableMapper(mapper);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class ObservableMapper<T, R> implements Function<T, Observable<R>> {
        final Function<? super T, ? extends SingleSource<? extends R>> mapper;

        /* JADX WARN: Multi-variable type inference failed */
        @Override // io.reactivex.functions.Function
        /* renamed from: apply  reason: collision with other method in class */
        public /* bridge */ /* synthetic */ Object mo1190apply(Object x0) throws Exception {
            return mo1190apply((ObservableMapper<T, R>) x0);
        }

        ObservableMapper(Function<? super T, ? extends SingleSource<? extends R>> mapper) {
            this.mapper = mapper;
        }

        @Override // io.reactivex.functions.Function
        /* renamed from: apply */
        public Observable<R> mo1190apply(T t) throws Exception {
            return RxJavaPlugins.onAssembly(new SingleToObservable((SingleSource) ObjectHelper.requireNonNull(this.mapper.mo1190apply(t), "The mapper returned a null value")));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class ReplayCallable<T> implements Callable<ConnectableObservable<T>> {
        private final Observable<T> parent;

        ReplayCallable(Observable<T> parent) {
            this.parent = parent;
        }

        @Override // java.util.concurrent.Callable
        /* renamed from: call */
        public ConnectableObservable<T> mo1185call() {
            return this.parent.replay();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class BufferedReplayCallable<T> implements Callable<ConnectableObservable<T>> {
        private final int bufferSize;
        private final Observable<T> parent;

        BufferedReplayCallable(Observable<T> parent, int bufferSize) {
            this.parent = parent;
            this.bufferSize = bufferSize;
        }

        @Override // java.util.concurrent.Callable
        /* renamed from: call */
        public ConnectableObservable<T> mo1179call() {
            return this.parent.replay(this.bufferSize);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class BufferedTimedReplayCallable<T> implements Callable<ConnectableObservable<T>> {
        private final int bufferSize;
        private final Observable<T> parent;
        private final Scheduler scheduler;
        private final long time;
        private final TimeUnit unit;

        BufferedTimedReplayCallable(Observable<T> parent, int bufferSize, long time, TimeUnit unit, Scheduler scheduler) {
            this.parent = parent;
            this.bufferSize = bufferSize;
            this.time = time;
            this.unit = unit;
            this.scheduler = scheduler;
        }

        @Override // java.util.concurrent.Callable
        /* renamed from: call */
        public ConnectableObservable<T> mo1180call() {
            return this.parent.replay(this.bufferSize, this.time, this.unit, this.scheduler);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class TimedReplayCallable<T> implements Callable<ConnectableObservable<T>> {
        private final Observable<T> parent;
        private final Scheduler scheduler;
        private final long time;
        private final TimeUnit unit;

        TimedReplayCallable(Observable<T> parent, long time, TimeUnit unit, Scheduler scheduler) {
            this.parent = parent;
            this.time = time;
            this.unit = unit;
            this.scheduler = scheduler;
        }

        @Override // java.util.concurrent.Callable
        /* renamed from: call */
        public ConnectableObservable<T> mo1186call() {
            return this.parent.replay(this.time, this.unit, this.scheduler);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class ReplayFunction<T, R> implements Function<Observable<T>, ObservableSource<R>> {
        private final Scheduler scheduler;
        private final Function<? super Observable<T>, ? extends ObservableSource<R>> selector;

        @Override // io.reactivex.functions.Function
        /* renamed from: apply */
        public /* bridge */ /* synthetic */ Object mo1190apply(Object x0) throws Exception {
            return apply((Observable) ((Observable) x0));
        }

        ReplayFunction(Function<? super Observable<T>, ? extends ObservableSource<R>> selector, Scheduler scheduler) {
            this.selector = selector;
            this.scheduler = scheduler;
        }

        public ObservableSource<R> apply(Observable<T> t) throws Exception {
            return Observable.wrap(this.selector.mo1190apply(t)).observeOn(this.scheduler);
        }
    }
}
