.class final Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;
.super Ljava/lang/Object;
.source "ObservableDoOnEach.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableDoOnEach;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "DoOnEachObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# instance fields
.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TT;>;"
        }
    .end annotation
.end field

.field done:Z

.field final onAfterTerminate:Lio/reactivex/functions/Action;

.field final onComplete:Lio/reactivex/functions/Action;

.field final onError:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field final onNext:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;"
        }
    .end annotation
.end field

.field s:Lio/reactivex/disposables/Disposable;


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;Lio/reactivex/functions/Action;)V
    .locals 0
    .param p4, "onComplete"    # Lio/reactivex/functions/Action;
    .param p5, "onAfterTerminate"    # Lio/reactivex/functions/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;",
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Ljava/lang/Throwable;",
            ">;",
            "Lio/reactivex/functions/Action;",
            "Lio/reactivex/functions/Action;",
            ")V"
        }
    .end annotation

    .prologue
    .line 61
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;, "Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    .local p2, "onNext":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    .local p3, "onError":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Ljava/lang/Throwable;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->actual:Lio/reactivex/Observer;

    .line 63
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->onNext:Lio/reactivex/functions/Consumer;

    .line 64
    iput-object p3, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->onError:Lio/reactivex/functions/Consumer;

    .line 65
    iput-object p4, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->onComplete:Lio/reactivex/functions/Action;

    .line 66
    iput-object p5, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->onAfterTerminate:Lio/reactivex/functions/Action;

    .line 67
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 80
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;, "Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 81
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 85
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;, "Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 131
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;, "Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver<TT;>;"
    iget-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->done:Z

    if-eqz v1, :cond_0

    .line 151
    :goto_0
    return-void

    .line 135
    :cond_0
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->onComplete:Lio/reactivex/functions/Action;

    invoke-interface {v1}, Lio/reactivex/functions/Action;->run()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 142
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->done:Z

    .line 143
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v1}, Lio/reactivex/Observer;->onComplete()V

    .line 146
    :try_start_1
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->onAfterTerminate:Lio/reactivex/functions/Action;

    invoke-interface {v1}, Lio/reactivex/functions/Action;->run()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 147
    :catch_0
    move-exception v0

    .line 148
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 149
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 136
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_1
    move-exception v0

    .line 137
    .restart local v0    # "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 138
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 5
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;, "Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver<TT;>;"
    const/4 v4, 0x1

    .line 108
    iget-boolean v2, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->done:Z

    if-eqz v2, :cond_0

    .line 109
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 127
    :goto_0
    return-void

    .line 112
    :cond_0
    iput-boolean v4, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->done:Z

    .line 114
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->onError:Lio/reactivex/functions/Consumer;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 119
    :goto_1
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 122
    :try_start_1
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->onAfterTerminate:Lio/reactivex/functions/Action;

    invoke-interface {v2}, Lio/reactivex/functions/Action;->run()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 123
    :catch_0
    move-exception v0

    .line 124
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 125
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 115
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_1
    move-exception v0

    .line 116
    .restart local v0    # "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 117
    new-instance v1, Lio/reactivex/exceptions/CompositeException;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Throwable;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    aput-object v0, v2, v4

    invoke-direct {v1, v2}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    .end local p1    # "t":Ljava/lang/Throwable;
    .local v1, "t":Ljava/lang/Throwable;
    move-object p1, v1

    .end local v1    # "t":Ljava/lang/Throwable;
    .restart local p1    # "t":Ljava/lang/Throwable;
    goto :goto_1
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 91
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;, "Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->done:Z

    if-eqz v1, :cond_0

    .line 104
    :goto_0
    return-void

    .line 95
    :cond_0
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->onNext:Lio/reactivex/functions/Consumer;

    invoke-interface {v1, p1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v1, p1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_0

    .line 96
    :catch_0
    move-exception v0

    .line 97
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 98
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 99
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 71
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;, "Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 72
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 73
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDoOnEach$DoOnEachObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 75
    :cond_0
    return-void
.end method
