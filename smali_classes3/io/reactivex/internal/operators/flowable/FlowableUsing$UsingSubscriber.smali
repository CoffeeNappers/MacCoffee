.class final Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;
.super Ljava/util/concurrent/atomic/AtomicBoolean;
.source "FlowableUsing.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableUsing;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "UsingSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "D:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicBoolean;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x51f0e7a17ed319a6L


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final disposer:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer",
            "<-TD;>;"
        }
    .end annotation
.end field

.field final eager:Z

.field final resource:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TD;"
        }
    .end annotation
.end field

.field s:Lorg/reactivestreams/Subscription;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Ljava/lang/Object;Lio/reactivex/functions/Consumer;Z)V
    .locals 0
    .param p4, "eager"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;TD;",
            "Lio/reactivex/functions/Consumer",
            "<-TD;>;Z)V"
        }
    .end annotation

    .prologue
    .line 87
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber<TT;TD;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p2, "resource":Ljava/lang/Object;, "TD;"
    .local p3, "disposer":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TD;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 88
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 89
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->resource:Ljava/lang/Object;

    .line 90
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->disposer:Lio/reactivex/functions/Consumer;

    .line 91
    iput-boolean p4, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->eager:Z

    .line 92
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 162
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber<TT;TD;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->disposeAfter()V

    .line 163
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 164
    return-void
.end method

.method disposeAfter()V
    .locals 3

    .prologue
    .line 167
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber<TT;TD;>;"
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->compareAndSet(ZZ)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 169
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->disposer:Lio/reactivex/functions/Consumer;

    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->resource:Ljava/lang/Object;

    invoke-interface {v1, v2}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    :cond_0
    :goto_0
    return-void

    .line 170
    :catch_0
    move-exception v0

    .line 171
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 173
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onComplete()V
    .locals 3

    .prologue
    .line 135
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber<TT;TD;>;"
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->eager:Z

    if-eqz v1, :cond_1

    .line 136
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->compareAndSet(ZZ)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 138
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->disposer:Lio/reactivex/functions/Consumer;

    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->resource:Ljava/lang/Object;

    invoke-interface {v1, v2}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 147
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 153
    :goto_0
    return-void

    .line 139
    :catch_0
    move-exception v0

    .line 140
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 141
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 149
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_1
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 150
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 151
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->disposeAfter()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 7
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber<TT;TD;>;"
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 109
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->eager:Z

    if-eqz v2, :cond_2

    .line 110
    const/4 v1, 0x0

    .line 111
    .local v1, "innerError":Ljava/lang/Throwable;
    invoke-virtual {p0, v5, v6}, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->compareAndSet(ZZ)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 113
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->disposer:Lio/reactivex/functions/Consumer;

    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->resource:Ljava/lang/Object;

    invoke-interface {v2, v3}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    :cond_0
    :goto_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v2}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 121
    if-eqz v1, :cond_1

    .line 122
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    new-instance v3, Lio/reactivex/exceptions/CompositeException;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Throwable;

    aput-object p1, v4, v5

    aput-object v1, v4, v6

    invoke-direct {v3, v4}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-interface {v2, v3}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 131
    .end local v1    # "innerError":Ljava/lang/Throwable;
    :goto_1
    return-void

    .line 114
    .restart local v1    # "innerError":Ljava/lang/Throwable;
    :catch_0
    move-exception v0

    .line 115
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 116
    move-object v1, v0

    goto :goto_0

    .line 124
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_1
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v2, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 127
    .end local v1    # "innerError":Ljava/lang/Throwable;
    :cond_2
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v2, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 128
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v2}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 129
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->disposeAfter()V

    goto :goto_1
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 104
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber<TT;TD;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 105
    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 96
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber<TT;TD;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 97
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 98
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 100
    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 157
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber<TT;TD;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableUsing$UsingSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0, p1, p2}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 158
    return-void
.end method
