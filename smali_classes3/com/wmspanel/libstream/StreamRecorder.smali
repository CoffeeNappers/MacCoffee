.class Lcom/wmspanel/libstream/StreamRecorder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x12
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "StreamRecorder"


# instance fields
.field private mAudioTrackIndex:I

.field private mCurrentItem:Lcom/wmspanel/libstream/BufferItem;

.field private mListener:Lcom/wmspanel/libstream/Streamer$Listener;

.field private mLock:Ljava/lang/Object;

.field private mMessageIndex:J

.field private mMode:Lcom/wmspanel/libstream/Streamer$MODE;

.field private mMuxer:Landroid/media/MediaMuxer;

.field private mOutputFile:Ljava/io/File;

.field private mRecorderThread:Ljava/lang/Thread;

.field private mState:Lcom/wmspanel/libstream/Streamer$RECORD_STATE;

.field private mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

.field private mVideoTrackIndex:I


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;Ljava/io/File;Lcom/wmspanel/libstream/Streamer$MODE;)V
    .locals 3
    .param p1, "streamBuffer"    # Lcom/wmspanel/libstream/StreamBuffer;
    .param p2, "listener"    # Lcom/wmspanel/libstream/Streamer$Listener;
    .param p3, "file"    # Ljava/io/File;
    .param p4, "mode"    # Lcom/wmspanel/libstream/Streamer$MODE;

    .prologue
    const/4 v0, -0x1

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mAudioTrackIndex:I

    .line 26
    iput v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mVideoTrackIndex:I

    .line 33
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mLock:Ljava/lang/Object;

    .line 36
    sget-object v0, Lcom/wmspanel/libstream/Streamer$RECORD_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$RECORD_STATE;

    iput-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mState:Lcom/wmspanel/libstream/Streamer$RECORD_STATE;

    .line 39
    if-nez p1, :cond_0

    .line 40
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "StreamBuffer is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 42
    :cond_0
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamRecorder;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    .line 43
    iput-object p2, p0, Lcom/wmspanel/libstream/StreamRecorder;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    .line 44
    iput-object p4, p0, Lcom/wmspanel/libstream/StreamRecorder;->mMode:Lcom/wmspanel/libstream/Streamer$MODE;

    .line 45
    iput-object p3, p0, Lcom/wmspanel/libstream/StreamRecorder;->mOutputFile:Ljava/io/File;

    .line 46
    const-string/jumbo v0, "StreamRecorder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Mux to mp4: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder;->mOutputFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    return-void
.end method

.method static synthetic access$000(Lcom/wmspanel/libstream/StreamRecorder;)Landroid/media/MediaMuxer;
    .locals 1
    .param p0, "x0"    # Lcom/wmspanel/libstream/StreamRecorder;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mMuxer:Landroid/media/MediaMuxer;

    return-object v0
.end method

