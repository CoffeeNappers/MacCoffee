.class public final Lio/reactivex/internal/operators/flowable/FlowableTimer;
.super Lio/reactivex/Flowable;
.source "FlowableTimer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableTimer$TimerSubscriber;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/reactivex/Flowable",
        "<",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# instance fields
.field final delay:J

.field final scheduler:Lio/reactivex/Scheduler;

.field final unit:Ljava/util/concurrent/TimeUnit;


# direct methods
.method public constructor <init>(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)V
    .locals 1
    .param p1, "delay"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lio/reactivex/Scheduler;

    .prologue
    .line 31
    invoke-direct {p0}, Lio/reactivex/Flowable;-><init>()V

    .line 32
    iput-wide p1, p0, Lio/reactivex/internal/operators/flowable/FlowableTimer;->delay:J

    .line 33
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableTimer;->unit:Ljava/util/concurrent/TimeUnit;

    .line 34
    iput-object p4, p0, Lio/reactivex/internal/operators/flowable/FlowableTimer;->scheduler:Lio/reactivex/Scheduler;

    .line 35
    return-void
.end method


# virtual methods
.method public subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Ljava/lang/Long;>;"
    new-instance v1, Lio/reactivex/internal/operators/flowable/FlowableTimer$TimerSubscriber;

    invoke-direct {v1, p1}, Lio/reactivex/internal/operators/flowable/FlowableTimer$TimerSubscriber;-><init>(Lorg/reactivestreams/Subscriber;)V

    .line 40
    .local v1, "ios":Lio/reactivex/internal/operators/flowable/FlowableTimer$TimerSubscriber;
    invoke-interface {p1, v1}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 42
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableTimer;->scheduler:Lio/reactivex/Scheduler;

    iget-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableTimer;->delay:J

    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableTimer;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v1, v4, v5, v3}, Lio/reactivex/Scheduler;->scheduleDirect(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    .line 44
    .local v0, "d":Lio/reactivex/disposables/Disposable;
    invoke-virtual {v1, v0}, Lio/reactivex/internal/operators/flowable/FlowableTimer$TimerSubscriber;->setResource(Lio/reactivex/disposables/Disposable;)V

    .line 45
    return-void
.end method
