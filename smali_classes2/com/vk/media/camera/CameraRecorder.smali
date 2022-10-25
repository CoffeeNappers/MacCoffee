.class public abstract Lcom/vk/media/camera/CameraRecorder;
.super Ljava/lang/Object;
.source "CameraRecorder.java"

# interfaces
.implements Lcom/vk/media/camera/CameraUtils$Recorder;
.implements Landroid/media/MediaRecorder$OnErrorListener;
.implements Landroid/media/MediaRecorder$OnInfoListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/media/camera/CameraRecorder$Recorder;,
        Lcom/vk/media/camera/CameraRecorder$State;
    }
.end annotation


# static fields
.field protected static final TAG:Ljava/lang/String;


# instance fields
.field protected mContext:Landroid/content/Context;

.field private mEncoderSurface:Lcom/vk/media/utils/grafika/WindowSurface;

.field protected mFile:Ljava/io/File;

.field protected mLastPresentationTime:J

.field protected mMaxRecordingLengthMs:I

.field protected mOnErrorListener:Landroid/media/MediaRecorder$OnErrorListener;

.field protected mOnInfoListener:Landroid/media/MediaRecorder$OnInfoListener;

.field protected mOrientationHint:I

.field protected mProfile:Landroid/media/CamcorderProfile;

.field private mRecordFrameCallback:Lcom/vk/media/camera/CameraUtils$Recorder$OnRecordFrame;

.field protected mRecording:Z

.field protected mStartPresentationTime:J

.field protected mState:Lcom/vk/media/camera/CameraRecorder$State;

.field protected mSurface:Landroid/view/Surface;

.field private mUseMediaRecorder:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const-class v0, Lcom/vk/media/camera/CameraRecorder;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vk/media/camera/CameraRecorder;->TAG:Ljava/lang/String;

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const-wide/16 v2, -0x1

    const/4 v1, 0x0

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-boolean v1, p0, Lcom/vk/media/camera/CameraRecorder;->mRecording:Z

    .line 33
    sget-object v0, Lcom/vk/media/camera/CameraRecorder$State;->IDLE:Lcom/vk/media/camera/CameraRecorder$State;

    iput-object v0, p0, Lcom/vk/media/camera/CameraRecorder;->mState:Lcom/vk/media/camera/CameraRecorder$State;

    .line 36
    iput v1, p0, Lcom/vk/media/camera/CameraRecorder;->mOrientationHint:I

    .line 37
    const v0, 0x7fffffff

    iput v0, p0, Lcom/vk/media/camera/CameraRecorder;->mMaxRecordingLengthMs:I

    .line 38
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/media/camera/CameraRecorder;->mSurface:Landroid/view/Surface;

    .line 40
    iput-wide v2, p0, Lcom/vk/media/camera/CameraRecorder;->mStartPresentationTime:J

    .line 41
    iput-wide v2, p0, Lcom/vk/media/camera/CameraRecorder;->mLastPresentationTime:J

    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/media/camera/CameraRecorder;->mUseMediaRecorder:Z

    .line 66
    iput-object p1, p0, Lcom/vk/media/camera/CameraRecorder;->mContext:Landroid/content/Context;

    .line 67
    return-void
.end method

.method public static create(Landroid/content/Context;Lcom/vk/media/camera/CameraUtils$Recorder$OnRecordFrame;Z)Lcom/vk/media/camera/CameraRecorder;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "callback"    # Lcom/vk/media/camera/CameraUtils$Recorder$OnRecordFrame;
    .param p2, "useMediaRecorder"    # Z

    .prologue
    .line 54
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_0

    if-nez p2, :cond_1

    .line 55
    :cond_0
    new-instance v0, Lcom/vk/media/streamer/StreamRecorder;

    invoke-direct {v0, p0}, Lcom/vk/media/streamer/StreamRecorder;-><init>(Landroid/content/Context;)V

    .line 56
    .local v0, "recorder":Lcom/vk/media/camera/CameraRecorder;
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/vk/media/camera/CameraRecorder;->mUseMediaRecorder:Z

    .line 60
    :goto_0
    iput-object p1, v0, Lcom/vk/media/camera/CameraRecorder;->mRecordFrameCallback:Lcom/vk/media/camera/CameraUtils$Recorder$OnRecordFrame;

    .line 61
    sget-object v1, Lcom/vk/media/camera/CameraRecorder;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "create recorder system: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, v0, Lcom/vk/media/camera/CameraRecorder;->mUseMediaRecorder:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    return-object v0

    .line 58
    .end local v0    # "recorder":Lcom/vk/media/camera/CameraRecorder;
    :cond_1
    new-instance v0, Lcom/vk/media/camera/CameraRecorder$Recorder;

    invoke-direct {v0, p0}, Lcom/vk/media/camera/CameraRecorder$Recorder;-><init>(Landroid/content/Context;)V

    .restart local v0    # "recorder":Lcom/vk/media/camera/CameraRecorder;
    goto :goto_0
