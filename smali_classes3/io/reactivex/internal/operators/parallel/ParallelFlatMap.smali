.class public final Lio/reactivex/internal/operators/parallel/ParallelFlatMap;
.super Lio/reactivex/parallel/ParallelFlowable;
.source "ParallelFlatMap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/parallel/ParallelFlowable",
        "<TR;>;"
    }
.end annotation


# instance fields
.field final delayError:Z

.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lorg/reactivestreams/Publisher",
            "<+TR;>;>;"
        }
    .end annotation
.end field

.field final maxConcurrency:I

.field final prefetch:I

.field final source:Lio/reactivex/parallel/ParallelFlowable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/parallel/ParallelFlowable",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/parallel/ParallelFlowable;Lio/reactivex/functions/Function;ZII)V
    .locals 0
    .param p3, "delayError"    # Z
    .param p4, "maxConcurrency"    # I
    .param p5, "prefetch"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/parallel/ParallelFlowable",
            "<TT;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lorg/reactivestreams/Publisher",
            "<+TR;>;>;ZII)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFlatMap;, "Lio/reactivex/internal/operators/parallel/ParallelFlatMap<TT;TR;>;"
    .local p1, "source":Lio/reactivex/parallel/ParallelFlowable;, "Lio/reactivex/parallel/ParallelFlowable<TT;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lorg/reactivestreams/Publisher<+TR;>;>;"
    invoke-direct {p0}, Lio/reactivex/parallel/ParallelFlowable;-><init>()V

    .line 46
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelFlatMap;->source:Lio/reactivex/parallel/ParallelFlowable;

    .line 47
    iput-object p2, p0, Lio/reactivex/internal/operators/parallel/ParallelFlatMap;->mapper:Lio/reactivex/functions/Function;

    .line 48
    iput-boolean p3, p0, Lio/reactivex/internal/operators/parallel/ParallelFlatMap;->delayError:Z

    .line 49
    iput p4, p0, Lio/reactivex/internal/operators/parallel/ParallelFlatMap;->maxConcurrency:I

    .line 50
    iput p5, p0, Lio/reactivex/internal/operators/parallel/ParallelFlatMap;->prefetch:I

    .line 51
    return-void
.end method


# virtual methods
.method public parallelism()I
    .locals 1

    .prologue
    .line 55
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFlatMap;, "Lio/reactivex/internal/operators/parallel/ParallelFlatMap<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFlatMap;->source:Lio/reactivex/parallel/ParallelFlowable;

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
            "<-TR;>;)V"
        }
    .end annotation

    .prologue
    .line 60
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFlatMap;, "Lio/reactivex/internal/operators/parallel/ParallelFlatMap<TT;TR;>;"
    .local p1, "subscribers":[Lorg/reactivestreams/Subscriber;, "[Lorg/reactivestreams/Subscriber<-TR;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/parallel/ParallelFlatMap;->validate([Lorg/reactivestreams/Subscriber;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 74
    :goto_0
    return-void

    .line 64
    :cond_0
    array-length v1, p1

    .line 67
    .local v1, "n":I
    new-array v2, v1, [Lorg/reactivestreams/Subscriber;

    .line 69
    .local v2, "parents":[Lorg/reactivestreams/Subscriber;, "[Lorg/reactivestreams/Subscriber<TT;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_1

    .line 70
    aget-object v3, p1, v0

    iget-object v4, p0, Lio/reactivex/internal/operators/parallel/ParallelFlatMap;->mapper:Lio/reactivex/functions/Function;

    iget-boolean v5, p0, Lio/reactivex/internal/operators/parallel/ParallelFlatMap;->delayError:Z

    iget v6, p0, Lio/reactivex/internal/operators/parallel/ParallelFlatMap;->maxConcurrency:I

    iget v7, p0, Lio/reactivex/internal/operators/parallel/ParallelFlatMap;->prefetch:I

    invoke-static {v3, v4, v5, v6, v7}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap;->subscribe(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;ZII)Lio/reactivex/FlowableSubscriber;

    move-result-object v3

    aput-object v3, v2, v0

    .line 69
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 73
    :cond_1
    iget-object v3, p0, Lio/reactivex/internal/operators/parallel/ParallelFlatMap;->source:Lio/reactivex/parallel/ParallelFlowable;

    invoke-virtual {v3, v2}, Lio/reactivex/parallel/ParallelFlowable;->subscribe([Lorg/reactivestreams/Subscriber;)V

    goto :goto_0
.end method
