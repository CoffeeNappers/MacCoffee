.class public final Lio/reactivex/internal/operators/flowable/FlowableDelay;
.super Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream;
.source "FlowableDelay.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream",
        "<TT;TT;>;"
    }
.end annotation


# instance fields
.field final delay:J

.field final delayError:Z

.field final scheduler:Lio/reactivex/Scheduler;

.field final unit:Ljava/util/concurrent/TimeUnit;


# direct methods
.method public constructor <init>(Lio/reactivex/Flowable;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Z)V
    .locals 0
    .param p2, "delay"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "scheduler"    # Lio/reactivex/Scheduler;
    .param p6, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Flowable",
            "<TT;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDelay;, "Lio/reactivex/internal/operators/flowable/FlowableDelay<TT;>;"
    .local p1, "source":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream;-><init>(Lio/reactivex/Flowable;)V

    .line 33
    iput-wide p2, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay;->delay:J

    .line 34
    iput-object p4, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay;->unit:Ljava/util/concurrent/TimeUnit;

    .line 35
    iput-object p5, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay;->scheduler:Lio/reactivex/Scheduler;

    .line 36
    iput-boolean p6, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay;->delayError:Z

    .line 37
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDelay;, "Lio/reactivex/internal/operators/flowable/FlowableDelay<TT;>;"
    .local p1, "t":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay;->delayError:Z

    if-eqz v0, :cond_0

    .line 43
    move-object v1, p1

    .line 48
    .local v1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    :goto_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay;->scheduler:Lio/reactivex/Scheduler;

    invoke-virtual {v0}, Lio/reactivex/Scheduler;->createWorker()Lio/reactivex/Scheduler$Worker;

    move-result-object v5

    .line 50
    .local v5, "w":Lio/reactivex/Scheduler$Worker;
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay;->source:Lio/reactivex/Flowable;

    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay;->delay:J

    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay;->unit:Ljava/util/concurrent/TimeUnit;

    iget-boolean v6, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay;->delayError:Z

    invoke-direct/range {v0 .. v6}, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;-><init>(Lorg/reactivestreams/Subscriber;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler$Worker;Z)V

    invoke-virtual {v7, v0}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/FlowableSubscriber;)V

    .line 51
    return-void

    .line 45
    .end local v1    # "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .end local v5    # "w":Lio/reactivex/Scheduler$Worker;
    :cond_0
    new-instance v1, Lio/reactivex/subscribers/SerializedSubscriber;

    invoke-direct {v1, p1}, Lio/reactivex/subscribers/SerializedSubscriber;-><init>(Lorg/reactivestreams/Subscriber;)V

    .restart local v1    # "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    goto :goto_0
.end method
