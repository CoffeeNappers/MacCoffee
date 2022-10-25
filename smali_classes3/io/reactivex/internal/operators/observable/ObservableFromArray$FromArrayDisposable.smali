.class final Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;
.super Lio/reactivex/internal/observers/BasicQueueDisposable;
.source "ObservableFromArray.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableFromArray;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "FromArrayDisposable"
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

.field final array:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field

.field volatile disposed:Z

.field fusionMode:Z

.field index:I


# direct methods
.method constructor <init>(Lio/reactivex/Observer;[Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;[TT;)V"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;, "Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    .local p2, "array":[Ljava/lang/Object;, "[TT;"
    invoke-direct {p0}, Lio/reactivex/internal/observers/BasicQueueDisposable;-><init>()V

    .line 52
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;->actual:Lio/reactivex/Observer;

    .line 53
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;->array:[Ljava/lang/Object;

    .line 54
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 84
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;, "Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;->array:[Ljava/lang/Object;

    array-length v0, v0

    iput v0, p0, Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;->index:I

    .line 85
    return-void
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 89
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;, "Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;->disposed:Z

    .line 90
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 94
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;, "Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;->disposed:Z

    return v0
.end method

.method public isEmpty()Z
    .locals 2

    .prologue
    .line 79
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;, "Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable<TT;>;"
    iget v0, p0, Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;->index:I

    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;->array:[Ljava/lang/Object;

    array-length v1, v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public poll()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 68
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;, "Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable<TT;>;"
    iget v1, p0, Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;->index:I

    .line 69
    .local v1, "i":I
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;->array:[Ljava/lang/Object;

    .line 70
    .local v0, "a":[Ljava/lang/Object;, "[TT;"
    array-length v2, v0

    if-eq v1, v2, :cond_0

    .line 71
    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;->index:I

    .line 72
    aget-object v2, v0, v1

    const-string/jumbo v3, "The array element is null"

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 74
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public requestFusion(I)I
    .locals 2
    .param p1, "mode"    # I

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;, "Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable<TT;>;"
    const/4 v0, 0x1

    .line 58
    and-int/lit8 v1, p1, 0x1

    if-eqz v1, :cond_0

    .line 59
    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;->fusionMode:Z

    .line 62
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method run()V
    .locals 8

    .prologue
    .line 98
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;, "Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;->array:[Ljava/lang/Object;

    .line 99
    .local v0, "a":[Ljava/lang/Object;, "[TT;"
    array-length v2, v0

    .line 101
    .local v2, "n":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_2

    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;->isDisposed()Z

    move-result v4

    if-nez v4, :cond_2

    .line 102
    aget-object v3, v0, v1

    .line 103
    .local v3, "value":Ljava/lang/Object;, "TT;"
    if-nez v3, :cond_1

    .line 104
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;->actual:Lio/reactivex/Observer;

    new-instance v5, Ljava/lang/NullPointerException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "The "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "th element is null"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-interface {v4, v5}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 112
    .end local v3    # "value":Ljava/lang/Object;, "TT;"
    :cond_0
    :goto_1
    return-void

    .line 107
    .restart local v3    # "value":Ljava/lang/Object;, "TT;"
    :cond_1
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;->actual:Lio/reactivex/Observer;

    invoke-interface {v4, v3}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 101
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 109
    .end local v3    # "value":Ljava/lang/Object;, "TT;"
    :cond_2
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;->isDisposed()Z

    move-result v4

    if-nez v4, :cond_0

    .line 110
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableFromArray$FromArrayDisposable;->actual:Lio/reactivex/Observer;

    invoke-interface {v4}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_1
.end method
