.class public Lcom/vk/camera/camera1/CameraHolder;
.super Ljava/lang/Object;
.source "CameraHolder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/camera/camera1/CameraHolder$MyHandler;,
        Lcom/vk/camera/camera1/CameraHolder$OpenReleaseState;
    }
.end annotation


# static fields
.field private static final DEBUG_OPEN_RELEASE:Z = true

.field private static final KEEP_CAMERA_TIMEOUT:I = 0xbb8

.field private static final RELEASE_CAMERA:I = 0x1

.field private static final TAG:Ljava/lang/String; = "CameraHolder"

.field private static sDateFormat:Ljava/text/SimpleDateFormat;

.field private static sHolder:Lcom/vk/camera/camera1/CameraHolder;

.field private static sOpenReleaseStates:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/camera/camera1/CameraHolder$OpenReleaseState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mBackCameraId:I

.field private mCameraDevice:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

.field private mCameraId:I

.field private mCameraOpened:Z

.field private mFrontCameraId:I

.field private final mHandler:Landroid/os/Handler;

.field private final mInfo:[Landroid/hardware/Camera$CameraInfo;

.field private mKeepBeforeTime:J

.field private final mNumberOfCameras:I

.field private mParameters:Landroid/hardware/Camera$Parameters;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 41
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/vk/camera/camera1/CameraHolder;->sOpenReleaseStates:Ljava/util/ArrayList;

    .line 43
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "yyyy-MM-dd HH:mm:ss.SSS"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vk/camera/camera1/CameraHolder;->sDateFormat:Ljava/text/SimpleDateFormat;

    return-void
.end method

.method private constructor <init>()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, -0x1

    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput v4, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraId:I

    .line 27
    const/4 v2, 0x0

    iput v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mBackCameraId:I

    .line 28
    iput v5, p0, Lcom/vk/camera/camera1/CameraHolder;->mFrontCameraId:I

    .line 124
    new-instance v0, Landroid/os/HandlerThread;

    const-string/jumbo v2, "CameraHolder"

    invoke-direct {v0, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 125
    .local v0, "ht":Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 126
    new-instance v2, Lcom/vk/camera/camera1/CameraHolder$MyHandler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lcom/vk/camera/camera1/CameraHolder$MyHandler;-><init>(Lcom/vk/camera/camera1/CameraHolder;Landroid/os/Looper;)V

    iput-object v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mHandler:Landroid/os/Handler;

    .line 127
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    move-result v2

    iput v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mNumberOfCameras:I

    .line 128
    iget v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mNumberOfCameras:I

    new-array v2, v2, [Landroid/hardware/Camera$CameraInfo;

    iput-object v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mInfo:[Landroid/hardware/Camera$CameraInfo;

    .line 129
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mNumberOfCameras:I

    if-ge v1, v2, :cond_0

    .line 130
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mInfo:[Landroid/hardware/Camera$CameraInfo;

    new-instance v3, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v3}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    aput-object v3, v2, v1

    .line 131
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mInfo:[Landroid/hardware/Camera$CameraInfo;

    aget-object v2, v2, v1

    invoke-static {v1, v2}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 129
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 135
    :cond_0
    const/4 v1, 0x0

    :goto_1
    iget v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mNumberOfCameras:I

    if-ge v1, v2, :cond_3

    .line 136
    iget v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mBackCameraId:I

    if-ne v2, v4, :cond_2

    iget-object v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mInfo:[Landroid/hardware/Camera$CameraInfo;

    aget-object v2, v2, v1

    iget v2, v2, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-nez v2, :cond_2

    .line 137
    iput v1, p0, Lcom/vk/camera/camera1/CameraHolder;->mBackCameraId:I

    .line 135
    :cond_1
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 138
    :cond_2
    iget v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mFrontCameraId:I

    if-ne v2, v4, :cond_1

    iget-object v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mInfo:[Landroid/hardware/Camera$CameraInfo;

    aget-object v2, v2, v1

    iget v2, v2, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-ne v2, v5, :cond_1

    .line 139
    iput v1, p0, Lcom/vk/camera/camera1/CameraHolder;->mFrontCameraId:I

    goto :goto_2

    .line 142
    :cond_3
    return-void
.end method

.method static synthetic access$100(Lcom/vk/camera/camera1/CameraHolder;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/camera/camera1/CameraHolder;

    .prologue
    .line 18
    iget-boolean v0, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraOpened:Z

    return v0
.end method

.method private static declared-synchronized collectState(ILcom/vk/camera/camera1/CameraManager$CameraProxy;)V
    .locals 8
    .param p0, "id"    # I
    .param p1, "device"    # Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    .prologue
    .line 47
    const-class v5, Lcom/vk/camera/camera1/CameraHolder;

    monitor-enter v5

    :try_start_0
    new-instance v2, Lcom/vk/camera/camera1/CameraHolder$OpenReleaseState;

    const/4 v4, 0x0

    invoke-direct {v2, v4}, Lcom/vk/camera/camera1/CameraHolder$OpenReleaseState;-><init>(Lcom/vk/camera/camera1/CameraHolder$1;)V

    .line 48
    .local v2, "s":Lcom/vk/camera/camera1/CameraHolder$OpenReleaseState;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iput-wide v6, v2, Lcom/vk/camera/camera1/CameraHolder$OpenReleaseState;->time:J

    .line 49
    iput p0, v2, Lcom/vk/camera/camera1/CameraHolder$OpenReleaseState;->id:I

    .line 50
    if-nez p1, :cond_0

    .line 51
    const-string/jumbo v4, "(null)"

    iput-object v4, v2, Lcom/vk/camera/camera1/CameraHolder$OpenReleaseState;->device:Ljava/lang/String;

    .line 56
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v3

    .line 57
    .local v3, "stack":[Ljava/lang/StackTraceElement;
    array-length v4, v3

    new-array v1, v4, [Ljava/lang/String;

    .line 58
    .local v1, "lines":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v4, v3

    if-ge v0, v4, :cond_1

    .line 59
    aget-object v4, v3, v0

    invoke-virtual {v4}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v0

    .line 58
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 53
    .end local v0    # "i":I
    .end local v1    # "lines":[Ljava/lang/String;
    .end local v3    # "stack":[Ljava/lang/StackTraceElement;
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v2, Lcom/vk/camera/camera1/CameraHolder$OpenReleaseState;->device:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 47
    .end local v2    # "s":Lcom/vk/camera/camera1/CameraHolder$OpenReleaseState;
    :catchall_0
    move-exception v4

    monitor-exit v5

    throw v4

    .line 61
    .restart local v0    # "i":I
    .restart local v1    # "lines":[Ljava/lang/String;
    .restart local v2    # "s":Lcom/vk/camera/camera1/CameraHolder$OpenReleaseState;
    .restart local v3    # "stack":[Ljava/lang/StackTraceElement;
    :cond_1
    :try_start_1
    iput-object v1, v2, Lcom/vk/camera/camera1/CameraHolder$OpenReleaseState;->stack:[Ljava/lang/String;

    .line 63
    sget-object v4, Lcom/vk/camera/camera1/CameraHolder;->sOpenReleaseStates:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/16 v6, 0xa

    if-le v4, v6, :cond_2

    .line 64
    sget-object v4, Lcom/vk/camera/camera1/CameraHolder;->sOpenReleaseStates:Ljava/util/ArrayList;

    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 66
    :cond_2
    sget-object v4, Lcom/vk/camera/camera1/CameraHolder;->sOpenReleaseStates:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 67
    monitor-exit v5

    return-void
.end method

.method private static declared-synchronized dumpStates()V
    .locals 10

    .prologue
    .line 70
    const-class v5, Lcom/vk/camera/camera1/CameraHolder;

    monitor-enter v5

    :try_start_0
    sget-object v4, Lcom/vk/camera/camera1/CameraHolder;->sOpenReleaseStates:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v1, v4, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_1

    .line 71
    sget-object v4, Lcom/vk/camera/camera1/CameraHolder;->sOpenReleaseStates:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vk/camera/camera1/CameraHolder$OpenReleaseState;

    .line 72
    .local v3, "s":Lcom/vk/camera/camera1/CameraHolder$OpenReleaseState;
    sget-object v4, Lcom/vk/camera/camera1/CameraHolder;->sDateFormat:Ljava/text/SimpleDateFormat;

    new-instance v6, Ljava/util/Date;

    iget-wide v8, v3, Lcom/vk/camera/camera1/CameraHolder$OpenReleaseState;->time:J

    invoke-direct {v6, v8, v9}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v4, v6}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 73
    .local v0, "date":Ljava/lang/String;
    const-string/jumbo v4, "CameraHolder"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "State "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " at "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    const-string/jumbo v4, "CameraHolder"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "mCameraId = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v3, Lcom/vk/camera/camera1/CameraHolder$OpenReleaseState;->id:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ", mCameraDevice = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v3, Lcom/vk/camera/camera1/CameraHolder$OpenReleaseState;->device:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    const-string/jumbo v4, "CameraHolder"

    const-string/jumbo v6, "Stack:"

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_1
    iget-object v4, v3, Lcom/vk/camera/camera1/CameraHolder$OpenReleaseState;->stack:[Ljava/lang/String;

    array-length v4, v4

    if-ge v2, v4, :cond_0

    .line 77
    const-string/jumbo v4, "CameraHolder"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "  "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v3, Lcom/vk/camera/camera1/CameraHolder$OpenReleaseState;->stack:[Ljava/lang/String;

    aget-object v7, v7, v2

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 70
    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto/16 :goto_0

    .line 80
    .end local v0    # "date":Ljava/lang/String;
    .end local v2    # "j":I
    .end local v3    # "s":Lcom/vk/camera/camera1/CameraHolder$OpenReleaseState;
    :cond_1
    monitor-exit v5

    return-void

    .line 70
    :catchall_0
    move-exception v4

    monitor-exit v5

    throw v4
.end method

.method public static declared-synchronized instance()Lcom/vk/camera/camera1/CameraHolder;
    .locals 2

    .prologue
    .line 92
    const-class v1, Lcom/vk/camera/camera1/CameraHolder;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/vk/camera/camera1/CameraHolder;->sHolder:Lcom/vk/camera/camera1/CameraHolder;

    if-nez v0, :cond_0

    .line 93
    new-instance v0, Lcom/vk/camera/camera1/CameraHolder;

    invoke-direct {v0}, Lcom/vk/camera/camera1/CameraHolder;-><init>()V

    sput-object v0, Lcom/vk/camera/camera1/CameraHolder;->sHolder:Lcom/vk/camera/camera1/CameraHolder;

    .line 95
    :cond_0
    sget-object v0, Lcom/vk/camera/camera1/CameraHolder;->sHolder:Lcom/vk/camera/camera1/CameraHolder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 92
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public currentCameraFrontal()Z
    .locals 2

    .prologue
    .line 261
    iget v0, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraId:I

    iget v1, p0, Lcom/vk/camera/camera1/CameraHolder;->mFrontCameraId:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public currentCameraHasFlash()Z
    .locals 6

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 266
    :try_start_0
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mParameters:Landroid/hardware/Camera$Parameters;

    if-nez v2, :cond_0

    move v2, v3

    .line 281
    :goto_0
    return v2

    .line 270
    :cond_0
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->getFlashMode()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    move v2, v3

    .line 271
    goto :goto_0

    .line 274
    :cond_1
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->getSupportedFlashModes()Ljava/util/List;

    move-result-object v0

    .line 275
    .local v0, "supportedFlashModes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ne v2, v4, :cond_3

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string/jumbo v5, "off"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    move v2, v3

    .line 276
    goto :goto_0

    :cond_3
    move v2, v4

    .line 279
    goto :goto_0

    .line 280
    .end local v0    # "supportedFlashModes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_0
    move-exception v1

    .local v1, "t":Ljava/lang/Throwable;
    move v2, v3

    .line 281
    goto :goto_0
.end method

.method public getBackCameraId()I
    .locals 1

    .prologue
    .line 249
    iget v0, p0, Lcom/vk/camera/camera1/CameraHolder;->mBackCameraId:I

    return v0
.end method

.method public getCameraInfo()[Landroid/hardware/Camera$CameraInfo;
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraHolder;->mInfo:[Landroid/hardware/Camera$CameraInfo;

    return-object v0
.end method

.method public getFrontCameraId()I
    .locals 1

    .prologue
    .line 253
    iget v0, p0, Lcom/vk/camera/camera1/CameraHolder;->mFrontCameraId:I

    return v0
.end method

.method public getNumberOfCameras()I
    .locals 1

    .prologue
    .line 145
    iget v0, p0, Lcom/vk/camera/camera1/CameraHolder;->mNumberOfCameras:I

    return v0
.end method

.method public getParameters()Landroid/hardware/Camera$Parameters;
    .locals 1

    .prologue
    .line 257
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraHolder;->mParameters:Landroid/hardware/Camera$Parameters;

    return-object v0
.end method

.method public keep()V
    .locals 1

    .prologue
    .line 238
    const/16 v0, 0xbb8

    invoke-virtual {p0, v0}, Lcom/vk/camera/camera1/CameraHolder;->keep(I)V

    .line 239
    return-void
.end method

.method public declared-synchronized keep(I)V
    .locals 4
    .param p1, "time"    # I

    .prologue
    .line 245
    monitor-enter p0

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    int-to-long v2, p1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/vk/camera/camera1/CameraHolder;->mKeepBeforeTime:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 246
    monitor-exit p0

    return-void

    .line 245
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized open(I)Lcom/vk/camera/camera1/CameraManager$CameraProxy;
    .locals 4
    .param p1, "cameraId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vk/camera/camera1/CameraHardwareException;
        }
    .end annotation

    .prologue
    .line 155
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraDevice:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    invoke-static {p1, v1}, Lcom/vk/camera/camera1/CameraHolder;->collectState(ILcom/vk/camera/camera1/CameraManager$CameraProxy;)V

    .line 156
    iget-boolean v1, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraOpened:Z

    if-eqz v1, :cond_0

    .line 157
    const-string/jumbo v1, "CameraHolder"

    const-string/jumbo v2, "double open"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->dumpStates()V

    .line 161
    :cond_0
    iget-boolean v1, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraOpened:Z

    if-eqz v1, :cond_1

    .line 162
    new-instance v1, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "Camera is already opened"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 155
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 164
    :cond_1
    :try_start_1
    iget-object v1, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraDevice:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraId:I

    if-eq v1, p1, :cond_2

    .line 165
    iget-object v1, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraDevice:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    invoke-virtual {v1}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->release()V

    .line 166
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraDevice:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    .line 167
    const/4 v1, -0x1

    iput v1, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraId:I

    .line 169
    :cond_2
    iget-object v1, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraDevice:Lcom/vk/camera/camera1/CameraManager$CameraProxy;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v1, :cond_3

    .line 171
    :try_start_2
    const-string/jumbo v1, "CameraHolder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "open camera "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    invoke-static {}, Lcom/vk/camera/camera1/CameraManager;->instance()Lcom/vk/camera/camera1/CameraManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/vk/camera/camera1/CameraManager;->cameraOpen(I)Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraDevice:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    .line 173
    iput p1, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraId:I
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 178
    :try_start_3
    iget-object v1, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraDevice:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    invoke-virtual {v1}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/camera/camera1/CameraHolder;->mParameters:Landroid/hardware/Camera$Parameters;

    .line 188
    :goto_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraOpened:Z

    .line 189
    iget-object v1, p0, Lcom/vk/camera/camera1/CameraHolder;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 190
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mKeepBeforeTime:J

    .line 191
    iget-object v1, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraDevice:Lcom/vk/camera/camera1/CameraManager$CameraProxy;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-object v1

    .line 174
    :catch_0
    move-exception v0

    .line 175
    .local v0, "e":Ljava/lang/RuntimeException;
    :try_start_4
    const-string/jumbo v1, "CameraHolder"

    const-string/jumbo v2, "fail to connect Camera"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 176
    new-instance v1, Lcom/vk/camera/camera1/CameraHardwareException;

    invoke-direct {v1, v0}, Lcom/vk/camera/camera1/CameraHardwareException;-><init>(Ljava/lang/Throwable;)V

    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 181
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :cond_3
    :try_start_5
    iget-object v1, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraDevice:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    invoke-virtual {v1}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->reconnect()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 186
    :try_start_6
    iget-object v1, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraDevice:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    iget-object v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v1, v2}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->setParameters(Landroid/hardware/Camera$Parameters;)V

    goto :goto_0

    .line 182
    :catch_1
    move-exception v0

    .line 183
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v1, "CameraHolder"

    const-string/jumbo v2, "reconnect failed."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    new-instance v1, Lcom/vk/camera/camera1/CameraHardwareException;

    invoke-direct {v1, v0}, Lcom/vk/camera/camera1/CameraHardwareException;-><init>(Ljava/lang/Throwable;)V

    throw v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
.end method

.method public declared-synchronized release()V
    .locals 6

    .prologue
    .line 213
    monitor-enter p0

    :try_start_0
    iget v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraId:I

    iget-object v3, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraDevice:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    invoke-static {v2, v3}, Lcom/vk/camera/camera1/CameraHolder;->collectState(ILcom/vk/camera/camera1/CameraManager$CameraProxy;)V

    .line 216
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraDevice:Lcom/vk/camera/camera1/CameraManager$CameraProxy;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 235
    :goto_0
    monitor-exit p0

    return-void

    .line 218
    :cond_0
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 219
    .local v0, "now":J
    iget-wide v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mKeepBeforeTime:J

    cmp-long v2, v0, v2

    if-gez v2, :cond_2

    .line 220
    iget-boolean v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraOpened:Z

    if-eqz v2, :cond_1

    .line 221
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraOpened:Z

    .line 222
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraDevice:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    invoke-virtual {v2}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->stopPreview()V

    .line 224
    :cond_1
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x1

    iget-wide v4, p0, Lcom/vk/camera/camera1/CameraHolder;->mKeepBeforeTime:J

    sub-long/2addr v4, v0

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 213
    .end local v0    # "now":J
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 228
    .restart local v0    # "now":J
    :cond_2
    const/4 v2, 0x0

    :try_start_2
    iput-boolean v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraOpened:Z

    .line 229
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraDevice:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    invoke-virtual {v2}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->release()V

    .line 230
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraDevice:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    .line 233
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mParameters:Landroid/hardware/Camera$Parameters;

    .line 234
    const/4 v2, -0x1

    iput v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraId:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized tryOpen(I)Lcom/vk/camera/camera1/CameraManager$CameraProxy;
    .locals 4
    .param p1, "cameraId"    # I

    .prologue
    const/4 v1, 0x0

    .line 200
    monitor-enter p0

    :try_start_0
    iget-boolean v2, p0, Lcom/vk/camera/camera1/CameraHolder;->mCameraOpened:Z

    if-nez v2, :cond_0

    invoke-virtual {p0, p1}, Lcom/vk/camera/camera1/CameraHolder;->open(I)Lcom/vk/camera/camera1/CameraManager$CameraProxy;
    :try_end_0
    .catch Lcom/vk/camera/camera1/CameraHardwareException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 207
    :cond_0
    monitor-exit p0

    return-object v1

    .line 201
    :catch_0
    move-exception v0

    .line 204
    .local v0, "e":Lcom/vk/camera/camera1/CameraHardwareException;
    :try_start_1
    const-string/jumbo v2, "eng"

    sget-object v3, Landroid/os/Build;->TYPE:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 205
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 200
    .end local v0    # "e":Lcom/vk/camera/camera1/CameraHardwareException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
