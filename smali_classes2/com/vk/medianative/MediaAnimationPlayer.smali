.class public Lcom/vk/medianative/MediaAnimationPlayer;
.super Ljava/lang/Object;
.source "MediaAnimationPlayer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/medianative/MediaAnimationPlayer$Listener;
    }
.end annotation


# static fields
.field private static final DEBUG:Z

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private fps:J

.field private fpsTime:J

.field private mHeight:I

.field private mIsReady:Z

.field private mIsRecycled:Z

.field private mIsRunning:Z

.field private mListener:Lcom/vk/medianative/MediaAnimationPlayer$Listener;

.field private final mLock:Ljava/lang/Object;

.field private mNativePtr:J

.field private mPath:Ljava/lang/String;

.field private mPositionMs:I

.field private mRenderingBitmap:Landroid/graphics/Bitmap;

.field private mRepeat:Z

.field private mResolution:I

.field private mSeekTo:I

.field private mWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const-class v0, Lcom/vk/medianative/MediaAnimationPlayer;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vk/medianative/MediaAnimationPlayer;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IZ)V
    .locals 4
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "resolution"    # I
    .param p3, "repeat"    # Z

    .prologue
    const-wide/16 v2, 0x0

    const/4 v1, -0x1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mLock:Ljava/lang/Object;

    .line 16
    iput v1, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mSeekTo:I

    .line 17
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mPositionMs:I

    .line 20
    iput v1, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mResolution:I

    .line 31
    iput-wide v2, p0, Lcom/vk/medianative/MediaAnimationPlayer;->fpsTime:J

    .line 32
    iput-wide v2, p0, Lcom/vk/medianative/MediaAnimationPlayer;->fps:J

    .line 37
    iput-object p1, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mPath:Ljava/lang/String;

    .line 38
    iput-boolean p3, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mRepeat:Z

    .line 39
    iput p2, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mResolution:I

    .line 40
    return-void
.end method

