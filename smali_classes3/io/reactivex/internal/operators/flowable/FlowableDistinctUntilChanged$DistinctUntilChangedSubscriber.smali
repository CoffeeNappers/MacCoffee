.class final Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;
.super Lio/reactivex/internal/subscribers/BasicFuseableSubscriber;
.source "FlowableDistinctUntilChanged.java"

# interfaces
.implements Lio/reactivex/internal/fuseable/ConditionalSubscriber;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "DistinctUntilChangedSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "K:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscribers/BasicFuseableSubscriber",
        "<TT;TT;>;",
        "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final comparer:Lio/reactivex/functions/BiPredicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiPredicate",
            "<-TK;-TK;>;"
        }
    .end annotation
.end field

.field hasValue:Z

.field final keySelector:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;TK;>;"
        }
    .end annotation
.end field

.field last:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;Lio/reactivex/functions/BiPredicate;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;TK;>;",
            "Lio/reactivex/functions/BiPredicate",
            "<-TK;-TK;>;)V"
        }
    .end annotation

    .prologue
    .line 61
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber<TT;TK;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p2, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;TK;>;"
    .local p3, "comparer":Lio/reactivex/functions/BiPredicate;, "Lio/reactivex/functions/BiPredicate<-TK;-TK;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/subscribers/BasicFuseableSubscriber;-><init>(Lorg/reactivestreams/Subscriber;)V

    .line 62
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->keySelector:Lio/reactivex/functions/Function;

    .line 63
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->comparer:Lio/reactivex/functions/BiPredicate;

    .line 64
    return-void
.end method


# virtual methods
.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber<TT;TK;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 69
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->s:Lorg/reactivestreams/Subscription;

    const-wide/16 v2, 0x1

    invoke-interface {v0, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 71
    :cond_0
    return-void
.end method

.method public poll()Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber<TT;TK;>;"
    const/4 v6, 0x1

    .line 115
    :cond_0
    :goto_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->qs:Lio/reactivex/internal/fuseable/QueueSubscription;

    invoke-interface {v2}, Lio/reactivex/internal/fuseable/QueueSubscription;->poll()Ljava/lang/Object;

    move-result-object v1

    .line 116
    .local v1, "v":Ljava/lang/Object;, "TT;"
    if-nez v1, :cond_1

    .line 117
    const/4 v1, 0x0

    .line 128
    .end local v1    # "v":Ljava/lang/Object;, "TT;"
    :goto_1
    return-object v1

    .line 119
    .restart local v1    # "v":Ljava/lang/Object;, "TT;"
    :cond_1
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->keySelector:Lio/reactivex/functions/Function;

    invoke-interface {v2, v1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 120
    .local v0, "key":Ljava/lang/Object;, "TK;"
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->hasValue:Z

    if-nez v2, :cond_2

    .line 121
    iput-boolean v6, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->hasValue:Z

    .line 122
    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->last:Ljava/lang/Object;

    goto :goto_1

    .line 126
    :cond_2
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->comparer:Lio/reactivex/functions/BiPredicate;

    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->last:Ljava/lang/Object;

    invoke-interface {v2, v3, v0}, Lio/reactivex/functions/BiPredicate;->test(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 127
    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->last:Ljava/lang/Object;

    goto :goto_1

    .line 130
    :cond_3
    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->last:Ljava/lang/Object;

    .line 131
    iget v2, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->sourceMode:I

    if-eq v2, v6, :cond_0

    .line 132
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->s:Lorg/reactivestreams/Subscription;

    const-wide/16 v4, 0x1

    invoke-interface {v2, v4, v5}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0
.end method

.method public requestFusion(I)I
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 108
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber<TT;TK;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->transitiveBoundaryFusion(I)I

    move-result v0

    return v0
.end method

.method public tryOnNext(Ljava/lang/Object;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber<TT;TK;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 75
    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->done:Z

    if-eqz v5, :cond_1

    .line 103
    :cond_0
    :goto_0
    return v3

    .line 78
    :cond_1
    iget v5, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->sourceMode:I

    if-eqz v5, :cond_2

    .line 79
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    move v3, v4

    .line 80
    goto :goto_0

    .line 86
    :cond_2
    :try_start_0
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->keySelector:Lio/reactivex/functions/Function;

    invoke-interface {v5, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 87
    .local v2, "key":Ljava/lang/Object;, "TK;"
    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->hasValue:Z

    if-eqz v5, :cond_3

    .line 88
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->comparer:Lio/reactivex/functions/BiPredicate;

    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->last:Ljava/lang/Object;

    invoke-interface {v5, v6, v2}, Lio/reactivex/functions/BiPredicate;->test(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    .line 89
    .local v0, "equal":Z
    iput-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->last:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    if-nez v0, :cond_0

    .line 102
    .end local v0    # "equal":Z
    :goto_1
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    move v3, v4

    .line 103
    goto :goto_0

    .line 94
    :cond_3
    const/4 v3, 0x1

    :try_start_1
    iput-boolean v3, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->hasValue:Z

    .line 95
    iput-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->last:Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 97
    .end local v2    # "key":Ljava/lang/Object;, "TK;"
    :catch_0
    move-exception v1

    .line 98
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/flowable/FlowableDistinctUntilChanged$DistinctUntilChangedSubscriber;->fail(Ljava/lang/Throwable;)V

    move v3, v4

    .line 99
    goto :goto_0
.end method
