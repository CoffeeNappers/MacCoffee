.class final Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber$OnNext;
.super Ljava/lang/Object;
.source "FlowableDelay.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "OnNext"
.end annotation


# instance fields
.field private final t:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;


# direct methods
.method constructor <init>(Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 108
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber$OnNext;, "Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber<TT;>.OnNext;"
    .local p2, "t":Ljava/lang/Object;, "TT;"
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber$OnNext;->this$0:Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber$OnNext;->t:Ljava/lang/Object;

    .line 110
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 114
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber$OnNext;, "Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber<TT;>.OnNext;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber$OnNext;->this$0:Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber;->actual:Lorg/reactivestreams/Subscriber;

    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDelay$DelaySubscriber$OnNext;->t:Ljava/lang/Object;

    invoke-interface {v0, v1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 115
    return-void
.end method
