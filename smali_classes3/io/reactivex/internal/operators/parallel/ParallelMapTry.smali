.class public final Lio/reactivex/internal/operators/parallel/ParallelMapTry;
.super Lio/reactivex/parallel/ParallelFlowable;
.source "ParallelMapTry.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/parallel/ParallelMapTry$1;,
        Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;,
        Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;
    }
.end annotation

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
.field final errorHandler:Lio/reactivex/functions/BiFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiFunction",
            "<-",
            "Ljava/lang/Long;",
            "-",
            "Ljava/lang/Throwable;",
            "Lio/reactivex/parallel/ParallelFailureHandling;",
            ">;"
        }
    .end annotation
.end field

.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+TR;>;"
        }
    .end annotation
.end field

.field final source:Lio/reactivex/parallel/ParallelFlowable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/parallel/ParallelFlowable",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/parallel/ParallelFlowable;Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/parallel/ParallelFlowable",
            "<TT;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TR;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-",
            "Ljava/lang/Long;",
            "-",
            "Ljava/lang/Throwable;",
            "Lio/reactivex/parallel/ParallelFailureHandling;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMapTry;, "Lio/reactivex/internal/operators/parallel/ParallelMapTry<TT;TR;>;"
    .local p1, "source":Lio/reactivex/parallel/ParallelFlowable;, "Lio/reactivex/parallel/ParallelFlowable<TT;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TR;>;"
    .local p3, "errorHandler":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-Ljava/lang/Long;-Ljava/lang/Throwable;Lio/reactivex/parallel/ParallelFailureHandling;>;"
    invoke-direct {p0}, Lio/reactivex/parallel/ParallelFlowable;-><init>()V

    .line 44
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry;->source:Lio/reactivex/parallel/ParallelFlowable;

    .line 45
    iput-object p2, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry;->mapper:Lio/reactivex/functions/Function;

    .line 46
    iput-object p3, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry;->errorHandler:Lio/reactivex/functions/BiFunction;

    .line 47
    return-void
.end method


# virtual methods
.method public parallelism()I
    .locals 1

    .prologue
    .line 73
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMapTry;, "Lio/reactivex/internal/operators/parallel/ParallelMapTry<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry;->source:Lio/reactivex/parallel/ParallelFlowable;

    invoke-virtual {v0}, Lio/reactivex/parallel/ParallelFlowable;->parallelism()I

    move-result v0

    return v0
.end method

.method public subscribe([Lorg/reactivestreams/Subscriber;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;)V"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelMapTry;, "Lio/reactivex/internal/operators/parallel/ParallelMapTry<TT;TR;>;"
    .local p1, "subscribers":[Lorg/reactivestreams/Subscriber;, "[Lorg/reactivestreams/Subscriber<-TR;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/parallel/ParallelMapTry;->validate([Lorg/reactivestreams/Subscriber;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 69
    :goto_0
    return-void

    .line 55
    :cond_0
    array-length v2, p1

    .line 57
    .local v2, "n":I
    new-array v3, v2, [Lorg/reactivestreams/Subscriber;

    .line 59
    .local v3, "parents":[Lorg/reactivestreams/Subscriber;, "[Lorg/reactivestreams/Subscriber<-TT;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v2, :cond_2

    .line 60
    aget-object v0, p1, v1

    .line 61
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    instance-of v4, v0, Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    if-eqz v4, :cond_1

    .line 62
    new-instance v4, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;

    check-cast v0, Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .end local v0    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    iget-object v5, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry;->mapper:Lio/reactivex/functions/Function;

    iget-object v6, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry;->errorHandler:Lio/reactivex/functions/BiFunction;

    invoke-direct {v4, v0, v5, v6}, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTryConditionalSubscriber;-><init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;)V

    aput-object v4, v3, v1

    .line 59
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 64
    .restart local v0    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    :cond_1
    new-instance v4, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;

    iget-object v5, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry;->mapper:Lio/reactivex/functions/Function;

    iget-object v6, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry;->errorHandler:Lio/reactivex/functions/BiFunction;

    invoke-direct {v4, v0, v5, v6}, Lio/reactivex/internal/operators/parallel/ParallelMapTry$ParallelMapTrySubscriber;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;)V

    aput-object v4, v3, v1

    goto :goto_2

    .line 68
    .end local v0    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    :cond_2
    iget-object v4, p0, Lio/reactivex/internal/operators/parallel/ParallelMapTry;->source:Lio/reactivex/parallel/ParallelFlowable;

    invoke-virtual {v4, v3}, Lio/reactivex/parallel/ParallelFlowable;->subscribe([Lorg/reactivestreams/Subscriber;)V

    goto :goto_0
.end method