.method private create()Z
    .locals 10

    .prologue
    const-wide/16 v8, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 126
    iget-wide v4, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mNativePtr:J

    cmp-long v3, v4, v8

    if-eqz v3, :cond_1

    .line 146
    :cond_0
    :goto_0
    return v1

    .line 129
    :cond_1
    iget-object v3, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mPath:Ljava/lang/String;

    iget v4, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mSeekTo:I

    iget v5, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mResolution:I

    iget-boolean v6, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mRepeat:Z

    invoke-static {v3, v4, v5, v6}, Lcom/vk/medianative/MediaNative;->nativeAnimationPlayerCreate(Ljava/lang/String;IIZ)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mNativePtr:J

    .line 130
    const/4 v3, -0x1

    iput v3, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mSeekTo:I

    .line 131
    iget-wide v4, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mNativePtr:J

    cmp-long v3, v4, v8

    if-nez v3, :cond_2

    move v1, v2

    .line 132
    goto :goto_0

    .line 135
    :cond_2
    iget-wide v4, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mNativePtr:J

    invoke-static {v4, v5}, Lcom/vk/medianative/MediaNative;->nativeAnimationPlayerGetSize(J)I

    move-result v0

    .line 140
    .local v0, "size":I
    shr-int/lit8 v3, v0, 0x10

    iput v3, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mWidth:I

    .line 141
    int-to-short v3, v0

    iput v3, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mHeight:I

    .line 143
    iget-object v3, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mRenderingBitmap:Landroid/graphics/Bitmap;

    if-nez v3, :cond_3

    iget v3, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mWidth:I

    if-lez v3, :cond_3

    iget v3, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mHeight:I

    if-lez v3, :cond_3

    .line 144
    iget v3, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mWidth:I

    iget v4, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mHeight:I

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v4, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    iput-object v3, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mRenderingBitmap:Landroid/graphics/Bitmap;

    .line 146
    :cond_3
    iget-object v3, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mRenderingBitmap:Landroid/graphics/Bitmap;

    if-nez v3, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method private decode()V
    .locals 14

    .prologue
    .line 178
    iget-boolean v10, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mIsRecycled:Z

    if-eqz v10, :cond_1

    .line 179
    invoke-direct {p0}, Lcom/vk/medianative/MediaAnimationPlayer;->releaseInternal()V

    .line 226
    :cond_0
    :goto_0
    return-void

    .line 183
    :cond_1
    const/4 v0, 0x0

    .line 185
    .local v0, "created":Z
    :try_start_0
    iget-wide v10, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mNativePtr:J

    const-wide/16 v12, 0x0

    cmp-long v10, v10, v12

    if-nez v10, :cond_7

    .line 186
    invoke-direct {p0}, Lcom/vk/medianative/MediaAnimationPlayer;->create()Z

    move-result v0

    .line 195
    :cond_2
    :goto_1
    iget v4, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mPositionMs:I

    .line 196
    .local v4, "previousPositionMs":I
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    .line 197
    .local v6, "start":J
    iget-object v10, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mRenderingBitmap:Landroid/graphics/Bitmap;

    if-eqz v10, :cond_4

    .line 198
    iget-wide v10, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mNativePtr:J

    iget-object v12, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mRenderingBitmap:Landroid/graphics/Bitmap;

    invoke-static {v10, v11, v12}, Lcom/vk/medianative/MediaNative;->nativeAnimationPlayerDecode(JLandroid/graphics/Bitmap;)I

    move-result v1

    .line 199
    .local v1, "positionMs":I
    if-gez v1, :cond_3

    .line 200
    invoke-direct {p0}, Lcom/vk/medianative/MediaAnimationPlayer;->recycleInternal()V

    .line 202
    :cond_3
    iput v1, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mPositionMs:I

    .line 203
    if-nez v4, :cond_4

    .line 204
    iget v4, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mPositionMs:I

    .line 208
    .end local v1    # "positionMs":I
    :cond_4
    iget-object v10, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mListener:Lcom/vk/medianative/MediaAnimationPlayer$Listener;

    if-eqz v10, :cond_0

    iget-boolean v10, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mIsRunning:Z

    if-nez v10, :cond_5

    iget-boolean v10, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mIsRecycled:Z

    if-eqz v10, :cond_0

    .line 209
    :cond_5
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v10

    sub-long v8, v10, v6

    .line 210
    .local v8, "time":J
    iget v10, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mPositionMs:I

    sub-int/2addr v10, v4

    int-to-long v10, v10

    sub-long v2, v10, v8

    .line 212
    .local v2, "next":J
    iget-object v10, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mListener:Lcom/vk/medianative/MediaAnimationPlayer$Listener;

    const-wide/16 v12, 0x1

    invoke-static {v12, v13, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v12

    invoke-interface {v10, v12, v13}, Lcom/vk/medianative/MediaAnimationPlayer$Listener;->onDraw(J)V

    .line 214
    iget-boolean v10, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mIsRunning:Z

    if-eqz v10, :cond_0

    .line 215
    if-eqz v0, :cond_6

    .line 216
    const/4 v10, 0x1

    iput-boolean v10, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mIsReady:Z

    .line 217
    iget-object v10, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mListener:Lcom/vk/medianative/MediaAnimationPlayer$Listener;

    invoke-interface {v10}, Lcom/vk/medianative/MediaAnimationPlayer$Listener;->onPrepared()V

    .line 219
    :cond_6
    iget-object v10, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mListener:Lcom/vk/medianative/MediaAnimationPlayer$Listener;

    invoke-interface {v10}, Lcom/vk/medianative/MediaAnimationPlayer$Listener;->onRedraw()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 222
    .end local v2    # "next":J
    .end local v4    # "previousPositionMs":I
    .end local v6    # "start":J
    .end local v8    # "time":J
    :catch_0
    move-exception v5

    .line 223
    .local v5, "t":Ljava/lang/Throwable;
    sget-object v10, Lcom/vk/medianative/MediaAnimationPlayer;->TAG:Ljava/lang/String;

    const-string/jumbo v11, "Decoding error"

    invoke-static {v10, v11, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 224
    invoke-static {}, Lcom/vk/analytics/Analytics;->getInstance()Lcom/vk/analytics/Analytics;

    invoke-static {}, Lcom/vk/medianative/MediaNative;->dump()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/vk/analytics/Analytics;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 188
    .end local v5    # "t":Ljava/lang/Throwable;
    :cond_7
    :try_start_1
    iget v10, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mSeekTo:I

    if-ltz v10, :cond_2

    .line 189
    iget-wide v10, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mNativePtr:J

    iget v12, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mSeekTo:I

    invoke-static {v10, v11, v12}, Lcom/vk/medianative/MediaNative;->nativeAnimationPlayerSeek(JI)Z

    .line 190
    iget v10, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mSeekTo:I

    iput v10, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mPositionMs:I

    .line 191
    const/4 v10, -0x1

    iput v10, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mSeekTo:I
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method private recycleInternal()V
    .locals 1

    .prologue
    .line 169
    iget-boolean v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mIsRunning:Z

    if-eqz v0, :cond_0

    .line 170
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mIsRunning:Z

    .line 171
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mIsRecycled:Z

    .line 175
    :goto_0
    return-void

    .line 173
    :cond_0
    invoke-direct {p0}, Lcom/vk/medianative/MediaAnimationPlayer;->releaseInternal()V

    goto :goto_0
.end method

.method private releaseInternal()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    const/4 v2, 0x0

    .line 150
    iget-wide v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mNativePtr:J

    cmp-long v0, v0, v4

    if-eqz v0, :cond_1

    .line 151
    iput-boolean v2, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mIsRunning:Z

    .line 152
    iput-boolean v2, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mIsReady:Z

    .line 154
    iget-object v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mListener:Lcom/vk/medianative/MediaAnimationPlayer$Listener;

    if-eqz v0, :cond_0

    .line 155
    iget-object v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mListener:Lcom/vk/medianative/MediaAnimationPlayer$Listener;

    invoke-interface {v0}, Lcom/vk/medianative/MediaAnimationPlayer$Listener;->onComplete()V

    .line 158
    :cond_0
    iget-wide v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mNativePtr:J

    invoke-static {v0, v1}, Lcom/vk/medianative/MediaNative;->nativeAnimationPlayerRelease(J)V

    .line 159
    iput-wide v4, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mNativePtr:J

    .line 161
    iget-object v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mRenderingBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    .line 162
    iget-object v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mRenderingBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 163
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mRenderingBitmap:Landroid/graphics/Bitmap;

    .line 166
    :cond_1
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .locals 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 55
    iget-object v1, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 56
    :try_start_0
    iget-wide v2, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mNativePtr:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mRenderingBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 57
    iget-boolean v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mIsRecycled:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mRenderingBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 58
    iget-object v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mRenderingBitmap:Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {p1, v0, v2, p2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 61
    :cond_0
    monitor-exit v1

    .line 62
    return-void

    .line 61
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 98
    invoke-virtual {p0}, Lcom/vk/medianative/MediaAnimationPlayer;->recycle()V

    .line 99
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 100
    return-void
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mHeight:I

    return v0
.end method

.method public getPosition()I
    .locals 2

    .prologue
    .line 78
    iget-object v1, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 79
    :try_start_0
    iget v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mPositionMs:I

    monitor-exit v1

    return v0

    .line 80
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getRenderingBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mRenderingBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 51
    iget v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mWidth:I

    return v0
.end method

.method public isReady()Z
    .locals 1

    .prologue
    .line 116
    iget-boolean v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mIsReady:Z

    return v0
.end method

.method public isRunning()Z
    .locals 1

    .prologue
    .line 112
    iget-boolean v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mIsRunning:Z

    return v0
.end method

.method public recycle()V
    .locals 2

    .prologue
    .line 120
    iget-object v1, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 121
    :try_start_0
    invoke-direct {p0}, Lcom/vk/medianative/MediaAnimationPlayer;->recycleInternal()V

    .line 122
    monitor-exit v1

    .line 123
    return-void

    .line 122
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public run()V
    .locals 2

    .prologue
    .line 240
    iget-object v1, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 241
    :try_start_0
    invoke-direct {p0}, Lcom/vk/medianative/MediaAnimationPlayer;->decode()V

    .line 242
    monitor-exit v1

    .line 243
    return-void

    .line 242
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public seek(I)V
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 87
    iget-object v1, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 88
    :try_start_0
    iput p1, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mSeekTo:I

    .line 89
    monitor-exit v1

    .line 90
    return-void

    .line 89
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setListener(Lcom/vk/medianative/MediaAnimationPlayer$Listener;)V
    .locals 0
    .param p1, "listener"    # Lcom/vk/medianative/MediaAnimationPlayer$Listener;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mListener:Lcom/vk/medianative/MediaAnimationPlayer$Listener;

    .line 44
    return-void
.end method

.method public start()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 65
    iget-object v1, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 66
    :try_start_0
    iget-boolean v2, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mIsRunning:Z

    if-eqz v2, :cond_0

    .line 67
    const/4 v0, 0x0

    monitor-exit v1

    .line 73
    :goto_0
    return v0

    .line 72
    :cond_0
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mIsRunning:Z

    .line 73
    monitor-exit v1

    goto :goto_0

    .line 74
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public stop()V
    .locals 2

    .prologue
    .line 103
    iget-object v1, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 104
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/vk/medianative/MediaAnimationPlayer;->mIsRunning:Z

    .line 108
    monitor-exit v1

    .line 109
    return-void

    .line 108
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
