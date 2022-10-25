.class final Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription;
.super Lio/reactivex/internal/operators/flowable/FlowableFromArray$BaseArraySubscription;
.source "FlowableFromArray.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableFromArray;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ArraySubscription"
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
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;[Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;[TT;)V"
        }
    .end annotation

    .prologue
    .line 115
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription;, "Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p2, "array":[Ljava/lang/Object;, "[TT;"
    invoke-direct {p0, p2}, Lio/reactivex/internal/operators/flowable/FlowableFromArray$BaseArraySubscription;-><init>([Ljava/lang/Object;)V

    .line 116
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 117
    return-void
.end method


# virtual methods
.method fastPath()V
    .locals 7

    .prologue
    .line 121
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription;, "Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription<TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription;->array:[Ljava/lang/Object;

    .line 122
    .local v1, "arr":[Ljava/lang/Object;, "[TT;"
    array-length v2, v1

    .line 123
    .local v2, "f":I
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 125
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription;->index:I

    .local v3, "i":I
    :goto_0
    if-eq v3, v2, :cond_3

    .line 126
    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription;->cancelled:Z

    if-eqz v5, :cond_1

    .line 141
    :cond_0
    :goto_1
    return-void

    .line 129
    :cond_1
    aget-object v4, v1, v3

    .line 130
    .local v4, "t":Ljava/lang/Object;, "TT;"
    if-nez v4, :cond_2

    .line 131
    new-instance v5, Ljava/lang/NullPointerException;

    const-string/jumbo v6, "array element is null"

    invoke-direct {v5, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v5}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 134
    :cond_2
    invoke-interface {v0, v4}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 125
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 137
    .end local v4    # "t":Ljava/lang/Object;, "TT;"
    :cond_3
    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription;->cancelled:Z

    if-nez v5, :cond_0

    .line 140
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_1
.end method

.method slowPath(J)V
    .locals 11
    .param p1, "r"    # J

    .prologue
    .line 145
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription;, "Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription<TT;>;"
    const-wide/16 v2, 0x0

    .line 146
    .local v2, "e":J
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription;->array:[Ljava/lang/Object;

    .line 147
    .local v1, "arr":[Ljava/lang/Object;, "[TT;"
    array-length v4, v1

    .line 148
    .local v4, "f":I
    iget v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription;->index:I

    .line 149
    .local v5, "i":I
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 153
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    :cond_0
    :goto_0
    cmp-long v7, v2, p1

    if-eqz v7, :cond_4

    if-eq v5, v4, :cond_4

    .line 154
    iget-boolean v7, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription;->cancelled:Z

    if-eqz v7, :cond_2

    .line 183
    :cond_1
    :goto_1
    return-void

    .line 158
    :cond_2
    aget-object v6, v1, v5

    .line 160
    .local v6, "t":Ljava/lang/Object;, "TT;"
    if-nez v6, :cond_3

    .line 161
    new-instance v7, Ljava/lang/NullPointerException;

    const-string/jumbo v8, "array element is null"

    invoke-direct {v7, v8}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v7}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 164
    :cond_3
    invoke-interface {v0, v6}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 167
    const-wide/16 v8, 0x1

    add-long/2addr v2, v8

    .line 168
    add-int/lit8 v5, v5, 0x1

    .line 169
    goto :goto_0

    .line 171
    .end local v6    # "t":Ljava/lang/Object;, "TT;"
    :cond_4
    if-ne v5, v4, :cond_5

    .line 172
    iget-boolean v7, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription;->cancelled:Z

    if-nez v7, :cond_1

    .line 173
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_1

    .line 178
    :cond_5
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription;->get()J

    move-result-wide p1

    .line 179
    cmp-long v7, v2, p1

    if-nez v7, :cond_0

    .line 180
    iput v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription;->index:I

    .line 181
    neg-long v8, v2

    invoke-virtual {p0, v8, v9}, Lio/reactivex/internal/operators/flowable/FlowableFromArray$ArraySubscription;->addAndGet(J)J

    move-result-wide p1

    .line 182
    const-wide/16 v8, 0x0

    cmp-long v7, p1, v8

    if-eqz v7, :cond_1

    .line 185
    const-wide/16 v2, 0x0

    goto :goto_0
.end method
