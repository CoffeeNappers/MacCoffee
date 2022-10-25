.class Lcom/wmspanel/libstream/StreamBuffer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;,
        Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "StreamBuffer"


# instance fields
.field private volatile bh:Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

.field private volatile bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

.field private bw:J

.field private do:[Lcom/wmspanel/libstream/BufferItem;

.field private dp:I

.field private dq:I

.field private final dr:I

.field private ds:I

.field private dt:J

.field private du:J

.field private volatile dv:D


# direct methods
.method public constructor <init>(II)V
    .locals 4
    .param p1, "max_rtmp_buffer_items"    # I
    .param p2, "rtmp_buffer_initial_offset"    # I

    .prologue
    const-wide/16 v2, 0x0

    const/16 v0, 0xa

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-wide v2, p0, Lcom/wmspanel/libstream/StreamBuffer;->bw:J

    .line 127
    iput v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->dr:I

    .line 128
    iput v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->ds:I

    .line 129
    iput-wide v2, p0, Lcom/wmspanel/libstream/StreamBuffer;->dt:J

    .line 130
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->du:J

    .line 131
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    iput-wide v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->dv:D

    .line 14
    iput p2, p0, Lcom/wmspanel/libstream/StreamBuffer;->dp:I

    .line 15
    iget v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->dp:I

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->dq:I

    .line 16
    iget v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->dq:I

    new-array v0, v0, [Lcom/wmspanel/libstream/BufferItem;

    iput-object v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->do:[Lcom/wmspanel/libstream/BufferItem;

    .line 17
    return-void
.end method


# virtual methods
.method public a(Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;)V
    .locals 0

    .prologue
    .line 120
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamBuffer;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    .line 121
    return-void
.end method

.method public a(Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;)V
    .locals 0

    .prologue
    .line 111
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamBuffer;->bh:Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    .line 112
    return-void
.end method

.method public ac()Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->bh:Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    return-object v0
.end method

.method public ad()Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->bi:Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    return-object v0
.end method

.method public declared-synchronized d(J)Lcom/wmspanel/libstream/BufferItem;
    .locals 5

    .prologue
    .line 36
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->bw:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    .line 37
    const/4 v0, 0x0

    .line 48
    :goto_0
    monitor-exit p0

    return-object v0

    .line 40
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->bw:J

    sub-long/2addr v0, p1

    iget v2, p0, Lcom/wmspanel/libstream/StreamBuffer;->dp:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 41
    iget-wide v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->bw:J

    iget v2, p0, Lcom/wmspanel/libstream/StreamBuffer;->dp:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_2

    .line 42
    const-wide/16 p1, 0x0

    .line 48
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->do:[Lcom/wmspanel/libstream/BufferItem;

    iget v1, p0, Lcom/wmspanel/libstream/StreamBuffer;->dq:I

    int-to-long v2, v1

    rem-long v2, p1, v2

    long-to-int v1, v2

    aget-object v0, v0, v1

    goto :goto_0

    .line 44
    :cond_2
    iget-wide v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->bw:J

    iget v2, p0, Lcom/wmspanel/libstream/StreamBuffer;->dp:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    int-to-long v2, v2

    sub-long p1, v0, v2

    goto :goto_1

    .line 36
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected e(J)V
    .locals 7

    .prologue
    .line 138
    iget-wide v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->du:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->du:J

    cmp-long v0, p1, v0

    if-lez v0, :cond_0

    .line 139
    iget v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->ds:I

    if-lez v0, :cond_1

    .line 140
    iget v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->ds:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->ds:I

    .line 145
    :goto_0
    iget-wide v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->dt:J

    iget-wide v2, p0, Lcom/wmspanel/libstream/StreamBuffer;->du:J

    sub-long v2, p1, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->dt:J

    .line 147
    iget v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->ds:I

    if-nez v0, :cond_0

    .line 148
    const-wide v0, 0x40c3880000000000L    # 10000.0

    iget-wide v2, p0, Lcom/wmspanel/libstream/StreamBuffer;->dt:J

    long-to-double v2, v2

    div-double/2addr v0, v2

    iput-wide v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->dv:D

    .line 151
    :cond_0
    iput-wide p1, p0, Lcom/wmspanel/libstream/StreamBuffer;->du:J

    .line 152
    return-void

    .line 142
    :cond_1
    iget-wide v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->dt:J

    iget-wide v2, p0, Lcom/wmspanel/libstream/StreamBuffer;->dt:J

    const-wide/16 v4, 0xa

    div-long/2addr v2, v4

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->dt:J

    goto :goto_0
.end method

.method public getFps()D
    .locals 2

    .prologue
    .line 134
    iget-wide v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->dv:D

    return-wide v0
.end method

.method public declared-synchronized i(Lcom/wmspanel/libstream/BufferItem;)V
    .locals 6

    .prologue
    .line 20
    monitor-enter p0

    if-nez p1, :cond_0

    .line 33
    :goto_0
    monitor-exit p0

    return-void

    .line 24
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lcom/wmspanel/libstream/BufferItem;->m()Lcom/wmspanel/libstream/BufferItem$a;

    move-result-object v0

    sget-object v1, Lcom/wmspanel/libstream/BufferItem$a;->B:Lcom/wmspanel/libstream/BufferItem$a;

    if-ne v0, v1, :cond_1

    .line 25
    invoke-virtual {p1}, Lcom/wmspanel/libstream/BufferItem;->getTimestamp()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Lcom/wmspanel/libstream/StreamBuffer;->e(J)V

    .line 28
    :cond_1
    iget-wide v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->bw:J

    invoke-virtual {p1, v0, v1}, Lcom/wmspanel/libstream/BufferItem;->a(J)V

    .line 31
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->do:[Lcom/wmspanel/libstream/BufferItem;

    iget-wide v2, p0, Lcom/wmspanel/libstream/StreamBuffer;->bw:J

    iget v1, p0, Lcom/wmspanel/libstream/StreamBuffer;->dq:I

    int-to-long v4, v1

    rem-long/2addr v2, v4

    long-to-int v1, v2

    aput-object p1, v0, v1

    .line 32
    iget-wide v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->bw:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/wmspanel/libstream/StreamBuffer;->bw:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 20
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
