.class public Lcom/vkontakte/android/AudioMessagePlayerService;
.super Landroid/app/Service;
.source "AudioMessagePlayerService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;,
        Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;,
        Lcom/vkontakte/android/AudioMessagePlayerService$AbandonFocus;,
        Lcom/vkontakte/android/AudioMessagePlayerService$ReleaseRunnable;,
        Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;,
        Lcom/vkontakte/android/AudioMessagePlayerService$UpdateRunnable;
    }
.end annotation


# static fields
.field public static final ACTION_AUDIO_MESSAGE_DONE:Ljava/lang/String; = "com.vkontakte.android.actions.AUDIO_MESSAGE_DONE"

.field public static final ACTION_AUDIO_MESSAGE_UPDATE:Ljava/lang/String; = "com.vkontakte.android.actions.AUDIO_MESSAGE_UPDATE"

.field public static final ACTION_GET_UPDATE:I = 0x4

.field public static final ACTION_PAUSE:I = 0x3

.field public static final ACTION_PLAY:I = 0x1

.field public static final ACTION_RENAME:I = 0x5

.field public static final ACTION_SEEK:I = 0x7

.field public static final ACTION_SET_STREAM:I = 0x6

.field public static final ACTION_STOP:I = 0x2

.field private static final PLAY_RATE_HZ:I = 0xbb80

.field private static final RELEASE_DELAY:J = 0xea60L

.field private static final TAG:Ljava/lang/String; = "AudioMessagePlayerService"

.field private static final UPDATE_DELAY:J = 0x64L

.field private static audioTrackPlayer:Landroid/media/AudioTrack;

.field private static isPlaying:Z

