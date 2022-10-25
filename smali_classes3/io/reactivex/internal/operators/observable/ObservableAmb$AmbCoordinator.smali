.class final Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;
.super Ljava/lang/Object;
.source "ObservableAmb.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableAmb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "AmbCoordinator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
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

.field final observers:[Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver",
            "<TT;>;"
        }
    .end annotation
.end field

.field final winner:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method constructor <init>(Lio/reactivex/Observer;I)V
    .locals 1
    .param p2, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;I)V"
        }
    .end annotation

    .prologue
    .line 82
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator<TT;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;->winner:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 83
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;->actual:Lio/reactivex/Observer;

    .line 84
    new-array v0, p2, [Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver;

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;->observers:[Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver;

    .line 85
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 6

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator<TT;>;"
    const/4 v5, -0x1

    .line 125
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;->winner:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v4

    if-eq v4, v5, :cond_0

    .line 126
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;->winner:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicInteger;->lazySet(I)V

    .line 128
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;->observers:[Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver;

    .local v1, "arr$":[Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver;
    array-length v3, v1

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v0, v1, v2

    .line 129
    .local v0, "a":Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver<TT;>;"
    invoke-virtual {v0}, Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver;->dispose()V

    .line 128
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 132
    .end local v0    # "a":Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver;, "Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver<TT;>;"
    .end local v1    # "arr$":[Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :cond_0
    return-void
.end method

.method public isDisposed()Z
    .locals 2

    .prologue
    .line 136
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;->winner:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public subscribe([Lio/reactivex/ObservableSource;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 88
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator<TT;>;"
    .local p1, "sources":[Lio/reactivex/ObservableSource;, "[Lio/reactivex/ObservableSource<+TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;->observers:[Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver;

    .line 89
    .local v0, "as":[Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver;, "[Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver<TT;>;"
    array-length v2, v0

    .line 90
    .local v2, "len":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 91
    new-instance v3, Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver;

    add-int/lit8 v4, v1, 0x1

    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;->actual:Lio/reactivex/Observer;

    invoke-direct {v3, p0, v4, v5}, Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver;-><init>(Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;ILio/reactivex/Observer;)V

    aput-object v3, v0, v1

    .line 90
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 93
    :cond_0
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;->winner:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/concurrent/atomic/AtomicInteger;->lazySet(I)V

    .line 94
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;->actual:Lio/reactivex/Observer;

    invoke-interface {v3, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 96
    const/4 v1, 0x0

    :goto_1
    if-ge v1, v2, :cond_1

    .line 97
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;->winner:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    if-eqz v3, :cond_2

    .line 103
    :cond_1
    return-void

    .line 101
    :cond_2
    aget-object v3, p1, v1

    aget-object v4, v0, v1

    invoke-interface {v3, v4}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 96
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public win(I)Z
    .locals 7
    .param p1, "index"    # I

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator<TT;>;"
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 106
    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;->winner:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    .line 107
    .local v3, "w":I
    if-nez v3, :cond_3

    .line 108
    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;->winner:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v6, v5, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 109
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableAmb$AmbCoordinator;->observers:[Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver;

    .line 110
    .local v0, "a":[Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver;, "[Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver<TT;>;"
    array-length v2, v0

    .line 111
    .local v2, "n":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_2

    .line 112
    add-int/lit8 v5, v1, 0x1

    if-eq v5, p1, :cond_0

    .line 113
    aget-object v5, v0, v1

    invoke-virtual {v5}, Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver;->dispose()V

    .line 111
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v0    # "a":[Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver;, "[Lio/reactivex/internal/operators/observable/ObservableAmb$AmbInnerObserver<TT;>;"
    .end local v1    # "i":I
    .end local v2    # "n":I
    :cond_1
    move v4, v5

    .line 120
    :cond_2
    :goto_1
    return v4

    :cond_3
    if-eq v3, p1, :cond_2

    move v4, v5

    goto :goto_1
.end method
