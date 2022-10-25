.class final Lio/reactivex/internal/operators/flowable/FlowableInternalHelper$ZipIterableFunction;
.super Ljava/lang/Object;
.source "FlowableInternalHelper.java"

# interfaces
.implements Lio/reactivex/functions/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableInternalHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ZipIterableFunction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Function",
        "<",
        "Ljava/util/List",
        "<",
        "Lorg/reactivestreams/Publisher",
        "<+TT;>;>;",
        "Lorg/reactivestreams/Publisher",
        "<+TR;>;>;"
    }
.end annotation


# instance fields
.field private final zipper:Lio/reactivex/functions/Function;
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
.method constructor <init>(Lio/reactivex/functions/Function;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;)V"
        }
    .end annotation

    .prologue
    .line 227
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableInternalHelper$ZipIterableFunction;, "Lio/reactivex/internal/operators/flowable/FlowableInternalHelper$ZipIterableFunction<TT;TR;>;"
    .local p1, "zipper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 228
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableInternalHelper$ZipIterableFunction;->zipper:Lio/reactivex/functions/Function;

    .line 229
    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 223
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableInternalHelper$ZipIterableFunction;, "Lio/reactivex/internal/operators/flowable/FlowableInternalHelper$ZipIterableFunction<TT;TR;>;"
    check-cast p1, Ljava/util/List;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableInternalHelper$ZipIterableFunction;->apply(Ljava/util/List;)Lorg/reactivestreams/Publisher;

    move-result-object v0

    return-object v0
.end method

.method public apply(Ljava/util/List;)Lorg/reactivestreams/Publisher;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;>;)",
            "Lorg/reactivestreams/Publisher",
            "<+TR;>;"
        }
    .end annotation

    .prologue
    .line 233
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableInternalHelper$ZipIterableFunction;, "Lio/reactivex/internal/operators/flowable/FlowableInternalHelper$ZipIterableFunction<TT;TR;>;"
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lorg/reactivestreams/Publisher<+TT;>;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableInternalHelper$ZipIterableFunction;->zipper:Lio/reactivex/functions/Function;

    const/4 v1, 0x0

    invoke-static {}, Lio/reactivex/Flowable;->bufferSize()I

    move-result v2

    invoke-static {p1, v0, v1, v2}, Lio/reactivex/Flowable;->zipIterable(Ljava/lang/Iterable;Lio/reactivex/functions/Function;ZI)Lio/reactivex/Flowable;

    move-result-object v0

    return-object v0
.end method
