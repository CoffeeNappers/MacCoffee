.class public final Lio/reactivex/internal/subscribers/BlockingFirstSubscriber;
.super Lio/reactivex/internal/subscribers/BlockingBaseSubscriber;
.source "BlockingFirstSubscriber.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscribers/BlockingBaseSubscriber",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    .local p0, "this":Lio/reactivex/internal/subscribers/BlockingFirstSubscriber;, "Lio/reactivex/internal/subscribers/BlockingFirstSubscriber<TT;>;"
    invoke-direct {p0}, Lio/reactivex/internal/subscribers/BlockingBaseSubscriber;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 36
    .local p0, "this":Lio/reactivex/internal/subscribers/BlockingFirstSubscriber;, "Lio/reactivex/internal/subscribers/BlockingFirstSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/subscribers/BlockingFirstSubscriber;->value:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 37
    iput-object p1, p0, Lio/reactivex/internal/subscribers/BlockingFirstSubscriber;->error:Ljava/lang/Throwable;

    .line 41
    :goto_0
    invoke-virtual {p0}, Lio/reactivex/internal/subscribers/BlockingFirstSubscriber;->countDown()V

    .line 42
    return-void

    .line 39
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p0, "this":Lio/reactivex/internal/subscribers/BlockingFirstSubscriber;, "Lio/reactivex/internal/subscribers/BlockingFirstSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/subscribers/BlockingFirstSubscriber;->value:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 28
    iput-object p1, p0, Lio/reactivex/internal/subscribers/BlockingFirstSubscriber;->value:Ljava/lang/Object;

    .line 29
    iget-object v0, p0, Lio/reactivex/internal/subscribers/BlockingFirstSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 30
    invoke-virtual {p0}, Lio/reactivex/internal/subscribers/BlockingFirstSubscriber;->countDown()V

    .line 32
    :cond_0
    return-void
.end method