.end method


# virtual methods
.method public createSurface(Lcom/vk/media/utils/grafika/EglCore;)V
    .locals 4
    .param p1, "core"    # Lcom/vk/media/utils/grafika/EglCore;

    .prologue
    .line 184
    iget-object v1, p0, Lcom/vk/media/camera/CameraRecorder;->mEncoderSurface:Lcom/vk/media/utils/grafika/WindowSurface;

    if-nez v1, :cond_0

    if-nez p1, :cond_1

    .line 202
    :cond_0
    :goto_0
    return-void

    .line 188
    :cond_1
    iget-object v1, p0, Lcom/vk/media/camera/CameraRecorder;->mState:Lcom/vk/media/camera/CameraRecorder$State;

    sget-object v2, Lcom/vk/media/camera/CameraRecorder$State;->PREPARING:Lcom/vk/media/camera/CameraRecorder$State;

    if-ne v1, v2, :cond_2

    invoke-virtual {p0}, Lcom/vk/media/camera/CameraRecorder;->useExternalRecorder()Z

    move-result v1

    if-nez v1, :cond_3

    :cond_2
    iget-object v1, p0, Lcom/vk/media/camera/CameraRecorder;->mState:Lcom/vk/media/camera/CameraRecorder$State;

    sget-object v2, Lcom/vk/media/camera/CameraRecorder$State;->PREPARED:Lcom/vk/media/camera/CameraRecorder$State;

    if-ne v1, v2, :cond_0

    .line 189
    :cond_3
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraRecorder;->getSurface()Landroid/view/Surface;

    move-result-object v0

    .line 190
    .local v0, "surface":Landroid/view/Surface;
    if-eqz v0, :cond_0

    .line 191
    sget-object v1, Lcom/vk/media/camera/CameraRecorder;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "create input surface "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    new-instance v1, Lcom/vk/media/utils/grafika/WindowSurface;

    const/4 v2, 0x1

    invoke-direct {v1, p1, v0, v2}, Lcom/vk/media/utils/grafika/WindowSurface;-><init>(Lcom/vk/media/utils/grafika/EglCore;Landroid/view/Surface;Z)V

    iput-object v1, p0, Lcom/vk/media/camera/CameraRecorder;->mEncoderSurface:Lcom/vk/media/utils/grafika/WindowSurface;

    .line 193
    iget-object v1, p0, Lcom/vk/media/camera/CameraRecorder;->mEncoderSurface:Lcom/vk/media/utils/grafika/WindowSurface;

    invoke-virtual {v1}, Lcom/vk/media/utils/grafika/WindowSurface;->makeCurrent()V

    .line 195
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraRecorder;->useExternalRecorder()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 196
    sget-object v1, Lcom/vk/media/camera/CameraRecorder;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "drain first video frame on external recorder!"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    iget-object v1, p0, Lcom/vk/media/camera/CameraRecorder;->mEncoderSurface:Lcom/vk/media/utils/grafika/WindowSurface;

    const-wide/16 v2, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/vk/media/utils/grafika/WindowSurface;->setPresentationTime(J)V

    .line 198
    iget-object v1, p0, Lcom/vk/media/camera/CameraRecorder;->mEncoderSurface:Lcom/vk/media/utils/grafika/WindowSurface;

    invoke-virtual {v1}, Lcom/vk/media/utils/grafika/WindowSurface;->swapBuffers()Z

    goto :goto_0
