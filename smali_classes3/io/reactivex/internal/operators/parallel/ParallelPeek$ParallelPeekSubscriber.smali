.class final Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;
.super Ljava/lang/Object;
.source "ParallelPeek.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/parallel/ParallelPeek;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ParallelPeekSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field done:Z

.field final parent:Lio/reactivex/internal/operators/parallel/ParallelPeek;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/operators/parallel/ParallelPeek",
            "<TT;>;"
        }
    .end annotation
.end field

.field s:Lorg/reactivestreams/Subscription;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/internal/operators/parallel/ParallelPeek;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Lio/reactivex/internal/operators/parallel/ParallelPeek",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 98
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p2, "parent":Lio/reactivex/internal/operators/parallel/ParallelPeek;, "Lio/reactivex/internal/operators/parallel/ParallelPeek<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 100
    iput-object p2, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->parent:Lio/reactivex/internal/operators/parallel/ParallelPeek;

    .line 101
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .prologue
    .line 117
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber<TT;>;"
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->parent:Lio/reactivex/internal/operators/parallel/ParallelPeek;

    iget-object v1, v1, Lio/reactivex/internal/operators/parallel/ParallelPeek;->onCancel:Lio/reactivex/functions/Action;

    invoke-interface {v1}, Lio/reactivex/functions/Action;->run()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    :goto_0
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 123
    return-void

    .line 118
    :catch_0
    move-exception v0

    .line 119
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 120
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 192
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber<TT;>;"
    iget-boolean v1, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->done:Z

    if-nez v1, :cond_0

    .line 193
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->done:Z

    .line 195
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->parent:Lio/reactivex/internal/operators/parallel/ParallelPeek;

    iget-object v1, v1, Lio/reactivex/internal/operators/parallel/ParallelPeek;->onComplete:Lio/reactivex/functions/Action;

    invoke-interface {v1}, Lio/reactivex/functions/Action;->run()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 201
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 204
    :try_start_1
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->parent:Lio/reactivex/internal/operators/parallel/ParallelPeek;

    iget-object v1, v1, Lio/reactivex/internal/operators/parallel/ParallelPeek;->onAfterTerminated:Lio/reactivex/functions/Action;

    invoke-interface {v1}, Lio/reactivex/functions/Action;->run()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 210
    :cond_0
    :goto_0
    return-void

    .line 196
    :catch_0
    move-exception v0

    .line 197
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 198
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 205
    .end local v0    # "ex":Ljava/lang/Throwable;
    :catch_1
    move-exception v0

    .line 206
    .restart local v0    # "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 207
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 5
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber<TT;>;"
    const/4 v4, 0x1

    .line 168
    iget-boolean v2, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->done:Z

    if-eqz v2, :cond_0

    .line 169
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 188
    :goto_0
    return-void

    .line 172
    :cond_0
    iput-boolean v4, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->done:Z

    .line 175
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->parent:Lio/reactivex/internal/operators/parallel/ParallelPeek;

    iget-object v2, v2, Lio/reactivex/internal/operators/parallel/ParallelPeek;->onError:Lio/reactivex/functions/Consumer;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 180
    :goto_1
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v2, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 183
    :try_start_1
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->parent:Lio/reactivex/internal/operators/parallel/ParallelPeek;

    iget-object v2, v2, Lio/reactivex/internal/operators/parallel/ParallelPeek;->onAfterTerminated:Lio/reactivex/functions/Action;

    invoke-interface {v2}, Lio/reactivex/functions/Action;->run()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 184
    :catch_0
    move-exception v0

    .line 185
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 186
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 176
    .end local v0    # "ex":Ljava/lang/Throwable;
    :catch_1
    move-exception v0

    .line 177
    .restart local v0    # "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 178
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
    .line 146
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v1, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->done:Z

    if-nez v1, :cond_0

    .line 148
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->parent:Lio/reactivex/internal/operators/parallel/ParallelPeek;

    iget-object v1, v1, Lio/reactivex/internal/operators/parallel/ParallelPeek;->onNext:Lio/reactivex/functions/Consumer;

    invoke-interface {v1, p1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 155
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 158
    :try_start_1
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->parent:Lio/reactivex/internal/operators/parallel/ParallelPeek;

    iget-object v1, v1, Lio/reactivex/internal/operators/parallel/ParallelPeek;->onAfterNext:Lio/reactivex/functions/Consumer;

    invoke-interface {v1, p1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 164
    :cond_0
    :goto_0
    return-void

    .line 149
    :catch_0
    move-exception v0

    .line 150
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 151
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 159
    .end local v0    # "ex":Ljava/lang/Throwable;
    :catch_1
    move-exception v0

    .line 160
    .restart local v0    # "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 161
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 3
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 127
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber<TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v1, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 128
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 131
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->parent:Lio/reactivex/internal/operators/parallel/ParallelPeek;

    iget-object v1, v1, Lio/reactivex/internal/operators/parallel/ParallelPeek;->onSubscribe:Lio/reactivex/functions/Consumer;

    invoke-interface {v1, p1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 142
    :cond_0
    :goto_0
    return-void

    .line 132
    :catch_0
    move-exception v0

    .line 133
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 134
    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 135
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    sget-object v2, Lio/reactivex/internal/subscriptions/EmptySubscription;->INSTANCE:Lio/reactivex/internal/subscriptions/EmptySubscription;

    invoke-interface {v1, v2}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 136
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public request(J)V
    .locals 3
    .param p1, "n"    # J

    .prologue
    .line 106
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber<TT;>;"
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->parent:Lio/reactivex/internal/operators/parallel/ParallelPeek;

    iget-object v1, v1, Lio/reactivex/internal/operators/parallel/ParallelPeek;->onRequest:Lio/reactivex/functions/LongConsumer;

    invoke-interface {v1, p1, p2}, Lio/reactivex/functions/LongConsumer;->accept(J)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    :goto_0
    iget-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelPeek$ParallelPeekSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v1, p1, p2}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 112
    return-void

    .line 107
    :catch_0
    move-exception v0

    .line 108
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 109
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
