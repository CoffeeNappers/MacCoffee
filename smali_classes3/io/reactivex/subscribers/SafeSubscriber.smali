.class public final Lio/reactivex/subscribers/SafeSubscriber;
.super Ljava/lang/Object;
.source "SafeSubscriber.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
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
            "<-TT;>;"
        }
    .end annotation
.end field

.field done:Z

.field s:Lorg/reactivestreams/Subscription;


# direct methods
.method public constructor <init>(Lorg/reactivestreams/Subscriber;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "this":Lio/reactivex/subscribers/SafeSubscriber;, "Lio/reactivex/subscribers/SafeSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lio/reactivex/subscribers/SafeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 42
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .prologue
    .line 229
    .local p0, "this":Lio/reactivex/subscribers/SafeSubscriber;, "Lio/reactivex/subscribers/SafeSubscriber<TT;>;"
    :try_start_0
    iget-object v1, p0, Lio/reactivex/subscribers/SafeSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v1}, Lorg/reactivestreams/Subscription;->cancel()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 234
    :goto_0
    return-void

    .line 230
    :catch_0
    move-exception v0

    .line 231
    .local v0, "e1":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 232
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 169
    .local p0, "this":Lio/reactivex/subscribers/SafeSubscriber;, "Lio/reactivex/subscribers/SafeSubscriber<TT;>;"
    iget-boolean v1, p0, Lio/reactivex/subscribers/SafeSubscriber;->done:Z

    if-eqz v1, :cond_0

    .line 186
    :goto_0
    return-void

    .line 172
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/subscribers/SafeSubscriber;->done:Z

    .line 174
    iget-object v1, p0, Lio/reactivex/subscribers/SafeSubscriber;->s:Lorg/reactivestreams/Subscription;

    if-nez v1, :cond_1

    .line 175
    invoke-virtual {p0}, Lio/reactivex/subscribers/SafeSubscriber;->onCompleteNoSubscription()V

    goto :goto_0

    .line 181
    :cond_1
    :try_start_0
    iget-object v1, p0, Lio/reactivex/subscribers/SafeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1}, Lorg/reactivestreams/Subscriber;->onComplete()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 182
    :catch_0
    move-exception v0

    .line 183
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 184
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method onCompleteNoSubscription()V
    .locals 7

    .prologue
    .local p0, "this":Lio/reactivex/subscribers/SafeSubscriber;, "Lio/reactivex/subscribers/SafeSubscriber<TT;>;"
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 190
    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "Subscription not set!"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 193
    .local v1, "ex":Ljava/lang/Throwable;
    :try_start_0
    iget-object v2, p0, Lio/reactivex/subscribers/SafeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    sget-object v3, Lio/reactivex/internal/subscriptions/EmptySubscription;->INSTANCE:Lio/reactivex/internal/subscriptions/EmptySubscription;

    invoke-interface {v2, v3}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 201
    :try_start_1
    iget-object v2, p0, Lio/reactivex/subscribers/SafeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v2, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 207
    :goto_0
    return-void

    .line 194
    :catch_0
    move-exception v0

    .line 195
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 197
    new-instance v2, Lio/reactivex/exceptions/CompositeException;

    new-array v3, v6, [Ljava/lang/Throwable;

    aput-object v1, v3, v4

    aput-object v0, v3, v5

    invoke-direct {v2, v3}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 202
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_1
    move-exception v0

    .line 203
    .restart local v0    # "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 205
    new-instance v2, Lio/reactivex/exceptions/CompositeException;

    new-array v3, v6, [Ljava/lang/Throwable;

    aput-object v1, v3, v4

    aput-object v0, v3, v5

    invoke-direct {v2, v3}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 11
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .local p0, "this":Lio/reactivex/subscribers/SafeSubscriber;, "Lio/reactivex/subscribers/SafeSubscriber<TT;>;"
    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 127
    iget-boolean v3, p0, Lio/reactivex/subscribers/SafeSubscriber;->done:Z

    if-eqz v3, :cond_0

    .line 128
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 165
    :goto_0
    return-void

    .line 131
    :cond_0
    iput-boolean v7, p0, Lio/reactivex/subscribers/SafeSubscriber;->done:Z

    .line 133
    iget-object v3, p0, Lio/reactivex/subscribers/SafeSubscriber;->s:Lorg/reactivestreams/Subscription;

    if-nez v3, :cond_1

    .line 134
    new-instance v2, Ljava/lang/NullPointerException;

    const-string/jumbo v3, "Subscription not set!"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 137
    .local v2, "npe":Ljava/lang/Throwable;
    :try_start_0
    iget-object v3, p0, Lio/reactivex/subscribers/SafeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    sget-object v4, Lio/reactivex/internal/subscriptions/EmptySubscription;->INSTANCE:Lio/reactivex/internal/subscriptions/EmptySubscription;

    invoke-interface {v3, v4}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 145
    :try_start_1
    iget-object v3, p0, Lio/reactivex/subscribers/SafeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    new-instance v4, Lio/reactivex/exceptions/CompositeException;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Throwable;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object v2, v5, v6

    invoke-direct {v4, v5}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-interface {v3, v4}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 146
    :catch_0
    move-exception v0

    .line 147
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 149
    new-instance v3, Lio/reactivex/exceptions/CompositeException;

    new-array v4, v10, [Ljava/lang/Throwable;

    aput-object p1, v4, v8

    aput-object v2, v4, v7

    aput-object v0, v4, v9

    invoke-direct {v3, v4}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-static {v3}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 138
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_1
    move-exception v0

    .line 139
    .restart local v0    # "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 141
    new-instance v3, Lio/reactivex/exceptions/CompositeException;

    new-array v4, v10, [Ljava/lang/Throwable;

    aput-object p1, v4, v8

    aput-object v2, v4, v7

    aput-object v0, v4, v9

    invoke-direct {v3, v4}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-static {v3}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 154
    .end local v0    # "e":Ljava/lang/Throwable;
    .end local v2    # "npe":Ljava/lang/Throwable;
    :cond_1
    if-nez p1, :cond_2

    .line 155
    new-instance p1, Ljava/lang/NullPointerException;

    .end local p1    # "t":Ljava/lang/Throwable;
    const-string/jumbo v3, "onError called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {p1, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 159
    .restart local p1    # "t":Ljava/lang/Throwable;
    :cond_2
    :try_start_2
    iget-object v3, p0, Lio/reactivex/subscribers/SafeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    .line 160
    :catch_2
    move-exception v1

    .line 161
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 163
    new-instance v3, Lio/reactivex/exceptions/CompositeException;

    new-array v4, v9, [Ljava/lang/Throwable;

    aput-object p1, v4, v8

    aput-object v1, v4, v7

    invoke-direct {v3, v4}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-static {v3}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/subscribers/SafeSubscriber;, "Lio/reactivex/subscribers/SafeSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v4, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 68
    iget-boolean v3, p0, Lio/reactivex/subscribers/SafeSubscriber;->done:Z

    if-eqz v3, :cond_0

    .line 102
    :goto_0
    return-void

    .line 71
    :cond_0
    iget-object v3, p0, Lio/reactivex/subscribers/SafeSubscriber;->s:Lorg/reactivestreams/Subscription;

    if-nez v3, :cond_1

    .line 72
    invoke-virtual {p0}, Lio/reactivex/subscribers/SafeSubscriber;->onNextNoSubscription()V

    goto :goto_0

    .line 76
    :cond_1
    if-nez p1, :cond_2

    .line 77
    new-instance v2, Ljava/lang/NullPointerException;

    const-string/jumbo v3, "onNext called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 79
    .local v2, "ex":Ljava/lang/Throwable;
    :try_start_0
    iget-object v3, p0, Lio/reactivex/subscribers/SafeSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v3}, Lorg/reactivestreams/Subscription;->cancel()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    invoke-virtual {p0, v2}, Lio/reactivex/subscribers/SafeSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 80
    :catch_0
    move-exception v1

    .line 81
    .local v1, "e1":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 82
    new-instance v3, Lio/reactivex/exceptions/CompositeException;

    new-array v4, v4, [Ljava/lang/Throwable;

    aput-object v2, v4, v5

    aput-object v1, v4, v6

    invoke-direct {v3, v4}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-virtual {p0, v3}, Lio/reactivex/subscribers/SafeSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 90
    .end local v1    # "e1":Ljava/lang/Throwable;
    .end local v2    # "ex":Ljava/lang/Throwable;
    :cond_2
    :try_start_1
    iget-object v3, p0, Lio/reactivex/subscribers/SafeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 91
    :catch_1
    move-exception v0

    .line 92
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 94
    :try_start_2
    iget-object v3, p0, Lio/reactivex/subscribers/SafeSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v3}, Lorg/reactivestreams/Subscription;->cancel()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    .line 100
    invoke-virtual {p0, v0}, Lio/reactivex/subscribers/SafeSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 95
    :catch_2
    move-exception v1

    .line 96
    .restart local v1    # "e1":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 97
    new-instance v3, Lio/reactivex/exceptions/CompositeException;

    new-array v4, v4, [Ljava/lang/Throwable;

    aput-object v0, v4, v5

    aput-object v1, v4, v6

    invoke-direct {v3, v4}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-virtual {p0, v3}, Lio/reactivex/subscribers/SafeSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method onNextNoSubscription()V
    .locals 7

    .prologue
    .local p0, "this":Lio/reactivex/subscribers/SafeSubscriber;, "Lio/reactivex/subscribers/SafeSubscriber<TT;>;"
    const/4 v6, 0x2

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 105
    iput-boolean v4, p0, Lio/reactivex/subscribers/SafeSubscriber;->done:Z

    .line 106
    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "Subscription not set!"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 109
    .local v1, "ex":Ljava/lang/Throwable;
    :try_start_0
    iget-object v2, p0, Lio/reactivex/subscribers/SafeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    sget-object v3, Lio/reactivex/internal/subscriptions/EmptySubscription;->INSTANCE:Lio/reactivex/internal/subscriptions/EmptySubscription;

    invoke-interface {v2, v3}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    :try_start_1
    iget-object v2, p0, Lio/reactivex/subscribers/SafeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v2, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 123
    :goto_0
    return-void

    .line 110
    :catch_0
    move-exception v0

    .line 111
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 113
    new-instance v2, Lio/reactivex/exceptions/CompositeException;

    new-array v3, v6, [Ljava/lang/Throwable;

    aput-object v1, v3, v5

    aput-object v0, v3, v4

    invoke-direct {v2, v3}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 118
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_1
    move-exception v0

    .line 119
    .restart local v0    # "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 121
    new-instance v2, Lio/reactivex/exceptions/CompositeException;

    new-array v3, v6, [Ljava/lang/Throwable;

    aput-object v1, v3, v5

    aput-object v0, v3, v4

    invoke-direct {v2, v3}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 6
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .local p0, "this":Lio/reactivex/subscribers/SafeSubscriber;, "Lio/reactivex/subscribers/SafeSubscriber<TT;>;"
    const/4 v5, 0x1

    .line 46
    iget-object v2, p0, Lio/reactivex/subscribers/SafeSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v2, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 47
    iput-object p1, p0, Lio/reactivex/subscribers/SafeSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 49
    :try_start_0
    iget-object v2, p0, Lio/reactivex/subscribers/SafeSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v2, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    :cond_0
    :goto_0
    return-void

    .line 50
    :catch_0
    move-exception v0

    .line 51
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 52
    iput-boolean v5, p0, Lio/reactivex/subscribers/SafeSubscriber;->done:Z

    .line 55
    :try_start_1
    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 61
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 56
    :catch_1
    move-exception v1

    .line 57
    .local v1, "e1":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 58
    new-instance v2, Lio/reactivex/exceptions/CompositeException;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Throwable;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    aput-object v1, v3, v5

    invoke-direct {v2, v3}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public request(J)V
    .locals 5
    .param p1, "n"    # J

    .prologue
    .line 212
    .local p0, "this":Lio/reactivex/subscribers/SafeSubscriber;, "Lio/reactivex/subscribers/SafeSubscriber<TT;>;"
    :try_start_0
    iget-object v2, p0, Lio/reactivex/subscribers/SafeSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v2, p1, p2}, Lorg/reactivestreams/Subscription;->request(J)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 224
    :goto_0
    return-void

    .line 213
    :catch_0
    move-exception v0

    .line 214
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 216
    :try_start_1
    iget-object v2, p0, Lio/reactivex/subscribers/SafeSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v2}, Lorg/reactivestreams/Subscription;->cancel()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 222
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 217
    :catch_1
    move-exception v1

    .line 218
    .local v1, "e1":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 219
    new-instance v2, Lio/reactivex/exceptions/CompositeException;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Throwable;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v4, 0x1

    aput-object v1, v3, v4

    invoke-direct {v2, v3}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
