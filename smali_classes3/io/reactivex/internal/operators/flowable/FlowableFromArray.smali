.class public final Lio/reactivex/internal/operators/flowable/FlowableFromArray;
.super Lio/reactivex/Flowable;
.source "FlowableFromArray.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription;,
        Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription;,
        Lio/reactivex/internal/operators/flowable/FlowableFromArray$BaseArraySubscription;
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
.field final array:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>([Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromArray;, "Lio/reactivex/internal/operators/flowable/FlowableFromArray<TT;>;"
    .local p1, "array":[Ljava/lang/Object;, "[TT;"
    invoke-direct {p0}, Lio/reactivex/Flowable;-><init>()V

    .line 29
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray;->array:[Ljava/lang/Object;

    .line 30
    return-void
.end method


# virtual methods
.method public subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 33
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromArray;, "Lio/reactivex/internal/operators/flowable/FlowableFromArray<TT;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    instance-of v0, p1, Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    if-eqz v0, :cond_0

    .line 34
    new-instance v1, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription;

    move-object v0, p1

    check-cast v0, Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray;->array:[Ljava/lang/Object;

    invoke-direct {v1, v0, v2}, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription;-><init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;[Ljava/lang/Object;)V

    invoke-interface {p1, v1}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 39
    :goto_0
    return-void

    .line 37
    :cond_0
    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription;

    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray;->array:[Ljava/lang/Object;

    invoke-direct {v0, p1, v1}, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription;-><init>(Lorg/reactivestreams/Subscriber;[Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    goto :goto_0
.end method
