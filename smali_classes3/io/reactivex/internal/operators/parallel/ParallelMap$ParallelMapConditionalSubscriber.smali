.class final Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;
.super Ljava/lang/Object;
.source "ParallelMap.java"

# interfaces
.implements Lio/reactivex/internal/fuseable/ConditionalSubscriber;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/parallel/ParallelMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ParallelMapConditionalSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# instance fields
.field final actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
            "<-TR;>;"
        }
    .end annotation
.end field

.field done:Z

.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+TR;>;"
        }
    .end annotation
.end field

.field s:Lorg/reactivestreams/Subscription;


# direct methods
.method constructor <init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;Lio/reactivex/functions/Function;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
            "<-TR;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TR;>;)V"
        }
    .end annotation

    .prologue
    .line 154
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber<TT;TR;>;"
    .local p1, "actual":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-TR;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TR;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 155
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 156
    iput-object p2, p0, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->mapper:Lio/reactivex/functions/Function;

    .line 157
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 166
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 167
    return-void
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 228
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 233
    :goto_0
    return-void

    .line 231
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->done:Z

    .line 232
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onComplete()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 218
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 219
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 224
    :goto_0
    return-void

    .line 222
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->done:Z

    .line 223
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 180
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber<TT;TR;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v2, p0, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->done:Z

    if-eqz v2, :cond_0

    .line 195
    :goto_0
    return-void

    .line 186
    :cond_0
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "The mapper returned a null value"

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 194
    .local v1, "v":Ljava/lang/Object;, "TR;"
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v2, v1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onNext(Ljava/lang/Object;)V

    goto :goto_0

    .line 187
    .end local v1    # "v":Ljava/lang/Object;, "TR;"
    :catch_0
    move-exception v0

    .line 188
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 189
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->cancel()V

    .line 190
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 171
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 172
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 174
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v0, p0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 176
    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 161
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0, p1, p2}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 162
    return-void
.end method

.method public tryOnNext(Ljava/lang/Object;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber<TT;TR;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v2, 0x0

    .line 199
    iget-boolean v3, p0, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->done:Z

    if-eqz v3, :cond_0

    .line 213
    :goto_0
    return v2

    .line 205
    :cond_0
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v3, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const-string/jumbo v4, "The mapper returned a null value"

    invoke-static {v3, v4}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 213
    .local v1, "v":Ljava/lang/Object;, "TR;"
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v2, v1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_0

    .line 206
    .end local v1    # "v":Ljava/lang/Object;, "TR;"
    :catch_0
    move-exception v0

    .line 207
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 208
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->cancel()V

    .line 209
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/parallel/ParallelMap$ParallelMapConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
