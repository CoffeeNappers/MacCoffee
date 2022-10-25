.class public final enum Lio/reactivex/internal/subscriptions/SubscriptionHelper;
.super Ljava/lang/Enum;
.source "SubscriptionHelper.java"

# interfaces
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lio/reactivex/internal/subscriptions/SubscriptionHelper;",
        ">;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/reactivex/internal/subscriptions/SubscriptionHelper;

.field public static final enum CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 33
    new-instance v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    const-string/jumbo v1, "CANCELLED"

    invoke-direct {v0, v1, v2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    .line 28
    const/4 v0, 0x1

    new-array v0, v0, [Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    sget-object v1, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    aput-object v1, v0, v2

    sput-object v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->$VALUES:[Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static cancel(Ljava/util/concurrent/atomic/AtomicReference;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/reactivestreams/Subscription;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 184
    .local p0, "field":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lorg/reactivestreams/Subscription;>;"
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/reactivestreams/Subscription;

    .line 185
    .local v0, "current":Lorg/reactivestreams/Subscription;
    sget-object v1, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    if-eq v0, v1, :cond_1

    .line 186
    sget-object v1, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    invoke-virtual {p0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "current":Lorg/reactivestreams/Subscription;
    check-cast v0, Lorg/reactivestreams/Subscription;

    .line 187
    .restart local v0    # "current":Lorg/reactivestreams/Subscription;
    sget-object v1, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    if-eq v0, v1, :cond_1

    .line 188
    if-eqz v0, :cond_0

    .line 189
    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 191
    :cond_0
    const/4 v1, 0x1

    .line 194
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static deferredRequest(Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/atomic/AtomicLong;J)V
    .locals 6
    .param p1, "requested"    # Ljava/util/concurrent/atomic/AtomicLong;
    .param p2, "n"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/reactivestreams/Subscription;",
            ">;",
            "Ljava/util/concurrent/atomic/AtomicLong;",
            "J)V"
        }
    .end annotation

    .prologue
    .local p0, "field":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lorg/reactivestreams/Subscription;>;"
    const-wide/16 v4, 0x0

    .line 225
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/reactivestreams/Subscription;

    .line 226
    .local v2, "s":Lorg/reactivestreams/Subscription;
    if-eqz v2, :cond_1

    .line 227
    invoke-interface {v2, p2, p3}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 241
    :cond_0
    :goto_0
    return-void

    .line 229
    :cond_1
    invoke-static {p2, p3}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 230
    invoke-static {p1, p2, p3}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 232
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "s":Lorg/reactivestreams/Subscription;
    check-cast v2, Lorg/reactivestreams/Subscription;

    .line 233
    .restart local v2    # "s":Lorg/reactivestreams/Subscription;
    if-eqz v2, :cond_0

    .line 234
    invoke-virtual {p1, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->getAndSet(J)J

    move-result-wide v0

    .line 235
    .local v0, "r":J
    cmp-long v3, v0, v4

    if-eqz v3, :cond_0

    .line 236
    invoke-interface {v2, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0
.end method

.method public static deferredSetOnce(Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/atomic/AtomicLong;Lorg/reactivestreams/Subscription;)Z
    .locals 6
    .param p1, "requested"    # Ljava/util/concurrent/atomic/AtomicLong;
    .param p2, "s"    # Lorg/reactivestreams/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/reactivestreams/Subscription;",
            ">;",
            "Ljava/util/concurrent/atomic/AtomicLong;",
            "Lorg/reactivestreams/Subscription;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p0, "field":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lorg/reactivestreams/Subscription;>;"
    const-wide/16 v4, 0x0

    .line 207
    invoke-static {p0, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lorg/reactivestreams/Subscription;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 208
    invoke-virtual {p1, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->getAndSet(J)J

    move-result-wide v0

    .line 209
    .local v0, "r":J
    cmp-long v2, v0, v4

    if-eqz v2, :cond_0

    .line 210
    invoke-interface {p2, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 212
    :cond_0
    const/4 v2, 0x1

    .line 214
    .end local v0    # "r":J
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static isCancelled(Lorg/reactivestreams/Subscription;)Z
    .locals 1
    .param p0, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 101
    sget-object v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static replace(Ljava/util/concurrent/atomic/AtomicReference;Lorg/reactivestreams/Subscription;)Z
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/reactivestreams/Subscription;",
            ">;",
            "Lorg/reactivestreams/Subscription;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 162
    .local p0, "field":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lorg/reactivestreams/Subscription;>;"
    :cond_0
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/reactivestreams/Subscription;

    .line 163
    .local v0, "current":Lorg/reactivestreams/Subscription;
    sget-object v1, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    if-ne v0, v1, :cond_2

    .line 164
    if-eqz p1, :cond_1

    .line 165
    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 167
    :cond_1
    const/4 v1, 0x0

    .line 170
    :goto_0
    return v1

    .line 169
    :cond_2
    invoke-virtual {p0, v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 170
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static reportMoreProduced(J)V
    .locals 4
    .param p0, "n"    # J

    .prologue
    .line 93
    new-instance v0, Lio/reactivex/exceptions/ProtocolViolationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "More produced than requested: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lio/reactivex/exceptions/ProtocolViolationException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 94
    return-void
.end method

.method public static reportSubscriptionSet()V
    .locals 2

    .prologue
    .line 71
    new-instance v0, Lio/reactivex/exceptions/ProtocolViolationException;

    const-string/jumbo v1, "Subscription already set!"

    invoke-direct {v0, v1}, Lio/reactivex/exceptions/ProtocolViolationException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 72
    return-void
.end method

.method public static set(Ljava/util/concurrent/atomic/AtomicReference;Lorg/reactivestreams/Subscription;)Z
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/reactivestreams/Subscription;",
            ">;",
            "Lorg/reactivestreams/Subscription;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 115
    .local p0, "field":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lorg/reactivestreams/Subscription;>;"
    :cond_0
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/reactivestreams/Subscription;

    .line 116
    .local v0, "current":Lorg/reactivestreams/Subscription;
    sget-object v1, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    if-ne v0, v1, :cond_2

    .line 117
    if-eqz p1, :cond_1

    .line 118
    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 120
    :cond_1
    const/4 v1, 0x0

    .line 126
    :goto_0
    return v1

    .line 122
    :cond_2
    invoke-virtual {p0, v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 123
    if-eqz v0, :cond_3

    .line 124
    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 126
    :cond_3
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lorg/reactivestreams/Subscription;)Z
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/reactivestreams/Subscription;",
            ">;",
            "Lorg/reactivestreams/Subscription;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 140
    .local p0, "field":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lorg/reactivestreams/Subscription;>;"
    const-string/jumbo v0, "d is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 141
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 142
    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 143
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    if-eq v0, v1, :cond_0

    .line 144
    invoke-static {}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->reportSubscriptionSet()V

    .line 146
    :cond_0
    const/4 v0, 0x0

    .line 148
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static validate(J)Z
    .locals 4
    .param p0, "n"    # J

    .prologue
    .line 80
    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-gtz v0, :cond_0

    .line 81
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "n > 0 required but it was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 82
    const/4 v0, 0x0

    .line 84
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z
    .locals 3
    .param p0, "current"    # Lorg/reactivestreams/Subscription;
    .param p1, "next"    # Lorg/reactivestreams/Subscription;

    .prologue
    const/4 v0, 0x0

    .line 54
    if-nez p1, :cond_0

    .line 55
    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "next is null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 63
    :goto_0
    return v0

    .line 58
    :cond_0
    if-eqz p0, :cond_1

    .line 59
    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 60
    invoke-static {}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->reportSubscriptionSet()V

    goto :goto_0

    .line 63
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/reactivex/internal/subscriptions/SubscriptionHelper;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 28
    const-class v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    return-object v0
.end method

.method public static values()[Lio/reactivex/internal/subscriptions/SubscriptionHelper;
    .locals 1

    .prologue
    .line 28
    sget-object v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->$VALUES:[Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    invoke-virtual {v0}, [Lio/reactivex/internal/subscriptions/SubscriptionHelper;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    return-object v0
.end method


# virtual methods
.method public cancel()V
    .locals 0

    .prologue
    .line 44
    return-void
.end method

.method public request(J)V
    .locals 0
    .param p1, "n"    # J

    .prologue
    .line 39
    return-void
.end method
