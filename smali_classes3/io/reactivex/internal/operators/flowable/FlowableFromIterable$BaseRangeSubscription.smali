.class abstract Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;
.super Lio/reactivex/internal/subscriptions/BasicQueueSubscription;
.source "FlowableFromIterable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableFromIterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "BaseRangeSubscription"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscriptions/BasicQueueSubscription",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x1f442a7d211232e5L


# instance fields
.field volatile cancelled:Z

.field it:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<+TT;>;"
        }
    .end annotation
.end field

.field once:Z


# direct methods
.method constructor <init>(Ljava/util/Iterator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 82
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription<TT;>;"
    .local p1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+TT;>;"
    invoke-direct {p0}, Lio/reactivex/internal/subscriptions/BasicQueueSubscription;-><init>()V

    .line 83
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;->it:Ljava/util/Iterator;

    .line 84
    return-void
.end method


# virtual methods
.method public final cancel()V
    .locals 1

    .prologue
    .line 134
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;->cancelled:Z

    .line 135
    return-void
.end method

.method public final clear()V
    .locals 1

    .prologue
    .line 115
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription<TT;>;"
    const/4 v0, 0x0

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;->it:Ljava/util/Iterator;

    .line 116
    return-void
.end method

.method abstract fastPath()V
.end method

.method public final isEmpty()Z
    .locals 1

    .prologue
    .line 110
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;->it:Ljava/util/Iterator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;->it:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final poll()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription<TT;>;"
    const/4 v0, 0x0

    .line 94
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;->it:Ljava/util/Iterator;

    if-nez v1, :cond_0

    .line 104
    :goto_0
    return-object v0

    .line 97
    :cond_0
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;->once:Z

    if-nez v1, :cond_2

    .line 98
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;->once:Z

    .line 104
    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;->it:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    const-string/jumbo v1, "Iterator.next() returned a null value"

    invoke-static {v0, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 100
    :cond_2
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;->it:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0
.end method

.method public final request(J)V
    .locals 5
    .param p1, "n"    # J

    .prologue
    .line 120
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription<TT;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 121
    invoke-static {p0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 122
    const-wide v0, 0x7fffffffffffffffL

    cmp-long v0, p1, v0

    if-nez v0, :cond_1

    .line 123
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;->fastPath()V

    .line 129
    :cond_0
    :goto_0
    return-void

    .line 125
    :cond_1
    invoke-virtual {p0, p1, p2}, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;->slowPath(J)V

    goto :goto_0
.end method

.method public final requestFusion(I)I
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 88
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription<TT;>;"
    and-int/lit8 v0, p1, 0x1

    return v0
.end method

.method abstract slowPath(J)V
.end method
