.class Lcom/vkontakte/android/audio/player/Player$ErrorHandler;
.super Ljava/lang/Object;
.source "Player.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/Player;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ErrorHandler"
.end annotation


# instance fields
.field private mErrorCount:I

.field private mLastErrorTime:J

.field private mLastTime:J

.field final synthetic this$0:Lcom/vkontakte/android/audio/player/Player;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/player/Player;)V
    .locals 0

    .prologue
    .line 835
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/player/Player;Lcom/vkontakte/android/audio/player/Player$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/player/Player;
    .param p2, "x1"    # Lcom/vkontakte/android/audio/player/Player$1;

    .prologue
    .line 835
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;-><init>(Lcom/vkontakte/android/audio/player/Player;)V

    return-void
.end method

.method private canPlayNext()Z
    .locals 8

    .prologue
    const/4 v2, 0x0

    .line 857
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 859
    .local v0, "time":J
    :try_start_0
    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->mLastErrorTime:J

    const-wide/16 v6, 0x1388

    add-long/2addr v4, v6

    cmp-long v3, v0, v4

    if-gez v3, :cond_0

    .line 860
    iget v3, p0, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->mErrorCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->mErrorCount:I

    .line 861
    iget v3, p0, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->mErrorCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v4, 0x3

    if-lt v3, v4, :cond_1

    .line 868
    iput-wide v0, p0, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->mLastErrorTime:J

    :goto_0
    return v2

    .line 864
    :cond_0
    const/4 v2, 0x0

    :try_start_1
    iput v2, p0, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->mErrorCount:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 866
    :cond_1
    const/4 v2, 0x1

    .line 868
    iput-wide v0, p0, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->mLastErrorTime:J

    goto :goto_0

    :catchall_0
    move-exception v2

    iput-wide v0, p0, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->mLastErrorTime:J

    throw v2
.end method

.method private isFatalError(I)Z
    .locals 1
    .param p1, "textId"    # I

    .prologue
    .line 853
    const v0, 0x7f0803c2

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public varargs error(I[Ljava/lang/Object;)V
    .locals 8
    .param p1, "textId"    # I
    .param p2, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 841
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 842
    .local v2, "time":J
    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->mLastTime:J

    const-wide/16 v6, 0x3e8

    add-long/2addr v4, v6

    cmp-long v1, v2, v4

    if-ltz v1, :cond_0

    .line 843
    if-nez p2, :cond_3

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/Player;->access$1500(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/PlayerService;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/audio/player/PlayerService;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 844
    .local v0, "s":Ljava/lang/String;
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/Player;->access$1500(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/PlayerService;

    move-result-object v1

    const/4 v4, 0x1

    invoke-static {v1, v0, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 845
    iput-wide v2, p0, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->mLastTime:J

    .line 848
    .end local v0    # "s":Ljava/lang/String;
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->canPlayNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->isFatalError(I)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->this$0:Lcom/vkontakte/android/audio/player/Player;

    const/4 v4, 0x0

    invoke-static {v1, v4}, Lcom/vkontakte/android/audio/player/Player;->access$1600(Lcom/vkontakte/android/audio/player/Player;Z)Z

    move-result v1

    if-nez v1, :cond_2

    .line 849
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/Player;->stop()V

    .line 850
    :cond_2
    return-void

    .line 843
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player$ErrorHandler;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/Player;->access$1500(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/PlayerService;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lcom/vkontakte/android/audio/player/PlayerService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
