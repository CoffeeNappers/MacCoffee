.class final Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;
.super Lio/reactivex/internal/observers/BasicQueueDisposable;
.source "ObservableFromIterable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableFromIterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "FromIterableDisposable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/observers/BasicQueueDisposable",
        "<TT;>;"
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

.field checkNext:Z

.field volatile disposed:Z

.field done:Z

.field fusionMode:Z

.field final it:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<+TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Ljava/util/Iterator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;",
            "Ljava/util/Iterator",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 76
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;, "Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    .local p2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+TT;>;"
    invoke-direct {p0}, Lio/reactivex/internal/observers/BasicQueueDisposable;-><init>()V

    .line 77
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->actual:Lio/reactivex/Observer;

    .line 78
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->it:Ljava/util/Iterator;

    .line 79
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 151
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;, "Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->done:Z

    .line 152
    return-void
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 156
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;, "Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->disposed:Z

    .line 157
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 161
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;, "Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->disposed:Z

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 146
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;, "Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->done:Z

    return v0
.end method

.method public poll()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;, "Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable<TT;>;"
    const/4 v0, 0x0

    const/4 v2, 0x1

    .line 129
    iget-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->done:Z

    if-eqz v1, :cond_0

    .line 141
    :goto_0
    return-object v0

    .line 132
    :cond_0
    iget-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->checkNext:Z

    if-eqz v1, :cond_1

    .line 133
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->it:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_2

    .line 134
    iput-boolean v2, p0, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->done:Z

    goto :goto_0

    .line 138
    :cond_1
    iput-boolean v2, p0, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->checkNext:Z

    .line 141
    :cond_2
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->it:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    const-string/jumbo v1, "The iterator returned a null value"

    invoke-static {v0, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public requestFusion(I)I
    .locals 2
    .param p1, "mode"    # I

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;, "Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable<TT;>;"
    const/4 v0, 0x1

    .line 119
    and-int/lit8 v1, p1, 0x1

    if-eqz v1, :cond_0

    .line 120
    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->fusionMode:Z

    .line 123
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method run()V
    .locals 5

    .prologue
    .line 85
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;, "Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable<TT;>;"
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->isDisposed()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 115
    :cond_1
    :goto_0
    return-void

    .line 91
    :cond_2
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->it:Ljava/util/Iterator;

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    const-string/jumbo v4, "The iterator returned a null value"

    invoke-static {v3, v4}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 98
    .local v2, "v":Ljava/lang/Object;, "TT;"
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->actual:Lio/reactivex/Observer;

    invoke-interface {v3, v2}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 100
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->isDisposed()Z

    move-result v3

    if-nez v3, :cond_1

    .line 104
    :try_start_1
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->it:Ljava/util/Iterator;

    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result v1

    .line 110
    .local v1, "hasNext":Z
    if-nez v1, :cond_0

    .line 112
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->isDisposed()Z

    move-result v3

    if-nez v3, :cond_1

    .line 113
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->actual:Lio/reactivex/Observer;

    invoke-interface {v3}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0

    .line 92
    .end local v1    # "hasNext":Z
    .end local v2    # "v":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v0

    .line 93
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 94
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->actual:Lio/reactivex/Observer;

    invoke-interface {v3, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 105
    .end local v0    # "e":Ljava/lang/Throwable;
    .restart local v2    # "v":Ljava/lang/Object;, "TT;"
    :catch_1
    move-exception v0

    .line 106
    .restart local v0    # "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 107
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableFromIterable$FromIterableDisposable;->actual:Lio/reactivex/Observer;

    invoke-interface {v3, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
