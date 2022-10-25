.class public final Lio/reactivex/internal/operators/flowable/FlowableCombineLatest;
.super Lio/reactivex/Flowable;
.source "FlowableCombineLatest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$SingletonArrayFunc;,
        Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestInnerSubscriber;,
        Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Flowable",
        "<TR;>;"
    }
.end annotation


# instance fields
.field final array:[Lorg/reactivestreams/Publisher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field

.field final bufferSize:I

.field final combiner:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;"
        }
    .end annotation
.end field

.field final delayErrors:Z

.field final iterable:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;>;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Iterable;Lio/reactivex/functions/Function;IZ)V
    .locals 1
    .param p1    # Ljava/lang/Iterable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p2    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p3, "bufferSize"    # I
    .param p4, "delayErrors"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;IZ)V"
        }
    .end annotation

    .prologue
    .line 65
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCombineLatest;, "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest<TT;TR;>;"
    .local p1, "iterable":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lorg/reactivestreams/Publisher<+TT;>;>;"
    .local p2, "combiner":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    invoke-direct {p0}, Lio/reactivex/Flowable;-><init>()V

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest;->array:[Lorg/reactivestreams/Publisher;

    .line 67
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest;->iterable:Ljava/lang/Iterable;

    .line 68
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest;->combiner:Lio/reactivex/functions/Function;

    .line 69
    iput p3, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest;->bufferSize:I

    .line 70
    iput-boolean p4, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest;->delayErrors:Z

    .line 71
    return-void
.end method

.method public constructor <init>([Lorg/reactivestreams/Publisher;Lio/reactivex/functions/Function;IZ)V
    .locals 1
    .param p1    # [Lorg/reactivestreams/Publisher;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p2    # Lio/reactivex/functions/Function;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p3, "bufferSize"    # I
    .param p4, "delayErrors"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;IZ)V"
        }
    .end annotation

    .prologue
    .line 55
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCombineLatest;, "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest<TT;TR;>;"
    .local p1, "array":[Lorg/reactivestreams/Publisher;, "[Lorg/reactivestreams/Publisher<+TT;>;"
    .local p2, "combiner":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    invoke-direct {p0}, Lio/reactivex/Flowable;-><init>()V

    .line 56
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest;->array:[Lorg/reactivestreams/Publisher;

    .line 57
    const/4 v0, 0x0

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest;->iterable:Ljava/lang/Iterable;

    .line 58
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest;->combiner:Lio/reactivex/functions/Function;

    .line 59
    iput p3, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest;->bufferSize:I

    .line 60
    iput-boolean p4, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest;->delayErrors:Z

    .line 61
    return-void
.end method


# virtual methods
.method public subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCombineLatest;, "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest<TT;TR;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    const/4 v4, 0x0

    .line 76
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest;->array:[Lorg/reactivestreams/Publisher;

    .line 78
    .local v6, "a":[Lorg/reactivestreams/Publisher;, "[Lorg/reactivestreams/Publisher<+TT;>;"
    if-nez v6, :cond_2

    .line 79
    const/4 v3, 0x0

    .line 80
    .local v3, "n":I
    const/16 v1, 0x8

    new-array v6, v1, [Lorg/reactivestreams/Publisher;

    .line 85
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest;->iterable:Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const-string/jumbo v2, "The iterator returned is null"

    invoke-static {v1, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Iterator;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .local v10, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+Lorg/reactivestreams/Publisher<+TT;>;>;"
    move v11, v3

    .line 97
    .end local v3    # "n":I
    .local v11, "n":I
    :goto_0
    :try_start_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result v7

    .line 104
    .local v7, "b":Z
    if-nez v7, :cond_0

    move v3, v11

    .line 130
    .end local v7    # "b":Z
    .end local v10    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+Lorg/reactivestreams/Publisher<+TT;>;>;"
    .end local v11    # "n":I
    .restart local v3    # "n":I
    :goto_1
    if-nez v3, :cond_3

    .line 131
    invoke-static {p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->complete(Lorg/reactivestreams/Subscriber;)V

    .line 146
    :goto_2
    return-void

    .line 86
    :catch_0
    move-exception v9

    .line 87
    .local v9, "e":Ljava/lang/Throwable;
    invoke-static {v9}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 88
    invoke-static {v9, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    goto :goto_2

    .line 98
    .end local v3    # "n":I
    .end local v9    # "e":Ljava/lang/Throwable;
    .restart local v10    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+Lorg/reactivestreams/Publisher<+TT;>;>;"
    .restart local v11    # "n":I
    :catch_1
    move-exception v9

    .line 99
    .restart local v9    # "e":Ljava/lang/Throwable;
    invoke-static {v9}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 100
    invoke-static {v9, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    move v3, v11

    .line 101
    .end local v11    # "n":I
    .restart local v3    # "n":I
    goto :goto_2

    .line 111
    .end local v3    # "n":I
    .end local v9    # "e":Ljava/lang/Throwable;
    .restart local v7    # "b":Z
    .restart local v11    # "n":I
    :cond_0
    :try_start_2
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    const-string/jumbo v2, "The publisher returned by the iterator is null"

    invoke-static {v1, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/reactivestreams/Publisher;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    .line 118
    .local v12, "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    array-length v1, v6

    if-ne v11, v1, :cond_1

    .line 119
    shr-int/lit8 v1, v11, 0x2

    add-int/2addr v1, v11

    new-array v8, v1, [Lorg/reactivestreams/Publisher;

    .line 120
    .local v8, "c":[Lorg/reactivestreams/Publisher;, "[Lorg/reactivestreams/Publisher<+TT;>;"
    invoke-static {v6, v4, v8, v4, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 121
    move-object v6, v8

    .line 123
    .end local v8    # "c":[Lorg/reactivestreams/Publisher;, "[Lorg/reactivestreams/Publisher<+TT;>;"
    :cond_1
    add-int/lit8 v3, v11, 0x1

    .end local v11    # "n":I
    .restart local v3    # "n":I
    aput-object v12, v6, v11

    move v11, v3

    .line 124
    .end local v3    # "n":I
    .restart local v11    # "n":I
    goto :goto_0

    .line 112
    .end local v12    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    :catch_2
    move-exception v9

    .line 113
    .restart local v9    # "e":Ljava/lang/Throwable;
    invoke-static {v9}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 114
    invoke-static {v9, p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->error(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;)V

    move v3, v11

    .line 115
    .end local v11    # "n":I
    .restart local v3    # "n":I
    goto :goto_2

    .line 127
    .end local v3    # "n":I
    .end local v7    # "b":Z
    .end local v9    # "e":Ljava/lang/Throwable;
    .end local v10    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+Lorg/reactivestreams/Publisher<+TT;>;>;"
    :cond_2
    array-length v3, v6

    .restart local v3    # "n":I
    goto :goto_1

    .line 134
    :cond_3
    const/4 v1, 0x1

    if-ne v3, v1, :cond_4

    .line 135
    aget-object v1, v6, v4

    new-instance v2, Lio/reactivex/internal/operators/flowable/FlowableMap$MapSubscriber;

    new-instance v4, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$SingletonArrayFunc;

    invoke-direct {v4, p0}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$SingletonArrayFunc;-><init>(Lio/reactivex/internal/operators/flowable/FlowableCombineLatest;)V

    invoke-direct {v2, p1, v4}, Lio/reactivex/internal/operators/flowable/FlowableMap$MapSubscriber;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;)V

    invoke-interface {v1, v2}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    goto :goto_2

    .line 140
    :cond_4
    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;

    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest;->combiner:Lio/reactivex/functions/Function;

    iget v4, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest;->bufferSize:I

    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest;->delayErrors:Z

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;IIZ)V

    .line 143
    .local v0, "coordinator":Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator<TT;TR;>;"
    invoke-interface {p1, v0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 145
    invoke-virtual {v0, v6, v3}, Lio/reactivex/internal/operators/flowable/FlowableCombineLatest$CombineLatestCoordinator;->subscribe([Lorg/reactivestreams/Publisher;I)V

    goto :goto_2
.end method
