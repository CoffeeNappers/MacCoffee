.class final Lio/reactivex/internal/operators/flowable/FlowableCountSingle$CountSubscriber;
.super Ljava/lang/Object;
.source "FlowableCountSingle.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableCountSingle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "CountSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/FlowableSubscriber",
        "<",
        "Ljava/lang/Object;",
        ">;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# instance fields
.field final actual:Lio/reactivex/SingleObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/SingleObserver",
            "<-",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field count:J

.field s:Lorg/reactivestreams/Subscription;


# direct methods
.method constructor <init>(Lio/reactivex/SingleObserver;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 50
    .local p1, "actual":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-Ljava/lang/Long;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableCountSingle$CountSubscriber;->actual:Lio/reactivex/SingleObserver;

    .line 52
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCountSingle$CountSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 83
    sget-object v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCountSingle$CountSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 84
    return-void
.end method

.method public isDisposed()Z
    .locals 2

    .prologue
    .line 88
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCountSingle$CountSubscriber;->s:Lorg/reactivestreams/Subscription;

    sget-object v1, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onComplete()V
    .locals 4

    .prologue
    .line 76
    sget-object v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCountSingle$CountSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 77
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCountSingle$CountSubscriber;->actual:Lio/reactivex/SingleObserver;

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableCountSingle$CountSubscriber;->count:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/reactivex/SingleObserver;->onSuccess(Ljava/lang/Object;)V

    .line 78
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 70
    sget-object v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCountSingle$CountSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 71
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCountSingle$CountSubscriber;->actual:Lio/reactivex/SingleObserver;

    invoke-interface {v0, p1}, Lio/reactivex/SingleObserver;->onError(Ljava/lang/Throwable;)V

    .line 72
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .param p1, "t"    # Ljava/lang/Object;

    .prologue
    .line 65
    iget-wide v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCountSingle$CountSubscriber;->count:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCountSingle$CountSubscriber;->count:J

    .line 66
    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 56
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCountSingle$CountSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 57
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableCountSingle$CountSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 58
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCountSingle$CountSubscriber;->actual:Lio/reactivex/SingleObserver;

    invoke-interface {v0, p0}, Lio/reactivex/SingleObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 59
    const-wide v0, 0x7fffffffffffffffL

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 61
    :cond_0
    return-void
.end method
