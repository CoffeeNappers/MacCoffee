.class final Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$RepeatWhenSubscriber;
.super Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$WhenSourceSubscriber;
.source "FlowableRepeatWhen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "RepeatWhenSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$WhenSourceSubscriber",
        "<TT;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x2531bbef65964705L


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/processors/FlowableProcessor;Lorg/reactivestreams/Subscription;)V
    .locals 0
    .param p3, "receiver"    # Lorg/reactivestreams/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Lio/reactivex/processors/FlowableProcessor",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Lorg/reactivestreams/Subscription;",
            ")V"
        }
    .end annotation

    .prologue
    .line 187
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$RepeatWhenSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$RepeatWhenSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p2, "processor":Lio/reactivex/processors/FlowableProcessor;, "Lio/reactivex/processors/FlowableProcessor<Ljava/lang/Object;>;"
    invoke-direct {p0, p1, p2, p3}, Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$WhenSourceSubscriber;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/processors/FlowableProcessor;Lorg/reactivestreams/Subscription;)V

    .line 188
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 1

    .prologue
    .line 198
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$RepeatWhenSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$RepeatWhenSubscriber<TT;>;"
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$RepeatWhenSubscriber;->again(Ljava/lang/Object;)V

    .line 199
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 192
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$RepeatWhenSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$RepeatWhenSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$RepeatWhenSubscriber;->receiver:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 193
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRepeatWhen$RepeatWhenSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 194
    return-void
.end method
