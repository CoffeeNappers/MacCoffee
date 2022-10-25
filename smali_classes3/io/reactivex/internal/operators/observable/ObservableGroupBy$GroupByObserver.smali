.class public final Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "ObservableGroupBy.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableGroupBy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "GroupByObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field static final NULL_KEY:Ljava/lang/Object;

.field private static final serialVersionUID:J = -0x332f71b8460722ceL


# instance fields
.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-",
            "Lio/reactivex/observables/GroupedObservable",
            "<TK;TV;>;>;"
        }
    .end annotation
.end field

.field final bufferSize:I

.field final cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final delayError:Z

.field final groups:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast",
            "<TK;TV;>;>;"
        }
    .end annotation
.end field

.field final keySelector:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+TK;>;"
        }
    .end annotation
.end field

.field s:Lio/reactivex/disposables/Disposable;

.field final valueSelector:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+TV;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 62
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->NULL_KEY:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lio/reactivex/Observer;Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;IZ)V
    .locals 1
    .param p4, "bufferSize"    # I
    .param p5, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-",
            "Lio/reactivex/observables/GroupedObservable",
            "<TK;TV;>;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TK;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TV;>;IZ)V"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;, "Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver<TT;TK;TV;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Lio/reactivex/observables/GroupedObservable<TK;TV;>;>;"
    .local p2, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TK;>;"
    .local p3, "valueSelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TV;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 66
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 69
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->actual:Lio/reactivex/Observer;

    .line 70
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->keySelector:Lio/reactivex/functions/Function;

    .line 71
    iput-object p3, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->valueSelector:Lio/reactivex/functions/Function;

    .line 72
    iput p4, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->bufferSize:I

    .line 73
    iput-boolean p5, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->delayError:Z

    .line 74
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->groups:Ljava/util/Map;

    .line 75
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->lazySet(I)V

    .line 76
    return-void
.end method


# virtual methods
.method public cancel(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    .prologue
    .line 169
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;, "Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver<TT;TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    if-eqz p1, :cond_1

    move-object v0, p1

    .line 170
    .local v0, "mapKey":Ljava/lang/Object;
    :goto_0
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->groups:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->decrementAndGet()I

    move-result v1

    if-nez v1, :cond_0

    .line 172
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 174
    :cond_0
    return-void

    .line 169
    .end local v0    # "mapKey":Ljava/lang/Object;
    :cond_1
    sget-object v0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->NULL_KEY:Ljava/lang/Object;

    goto :goto_0
.end method

.method public dispose()V
    .locals 3

    .prologue
    .line 156
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;, "Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver<TT;TK;TV;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 157
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->decrementAndGet()I

    move-result v0

    if-nez v0, :cond_0

    .line 158
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 161
    :cond_0
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 165
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;, "Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver<TT;TK;TV;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 4

    .prologue
    .line 142
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;, "Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver<TT;TK;TV;>;"
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->groups:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 143
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast<TK;TV;>;>;"
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->groups:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->clear()V

    .line 145
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast;

    .line 146
    .local v0, "e":Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast;, "Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast<TK;TV;>;"
    invoke-virtual {v0}, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast;->onComplete()V

    goto :goto_0

    .line 149
    .end local v0    # "e":Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast;, "Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast<TK;TV;>;"
    :cond_0
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v3}, Lio/reactivex/Observer;->onComplete()V

    .line 150
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 130
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;, "Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver<TT;TK;TV;>;"
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->groups:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 131
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast<TK;TV;>;>;"
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->groups:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->clear()V

    .line 133
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast;

    .line 134
    .local v0, "e":Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast;, "Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast<TK;TV;>;"
    invoke-virtual {v0, p1}, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 137
    .end local v0    # "e":Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast;, "Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast<TK;TV;>;"
    :cond_0
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v3, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 138
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 90
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;, "Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver<TT;TK;TV;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->keySelector:Lio/reactivex/functions/Function;

    invoke-interface {v5, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 98
    .local v2, "key":Ljava/lang/Object;, "TK;"
    if-eqz v2, :cond_0

    move-object v3, v2

    .line 99
    .local v3, "mapKey":Ljava/lang/Object;
    :goto_0
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->groups:Ljava/util/Map;

    invoke-interface {v5, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast;

    .line 100
    .local v1, "group":Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast;, "Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast<TK;TV;>;"
    if-nez v1, :cond_2

    .line 103
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 126
    .end local v1    # "group":Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast;, "Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast<TK;TV;>;"
    .end local v2    # "key":Ljava/lang/Object;, "TK;"
    .end local v3    # "mapKey":Ljava/lang/Object;
    :goto_1
    return-void

    .line 91
    :catch_0
    move-exception v0

    .line 92
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 93
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v5}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 94
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 98
    .end local v0    # "e":Ljava/lang/Throwable;
    .restart local v2    # "key":Ljava/lang/Object;, "TK;"
    :cond_0
    sget-object v3, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->NULL_KEY:Ljava/lang/Object;

    goto :goto_0

    .line 107
    .restart local v1    # "group":Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast;, "Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast<TK;TV;>;"
    .restart local v3    # "mapKey":Ljava/lang/Object;
    :cond_1
    iget v5, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->bufferSize:I

    iget-boolean v6, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->delayError:Z

    invoke-static {v2, v5, p0, v6}, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast;->createWith(Ljava/lang/Object;ILio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;Z)Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast;

    move-result-object v1

    .line 108
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->groups:Ljava/util/Map;

    invoke-interface {v5, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->getAndIncrement()I

    .line 112
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v5, v1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 117
    :cond_2
    :try_start_1
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->valueSelector:Lio/reactivex/functions/Function;

    invoke-interface {v5, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    const-string/jumbo v6, "The value supplied is null"

    invoke-static {v5, v6}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v4

    .line 125
    .local v4, "v":Ljava/lang/Object;, "TV;"
    invoke-virtual {v1, v4}, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast;->onNext(Ljava/lang/Object;)V

    goto :goto_1

    .line 118
    .end local v4    # "v":Ljava/lang/Object;, "TV;"
    :catch_1
    move-exception v0

    .line 119
    .restart local v0    # "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 120
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v5}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 121
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 80
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;, "Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver<TT;TK;TV;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 81
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 82
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 84
    :cond_0
    return-void
.end method
