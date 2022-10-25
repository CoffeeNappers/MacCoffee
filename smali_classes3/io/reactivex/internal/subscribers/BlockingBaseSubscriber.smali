.class public abstract Lio/reactivex/internal/subscribers/BlockingBaseSubscriber;
.super Ljava/util/concurrent/CountDownLatch;
.source "BlockingBaseSubscriber.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/CountDownLatch;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;"
    }
.end annotation


# instance fields
.field volatile cancelled:Z

.field error:Ljava/lang/Throwable;

.field s:Lorg/reactivestreams/Subscription;

.field value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    .local p0, "this":Lio/reactivex/internal/subscribers/BlockingBaseSubscriber;, "Lio/reactivex/internal/subscribers/BlockingBaseSubscriber<TT;>;"
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 35
    return-void
.end method


# virtual methods
.method public final blockingGet()Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 62
    .local p0, "this":Lio/reactivex/internal/subscribers/BlockingBaseSubscriber;, "Lio/reactivex/internal/subscribers/BlockingBaseSubscriber<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/subscribers/BlockingBaseSubscriber;->getCount()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-eqz v3, :cond_0

    .line 64
    :try_start_0
    invoke-static {}, Lio/reactivex/internal/util/BlockingHelper;->verifyNonBlocking()V

    .line 65
    invoke-virtual {p0}, Lio/reactivex/internal/subscribers/BlockingBaseSubscriber;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/subscribers/BlockingBaseSubscriber;->error:Ljava/lang/Throwable;

    .line 77
    .local v0, "e":Ljava/lang/Throwable;
    if-eqz v0, :cond_2

    .line 78
    invoke-static {v0}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 66
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_0
    move-exception v1

    .line 67
    .local v1, "ex":Ljava/lang/InterruptedException;
    iget-object v2, p0, Lio/reactivex/internal/subscribers/BlockingBaseSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 68
    .local v2, "s":Lorg/reactivestreams/Subscription;
    sget-object v3, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    iput-object v3, p0, Lio/reactivex/internal/subscribers/BlockingBaseSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 69
    if-eqz v2, :cond_1

    .line 70
    invoke-interface {v2}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 72
    :cond_1
    invoke-static {v1}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 80
    .end local v1    # "ex":Ljava/lang/InterruptedException;
    .end local v2    # "s":Lorg/reactivestreams/Subscription;
    .restart local v0    # "e":Ljava/lang/Throwable;
    :cond_2
    iget-object v3, p0, Lio/reactivex/internal/subscribers/BlockingBaseSubscriber;->value:Ljava/lang/Object;

    return-object v3
.end method

.method public final onComplete()V
    .locals 0

    .prologue
    .line 53
    .local p0, "this":Lio/reactivex/internal/subscribers/BlockingBaseSubscriber;, "Lio/reactivex/internal/subscribers/BlockingBaseSubscriber<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/subscribers/BlockingBaseSubscriber;->countDown()V

    .line 54
    return-void
.end method

.method public final onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 39
    .local p0, "this":Lio/reactivex/internal/subscribers/BlockingBaseSubscriber;, "Lio/reactivex/internal/subscribers/BlockingBaseSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/subscribers/BlockingBaseSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 40
    iput-object p1, p0, Lio/reactivex/internal/subscribers/BlockingBaseSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 41
    iget-boolean v0, p0, Lio/reactivex/internal/subscribers/BlockingBaseSubscriber;->cancelled:Z

    if-nez v0, :cond_0

    .line 42
    const-wide v0, 0x7fffffffffffffffL

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 43
    iget-boolean v0, p0, Lio/reactivex/internal/subscribers/BlockingBaseSubscriber;->cancelled:Z

    if-eqz v0, :cond_0

    .line 44
    sget-object v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    iput-object v0, p0, Lio/reactivex/internal/subscribers/BlockingBaseSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 45
    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 49
    :cond_0
    return-void
.end method
