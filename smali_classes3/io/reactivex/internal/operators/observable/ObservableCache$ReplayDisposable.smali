.class final Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "ObservableCache.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ReplayDisposable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x61f4da70baa2c698L


# instance fields
.field volatile cancelled:Z

.field final child:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TT;>;"
        }
    .end annotation
.end field

.field currentBuffer:[Ljava/lang/Object;

.field currentIndexInBuffer:I

.field index:I

.field final state:Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/operators/observable/ObservableCache$CacheState",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;",
            "Lio/reactivex/internal/operators/observable/ObservableCache$CacheState",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 290
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;, "Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable<TT;>;"
    .local p1, "child":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    .local p2, "state":Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;, "Lio/reactivex/internal/operators/observable/ObservableCache$CacheState<TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 291
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->child:Lio/reactivex/Observer;

    .line 292
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->state:Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;

    .line 293
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 301
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;, "Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->cancelled:Z

    if-nez v0, :cond_0

    .line 302
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->cancelled:Z

    .line 303
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->state:Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;

    invoke-virtual {v0, p0}, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->removeChild(Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;)V

    .line 305
    :cond_0
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 297
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;, "Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->cancelled:Z

    return v0
.end method

.method public replay()V
    .locals 9

    .prologue
    .line 312
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;, "Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->getAndIncrement()I

    move-result v8

    if-eqz v8, :cond_1

    .line 373
    :cond_0
    :goto_0
    return-void

    .line 316
    :cond_1
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->child:Lio/reactivex/Observer;

    .line 317
    .local v1, "child":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    const/4 v4, 0x1

    .line 321
    .local v4, "missed":I
    :cond_2
    iget-boolean v8, p0, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->cancelled:Z

    if-nez v8, :cond_0

    .line 327
    iget-object v8, p0, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->state:Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;

    invoke-virtual {v8}, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->size()I

    move-result v7

    .line 328
    .local v7, "s":I
    if-eqz v7, :cond_6

    .line 329
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->currentBuffer:[Ljava/lang/Object;

    .line 332
    .local v0, "b":[Ljava/lang/Object;
    if-nez v0, :cond_3

    .line 333
    iget-object v8, p0, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->state:Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;

    invoke-virtual {v8}, Lio/reactivex/internal/operators/observable/ObservableCache$CacheState;->head()[Ljava/lang/Object;

    move-result-object v0

    .line 334
    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->currentBuffer:[Ljava/lang/Object;

    .line 336
    :cond_3
    array-length v8, v0

    add-int/lit8 v5, v8, -0x1

    .line 337
    .local v5, "n":I
    iget v2, p0, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->index:I

    .line 338
    .local v2, "j":I
    iget v3, p0, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->currentIndexInBuffer:I

    .line 340
    .local v3, "k":I
    :goto_1
    if-ge v2, v7, :cond_5

    .line 341
    iget-boolean v8, p0, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->cancelled:Z

    if-nez v8, :cond_0

    .line 344
    if-ne v3, v5, :cond_4

    .line 345
    aget-object v8, v0, v5

    check-cast v8, [Ljava/lang/Object;

    move-object v0, v8

    check-cast v0, [Ljava/lang/Object;

    .line 346
    const/4 v3, 0x0

    .line 348
    :cond_4
    aget-object v6, v0, v3

    .line 350
    .local v6, "o":Ljava/lang/Object;
    invoke-static {v6, v1}, Lio/reactivex/internal/util/NotificationLite;->accept(Ljava/lang/Object;Lio/reactivex/Observer;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 354
    add-int/lit8 v3, v3, 0x1

    .line 355
    add-int/lit8 v2, v2, 0x1

    .line 356
    goto :goto_1

    .line 358
    .end local v6    # "o":Ljava/lang/Object;
    :cond_5
    iget-boolean v8, p0, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->cancelled:Z

    if-nez v8, :cond_0

    .line 362
    iput v2, p0, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->index:I

    .line 363
    iput v3, p0, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->currentIndexInBuffer:I

    .line 364
    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->currentBuffer:[Ljava/lang/Object;

    .line 368
    .end local v0    # "b":[Ljava/lang/Object;
    .end local v2    # "j":I
    .end local v3    # "k":I
    .end local v5    # "n":I
    :cond_6
    neg-int v8, v4

    invoke-virtual {p0, v8}, Lio/reactivex/internal/operators/observable/ObservableCache$ReplayDisposable;->addAndGet(I)I

    move-result v4

    .line 369
    if-nez v4, :cond_2

    goto :goto_0
.end method
