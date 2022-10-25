.class public final Lio/reactivex/processors/PublishProcessor;
.super Lio/reactivex/processors/FlowableProcessor;
.source "PublishProcessor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/processors/PublishProcessor$PublishSubscription;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/processors/FlowableProcessor",
        "<TT;>;"
    }
.end annotation


# static fields
.field static final EMPTY:[Lio/reactivex/processors/PublishProcessor$PublishSubscription;

.field static final TERMINATED:[Lio/reactivex/processors/PublishProcessor$PublishSubscription;


# instance fields
.field error:Ljava/lang/Throwable;

.field final subscribers:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<[",
            "Lio/reactivex/processors/PublishProcessor$PublishSubscription",
            "<TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 62
    new-array v0, v1, [Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    sput-object v0, Lio/reactivex/processors/PublishProcessor;->TERMINATED:[Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    .line 65
    new-array v0, v1, [Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    sput-object v0, Lio/reactivex/processors/PublishProcessor;->EMPTY:[Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    return-void
.end method

.method constructor <init>()V
    .locals 2

    .prologue
    .line 88
    .local p0, "this":Lio/reactivex/processors/PublishProcessor;, "Lio/reactivex/processors/PublishProcessor<TT;>;"
    invoke-direct {p0}, Lio/reactivex/processors/FlowableProcessor;-><init>()V

    .line 89
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/processors/PublishProcessor;->EMPTY:[Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/reactivex/processors/PublishProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    .line 90
    return-void
.end method

.method public static create()Lio/reactivex/processors/PublishProcessor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/processors/PublishProcessor",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .prologue
    .line 80
    new-instance v0, Lio/reactivex/processors/PublishProcessor;

    invoke-direct {v0}, Lio/reactivex/processors/PublishProcessor;-><init>()V

    return-object v0
.end method


# virtual methods
.method add(Lio/reactivex/processors/PublishProcessor$PublishSubscription;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/processors/PublishProcessor$PublishSubscription",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/processors/PublishProcessor;, "Lio/reactivex/processors/PublishProcessor<TT;>;"
    .local p1, "ps":Lio/reactivex/processors/PublishProcessor$PublishSubscription;, "Lio/reactivex/processors/PublishProcessor$PublishSubscription<TT;>;"
    const/4 v3, 0x0

    .line 121
    :cond_0
    iget-object v4, p0, Lio/reactivex/processors/PublishProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    .line 122
    .local v0, "a":[Lio/reactivex/processors/PublishProcessor$PublishSubscription;, "[Lio/reactivex/processors/PublishProcessor$PublishSubscription<TT;>;"
    sget-object v4, Lio/reactivex/processors/PublishProcessor;->TERMINATED:[Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    if-ne v0, v4, :cond_1

    .line 133
    :goto_0
    return v3

    .line 126
    :cond_1
    array-length v2, v0

    .line 128
    .local v2, "n":I
    add-int/lit8 v4, v2, 0x1

    new-array v1, v4, [Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    .line 129
    .local v1, "b":[Lio/reactivex/processors/PublishProcessor$PublishSubscription;, "[Lio/reactivex/processors/PublishProcessor$PublishSubscription<TT;>;"
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 130
    aput-object p1, v1, v2

    .line 132
    iget-object v4, p0, Lio/reactivex/processors/PublishProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 133
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .locals 2

    .prologue
    .line 270
    .local p0, "this":Lio/reactivex/processors/PublishProcessor;, "Lio/reactivex/processors/PublishProcessor<TT;>;"
    iget-object v0, p0, Lio/reactivex/processors/PublishProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/processors/PublishProcessor;->TERMINATED:[Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    if-ne v0, v1, :cond_0

    .line 271
    iget-object v0, p0, Lio/reactivex/processors/PublishProcessor;->error:Ljava/lang/Throwable;

    .line 273
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasComplete()Z
    .locals 2

    .prologue
    .line 283
    .local p0, "this":Lio/reactivex/processors/PublishProcessor;, "Lio/reactivex/processors/PublishProcessor<TT;>;"
    iget-object v0, p0, Lio/reactivex/processors/PublishProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/processors/PublishProcessor;->TERMINATED:[Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lio/reactivex/processors/PublishProcessor;->error:Ljava/lang/Throwable;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasSubscribers()Z
    .locals 1

    .prologue
    .line 265
    .local p0, "this":Lio/reactivex/processors/PublishProcessor;, "Lio/reactivex/processors/PublishProcessor<TT;>;"
    iget-object v0, p0, Lio/reactivex/processors/PublishProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    array-length v0, v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasThrowable()Z
    .locals 2

    .prologue
    .line 278
    .local p0, "this":Lio/reactivex/processors/PublishProcessor;, "Lio/reactivex/processors/PublishProcessor<TT;>;"
    iget-object v0, p0, Lio/reactivex/processors/PublishProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/processors/PublishProcessor;->TERMINATED:[Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lio/reactivex/processors/PublishProcessor;->error:Ljava/lang/Throwable;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public offer(Ljava/lang/Object;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/processors/PublishProcessor;, "Lio/reactivex/processors/PublishProcessor<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v5, 0x1

    .line 245
    if-nez p1, :cond_1

    .line 246
    new-instance v6, Ljava/lang/NullPointerException;

    const-string/jumbo v7, "onNext called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v6, v7}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v6}, Lio/reactivex/processors/PublishProcessor;->onError(Ljava/lang/Throwable;)V

    .line 260
    :cond_0
    :goto_0
    return v5

    .line 249
    :cond_1
    iget-object v6, p0, Lio/reactivex/processors/PublishProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    .line 251
    .local v1, "array":[Lio/reactivex/processors/PublishProcessor$PublishSubscription;, "[Lio/reactivex/processors/PublishProcessor$PublishSubscription<TT;>;"
    move-object v0, v1

    .local v0, "arr$":[Lio/reactivex/processors/PublishProcessor$PublishSubscription;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_1
    if-ge v2, v3, :cond_3

    aget-object v4, v0, v2

    .line 252
    .local v4, "s":Lio/reactivex/processors/PublishProcessor$PublishSubscription;, "Lio/reactivex/processors/PublishProcessor$PublishSubscription<TT;>;"
    invoke-virtual {v4}, Lio/reactivex/processors/PublishProcessor$PublishSubscription;->isFull()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 253
    const/4 v5, 0x0

    goto :goto_0

    .line 251
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 257
    .end local v4    # "s":Lio/reactivex/processors/PublishProcessor$PublishSubscription;, "Lio/reactivex/processors/PublishProcessor$PublishSubscription<TT;>;"
    :cond_3
    move-object v0, v1

    array-length v3, v0

    const/4 v2, 0x0

    :goto_2
    if-ge v2, v3, :cond_0

    aget-object v4, v0, v2

    .line 258
    .restart local v4    # "s":Lio/reactivex/processors/PublishProcessor$PublishSubscription;, "Lio/reactivex/processors/PublishProcessor$PublishSubscription<TT;>;"
    invoke-virtual {v4, p1}, Lio/reactivex/processors/PublishProcessor$PublishSubscription;->onNext(Ljava/lang/Object;)V

    .line 257
    add-int/lit8 v2, v2, 0x1

    goto :goto_2
.end method

.method public onComplete()V
    .locals 6

    .prologue
    .line 222
    .local p0, "this":Lio/reactivex/processors/PublishProcessor;, "Lio/reactivex/processors/PublishProcessor<TT;>;"
    iget-object v4, p0, Lio/reactivex/processors/PublishProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v4

    sget-object v5, Lio/reactivex/processors/PublishProcessor;->TERMINATED:[Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    if-ne v4, v5, :cond_1

    .line 228
    :cond_0
    return-void

    .line 225
    :cond_1
    iget-object v4, p0, Lio/reactivex/processors/PublishProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v5, Lio/reactivex/processors/PublishProcessor;->TERMINATED:[Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    .local v0, "arr$":[Lio/reactivex/processors/PublishProcessor$PublishSubscription;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 226
    .local v3, "s":Lio/reactivex/processors/PublishProcessor$PublishSubscription;, "Lio/reactivex/processors/PublishProcessor$PublishSubscription<TT;>;"
    invoke-virtual {v3}, Lio/reactivex/processors/PublishProcessor$PublishSubscription;->onComplete()V

    .line 225
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 6
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 205
    .local p0, "this":Lio/reactivex/processors/PublishProcessor;, "Lio/reactivex/processors/PublishProcessor<TT;>;"
    iget-object v4, p0, Lio/reactivex/processors/PublishProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v4

    sget-object v5, Lio/reactivex/processors/PublishProcessor;->TERMINATED:[Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    if-ne v4, v5, :cond_1

    .line 206
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 217
    :cond_0
    return-void

    .line 209
    :cond_1
    if-nez p1, :cond_2

    .line 210
    new-instance p1, Ljava/lang/NullPointerException;

    .end local p1    # "t":Ljava/lang/Throwable;
    const-string/jumbo v4, "onError called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {p1, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 212
    .restart local p1    # "t":Ljava/lang/Throwable;
    :cond_2
    iput-object p1, p0, Lio/reactivex/processors/PublishProcessor;->error:Ljava/lang/Throwable;

    .line 214
    iget-object v4, p0, Lio/reactivex/processors/PublishProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v5, Lio/reactivex/processors/PublishProcessor;->TERMINATED:[Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    .local v0, "arr$":[Lio/reactivex/processors/PublishProcessor$PublishSubscription;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 215
    .local v3, "s":Lio/reactivex/processors/PublishProcessor$PublishSubscription;, "Lio/reactivex/processors/PublishProcessor$PublishSubscription<TT;>;"
    invoke-virtual {v3, p1}, Lio/reactivex/processors/PublishProcessor$PublishSubscription;->onError(Ljava/lang/Throwable;)V

    .line 214
    add-int/lit8 v1, v1, 0x1

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
    .line 190
    .local p0, "this":Lio/reactivex/processors/PublishProcessor;, "Lio/reactivex/processors/PublishProcessor<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v4, p0, Lio/reactivex/processors/PublishProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v4

    sget-object v5, Lio/reactivex/processors/PublishProcessor;->TERMINATED:[Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    if-ne v4, v5, :cond_1

    .line 200
    :cond_0
    :goto_0
    return-void

    .line 193
    :cond_1
    if-nez p1, :cond_2

    .line 194
    new-instance v4, Ljava/lang/NullPointerException;

    const-string/jumbo v5, "onNext called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v4}, Lio/reactivex/processors/PublishProcessor;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 197
    :cond_2
    iget-object v4, p0, Lio/reactivex/processors/PublishProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    .local v0, "arr$":[Lio/reactivex/processors/PublishProcessor$PublishSubscription;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_1
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 198
    .local v3, "s":Lio/reactivex/processors/PublishProcessor$PublishSubscription;, "Lio/reactivex/processors/PublishProcessor$PublishSubscription<TT;>;"
    invoke-virtual {v3, p1}, Lio/reactivex/processors/PublishProcessor$PublishSubscription;->onNext(Ljava/lang/Object;)V

    .line 197
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 180
    .local p0, "this":Lio/reactivex/processors/PublishProcessor;, "Lio/reactivex/processors/PublishProcessor<TT;>;"
    iget-object v0, p0, Lio/reactivex/processors/PublishProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/processors/PublishProcessor;->TERMINATED:[Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    if-ne v0, v1, :cond_0

    .line 181
    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 186
    :goto_0
    return-void

    .line 185
    :cond_0
    const-wide v0, 0x7fffffffffffffffL

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0
.end method

.method remove(Lio/reactivex/processors/PublishProcessor$PublishSubscription;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/processors/PublishProcessor$PublishSubscription",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/processors/PublishProcessor;, "Lio/reactivex/processors/PublishProcessor<TT;>;"
    .local p1, "ps":Lio/reactivex/processors/PublishProcessor$PublishSubscription;, "Lio/reactivex/processors/PublishProcessor$PublishSubscription<TT;>;"
    const/4 v7, 0x0

    .line 145
    :cond_0
    iget-object v5, p0, Lio/reactivex/processors/PublishProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    .line 146
    .local v0, "a":[Lio/reactivex/processors/PublishProcessor$PublishSubscription;, "[Lio/reactivex/processors/PublishProcessor$PublishSubscription<TT;>;"
    sget-object v5, Lio/reactivex/processors/PublishProcessor;->TERMINATED:[Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    if-eq v0, v5, :cond_1

    sget-object v5, Lio/reactivex/processors/PublishProcessor;->EMPTY:[Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    if-ne v0, v5, :cond_2

    .line 173
    :cond_1
    :goto_0
    return-void

    .line 150
    :cond_2
    array-length v4, v0

    .line 151
    .local v4, "n":I
    const/4 v3, -0x1

    .line 152
    .local v3, "j":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v4, :cond_3

    .line 153
    aget-object v5, v0, v2

    if-ne v5, p1, :cond_4

    .line 154
    move v3, v2

    .line 159
    :cond_3
    if-ltz v3, :cond_1

    .line 165
    const/4 v5, 0x1

    if-ne v4, v5, :cond_5

    .line 166
    sget-object v1, Lio/reactivex/processors/PublishProcessor;->EMPTY:[Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    .line 172
    .local v1, "b":[Lio/reactivex/processors/PublishProcessor$PublishSubscription;, "[Lio/reactivex/processors/PublishProcessor$PublishSubscription<TT;>;"
    :goto_2
    iget-object v5, p0, Lio/reactivex/processors/PublishProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    .line 152
    .end local v1    # "b":[Lio/reactivex/processors/PublishProcessor$PublishSubscription;, "[Lio/reactivex/processors/PublishProcessor$PublishSubscription<TT;>;"
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 168
    :cond_5
    add-int/lit8 v5, v4, -0x1

    new-array v1, v5, [Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    .line 169
    .restart local v1    # "b":[Lio/reactivex/processors/PublishProcessor$PublishSubscription;, "[Lio/reactivex/processors/PublishProcessor$PublishSubscription<TT;>;"
    invoke-static {v0, v7, v1, v7, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 170
    add-int/lit8 v5, v3, 0x1

    sub-int v6, v4, v3

    add-int/lit8 v6, v6, -0x1

    invoke-static {v0, v5, v1, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2
.end method

.method public subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 95
    .local p0, "this":Lio/reactivex/processors/PublishProcessor;, "Lio/reactivex/processors/PublishProcessor<TT;>;"
    .local p1, "t":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    new-instance v1, Lio/reactivex/processors/PublishProcessor$PublishSubscription;

    invoke-direct {v1, p1, p0}, Lio/reactivex/processors/PublishProcessor$PublishSubscription;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/processors/PublishProcessor;)V

    .line 96
    .local v1, "ps":Lio/reactivex/processors/PublishProcessor$PublishSubscription;, "Lio/reactivex/processors/PublishProcessor$PublishSubscription<TT;>;"
    invoke-interface {p1, v1}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 97
    invoke-virtual {p0, v1}, Lio/reactivex/processors/PublishProcessor;->add(Lio/reactivex/processors/PublishProcessor$PublishSubscription;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 100
    invoke-virtual {v1}, Lio/reactivex/processors/PublishProcessor$PublishSubscription;->isCancelled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 101
    invoke-virtual {p0, v1}, Lio/reactivex/processors/PublishProcessor;->remove(Lio/reactivex/processors/PublishProcessor$PublishSubscription;)V

    .line 111
    :cond_0
    :goto_0
    return-void

    .line 104
    :cond_1
    iget-object v0, p0, Lio/reactivex/processors/PublishProcessor;->error:Ljava/lang/Throwable;

    .line 105
    .local v0, "ex":Ljava/lang/Throwable;
    if-eqz v0, :cond_2

    .line 106
    invoke-interface {p1, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 108
    :cond_2
    invoke-interface {p1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0
.end method
