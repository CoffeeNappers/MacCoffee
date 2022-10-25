.class final Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription;
.super Lio/reactivex/internal/operators/flowable/FlowableFromArray$BaseArraySubscription;
.source "FlowableFromArray.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableFromArray;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ArrayConditionalSubscription"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/flowable/FlowableFromArray$BaseArraySubscription",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x23e7f25903d0c345L


# instance fields
.field final actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
            "<-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;[Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
            "<-TT;>;[TT;)V"
        }
    .end annotation

    .prologue
    .line 199
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription<TT;>;"
    .local p1, "actual":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-TT;>;"
    .local p2, "array":[Ljava/lang/Object;, "[TT;"
    invoke-direct {p0, p2}, Lio/reactivex/internal/operators/flowable/FlowableFromArray$BaseArraySubscription;-><init>([Ljava/lang/Object;)V

    .line 200
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 201
    return-void
.end method


# virtual methods
.method fastPath()V
    .locals 7

    .prologue
    .line 205
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription<TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription;->array:[Ljava/lang/Object;

    .line 206
    .local v1, "arr":[Ljava/lang/Object;, "[TT;"
    array-length v2, v1

    .line 207
    .local v2, "f":I
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 209
    .local v0, "a":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-TT;>;"
    iget v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription;->index:I

    .local v3, "i":I
    :goto_0
    if-eq v3, v2, :cond_3

    .line 210
    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription;->cancelled:Z

    if-eqz v5, :cond_1

    .line 225
    :cond_0
    :goto_1
    return-void

    .line 213
    :cond_1
    aget-object v4, v1, v3

    .line 214
    .local v4, "t":Ljava/lang/Object;, "TT;"
    if-nez v4, :cond_2

    .line 215
    new-instance v5, Ljava/lang/NullPointerException;

    const-string/jumbo v6, "array element is null"

    invoke-direct {v5, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v5}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 218
    :cond_2
    invoke-interface {v0, v4}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    .line 209
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 221
    .end local v4    # "t":Ljava/lang/Object;, "TT;"
    :cond_3
    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription;->cancelled:Z

    if-nez v5, :cond_0

    .line 224
    invoke-interface {v0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onComplete()V

    goto :goto_1
.end method

.method slowPath(J)V
    .locals 11
    .param p1, "r"    # J

    .prologue
    .line 229
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription<TT;>;"
    const-wide/16 v2, 0x0

    .line 230
    .local v2, "e":J
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription;->array:[Ljava/lang/Object;

    .line 231
    .local v1, "arr":[Ljava/lang/Object;, "[TT;"
    array-length v4, v1

    .line 232
    .local v4, "f":I
    iget v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription;->index:I

    .line 233
    .local v5, "i":I
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 237
    .local v0, "a":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-TT;>;"
    :cond_0
    :goto_0
    cmp-long v7, v2, p1

    if-eqz v7, :cond_5

    if-eq v5, v4, :cond_5

    .line 238
    iget-boolean v7, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription;->cancelled:Z

    if-eqz v7, :cond_2

    .line 268
    :cond_1
    :goto_1
    return-void

    .line 242
    :cond_2
    aget-object v6, v1, v5

    .line 244
    .local v6, "t":Ljava/lang/Object;, "TT;"
    if-nez v6, :cond_3

    .line 245
    new-instance v7, Ljava/lang/NullPointerException;

    const-string/jumbo v8, "array element is null"

    invoke-direct {v7, v8}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v7}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 248
    :cond_3
    invoke-interface {v0, v6}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 249
    const-wide/16 v8, 0x1

    add-long/2addr v2, v8

    .line 252
    :cond_4
    add-int/lit8 v5, v5, 0x1

    .line 254
    goto :goto_0

    .line 256
    .end local v6    # "t":Ljava/lang/Object;, "TT;"
    :cond_5
    if-ne v5, v4, :cond_6

    .line 257
    iget-boolean v7, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription;->cancelled:Z

    if-nez v7, :cond_1

    .line 258
    invoke-interface {v0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onComplete()V

    goto :goto_1

    .line 263
    :cond_6
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription;->get()J

    move-result-wide p1

    .line 264
    cmp-long v7, v2, p1

    if-nez v7, :cond_0

    .line 265
    iput v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription;->index:I

    .line 266
    neg-long v8, v2

    invoke-virtual {p0, v8, v9}, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArrayConditionalSubscription;->addAndGet(J)J

    move-result-wide p1

    .line 267
    const-wide/16 v8, 0x0

    cmp-long v7, p1, v8

    if-eqz v7, :cond_1

    .line 270
    const-wide/16 v2, 0x0

    goto :goto_0
.end method