.field private static readArgs:[I

.field private static useFrontSpeaker:Z


# instance fields
.field private final abandonFocus:Lcom/vkontakte/android/AudioMessagePlayerService$AbandonFocus;

.field private final audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

.field private buffersWrite:I

.field private currentDid:I

.field private currentMsgId:I

.field private currentOid:I

.field private currentPending:Z

.field private currentTotalPcmDuration:J

.field private decodingFinished:Z

.field private final fileDecodingQueue:Lcom/vkontakte/android/utils/DispatchQueue;

.field private final focusListener:Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;

.field private freePlayerBuffers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private lastPlayPcm:J

.field private lastProgress:F

.field private newDid:I

.field private newOid:I

.field private playerBufferSize:I

.field private final playerObjectSync:Ljava/lang/Object;

.field private final playerQueue:Lcom/vkontakte/android/utils/DispatchQueue;

.field private final playerSync:Ljava/lang/Object;

.field private final preferences:Landroid/content/SharedPreferences;

.field private final queue:Lcom/vkontakte/android/utils/DispatchQueue;

.field private final release:Lcom/vkontakte/android/AudioMessagePlayerService$ReleaseRunnable;

.field private final update:Lcom/vkontakte/android/AudioMessagePlayerService$UpdateRunnable;

.field private usedPlayerBuffers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 67
    const/4 v0, 0x3

    new-array v0, v0, [I

    sput-object v0, Lcom/vkontakte/android/AudioMessagePlayerService;->readArgs:[I

    return-void
.end method

.method public constructor <init>()V
    .locals 8

    .prologue
    const-wide/16 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 91
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 60
    new-instance v1, Lcom/vkontakte/android/utils/DispatchQueue;

    const-string/jumbo v2, "audio_message_player"

    invoke-direct {v1, v2}, Lcom/vkontakte/android/utils/DispatchQueue;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->queue:Lcom/vkontakte/android/utils/DispatchQueue;

    .line 61
    new-instance v1, Lcom/vkontakte/android/AudioMessagePlayerService$ReleaseRunnable;

    invoke-direct {v1, p0, v3}, Lcom/vkontakte/android/AudioMessagePlayerService$ReleaseRunnable;-><init>(Lcom/vkontakte/android/AudioMessagePlayerService;Lcom/vkontakte/android/AudioMessagePlayerService$1;)V

    iput-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->release:Lcom/vkontakte/android/AudioMessagePlayerService$ReleaseRunnable;

    .line 62
    new-instance v1, Lcom/vkontakte/android/AudioMessagePlayerService$UpdateRunnable;

    invoke-direct {v1, p0, v3}, Lcom/vkontakte/android/AudioMessagePlayerService$UpdateRunnable;-><init>(Lcom/vkontakte/android/AudioMessagePlayerService;Lcom/vkontakte/android/AudioMessagePlayerService$1;)V

    iput-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->update:Lcom/vkontakte/android/AudioMessagePlayerService$UpdateRunnable;

    .line 68
    invoke-static {}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->getInstance()Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .line 69
    new-instance v1, Lcom/vkontakte/android/utils/DispatchQueue;

    const-string/jumbo v2, "fileDecodingQueue"

    invoke-direct {v1, v2}, Lcom/vkontakte/android/utils/DispatchQueue;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->fileDecodingQueue:Lcom/vkontakte/android/utils/DispatchQueue;

    .line 70
    new-instance v1, Lcom/vkontakte/android/utils/DispatchQueue;

    const-string/jumbo v2, "playerQueue"

    invoke-direct {v1, v2}, Lcom/vkontakte/android/utils/DispatchQueue;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->playerQueue:Lcom/vkontakte/android/utils/DispatchQueue;

    .line 71
    new-instance v1, Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;

    invoke-direct {v1, p0, v3}, Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;-><init>(Lcom/vkontakte/android/AudioMessagePlayerService;Lcom/vkontakte/android/AudioMessagePlayerService$1;)V

    iput-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->focusListener:Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;

    .line 72
    new-instance v1, Lcom/vkontakte/android/AudioMessagePlayerService$AbandonFocus;

    invoke-direct {v1, p0, v3}, Lcom/vkontakte/android/AudioMessagePlayerService$AbandonFocus;-><init>(Lcom/vkontakte/android/AudioMessagePlayerService;Lcom/vkontakte/android/AudioMessagePlayerService$1;)V

    iput-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->abandonFocus:Lcom/vkontakte/android/AudioMessagePlayerService$AbandonFocus;

    .line 73
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->usedPlayerBuffers:Ljava/util/List;

    .line 74
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->freePlayerBuffers:Ljava/util/List;

    .line 75
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->playerObjectSync:Ljava/lang/Object;

    .line 76
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->playerSync:Ljava/lang/Object;

    .line 92
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v2, "AudioMessagePlayerService"

    invoke-virtual {v1, v2, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->preferences:Landroid/content/SharedPreferences;

    .line 93
    iget-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->preferences:Landroid/content/SharedPreferences;

    const-string/jumbo v2, "oid"

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentOid:I

    .line 94
    iget-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->preferences:Landroid/content/SharedPreferences;

    const-string/jumbo v2, "did"

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentDid:I

    .line 95
    iget-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->preferences:Landroid/content/SharedPreferences;

    const-string/jumbo v2, "pcm"

    invoke-interface {v1, v2, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->lastPlayPcm:J

    .line 96
    iget-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->preferences:Landroid/content/SharedPreferences;

    const-string/jumbo v2, "progress"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->lastProgress:F

    .line 97
    iget-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->preferences:Landroid/content/SharedPreferences;

    const-string/jumbo v2, "total"

    invoke-interface {v1, v2, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentTotalPcmDuration:J

    .line 98
    iget-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->preferences:Landroid/content/SharedPreferences;

    const-string/jumbo v2, "pending"

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentPending:Z

    .line 99
    const v1, 0xbb80

    const/4 v2, 0x4

    const/4 v3, 0x2

    invoke-static {v1, v2, v3}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->playerBufferSize:I

    .line 100
    iget v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->playerBufferSize:I

    if-gtz v1, :cond_0

    .line 101
    const/16 v1, 0xf00

    iput v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->playerBufferSize:I

    .line 103
    :cond_0
    const/4 v0, 0x0

    .local v0, "a":I
    :goto_0
    const/4 v1, 0x3

    if-ge v0, v1, :cond_1

    .line 104
    iget-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->freePlayerBuffers:Ljava/util/List;

    new-instance v2, Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;

    iget v3, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->playerBufferSize:I

    invoke-direct {v2, v3}, Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;-><init>(I)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 106
    :cond_1
    return-void
.end method

.method private abandonAudioFocus()V
    .locals 4

    .prologue
    .line 574
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->queue:Lcom/vkontakte/android/utils/DispatchQueue;

    iget-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->abandonFocus:Lcom/vkontakte/android/AudioMessagePlayerService$AbandonFocus;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Lcom/vkontakte/android/utils/DispatchQueue;->postRunnable(Ljava/lang/Runnable;J)V

    .line 575
    return-void
.end method

.method static synthetic access$1000()Landroid/media/AudioTrack;
    .locals 1

    .prologue
    .line 43
    sget-object v0, Lcom/vkontakte/android/AudioMessagePlayerService;->audioTrackPlayer:Landroid/media/AudioTrack;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/AudioMessagePlayerService;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->playerSync:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/AudioMessagePlayerService;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->usedPlayerBuffers:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/AudioMessagePlayerService;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    iget v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->buffersWrite:I

    return v0
.end method

.method static synthetic access$1308(Lcom/vkontakte/android/AudioMessagePlayerService;)I
    .locals 2
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    iget v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->buffersWrite:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->buffersWrite:I

    return v0
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/AudioMessagePlayerService;)J
    .locals 2
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    iget-wide v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->lastPlayPcm:J

    return-wide v0
.end method

.method static synthetic access$1402(Lcom/vkontakte/android/AudioMessagePlayerService;J)J
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;
    .param p1, "x1"    # J

    .prologue
    .line 43
    iput-wide p1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->lastPlayPcm:J

    return-wide p1
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/AudioMessagePlayerService;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->checkPlayerQueue()V

    return-void
.end method

.method static synthetic access$1600(Lcom/vkontakte/android/AudioMessagePlayerService;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->checkDecoderQueue()V

    return-void
.end method

.method static synthetic access$1700(Lcom/vkontakte/android/AudioMessagePlayerService;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->freePlayerBuffers:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/vkontakte/android/AudioMessagePlayerService;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    iget-boolean v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->decodingFinished:Z

    return v0
.end method

.method static synthetic access$1802(Lcom/vkontakte/android/AudioMessagePlayerService;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;
    .param p1, "x1"    # Z

    .prologue
    .line 43
    iput-boolean p1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->decodingFinished:Z

    return p1
.end method

.method static synthetic access$1900(Lcom/vkontakte/android/AudioMessagePlayerService;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    iget v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->playerBufferSize:I

    return v0
.end method

.method static synthetic access$2000()[I
    .locals 1

    .prologue
    .line 43
    sget-object v0, Lcom/vkontakte/android/AudioMessagePlayerService;->readArgs:[I

    return-object v0
.end method

.method static synthetic access$2100(Lcom/vkontakte/android/AudioMessagePlayerService;)Lcom/vkontakte/android/media/audio/AudioMessageUtils;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/vkontakte/android/AudioMessagePlayerService;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->sendBroadcastUpdate()V

    return-void
.end method

.method static synthetic access$2300(Lcom/vkontakte/android/AudioMessagePlayerService;)Lcom/vkontakte/android/utils/DispatchQueue;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->queue:Lcom/vkontakte/android/utils/DispatchQueue;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/vkontakte/android/AudioMessagePlayerService;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    iget v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentOid:I

    return v0
.end method

.method static synthetic access$2500(Lcom/vkontakte/android/AudioMessagePlayerService;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    iget v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentDid:I

    return v0
.end method

.method static synthetic access$2600(Lcom/vkontakte/android/AudioMessagePlayerService;Ljava/io/File;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;
    .param p1, "x1"    # Ljava/io/File;

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lcom/vkontakte/android/AudioMessagePlayerService;->play(Ljava/io/File;)V

    return-void
.end method

.method static synthetic access$2700(Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Landroid/content/Context;

    .prologue
    .line 43
    invoke-static {p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->showOnErrorMessage(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$2800(Lcom/vkontakte/android/AudioMessagePlayerService;)Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->focusListener:Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;

    return-object v0
.end method

.method static synthetic access$2900(Lcom/vkontakte/android/AudioMessagePlayerService;)J
    .locals 2
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    iget-wide v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentTotalPcmDuration:J

    return-wide v0
.end method

.method static synthetic access$3000(Lcom/vkontakte/android/AudioMessagePlayerService;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    iget-boolean v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentPending:Z

    return v0
.end method

.method static synthetic access$3100(Lcom/vkontakte/android/AudioMessagePlayerService;IIJJFZ)V
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # J
    .param p5, "x4"    # J
    .param p7, "x5"    # F
    .param p8, "x6"    # Z

    .prologue
    .line 43
    invoke-direct/range {p0 .. p8}, Lcom/vkontakte/android/AudioMessagePlayerService;->writePreferences(IIJJFZ)V

    return-void
.end method

.method static synthetic access$400(Lcom/vkontakte/android/AudioMessagePlayerService;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->cleanupPlayer()V

    return-void
.end method

.method static synthetic access$500(Lcom/vkontakte/android/AudioMessagePlayerService;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->sendBroadcastDone()V

    return-void
.end method

.method static synthetic access$600(Lcom/vkontakte/android/AudioMessagePlayerService;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->onComplete()V

    return-void
.end method

.method static synthetic access$700(Lcom/vkontakte/android/AudioMessagePlayerService;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    iget v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->lastProgress:F

    return v0
.end method

.method static synthetic access$702(Lcom/vkontakte/android/AudioMessagePlayerService;F)F
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;
    .param p1, "x1"    # F

    .prologue
    .line 43
    iput p1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->lastProgress:F

    return p1
.end method

.method static synthetic access$800(Lcom/vkontakte/android/AudioMessagePlayerService;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->abandonAudioFocus()V

    return-void
.end method

.method static synthetic access$900(Lcom/vkontakte/android/AudioMessagePlayerService;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->playerObjectSync:Ljava/lang/Object;

    return-object v0
.end method

.method private checkDecoderQueue()V
    .locals 2

    .prologue
    .line 410
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->fileDecodingQueue:Lcom/vkontakte/android/utils/DispatchQueue;

    new-instance v1, Lcom/vkontakte/android/AudioMessagePlayerService$3;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/AudioMessagePlayerService$3;-><init>(Lcom/vkontakte/android/AudioMessagePlayerService;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/utils/DispatchQueue;->postRunnable(Ljava/lang/Runnable;)V

    .line 459
    return-void
.end method

.method private checkPlayerQueue()V
    .locals 2

    .prologue
    .line 350
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->playerQueue:Lcom/vkontakte/android/utils/DispatchQueue;

    new-instance v1, Lcom/vkontakte/android/AudioMessagePlayerService$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/AudioMessagePlayerService$2;-><init>(Lcom/vkontakte/android/AudioMessagePlayerService;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/utils/DispatchQueue;->postRunnable(Ljava/lang/Runnable;)V

    .line 407
    return-void
.end method

.method public static cleanCache()V
    .locals 8

    .prologue
    .line 583
    :try_start_0
    sget-object v3, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->CACHE_DIR:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 584
    .local v2, "files":[Ljava/io/File;
    if-eqz v2, :cond_0

    .line 585
    array-length v4, v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v1, v2, v3

    .line 586
    .local v1, "f":Ljava/io/File;
    const-string/jumbo v5, "AudioMessagePlayerService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Deleting: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 587
    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 585
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 590
    .end local v1    # "f":Ljava/io/File;
    :catch_0
    move-exception v0

    .line 591
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v3, "AudioMessagePlayerService"

    const-string/jumbo v4, "Audio messages cache clean failure"

    invoke-static {v3, v4, v0}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 593
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    return-void
.end method

.method private cleanupPlayer()V
    .locals 8

    .prologue
    .line 495
    iget-object v3, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->playerObjectSync:Ljava/lang/Object;

    monitor-enter v3

    .line 496
    :try_start_0
    sget-object v2, Lcom/vkontakte/android/AudioMessagePlayerService;->audioTrackPlayer:Landroid/media/AudioTrack;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_1

    .line 498
    :try_start_1
    sget-object v2, Lcom/vkontakte/android/AudioMessagePlayerService;->audioTrackPlayer:Landroid/media/AudioTrack;

    invoke-virtual {v2}, Landroid/media/AudioTrack;->pause()V

    .line 499
    sget-object v2, Lcom/vkontakte/android/AudioMessagePlayerService;->audioTrackPlayer:Landroid/media/AudioTrack;

    invoke-virtual {v2}, Landroid/media/AudioTrack;->flush()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 504
    :goto_0
    :try_start_2
    sget-object v2, Lcom/vkontakte/android/AudioMessagePlayerService;->audioTrackPlayer:Landroid/media/AudioTrack;

    invoke-virtual {v2}, Landroid/media/AudioTrack;->release()V

    .line 505
    const/4 v2, 0x0

    sput-object v2, Lcom/vkontakte/android/AudioMessagePlayerService;->audioTrackPlayer:Landroid/media/AudioTrack;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 509
    :goto_1
    :try_start_3
    iget v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->newOid:I

    if-eqz v2, :cond_0

    iget v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->newDid:I

    if-eqz v2, :cond_0

    .line 510
    iget v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentOid:I

    iget v4, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentDid:I

    invoke-static {v2, v4}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->getCacheFile(II)Ljava/io/File;

    move-result-object v0

    .line 511
    .local v0, "curFile":Ljava/io/File;
    iget v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->newOid:I

    iget v4, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->newDid:I

    invoke-static {v0, v2, v4}, Lcom/vkontakte/android/AudioMessagePlayerService;->renameCacheFile(Ljava/io/File;II)V

    .line 512
    const/4 v2, 0x0

    iput v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->newOid:I

    .line 513
    const/4 v2, 0x0

    iput v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->newDid:I

    .line 515
    .end local v0    # "curFile":Ljava/io/File;
    :cond_0
    const/4 v2, 0x0

    sput-boolean v2, Lcom/vkontakte/android/AudioMessagePlayerService;->isPlaying:Z

    .line 516
    const/4 v2, 0x0

    iput v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->buffersWrite:I

    .line 518
    invoke-direct {p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->sendBroadcastUpdate()V

    .line 519
    iget-object v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->queue:Lcom/vkontakte/android/utils/DispatchQueue;

    iget-object v4, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->update:Lcom/vkontakte/android/AudioMessagePlayerService$UpdateRunnable;

    invoke-virtual {v2, v4}, Lcom/vkontakte/android/utils/DispatchQueue;->cancelRunnable(Ljava/lang/Runnable;)V

    .line 520
    iget-object v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->queue:Lcom/vkontakte/android/utils/DispatchQueue;

    iget-object v4, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->release:Lcom/vkontakte/android/AudioMessagePlayerService$ReleaseRunnable;

    const-wide/32 v6, 0xea60

    invoke-virtual {v2, v4, v6, v7}, Lcom/vkontakte/android/utils/DispatchQueue;->postRunnable(Ljava/lang/Runnable;J)V

    .line 522
    :cond_1
    monitor-exit v3

    .line 523
    return-void

    .line 500
    :catch_0
    move-exception v1

    .line 501
    .local v1, "e":Ljava/lang/Exception;
    const-string/jumbo v2, "AudioMessagePlayerService"

    const-string/jumbo v4, "Failure on pause opus file player"

    invoke-static {v2, v4, v1}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 522
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v2

    .line 506
    :catch_1
    move-exception v1

    .line 507
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_4
    const-string/jumbo v2, "AudioMessagePlayerService"

    const-string/jumbo v4, "Failure on release opus file player"

    invoke-static {v2, v4, v1}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1
.end method

.method public static isFrontSpeakerUsed()Z
    .locals 1

    .prologue
    .line 609
    sget-boolean v0, Lcom/vkontakte/android/AudioMessagePlayerService;->useFrontSpeaker:Z

    return v0
.end method

.method public static isPlaying()Z
    .locals 1

    .prologue
    .line 605
    sget-object v0, Lcom/vkontakte/android/AudioMessagePlayerService;->audioTrackPlayer:Landroid/media/AudioTrack;

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/vkontakte/android/AudioMessagePlayerService;->isPlaying:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private onComplete()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 240
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->queue:Lcom/vkontakte/android/utils/DispatchQueue;

    iget-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->update:Lcom/vkontakte/android/AudioMessagePlayerService$UpdateRunnable;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/utils/DispatchQueue;->cancelRunnable(Ljava/lang/Runnable;)V

    .line 241
    iput v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentOid:I

    .line 242
    iput v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentDid:I

    .line 243
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->lastProgress:F

    .line 244
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->lastPlayPcm:J

    .line 245
    iput-boolean v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentPending:Z

    .line 246
    return-void
.end method

.method private play(Ljava/io/File;)V
    .locals 2
    .param p1, "source"    # Ljava/io/File;

    .prologue
    .line 268
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/medianative/MediaNative;->nativeAudioIsOpusFile(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 269
    invoke-direct {p0, p1}, Lcom/vkontakte/android/AudioMessagePlayerService;->playOpusFile(Ljava/io/File;)Z

    .line 274
    :goto_0
    return-void

    .line 271
    :cond_0
    invoke-static {p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->showOnErrorMessage(Landroid/content/Context;)V

    .line 272
    invoke-direct {p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->sendBroadcastDone()V

    goto :goto_0
.end method

.method private play(Ljava/lang/String;IIIZ)V
    .locals 7
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "oid"    # I
    .param p3, "did"    # I
    .param p4, "msgId"    # I
    .param p5, "pending"    # Z

    .prologue
    .line 249
    iput p2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentOid:I

    .line 250
    iput p3, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentDid:I

    .line 251
    iput p4, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentMsgId:I

    .line 252
    iput-boolean p5, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentPending:Z

    .line 253
    if-eqz p2, :cond_0

    if-nez p3, :cond_1

    .line 254
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/vkontakte/android/AudioMessagePlayerService;->play(Ljava/io/File;)V

    .line 265
    :goto_0
    return-void

    .line 256
    :cond_1
    invoke-static {p2, p3}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->getCacheFile(II)Ljava/io/File;

    move-result-object v3

    .line 257
    .local v3, "cacheFile":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 258
    invoke-direct {p0, v3}, Lcom/vkontakte/android/AudioMessagePlayerService;->play(Ljava/io/File;)V

    goto :goto_0

    .line 260
    :cond_2
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentTotalPcmDuration:J

    .line 261
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->queue:Lcom/vkontakte/android/utils/DispatchQueue;

    iget-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->update:Lcom/vkontakte/android/AudioMessagePlayerService$UpdateRunnable;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/utils/DispatchQueue;->postRunnable(Ljava/lang/Runnable;)V

    .line 262
    iget-object v6, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->queue:Lcom/vkontakte/android/utils/DispatchQueue;

    new-instance v0, Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;

    move-object v1, p0

    move-object v2, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;-><init>(Lcom/vkontakte/android/AudioMessagePlayerService;Ljava/lang/String;Ljava/io/File;II)V

    invoke-virtual {v6, v0}, Lcom/vkontakte/android/utils/DispatchQueue;->postRunnable(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private playOpusFile(Ljava/io/File;)Z
    .locals 13
    .param p1, "opusFile"    # Ljava/io/File;

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 277
    iget-object v12, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->playerObjectSync:Ljava/lang/Object;

    monitor-enter v12

    .line 279
    :try_start_0
    new-instance v9, Ljava/util/concurrent/Semaphore;

    const/4 v0, 0x0

    invoke-direct {v9, v0}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    .line 280
    .local v9, "semaphore":Ljava/util/concurrent/Semaphore;
    const/4 v0, 0x1

    new-array v8, v0, [Ljava/lang/Boolean;

    .line 281
    .local v8, "result":[Ljava/lang/Boolean;
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->fileDecodingQueue:Lcom/vkontakte/android/utils/DispatchQueue;

    invoke-static {p0, v8, p1, v9}, Lcom/vkontakte/android/AudioMessagePlayerService$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/AudioMessagePlayerService;[Ljava/lang/Boolean;Ljava/io/File;Ljava/util/concurrent/Semaphore;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/utils/DispatchQueue;->postRunnable(Ljava/lang/Runnable;)V

    .line 285
    invoke-virtual {v9}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 287
    const/4 v0, 0x0

    aget-object v0, v8, v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 288
    :try_start_1
    monitor-exit v12
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move v0, v10

    .line 344
    .end local v8    # "result":[Ljava/lang/Boolean;
    .end local v9    # "semaphore":Ljava/util/concurrent/Semaphore;
    :goto_0
    return v0

    .line 291
    .restart local v8    # "result":[Ljava/lang/Boolean;
    .restart local v9    # "semaphore":Ljava/util/concurrent/Semaphore;
    :cond_0
    :try_start_2
    invoke-direct {p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->requestAudioFocus()V

    .line 293
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->getTotalPcmDuration()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentTotalPcmDuration:J

    .line 294
    sget-boolean v0, Lcom/vkontakte/android/AudioMessagePlayerService;->useFrontSpeaker:Z

    if-eqz v0, :cond_3

    move v1, v10

    .line 295
    .local v1, "streamType":I
    :goto_1
    new-instance v0, Landroid/media/AudioTrack;

    const v2, 0xbb80

    const/4 v3, 0x4

    const/4 v4, 0x2

    iget v5, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->playerBufferSize:I

    const/4 v6, 0x1

    invoke-direct/range {v0 .. v6}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    sput-object v0, Lcom/vkontakte/android/AudioMessagePlayerService;->audioTrackPlayer:Landroid/media/AudioTrack;

    .line 297
    sget-object v0, Lcom/vkontakte/android/AudioMessagePlayerService;->audioTrackPlayer:Landroid/media/AudioTrack;

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v0, v2, v3}, Landroid/media/AudioTrack;->setStereoVolume(FF)I

    .line 298
    sget-object v0, Lcom/vkontakte/android/AudioMessagePlayerService;->audioTrackPlayer:Landroid/media/AudioTrack;

    new-instance v2, Lcom/vkontakte/android/AudioMessagePlayerService$1;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/AudioMessagePlayerService$1;-><init>(Lcom/vkontakte/android/AudioMessagePlayerService;)V

    invoke-virtual {v0, v2}, Landroid/media/AudioTrack;->setPlaybackPositionUpdateListener(Landroid/media/AudioTrack$OnPlaybackPositionUpdateListener;)V

    .line 313
    sget-object v0, Lcom/vkontakte/android/AudioMessagePlayerService;->audioTrackPlayer:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V

    .line 315
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->fileDecodingQueue:Lcom/vkontakte/android/utils/DispatchQueue;

    invoke-static {p0}, Lcom/vkontakte/android/AudioMessagePlayerService$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/AudioMessagePlayerService;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/utils/DispatchQueue;->postRunnable(Ljava/lang/Runnable;)V

    .line 324
    iget v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->lastProgress:F

    const/4 v2, 0x0

    cmpl-float v0, v0, v2

    if-lez v0, :cond_1

    .line 325
    iget v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->lastProgress:F

    invoke-direct {p0, v0}, Lcom/vkontakte/android/AudioMessagePlayerService;->seekOpusPlayer(F)V

    .line 328
    :cond_1
    const/4 v0, 0x1

    sput-boolean v0, Lcom/vkontakte/android/AudioMessagePlayerService;->isPlaying:Z

    .line 329
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->queue:Lcom/vkontakte/android/utils/DispatchQueue;

    iget-object v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->update:Lcom/vkontakte/android/AudioMessagePlayerService$UpdateRunnable;

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/utils/DispatchQueue;->postRunnable(Ljava/lang/Runnable;)V

    .line 331
    iget-boolean v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentPending:Z

    if-nez v0, :cond_2

    .line 332
    const-string/jumbo v0, "audio_message_play"

    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    const-string/jumbo v2, "audio_message_id"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget v4, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentOid:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentDid:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 333
    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    .line 334
    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 337
    :cond_2
    :try_start_3
    monitor-exit v12

    move v0, v11

    goto/16 :goto_0

    .line 294
    .end local v1    # "streamType":I
    :cond_3
    const/4 v1, 0x3

    goto :goto_1

    .line 338
    .end local v8    # "result":[Ljava/lang/Boolean;
    .end local v9    # "semaphore":Ljava/util/concurrent/Semaphore;
    :catch_0
    move-exception v7

    .line 339
    .local v7, "e":Ljava/lang/Exception;
    const-string/jumbo v0, "AudioMessagePlayerService"

    const-string/jumbo v2, "Failure on play opus file"

    invoke-static {v0, v2, v7}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 340
    sget-object v0, Lcom/vkontakte/android/AudioMessagePlayerService;->audioTrackPlayer:Landroid/media/AudioTrack;

    if-eqz v0, :cond_4

    .line 341
    sget-object v0, Lcom/vkontakte/android/AudioMessagePlayerService;->audioTrackPlayer:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    .line 342
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/AudioMessagePlayerService;->audioTrackPlayer:Landroid/media/AudioTrack;

    .line 344
    :cond_4
    monitor-exit v12

    move v0, v10

    goto/16 :goto_0

    .line 346
    .end local v7    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    monitor-exit v12
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0
.end method

.method private static renameCacheFile(Ljava/io/File;II)V
    .locals 1
    .param p0, "file"    # Ljava/io/File;
    .param p1, "oid"    # I
    .param p2, "did"    # I

    .prologue
    .line 600
    invoke-static {p1, p2}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->getCacheFile(II)Ljava/io/File;

    move-result-object v0

    .line 601
    .local v0, "newFile":Ljava/io/File;
    invoke-virtual {p0, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 602
    return-void
.end method

.method private static renameCacheFile(Ljava/lang/String;II)V
    .locals 1
    .param p0, "file"    # Ljava/lang/String;
    .param p1, "oid"    # I
    .param p2, "did"    # I

    .prologue
    .line 596
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p1, p2}, Lcom/vkontakte/android/AudioMessagePlayerService;->renameCacheFile(Ljava/io/File;II)V

    .line 597
    return-void
.end method

.method private requestAudioFocus()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 564
    invoke-static {p0}, Lcom/vkontakte/android/audio/utils/Utils;->getAudioManager(Landroid/content/Context;)Landroid/media/AudioManager;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->focusListener:Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;

    const/4 v3, 0x3

    const/4 v4, 0x2

    .line 565
    invoke-virtual {v1, v2, v3, v4}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    move-result v0

    .line 566
    .local v0, "result":I
    if-ne v0, v5, :cond_0

    .line 567
    iget-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->focusListener:Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;

    invoke-virtual {v1, v5}, Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;->onAudioFocusChange(I)V

    .line 571
    :goto_0
    return-void

    .line 569
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->focusListener:Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;->onAudioFocusChange(I)V

    goto :goto_0
.end method

.method private seekOpusPlayer(F)V
    .locals 3
    .param p1, "progress"    # F

    .prologue
    .line 463
    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v1, p1, v1

    if-nez v1, :cond_0

    .line 492
    :goto_0
    return-void

    .line 466
    :cond_0
    :try_start_0
    sget-boolean v1, Lcom/vkontakte/android/AudioMessagePlayerService;->isPlaying:Z

    if-eqz v1, :cond_1

    .line 467
    sget-object v1, Lcom/vkontakte/android/AudioMessagePlayerService;->audioTrackPlayer:Landroid/media/AudioTrack;

    invoke-virtual {v1}, Landroid/media/AudioTrack;->pause()V

    .line 469
    :cond_1
    sget-object v1, Lcom/vkontakte/android/AudioMessagePlayerService;->audioTrackPlayer:Landroid/media/AudioTrack;

    invoke-virtual {v1}, Landroid/media/AudioTrack;->flush()V

    .line 470
    iget-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->fileDecodingQueue:Lcom/vkontakte/android/utils/DispatchQueue;

    invoke-static {p0, p1}, Lcom/vkontakte/android/AudioMessagePlayerService$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/AudioMessagePlayerService;F)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/utils/DispatchQueue;->postRunnable(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 489
    :catch_0
    move-exception v0

    .line 490
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v1, "AudioMessagePlayerService"

    const-string/jumbo v2, "Failure on seek opus player"

    invoke-static {v1, v2, v0}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private sendBroadcastDone()V
    .locals 3

    .prologue
    .line 537
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.actions.AUDIO_MESSAGE_DONE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 538
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "oid"

    iget v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentOid:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 539
    const-string/jumbo v1, "did"

    iget v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentDid:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 540
    const-string/jumbo v1, "msg_id"

    iget v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentMsgId:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 541
    const-string/jumbo v1, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/AudioMessagePlayerService;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 542
    return-void
.end method

.method private sendBroadcastUpdate()V
    .locals 8

    .prologue
    .line 546
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.actions.AUDIO_MESSAGE_UPDATE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 547
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "oid"

    iget v3, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentOid:I

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 548
    const-string/jumbo v2, "did"

    iget v3, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentDid:I

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 549
    iget-wide v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentTotalPcmDuration:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    .line 550
    iget-wide v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->lastPlayPcm:J

    long-to-float v2, v2

    iget-wide v4, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentTotalPcmDuration:J

    long-to-float v3, v4

    div-float/2addr v2, v3

    iput v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->lastProgress:F

    .line 551
    const-string/jumbo v2, "progress"

    iget v3, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->lastProgress:F

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    .line 552
    const-string/jumbo v2, "position"

    iget-wide v4, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->lastPlayPcm:J

    const-wide/32 v6, 0xbb80

    div-long/2addr v4, v6

    long-to-int v3, v4

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 553
    const-string/jumbo v2, "playing"

    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->isPlaying()Z

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 557
    :goto_0
    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/AudioMessagePlayerService;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 561
    .end local v1    # "intent":Landroid/content/Intent;
    :goto_1
    return-void

    .line 555
    .restart local v1    # "intent":Landroid/content/Intent;
    :cond_0
    const-string/jumbo v2, "progress"

    const/high16 v3, -0x40800000    # -1.0f

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 558
    .end local v1    # "intent":Landroid/content/Intent;
    :catch_0
    move-exception v0

    .line 559
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v2, "AudioMessagePlayerService"

    const-string/jumbo v3, "Get player state error"

    invoke-static {v2, v3, v0}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method private static showOnErrorMessage(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 578
    const v0, 0x7f0800ec

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 579
    return-void
.end method

.method private writePreferences(IIJJFZ)V
    .locals 3
    .param p1, "oid"    # I
    .param p2, "did"    # I
    .param p3, "pcm"    # J
    .param p5, "total"    # J
    .param p7, "progress"    # F
    .param p8, "pending"    # Z

    .prologue
    .line 526
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "oid"

    .line 527
    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "did"

    .line 528
    invoke-interface {v0, v1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "pcm"

    .line 529
    invoke-interface {v0, v1, p3, p4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "progress"

    .line 530
    invoke-interface {v0, v1, p7}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "total"

    .line 531
    invoke-interface {v0, v1, p5, p6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "pending"

    .line 532
    invoke-interface {v0, v1, p8}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 533
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 534
    return-void
.end method


# virtual methods
.method synthetic lambda$playOpusFile$0([Ljava/lang/Boolean;Ljava/io/File;Ljava/util/concurrent/Semaphore;)V
    .locals 3
    .param p1, "result"    # [Ljava/lang/Boolean;
    .param p2, "opusFile"    # Ljava/io/File;
    .param p3, "semaphore"    # Ljava/util/concurrent/Semaphore;

    .prologue
    const/4 v1, 0x0

    .line 282
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->openOpusFile(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, p1, v1

    .line 283
    invoke-virtual {p3}, Ljava/util/concurrent/Semaphore;->release()V

    .line 284
    return-void

    :cond_0
    move v0, v1

    .line 282
    goto :goto_0
.end method

.method synthetic lambda$playOpusFile$1()V
    .locals 3

    .prologue
    .line 316
    iget-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->playerSync:Ljava/lang/Object;

    monitor-enter v1

    .line 317
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->freePlayerBuffers:Ljava/util/List;

    iget-object v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->usedPlayerBuffers:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 318
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->usedPlayerBuffers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 319
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 320
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->decodingFinished:Z

    .line 321
    invoke-direct {p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->checkPlayerQueue()V

    .line 322
    return-void

    .line 319
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method synthetic lambda$seekOpusPlayer$2(F)V
    .locals 4
    .param p1, "progress"    # F

    .prologue
    .line 472
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->audioMessageUtils:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->seekOpusFile(F)V

    .line 473
    iget-object v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->playerSync:Ljava/lang/Object;

    monitor-enter v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 474
    :try_start_1
    iget-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->freePlayerBuffers:Ljava/util/List;

    iget-object v3, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->usedPlayerBuffers:Ljava/util/List;

    invoke-interface {v1, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 475
    iget-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->usedPlayerBuffers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 476
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 478
    :try_start_2
    sget-boolean v1, Lcom/vkontakte/android/AudioMessagePlayerService;->isPlaying:Z

    if-eqz v1, :cond_1

    .line 479
    iget-wide v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentTotalPcmDuration:J

    long-to-float v1, v2

    mul-float/2addr v1, p1

    float-to-long v2, v1

    iput-wide v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->lastPlayPcm:J

    .line 480
    sget-object v1, Lcom/vkontakte/android/AudioMessagePlayerService;->audioTrackPlayer:Landroid/media/AudioTrack;

    if-eqz v1, :cond_0

    .line 481
    sget-object v1, Lcom/vkontakte/android/AudioMessagePlayerService;->audioTrackPlayer:Landroid/media/AudioTrack;

    invoke-virtual {v1}, Landroid/media/AudioTrack;->play()V

    .line 483
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->checkPlayerQueue()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 488
    :cond_1
    :goto_0
    return-void

    .line 476
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 485
    :catch_0
    move-exception v0

    .line 486
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v1, "AudioMessagePlayerService"

    const-string/jumbo v2, "Failure on play opus player"

    invoke-static {v1, v2, v0}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 224
    const/4 v0, 0x0

    return-object v0
.end method

.method public onDestroy()V
    .locals 10

    .prologue
    const-wide/16 v4, 0x0

    const/4 v2, 0x0

    .line 229
    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 230
    const/4 v8, 0x0

    move-object v1, p0

    move v3, v2

    move-wide v6, v4

    move v9, v2

    invoke-direct/range {v1 .. v9}, Lcom/vkontakte/android/AudioMessagePlayerService;->writePreferences(IIJJFZ)V

    .line 231
    invoke-direct {p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->cleanupPlayer()V

    .line 232
    invoke-direct {p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->onComplete()V

    .line 233
    invoke-direct {p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->abandonAudioFocus()V

    .line 235
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->queue:Lcom/vkontakte/android/utils/DispatchQueue;

    iget-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService;->update:Lcom/vkontakte/android/AudioMessagePlayerService$UpdateRunnable;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/utils/DispatchQueue;->cancelRunnable(Ljava/lang/Runnable;)V

    .line 236
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 237
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 24
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    .line 110
    if-nez p1, :cond_0

    .line 111
    const/4 v2, 0x2

    .line 219
    :goto_0
    return v2

    .line 114
    :cond_0
    const-string/jumbo v2, "action"

    const/4 v8, -0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v18

    .line 115
    .local v18, "act":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->queue:Lcom/vkontakte/android/utils/DispatchQueue;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->release:Lcom/vkontakte/android/AudioMessagePlayerService$ReleaseRunnable;

    invoke-virtual {v2, v8}, Lcom/vkontakte/android/utils/DispatchQueue;->cancelRunnable(Ljava/lang/Runnable;)V

    .line 116
    packed-switch v18, :pswitch_data_0

    .line 219
    :cond_1
    :goto_1
    const/4 v2, 0x2

    goto :goto_0

    .line 118
    :pswitch_0
    const/4 v4, 0x0

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    const-wide/16 v8, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v3, p0

    invoke-direct/range {v3 .. v11}, Lcom/vkontakte/android/AudioMessagePlayerService;->writePreferences(IIJJFZ)V

    .line 120
    :try_start_0
    const-string/jumbo v2, "oid"

    const/4 v8, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 121
    .local v4, "oid":I
    const-string/jumbo v2, "did"

    const/4 v8, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    .line 122
    .local v5, "did":I
    const-string/jumbo v2, "msg_id"

    const/4 v8, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    .line 123
    .local v6, "msgId":I
    const-string/jumbo v2, "url"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 124
    .local v3, "url":Ljava/lang/String;
    const-string/jumbo v2, "pending"

    const/4 v8, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v8}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v7

    .line 125
    .local v7, "pending":Z
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentOid:I

    if-ne v2, v4, :cond_3

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentDid:I

    if-ne v2, v5, :cond_3

    .line 126
    const-string/jumbo v2, "progress"

    move-object/from16 v0, p0

    iget v8, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->lastProgress:F

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v8}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->lastProgress:F

    .line 127
    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->isPlaying()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 128
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->cleanupPlayer()V

    .line 129
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->abandonAudioFocus()V

    .line 134
    :goto_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->queue:Lcom/vkontakte/android/utils/DispatchQueue;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->update:Lcom/vkontakte/android/AudioMessagePlayerService$UpdateRunnable;

    invoke-virtual {v2, v8}, Lcom/vkontakte/android/utils/DispatchQueue;->postRunnable(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 142
    .end local v3    # "url":Ljava/lang/String;
    .end local v4    # "oid":I
    .end local v5    # "did":I
    .end local v6    # "msgId":I
    .end local v7    # "pending":Z
    :catch_0
    move-exception v20

    .line 143
    .local v20, "e":Ljava/lang/Exception;
    const-string/jumbo v2, "AudioMessagePlayerService"

    const-string/jumbo v8, "Audio message player error "

    move-object/from16 v0, v20

    invoke-static {v2, v8, v0}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 144
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->showOnErrorMessage(Landroid/content/Context;)V

    .line 145
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->sendBroadcastDone()V

    goto/16 :goto_1

    .line 131
    .end local v20    # "e":Ljava/lang/Exception;
    .restart local v3    # "url":Ljava/lang/String;
    .restart local v4    # "oid":I
    .restart local v5    # "did":I
    .restart local v6    # "msgId":I
    .restart local v7    # "pending":Z
    :cond_2
    :try_start_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->queue:Lcom/vkontakte/android/utils/DispatchQueue;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->abandonFocus:Lcom/vkontakte/android/AudioMessagePlayerService$AbandonFocus;

    invoke-virtual {v2, v8}, Lcom/vkontakte/android/utils/DispatchQueue;->cancelRunnable(Ljava/lang/Runnable;)V

    move-object/from16 v2, p0

    .line 132
    invoke-direct/range {v2 .. v7}, Lcom/vkontakte/android/AudioMessagePlayerService;->play(Ljava/lang/String;IIIZ)V

    goto :goto_2

    .line 136
    :cond_3
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->cleanupPlayer()V

    .line 137
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->onComplete()V

    .line 138
    const-string/jumbo v2, "progress"

    move-object/from16 v0, p0

    iget v8, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->lastProgress:F

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v8}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->lastProgress:F

    .line 139
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->queue:Lcom/vkontakte/android/utils/DispatchQueue;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->abandonFocus:Lcom/vkontakte/android/AudioMessagePlayerService$AbandonFocus;

    invoke-virtual {v2, v8}, Lcom/vkontakte/android/utils/DispatchQueue;->cancelRunnable(Ljava/lang/Runnable;)V

    move-object/from16 v2, p0

    .line 140
    invoke-direct/range {v2 .. v7}, Lcom/vkontakte/android/AudioMessagePlayerService;->play(Ljava/lang/String;IIIZ)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1

    .line 149
    .end local v3    # "url":Ljava/lang/String;
    .end local v4    # "oid":I
    .end local v5    # "did":I
    .end local v6    # "msgId":I
    .end local v7    # "pending":Z
    :pswitch_1
    sget-object v2, Lcom/vkontakte/android/AudioMessagePlayerService;->audioTrackPlayer:Landroid/media/AudioTrack;

    if-eqz v2, :cond_1

    .line 150
    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentOid:I

    move-object/from16 v0, p0

    iget v11, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentDid:I

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->lastPlayPcm:J

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentTotalPcmDuration:J

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->lastProgress:F

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentPending:Z

    move/from16 v17, v0

    move-object/from16 v9, p0

    invoke-direct/range {v9 .. v17}, Lcom/vkontakte/android/AudioMessagePlayerService;->writePreferences(IIJJFZ)V

    .line 152
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->cleanupPlayer()V

    .line 153
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->abandonAudioFocus()V

    goto/16 :goto_1

    .line 157
    :pswitch_2
    sget-object v2, Lcom/vkontakte/android/AudioMessagePlayerService;->audioTrackPlayer:Landroid/media/AudioTrack;

    if-eqz v2, :cond_6

    .line 158
    const-string/jumbo v2, "oid"

    const/4 v8, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 159
    .restart local v4    # "oid":I
    const-string/jumbo v2, "did"

    const/4 v8, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    .line 160
    .restart local v5    # "did":I
    if-nez v4, :cond_4

    if-eqz v5, :cond_5

    :cond_4
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentOid:I

    if-ne v4, v2, :cond_6

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentDid:I

    if-ne v5, v2, :cond_6

    .line 161
    :cond_5
    const/4 v10, 0x0

    const/4 v11, 0x0

    const-wide/16 v12, 0x0

    const-wide/16 v14, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object/from16 v9, p0

    invoke-direct/range {v9 .. v17}, Lcom/vkontakte/android/AudioMessagePlayerService;->writePreferences(IIJJFZ)V

    .line 162
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->cleanupPlayer()V

    .line 163
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->onComplete()V

    .line 164
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->abandonAudioFocus()V

    .line 167
    .end local v4    # "oid":I
    .end local v5    # "did":I
    :cond_6
    const/4 v2, 0x0

    sput-boolean v2, Lcom/vkontakte/android/AudioMessagePlayerService;->useFrontSpeaker:Z

    goto/16 :goto_1

    .line 170
    :pswitch_3
    const-string/jumbo v2, "oid"

    const/4 v8, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 171
    .restart local v4    # "oid":I
    const-string/jumbo v2, "did"

    const/4 v8, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    .line 172
    .restart local v5    # "did":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentOid:I

    if-ne v2, v4, :cond_1

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentDid:I

    if-ne v2, v5, :cond_1

    .line 173
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->sendBroadcastUpdate()V

    goto/16 :goto_1

    .line 178
    .end local v4    # "oid":I
    .end local v5    # "did":I
    :pswitch_4
    const-string/jumbo v2, "new_oid"

    const/4 v8, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v22

    .line 179
    .local v22, "newOid":I
    const-string/jumbo v2, "new_did"

    const/4 v8, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v21

    .line 180
    .local v21, "newDid":I
    const-string/jumbo v2, "oid"

    const/4 v8, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 181
    .restart local v4    # "oid":I
    const-string/jumbo v2, "did"

    const/4 v8, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    .line 182
    .restart local v5    # "did":I
    const-string/jumbo v2, "url"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 184
    .restart local v3    # "url":Ljava/lang/String;
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentOid:I

    if-ne v2, v4, :cond_8

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentDid:I

    if-ne v2, v5, :cond_8

    .line 185
    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->isPlaying()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 186
    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vkontakte/android/AudioMessagePlayerService;->newOid:I

    .line 187
    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vkontakte/android/AudioMessagePlayerService;->newDid:I

    .line 188
    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vkontakte/android/AudioMessagePlayerService;->currentOid:I

    .line 189
    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vkontakte/android/AudioMessagePlayerService;->currentDid:I

    .line 190
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->sendBroadcastUpdate()V

    goto/16 :goto_1

    .line 192
    :cond_7
    move/from16 v0, v22

    move/from16 v1, v21

    invoke-static {v3, v0, v1}, Lcom/vkontakte/android/AudioMessagePlayerService;->renameCacheFile(Ljava/lang/String;II)V

    goto/16 :goto_1

    .line 195
    :cond_8
    move/from16 v0, v22

    move/from16 v1, v21

    invoke-static {v3, v0, v1}, Lcom/vkontakte/android/AudioMessagePlayerService;->renameCacheFile(Ljava/lang/String;II)V

    goto/16 :goto_1

    .line 199
    .end local v3    # "url":Ljava/lang/String;
    .end local v4    # "oid":I
    .end local v5    # "did":I
    .end local v21    # "newDid":I
    .end local v22    # "newOid":I
    :pswitch_5
    const-string/jumbo v2, "front_speaker"

    const/4 v8, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v8}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    sput-boolean v2, Lcom/vkontakte/android/AudioMessagePlayerService;->useFrontSpeaker:Z

    .line 200
    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->isPlaying()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 201
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/AudioMessagePlayerService;->cleanupPlayer()V

    .line 202
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentOid:I

    move-object/from16 v0, p0

    iget v8, v0, Lcom/vkontakte/android/AudioMessagePlayerService;->currentDid:I

    invoke-static {v2, v8}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->getCacheFile(II)Ljava/io/File;

    move-result-object v19

    .line 203
    .local v19, "cacheFile":Ljava/io/File;
    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 204
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/vkontakte/android/AudioMessagePlayerService;->play(Ljava/io/File;)V

    goto/16 :goto_1

    .line 206
    :cond_9
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string/jumbo v9, "AudioMessagePlayerService"

    aput-object v9, v2, v8

    const/4 v8, 0x1

    const-string/jumbo v9, "File find failure during stream type changing"

    aput-object v9, v2, v8

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 211
    .end local v19    # "cacheFile":Ljava/io/File;
    :pswitch_6
    const-string/jumbo v2, "progress"

    const/4 v8, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v8}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v23

    .line 212
    .local v23, "progress":F
    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->isPlaying()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 213
    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-direct {v0, v1}, Lcom/vkontakte/android/AudioMessagePlayerService;->seekOpusPlayer(F)V

    goto/16 :goto_1

    .line 116
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method
