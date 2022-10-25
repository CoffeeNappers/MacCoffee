.class final Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;
.super Ljava/lang/Object;
.source "FlowableZipIterable.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableZipIterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ZipIterableSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TV;>;"
        }
    .end annotation
.end field

.field done:Z

.field final iterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<TU;>;"
        }
    .end annotation
.end field

.field s:Lorg/reactivestreams/Subscription;

.field final zipper:Lio/reactivex/functions/BiFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiFunction",
            "<-TT;-TU;+TV;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Ljava/util/Iterator;Lio/reactivex/functions/BiFunction;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TV;>;",
            "Ljava/util/Iterator",
            "<TU;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT;-TU;+TV;>;)V"
        }
    .end annotation

    .prologue
    .line 79
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber<TT;TU;TV;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TV;>;"
    .local p2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<TU;>;"
    .local p3, "zipper":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TT;-TU;+TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 81
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->iterator:Ljava/util/Iterator;

    .line 82
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->zipper:Lio/reactivex/functions/BiFunction;

    .line 83
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 167
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber<TT;TU;TV;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 168
    return-void
.end method

.method error(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 135
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber<TT;TU;TV;>;"
    invoke-static {p1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 136
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->done:Z

    .line 137
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 138
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 139
    return-void
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 153
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber<TT;TU;TV;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 158
    :goto_0
    return-void

    .line 156
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->done:Z

    .line 157
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 143
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber<TT;TU;TV;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 144
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 149
    :goto_0
    return-void

    .line 147
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->done:Z

    .line 148
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 95
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber<TT;TU;TV;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v4, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->done:Z

    if-eqz v4, :cond_1

    .line 132
    :cond_0
    :goto_0
    return-void

    .line 102
    :cond_1
    :try_start_0
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->iterator:Ljava/util/Iterator;

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    const-string/jumbo v5, "The iterator returned a null value"

    invoke-static {v4, v5}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 110
    .local v2, "u":Ljava/lang/Object;, "TU;"
    :try_start_1
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->zipper:Lio/reactivex/functions/BiFunction;

    invoke-interface {v4, p1, v2}, Lio/reactivex/functions/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    const-string/jumbo v5, "The zipper function returned a null value"

    invoke-static {v4, v5}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v3

    .line 116
    .local v3, "v":Ljava/lang/Object;, "TV;"
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v4, v3}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 121
    :try_start_2
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->iterator:Ljava/util/Iterator;

    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    move-result v0

    .line 127
    .local v0, "b":Z
    if-nez v0, :cond_0

    .line 128
    const/4 v4, 0x1

    iput-boolean v4, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->done:Z

    .line 129
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v4}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 130
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v4}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 103
    .end local v0    # "b":Z
    .end local v2    # "u":Ljava/lang/Object;, "TU;"
    .end local v3    # "v":Ljava/lang/Object;, "TV;"
    :catch_0
    move-exception v1

    .line 104
    .local v1, "e":Ljava/lang/Throwable;
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->error(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 111
    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local v2    # "u":Ljava/lang/Object;, "TU;"
    :catch_1
    move-exception v1

    .line 112
    .restart local v1    # "e":Ljava/lang/Throwable;
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->error(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 122
    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local v3    # "v":Ljava/lang/Object;, "TV;"
    :catch_2
    move-exception v1

    .line 123
    .restart local v1    # "e":Ljava/lang/Throwable;
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->error(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 87
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber<TT;TU;TV;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 88
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 89
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 91
    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 162
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber<TT;TU;TV;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableZipIterable$ZipIterableSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0, p1, p2}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 163
    return-void
.end method
