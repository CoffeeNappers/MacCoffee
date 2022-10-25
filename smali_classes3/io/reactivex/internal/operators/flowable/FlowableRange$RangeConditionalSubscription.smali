.class final Lio/reactivex/internal/operators/flowable/FlowableRange$RangeConditionalSubscription;
.super Lio/reactivex/internal/operators/flowable/FlowableRange$BaseRangeSubscription;
.source "FlowableRange.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableRange;
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
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;II)V
    .locals 0
    .param p2, "index"    # I
    .param p3, "end"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
            "<-",
            "Ljava/lang/Integer;",
            ">;II)V"
        }
    .end annotation

    .prologue
    .line 186
    .local p1, "actual":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-Ljava/lang/Integer;>;"
    invoke-direct {p0, p2, p3}, Lio/reactivex/internal/operators/flowable/FlowableRange$BaseRangeSubscription;-><init>(II)V

    .line 187
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeConditionalSubscription;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 188
    return-void
.end method


# virtual methods
.method fastPath()V
    .locals 4

    .prologue
    .line 192
    iget v1, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeConditionalSubscription;->end:I

    .line 193
    .local v1, "f":I
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeConditionalSubscription;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 195
    .local v0, "a":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-Ljava/lang/Integer;>;"
    iget v2, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeConditionalSubscription;->index:I

    .local v2, "i":I
    :goto_0
    if-eq v2, v1, :cond_2

    .line 196
    iget-boolean v3, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeConditionalSubscription;->cancelled:Z

    if-eqz v3, :cond_1

    .line 205
    :cond_0
    :goto_1
    return-void

    .line 199
    :cond_1
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    .line 195
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 201
    :cond_2
    iget-boolean v3, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeConditionalSubscription;->cancelled:Z

    if-nez v3, :cond_0

    .line 204
    invoke-interface {v0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onComplete()V

    goto :goto_1
.end method

.method slowPath(J)V
    .locals 9
    .param p1, "r"    # J

    .prologue
    .line 209
    const-wide/16 v2, 0x0

    .line 210
    .local v2, "e":J
    iget v1, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeConditionalSubscription;->end:I

    .line 211
    .local v1, "f":I
    iget v4, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeConditionalSubscription;->index:I

    .line 212
    .local v4, "i":I
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeConditionalSubscription;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 216
    .local v0, "a":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-Ljava/lang/Integer;>;"
    :cond_0
    :goto_0
    cmp-long v5, v2, p1

    if-eqz v5, :cond_4

    if-eq v4, v1, :cond_4

    .line 217
    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeConditionalSubscription;->cancelled:Z

    if-eqz v5, :cond_2

    .line 240
    :cond_1
    :goto_1
    return-void

    .line 221
    :cond_2
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 222
    const-wide/16 v6, 0x1

    add-long/2addr v2, v6

    .line 225
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 228
    :cond_4
    if-ne v4, v1, :cond_5

    .line 229
    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeConditionalSubscription;->cancelled:Z

    if-nez v5, :cond_1

    .line 230
    invoke-interface {v0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onComplete()V

    goto :goto_1

    .line 235
    :cond_5
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeConditionalSubscription;->get()J

    move-result-wide p1

    .line 236
    cmp-long v5, v2, p1

    if-nez v5, :cond_0

    .line 237
    iput v4, p0, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeConditionalSubscription;->index:I

    .line 238
    neg-long v6, v2

    invoke-virtual {p0, v6, v7}, Lio/reactivex/internal/operators/flowable/FlowableRange$RangeConditionalSubscription;->addAndGet(J)J

    move-result-wide p1

    .line 239
    const-wide/16 v6, 0x0

    cmp-long v5, p1, v6

    if-eqz v5, :cond_1

    .line 242
    const-wide/16 v2, 0x0

    goto :goto_0
.end method
