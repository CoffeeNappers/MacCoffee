.class Lcom/wmspanel/libstream/d;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "ConnectionManager"


# instance fields
.field private E:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/wmspanel/libstream/a;",
            ">;"
        }
    .end annotation
.end field

.field private F:Ljava/nio/channels/Selector;

.field private G:I

.field private H:Ljava/lang/Thread;

.field private I:J

.field private J:J

.field private K:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/wmspanel/libstream/a;",
            ">;"
        }
    .end annotation
.end field

.field private L:J

.field private M:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/wmspanel/libstream/b;",
            ">;"
        }
    .end annotation
.end field

.field private mListener:Lcom/wmspanel/libstream/Streamer$Listener;

.field private mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

.field private mUserAgent:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/StreamBuffer;)V
    .locals 4

    .prologue
    const-wide/16 v2, -0x1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const/4 v0, 0x0

    iput v0, p0, Lcom/wmspanel/libstream/d;->G:I

    .line 24
    iput-wide v2, p0, Lcom/wmspanel/libstream/d;->I:J

    .line 25
    iput-wide v2, p0, Lcom/wmspanel/libstream/d;->J:J

    .line 27
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/wmspanel/libstream/d;->L:J

    .line 28
    const-string/jumbo v0, "Larix/1.0.28"

    iput-object v0, p0, Lcom/wmspanel/libstream/d;->mUserAgent:Ljava/lang/String;

    .line 33
    if-nez p1, :cond_0

    .line 34
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 37
    :cond_0
    iput-object p1, p0, Lcom/wmspanel/libstream/d;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    .line 38
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/wmspanel/libstream/d;->E:Ljava/util/Map;

    .line 39
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/wmspanel/libstream/d;->K:Ljava/util/Queue;

    .line 40
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/wmspanel/libstream/d;->M:Ljava/util/Map;

    .line 43
    :try_start_0
    invoke-static {}, Ljava/nio/channels/Selector;->open()Ljava/nio/channels/Selector;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/d;->F:Ljava/nio/channels/Selector;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    :goto_0
    return-void

    .line 44
    :catch_0
    move-exception v0

    .line 45
    const-string/jumbo v1, "ConnectionManager"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method static synthetic a(Lcom/wmspanel/libstream/d;J)J
    .locals 1

    .prologue
    .line 16
    iput-wide p1, p0, Lcom/wmspanel/libstream/d;->I:J

    return-wide p1
.end method

.method static synthetic a(Lcom/wmspanel/libstream/d;)Ljava/nio/channels/Selector;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->F:Ljava/nio/channels/Selector;

    return-object v0
.end method

.method private a(Lcom/wmspanel/libstream/a;)V
    .locals 2

    .prologue
    .line 316
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->E:Ljava/util/Map;

    iget v1, p0, Lcom/wmspanel/libstream/d;->G:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 317
    invoke-direct {p0}, Lcom/wmspanel/libstream/d;->r()V

    .line 319
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->K:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 320
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->F:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;

    .line 321
    return-void
.end method

