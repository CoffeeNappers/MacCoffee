.class public final Lio/reactivex/internal/operators/parallel/ParallelRunOn;
.super Lio/reactivex/parallel/ParallelFlowable;
.source "ParallelRunOn.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;,
        Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;,
        Lio/reactivex/internal/operators/parallel/ParallelRunOn$BaseRunOnSubscriber;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/parallel/ParallelFlowable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final prefetch:I

.field final scheduler:Lio/reactivex/Scheduler;

.field final source:Lio/reactivex/parallel/ParallelFlowable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/parallel/ParallelFlowable",
            "<+TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/parallel/ParallelFlowable;Lio/reactivex/Scheduler;I)V
    .locals 0
    .param p2, "scheduler"    # Lio/reactivex/Scheduler;
    .param p3, "prefetch"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/parallel/ParallelFlowable",
            "<+TT;>;",
            "Lio/reactivex/Scheduler;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelRunOn;, "Lio/reactivex/internal/operators/parallel/ParallelRunOn<TT;>;"
    .local p1, "parent":Lio/reactivex/parallel/ParallelFlowable;, "Lio/reactivex/parallel/ParallelFlowable<+TT;>;"
    invoke-direct {p0}, Lio/reactivex/parallel/ParallelFlowable;-><init>()V

    .line 44
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelRunOn;->source:Lio/reactivex/parallel/ParallelFlowable;

    .line 45
    iput-object p2, p0, Lio/reactivex/internal/operators/parallel/ParallelRunOn;->scheduler:Lio/reactivex/Scheduler;

    .line 46
    iput p3, p0, Lio/reactivex/internal/operators/parallel/ParallelRunOn;->prefetch:I

    .line 47
    return-void
.end method


# virtual methods
.method public parallelism()I
    .locals 1

    .prologue
    .line 81
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelRunOn;, "Lio/reactivex/internal/operators/parallel/ParallelRunOn<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelRunOn;->source:Lio/reactivex/parallel/ParallelFlowable;

    invoke-virtual {v0}, Lio/reactivex/parallel/ParallelFlowable;->parallelism()I

    move-result v0

    return v0
.end method

.method public subscribe([Lorg/reactivestreams/Subscriber;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelRunOn;, "Lio/reactivex/internal/operators/parallel/ParallelRunOn<TT;>;"
    .local p1, "subscribers":[Lorg/reactivestreams/Subscriber;, "[Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/parallel/ParallelRunOn;->validate([Lorg/reactivestreams/Subscriber;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 76
    :goto_0
    return-void

    .line 55
    :cond_0
    array-length v2, p1

    .line 58
    .local v2, "n":I
    new-array v3, v2, [Lorg/reactivestreams/Subscriber;

    .line 60
    .local v3, "parents":[Lorg/reactivestreams/Subscriber;, "[Lorg/reactivestreams/Subscriber<TT;>;"
    iget v4, p0, Lio/reactivex/internal/operators/parallel/ParallelRunOn;->prefetch:I

    .line 62
    .local v4, "prefetch":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v2, :cond_2

    .line 63
    aget-object v0, p1, v1

    .line 65
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-object v7, p0, Lio/reactivex/internal/operators/parallel/ParallelRunOn;->scheduler:Lio/reactivex/Scheduler;

    invoke-virtual {v7}, Lio/reactivex/Scheduler;->createWorker()Lio/reactivex/Scheduler$Worker;

    move-result-object v6

    .line 66
    .local v6, "w":Lio/reactivex/Scheduler$Worker;
    new-instance v5, Lio/reactivex/internal/queue/SpscArrayQueue;

    invoke-direct {v5, v4}, Lio/reactivex/internal/queue/SpscArrayQueue;-><init>(I)V

    .line 68
    .local v5, "q":Lio/reactivex/internal/queue/SpscArrayQueue;, "Lio/reactivex/internal/queue/SpscArrayQueue<TT;>;"
    instance-of v7, v0, Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    if-eqz v7, :cond_1

    .line 69
    new-instance v7, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;

    check-cast v0, Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .end local v0    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-direct {v7, v0, v4, v5, v6}, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;-><init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;ILio/reactivex/internal/queue/SpscArrayQueue;Lio/reactivex/Scheduler$Worker;)V

    aput-object v7, v3, v1

    .line 62
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 71
    .restart local v0    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    :cond_1
    new-instance v7, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;

    invoke-direct {v7, v0, v4, v5, v6}, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnSubscriber;-><init>(Lorg/reactivestreams/Subscriber;ILio/reactivex/internal/queue/SpscArrayQueue;Lio/reactivex/Scheduler$Worker;)V

    aput-object v7, v3, v1

    goto :goto_2

    .line 75
    .end local v0    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .end local v5    # "q":Lio/reactivex/internal/queue/SpscArrayQueue;, "Lio/reactivex/internal/queue/SpscArrayQueue<TT;>;"
    .end local v6    # "w":Lio/reactivex/Scheduler$Worker;
    :cond_2
    iget-object v7, p0, Lio/reactivex/internal/operators/parallel/ParallelRunOn;->source:Lio/reactivex/parallel/ParallelFlowable;

    invoke-virtual {v7, v3}, Lio/reactivex/parallel/ParallelFlowable;->subscribe([Lorg/reactivestreams/Subscriber;)V

    goto :goto_0
.end method
