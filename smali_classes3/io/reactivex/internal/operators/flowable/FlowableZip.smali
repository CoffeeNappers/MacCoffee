.class public final Lio/reactivex/internal/operators/flowable/FlowableZip;
.super Lio/reactivex/Flowable;
.source "FlowableZip.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;,
        Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Flowable",
        "<TR;>;"
    }
.end annotation


# instance fields
.field final bufferSize:I

.field final delayError:Z

.field final sources:[Lorg/reactivestreams/Publisher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;"
        }
    .end annotation
.end field

.field final sourcesIterable:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;>;"
        }
    .end annotation
.end field

.field final zipper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>([Lorg/reactivestreams/Publisher;Ljava/lang/Iterable;Lio/reactivex/functions/Function;IZ)V
    .locals 0
    .param p4, "bufferSize"    # I
    .param p5, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;",
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;IZ)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableZip;, "Lio/reactivex/internal/operators/flowable/FlowableZip<TT;TR;>;"
    .local p1, "sources":[Lorg/reactivestreams/Publisher;, "[Lorg/reactivestreams/Publisher<+TT;>;"
    .local p2, "sourcesIterable":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lorg/reactivestreams/Publisher<+TT;>;>;"
    .local p3, "zipper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    invoke-direct {p0}, Lio/reactivex/Flowable;-><init>()V

    .line 44
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableZip;->sources:[Lorg/reactivestreams/Publisher;

    .line 45
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableZip;->sourcesIterable:Ljava/lang/Iterable;

    .line 46
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableZip;->zipper:Lio/reactivex/functions/Function;

    .line 47
    iput p4, p0, Lio/reactivex/internal/operators/flowable/FlowableZip;->bufferSize:I

    .line 48
    iput-boolean p5, p0, Lio/reactivex/internal/operators/flowable/FlowableZip;->delayError:Z

    .line 49
    return-void
.end method


# virtual methods
.method public subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableZip;, "Lio/reactivex/internal/operators/flowable/FlowableZip<TT;TR;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    const/4 v2, 0x0

    .line 54
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableZip;->sources:[Lorg/reactivestreams/Publisher;

    .line 55
    .local v10, "sources":[Lorg/reactivestreams/Publisher;, "[Lorg/reactivestreams/Publisher<+TT;>;"
    const/4 v3, 0x0

    .line 56
    .local v3, "count":I
    if-nez v10, :cond_1

    .line 57
    const/16 v1, 0x8

    new-array v10, v1, [Lorg/reactivestreams/Publisher;

    .line 58
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableZip;->sourcesIterable:Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/reactivestreams/Publisher;

    .line 59
    .local v9, "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    array-length v1, v10

    if-ne v3, v1, :cond_0

    .line 60
    shr-int/lit8 v1, v3, 0x2

    add-int/2addr v1, v3

    new-array v6, v1, [Lorg/reactivestreams/Publisher;

    .line 61
    .local v6, "b":[Lorg/reactivestreams/Publisher;, "[Lorg/reactivestreams/Publisher<+TT;>;"
    invoke-static {v10, v2, v6, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 62
    move-object v10, v6

    .line 64
    .end local v6    # "b":[Lorg/reactivestreams/Publisher;, "[Lorg/reactivestreams/Publisher<+TT;>;"
    :cond_0
    add-int/lit8 v7, v3, 0x1

    .end local v3    # "count":I
    .local v7, "count":I
    aput-object v9, v10, v3

    move v3, v7

    .line 65
    .end local v7    # "count":I
    .restart local v3    # "count":I
    goto :goto_0

    .line 67
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v9    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TT;>;"
    :cond_1
    array-length v3, v10

    .line 70
    :cond_2
    if-nez v3, :cond_3

    .line 71
    invoke-static {p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->complete(Lorg/reactivestreams/Subscriber;)V

    .line 80
    :goto_1
    return-void

    .line 75
    :cond_3
    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;

    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableZip;->zipper:Lio/reactivex/functions/Function;

    iget v4, p0, Lio/reactivex/internal/operators/flowable/FlowableZip;->bufferSize:I

    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableZip;->delayError:Z

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;IIZ)V

    .line 77
    .local v0, "coordinator":Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator<TT;TR;>;"
    invoke-interface {p1, v0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 79
    invoke-virtual {v0, v10, v3}, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->subscribe([Lorg/reactivestreams/Publisher;I)V

    goto :goto_1
.end method