.end method

.method public drainEncoder()V
    .locals 0

    .prologue
    .line 160
    return-void
.end method

.method public getSurface()Landroid/view/Surface;
    .locals 1

    .prologue
    .line 176
    const/4 v0, 0x0

    return-object v0
.end method

.method public isPrepared()Z
    .locals 2

    .prologue
    .line 180
    iget-boolean v0, p0, Lcom/vk/media/camera/CameraRecorder;->mRecording:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vk/media/camera/CameraRecorder;->mState:Lcom/vk/media/camera/CameraRecorder$State;

    sget-object v1, Lcom/vk/media/camera/CameraRecorder$State;->PREPARED:Lcom/vk/media/camera/CameraRecorder$State;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/vk/media/camera/CameraRecorder;->mState:Lcom/vk/media/camera/CameraRecorder$State;

    sget-object v1, Lcom/vk/media/camera/CameraRecorder$State;->RECORDING:Lcom/vk/media/camera/CameraRecorder$State;

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isRecording()Z
    .locals 1

    .prologue
    .line 101
    iget-boolean v0, p0, Lcom/vk/media/camera/CameraRecorder;->mRecording:Z

    return v0
.end method

.method protected notifyError(IZ)V
    .locals 5
    .param p1, "error"    # I
    .param p2, "video"    # Z

    .prologue
    const/4 v2, 0x1

    .line 205
    iget-object v1, p0, Lcom/vk/media/camera/CameraRecorder;->mOnErrorListener:Landroid/media/MediaRecorder$OnErrorListener;

    if-eqz v1, :cond_0

    .line 206
    iget-object v3, p0, Lcom/vk/media/camera/CameraRecorder;->mOnErrorListener:Landroid/media/MediaRecorder$OnErrorListener;

    const/4 v4, 0x0

    if-eqz p2, :cond_1

    const/4 v1, 0x2

    :goto_0
    invoke-interface {v3, v4, p1, v1}, Landroid/media/MediaRecorder$OnErrorListener;->onError(Landroid/media/MediaRecorder;II)V

    .line 209
    :cond_0
    new-instance v0, Lcom/vk/analytics/AnalyticsEvent$MediaRecorderEvent;

    const/16 v1, 0x3e9

    if-ne p1, v1, :cond_2

    :goto_1
    invoke-direct {v0, v2, p2}, Lcom/vk/analytics/AnalyticsEvent$MediaRecorderEvent;-><init>(ZZ)V

    .line 210
    .local v0, "e":Lcom/vk/analytics/AnalyticsEvent;
    invoke-static {v0}, Lcom/vk/analytics/Analytics;->log(Lcom/vk/analytics/AnalyticsEvent;)V

    .line 211
    return-void

    .end local v0    # "e":Lcom/vk/analytics/AnalyticsEvent;
    :cond_1
    move v1, v2

    .line 206
    goto :goto_0

    .line 209
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public onError(Landroid/media/MediaRecorder;II)V
    .locals 3
    .param p1, "mr"    # Landroid/media/MediaRecorder;
    .param p2, "what"    # I
    .param p3, "extra"    # I

    .prologue
    .line 119
    sget-object v0, Lcom/vk/media/camera/CameraRecorder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onError: what="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", extra="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraRecorder;->release()V

    .line 121
    const/16 v0, 0x3e8

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/vk/media/camera/CameraRecorder;->notifyError(IZ)V

    .line 122
    return-void
.end method

.method public onInfo(Landroid/media/MediaRecorder;II)V
    .locals 3
    .param p1, "mr"    # Landroid/media/MediaRecorder;
    .param p2, "what"    # I
    .param p3, "extra"    # I

    .prologue
    .line 126
    sget-object v0, Lcom/vk/media/camera/CameraRecorder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onInfo: what="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", extra="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    iget-object v0, p0, Lcom/vk/media/camera/CameraRecorder;->mOnInfoListener:Landroid/media/MediaRecorder$OnInfoListener;

    if-eqz v0, :cond_0

    .line 128
    iget-object v0, p0, Lcom/vk/media/camera/CameraRecorder;->mOnInfoListener:Landroid/media/MediaRecorder$OnInfoListener;

    invoke-interface {v0, p1, p2, p3}, Landroid/media/MediaRecorder$OnInfoListener;->onInfo(Landroid/media/MediaRecorder;II)V

    .line 130
    :cond_0
    return-void