.method static synthetic access$100(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/Streamer$MODE;
    .locals 1
    .param p0, "x0"    # Lcom/wmspanel/libstream/StreamRecorder;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mMode:Lcom/wmspanel/libstream/Streamer$MODE;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/Streamer$Listener;
    .locals 1
    .param p0, "x0"    # Lcom/wmspanel/libstream/StreamRecorder;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    return-object v0
.end method

.method static synthetic access$200(Lcom/wmspanel/libstream/StreamRecorder;Lcom/wmspanel/libstream/Streamer$RECORD_STATE;)V
    .locals 0
    .param p0, "x0"    # Lcom/wmspanel/libstream/StreamRecorder;
    .param p1, "x1"    # Lcom/wmspanel/libstream/Streamer$RECORD_STATE;

    .prologue
    .line 15
    invoke-direct {p0, p1}, Lcom/wmspanel/libstream/StreamRecorder;->setRecordState(Lcom/wmspanel/libstream/Streamer$RECORD_STATE;)V

    return-void
.end method

.method static synthetic access$300(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/BufferItem;
    .locals 1
    .param p0, "x0"    # Lcom/wmspanel/libstream/StreamRecorder;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mCurrentItem:Lcom/wmspanel/libstream/BufferItem;

    return-object v0
.end method

.method static synthetic access$302(Lcom/wmspanel/libstream/StreamRecorder;Lcom/wmspanel/libstream/BufferItem;)Lcom/wmspanel/libstream/BufferItem;
    .locals 0
    .param p0, "x0"    # Lcom/wmspanel/libstream/StreamRecorder;
    .param p1, "x1"    # Lcom/wmspanel/libstream/BufferItem;

    .prologue
    .line 15
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamRecorder;->mCurrentItem:Lcom/wmspanel/libstream/BufferItem;

    return-object p1
.end method

.method static synthetic access$400(Lcom/wmspanel/libstream/StreamRecorder;)J
    .locals 2
    .param p0, "x0"    # Lcom/wmspanel/libstream/StreamRecorder;

    .prologue
    .line 15
    iget-wide v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mMessageIndex:J

    return-wide v0
.end method

.method static synthetic access$402(Lcom/wmspanel/libstream/StreamRecorder;J)J
    .locals 1
    .param p0, "x0"    # Lcom/wmspanel/libstream/StreamRecorder;
    .param p1, "x1"    # J

    .prologue
    .line 15
    iput-wide p1, p0, Lcom/wmspanel/libstream/StreamRecorder;->mMessageIndex:J

    return-wide p1
.end method

.method static synthetic access$500(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/StreamBuffer;
    .locals 1
    .param p0, "x0"    # Lcom/wmspanel/libstream/StreamRecorder;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    return-object v0
.end method

.method static synthetic access$600(Lcom/wmspanel/libstream/StreamRecorder;)I
    .locals 1
    .param p0, "x0"    # Lcom/wmspanel/libstream/StreamRecorder;

    .prologue
    .line 15
    iget v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mAudioTrackIndex:I

    return v0
.end method

.method static synthetic access$700(Lcom/wmspanel/libstream/StreamRecorder;)I
    .locals 1
    .param p0, "x0"    # Lcom/wmspanel/libstream/StreamRecorder;

    .prologue
    .line 15
    iget v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mVideoTrackIndex:I

    return v0
.end method

.method static synthetic access$800(Lcom/wmspanel/libstream/StreamRecorder;)V
    .locals 0
    .param p0, "x0"    # Lcom/wmspanel/libstream/StreamRecorder;

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/wmspanel/libstream/StreamRecorder;->stopMuxer()V

    return-void
.end method

.method static synthetic access$900(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/Streamer$RECORD_STATE;
    .locals 1
    .param p0, "x0"    # Lcom/wmspanel/libstream/StreamRecorder;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mState:Lcom/wmspanel/libstream/Streamer$RECORD_STATE;

    return-object v0
.end method

.method private setRecordState(Lcom/wmspanel/libstream/Streamer$RECORD_STATE;)V
    .locals 2
    .param p1, "state"    # Lcom/wmspanel/libstream/Streamer$RECORD_STATE;

    .prologue
    .line 219
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mState:Lcom/wmspanel/libstream/Streamer$RECORD_STATE;

    if-ne p1, v0, :cond_1

    .line 236
    :cond_0
    :goto_0
    return-void

    .line 222
    :cond_1
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamRecorder;->mState:Lcom/wmspanel/libstream/Streamer$RECORD_STATE;

    .line 223
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    if-eqz v0, :cond_0

    .line 226
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    invoke-interface {v0}, Lcom/wmspanel/libstream/Streamer$Listener;->getHandler()Landroid/os/Handler;

    move-result-object v0

    .line 227
    if-eqz v0, :cond_0

    .line 230
    new-instance v1, Lcom/wmspanel/libstream/StreamRecorder$2;

    invoke-direct {v1, p0}, Lcom/wmspanel/libstream/StreamRecorder$2;-><init>(Lcom/wmspanel/libstream/StreamRecorder;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method private startRecorderThread()V
    .locals 4

    .prologue
    const/4 v3, -0x1

    .line 121
    iget-object v1, p0, Lcom/wmspanel/libstream/StreamRecorder;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 122
    :try_start_0
    sget-object v0, Lcom/wmspanel/libstream/StreamRecorder$3;->dx:[I

    iget-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder;->mMode:Lcom/wmspanel/libstream/Streamer$MODE;

    invoke-virtual {v2}, Lcom/wmspanel/libstream/Streamer$MODE;->ordinal()I

    move-result v2

    aget v0, v0, v2

    packed-switch v0, :pswitch_data_0

    .line 136
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 138
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mRecorderThread:Ljava/lang/Thread;

    if-eqz v0, :cond_5

    .line 216
    :cond_1
    :goto_0
    return-void

    .line 124
    :pswitch_0
    :try_start_1
    iget v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mVideoTrackIndex:I

    if-eq v0, v3, :cond_2

    iget v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mAudioTrackIndex:I

    if-ne v0, v3, :cond_3

    .line 125
    :cond_2
    monitor-exit v1

    goto :goto_0

    .line 136
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 128
    :cond_3
    :pswitch_1
    :try_start_2
    iget v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mAudioTrackIndex:I

    if-ne v0, v3, :cond_4

    .line 129
    monitor-exit v1

    goto :goto_0

    .line 132
    :cond_4
    :pswitch_2
    iget v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mVideoTrackIndex:I

    if-ne v0, v3, :cond_0

    .line 133
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 142
    :cond_5
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mMuxer:Landroid/media/MediaMuxer;

    if-eqz v0, :cond_1

    .line 146
    new-instance v0, Lcom/wmspanel/libstream/StreamRecorder$1;

    invoke-direct {v0, p0}, Lcom/wmspanel/libstream/StreamRecorder$1;-><init>(Lcom/wmspanel/libstream/StreamRecorder;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mRecorderThread:Ljava/lang/Thread;

    .line 214
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mRecorderThread:Ljava/lang/Thread;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 215
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mRecorderThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0

    .line 122
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private stopMuxer()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    const/4 v3, -0x1

    const/4 v2, 0x0

    .line 93
    :try_start_0
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mMuxer:Landroid/media/MediaMuxer;

    if-eqz v0, :cond_0

    .line 95
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mMuxer:Landroid/media/MediaMuxer;

    invoke-virtual {v0}, Landroid/media/MediaMuxer;->stop()V

    .line 96
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mMuxer:Landroid/media/MediaMuxer;

    invoke-virtual {v0}, Landroid/media/MediaMuxer;->release()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 108
    :cond_0
    iput-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder;->mMuxer:Landroid/media/MediaMuxer;

    .line 109
    iput-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    .line 110
    iput v3, p0, Lcom/wmspanel/libstream/StreamRecorder;->mVideoTrackIndex:I

    .line 111
    iput v3, p0, Lcom/wmspanel/libstream/StreamRecorder;->mAudioTrackIndex:I

    .line 112
    iput-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder;->mOutputFile:Ljava/io/File;

    .line 113
    iput-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder;->mCurrentItem:Lcom/wmspanel/libstream/BufferItem;

    .line 114
    iput-wide v4, p0, Lcom/wmspanel/libstream/StreamRecorder;->mMessageIndex:J

    .line 115
    sget-object v0, Lcom/wmspanel/libstream/Streamer$RECORD_STATE;->STOPPED:Lcom/wmspanel/libstream/Streamer$RECORD_STATE;

    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/StreamRecorder;->setRecordState(Lcom/wmspanel/libstream/Streamer$RECORD_STATE;)V

    .line 117
    :goto_0
    return-void

    .line 98
    :catch_0
    move-exception v0

    .line 99
    :try_start_1
    iget-object v1, p0, Lcom/wmspanel/libstream/StreamRecorder;->mOutputFile:Ljava/io/File;

    if-eqz v1, :cond_1

    .line 100
    iget-object v1, p0, Lcom/wmspanel/libstream/StreamRecorder;->mOutputFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 106
    :cond_1
    const-string/jumbo v1, "StreamRecorder"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 108
    iput-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder;->mMuxer:Landroid/media/MediaMuxer;

    .line 109
    iput-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    .line 110
    iput v3, p0, Lcom/wmspanel/libstream/StreamRecorder;->mVideoTrackIndex:I

    .line 111
    iput v3, p0, Lcom/wmspanel/libstream/StreamRecorder;->mAudioTrackIndex:I

    .line 112
    iput-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder;->mOutputFile:Ljava/io/File;

    .line 113
    iput-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder;->mCurrentItem:Lcom/wmspanel/libstream/BufferItem;

    .line 114
    iput-wide v4, p0, Lcom/wmspanel/libstream/StreamRecorder;->mMessageIndex:J

    .line 115
    sget-object v0, Lcom/wmspanel/libstream/Streamer$RECORD_STATE;->STOPPED:Lcom/wmspanel/libstream/Streamer$RECORD_STATE;

    invoke-direct {p0, v0}, Lcom/wmspanel/libstream/StreamRecorder;->setRecordState(Lcom/wmspanel/libstream/Streamer$RECORD_STATE;)V

    goto :goto_0

    .line 108
    :catchall_0
    move-exception v0

    iput-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder;->mMuxer:Landroid/media/MediaMuxer;

    .line 109
    iput-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder;->mStreamBuffer:Lcom/wmspanel/libstream/StreamBuffer;

    .line 110
    iput v3, p0, Lcom/wmspanel/libstream/StreamRecorder;->mVideoTrackIndex:I

    .line 111
    iput v3, p0, Lcom/wmspanel/libstream/StreamRecorder;->mAudioTrackIndex:I

    .line 112
    iput-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder;->mOutputFile:Ljava/io/File;

    .line 113
    iput-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder;->mCurrentItem:Lcom/wmspanel/libstream/BufferItem;

    .line 114
    iput-wide v4, p0, Lcom/wmspanel/libstream/StreamRecorder;->mMessageIndex:J

    .line 115
    sget-object v1, Lcom/wmspanel/libstream/Streamer$RECORD_STATE;->STOPPED:Lcom/wmspanel/libstream/Streamer$RECORD_STATE;

    invoke-direct {p0, v1}, Lcom/wmspanel/libstream/StreamRecorder;->setRecordState(Lcom/wmspanel/libstream/Streamer$RECORD_STATE;)V

    throw v0
.end method


# virtual methods
.method addAudioTrack(Landroid/media/MediaFormat;)V
    .locals 3
    .param p1, "audioFormat"    # Landroid/media/MediaFormat;

    .prologue
    .line 61
    iget-object v1, p0, Lcom/wmspanel/libstream/StreamRecorder;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 62
    :try_start_0
    iget v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mAudioTrackIndex:I

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    .line 63
    monitor-exit v1

    .line 70
    :goto_0
    return-void

    .line 65
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mMuxer:Landroid/media/MediaMuxer;

    if-eqz v0, :cond_1

    .line 66
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mMuxer:Landroid/media/MediaMuxer;

    invoke-virtual {v0, p1}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    move-result v0

    iput v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mAudioTrackIndex:I

    .line 68
    :cond_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    invoke-direct {p0}, Lcom/wmspanel/libstream/StreamRecorder;->startRecorderThread()V

    goto :goto_0

    .line 68
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method addVideoTrack(Landroid/media/MediaFormat;)V
    .locals 3
    .param p1, "videoFormat"    # Landroid/media/MediaFormat;

    .prologue
    .line 73
    iget-object v1, p0, Lcom/wmspanel/libstream/StreamRecorder;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 74
    :try_start_0
    iget v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mVideoTrackIndex:I

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    .line 75
    monitor-exit v1

    .line 82
    :goto_0
    return-void

    .line 77
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mMuxer:Landroid/media/MediaMuxer;

    if-eqz v0, :cond_1

    .line 78
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mMuxer:Landroid/media/MediaMuxer;

    invoke-virtual {v0, p1}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    move-result v0

    iput v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mVideoTrackIndex:I

    .line 80
    :cond_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    invoke-direct {p0}, Lcom/wmspanel/libstream/StreamRecorder;->startRecorderThread()V

    goto :goto_0

    .line 80
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method start()Z
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 51
    :try_start_0
    new-instance v1, Landroid/media/MediaMuxer;

    iget-object v2, p0, Lcom/wmspanel/libstream/StreamRecorder;->mOutputFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V

    iput-object v1, p0, Lcom/wmspanel/libstream/StreamRecorder;->mMuxer:Landroid/media/MediaMuxer;

    .line 52
    sget-object v1, Lcom/wmspanel/libstream/Streamer$RECORD_STATE;->INITIALIZED:Lcom/wmspanel/libstream/Streamer$RECORD_STATE;

    invoke-direct {p0, v1}, Lcom/wmspanel/libstream/StreamRecorder;->setRecordState(Lcom/wmspanel/libstream/Streamer$RECORD_STATE;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    :goto_0
    iget-object v1, p0, Lcom/wmspanel/libstream/StreamRecorder;->mState:Lcom/wmspanel/libstream/Streamer$RECORD_STATE;

    sget-object v2, Lcom/wmspanel/libstream/Streamer$RECORD_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$RECORD_STATE;

    if-eq v1, v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    .line 53
    :catch_0
    move-exception v1

    .line 54
    const-string/jumbo v2, "StreamRecorder"

    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    sget-object v1, Lcom/wmspanel/libstream/Streamer$RECORD_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$RECORD_STATE;

    invoke-direct {p0, v1}, Lcom/wmspanel/libstream/StreamRecorder;->setRecordState(Lcom/wmspanel/libstream/Streamer$RECORD_STATE;)V

    goto :goto_0
.end method

.method stop()V
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mRecorderThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 86
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mRecorderThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 87
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder;->mRecorderThread:Ljava/lang/Thread;

    .line 89
    :cond_0
    return-void
.end method
