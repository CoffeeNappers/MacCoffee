.class final Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;
.super Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;
.source "FlowableDoFinally.java"

# interfaces
.implements Lio/reactivex/internal/fuseable/ConditionalSubscriber;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableDoFinally;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "DoFinallyConditionalSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription",
        "<TT;>;",
        "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x3907ba0b13897e3dL


# instance fields
.field final actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final onFinally:Lio/reactivex/functions/Action;

.field qs:Lio/reactivex/internal/fuseable/QueueSubscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/QueueSubscription",
            "<TT;>;"
        }
    .end annotation
.end field

.field s:Lorg/reactivestreams/Subscription;

.field syncFused:Z


# direct methods
.method constructor <init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;Lio/reactivex/functions/Action;)V
    .locals 0
    .param p2, "onFinally"    # Lio/reactivex/functions/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
            "<-TT;>;",
            "Lio/reactivex/functions/Action;",
            ")V"
        }
    .end annotation

    .prologue
    .line 170
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber<TT;>;"
    .local p1, "actual":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-TT;>;"
    invoke-direct {p0}, Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;-><init>()V

    .line 171
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 172
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->onFinally:Lio/reactivex/functions/Action;

    .line 173
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 212
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 213
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->runFinally()V

    .line 214
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 236
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->qs:Lio/reactivex/internal/fuseable/QueueSubscription;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/QueueSubscription;->clear()V

    .line 237
    return-void
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 241
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->qs:Lio/reactivex/internal/fuseable/QueueSubscription;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/QueueSubscription;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 206
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onComplete()V

    .line 207
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->runFinally()V

    .line 208
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 200
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    .line 201
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->runFinally()V

    .line 202
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 190
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onNext(Ljava/lang/Object;)V

    .line 191
    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 178
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 179
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 180
    instance-of v0, p1, Lio/reactivex/internal/fuseable/QueueSubscription;

    if-eqz v0, :cond_0

    .line 181
    check-cast p1, Lio/reactivex/internal/fuseable/QueueSubscription;

    .end local p1    # "s":Lorg/reactivestreams/Subscription;
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->qs:Lio/reactivex/internal/fuseable/QueueSubscription;

    .line 184
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v0, p0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 186
    :cond_1
    return-void
.end method

.method public poll()Ljava/lang/Object;
    .locals 2
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
    .line 247
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber<TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->qs:Lio/reactivex/internal/fuseable/QueueSubscription;

    invoke-interface {v1}, Lio/reactivex/internal/fuseable/QueueSubscription;->poll()Ljava/lang/Object;

    move-result-object v0

    .line 248
    .local v0, "v":Ljava/lang/Object;, "TT;"
    if-nez v0, :cond_0

    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->syncFused:Z

    if-eqz v1, :cond_0

    .line 249
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->runFinally()V

    .line 251
    :cond_0
    return-object v0
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 218
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0, p1, p2}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 219
    return-void
.end method

.method public requestFusion(I)I
    .locals 5
    .param p1, "mode"    # I

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber<TT;>;"
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 223
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->qs:Lio/reactivex/internal/fuseable/QueueSubscription;

    .line 224
    .local v1, "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<TT;>;"
    if-eqz v1, :cond_2

    and-int/lit8 v4, p1, 0x4

    if-nez v4, :cond_2

    .line 225
    invoke-interface {v1, p1}, Lio/reactivex/internal/fuseable/QueueSubscription;->requestFusion(I)I

    move-result v0

    .line 226
    .local v0, "m":I
    if-eqz v0, :cond_0

    .line 227
    if-ne v0, v2, :cond_1

    :goto_0
    iput-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->syncFused:Z

    .line 231
    .end local v0    # "m":I
    :cond_0
    :goto_1
    return v0

    .restart local v0    # "m":I
    :cond_1
    move v2, v3

    .line 227
    goto :goto_0

    .end local v0    # "m":I
    :cond_2
    move v0, v3

    .line 231
    goto :goto_1
.end method

.method runFinally()V
    .locals 3

    .prologue
    .line 255
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber<TT;>;"
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->compareAndSet(II)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 257
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->onFinally:Lio/reactivex/functions/Action;

    invoke-interface {v1}, Lio/reactivex/functions/Action;->run()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 263
    :cond_0
    :goto_0
    return-void

    .line 258
    :catch_0
    move-exception v0

    .line 259
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 260
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public tryOnNext(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 195
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDoFinally$DoFinallyConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
