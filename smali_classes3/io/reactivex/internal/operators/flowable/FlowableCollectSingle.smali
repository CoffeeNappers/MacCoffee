.class public final Lio/reactivex/internal/operators/flowable/FlowableCollectSingle;
.super Lio/reactivex/Single;
.source "FlowableCollectSingle.java"

# interfaces
.implements Lio/reactivex/internal/fuseable/FuseToFlowable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableCollectSingle$CollectSubscriber;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Single",
        "<TU;>;",
        "Lio/reactivex/internal/fuseable/FuseToFlowable",
        "<TU;>;"
    }
.end annotation


# instance fields
.field final collector:Lio/reactivex/functions/BiConsumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiConsumer",
            "<-TU;-TT;>;"
        }
    .end annotation
.end field

.field final initialSupplier:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<+TU;>;"
        }
    .end annotation
.end field

.field final source:Lio/reactivex/Flowable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Flowable",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/Flowable;Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiConsumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Flowable",
            "<TT;>;",
            "Ljava/util/concurrent/Callable",
            "<+TU;>;",
            "Lio/reactivex/functions/BiConsumer",
            "<-TU;-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 36
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCollectSingle;, "Lio/reactivex/internal/operators/flowable/FlowableCollectSingle<TT;TU;>;"
    .local p1, "source":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    .local p2, "initialSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+TU;>;"
    .local p3, "collector":Lio/reactivex/functions/BiConsumer;, "Lio/reactivex/functions/BiConsumer<-TU;-TT;>;"
    invoke-direct {p0}, Lio/reactivex/Single;-><init>()V

    .line 37
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableCollectSingle;->source:Lio/reactivex/Flowable;

    .line 38
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableCollectSingle;->initialSupplier:Ljava/util/concurrent/Callable;

    .line 39
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableCollectSingle;->collector:Lio/reactivex/functions/BiConsumer;

    .line 40
    return-void
.end method


# virtual methods
.method public fuseToFlowable()Lio/reactivex/Flowable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Flowable",
            "<TU;>;"
        }
    .end annotation

    .prologue
    .line 57
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCollectSingle;, "Lio/reactivex/internal/operators/flowable/FlowableCollectSingle<TT;TU;>;"
    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableCollect;

    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCollectSingle;->source:Lio/reactivex/Flowable;

    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableCollectSingle;->initialSupplier:Ljava/util/concurrent/Callable;

    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableCollectSingle;->collector:Lio/reactivex/functions/BiConsumer;

    invoke-direct {v0, v1, v2, v3}, Lio/reactivex/internal/operators/flowable/FlowableCollect;-><init>(Lio/reactivex/Flowable;Ljava/util/concurrent/Callable;Lio/reactivex/functions/BiConsumer;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Flowable;)Lio/reactivex/Flowable;

    move-result-object v0

    return-object v0
.end method

.method protected subscribeActual(Lio/reactivex/SingleObserver;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-TU;>;)V"
        }
    .end annotation

    .prologue
    .line 46
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCollectSingle;, "Lio/reactivex/internal/operators/flowable/FlowableCollectSingle<TT;TU;>;"
    .local p1, "s":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-TU;>;"
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableCollectSingle;->initialSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v2}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "The initialSupplier returned a null value"

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 52
    .local v1, "u":Ljava/lang/Object;, "TU;"
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableCollectSingle;->source:Lio/reactivex/Flowable;

    new-instance v3, Lio/reactivex/internal/operators/flowable/FlowableCollectSingle$CollectSubscriber;

    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableCollectSingle;->collector:Lio/reactivex/functions/BiConsumer;

    invoke-direct {v3, p1, v1, v4}, Lio/reactivex/internal/operators/flowable/FlowableCollectSingle$CollectSubscriber;-><init>(Lio/reactivex/SingleObserver;Ljava/lang/Object;Lio/reactivex/functions/BiConsumer;)V

    invoke-virtual {v2, v3}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/FlowableSubscriber;)V

    .line 53
    .end local v1    # "u":Ljava/lang/Object;, "TU;"
    :goto_0
    return-void

    .line 47
    :catch_0
    move-exception v0

    .line 48
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/SingleObserver;)V

    goto :goto_0
.end method
