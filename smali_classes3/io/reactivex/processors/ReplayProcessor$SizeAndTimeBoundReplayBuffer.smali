.class final Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "ReplayProcessor.java"

# interfaces
.implements Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/processors/ReplayProcessor;
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
        "Ljava/util/concurrent/atomic/AtomicReference",
        "<",
        "Ljava/lang/Object;",
        ">;",
        "Lio/reactivex/processors/ReplayProcessor$ReplayBuffer",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x113e76ff643634bbL


# instance fields
.field volatile done:Z

.field volatile head:Lio/reactivex/processors/ReplayProcessor$TimedNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/processors/ReplayProcessor$TimedNode",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final maxAge:J

.field final maxSize:I

.field final scheduler:Lio/reactivex/Scheduler;

.field size:I

.field tail:Lio/reactivex/processors/ReplayProcessor$TimedNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/processors/ReplayProcessor$TimedNode",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final unit:Ljava/util/concurrent/TimeUnit;


# direct methods
.method constructor <init>(IJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)V
    .locals 4
    .param p1, "maxSize"    # I
    .param p2, "maxAge"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "scheduler"    # Lio/reactivex/Scheduler;

    .prologue
    .line 956
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;, "Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer<TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 957
    const-string/jumbo v1, "maxSize"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    move-result v1

    iput v1, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->maxSize:I

    .line 958
    const-string/jumbo v1, "maxAge"

    invoke-static {p2, p3, v1}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(JLjava/lang/String;)J

    move-result-wide v2

    iput-wide v2, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->maxAge:J

    .line 959
    const-string/jumbo v1, "unit is null"

    invoke-static {p4, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/TimeUnit;

    iput-object v1, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->unit:Ljava/util/concurrent/TimeUnit;

    .line 960
    const-string/jumbo v1, "scheduler is null"

    invoke-static {p5, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/Scheduler;

    iput-object v1, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->scheduler:Lio/reactivex/Scheduler;

    .line 961
    new-instance v0, Lio/reactivex/processors/ReplayProcessor$TimedNode;

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    invoke-direct {v0, v1, v2, v3}, Lio/reactivex/processors/ReplayProcessor$TimedNode;-><init>(Ljava/lang/Object;J)V

    .line 962
    .local v0, "h":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    iput-object v0, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->tail:Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 963
    iput-object v0, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->head:Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 964
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 1016
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;, "Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    new-instance v0, Lio/reactivex/processors/ReplayProcessor$TimedNode;

    iget-object v2, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->scheduler:Lio/reactivex/Scheduler;

    iget-object v3, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v3}, Lio/reactivex/Scheduler;->now(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v2

    invoke-direct {v0, p1, v2, v3}, Lio/reactivex/processors/ReplayProcessor$TimedNode;-><init>(Ljava/lang/Object;J)V

    .line 1017
    .local v0, "n":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    iget-object v1, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->tail:Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 1019
    .local v1, "t":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    iput-object v0, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->tail:Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 1020
    iget v2, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->size:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->size:I

    .line 1021
    invoke-virtual {v1, v0}, Lio/reactivex/processors/ReplayProcessor$TimedNode;->set(Ljava/lang/Object;)V

    .line 1023
    invoke-virtual {p0}, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->trim()V

    .line 1024
    return-void
.end method

.method public addFinal(Ljava/lang/Object;)V
    .locals 4
    .param p1, "notificationLite"    # Ljava/lang/Object;

    .prologue
    .line 1028
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;, "Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer<TT;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->lazySet(Ljava/lang/Object;)V

    .line 1029
    new-instance v0, Lio/reactivex/processors/ReplayProcessor$TimedNode;

    const-wide v2, 0x7fffffffffffffffL

    invoke-direct {v0, p1, v2, v3}, Lio/reactivex/processors/ReplayProcessor$TimedNode;-><init>(Ljava/lang/Object;J)V

    .line 1030
    .local v0, "n":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    iget-object v1, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->tail:Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 1032
    .local v1, "t":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    iput-object v0, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->tail:Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 1033
    iget v2, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->size:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->size:I

    .line 1034
    invoke-virtual {v1, v0}, Lio/reactivex/processors/ReplayProcessor$TimedNode;->set(Ljava/lang/Object;)V

    .line 1035
    invoke-virtual {p0}, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->trimFinal()V

    .line 1037
    const/4 v2, 0x1

    iput-boolean v2, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->done:Z

    .line 1038
    return-void
.end method

.method getHead()Lio/reactivex/processors/ReplayProcessor$TimedNode;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/processors/ReplayProcessor$TimedNode",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1097
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;, "Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer<TT;>;"
    iget-object v0, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->head:Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 1099
    .local v0, "index":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    iget-object v6, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->scheduler:Lio/reactivex/Scheduler;

    iget-object v7, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v6, v7}, Lio/reactivex/Scheduler;->now(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v6

    iget-wide v8, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->maxAge:J

    sub-long v2, v6, v8

    .line 1100
    .local v2, "limit":J
    invoke-virtual {v0}, Lio/reactivex/processors/ReplayProcessor$TimedNode;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 1101
    .local v1, "next":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    :goto_0
    if-eqz v1, :cond_0

    .line 1102
    iget-wide v4, v1, Lio/reactivex/processors/ReplayProcessor$TimedNode;->time:J

    .line 1103
    .local v4, "ts":J
    cmp-long v6, v4, v2

    if-lez v6, :cond_1

    .line 1109
    .end local v4    # "ts":J
    :cond_0
    return-object v0

    .line 1106
    .restart local v4    # "ts":J
    :cond_1
    move-object v0, v1

    .line 1107
    invoke-virtual {v0}, Lio/reactivex/processors/ReplayProcessor$TimedNode;->get()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "next":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    check-cast v1, Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 1108
    .restart local v1    # "next":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    goto :goto_0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 1043
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;, "Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer<TT;>;"
    const/4 v2, 0x0

    .line 1044
    .local v2, "prev":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    iget-object v0, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->head:Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 1047
    .local v0, "h":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    :goto_0
    invoke-virtual {v0}, Lio/reactivex/processors/ReplayProcessor$TimedNode;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 1048
    .local v1, "next":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    if-nez v1, :cond_1

    .line 1055
    iget-object v3, v0, Lio/reactivex/processors/ReplayProcessor$TimedNode;->value:Ljava/lang/Object;

    .line 1056
    .local v3, "v":Ljava/lang/Object;
    if-nez v3, :cond_2

    .line 1057
    const/4 v3, 0x0

    .line 1063
    .end local v3    # "v":Ljava/lang/Object;
    :cond_0
    :goto_1
    return-object v3

    .line 1051
    :cond_1
    move-object v2, v0

    .line 1052
    move-object v0, v1

    .line 1053
    goto :goto_0

    .line 1059
    .restart local v3    # "v":Ljava/lang/Object;
    :cond_2
    invoke-static {v3}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    invoke-static {v3}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1060
    :cond_3
    iget-object v3, v2, Lio/reactivex/processors/ReplayProcessor$TimedNode;->value:Ljava/lang/Object;

    goto :goto_1
.end method

.method public getValues([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)[TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;, "Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer<TT;>;"
    .local p1, "array":[Ljava/lang/Object;, "[TT;"
    const/4 v5, 0x0

    .line 1069
    invoke-virtual {p0}, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->getHead()Lio/reactivex/processors/ReplayProcessor$TimedNode;

    move-result-object v0

    .line 1070
    .local v0, "h":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    invoke-virtual {p0, v0}, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->size(Lio/reactivex/processors/ReplayProcessor$TimedNode;)I

    move-result v3

    .line 1072
    .local v3, "s":I
    if-nez v3, :cond_1

    .line 1073
    array-length v4, p1

    if-eqz v4, :cond_0

    .line 1074
    const/4 v4, 0x0

    aput-object v5, p1, v4

    .line 1093
    :cond_0
    :goto_0
    return-object p1

    .line 1077
    :cond_1
    array-length v4, p1

    if-ge v4, v3, :cond_2

    .line 1078
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v4

    invoke-static {v4, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/Object;

    move-object p1, v4

    check-cast p1, [Ljava/lang/Object;

    .line 1081
    :cond_2
    const/4 v1, 0x0

    .line 1082
    .local v1, "i":I
    :goto_1
    if-eq v1, v3, :cond_3

    .line 1083
    invoke-virtual {v0}, Lio/reactivex/processors/ReplayProcessor$TimedNode;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 1084
    .local v2, "next":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    iget-object v4, v2, Lio/reactivex/processors/ReplayProcessor$TimedNode;->value:Ljava/lang/Object;

    aput-object v4, p1, v1

    .line 1085
    add-int/lit8 v1, v1, 0x1

    .line 1086
    move-object v0, v2

    .line 1087
    goto :goto_1

    .line 1088
    .end local v2    # "next":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    :cond_3
    array-length v4, p1

    if-le v4, v3, :cond_0

    .line 1089
    aput-object v5, p1, v3

    goto :goto_0
.end method

.method public replay(Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/processors/ReplayProcessor$ReplaySubscription",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 1115
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;, "Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer<TT;>;"
    .local p1, "rs":Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;, "Lio/reactivex/processors/ReplayProcessor$ReplaySubscription<TT;>;"
    invoke-virtual {p1}, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->getAndIncrement()I

    move-result v7

    if-eqz v7, :cond_0

    .line 1187
    :goto_0
    return-void

    .line 1119
    :cond_0
    const/4 v4, 0x1

    .line 1120
    .local v4, "missed":I
    iget-object v0, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 1122
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-object v1, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->index:Ljava/lang/Object;

    check-cast v1, Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 1123
    .local v1, "index":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    if-nez v1, :cond_1

    .line 1124
    invoke-virtual {p0}, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->getHead()Lio/reactivex/processors/ReplayProcessor$TimedNode;

    move-result-object v1

    .line 1129
    :cond_1
    iget-object v7, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v8

    .line 1130
    .local v8, "r":J
    const-wide/16 v2, 0x0

    .line 1133
    .local v2, "e":J
    :goto_1
    iget-boolean v7, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->cancelled:Z

    if-eqz v7, :cond_2

    .line 1134
    const/4 v7, 0x0

    iput-object v7, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->index:Ljava/lang/Object;

    goto :goto_0

    .line 1138
    :cond_2
    invoke-virtual {v1}, Lio/reactivex/processors/ReplayProcessor$TimedNode;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 1140
    .local v5, "n":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    if-nez v5, :cond_5

    .line 1174
    :cond_3
    const-wide/16 v10, 0x0

    cmp-long v7, v2, v10

    if-eqz v7, :cond_4

    .line 1175
    iget-object v7, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v10

    const-wide v12, 0x7fffffffffffffffL

    cmp-long v7, v10, v12

    if-eqz v7, :cond_4

    .line 1176
    iget-object v7, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v7, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 1180
    :cond_4
    iput-object v1, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->index:Ljava/lang/Object;

    .line 1182
    neg-int v7, v4

    invoke-virtual {p1, v7}, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->addAndGet(I)I

    move-result v4

    .line 1183
    if-nez v4, :cond_1

    goto :goto_0

    .line 1144
    :cond_5
    iget-object v6, v5, Lio/reactivex/processors/ReplayProcessor$TimedNode;->value:Ljava/lang/Object;

    .line 1146
    .local v6, "o":Ljava/lang/Object;
    iget-boolean v7, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->done:Z

    if-eqz v7, :cond_7

    .line 1147
    invoke-virtual {v5}, Lio/reactivex/processors/ReplayProcessor$TimedNode;->get()Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_7

    .line 1149
    invoke-static {v6}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 1150
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 1154
    :goto_2
    const/4 v7, 0x0

    iput-object v7, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->index:Ljava/lang/Object;

    .line 1155
    const/4 v7, 0x1

    iput-boolean v7, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->cancelled:Z

    goto :goto_0

    .line 1152
    :cond_6
    invoke-static {v6}, Lio/reactivex/internal/util/NotificationLite;->getError(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v7

    invoke-interface {v0, v7}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_2

    .line 1160
    :cond_7
    const-wide/16 v10, 0x0

    cmp-long v7, v8, v10

    if-nez v7, :cond_8

    .line 1161
    iget-object v7, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v10

    add-long v8, v10, v2

    .line 1162
    const-wide/16 v10, 0x0

    cmp-long v7, v8, v10

    if-eqz v7, :cond_3

    .line 1167
    :cond_8
    invoke-interface {v0, v6}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 1168
    const-wide/16 v10, 0x1

    sub-long/2addr v8, v10

    .line 1169
    const-wide/16 v10, 0x1

    sub-long/2addr v2, v10

    .line 1171
    move-object v1, v5

    .line 1172
    goto :goto_1
.end method

.method public size()I
    .locals 1

    .prologue
    .line 1191
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;, "Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->getHead()Lio/reactivex/processors/ReplayProcessor$TimedNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->size(Lio/reactivex/processors/ReplayProcessor$TimedNode;)I

    move-result v0

    return v0
.end method

.method size(Lio/reactivex/processors/ReplayProcessor$TimedNode;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/processors/ReplayProcessor$TimedNode",
            "<",
            "Ljava/lang/Object;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 1195
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;, "Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer<TT;>;"
    .local p1, "h":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    const/4 v2, 0x0

    .line 1196
    .local v2, "s":I
    :goto_0
    const v3, 0x7fffffff

    if-eq v2, v3, :cond_1

    .line 1197
    invoke-virtual {p1}, Lio/reactivex/processors/ReplayProcessor$TimedNode;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 1198
    .local v0, "next":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    if-nez v0, :cond_2

    .line 1199
    iget-object v1, p1, Lio/reactivex/processors/ReplayProcessor$TimedNode;->value:Ljava/lang/Object;

    .line 1200
    .local v1, "o":Ljava/lang/Object;
    invoke-static {v1}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-static {v1}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1201
    :cond_0
    add-int/lit8 v2, v2, -0x1

    .line 1209
    .end local v0    # "next":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    .end local v1    # "o":Ljava/lang/Object;
    :cond_1
    return v2

    .line 1205
    .restart local v0    # "next":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 1206
    move-object p1, v0

    .line 1207
    goto :goto_0
.end method

.method trim()V
    .locals 8

    .prologue
    .line 967
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;, "Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer<TT;>;"
    iget v4, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->size:I

    iget v5, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->maxSize:I

    if-le v4, v5, :cond_0

    .line 968
    iget v4, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->size:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->size:I

    .line 969
    iget-object v0, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->head:Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 970
    .local v0, "h":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    invoke-virtual {v0}, Lio/reactivex/processors/ReplayProcessor$TimedNode;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lio/reactivex/processors/ReplayProcessor$TimedNode;

    iput-object v4, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->head:Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 972
    .end local v0    # "h":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    :cond_0
    iget-object v4, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->scheduler:Lio/reactivex/Scheduler;

    iget-object v5, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v5}, Lio/reactivex/Scheduler;->now(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v4

    iget-wide v6, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->maxAge:J

    sub-long v2, v4, v6

    .line 974
    .local v2, "limit":J
    iget-object v0, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->head:Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 977
    .restart local v0    # "h":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    :goto_0
    invoke-virtual {v0}, Lio/reactivex/processors/ReplayProcessor$TimedNode;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 978
    .local v1, "next":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    if-nez v1, :cond_1

    .line 979
    iput-object v0, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->head:Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 991
    :goto_1
    return-void

    .line 983
    :cond_1
    iget-wide v4, v1, Lio/reactivex/processors/ReplayProcessor$TimedNode;->time:J

    cmp-long v4, v4, v2

    if-lez v4, :cond_2

    .line 984
    iput-object v0, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->head:Lio/reactivex/processors/ReplayProcessor$TimedNode;

    goto :goto_1

    .line 988
    :cond_2
    move-object v0, v1

    .line 989
    goto :goto_0
.end method

.method trimFinal()V
    .locals 8

    .prologue
    .line 994
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;, "Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer<TT;>;"
    iget-object v4, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->scheduler:Lio/reactivex/Scheduler;

    iget-object v5, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v5}, Lio/reactivex/Scheduler;->now(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v4

    iget-wide v6, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->maxAge:J

    sub-long v2, v4, v6

    .line 996
    .local v2, "limit":J
    iget-object v0, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->head:Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 999
    .local v0, "h":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    :goto_0
    invoke-virtual {v0}, Lio/reactivex/processors/ReplayProcessor$TimedNode;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 1000
    .local v1, "next":Lio/reactivex/processors/ReplayProcessor$TimedNode;, "Lio/reactivex/processors/ReplayProcessor$TimedNode<Ljava/lang/Object;>;"
    invoke-virtual {v1}, Lio/reactivex/processors/ReplayProcessor$TimedNode;->get()Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_0

    .line 1001
    iput-object v0, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->head:Lio/reactivex/processors/ReplayProcessor$TimedNode;

    .line 1012
    :goto_1
    return-void

    .line 1005
    :cond_0
    iget-wide v4, v1, Lio/reactivex/processors/ReplayProcessor$TimedNode;->time:J

    cmp-long v4, v4, v2

    if-lez v4, :cond_1

    .line 1006
    iput-object v0, p0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;->head:Lio/reactivex/processors/ReplayProcessor$TimedNode;

    goto :goto_1

    .line 1010
    :cond_1
    move-object v0, v1

    .line 1011
    goto :goto_0
.end method
