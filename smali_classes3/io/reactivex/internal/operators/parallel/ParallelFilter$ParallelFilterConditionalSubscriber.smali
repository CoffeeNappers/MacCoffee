.class final Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber;
.super Lio/reactivex/internal/operators/parallel/ParallelFilter$BaseFilterSubscriber;
.source "ParallelFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/parallel/ParallelFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ParallelFilterConditionalSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/parallel/ParallelFilter$BaseFilterSubscriber",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
            "<-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;Lio/reactivex/functions/Predicate;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
            "<-TT;>;",
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 161
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber<TT;>;"
    .local p1, "actual":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-TT;>;"
    .local p2, "predicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-TT;>;"
    invoke-direct {p0, p2}, Lio/reactivex/internal/operators/parallel/ParallelFilter$BaseFilterSubscriber;-><init>(Lio/reactivex/functions/Predicate;)V

    .line 162
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 163
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 1

    .prologue
    .line 207
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber;->done:Z

    if-nez v0, :cond_0

    .line 208
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber;->done:Z

    .line 209
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onComplete()V

    .line 211
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 197
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 198
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 203
    :goto_0
    return-void

    .line 201
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber;->done:Z

    .line 202
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 167
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 168
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 170
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v0, p0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 172
    :cond_0
    return-void
.end method

.method public tryOnNext(Ljava/lang/Object;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v2, 0x0

    .line 176
    iget-boolean v3, p0, Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber;->done:Z

    if-nez v3, :cond_0

    .line 180
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber;->predicate:Lio/reactivex/functions/Predicate;

    invoke-interface {v3, p1}, Lio/reactivex/functions/Predicate;->test(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 188
    .local v0, "b":Z
    if-eqz v0, :cond_0

    .line 189
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v2, p1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v2

    .line 192
    .end local v0    # "b":Z
    :cond_0
    :goto_0
    return v2

    .line 181
    :catch_0
    move-exception v1

    .line 182
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 183
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber;->cancel()V

    .line 184
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/parallel/ParallelFilter$ParallelFilterConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
