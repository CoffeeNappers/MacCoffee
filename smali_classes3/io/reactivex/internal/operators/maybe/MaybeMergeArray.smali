.class public final Lio/reactivex/internal/operators/maybe/MaybeMergeArray;
.super Lio/reactivex/Flowable;
.source "MaybeMergeArray.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/maybe/MaybeMergeArray$ClqSimpleQueue;,
        Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MpscFillOnceSimpleQueue;,
        Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;,
        Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Flowable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final sources:[Lio/reactivex/MaybeSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lio/reactivex/MaybeSource",
            "<+TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>([Lio/reactivex/MaybeSource;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lio/reactivex/MaybeSource",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMergeArray;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray<TT;>;"
    .local p1, "sources":[Lio/reactivex/MaybeSource;, "[Lio/reactivex/MaybeSource<+TT;>;"
    invoke-direct {p0}, Lio/reactivex/Flowable;-><init>()V

    .line 40
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray;->sources:[Lio/reactivex/MaybeSource;

    .line 41
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeMergeArray;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray<TT;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-object v4, p0, Lio/reactivex/internal/operators/maybe/MaybeMergeArray;->sources:[Lio/reactivex/MaybeSource;

    .line 46
    .local v4, "maybes":[Lio/reactivex/MaybeSource;, "[Lio/reactivex/MaybeSource<+TT;>;"
    array-length v5, v4

    .line 50
    .local v5, "n":I
    invoke-static {}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray;->bufferSize()I

    move-result v9

    if-gt v5, v9, :cond_1

    .line 51
    new-instance v7, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MpscFillOnceSimpleQueue;

    invoke-direct {v7, v5}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MpscFillOnceSimpleQueue;-><init>(I)V

    .line 55
    .local v7, "queue":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex<Ljava/lang/Object;>;"
    :goto_0
    new-instance v6, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;

    invoke-direct {v6, p1, v5, v7}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;-><init>(Lorg/reactivestreams/Subscriber;ILio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;)V

    .line 57
    .local v6, "parent":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver<TT;>;"
    invoke-interface {p1, v6}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 59
    iget-object v1, v6, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->error:Lio/reactivex/internal/util/AtomicThrowable;

    .line 61
    .local v1, "e":Lio/reactivex/internal/util/AtomicThrowable;
    move-object v0, v4

    .local v0, "arr$":[Lio/reactivex/MaybeSource;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_1
    if-ge v2, v3, :cond_0

    aget-object v8, v0, v2

    .line 62
    .local v8, "source":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<+TT;>;"
    invoke-virtual {v6}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;->isCancelled()Z

    move-result v9

    if-nez v9, :cond_0

    invoke-virtual {v1}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_2

    .line 68
    .end local v8    # "source":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<+TT;>;"
    :cond_0
    return-void

    .line 53
    .end local v0    # "arr$":[Lio/reactivex/MaybeSource;
    .end local v1    # "e":Lio/reactivex/internal/util/AtomicThrowable;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v6    # "parent":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver<TT;>;"
    .end local v7    # "queue":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex<Ljava/lang/Object;>;"
    :cond_1
    new-instance v7, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$ClqSimpleQueue;

    invoke-direct {v7}, Lio/reactivex/internal/operators/maybe/MaybeMergeArray$ClqSimpleQueue;-><init>()V

    .restart local v7    # "queue":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$SimpleQueueWithConsumerIndex<Ljava/lang/Object;>;"
    goto :goto_0

    .line 66
    .restart local v0    # "arr$":[Lio/reactivex/MaybeSource;
    .restart local v1    # "e":Lio/reactivex/internal/util/AtomicThrowable;
    .restart local v2    # "i$":I
    .restart local v3    # "len$":I
    .restart local v6    # "parent":Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver;, "Lio/reactivex/internal/operators/maybe/MaybeMergeArray$MergeMaybeObserver<TT;>;"
    .restart local v8    # "source":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<+TT;>;"
    :cond_2
    invoke-interface {v8, v6}, Lio/reactivex/MaybeSource;->subscribe(Lio/reactivex/MaybeObserver;)V

    .line 61
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method