.end method

.method public record(Lcom/vk/media/camera/CameraUtils$Frame;Lcom/vk/media/utils/grafika/EglCore;II)V
    .locals 6
    .param p1, "frame"    # Lcom/vk/media/camera/CameraUtils$Frame;
    .param p2, "core"    # Lcom/vk/media/utils/grafika/EglCore;
    .param p3, "viewWidth"    # I
    .param p4, "viewHeight"    # I

    .prologue
    .line 133
    monitor-enter p0

    .line 134
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/vk/media/camera/CameraRecorder;->createSurface(Lcom/vk/media/utils/grafika/EglCore;)V

    .line 136
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder;->mEncoderSurface:Lcom/vk/media/utils/grafika/WindowSurface;

    if-eqz v2, :cond_1

    iget-boolean v2, p0, Lcom/vk/media/camera/CameraRecorder;->mRecording:Z

    if-eqz v2, :cond_1

    .line 137
    if-eqz p1, :cond_2

    .line 138
    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {p1}, Lcom/vk/media/camera/CameraUtils$Frame;->getWidth()I

    move-result v4

    invoke-virtual {p1}, Lcom/vk/media/camera/CameraUtils$Frame;->getHeight()I

    move-result v5

    invoke-static {v2, v3, v4, v5}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 143
    :goto_0
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder;->mEncoderSurface:Lcom/vk/media/utils/grafika/WindowSurface;

    invoke-virtual {v2}, Lcom/vk/media/utils/grafika/WindowSurface;->makeCurrent()V

    .line 144
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraRecorder;->drainEncoder()V

    .line 145
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraRecorder;->isPrepared()Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder;->mRecordFrameCallback:Lcom/vk/media/camera/CameraUtils$Recorder$OnRecordFrame;

    invoke-interface {v2, p1}, Lcom/vk/media/camera/CameraUtils$Recorder$OnRecordFrame;->onRecord(Lcom/vk/media/camera/CameraUtils$Frame;)J

    move-result-wide v0

    .line 147
    .local v0, "timestamp":J
    :goto_1
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x18

    if-le v2, v3, :cond_0

    .line 149
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 152
    :cond_0
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder;->mEncoderSurface:Lcom/vk/media/utils/grafika/WindowSurface;

    invoke-virtual {v2, v0, v1}, Lcom/vk/media/utils/grafika/WindowSurface;->setPresentationTime(J)V

    .line 153
    iget-object v2, p0, Lcom/vk/media/camera/CameraRecorder;->mEncoderSurface:Lcom/vk/media/utils/grafika/WindowSurface;

    invoke-virtual {v2}, Lcom/vk/media/utils/grafika/WindowSurface;->swapBuffers()Z

    .line 155
    .end local v0    # "timestamp":J
    :cond_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lcom/vk/media/camera/CameraRecorder;->setPresentationTime(J)Z

    .line 156
    monitor-exit p0

    .line 157
    return-void

    .line 140
    :cond_2
    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v2, v3, p3, p4}, Landroid/opengl/GLES20;->glViewport(IIII)V

    goto :goto_0

    .line 156
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 145
    :cond_3
    const-wide/16 v0, 0x0

    goto :goto_1
.end method

.method public release()V
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lcom/vk/media/camera/CameraRecorder;->mEncoderSurface:Lcom/vk/media/utils/grafika/WindowSurface;

    if-eqz v0, :cond_0

    .line 112
    iget-object v0, p0, Lcom/vk/media/camera/CameraRecorder;->mEncoderSurface:Lcom/vk/media/utils/grafika/WindowSurface;

    invoke-virtual {v0}, Lcom/vk/media/utils/grafika/WindowSurface;->release()V

    .line 113
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/media/camera/CameraRecorder;->mEncoderSurface:Lcom/vk/media/utils/grafika/WindowSurface;

    .line 115
    :cond_0
    return-void
