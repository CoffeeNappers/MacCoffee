.class public final Lcom/vkontakte/android/media/audio/AudioMessageUtils;
.super Ljava/lang/Object;
.source "AudioMessageUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/media/audio/AudioMessageUtils$FocusListener;,
        Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;,
        Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;
    }
.end annotation


# static fields
.field public static final ACTION_AUDIO_MESSAGE_CANCEL:Ljava/lang/String; = "com.vkontakte.android.AUDIO_MESSAGE_CANCEL"

.field public static final ACTION_AUDIO_MESSAGE_DONE:Ljava/lang/String; = "com.vkontakte.android.AUDIO_MESSAGE_DONE"

.field public static final ACTION_AUDIO_MESSAGE_ERROR:Ljava/lang/String; = "com.vkontakte.android.AUDIO_MESSAGE_ERROR"

.field public static final ACTION_AUDIO_MESSAGE_UPDATE:Ljava/lang/String; = "com.vkontakte.android.AUDIO_MESSAGE_UPDATE"

.field private static final LOG:Ljava/lang/String; = "AudioMessageUtils"

.field private static final MAX_RECORD_LENGTH:I = 0x493e0

.field private static final MIN_RECORD_LENGTH:I = 0x3e8

.field public static final NORMALIZED_MAX_VALUE:B = 0x1ft

.field private static final NOTIFY_UI_UPDATE_DELAY:I = 0x11

.field private static final SAMPLE_RATE_HZ:I = 0x3e80

.field public static final SILENCE_VALUE:D

.field private static final STOP_TYPE_CANCEL:I = 0x1

.field private static final STOP_TYPE_DEFAULT:I = 0x0

.field private static final STOP_TYPE_SEND:I = 0x2

.field private static final STOP_TYPE_WAVE:I = 0x3

.field private static volatile instance:Lcom/vkontakte/android/media/audio/AudioMessageUtils;


# instance fields
.field private audioRecorder:Landroid/media/AudioRecord;

.field private currentRecord:Ljava/io/File;

.field private currentSessionId:Ljava/lang/String;

.field private final fileBuffer:Ljava/nio/ByteBuffer;

.field private final fileEncodingQueue:Lcom/vkontakte/android/utils/DispatchQueue;

.field private final focusListener:Lcom/vkontakte/android/media/audio/AudioMessageUtils$FocusListener;

.field private final pendingRecords:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;",
            ">;"
        }
    .end annotation
.end field

.field private raisedRecording:Z

.field private recordBufferSize:I

.field private final recordBuffers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private recordDuration:J

.field private final recordQueue:Lcom/vkontakte/android/utils/DispatchQueue;

