.class public final Lio/reactivex/internal/operators/parallel/ParallelFromArray;
.super Lio/reactivex/parallel/ParallelFlowable;
.source "ParallelFromArray.java"


# annotations
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
.field final sources:[Lorg/reactivestreams/Publisher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lorg/reactivestreams/Publisher",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>([Lorg/reactivestreams/Publisher;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/reactivestreams/Publisher",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 29
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFromArray;, "Lio/reactivex/internal/operators/parallel/ParallelFromArray<TT;>;"
    .local p1, "sources":[Lorg/reactivestreams/Publisher;, "[Lorg/reactivestreams/Publisher<TT;>;"
    invoke-direct {p0}, Lio/reactivex/parallel/ParallelFlowable;-><init>()V

    .line 30
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromArray;->sources:[Lorg/reactivestreams/Publisher;

    .line 31
    return-void
.end method


# virtual methods
.method public parallelism()I
    .locals 1

    .prologue
    .line 35
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFromArray;, "Lio/reactivex/internal/operators/parallel/ParallelFromArray<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromArray;->sources:[Lorg/reactivestreams/Publisher;

    array-length v0, v0

    return v0
.end method

.method public subscribe([Lorg/reactivestreams/Subscriber;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelFromArray;, "Lio/reactivex/internal/operators/parallel/ParallelFromArray<TT;>;"
    .local p1, "subscribers":[Lorg/reactivestreams/Subscriber;, "[Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/parallel/ParallelFromArray;->validate([Lorg/reactivestreams/Subscriber;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 49
    :cond_0
    return-void

    .line 44
    :cond_1
    array-length v1, p1

    .line 46
    .local v1, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 47
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelFromArray;->sources:[Lorg/reactivestreams/Publisher;

    aget-object v2, v2, v0

    aget-object v3, p1, v0

    invoke-interface {v2, v3}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 46
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