.end method

.method public setMaxDuration(I)V
    .locals 0
    .param p1, "maxRecordingLengthMs"    # I

    .prologue
    .line 81
    iput p1, p0, Lcom/vk/media/camera/CameraRecorder;->mMaxRecordingLengthMs:I

    .line 82
    return-void
.end method

.method public setOnErrorListener(Landroid/media/MediaRecorder$OnErrorListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/media/MediaRecorder$OnErrorListener;

    .prologue
    .line 91
    iput-object p1, p0, Lcom/vk/media/camera/CameraRecorder;->mOnErrorListener:Landroid/media/MediaRecorder$OnErrorListener;

    .line 92
    return-void
.end method

.method public setOnInfoListener(Landroid/media/MediaRecorder$OnInfoListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/media/MediaRecorder$OnInfoListener;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/vk/media/camera/CameraRecorder;->mOnInfoListener:Landroid/media/MediaRecorder$OnInfoListener;

    .line 87
    return-void
.end method

.method public setOrientationHint(I)V
    .locals 0
    .param p1, "orientationHint"    # I

    .prologue
    .line 76
    iput p1, p0, Lcom/vk/media/camera/CameraRecorder;->mOrientationHint:I

    .line 77
    return-void
.end method

.method public setOutputFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/vk/media/camera/CameraRecorder;->mFile:Ljava/io/File;

    .line 107
    return-void
.end method

.method public setPresentationTime(J)Z
    .locals 9
    .param p1, "timestamp"    # J

    .prologue
    .line 163
    iput-wide p1, p0, Lcom/vk/media/camera/CameraRecorder;->mLastPresentationTime:J

    .line 164
    iget v4, p0, Lcom/vk/media/camera/CameraRecorder;->mMaxRecordingLengthMs:I

    const v5, 0x7fffffff

    if-eq v4, v5, :cond_0

    iget-wide v4, p0, Lcom/vk/media/camera/CameraRecorder;->mStartPresentationTime:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-lez v4, :cond_0

    .line 165
    iget-wide v4, p0, Lcom/vk/media/camera/CameraRecorder;->mLastPresentationTime:J

    iget-wide v6, p0, Lcom/vk/media/camera/CameraRecorder;->mStartPresentationTime:J

    sub-long v2, v4, v6

    .line 166
    .local v2, "positionUs":J
    iget v4, p0, Lcom/vk/media/camera/CameraRecorder;->mMaxRecordingLengthMs:I

    int-to-long v4, v4

    const-wide/32 v6, 0xf4240

    mul-long v0, v4, v6

    .line 167
    .local v0, "durationUs":J
    cmp-long v4, v2, v0

    if-ltz v4, :cond_0

    .line 168
    sget-object v4, Lcom/vk/media/camera/CameraRecorder;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "recording stop "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " limit: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "(us)"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    const/4 v4, 0x0

    .line 172
    .end local v0    # "durationUs":J
    .end local v2    # "positionUs":J
    :goto_0
    return v4

    :cond_0
    const/4 v4, 0x1

    goto :goto_0
.end method

.method public setProfile(Landroid/media/CamcorderProfile;)V
    .locals 0
    .param p1, "profile"    # Landroid/media/CamcorderProfile;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/vk/media/camera/CameraRecorder;->mProfile:Landroid/media/CamcorderProfile;

    .line 72
    return-void
.end method

.method public stop()V
    .locals 2

    .prologue
    .line 96
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/vk/media/camera/CameraRecorder;->mLastPresentationTime:J

    iput-wide v0, p0, Lcom/vk/media/camera/CameraRecorder;->mStartPresentationTime:J

    .line 97
    return-void
.end method

.method public useExternalRecorder()Z
    .locals 1

    .prologue
    .line 48
    iget-boolean v0, p0, Lcom/vk/media/camera/CameraRecorder;->mUseMediaRecorder:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
