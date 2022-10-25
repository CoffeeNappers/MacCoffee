.class final Lio/reactivex/internal/operators/flowable/FlowableRangeLong$RangeConditionalSubscription;
.super Lio/reactivex/internal/operators/flowable/FlowableRangeLong$BaseRangeSubscription;
.source "FlowableRangeLong.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableRangeLong;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "RangeConditionalSubscription"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x23e7f25903d0c345L


# instance fields
.field final actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
            "<-",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;JJ)V
    .locals 0
    .param p2, "index"    # J
    .param p4, "end"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
            "<-",
            "Ljava/lang/Long;",
            ">;JJ)V"
        }
    .end annotation

    .prologue
    .line 187
    .local p1, "actual":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-Ljava/lang/Long;>;"
    invoke-direct {p0, p2, p3, p4, p5}, Lio/reactivex/internal/operators/flowable/FlowableRangeLong$BaseRangeSubscription;-><init>(JJ)V

    .line 188
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableRangeLong$RangeConditionalSubscription;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 189
    return-void
.end method


# virtual methods
.method fastPath()V
    .locals 8

    .prologue
    .line 193
    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableRangeLong$RangeConditionalSubscription;->end:J

    .line 194
    .local v2, "f":J
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRangeLong$RangeConditionalSubscription;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 196
    .local v0, "a":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-Ljava/lang/Long;>;"
    iget-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableRangeLong$RangeConditionalSubscription;->index:J

    .local v4, "i":J
    :goto_0
    cmp-long v1, v4, v2

    if-eqz v1, :cond_2

    .line 197
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableRangeLong$RangeConditionalSubscription;->cancelled:Z

    if-eqz v1, :cond_1

    .line 206
    :cond_0
    :goto_1
    return-void

    .line 200
    :cond_1
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    .line 196
    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    goto :goto_0

    .line 202
    :cond_2
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableRangeLong$RangeConditionalSubscription;->cancelled:Z

    if-nez v1, :cond_0

    .line 205
    invoke-interface {v0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onComplete()V

    goto :goto_1
.end method

.method slowPath(J)V
    .locals 13
    .param p1, "r"    # J

    .prologue
    const-wide/16 v10, 0x1

    .line 210
    const-wide/16 v2, 0x0

    .line 211
    .local v2, "e":J
    iget-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableRangeLong$RangeConditionalSubscription;->end:J

    .line 212
    .local v4, "f":J
    iget-wide v6, p0, Lio/reactivex/internal/operators/flowable/FlowableRangeLong$RangeConditionalSubscription;->index:J

    .line 213
    .local v6, "i":J
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRangeLong$RangeConditionalSubscription;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 217
    .local v0, "a":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-Ljava/lang/Long;>;"
    :cond_0
    :goto_0
    cmp-long v1, v2, p1

    if-eqz v1, :cond_4

    cmp-long v1, v6, v4

    if-eqz v1, :cond_4

    .line 218
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableRangeLong$RangeConditionalSubscription;->cancelled:Z

    if-eqz v1, :cond_2

    .line 241
    :cond_1
    :goto_1
    return-void

    .line 222
    :cond_2
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 223
    add-long/2addr v2, v10

    .line 226
    :cond_3
    add-long/2addr v6, v10

    goto :goto_0

    .line 229
    :cond_4
    cmp-long v1, v6, v4

    if-nez v1, :cond_5

    .line 230
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableRangeLong$RangeConditionalSubscription;->cancelled:Z

    if-nez v1, :cond_1

    .line 231
    invoke-interface {v0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onComplete()V

    goto :goto_1

    .line 236
    :cond_5
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableRangeLong$RangeConditionalSubscription;->get()J

    move-result-wide p1

    .line 237
    cmp-long v1, v2, p1

    if-nez v1, :cond_0

    .line 238
    iput-wide v6, p0, Lio/reactivex/internal/operators/flowable/FlowableRangeLong$RangeConditionalSubscription;->index:J

    .line 239
    neg-long v8, v2

    invoke-virtual {p0, v8, v9}, Lio/reactivex/internal/operators/flowable/FlowableRangeLong$RangeConditionalSubscription;->addAndGet(J)J

    move-result-wide p1

    .line 240
    const-wide/16 v8, 0x0

    cmp-long v1, p1, v8

    if-eqz v1, :cond_1

    .line 243
    const-wide/16 v2, 0x0

    goto :goto_0
.end method