.method static synthetic b(Lcom/wmspanel/libstream/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/wmspanel/libstream/d;->s()V

    return-void
.end method

.method static synthetic c(Lcom/wmspanel/libstream/d;)V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/wmspanel/libstream/d;->t()V

    return-void
.end method

.method static synthetic d(Lcom/wmspanel/libstream/d;)V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/wmspanel/libstream/d;->u()V

    return-void
.end method

.method static synthetic e(Lcom/wmspanel/libstream/d;)Lcom/wmspanel/libstream/Streamer$Listener;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    return-object v0
.end method

.method private r()V
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->H:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 106
    :goto_0
    return-void

    .line 59
    :cond_0
    new-instance v0, Lcom/wmspanel/libstream/d$1;

    invoke-direct {v0, p0}, Lcom/wmspanel/libstream/d$1;-><init>(Lcom/wmspanel/libstream/d;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/d;->H:Ljava/lang/Thread;

    .line 105
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->H:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method private s()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 110
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 112
    iget-wide v2, p0, Lcom/wmspanel/libstream/d;->I:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x1f4

    cmp-long v2, v2, v4

    if-gez v2, :cond_1

    .line 124
    :cond_0
    return-void

    .line 115
    :cond_1
    iput-wide v0, p0, Lcom/wmspanel/libstream/d;->I:J

    .line 118
    :goto_0
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->K:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/a;

    .line 119
    if-eqz v0, :cond_0

    .line 122
    invoke-virtual {v0}, Lcom/wmspanel/libstream/a;->connect()V

    goto :goto_0
.end method

.method private t()V
    .locals 6

    .prologue
    .line 128
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 129
    iget-wide v2, p0, Lcom/wmspanel/libstream/d;->J:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0xc8

    cmp-long v2, v2, v4

    if-gez v2, :cond_1

    .line 153
    :cond_0
    return-void

    .line 132
    :cond_1
    iput-wide v0, p0, Lcom/wmspanel/libstream/d;->J:J

    .line 134
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->F:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->keys()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/channels/SelectionKey;

    .line 136
    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->isValid()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 140
    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/a;

    .line 141
    if-nez v0, :cond_3

    .line 142
    const-string/jumbo v0, "ConnectionManager"

    const-string/jumbo v2, "null connection"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 146
    :cond_3
    invoke-virtual {v0}, Lcom/wmspanel/libstream/a;->b()I

    move-result v2

    if-nez v2, :cond_2

    .line 151
    invoke-virtual {v0}, Lcom/wmspanel/libstream/a;->d()V

    goto :goto_0
.end method

.method private u()V
    .locals 6

    .prologue
    .line 156
    iget-wide v0, p0, Lcom/wmspanel/libstream/d;->L:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 157
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/wmspanel/libstream/d;->L:J

    .line 175
    :cond_0
    :goto_0
    return-void

    .line 161
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 163
    iget-wide v0, p0, Lcom/wmspanel/libstream/d;->L:J

    sub-long v0, v2, v0

    const-wide/16 v4, 0x7d0

    cmp-long v0, v0, v4

    if-lez v0, :cond_0

    .line 164
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->F:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->keys()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/channels/SelectionKey;

    .line 165
    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/a;

    .line 166
    if-nez v0, :cond_2

    .line 167
    const-string/jumbo v0, "ConnectionManager"

    const-string/jumbo v4, "null connection"

    invoke-static {v0, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 171
    :cond_2
    invoke-virtual {v0}, Lcom/wmspanel/libstream/a;->e()V

    goto :goto_1

    .line 173
    :cond_3
    iput-wide v2, p0, Lcom/wmspanel/libstream/d;->L:J

    goto :goto_0
.end method

.method private v()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 178
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->H:Ljava/lang/Thread;

    if-nez v0, :cond_0

    .line 190
    :goto_0
    return-void

    .line 183
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->H:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 184
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->H:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 188
    iput-object v1, p0, Lcom/wmspanel/libstream/d;->H:Ljava/lang/Thread;

    goto :goto_0

    .line 185
    :catch_0
    move-exception v0

    .line 186
    :try_start_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 188
    iput-object v1, p0, Lcom/wmspanel/libstream/d;->H:Ljava/lang/Thread;

    goto :goto_0

    :catchall_0
    move-exception v0

    iput-object v1, p0, Lcom/wmspanel/libstream/d;->H:Ljava/lang/Thread;

    throw v0
.end method


# virtual methods
.method declared-synchronized a(Lcom/wmspanel/libstream/ConnectionConfig;Lcom/wmspanel/libstream/Streamer$Listener;)I
    .locals 12

    .prologue
    const/4 v9, 0x0

    const/4 v10, -0x1

    .line 204
    monitor-enter p0

    :try_start_0
    iget-object v5, p1, Lcom/wmspanel/libstream/ConnectionConfig;->uri:Ljava/lang/String;

    .line 206
    iget-object v1, p1, Lcom/wmspanel/libstream/ConnectionConfig;->uri:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    .line 207
    invoke-virtual {v11}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    .line 208
    if-nez v1, :cond_0

    .line 209
    const-string/jumbo v1, "ConnectionManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "failed to parse scheme, uri="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move v1, v10

    .line 312
    :goto_0
    monitor-exit p0

    return v1

    .line 215
    :cond_0
    :try_start_1
    invoke-virtual {v11}, Landroid/net/Uri;->getUserInfo()Ljava/lang/String;

    move-result-object v2

    .line 216
    if-eqz v2, :cond_d

    .line 217
    const-string/jumbo v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 218
    array-length v3, v2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_c

    .line 219
    const/4 v3, 0x0

    aget-object v8, v2, v3

    .line 220
    const/4 v3, 0x1

    aget-object v9, v2, v3

    .line 224
    :goto_1
    iget-object v2, p1, Lcom/wmspanel/libstream/ConnectionConfig;->uri:Ljava/lang/String;

    const-string/jumbo v3, "@"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 225
    if-eq v2, v10, :cond_1

    .line 226
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "://"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p1, Lcom/wmspanel/libstream/ConnectionConfig;->uri:Ljava/lang/String;

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v4, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 231
    :cond_1
    :goto_2
    iget-object v2, p1, Lcom/wmspanel/libstream/ConnectionConfig;->username:Ljava/lang/String;

    if-eqz v2, :cond_2

    iget-object v2, p1, Lcom/wmspanel/libstream/ConnectionConfig;->password:Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 232
    iget-object v8, p1, Lcom/wmspanel/libstream/ConnectionConfig;->username:Ljava/lang/String;

    .line 233
    iget-object v9, p1, Lcom/wmspanel/libstream/ConnectionConfig;->password:Ljava/lang/String;

    .line 236
    :cond_2
    invoke-virtual {v11}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v6

    .line 237
    if-nez v6, :cond_3

    .line 238
    const-string/jumbo v1, "ConnectionManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "failed to parse host, uri="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v1, v10

    .line 239
    goto :goto_0

    .line 242
    :cond_3
    invoke-virtual {v11}, Landroid/net/Uri;->getPort()I

    move-result v7

    .line 246
    const-string/jumbo v2, "rtsp"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 248
    if-ne v10, v7, :cond_4

    .line 249
    const/16 v7, 0x22a

    .line 252
    :cond_4
    new-instance v1, Lcom/wmspanel/libstream/m;

    iget v2, p0, Lcom/wmspanel/libstream/d;->G:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/wmspanel/libstream/d;->G:I

    iget-object v4, p1, Lcom/wmspanel/libstream/ConnectionConfig;->mode:Lcom/wmspanel/libstream/Streamer$MODE;

    move-object v2, p0

    invoke-direct/range {v1 .. v9}, Lcom/wmspanel/libstream/m;-><init>(Lcom/wmspanel/libstream/d;ILcom/wmspanel/libstream/Streamer$MODE;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 301
    :cond_5
    :goto_3
    if-nez v1, :cond_b

    .line 302
    const-string/jumbo v1, "ConnectionManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "failed to create connection, uri="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v1, v10

    .line 303
    goto/16 :goto_0

    .line 254
    :cond_6
    const-string/jumbo v2, "rtmp"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 256
    if-ne v10, v7, :cond_7

    .line 257
    const/16 v7, 0x78f

    .line 260
    :cond_7
    iget-object v1, p1, Lcom/wmspanel/libstream/ConnectionConfig;->uri:Ljava/lang/String;

    const-string/jumbo v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 261
    array-length v1, v2

    const/4 v3, 0x5

    if-ge v1, v3, :cond_8

    .line 262
    const-string/jumbo v1, "ConnectionManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "failed to get rtmp app & stream, uri="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v1, v10

    .line 263
    goto/16 :goto_0

    .line 266
    :cond_8
    const/4 v1, 0x3

    aget-object v8, v2, v1

    .line 267
    const/4 v1, 0x4

    :goto_4
    array-length v3, v2

    add-int/lit8 v3, v3, -0x1

    if-ge v1, v3, :cond_9

    .line 268
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, v2, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 267
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 270
    :cond_9
    array-length v1, v2

    add-int/lit8 v1, v1, -0x1

    aget-object v9, v2, v1

    .line 271
    new-instance v1, Lcom/wmspanel/libstream/i;

    iget v2, p0, Lcom/wmspanel/libstream/d;->G:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/wmspanel/libstream/d;->G:I

    iget-object v4, p1, Lcom/wmspanel/libstream/ConnectionConfig;->mode:Lcom/wmspanel/libstream/Streamer$MODE;

    move-object v2, p0

    invoke-direct/range {v1 .. v9}, Lcom/wmspanel/libstream/i;-><init>(Lcom/wmspanel/libstream/d;ILcom/wmspanel/libstream/Streamer$MODE;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 273
    new-instance v3, Lcom/wmspanel/libstream/Streamer$a;

    invoke-direct {v3}, Lcom/wmspanel/libstream/Streamer$a;-><init>()V

    .line 274
    iget-object v2, p1, Lcom/wmspanel/libstream/ConnectionConfig;->auth:Lcom/wmspanel/libstream/Streamer$AUTH;

    iput-object v2, v3, Lcom/wmspanel/libstream/Streamer$a;->dB:Lcom/wmspanel/libstream/Streamer$AUTH;

    .line 275
    iget-object v2, p1, Lcom/wmspanel/libstream/ConnectionConfig;->username:Ljava/lang/String;

    iput-object v2, v3, Lcom/wmspanel/libstream/Streamer$a;->username:Ljava/lang/String;

    .line 276
    iget-object v2, p1, Lcom/wmspanel/libstream/ConnectionConfig;->password:Ljava/lang/String;

    iput-object v2, v3, Lcom/wmspanel/libstream/Streamer$a;->password:Ljava/lang/String;

    .line 278
    move-object v0, v1

    check-cast v0, Lcom/wmspanel/libstream/i;

    move-object v2, v0

    .line 279
    invoke-virtual {v2, v3}, Lcom/wmspanel/libstream/i;->a(Lcom/wmspanel/libstream/Streamer$a;)V

    .line 282
    iget-object v2, p1, Lcom/wmspanel/libstream/ConnectionConfig;->auth:Lcom/wmspanel/libstream/Streamer$AUTH;

    sget-object v3, Lcom/wmspanel/libstream/Streamer$AUTH;->LLNW:Lcom/wmspanel/libstream/Streamer$AUTH;

    if-ne v2, v3, :cond_5

    .line 283
    new-instance v2, Lcom/wmspanel/libstream/b;

    invoke-direct {v2}, Lcom/wmspanel/libstream/b;-><init>()V

    .line 284
    iput-object v5, v2, Lcom/wmspanel/libstream/b;->uri:Ljava/lang/String;

    .line 285
    iget-object v3, p1, Lcom/wmspanel/libstream/ConnectionConfig;->mode:Lcom/wmspanel/libstream/Streamer$MODE;

    iput-object v3, v2, Lcom/wmspanel/libstream/b;->mode:Lcom/wmspanel/libstream/Streamer$MODE;

    .line 286
    iput-object v6, v2, Lcom/wmspanel/libstream/b;->s:Ljava/lang/String;

    .line 287
    iput v7, v2, Lcom/wmspanel/libstream/b;->port:I

    .line 288
    iput-object v8, v2, Lcom/wmspanel/libstream/b;->t:Ljava/lang/String;

    .line 289
    iput-object v9, v2, Lcom/wmspanel/libstream/b;->u:Ljava/lang/String;

    .line 290
    iget-object v3, p1, Lcom/wmspanel/libstream/ConnectionConfig;->auth:Lcom/wmspanel/libstream/Streamer$AUTH;

    iput-object v3, v2, Lcom/wmspanel/libstream/b;->auth:Lcom/wmspanel/libstream/Streamer$AUTH;

    .line 291
    iget-object v3, p1, Lcom/wmspanel/libstream/ConnectionConfig;->username:Ljava/lang/String;

    iput-object v3, v2, Lcom/wmspanel/libstream/b;->username:Ljava/lang/String;

    .line 292
    iget-object v3, p1, Lcom/wmspanel/libstream/ConnectionConfig;->password:Ljava/lang/String;

    iput-object v3, v2, Lcom/wmspanel/libstream/b;->password:Ljava/lang/String;

    .line 293
    iget-object v3, p0, Lcom/wmspanel/libstream/d;->M:Ljava/util/Map;

    iget v4, p0, Lcom/wmspanel/libstream/d;->G:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_3

    .line 308
    :catch_0
    move-exception v1

    .line 309
    :try_start_2
    const-string/jumbo v2, "ConnectionManager"

    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move v1, v10

    .line 310
    goto/16 :goto_0

    .line 297
    :cond_a
    :try_start_3
    const-string/jumbo v2, "ConnectionManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "unsupported scheme="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v1, v10

    .line 298
    goto/16 :goto_0

    .line 306
    :cond_b
    invoke-direct {p0, v1}, Lcom/wmspanel/libstream/d;->a(Lcom/wmspanel/libstream/a;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 312
    :try_start_4
    iget v1, p0, Lcom/wmspanel/libstream/d;->G:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_0

    .line 204
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    :cond_c
    move-object v8, v9

    goto/16 :goto_1

    :cond_d
    move-object v8, v9

    goto/16 :goto_2
.end method

.method a(ILcom/wmspanel/libstream/Streamer$CONNECTION_STATE;Lcom/wmspanel/libstream/Streamer$STATUS;)V
    .locals 11

    .prologue
    .line 419
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->M:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lcom/wmspanel/libstream/b;

    .line 420
    if-eqz v1, :cond_1

    sget-object v0, Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;->DISCONNECTED:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    if-ne p2, v0, :cond_1

    sget-object v0, Lcom/wmspanel/libstream/Streamer$STATUS;->AUTH_FAIL:Lcom/wmspanel/libstream/Streamer$STATUS;

    if-ne p3, v0, :cond_1

    iget-object v0, v1, Lcom/wmspanel/libstream/b;->auth:Lcom/wmspanel/libstream/Streamer$AUTH;

    sget-object v2, Lcom/wmspanel/libstream/Streamer$AUTH;->LLNW:Lcom/wmspanel/libstream/Streamer$AUTH;

    if-ne v0, v2, :cond_1

    iget-object v0, v1, Lcom/wmspanel/libstream/b;->username:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, v1, Lcom/wmspanel/libstream/b;->password:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, v1, Lcom/wmspanel/libstream/b;->username:Ljava/lang/String;

    .line 425
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, v1, Lcom/wmspanel/libstream/b;->password:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, v1, Lcom/wmspanel/libstream/b;->v:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, v1, Lcom/wmspanel/libstream/b;->v:Ljava/lang/String;

    .line 426
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 429
    invoke-virtual {p0, p1}, Lcom/wmspanel/libstream/d;->releaseConnection(I)V

    .line 431
    new-instance v10, Lcom/wmspanel/libstream/Streamer$a;

    invoke-direct {v10}, Lcom/wmspanel/libstream/Streamer$a;-><init>()V

    .line 432
    iget-object v0, v1, Lcom/wmspanel/libstream/b;->auth:Lcom/wmspanel/libstream/Streamer$AUTH;

    iput-object v0, v10, Lcom/wmspanel/libstream/Streamer$a;->dB:Lcom/wmspanel/libstream/Streamer$AUTH;

    .line 433
    iget-object v0, v1, Lcom/wmspanel/libstream/b;->username:Ljava/lang/String;

    iput-object v0, v10, Lcom/wmspanel/libstream/Streamer$a;->username:Ljava/lang/String;

    .line 434
    iget-object v0, v1, Lcom/wmspanel/libstream/b;->password:Ljava/lang/String;

    iput-object v0, v10, Lcom/wmspanel/libstream/Streamer$a;->password:Ljava/lang/String;

    .line 435
    iget-object v0, v1, Lcom/wmspanel/libstream/b;->v:Ljava/lang/String;

    iput-object v0, v10, Lcom/wmspanel/libstream/Streamer$a;->v:Ljava/lang/String;

    .line 437
    const/4 v9, 0x0

    .line 440
    :try_start_0
    new-instance v0, Lcom/wmspanel/libstream/i;

    iget-object v3, v1, Lcom/wmspanel/libstream/b;->mode:Lcom/wmspanel/libstream/Streamer$MODE;

    iget-object v4, v1, Lcom/wmspanel/libstream/b;->uri:Ljava/lang/String;

    iget-object v5, v1, Lcom/wmspanel/libstream/b;->s:Ljava/lang/String;

    iget v6, v1, Lcom/wmspanel/libstream/b;->port:I

    iget-object v7, v1, Lcom/wmspanel/libstream/b;->t:Ljava/lang/String;

    iget-object v8, v1, Lcom/wmspanel/libstream/b;->u:Ljava/lang/String;

    move-object v1, p0

    move v2, p1

    invoke-direct/range {v0 .. v8}, Lcom/wmspanel/libstream/i;-><init>(Lcom/wmspanel/libstream/d;ILcom/wmspanel/libstream/Streamer$MODE;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 441
    invoke-virtual {v0, v10}, Lcom/wmspanel/libstream/i;->a(Lcom/wmspanel/libstream/Streamer$a;)V

    .line 443
    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/d;->a(Lcom/wmspanel/libstream/a;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v9

    .line 450
    :goto_0
    if-nez v0, :cond_1

    .line 470
    :cond_0
    :goto_1
    return-void

    .line 445
    :catch_0
    move-exception v0

    .line 447
    const/4 v0, 0x1

    goto :goto_0

    .line 455
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    if-eqz v0, :cond_0

    .line 459
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    invoke-interface {v0}, Lcom/wmspanel/libstream/Streamer$Listener;->getHandler()Landroid/os/Handler;

    move-result-object v0

    .line 460
    if-eqz v0, :cond_0

    .line 464
    new-instance v1, Lcom/wmspanel/libstream/d$2;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/wmspanel/libstream/d$2;-><init>(Lcom/wmspanel/libstream/d;ILcom/wmspanel/libstream/Streamer$CONNECTION_STATE;Lcom/wmspanel/libstream/Streamer$STATUS;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_1
.end method

.method a(ILjava/lang/String;)V
    .locals 2

    .prologue
    .line 409
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->M:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/b;

    .line 410
    if-nez v0, :cond_0

    .line 414
    :goto_0
    return-void

    .line 413
    :cond_0
    iput-object p2, v0, Lcom/wmspanel/libstream/b;->v:Ljava/lang/String;

    goto :goto_0
.end method

.method getAudioPacketsLost(I)J
    .locals 2
    .param p1, "connectionId"    # I

    .prologue
    .line 371
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->E:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/a;

    .line 372
    if-nez v0, :cond_0

    .line 373
    const-wide/16 v0, 0x0

    .line 375
    :goto_0
    return-wide v0

    :cond_0
    invoke-virtual {v0}, Lcom/wmspanel/libstream/a;->j()J

    move-result-wide v0

    goto :goto_0
.end method

.method getAudioPacketsSent(I)J
    .locals 2
    .param p1, "connectionId"    # I

    .prologue
    .line 363
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->E:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/a;

    .line 364
    if-nez v0, :cond_0

    .line 365
    const-wide/16 v0, 0x0

    .line 367
    :goto_0
    return-wide v0

    :cond_0
    invoke-virtual {v0}, Lcom/wmspanel/libstream/a;->i()J

    move-result-wide v0

    goto :goto_0
.end method

.method getBytesRecv(I)J
    .locals 2
    .param p1, "connectionId"    # I

    .prologue
    .line 355
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->E:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/a;

    .line 356
    if-nez v0, :cond_0

    .line 357
    const-wide/16 v0, 0x0

    .line 359
    :goto_0
    return-wide v0

    :cond_0
    invoke-virtual {v0}, Lcom/wmspanel/libstream/a;->h()J

    move-result-wide v0

    goto :goto_0
.end method

.method getBytesSent(I)J
    .locals 2
    .param p1, "connectionId"    # I

    .prologue
    .line 347
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->E:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/a;

    .line 348
    if-nez v0, :cond_0

    .line 349
    const-wide/16 v0, 0x0

    .line 351
    :goto_0
    return-wide v0

    :cond_0
    invoke-virtual {v0}, Lcom/wmspanel/libstream/a;->g()J

    move-result-wide v0

    goto :goto_0
.end method

.method getVideoPacketsLost(I)J
    .locals 2
    .param p1, "connectionId"    # I

    .prologue
    .line 387
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->E:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/a;

    .line 388
    if-nez v0, :cond_0

    .line 389
    const-wide/16 v0, 0x0

    .line 391
    :goto_0
    return-wide v0

    :cond_0
    invoke-virtual {v0}, Lcom/wmspanel/libstream/a;->l()J

    move-result-wide v0

    goto :goto_0
.end method

.method getVideoPacketsSent(I)J
    .locals 2
    .param p1, "connectionId"    # I

    .prologue
    .line 379
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->E:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/a;

    .line 380
    if-nez v0, :cond_0

    .line 381
    const-wide/16 v0, 0x0

    .line 383
    :goto_0
    return-wide v0

    :cond_0
    invoke-virtual {v0}, Lcom/wmspanel/libstream/a;->k()J

    move-result-wide v0

    goto :goto_0
.end method

.method release()V
    .locals 2

    .prologue
    .line 337
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->E:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 338
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/a;

    .line 339
    invoke-virtual {v0}, Lcom/wmspanel/libstream/a;->close()V

    goto :goto_0

    .line 341
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->E:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 342
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->M:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 343
    invoke-direct {p0}, Lcom/wmspanel/libstream/d;->v()V

    .line 344
    return-void
.end method

.method declared-synchronized releaseConnection(I)V
    .locals 2
    .param p1, "connectionId"    # I

    .prologue
    .line 324
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->M:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->E:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/a;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 326
    if-nez v0, :cond_1

    .line 334
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 329
    :cond_1
    :try_start_1
    invoke-virtual {v0}, Lcom/wmspanel/libstream/a;->release()V

    .line 331
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->E:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 332
    invoke-direct {p0}, Lcom/wmspanel/libstream/d;->v()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 324
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method setListener(Lcom/wmspanel/libstream/Streamer$Listener;)V
    .locals 0
    .param p1, "listener"    # Lcom/wmspanel/libstream/Streamer$Listener;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/wmspanel/libstream/d;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    .line 51
    return-void
.end method

.method setUserAgent(Ljava/lang/String;)V
    .locals 0
    .param p1, "userAgent"    # Ljava/lang/String;

    .prologue
    .line 399
    iput-object p1, p0, Lcom/wmspanel/libstream/d;->mUserAgent:Ljava/lang/String;

    .line 400
    return-void
.end method

.method w()Ljava/nio/channels/Selector;
    .locals 1

    .prologue
    .line 193
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->F:Ljava/nio/channels/Selector;

    return-object v0
.end method

.method x()Lcom/wmspanel/libstream/StreamBuffer;
    .locals 1

    .prologue
    .line 197
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    return-object v0
.end method

.method y()Z
    .locals 1

    .prologue
    .line 395
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->E:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method z()Ljava/lang/String;
    .locals 1

    .prologue
    .line 403
    iget-object v0, p0, Lcom/wmspanel/libstream/d;->mUserAgent:Ljava/lang/String;

    return-object v0
.end method
