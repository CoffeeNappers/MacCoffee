.class public final Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed;
.super Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream;
.source "FlowableTimeoutTimed.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed$EmptyDispose;,
        Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed$TimeoutTimedSubscriber;,
        Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed$TimeoutTimedOtherSubscriber;
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


# static fields
.field static final NEW_TIMER:Lio/reactivex/disposables/Disposable;


# instance fields
.field final other:Lorg/reactivestreams/Publisher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;"
        }
    .end annotation
.end field

.field final scheduler:Lio/reactivex/Scheduler;

.field final timeout:J

.field final unit:Ljava/util/concurrent/TimeUnit;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed$EmptyDispose;

    invoke-direct {v0}, Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed$EmptyDispose;-><init>()V

    sput-object v0, Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed;->NEW_TIMER:Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method public constructor <init>(Lio/reactivex/Flowable;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Lorg/reactivestreams/Publisher;)V
    .locals 0
    .param p2, "timeout"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Flowable",
            "<TT;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed;, "Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed<TT;>;"
    .local p1, "source":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    .local p6, "other":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream;-><init>(Lio/reactivex/Flowable;)V

    .line 41
    iput-wide p2, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed;->timeout:J

    .line 42
    iput-object p4, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed;->unit:Ljava/util/concurrent/TimeUnit;

    .line 43
    iput-object p5, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed;->scheduler:Lio/reactivex/Scheduler;

    .line 44
    iput-object p6, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed;->other:Lorg/reactivestreams/Publisher;

    .line 45
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
    .line 49
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed;, "Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed<TT;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed;->other:Lorg/reactivestreams/Publisher;

    if-nez v0, :cond_0

    .line 50
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed;->source:Lio/reactivex/Flowable;

    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed$TimeoutTimedSubscriber;

    new-instance v1, Lio/reactivex/subscribers/SerializedSubscriber;

    invoke-direct {v1, p1}, Lio/reactivex/subscribers/SerializedSubscriber;-><init>(Lorg/reactivestreams/Subscriber;)V

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed;->timeout:J

    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed;->unit:Ljava/util/concurrent/TimeUnit;

    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed;->scheduler:Lio/reactivex/Scheduler;

    invoke-virtual {v5}, Lio/reactivex/Scheduler;->createWorker()Lio/reactivex/Scheduler$Worker;

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed$TimeoutTimedSubscriber;-><init>(Lorg/reactivestreams/Subscriber;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler$Worker;)V

    invoke-virtual {v6, v0}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/FlowableSubscriber;)V

    .line 58
    :goto_0
    return-void

    .line 54
    :cond_0
    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed;->source:Lio/reactivex/Flowable;

    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed$TimeoutTimedOtherSubscriber;

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed;->timeout:J

    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed;->unit:Ljava/util/concurrent/TimeUnit;

    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed;->scheduler:Lio/reactivex/Scheduler;

    invoke-virtual {v1}, Lio/reactivex/Scheduler;->createWorker()Lio/reactivex/Scheduler$Worker;

    move-result-object v5

    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed;->other:Lorg/reactivestreams/Publisher;

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lio/reactivex/internal/operators/flowable/FlowableTimeoutTimed$TimeoutTimedOtherSubscriber;-><init>(Lorg/reactivestreams/Subscriber;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler$Worker;Lorg/reactivestreams/Publisher;)V

    invoke-virtual {v7, v0}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/FlowableSubscriber;)V

    goto :goto_0
.end method
