.class public Lcom/vkontakte/android/media/VideoPools;
.super Ljava/lang/Object;
.source "VideoPools.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;,
        Lcom/vkontakte/android/media/VideoPools$PlayerFactory;,
        Lcom/vkontakte/android/media/VideoPools$PlayerHolder;,
        Lcom/vkontakte/android/media/VideoPools$PlayerContext;,
        Lcom/vkontakte/android/media/VideoPools$SerialExecutor;
    }
.end annotation


# static fields
.field static final DEBUG:Z = false

.field static final TAG:Ljava/lang/String; = "VideoPools"

.field static final context:Landroid/content/Context;

.field static final exoPool:Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;

.field public static final handler:Landroid/os/Handler;

.field private static final handlerThread:Landroid/os/HandlerThread;

.field static final mp4CompatPool:Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;

.field private static overlayDialogVisible:Z

.field static final serialExecutor:Ljava/util/concurrent/Executor;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 39
    new-instance v0, Landroid/os/HandlerThread;

    const-string/jumbo v1, "VideoPoolsThread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/media/VideoPools;->handlerThread:Landroid/os/HandlerThread;

    .line 43
    sget-object v0, Lcom/vkontakte/android/media/VideoPools;->handlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 44
    new-instance v0, Landroid/os/Handler;

    sget-object v1, Lcom/vkontakte/android/media/VideoPools;->handlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/vkontakte/android/media/VideoPools;->handler:Landroid/os/Handler;

    .line 75
    new-instance v0, Lcom/vkontakte/android/media/VideoPools$SerialExecutor;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/media/VideoPools$SerialExecutor;-><init>(Lcom/vkontakte/android/media/VideoPools$1;)V

    sput-object v0, Lcom/vkontakte/android/media/VideoPools;->serialExecutor:Ljava/util/concurrent/Executor;

    .line 77
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    sput-object v0, Lcom/vkontakte/android/media/VideoPools;->context:Landroid/content/Context;

    .line 79
    new-instance v0, Lcom/vkontakte/android/media/VideoPools$1;

    sget-object v1, Lcom/vkontakte/android/media/VideoPools;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/media/VideoPools$1;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/vkontakte/android/media/VideoPools;->exoPool:Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;

    .line 87
    new-instance v0, Lcom/vkontakte/android/media/VideoPools$2;

    sget-object v1, Lcom/vkontakte/android/media/VideoPools;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/media/VideoPools$2;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/vkontakte/android/media/VideoPools;->mp4CompatPool:Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static attachContext(Landroid/support/v4/util/Pair;Lcom/vkontakte/android/media/VideoPools$PlayerContext;)Z
    .locals 2
    .param p1, "playerContext"    # Lcom/vkontakte/android/media/VideoPools$PlayerContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/Pair",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/vkontakte/android/media/VideoPools$PlayerContext;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p0, "file":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Lcom/vkontakte/android/api/VideoFile;Ljava/lang/Integer;>;"
    const/4 v0, 0x1

    .line 158
    sget-object v1, Lcom/vkontakte/android/media/VideoPools;->exoPool:Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;

    invoke-virtual {v1, p0, p1}, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->attachContext(Landroid/support/v4/util/Pair;Lcom/vkontakte/android/media/VideoPools$PlayerContext;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 163
    :cond_0
    :goto_0
    return v0

    .line 160
    :cond_1
    sget-object v1, Lcom/vkontakte/android/media/VideoPools;->mp4CompatPool:Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;

    invoke-virtual {v1, p0, p1}, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->attachContext(Landroid/support/v4/util/Pair;Lcom/vkontakte/android/media/VideoPools$PlayerContext;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 163
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static detachAndReleasePlayer(Lcom/vkontakte/android/api/VideoFile;I)V
    .locals 2
    .param p0, "file"    # Lcom/vkontakte/android/api/VideoFile;
    .param p1, "index"    # I

    .prologue
    .line 125
    sget-object v0, Lcom/vkontakte/android/media/VideoPools;->serialExecutor:Ljava/util/concurrent/Executor;

    invoke-static {p0, p1}, Lcom/vkontakte/android/media/VideoPools$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/api/VideoFile;I)Ljava/lang/Runnable;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 131
    return-void
.end method

.method private static detachContext(Landroid/support/v4/util/Pair;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/Pair",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p0, "file":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Lcom/vkontakte/android/api/VideoFile;Ljava/lang/Integer;>;"
    const/4 v0, 0x1

    .line 171
    sget-object v1, Lcom/vkontakte/android/media/VideoPools;->exoPool:Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;

    invoke-virtual {v1, p0}, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->detachContext(Landroid/support/v4/util/Pair;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 176
    :cond_0
    :goto_0
    return v0

    .line 173
    :cond_1
    sget-object v1, Lcom/vkontakte/android/media/VideoPools;->mp4CompatPool:Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;

    invoke-virtual {v1, p0}, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->detachContext(Landroid/support/v4/util/Pair;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 176
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic lambda$detachAndReleasePlayer$2(Lcom/vkontakte/android/api/VideoFile;I)V
    .locals 5
    .param p0, "file"    # Lcom/vkontakte/android/api/VideoFile;
    .param p1, "index"    # I

    .prologue
    .line 126
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string/jumbo v3, "VideoPools"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "detachAndReleasePlayer "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/vkontakte/android/api/VideoFile;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 127
    new-instance v0, Landroid/support/v4/util/Pair;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/support/v4/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 128
    .local v0, "pair":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Lcom/vkontakte/android/api/VideoFile;Ljava/lang/Integer;>;"
    invoke-static {v0}, Lcom/vkontakte/android/media/VideoPools;->detachContext(Landroid/support/v4/util/Pair;)Z

    .line 129
    invoke-static {v0}, Lcom/vkontakte/android/media/VideoPools;->releasePlayer(Landroid/support/v4/util/Pair;)Z

    .line 130
    return-void
.end method

.method static synthetic lambda$null$0(Lcom/vkontakte/android/media/VideoPools$PlayerContext;)V
    .locals 2
    .param p0, "playerContext"    # Lcom/vkontakte/android/media/VideoPools$PlayerContext;

    .prologue
    .line 113
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Lcom/vkontakte/android/media/VideoPools$PlayerContext;->onError(Lcom/vkontakte/android/media/AbsVideoPlayer;I)V

    return-void
.end method

.method static synthetic lambda$obtainAndAttachPlayer$1(Lcom/vkontakte/android/api/VideoFile;ILjava/lang/String;IZZLjava/lang/String;Lcom/vkontakte/android/media/VideoPools$PlayerContext;)V
    .locals 6
    .param p0, "file"    # Lcom/vkontakte/android/api/VideoFile;
    .param p1, "index"    # I
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "quality"    # I
    .param p4, "useVigo"    # Z
    .param p5, "autoplay"    # Z
    .param p6, "referrer"    # Ljava/lang/String;
    .param p7, "playerContext"    # Lcom/vkontakte/android/media/VideoPools$PlayerContext;

    .prologue
    .line 110
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string/jumbo v3, "VideoPools"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "obtainAndAttachPlayer "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/vkontakte/android/api/VideoFile;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 111
    new-instance v0, Landroid/support/v4/util/Pair;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/support/v4/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .local v0, "pair":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Lcom/vkontakte/android/api/VideoFile;Ljava/lang/Integer;>;"
    move-object v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    move-object v5, p6

    .line 112
    invoke-static/range {v0 .. v5}, Lcom/vkontakte/android/media/VideoPools;->obtainPlayer(Landroid/support/v4/util/Pair;Ljava/lang/String;IZZLjava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 113
    invoke-static {p7}, Lcom/vkontakte/android/media/VideoPools$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/media/VideoPools$PlayerContext;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ViewUtils;->post(Ljava/lang/Runnable;)V

    .line 115
    :cond_0
    invoke-static {v0, p7}, Lcom/vkontakte/android/media/VideoPools;->attachContext(Landroid/support/v4/util/Pair;Lcom/vkontakte/android/media/VideoPools$PlayerContext;)Z

    .line 116
    return-void
.end method

.method public static obtainAndAttachPlayer(Lcom/vkontakte/android/api/VideoFile;ILjava/lang/String;IZZLjava/lang/String;Lcom/vkontakte/android/media/VideoPools$PlayerContext;)V
    .locals 2
    .param p0, "file"    # Lcom/vkontakte/android/api/VideoFile;
    .param p1, "index"    # I
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "quality"    # I
    .param p4, "useVigo"    # Z
    .param p5, "autoplay"    # Z
    .param p6, "referrer"    # Ljava/lang/String;
    .param p7, "playerContext"    # Lcom/vkontakte/android/media/VideoPools$PlayerContext;

    .prologue
    .line 109
    sget-object v0, Lcom/vkontakte/android/media/VideoPools;->serialExecutor:Ljava/util/concurrent/Executor;

    invoke-static/range {p0 .. p7}, Lcom/vkontakte/android/media/VideoPools$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/api/VideoFile;ILjava/lang/String;IZZLjava/lang/String;Lcom/vkontakte/android/media/VideoPools$PlayerContext;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 117
    return-void
.end method

.method private static obtainPlayer(Landroid/support/v4/util/Pair;Ljava/lang/String;IZZLjava/lang/String;)Z
    .locals 10
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "quality"    # I
    .param p3, "useVigo"    # Z
    .param p4, "autoplay"    # Z
    .param p5, "referrer"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/Pair",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/lang/String;",
            "IZZ",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p0, "file":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Lcom/vkontakte/android/api/VideoFile;Ljava/lang/Integer;>;"
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 139
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_4

    .line 140
    invoke-static {}, Lcom/vkontakte/android/auth/configs/VideoConfig;->getInstance()Lcom/vkontakte/android/auth/configs/VideoConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/configs/VideoConfig;->getPlayerType()I

    move-result v7

    .line 141
    .local v7, "type":I
    if-eqz v7, :cond_0

    .line 142
    packed-switch v7, :pswitch_data_0

    .line 149
    :cond_0
    sget-object v0, Lcom/vkontakte/android/media/VideoPools;->exoPool:Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->getPlayer(Landroid/support/v4/util/Pair;Ljava/lang/String;IZZLjava/lang/String;)Lcom/vkontakte/android/media/AbsVideoPlayer;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 151
    .end local v7    # "type":I
    :cond_1
    :goto_0
    return v8

    .line 144
    .restart local v7    # "type":I
    :pswitch_0
    sget-object v0, Lcom/vkontakte/android/media/VideoPools;->mp4CompatPool:Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->getPlayer(Landroid/support/v4/util/Pair;Ljava/lang/String;IZZLjava/lang/String;)Lcom/vkontakte/android/media/AbsVideoPlayer;

    move-result-object v0

    if-eqz v0, :cond_2

    move v0, v8

    :goto_1
    move v8, v0

    goto :goto_0

    :cond_2
    move v0, v9

    goto :goto_1

    :cond_3
    move v8, v9

    .line 149
    goto :goto_0

    .line 151
    .end local v7    # "type":I
    :cond_4
    sget-object v0, Lcom/vkontakte/android/media/VideoPools;->mp4CompatPool:Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->getPlayer(Landroid/support/v4/util/Pair;Ljava/lang/String;IZZLjava/lang/String;)Lcom/vkontakte/android/media/AbsVideoPlayer;

    move-result-object v0

    if-nez v0, :cond_1

    move v8, v9

    goto :goto_0

    .line 142
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public static onPause(Landroid/app/Activity;)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 192
    sget-object v0, Lcom/vkontakte/android/media/VideoPools;->exoPool:Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;

    invoke-static {p0, v0}, Lcom/vkontakte/android/media/VideoPools;->onPause(Landroid/app/Activity;Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;)V

    .line 193
    sget-object v0, Lcom/vkontakte/android/media/VideoPools;->mp4CompatPool:Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;

    invoke-static {p0, v0}, Lcom/vkontakte/android/media/VideoPools;->onPause(Landroid/app/Activity;Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;)V

    .line 194
    return-void
.end method

.method private static onPause(Landroid/app/Activity;Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;)V
    .locals 7
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "factory"    # Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;

    .prologue
    .line 204
    new-instance v3, Ljava/util/HashMap;

    iget-object v4, p1, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->pool:Ljava/util/Map;

    invoke-direct {v3, v4}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 205
    .local v3, "pool":Ljava/util/Map;, "Ljava/util/Map<Landroid/support/v4/util/Pair<Lcom/vkontakte/android/api/VideoFile;Ljava/lang/Integer;>;Lcom/vkontakte/android/media/VideoPools$PlayerHolder;>;"
    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;

    .line 206
    .local v2, "holder":Lcom/vkontakte/android/media/VideoPools$PlayerHolder;
    new-instance v1, Ljava/util/HashSet;

    iget-object v5, v2, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->playerContexts:Ljava/util/Stack;

    invoke-direct {v1, v5}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 207
    .local v1, "contexts":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/media/VideoPools$PlayerContext;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/VideoPools$PlayerContext;

    .line 208
    .local v0, "context":Lcom/vkontakte/android/media/VideoPools$PlayerContext;
    if-eqz v0, :cond_1

    .line 209
    invoke-interface {v0, p0}, Lcom/vkontakte/android/media/VideoPools$PlayerContext;->onPause(Landroid/app/Activity;)V

    goto :goto_0

    .line 213
    .end local v0    # "context":Lcom/vkontakte/android/media/VideoPools$PlayerContext;
    .end local v1    # "contexts":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/media/VideoPools$PlayerContext;>;"
    .end local v2    # "holder":Lcom/vkontakte/android/media/VideoPools$PlayerHolder;
    :cond_2
    return-void
.end method

.method public static onResume(Landroid/app/Activity;)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 197
    sget-boolean v0, Lcom/vkontakte/android/media/VideoPools;->overlayDialogVisible:Z

    if-nez v0, :cond_0

    .line 198
    sget-object v0, Lcom/vkontakte/android/media/VideoPools;->exoPool:Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;

    invoke-static {p0, v0}, Lcom/vkontakte/android/media/VideoPools;->onResume(Landroid/app/Activity;Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;)V

    .line 199
    sget-object v0, Lcom/vkontakte/android/media/VideoPools;->mp4CompatPool:Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;

    invoke-static {p0, v0}, Lcom/vkontakte/android/media/VideoPools;->onResume(Landroid/app/Activity;Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;)V

    .line 201
    :cond_0
    return-void
.end method

.method private static onResume(Landroid/app/Activity;Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;)V
    .locals 7
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "factory"    # Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;

    .prologue
    .line 216
    new-instance v3, Ljava/util/HashMap;

    iget-object v4, p1, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->pool:Ljava/util/Map;

    invoke-direct {v3, v4}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 217
    .local v3, "pool":Ljava/util/Map;, "Ljava/util/Map<Landroid/support/v4/util/Pair<Lcom/vkontakte/android/api/VideoFile;Ljava/lang/Integer;>;Lcom/vkontakte/android/media/VideoPools$PlayerHolder;>;"
    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;

    .line 218
    .local v2, "holder":Lcom/vkontakte/android/media/VideoPools$PlayerHolder;
    new-instance v1, Ljava/util/HashSet;

    iget-object v5, v2, Lcom/vkontakte/android/media/VideoPools$PlayerHolder;->playerContexts:Ljava/util/Stack;

    invoke-direct {v1, v5}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 219
    .local v1, "contexts":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/media/VideoPools$PlayerContext;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/VideoPools$PlayerContext;

    .line 220
    .local v0, "context":Lcom/vkontakte/android/media/VideoPools$PlayerContext;
    if-eqz v0, :cond_1

    .line 221
    invoke-interface {v0, p0}, Lcom/vkontakte/android/media/VideoPools$PlayerContext;->onResume(Landroid/app/Activity;)V

    goto :goto_0

    .line 225
    .end local v0    # "context":Lcom/vkontakte/android/media/VideoPools$PlayerContext;
    .end local v1    # "contexts":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/media/VideoPools$PlayerContext;>;"
    .end local v2    # "holder":Lcom/vkontakte/android/media/VideoPools$PlayerHolder;
    :cond_2
    return-void
.end method

.method private static releasePlayer(Landroid/support/v4/util/Pair;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/Pair",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p0, "file":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Lcom/vkontakte/android/api/VideoFile;Ljava/lang/Integer;>;"
    const/4 v0, 0x1

    .line 183
    sget-object v1, Lcom/vkontakte/android/media/VideoPools;->exoPool:Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;

    invoke-virtual {v1, p0}, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->releasePlayer(Landroid/support/v4/util/Pair;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 188
    :cond_0
    :goto_0
    return v0

    .line 185
    :cond_1
    sget-object v1, Lcom/vkontakte/android/media/VideoPools;->mp4CompatPool:Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;

    invoke-virtual {v1, p0}, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;->releasePlayer(Landroid/support/v4/util/Pair;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 188
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static setOverlayDialogVisible(Z)V
    .locals 0
    .param p0, "overlayDialogVisible"    # Z

    .prologue
    .line 98
    sput-boolean p0, Lcom/vkontakte/android/media/VideoPools;->overlayDialogVisible:Z

    .line 99
    return-void
.end method