.field private recordSamples:[S

.field private final recording:Ljava/lang/Runnable;

.field private samplesCount:J

.field private final sensorUtils:Lcom/vkontakte/android/media/audio/SensorUtils;

.field private final startRecord:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 48
    const-wide/high16 v0, 0x4034000000000000L    # 20.0

    invoke-static {v0, v1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->amplitudeToDb(D)D

    move-result-wide v0

    sput-wide v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->SILENCE_VALUE:D

    return-void
.end method

.method private constructor <init>()V
    .locals 4

    .prologue
    const/16 v3, 0xa

    const/4 v2, 0x0

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Lcom/vkontakte/android/media/audio/SensorUtils;

    invoke-direct {v0}, Lcom/vkontakte/android/media/audio/SensorUtils;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->sensorUtils:Lcom/vkontakte/android/media/audio/SensorUtils;

    .line 52
    new-instance v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$FocusListener;

    invoke-direct {v0, p0, v2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils$FocusListener;-><init>(Lcom/vkontakte/android/media/audio/AudioMessageUtils;Lcom/vkontakte/android/media/audio/AudioMessageUtils$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->focusListener:Lcom/vkontakte/android/media/audio/AudioMessageUtils$FocusListener;

    .line 53
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->pendingRecords:Landroid/util/SparseArray;

    .line 54
    new-instance v0, Lcom/vkontakte/android/utils/DispatchQueue;

    const-string/jumbo v1, "fileEncodingQueue"

    invoke-direct {v0, v1}, Lcom/vkontakte/android/utils/DispatchQueue;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->fileEncodingQueue:Lcom/vkontakte/android/utils/DispatchQueue;

    .line 55
    new-instance v0, Lcom/vkontakte/android/utils/DispatchQueue;

    const-string/jumbo v1, "recordQueue"

    invoke-direct {v0, v1}, Lcom/vkontakte/android/utils/DispatchQueue;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recordQueue:Lcom/vkontakte/android/utils/DispatchQueue;

    .line 56
    const/16 v0, 0x780

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->fileBuffer:Ljava/nio/ByteBuffer;

    .line 57
    new-instance v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;

    invoke-direct {v0, p0, v2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;-><init>(Lcom/vkontakte/android/media/audio/AudioMessageUtils;Lcom/vkontakte/android/media/audio/AudioMessageUtils$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->startRecord:Ljava/lang/Runnable;

    .line 58
    new-instance v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;

    invoke-direct {v0, p0, v2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;-><init>(Lcom/vkontakte/android/media/audio/AudioMessageUtils;Lcom/vkontakte/android/media/audio/AudioMessageUtils$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recording:Ljava/lang/Runnable;

    .line 59
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recordBuffers:Ljava/util/List;

    .line 60
    const/16 v0, 0x400

    new-array v0, v0, [S

    iput-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recordSamples:[S

    .line 84
    const/16 v0, 0x3e80

    const/16 v1, 0x10

    const/4 v2, 0x2

    invoke-static {v0, v1, v2}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recordBufferSize:I

    .line 86
    iget v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recordBufferSize:I

    if-gtz v0, :cond_0

    .line 87
    const/16 v0, 0x500

    iput v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recordBufferSize:I

    .line 89
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recordQueue:Lcom/vkontakte/android/utils/DispatchQueue;

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/utils/DispatchQueue;->setPriority(I)V

    .line 90
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->fileEncodingQueue:Lcom/vkontakte/android/utils/DispatchQueue;

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/utils/DispatchQueue;->setPriority(I)V

    .line 91
    return-void
.end method

.method private abandonAudioFocus()V
    .locals 2

    .prologue
    .line 194
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/Utils;->getAudioManager(Landroid/content/Context;)Landroid/media/AudioManager;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->focusListener:Lcom/vkontakte/android/media/audio/AudioMessageUtils$FocusListener;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 195
    return-void
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recording:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Lcom/vkontakte/android/utils/DispatchQueue;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recordQueue:Lcom/vkontakte/android/utils/DispatchQueue;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->requestAudioFocus()V

    return-void
.end method

.method static synthetic access$1300()V
    .locals 0

    .prologue
    .line 32
    invoke-static {}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->vibrate()V

    return-void
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->abandonAudioFocus()V

    return-void
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recordBuffers:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)[S
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recordSamples:[S

    return-object v0
.end method

.method static synthetic access$1700(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->currentSessionId:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1800(D)D
    .locals 2
    .param p0, "x0"    # D

    .prologue
    .line 32
    invoke-static {p0, p1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->amplitudeToDb(D)D

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$1900(Lcom/vkontakte/android/media/audio/AudioMessageUtils;Ljava/lang/String;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Landroid/content/Intent;

    .prologue
    .line 32
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->sendBroadcast(Ljava/lang/String;Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$2000(Lcom/vkontakte/android/media/audio/AudioMessageUtils;IZ)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;
    .param p1, "x1"    # I
    .param p2, "x2"    # Z

    .prologue
    .line 32
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->stopRecordingInternal(IZ)V

    return-void
.end method

.method static synthetic access$2100(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Lcom/vkontakte/android/utils/DispatchQueue;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->fileEncodingQueue:Lcom/vkontakte/android/utils/DispatchQueue;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/io/File;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->currentRecord:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$302(Lcom/vkontakte/android/media/audio/AudioMessageUtils;Ljava/io/File;)Ljava/io/File;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;
    .param p1, "x1"    # Ljava/io/File;

    .prologue
    .line 32
    iput-object p1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->currentRecord:Ljava/io/File;

    return-object p1
.end method

.method static synthetic access$400(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->showErrorToast()V

    return-void
.end method

.method static synthetic access$500(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Landroid/media/AudioRecord;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->audioRecorder:Landroid/media/AudioRecord;

    return-object v0
.end method

.method static synthetic access$502(Lcom/vkontakte/android/media/audio/AudioMessageUtils;Landroid/media/AudioRecord;)Landroid/media/AudioRecord;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;
    .param p1, "x1"    # Landroid/media/AudioRecord;

    .prologue
    .line 32
    iput-object p1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->audioRecorder:Landroid/media/AudioRecord;

    return-object p1
.end method

.method static synthetic access$600(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .prologue
    .line 32
    iget v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recordBufferSize:I

    return v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)J
    .locals 2
    .param p0, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .prologue
    .line 32
    iget-wide v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->samplesCount:J

    return-wide v0
.end method

.method static synthetic access$702(Lcom/vkontakte/android/media/audio/AudioMessageUtils;J)J
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;
    .param p1, "x1"    # J

    .prologue
    .line 32
    iput-wide p1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->samplesCount:J

    return-wide p1
.end method

.method static synthetic access$800(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)J
    .locals 2
    .param p0, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .prologue
    .line 32
    iget-wide v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recordDuration:J

    return-wide v0
.end method

.method static synthetic access$802(Lcom/vkontakte/android/media/audio/AudioMessageUtils;J)J
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;
    .param p1, "x1"    # J

    .prologue
    .line 32
    iput-wide p1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recordDuration:J

    return-wide p1
.end method

.method static synthetic access$900(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/nio/ByteBuffer;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->fileBuffer:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method private static amplitudeToDb(D)D
    .locals 6
    .param p0, "amplitude"    # D

    .prologue
    .line 320
    const-wide/high16 v0, 0x4034000000000000L    # 20.0

    invoke-static {p0, p1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    const-wide v4, 0x40dfffc000000000L    # 32767.0

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->log10(D)D

    move-result-wide v2

    mul-double/2addr v0, v2

    return-wide v0
.end method

.method public static getInstance()Lcom/vkontakte/android/media/audio/AudioMessageUtils;
    .locals 4

    .prologue
    .line 71
    sget-object v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->instance:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .line 72
    .local v0, "localInstance":Lcom/vkontakte/android/media/audio/AudioMessageUtils;
    if-nez v0, :cond_1

    .line 73
    const-class v3, Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    monitor-enter v3

    .line 74
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->instance:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .line 75
    if-nez v0, :cond_0

    .line 76
    new-instance v1, Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-direct {v1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v0    # "localInstance":Lcom/vkontakte/android/media/audio/AudioMessageUtils;
    .local v1, "localInstance":Lcom/vkontakte/android/media/audio/AudioMessageUtils;
    :try_start_1
    sput-object v1, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->instance:Lcom/vkontakte/android/media/audio/AudioMessageUtils;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object v0, v1

    .line 78
    .end local v1    # "localInstance":Lcom/vkontakte/android/media/audio/AudioMessageUtils;
    .restart local v0    # "localInstance":Lcom/vkontakte/android/media/audio/AudioMessageUtils;
    :cond_0
    :try_start_2
    monitor-exit v3

    .line 80
    :cond_1
    return-object v0

    .line 78
    :catchall_0
    move-exception v2

    :goto_0
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .end local v0    # "localInstance":Lcom/vkontakte/android/media/audio/AudioMessageUtils;
    .restart local v1    # "localInstance":Lcom/vkontakte/android/media/audio/AudioMessageUtils;
    :catchall_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "localInstance":Lcom/vkontakte/android/media/audio/AudioMessageUtils;
    .restart local v0    # "localInstance":Lcom/vkontakte/android/media/audio/AudioMessageUtils;
    goto :goto_0
.end method

.method private requestAudioFocus()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 184
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/vkontakte/android/audio/utils/Utils;->getAudioManager(Landroid/content/Context;)Landroid/media/AudioManager;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->focusListener:Lcom/vkontakte/android/media/audio/AudioMessageUtils$FocusListener;

    const/4 v3, 0x3

    const/4 v4, 0x2

    .line 185
    invoke-virtual {v1, v2, v3, v4}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    move-result v0

    .line 186
    .local v0, "result":I
    if-ne v0, v5, :cond_0

    .line 187
    iget-object v1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->focusListener:Lcom/vkontakte/android/media/audio/AudioMessageUtils$FocusListener;

    invoke-virtual {v1, v5}, Lcom/vkontakte/android/media/audio/AudioMessageUtils$FocusListener;->onAudioFocusChange(I)V

    .line 191
    :goto_0
    return-void

    .line 189
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->focusListener:Lcom/vkontakte/android/media/audio/AudioMessageUtils$FocusListener;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils$FocusListener;->onAudioFocusChange(I)V

    goto :goto_0
.end method

.method public static resizeWaveform([BI)[B
    .locals 13
    .param p0, "source"    # [B
    .param p1, "targetLength"    # I

    .prologue
    const/high16 v12, 0x3f800000    # 1.0f

    .line 132
    if-eqz p0, :cond_0

    array-length v9, p0

    if-eqz v9, :cond_0

    array-length v9, p0

    if-ne v9, p1, :cond_2

    :cond_0
    move-object v1, p0

    .line 168
    :cond_1
    :goto_0
    return-object v1

    .line 134
    :cond_2
    array-length v9, p0

    if-ge v9, p1, :cond_3

    .line 135
    array-length v9, p0

    int-to-float v9, v9

    int-to-float v10, p1

    div-float v5, v9, v10

    .line 136
    .local v5, "step":F
    new-array v1, p1, [B

    .line 137
    .local v1, "dest":[B
    const/4 v4, 0x0

    .local v4, "index":I
    :goto_1
    if-ge v4, p1, :cond_1

    .line 138
    int-to-float v9, v4

    mul-float/2addr v9, v5

    float-to-int v9, v9

    aget-byte v9, p0, v9

    aput-byte v9, v1, v4

    .line 137
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 142
    .end local v1    # "dest":[B
    .end local v4    # "index":I
    .end local v5    # "step":F
    :cond_3
    array-length v9, p0

    int-to-float v9, v9

    int-to-float v10, p1

    div-float v5, v9, v10

    .line 143
    .restart local v5    # "step":F
    new-array v1, p1, [B

    .line 144
    .restart local v1    # "dest":[B
    const/4 v0, 0x0

    .line 145
    .local v0, "accum":F
    const/4 v8, 0x0

    .line 146
    .local v8, "weight":F
    const/4 v2, 0x0

    .line 148
    .local v2, "destIndex":I
    array-length v10, p0

    const/4 v9, 0x0

    move v3, v2

    .end local v2    # "destIndex":I
    .local v3, "destIndex":I
    :goto_2
    if-ge v9, v10, :cond_5

    aget-byte v6, p0, v9

    .line 149
    .local v6, "value":B
    add-float v11, v8, v12

    invoke-static {v11, v5}, Ljava/lang/Math;->min(FF)F

    move-result v11

    sub-float v7, v11, v8

    .line 150
    .local v7, "valueWeight":F
    int-to-float v11, v6

    mul-float/2addr v11, v7

    add-float/2addr v0, v11

    .line 151
    add-float/2addr v8, v7

    .line 153
    const v11, 0x3a83126f    # 0.001f

    sub-float v11, v5, v11

    cmpl-float v11, v8, v11

    if-ltz v11, :cond_6

    .line 154
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "destIndex":I
    .restart local v2    # "destIndex":I
    div-float v11, v0, v5

    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    move-result v11

    int-to-byte v11, v11

    aput-byte v11, v1, v3

    .line 155
    cmpg-float v11, v7, v12

    if-gez v11, :cond_4

    .line 156
    sub-float v8, v12, v7

    .line 157
    int-to-float v11, v6

    mul-float v0, v11, v8

    .line 148
    :goto_3
    add-int/lit8 v9, v9, 0x1

    move v3, v2

    .end local v2    # "destIndex":I
    .restart local v3    # "destIndex":I
    goto :goto_2

    .line 159
    .end local v3    # "destIndex":I
    .restart local v2    # "destIndex":I
    :cond_4
    const/4 v8, 0x0

    .line 160
    const/4 v0, 0x0

    goto :goto_3

    .line 165
    .end local v2    # "destIndex":I
    .end local v6    # "value":B
    .end local v7    # "valueWeight":F
    .restart local v3    # "destIndex":I
    :cond_5
    const/4 v9, 0x0

    cmpl-float v9, v0, v9

    if-lez v9, :cond_1

    if-ge v3, p1, :cond_1

    .line 166
    div-float v9, v0, v5

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    int-to-byte v9, v9

    aput-byte v9, v1, v3

    goto :goto_0

    .restart local v6    # "value":B
    .restart local v7    # "valueWeight":F
    :cond_6
    move v2, v3

    .end local v3    # "destIndex":I
    .restart local v2    # "destIndex":I
    goto :goto_3
.end method

.method private sendBroadcast(Ljava/lang/String;Landroid/content/Intent;)V
    .locals 3
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "extra"    # Landroid/content/Intent;

    .prologue
    .line 308
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 309
    .local v0, "intent":Landroid/content/Intent;
    if-eqz p2, :cond_0

    .line 310
    invoke-virtual {v0, p2}, Landroid/content/Intent;->putExtras(Landroid/content/Intent;)Landroid/content/Intent;

    .line 312
    :cond_0
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 313
    return-void
.end method

.method private showErrorToast()V
    .locals 3

    .prologue
    .line 316
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f0800ed

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 317
    return-void
.end method

.method private stopRecording(I)V
    .locals 2
    .param p1, "type"    # I

    .prologue
    .line 248
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->startRecord:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 249
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recordQueue:Lcom/vkontakte/android/utils/DispatchQueue;

    iget-object v1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->startRecord:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/utils/DispatchQueue;->cancelRunnable(Ljava/lang/Runnable;)V

    .line 251
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recordQueue:Lcom/vkontakte/android/utils/DispatchQueue;

    invoke-static {p0, p1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/media/audio/AudioMessageUtils;I)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/utils/DispatchQueue;->postRunnable(Ljava/lang/Runnable;)V

    .line 265
    return-void
.end method

.method private stopRecordingInternal(IZ)V
    .locals 12
    .param p1, "type"    # I
    .param p2, "error"    # Z

    .prologue
    const-wide/16 v8, 0x3e8

    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 268
    iget-object v3, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->fileEncodingQueue:Lcom/vkontakte/android/utils/DispatchQueue;

    new-instance v6, Lcom/vkontakte/android/media/audio/AudioMessageUtils$1;

    invoke-direct {v6, p0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils$1;-><init>(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)V

    invoke-virtual {v3, v6}, Lcom/vkontakte/android/utils/DispatchQueue;->postRunnable(Ljava/lang/Runnable;)V

    .line 275
    :try_start_0
    iget-object v3, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->audioRecorder:Landroid/media/AudioRecord;

    if-eqz v3, :cond_0

    .line 276
    iget-object v3, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->audioRecorder:Landroid/media/AudioRecord;

    invoke-virtual {v3}, Landroid/media/AudioRecord;->release()V

    .line 277
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->audioRecorder:Landroid/media/AudioRecord;

    .line 280
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->vibrate()V

    .line 281
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->resumeIfPausedBySystem()V

    .line 282
    iget-wide v6, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recordDuration:J

    cmp-long v3, v6, v8

    if-gez v3, :cond_2

    move v2, v4

    .line 283
    .local v2, "tooShort":Z
    :goto_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 284
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v3, "peerId"

    iget-object v6, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->currentSessionId:Ljava/lang/String;

    invoke-virtual {v1, v3, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 285
    if-nez p2, :cond_1

    iget-object v3, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->currentRecord:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v3, v6, v8

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->currentRecord:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_3

    .line 286
    :cond_1
    const-string/jumbo v3, "com.vkontakte.android.AUDIO_MESSAGE_ERROR"

    invoke-direct {p0, v3, v1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->sendBroadcast(Ljava/lang/String;Landroid/content/Intent;)V

    .line 287
    invoke-virtual {p0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->deleteCurrentRecord()V

    .line 288
    invoke-direct {p0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->showErrorToast()V

    .line 305
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "tooShort":Z
    :goto_1
    return-void

    :cond_2
    move v2, v5

    .line 282
    goto :goto_0

    .line 289
    .restart local v1    # "intent":Landroid/content/Intent;
    .restart local v2    # "tooShort":Z
    :cond_3
    if-nez v2, :cond_4

    if-ne p1, v4, :cond_5

    .line 290
    :cond_4
    const-string/jumbo v3, "file"

    iget-object v6, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->currentRecord:Ljava/io/File;

    invoke-virtual {v1, v3, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 291
    const-string/jumbo v3, "too_short"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 292
    const-string/jumbo v3, "com.vkontakte.android.AUDIO_MESSAGE_CANCEL"

    invoke-direct {p0, v3, v1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->sendBroadcast(Ljava/lang/String;Landroid/content/Intent;)V

    .line 293
    invoke-virtual {p0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->deleteCurrentRecord()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 302
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "tooShort":Z
    :catch_0
    move-exception v0

    .line 303
    .local v0, "e":Ljava/lang/Exception;
    new-array v3, v11, [Ljava/lang/Object;

    const-string/jumbo v6, "AudioMessageUtils"

    aput-object v6, v3, v5

    const-string/jumbo v5, "Audio record stop failure"

    aput-object v5, v3, v4

    aput-object v0, v3, v10

    invoke-static {v3}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    goto :goto_1

    .line 295
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "intent":Landroid/content/Intent;
    .restart local v2    # "tooShort":Z
    :cond_5
    :try_start_1
    const-string/jumbo v6, "show_waveform"

    if-eq p1, v11, :cond_6

    if-nez p1, :cond_7

    :cond_6
    move v3, v4

    :goto_2
    invoke-virtual {v1, v6, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 296
    const-string/jumbo v6, "send"

    if-ne p1, v10, :cond_8

    move v3, v4

    :goto_3
    invoke-virtual {v1, v6, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 297
    const-string/jumbo v3, "file"

    iget-object v6, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->currentRecord:Ljava/io/File;

    invoke-virtual {v1, v3, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 298
    const-string/jumbo v3, "duration"

    iget-wide v6, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recordDuration:J

    const-wide/16 v8, 0x3e8

    div-long/2addr v6, v8

    long-to-int v6, v6

    invoke-virtual {v1, v3, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 299
    const-string/jumbo v3, "waveform"

    iget-object v6, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recordSamples:[S

    iget-object v7, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recordSamples:[S

    array-length v7, v7

    invoke-static {v6, v7}, Lcom/vk/medianative/MediaNative;->nativeAudioGetWaveform([SI)[B

    move-result-object v6

    invoke-virtual {v1, v3, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 300
    const-string/jumbo v3, "com.vkontakte.android.AUDIO_MESSAGE_DONE"

    invoke-direct {p0, v3, v1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->sendBroadcast(Ljava/lang/String;Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :cond_7
    move v3, v5

    .line 295
    goto :goto_2

    :cond_8
    move v3, v5

    .line 296
    goto :goto_3
.end method

.method private static vibrate()V
    .locals 5

    .prologue
    .line 325
    :try_start_0
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v3, "vibrator"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Vibrator;

    .line 326
    .local v1, "v":Landroid/os/Vibrator;
    const-wide/16 v2, 0x32

    invoke-virtual {v1, v2, v3}, Landroid/os/Vibrator;->vibrate(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 330
    :goto_0
    return-void

    .line 327
    :catch_0
    move-exception v0

    .line 328
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string/jumbo v4, "AudioMessageUtils"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string/jumbo v4, "Vibrator error "

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object v0, v2, v3

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method public addPendingRecord(ILcom/vkontakte/android/attachments/PendingAudioMessageAttachment;)V
    .locals 1
    .param p1, "peerId"    # I
    .param p2, "attachment"    # Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;

    .prologue
    .line 98
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->pendingRecords:Landroid/util/SparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 99
    return-void
.end method

.method public cancelRecording()V
    .locals 1

    .prologue
    .line 206
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->stopRecording(I)V

    .line 207
    return-void
.end method

.method public deleteCurrentRecord()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 222
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->currentRecord:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 223
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->currentRecord:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 224
    iput-object v2, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->currentRecord:Ljava/io/File;

    .line 226
    :cond_0
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recordDuration:J

    .line 227
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->raisedRecording:Z

    .line 228
    iput-object v2, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->currentSessionId:Ljava/lang/String;

    .line 229
    return-void
.end method

.method public getPendingRecord(I)Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;
    .locals 1
    .param p1, "peerId"    # I

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->pendingRecords:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;

    return-object v0
.end method

.method public getTotalPcmDuration()J
    .locals 2

    .prologue
    .line 236
    invoke-static {}, Lcom/vk/medianative/MediaNative;->nativeAudioGetTotalPcmDuration()J

    move-result-wide v0

    return-wide v0
.end method

.method public isHasRecord()Z
    .locals 1

    .prologue
    .line 214
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->currentRecord:Ljava/io/File;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isRaisedRecording()Z
    .locals 1

    .prologue
    .line 218
    iget-boolean v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->raisedRecording:Z

    return v0
.end method

.method public isRecording()Z
    .locals 1

    .prologue
    .line 210
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->audioRecorder:Landroid/media/AudioRecord;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$stopRecording$0(I)V
    .locals 7
    .param p1, "type"    # I

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 252
    iget-object v1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->audioRecorder:Landroid/media/AudioRecord;

    if-nez v1, :cond_0

    .line 264
    :goto_0
    return-void

    .line 256
    :cond_0
    const/4 v1, 0x2

    :try_start_0
    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string/jumbo v3, "AudioMessageUtils"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string/jumbo v3, "Audio record stop"

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 257
    iget-object v1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->audioRecorder:Landroid/media/AudioRecord;

    invoke-virtual {v1}, Landroid/media/AudioRecord;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 262
    :goto_1
    invoke-direct {p0, p1, v4}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->stopRecordingInternal(IZ)V

    .line 263
    invoke-direct {p0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->abandonAudioFocus()V

    goto :goto_0

    .line 258
    :catch_0
    move-exception v0

    .line 259
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const-string/jumbo v2, "AudioMessageUtils"

    aput-object v2, v1, v4

    const-string/jumbo v2, "Audio record stop failure"

    aput-object v2, v1, v5

    aput-object v0, v1, v6

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 260
    invoke-virtual {p0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->deleteCurrentRecord()V

    goto :goto_1
.end method

.method public openOpusFile(Ljava/lang/String;)I
    .locals 1
    .param p1, "absolutePath"    # Ljava/lang/String;

    .prologue
    .line 232
    invoke-static {p1}, Lcom/vk/medianative/MediaNative;->nativeAudioOpenOpusFile(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public readOpusFile(Ljava/nio/ByteBuffer;I[I)V
    .locals 0
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "playerBufferSize"    # I
    .param p3, "readArgs"    # [I

    .prologue
    .line 240
    invoke-static {p1, p2, p3}, Lcom/vk/medianative/MediaNative;->nativeAudioReadOpusFile(Ljava/nio/ByteBuffer;I[I)V

    .line 241
    return-void
.end method

.method public removePendingRecord(I)V
    .locals 1
    .param p1, "peerId"    # I

    .prologue
    .line 102
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->pendingRecords:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 103
    return-void
.end method

.method public seekOpusFile(F)V
    .locals 0
    .param p1, "progress"    # F

    .prologue
    .line 244
    invoke-static {p1}, Lcom/vk/medianative/MediaNative;->nativeAudioSeekOpusFile(F)I

    .line 245
    return-void
.end method

.method public setAllowStartRecord(Z)V
    .locals 1
    .param p1, "value"    # Z

    .prologue
    .line 128
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->sensorUtils:Lcom/vkontakte/android/media/audio/SensorUtils;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/media/audio/SensorUtils;->setAllowStartRecord(Z)V

    .line 129
    return-void
.end method

.method public setInputFieldHasText(Z)V
    .locals 1
    .param p1, "value"    # Z

    .prologue
    .line 124
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->sensorUtils:Lcom/vkontakte/android/media/audio/SensorUtils;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/media/audio/SensorUtils;->setInputFieldHasText(Z)V

    .line 125
    return-void
.end method

.method public startRaiseToEarSensors(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 4
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "sessionId"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 110
    invoke-static {p1}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 111
    new-array v0, v1, [Ljava/lang/Object;

    const-string/jumbo v1, "AudioMessageUtils"

    aput-object v1, v0, v2

    const-string/jumbo v1, "Rise to record is not supported on the tablet devices"

    aput-object v1, v0, v3

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 117
    :goto_0
    return-void

    .line 112
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isRiseToRecordAvailable()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 113
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->sensorUtils:Lcom/vkontakte/android/media/audio/SensorUtils;

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/media/audio/SensorUtils;->startSensors(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_0

    .line 115
    :cond_1
    new-array v0, v1, [Ljava/lang/Object;

    const-string/jumbo v1, "AudioMessageUtils"

    aput-object v1, v0, v2

    const-string/jumbo v1, "Rise to record is not supported on this device"

    aput-object v1, v0, v3

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public startRecording(Ljava/lang/String;Z)V
    .locals 2
    .param p1, "sessionId"    # Ljava/lang/String;
    .param p2, "raisedRecording"    # Z

    .prologue
    .line 173
    iput-object p1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->currentSessionId:Ljava/lang/String;

    .line 174
    iput-boolean p2, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->raisedRecording:Z

    .line 175
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->recordQueue:Lcom/vkontakte/android/utils/DispatchQueue;

    iget-object v1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->startRecord:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/utils/DispatchQueue;->postRunnable(Ljava/lang/Runnable;)V

    .line 176
    invoke-direct {p0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->abandonAudioFocus()V

    .line 177
    return-void
.end method

.method public startRecordingIfFromSpeaker()V
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->sensorUtils:Lcom/vkontakte/android/media/audio/SensorUtils;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/audio/SensorUtils;->startRecordingIfFromSpeaker()V

    .line 107
    return-void
.end method

.method public stopAndSendRecord()V
    .locals 1

    .prologue
    .line 198
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->stopRecording(I)V

    .line 199
    return-void
.end method

.method public stopAndShowWaveform()V
    .locals 1

    .prologue
    .line 202
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->stopRecording(I)V

    .line 203
    return-void
.end method

.method public stopRaiseToEarSensors(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 120
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->sensorUtils:Lcom/vkontakte/android/media/audio/SensorUtils;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/media/audio/SensorUtils;->stopSensors(Landroid/app/Activity;)V

    .line 121
    return-void
.end method

.method public stopRecording()V
    .locals 1

    .prologue
    .line 180
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->stopRecording(I)V

    .line 181
    return-void
.end method
