.class public Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;
.super Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;
.source "DeferredScalarSubscription.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription",
        "<TT;>;"
    }
.end annotation


# static fields
.field static final CANCELLED:I = 0x4

.field static final FUSED_CONSUMED:I = 0x20

.field static final FUSED_EMPTY:I = 0x8

.field static final FUSED_READY:I = 0x10

.field static final HAS_REQUEST_HAS_VALUE:I = 0x3

.field static final HAS_REQUEST_NO_VALUE:I = 0x2

.field static final NO_REQUEST_HAS_VALUE:I = 0x1

.field static final NO_REQUEST_NO_VALUE:I = 0x0

.field private static final serialVersionUID:J = -0x1ddae1b13717dd41L


# instance fields
.field protected final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field protected value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


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
    .line 69
    .local p0, "this":Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;, "Lio/reactivex/internal/subscriptions/DeferredScalarSubscription<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-direct {p0}, Lio/reactivex/internal/subscriptions/BasicIntQueueSubscription;-><init>()V

    .line 70
    iput-object p1, p0, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 71
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 185
    .local p0, "this":Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;, "Lio/reactivex/internal/subscriptions/DeferredScalarSubscription<TT;>;"
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->set(I)V

    .line 186
    const/4 v0, 0x0

    iput-object v0, p0, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->value:Ljava/lang/Object;

    .line 187
    return-void
.end method

.method public final clear()V
    .locals 1

    .prologue
    .line 179
    .local p0, "this":Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;, "Lio/reactivex/internal/subscriptions/DeferredScalarSubscription<TT;>;"
    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->lazySet(I)V

    .line 180
    const/4 v0, 0x0

    iput-object v0, p0, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->value:Ljava/lang/Object;

    .line 181
    return-void
.end method

.method public final complete(Ljava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;, "Lio/reactivex/internal/subscriptions/DeferredScalarSubscription<TT;>;"
    .local p1, "v":Ljava/lang/Object;, "TT;"
    const/4 v4, 0x4

    .line 111
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->get()I

    move-result v1

    .line 113
    .local v1, "state":I
    :cond_0
    const/16 v2, 0x8

    if-ne v1, v2, :cond_2

    .line 114
    iput-object p1, p0, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->value:Ljava/lang/Object;

    .line 115
    const/16 v2, 0x10

    invoke-virtual {p0, v2}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->lazySet(I)V

    .line 117
    iget-object v0, p0, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 118
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 119
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->get()I

    move-result v2

    if-eq v2, v4, :cond_1

    .line 120
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 146
    .end local v0    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    :cond_1
    :goto_0
    return-void

    .line 126
    :cond_2
    and-int/lit8 v2, v1, -0x3

    if-nez v2, :cond_1

    .line 130
    const/4 v2, 0x2

    if-ne v1, v2, :cond_3

    .line 131
    const/4 v2, 0x3

    invoke-virtual {p0, v2}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->lazySet(I)V

    .line 132
    iget-object v0, p0, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 133
    .restart local v0    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 134
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->get()I

    move-result v2

    if-eq v2, v4, :cond_1

    .line 135
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 139
    .end local v0    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    :cond_3
    iput-object p1, p0, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->value:Ljava/lang/Object;

    .line 140
    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v3}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->compareAndSet(II)Z

    move-result v2

    if-nez v2, :cond_1

    .line 143
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->get()I

    move-result v1

    .line 144
    if-ne v1, v4, :cond_0

    .line 145
    const/4 v2, 0x0

    iput-object v2, p0, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->value:Ljava/lang/Object;

    goto :goto_0
.end method

.method public final isCancelled()Z
    .locals 2

    .prologue
    .line 194
    .local p0, "this":Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;, "Lio/reactivex/internal/subscriptions/DeferredScalarSubscription<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->get()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final isEmpty()Z
    .locals 2

    .prologue
    .line 174
    .local p0, "this":Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;, "Lio/reactivex/internal/subscriptions/DeferredScalarSubscription<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->get()I

    move-result v0

    const/16 v1, 0x10

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final poll()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;, "Lio/reactivex/internal/subscriptions/DeferredScalarSubscription<TT;>;"
    const/4 v1, 0x0

    .line 163
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->get()I

    move-result v2

    const/16 v3, 0x10

    if-ne v2, v3, :cond_0

    .line 164
    const/16 v2, 0x20

    invoke-virtual {p0, v2}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->lazySet(I)V

    .line 165
    iget-object v0, p0, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->value:Ljava/lang/Object;

    .line 166
    .local v0, "v":Ljava/lang/Object;, "TT;"
    iput-object v1, p0, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->value:Ljava/lang/Object;

    .line 169
    .end local v0    # "v":Ljava/lang/Object;, "TT;"
    :goto_0
    return-object v0

    :cond_0
    move-object v0, v1

    goto :goto_0
.end method

.method public final request(J)V
    .locals 7
    .param p1, "n"    # J

    .prologue
    .local p0, "this":Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;, "Lio/reactivex/internal/subscriptions/DeferredScalarSubscription<TT;>;"
    const/4 v5, 0x1

    .line 75
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 77
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->get()I

    move-result v1

    .line 80
    .local v1, "state":I
    and-int/lit8 v3, v1, -0x2

    if-eqz v3, :cond_2

    .line 102
    .end local v1    # "state":I
    :cond_1
    :goto_0
    return-void

    .line 83
    .restart local v1    # "state":I
    :cond_2
    if-ne v1, v5, :cond_3

    .line 84
    const/4 v3, 0x3

    invoke-virtual {p0, v5, v3}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->compareAndSet(II)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 85
    iget-object v2, p0, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->value:Ljava/lang/Object;

    .line 86
    .local v2, "v":Ljava/lang/Object;, "TT;"
    if-eqz v2, :cond_1

    .line 87
    const/4 v3, 0x0

    iput-object v3, p0, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->value:Ljava/lang/Object;

    .line 88
    iget-object v0, p0, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 89
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-interface {v0, v2}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 90
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->get()I

    move-result v3

    const/4 v4, 0x4

    if-eq v3, v4, :cond_1

    .line 91
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 97
    .end local v0    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .end local v2    # "v":Ljava/lang/Object;, "TT;"
    :cond_3
    const/4 v3, 0x0

    const/4 v4, 0x2

    invoke-virtual {p0, v3, v4}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->compareAndSet(II)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0
.end method

.method public final requestFusion(I)I
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 153
    .local p0, "this":Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;, "Lio/reactivex/internal/subscriptions/DeferredScalarSubscription<TT;>;"
    and-int/lit8 v0, p1, 0x2

    if-eqz v0, :cond_0

    .line 154
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->lazySet(I)V

    .line 155
    const/4 v0, 0x2

    .line 157
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final tryCancel()Z
    .locals 2

    .prologue
    .local p0, "this":Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;, "Lio/reactivex/internal/subscriptions/DeferredScalarSubscription<TT;>;"
    const/4 v1, 0x4

    .line 203
    invoke-virtual {p0, v1}, Lio/reactivex/internal/subscriptions/DeferredScalarSubscription;->getAndSet(I)I

    move-result v0

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
