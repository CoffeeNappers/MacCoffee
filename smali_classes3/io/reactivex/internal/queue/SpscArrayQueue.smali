.class public final Lio/reactivex/internal/queue/SpscArrayQueue;
.super Ljava/util/concurrent/atomic/AtomicReferenceArray;
.source "SpscArrayQueue.java"

# interfaces
.implements Lio/reactivex/internal/fuseable/SimplePlainQueue;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicReferenceArray",
        "<TE;>;",
        "Lio/reactivex/internal/fuseable/SimplePlainQueue",
        "<TE;>;"
    }
.end annotation


# static fields
.field private static final MAX_LOOK_AHEAD_STEP:Ljava/lang/Integer;

.field private static final serialVersionUID:J = -0x11fe70baff9afb41L


# instance fields
.field final consumerIndex:Ljava/util/concurrent/atomic/AtomicLong;

.field final lookAheadStep:I

.field final mask:I

.field final producerIndex:Ljava/util/concurrent/atomic/AtomicLong;

.field producerLookAhead:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 43
    const-string/jumbo v0, "jctools.spsc.max.lookahead.step"

    const/16 v1, 0x1000

    invoke-static {v0, v1}, Ljava/lang/Integer;->getInteger(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lio/reactivex/internal/queue/SpscArrayQueue;->MAX_LOOK_AHEAD_STEP:Ljava/lang/Integer;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2
    .param p1, "capacity"    # I

    .prologue
    .line 51
    .local p0, "this":Lio/reactivex/internal/queue/SpscArrayQueue;, "Lio/reactivex/internal/queue/SpscArrayQueue<TE;>;"
    invoke-static {p1}, Lio/reactivex/internal/util/Pow2;->roundToPowerOfTwo(I)I

    move-result v0

    invoke-direct {p0, v0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;-><init>(I)V

    .line 52
    invoke-virtual {p0}, Lio/reactivex/internal/queue/SpscArrayQueue;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lio/reactivex/internal/queue/SpscArrayQueue;->mask:I

    .line 53
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/queue/SpscArrayQueue;->producerIndex:Ljava/util/concurrent/atomic/AtomicLong;

    .line 54
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/queue/SpscArrayQueue;->consumerIndex:Ljava/util/concurrent/atomic/AtomicLong;

    .line 55
    div-int/lit8 v0, p1, 0x4

    sget-object v1, Lio/reactivex/internal/queue/SpscArrayQueue;->MAX_LOOK_AHEAD_STEP:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lio/reactivex/internal/queue/SpscArrayQueue;->lookAheadStep:I

    .line 56
    return-void
.end method


# virtual methods
.method calcElementOffset(J)I
    .locals 3
    .param p1, "index"    # J

    .prologue
    .line 125
    .local p0, "this":Lio/reactivex/internal/queue/SpscArrayQueue;, "Lio/reactivex/internal/queue/SpscArrayQueue<TE;>;"
    long-to-int v0, p1

    iget v1, p0, Lio/reactivex/internal/queue/SpscArrayQueue;->mask:I

    and-int/2addr v0, v1

    return v0
.end method

.method calcElementOffset(JI)I
    .locals 1
    .param p1, "index"    # J
    .param p3, "mask"    # I

    .prologue
    .line 121
    .local p0, "this":Lio/reactivex/internal/queue/SpscArrayQueue;, "Lio/reactivex/internal/queue/SpscArrayQueue<TE;>;"
    long-to-int v0, p1

    and-int/2addr v0, p3

    return v0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 117
    .local p0, "this":Lio/reactivex/internal/queue/SpscArrayQueue;, "Lio/reactivex/internal/queue/SpscArrayQueue<TE;>;"
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/queue/SpscArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lio/reactivex/internal/queue/SpscArrayQueue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 118
    return-void
.end method

.method public isEmpty()Z
    .locals 4

    .prologue
    .line 103
    .local p0, "this":Lio/reactivex/internal/queue/SpscArrayQueue;, "Lio/reactivex/internal/queue/SpscArrayQueue<TE;>;"
    iget-object v0, p0, Lio/reactivex/internal/queue/SpscArrayQueue;->producerIndex:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    iget-object v2, p0, Lio/reactivex/internal/queue/SpscArrayQueue;->consumerIndex:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method lvElement(I)Ljava/lang/Object;
    .locals 1
    .param p1, "offset"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .prologue
    .line 133
    .local p0, "this":Lio/reactivex/internal/queue/SpscArrayQueue;, "Lio/reactivex/internal/queue/SpscArrayQueue<TE;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/queue/SpscArrayQueue;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public offer(Ljava/lang/Object;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .line 60
    .local p0, "this":Lio/reactivex/internal/queue/SpscArrayQueue;, "Lio/reactivex/internal/queue/SpscArrayQueue<TE;>;"
    .local p1, "e":Ljava/lang/Object;, "TE;"
    if-nez p1, :cond_0

    .line 61
    new-instance v5, Ljava/lang/NullPointerException;

    const-string/jumbo v6, "Null is not a valid element"

    invoke-direct {v5, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 64
    :cond_0
    iget v2, p0, Lio/reactivex/internal/queue/SpscArrayQueue;->mask:I

    .line 65
    .local v2, "mask":I
    iget-object v5, p0, Lio/reactivex/internal/queue/SpscArrayQueue;->producerIndex:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    .line 66
    .local v0, "index":J
    invoke-virtual {p0, v0, v1, v2}, Lio/reactivex/internal/queue/SpscArrayQueue;->calcElementOffset(JI)I

    move-result v3

    .line 67
    .local v3, "offset":I
    iget-wide v6, p0, Lio/reactivex/internal/queue/SpscArrayQueue;->producerLookAhead:J

    cmp-long v5, v0, v6

    if-ltz v5, :cond_1

    .line 68
    iget v4, p0, Lio/reactivex/internal/queue/SpscArrayQueue;->lookAheadStep:I

    .line 69
    .local v4, "step":I
    int-to-long v6, v4

    add-long/2addr v6, v0

    invoke-virtual {p0, v6, v7, v2}, Lio/reactivex/internal/queue/SpscArrayQueue;->calcElementOffset(JI)I

    move-result v5

    invoke-virtual {p0, v5}, Lio/reactivex/internal/queue/SpscArrayQueue;->lvElement(I)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_2

    .line 70
    int-to-long v6, v4

    add-long/2addr v6, v0

    iput-wide v6, p0, Lio/reactivex/internal/queue/SpscArrayQueue;->producerLookAhead:J

    .line 75
    .end local v4    # "step":I
    :cond_1
    invoke-virtual {p0, v3, p1}, Lio/reactivex/internal/queue/SpscArrayQueue;->soElement(ILjava/lang/Object;)V

    .line 76
    const-wide/16 v6, 0x1

    add-long/2addr v6, v0

    invoke-virtual {p0, v6, v7}, Lio/reactivex/internal/queue/SpscArrayQueue;->soProducerIndex(J)V

    .line 77
    const/4 v5, 0x1

    :goto_0
    return v5

    .line 71
    .restart local v4    # "step":I
    :cond_2
    invoke-virtual {p0, v3}, Lio/reactivex/internal/queue/SpscArrayQueue;->lvElement(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 72
    const/4 v5, 0x0

    goto :goto_0
.end method

.method public offer(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;TE;)Z"
        }
    .end annotation

    .prologue
    .line 83
    .local p0, "this":Lio/reactivex/internal/queue/SpscArrayQueue;, "Lio/reactivex/internal/queue/SpscArrayQueue<TE;>;"
    .local p1, "v1":Ljava/lang/Object;, "TE;"
    .local p2, "v2":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/queue/SpscArrayQueue;->offer(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p2}, Lio/reactivex/internal/queue/SpscArrayQueue;->offer(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public poll()Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/queue/SpscArrayQueue;, "Lio/reactivex/internal/queue/SpscArrayQueue<TE;>;"
    const/4 v4, 0x0

    .line 89
    iget-object v5, p0, Lio/reactivex/internal/queue/SpscArrayQueue;->consumerIndex:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    .line 90
    .local v2, "index":J
    invoke-virtual {p0, v2, v3}, Lio/reactivex/internal/queue/SpscArrayQueue;->calcElementOffset(J)I

    move-result v1

    .line 92
    .local v1, "offset":I
    invoke-virtual {p0, v1}, Lio/reactivex/internal/queue/SpscArrayQueue;->lvElement(I)Ljava/lang/Object;

    move-result-object v0

    .line 93
    .local v0, "e":Ljava/lang/Object;, "TE;"
    if-nez v0, :cond_0

    move-object v0, v4

    .line 98
    .end local v0    # "e":Ljava/lang/Object;, "TE;"
    :goto_0
    return-object v0

    .line 96
    .restart local v0    # "e":Ljava/lang/Object;, "TE;"
    :cond_0
    const-wide/16 v6, 0x1

    add-long/2addr v6, v2

    invoke-virtual {p0, v6, v7}, Lio/reactivex/internal/queue/SpscArrayQueue;->soConsumerIndex(J)V

    .line 97
    invoke-virtual {p0, v1, v4}, Lio/reactivex/internal/queue/SpscArrayQueue;->soElement(ILjava/lang/Object;)V

    goto :goto_0
.end method

.method soConsumerIndex(J)V
    .locals 1
    .param p1, "newIndex"    # J

    .prologue
    .line 111
    .local p0, "this":Lio/reactivex/internal/queue/SpscArrayQueue;, "Lio/reactivex/internal/queue/SpscArrayQueue<TE;>;"
    iget-object v0, p0, Lio/reactivex/internal/queue/SpscArrayQueue;->consumerIndex:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->lazySet(J)V

    .line 112
    return-void
.end method

.method soElement(ILjava/lang/Object;)V
    .locals 0
    .param p1, "offset"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)V"
        }
    .end annotation

    .prologue
    .line 129
    .local p0, "this":Lio/reactivex/internal/queue/SpscArrayQueue;, "Lio/reactivex/internal/queue/SpscArrayQueue<TE;>;"
    .local p2, "value":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1, p2}, Lio/reactivex/internal/queue/SpscArrayQueue;->lazySet(ILjava/lang/Object;)V

    .line 130
    return-void
.end method

.method soProducerIndex(J)V
    .locals 1
    .param p1, "newIndex"    # J

    .prologue
    .line 107
    .local p0, "this":Lio/reactivex/internal/queue/SpscArrayQueue;, "Lio/reactivex/internal/queue/SpscArrayQueue<TE;>;"
    iget-object v0, p0, Lio/reactivex/internal/queue/SpscArrayQueue;->producerIndex:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->lazySet(J)V

    .line 108
    return-void
.end method
