.class final Lio/reactivex/internal/operators/flowable/FlowableDelaySubscriptionOther$DelaySubscriber$DelaySubscription;
.super Ljava/lang/Object;
.source "FlowableDelaySubscriptionOther.java"

# interfaces
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableDelaySubscriptionOther$DelaySubscriber;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "DelaySubscription"
.end annotation


# instance fields
.field private final s:Lorg/reactivestreams/Subscription;

.field final synthetic this$1:Lio/reactivex/internal/operators/flowable/FlowableDelaySubscriptionOther$DelaySubscriber;


# direct methods
.method constructor <init>(Lio/reactivex/internal/operators/flowable/FlowableDelaySubscriptionOther$DelaySubscriber;Lorg/reactivestreams/Subscription;)V
    .locals 0
    .param p2, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 90
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDelaySubscriptionOther$DelaySubscriber$DelaySubscription;, "Lio/reactivex/internal/operators/flowable/FlowableDelaySubscriptionOther<TT;TU;>.DelaySubscriber.DelaySubscription;"
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableDelaySubscriptionOther$DelaySubscriber$DelaySubscription;->this$1:Lio/reactivex/internal/operators/flowable/FlowableDelaySubscriptionOther$DelaySubscriber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableDelaySubscriptionOther$DelaySubscriber$DelaySubscription;->s:Lorg/reactivestreams/Subscription;

    .line 92
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 101
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDelaySubscriptionOther$DelaySubscriber$DelaySubscription;, "Lio/reactivex/internal/operators/flowable/FlowableDelaySubscriptionOther<TT;TU;>.DelaySubscriber.DelaySubscription;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableDelaySubscriptionOther$DelaySubscriber$DelaySubscription;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 102
    return-void
.end method

.method public request(J)V
    .locals 0
    .param p1, "n"    # J

    .prologue
    .line 97
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDelaySubscriptionOther$DelaySubscriber$DelaySubscription;, "Lio/reactivex/internal/operators/flowable/FlowableDelaySubscriptionOther<TT;TU;>.DelaySubscriber.DelaySubscription;"
    return-void
.end method
