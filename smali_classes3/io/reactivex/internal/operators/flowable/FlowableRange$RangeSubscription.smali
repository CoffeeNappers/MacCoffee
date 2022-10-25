.class final Lio/reactivex/internal/operators/flowable/FlowableRange$RangeSubscription;
.super Lio/reactivex/internal/operators/flowable/FlowableRange$BaseRangeSubscription;
.source "FlowableRange.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableRange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "RangeSubscription"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x23e7f25903d0c345L


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;II)V
    .locals 0
    .param p2, "index"    # I
    .param p3, "end"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-",
            "Ljava/lang/Integer;",
            ">;II)V"
        }
    .end annotation

    .prologue
    .line 117
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Ljava/lang/Integer;>;"
    invoke-direct {p0, p2, p3}, Lio/reactivex/internal/operators/flowable/FlowableRange$BaseRangeSubscription;-><init>(II)V

    .line 118
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeSubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 119
    return-void
.end method


# virtual methods
.method fastPath()V
    .locals 4

    .prologue
    .line 123
    iget v1, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeSubscription;->end:I

    .line 124
    .local v1, "f":I
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeSubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 126
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Ljava/lang/Integer;>;"
    iget v2, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeSubscription;->index:I

    .local v2, "i":I
    :goto_0
    if-eq v2, v1, :cond_2

    .line 127
    iget-boolean v3, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeSubscription;->cancelled:Z

    if-eqz v3, :cond_1

    .line 136
    :cond_0
    :goto_1
    return-void

    .line 130
    :cond_1
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 126
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 132
    :cond_2
    iget-boolean v3, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeSubscription;->cancelled:Z

    if-nez v3, :cond_0

    .line 135
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_1
.end method

.method slowPath(J)V
    .locals 9
    .param p1, "r"    # J

    .prologue
    .line 140
    const-wide/16 v2, 0x0

    .line 141
    .local v2, "e":J
    iget v1, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeSubscription;->end:I

    .line 142
    .local v1, "f":I
    iget v4, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeSubscription;->index:I

    .line 143
    .local v4, "i":I
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeSubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 147
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Ljava/lang/Integer;>;"
    :cond_0
    :goto_0
    cmp-long v5, v2, p1

    if-eqz v5, :cond_3

    if-eq v4, v1, :cond_3

    .line 148
    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeSubscription;->cancelled:Z

    if-eqz v5, :cond_2

    .line 170
    :cond_1
    :goto_1
    return-void

    .line 152
    :cond_2
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 154
    const-wide/16 v6, 0x1

    add-long/2addr v2, v6

    .line 155
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 158
    :cond_3
    if-ne v4, v1, :cond_4

    .line 159
    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeSubscription;->cancelled:Z

    if-nez v5, :cond_1

    .line 160
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_1

    .line 165
    :cond_4
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeSubscription;->get()J

    move-result-wide p1

    .line 166
    cmp-long v5, v2, p1

    if-nez v5, :cond_0

    .line 167
    iput v4, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeSubscription;->index:I

    .line 168
    neg-long v6, v2

    invoke-virtual {p0, v6, v7}, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeSubscription;->addAndGet(J)J

    move-result-wide p1

    .line 169
    const-wide/16 v6, 0x0

    cmp-long v5, p1, v6

    if-eqz v5, :cond_1

    .line 172
    const-wide/16 v2, 0x0

    goto :goto_0
.end method
