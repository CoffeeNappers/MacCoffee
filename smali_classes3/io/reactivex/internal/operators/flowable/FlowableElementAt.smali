.class public final Lio/reactivex/internal/operators/flowable/FlowableElementAt;
.super Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream;
.source "FlowableElementAt.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableElementAt$ElementAtSubscriber;
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


# instance fields
.field final defaultValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field final errorOnFewer:Z

.field final index:J


# direct methods
.method public constructor <init>(Lio/reactivex/Flowable;JLjava/lang/Object;Z)V
    .locals 0
    .param p2, "index"    # J
    .param p5, "errorOnFewer"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Flowable",
            "<TT;>;JTT;Z)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableElementAt;, "Lio/reactivex/internal/operators/flowable/FlowableElementAt<TT;>;"
    .local p1, "source":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    .local p4, "defaultValue":Ljava/lang/Object;, "TT;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream;-><init>(Lio/reactivex/Flowable;)V

    .line 31
    iput-wide p2, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAt;->index:J

    .line 32
    iput-object p4, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAt;->defaultValue:Ljava/lang/Object;

    .line 33
    iput-boolean p5, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAt;->errorOnFewer:Z

    .line 34
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableElementAt;, "Lio/reactivex/internal/operators/flowable/FlowableElementAt<TT;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAt;->source:Lio/reactivex/Flowable;

    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableElementAt$ElementAtSubscriber;

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAt;->index:J

    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAt;->defaultValue:Ljava/lang/Object;

    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableElementAt;->errorOnFewer:Z

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/flowable/FlowableElementAt$ElementAtSubscriber;-><init>(Lorg/reactivestreams/Subscriber;JLjava/lang/Object;Z)V

    invoke-virtual {v6, v0}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/FlowableSubscriber;)V

    .line 39
    return-void
.end method
