.class public final Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe;
.super Lio/reactivex/Maybe;
.source "FlowableElementAtMaybe.java"

# interfaces
.implements Lio/reactivex/internal/fuseable/FuseToFlowable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Maybe",
        "<TT;>;",
        "Lio/reactivex/internal/fuseable/FuseToFlowable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final index:J

.field final source:Lio/reactivex/Flowable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Flowable",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/Flowable;J)V
    .locals 0
    .param p2, "index"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Flowable",
            "<TT;>;J)V"
        }
    .end annotation

    .prologue
    .line 29
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe;, "Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe<TT;>;"
    .local p1, "source":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    invoke-direct {p0}, Lio/reactivex/Maybe;-><init>()V

    .line 30
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe;->source:Lio/reactivex/Flowable;

    .line 31
    iput-wide p2, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe;->index:J

    .line 32
    return-void
.end method


# virtual methods
.method public fuseToFlowable()Lio/reactivex/Flowable;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Flowable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe;, "Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableElementAt;

    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe;->source:Lio/reactivex/Flowable;

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe;->index:J

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/flowable/FlowableElementAt;-><init>(Lio/reactivex/Flowable;JLjava/lang/Object;Z)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Flowable;)Lio/reactivex/Flowable;

    move-result-object v0

    return-object v0
.end method

.method protected subscribeActual(Lio/reactivex/MaybeObserver;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 36
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe;, "Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe<TT;>;"
    .local p1, "s":Lio/reactivex/MaybeObserver;, "Lio/reactivex/MaybeObserver<-TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe;->source:Lio/reactivex/Flowable;

    new-instance v1, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe;->index:J

    invoke-direct {v1, p1, v2, v3}, Lio/reactivex/internal/operators/flowable/FlowableElementAtMaybe$ElementAtSubscriber;-><init>(Lio/reactivex/MaybeObserver;J)V

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/FlowableSubscriber;)V

    .line 37
    return-void
.end method