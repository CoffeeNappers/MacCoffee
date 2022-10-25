.class final Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;
.super Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;
.source "FlowableReplay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableReplay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SizeAndTimeBoundReplayBuffer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x2ffd21f3bea38aacL


# instance fields
.field final limit:I

.field final maxAge:J

.field final scheduler:Lio/reactivex/Scheduler;

.field final unit:Ljava/util/concurrent/TimeUnit;


# direct methods
.method constructor <init>(IJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)V
    .locals 0
    .param p1, "limit"    # I
    .param p2, "maxAge"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "scheduler"    # Lio/reactivex/Scheduler;

    .prologue
    .line 1000
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer<TT;>;"
    invoke-direct {p0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$BoundedReplayBuffer;-><init>()V

    .line 1001
    iput-object p5, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->scheduler:Lio/reactivex/Scheduler;

    .line 1002
    iput p1, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->limit:I

    .line 1003
    iput-wide p2, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->maxAge:J

    .line 1004
    iput-object p4, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->unit:Ljava/util/concurrent/TimeUnit;

    .line 1005
    return-void
.end method


# virtual methods
.method enterTransform(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 1009
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer<TT;>;"
    new-instance v0, Lio/reactivex/schedulers/Timed;

    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->scheduler:Lio/reactivex/Scheduler;

    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2}, Lio/reactivex/Scheduler;->now(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v2

    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-direct {v0, p1, v2, v3, v1}, Lio/reactivex/schedulers/Timed;-><init>(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V

    return-object v0
.end method

.method getHead()Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    .locals 10

    .prologue
    .line 1081
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer<TT;>;"
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->scheduler:Lio/reactivex/Scheduler;

    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v5, v6}, Lio/reactivex/Scheduler;->now(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v6

    iget-wide v8, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->maxAge:J

    sub-long v2, v6, v8

    .line 1082
    .local v2, "timeLimit":J
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    .line 1083
    .local v1, "prev":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    invoke-virtual {v1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    .line 1085
    .local v0, "next":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    :goto_0
    if-nez v0, :cond_1

    .line 1099
    :cond_0
    return-object v1

    .line 1088
    :cond_1
    iget-object v4, v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;->value:Ljava/lang/Object;

    check-cast v4, Lio/reactivex/schedulers/Timed;

    .line 1089
    .local v4, "v":Lio/reactivex/schedulers/Timed;, "Lio/reactivex/schedulers/Timed<*>;"
    invoke-virtual {v4}, Lio/reactivex/schedulers/Timed;->value()Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {v4}, Lio/reactivex/schedulers/Timed;->value()Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 1092
    invoke-virtual {v4}, Lio/reactivex/schedulers/Timed;->time()J

    move-result-wide v6

    cmp-long v5, v6, v2

    if-gtz v5, :cond_0

    .line 1093
    move-object v1, v0

    .line 1094
    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;->get()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "next":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    check-cast v0, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    .line 1098
    .restart local v0    # "next":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    goto :goto_0
.end method

.method leaveTransform(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 1014
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer<TT;>;"
    check-cast p1, Lio/reactivex/schedulers/Timed;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-virtual {p1}, Lio/reactivex/schedulers/Timed;->value()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method truncate()V
    .locals 10

    .prologue
    .line 1019
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer<TT;>;"
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->scheduler:Lio/reactivex/Scheduler;

    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v6, v7}, Lio/reactivex/Scheduler;->now(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v6

    iget-wide v8, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->maxAge:J

    sub-long v4, v6, v8

    .line 1021
    .local v4, "timeLimit":J
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    .line 1022
    .local v2, "prev":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    invoke-virtual {v2}, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    .line 1024
    .local v1, "next":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    const/4 v0, 0x0

    .line 1026
    .local v0, "e":I
    :goto_0
    if-eqz v1, :cond_1

    .line 1027
    iget v6, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->size:I

    iget v7, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->limit:I

    if-le v6, v7, :cond_0

    .line 1028
    add-int/lit8 v0, v0, 0x1

    .line 1029
    iget v6, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->size:I

    add-int/lit8 v6, v6, -0x1

    iput v6, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->size:I

    .line 1030
    move-object v2, v1

    .line 1031
    invoke-virtual {v1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;->get()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "next":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    check-cast v1, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    .restart local v1    # "next":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    goto :goto_0

    .line 1033
    :cond_0
    iget-object v3, v1, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;->value:Ljava/lang/Object;

    check-cast v3, Lio/reactivex/schedulers/Timed;

    .line 1034
    .local v3, "v":Lio/reactivex/schedulers/Timed;, "Lio/reactivex/schedulers/Timed<*>;"
    invoke-virtual {v3}, Lio/reactivex/schedulers/Timed;->time()J

    move-result-wide v6

    cmp-long v6, v6, v4

    if-gtz v6, :cond_1

    .line 1035
    add-int/lit8 v0, v0, 0x1

    .line 1036
    iget v6, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->size:I

    add-int/lit8 v6, v6, -0x1

    iput v6, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->size:I

    .line 1037
    move-object v2, v1

    .line 1038
    invoke-virtual {v1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;->get()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "next":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    check-cast v1, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    .line 1042
    .restart local v1    # "next":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    goto :goto_0

    .line 1047
    .end local v3    # "v":Lio/reactivex/schedulers/Timed;, "Lio/reactivex/schedulers/Timed<*>;"
    :cond_1
    if-eqz v0, :cond_2

    .line 1048
    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->setFirst(Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;)V

    .line 1050
    :cond_2
    return-void
.end method

.method truncateFinal()V
    .locals 10

    .prologue
    .line 1053
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer<TT;>;"
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->scheduler:Lio/reactivex/Scheduler;

    iget-object v7, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v6, v7}, Lio/reactivex/Scheduler;->now(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v6

    iget-wide v8, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->maxAge:J

    sub-long v4, v6, v8

    .line 1055
    .local v4, "timeLimit":J
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    .line 1056
    .local v2, "prev":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    invoke-virtual {v2}, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    .line 1058
    .local v1, "next":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    const/4 v0, 0x0

    .line 1060
    .local v0, "e":I
    :goto_0
    if-eqz v1, :cond_0

    iget v6, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->size:I

    const/4 v7, 0x1

    if-le v6, v7, :cond_0

    .line 1061
    iget-object v3, v1, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;->value:Ljava/lang/Object;

    check-cast v3, Lio/reactivex/schedulers/Timed;

    .line 1062
    .local v3, "v":Lio/reactivex/schedulers/Timed;, "Lio/reactivex/schedulers/Timed<*>;"
    invoke-virtual {v3}, Lio/reactivex/schedulers/Timed;->time()J

    move-result-wide v6

    cmp-long v6, v6, v4

    if-gtz v6, :cond_0

    .line 1063
    add-int/lit8 v0, v0, 0x1

    .line 1064
    iget v6, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->size:I

    add-int/lit8 v6, v6, -0x1

    iput v6, p0, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->size:I

    .line 1065
    move-object v2, v1

    .line 1066
    invoke-virtual {v1}, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;->get()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "next":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    check-cast v1, Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;

    .line 1070
    .restart local v1    # "next":Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;
    goto :goto_0

    .line 1074
    .end local v3    # "v":Lio/reactivex/schedulers/Timed;, "Lio/reactivex/schedulers/Timed<*>;"
    :cond_0
    if-eqz v0, :cond_1

    .line 1075
    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/flowable/FlowableReplay$SizeAndTimeBoundReplayBuffer;->setFirst(Lio/reactivex/internal/operators/flowable/FlowableReplay$Node;)V

    .line 1077
    :cond_1
    return-void
.end method
