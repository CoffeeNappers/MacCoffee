.class public Lcom/vkontakte/android/upload/VideoUploadTask;
.super Lcom/vkontakte/android/upload/HTTPResumableUploadTask;
.source "VideoUploadTask.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/upload/VideoUploadTask$TranscodeRunnable;,
        Lcom/vkontakte/android/upload/VideoUploadTask$ProgressUpdateRunnable;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/upload/HTTPResumableUploadTask",
        "<",
        "Lcom/vkontakte/android/api/VideoFile;",
        ">;",
        "Landroid/os/Parcelable;"
    }
.end annotation


# static fields
.field private static final COMPRESS_PROGRESS_PART:F = 0.75f

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vkontakte/android/upload/VideoUploadTask;",
            ">;"
        }
    .end annotation
.end field

.field private static final LOG:Ljava/lang/String; = "VideoUpload"

.field private static final PROGRESS_MAX:I = 0x64

.field private static final PROGRESS_REQUEST_DELAY:I = 0x12c


# instance fields
.field private accessKey:Ljava/lang/String;

.field private compress:Z

.field private descr:Ljava/lang/String;

.field private encoderSettings:Lcom/vkontakte/android/media/video/VideoEncoderSettings;

.field private isPrivate:Z

.field private lastProgress:I

.field private mFromResponseDirectLink:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private outputFilePath:Ljava/lang/String;

.field private ownerID:I

.field private final progressUpdateHandler:Landroid/os/Handler;

.field private result:Lcom/vkontakte/android/api/VideoFile;

.field private showNotification:Z

.field private transcodeThread:Ljava/lang/Thread;

.field private videoID:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 48
    invoke-static {}, Lcom/vkontakte/android/utils/OsUtil;->isAtLeastJB_MR2()Z

    move-result v0

    if-nez v0, :cond_0

    .line 49
    const-string/jumbo v0, "ffmpeg"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 50
    const-string/jumbo v0, "vkvideo"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 411
    :cond_0
    new-instance v0, Lcom/vkontakte/android/upload/VideoUploadTask$4;

    invoke-direct {v0}, Lcom/vkontakte/android/upload/VideoUploadTask$4;-><init>()V

    sput-object v0, Lcom/vkontakte/android/upload/VideoUploadTask;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/vkontakte/android/media/video/VideoEncoderSettings;ZIZ)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "description"    # Ljava/lang/String;
    .param p5, "videoEncoderSettings"    # Lcom/vkontakte/android/media/video/VideoEncoderSettings;
    .param p6, "priv"    # Z
    .param p7, "ownerID"    # I
    .param p8, "notify"    # Z

    .prologue
    .line 80
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 58
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->progressUpdateHandler:Landroid/os/Handler;

    .line 81
    iput-object p3, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->name:Ljava/lang/String;

    .line 82
    iput-object p4, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->descr:Ljava/lang/String;

    .line 83
    iput-boolean p6, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->isPrivate:Z

    .line 84
    iput p7, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->ownerID:I

    .line 85
    iput-boolean p8, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->showNotification:Z

    .line 86
    iput-object p5, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->encoderSettings:Lcom/vkontakte/android/media/video/VideoEncoderSettings;

    .line 87
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 88
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string/jumbo v1, "compressVideos"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->compress:Z

    .line 89
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 338
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;-><init>(Landroid/os/Parcel;)V

    .line 58
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->progressUpdateHandler:Landroid/os/Handler;

    .line 339
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->name:Ljava/lang/String;

    .line 340
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->descr:Ljava/lang/String;

    .line 341
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->isPrivate:Z

    .line 342
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->ownerID:I

    .line 343
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->videoID:I

    .line 344
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->showNotification:Z

    .line 345
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_2

    :goto_2
    iput-boolean v1, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->compress:Z

    .line 346
    const-class v0, Lcom/vkontakte/android/media/video/VideoEncoderSettings;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/video/VideoEncoderSettings;

    iput-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->encoderSettings:Lcom/vkontakte/android/media/video/VideoEncoderSettings;

    .line 347
    return-void

    :cond_0
    move v0, v2

    .line 341
    goto :goto_0

    :cond_1
    move v0, v2

    .line 344
    goto :goto_1

    :cond_2
    move v1, v2

    .line 345
    goto :goto_2
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/vkontakte/android/upload/VideoUploadTask$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/vkontakte/android/upload/VideoUploadTask$1;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/VideoUploadTask;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method static synthetic access$002(Lcom/vkontakte/android/upload/VideoUploadTask;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/upload/VideoUploadTask;
    .param p1, "x1"    # I

    .prologue
    .line 41
    iput p1, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->videoID:I

    return p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/upload/VideoUploadTask;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/upload/VideoUploadTask;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->accessKey:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$102(Lcom/vkontakte/android/upload/VideoUploadTask;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/upload/VideoUploadTask;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->accessKey:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lcom/vkontakte/android/upload/VideoUploadTask;)Lcom/vkontakte/android/api/VideoFile;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/upload/VideoUploadTask;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->result:Lcom/vkontakte/android/api/VideoFile;

    return-object v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/upload/VideoUploadTask;Lcom/vkontakte/android/api/VideoFile;)Lcom/vkontakte/android/api/VideoFile;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/upload/VideoUploadTask;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->result:Lcom/vkontakte/android/api/VideoFile;

    return-object p1
.end method

.method static synthetic access$300(Lcom/vkontakte/android/upload/VideoUploadTask;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/upload/VideoUploadTask;

    .prologue
    .line 41
    iget-boolean v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->isPrivate:Z

    return v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/upload/VideoUploadTask;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/upload/VideoUploadTask;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->mFromResponseDirectLink:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/upload/VideoUploadTask;D)V
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/upload/VideoUploadTask;
    .param p1, "x1"    # D

    .prologue
    .line 41
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/upload/VideoUploadTask;->postProgress(D)V

    return-void
.end method

.method static synthetic access$700(Lcom/vkontakte/android/upload/VideoUploadTask;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/upload/VideoUploadTask;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->progressUpdateHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/upload/VideoUploadTask;Ljava/io/File;Ljava/lang/String;Lnet/ypresto/androidtranscoder/format/MediaFormatStrategy;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/upload/VideoUploadTask;
    .param p1, "x1"    # Ljava/io/File;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Lnet/ypresto/androidtranscoder/format/MediaFormatStrategy;

    .prologue
    .line 41
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/upload/VideoUploadTask;->transcodeVideo(Ljava/io/File;Ljava/lang/String;Lnet/ypresto/androidtranscoder/format/MediaFormatStrategy;)V

    return-void
.end method

.method static native nativeCancel()V
.end method

.method static native nativeCompressFile(Ljava/lang/String;Ljava/lang/String;IIZ)I
.end method

.method static native nativeGetProgress()D
.end method

.method private postProgress(D)V
    .locals 7
    .param p1, "progress"    # D

    .prologue
    .line 379
    const-wide/high16 v2, 0x3fe8000000000000L    # 0.75

    mul-double/2addr v2, p1

    const-wide/high16 v4, 0x4059000000000000L    # 100.0

    mul-double/2addr v2, v4

    double-to-int v0, v2

    .line 380
    .local v0, "percentage":I
    iget v1, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->lastProgress:I

    if-eq v1, v0, :cond_0

    .line 381
    iput v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->lastProgress:I

    .line 382
    const/16 v1, 0x64

    const/4 v2, 0x0

    invoke-super {p0, v0, v1, v2}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->onProgress(IIZ)V

    .line 384
    :cond_0
    return-void
.end method

.method private removeTempCompressFile()V
    .locals 2

    .prologue
    .line 355
    iget-object v1, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->outputFilePath:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 356
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->outputFilePath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 357
    .local v0, "tempFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 358
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 361
    .end local v0    # "tempFile":Ljava/io/File;
    :cond_0
    return-void
.end method

.method private removeTempFile()V
    .locals 2

    .prologue
    .line 364
    invoke-direct {p0}, Lcom/vkontakte/android/upload/VideoUploadTask;->removeTempCompressFile()V

    .line 366
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->file:Ljava/lang/String;

    .line 367
    .local v0, "sourcePath":Ljava/lang/String;
    const-string/jumbo v1, "content:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "file:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 368
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->file:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/upload/UploadUtils;->resolvePath(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 369
    const-string/jumbo v1, "unknown"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 376
    :cond_1
    :goto_0
    return-void

    .line 373
    :cond_2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, ".vkontakte/TEMP_TRIM_"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 374
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    goto :goto_0
.end method

.method private transcodeApi15(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "inputPath"    # Ljava/lang/String;
    .param p2, "outputPath"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    const/4 v3, 0x0

    .line 189
    invoke-static {p1}, Ljava/net/URLConnection;->guessContentTypeFromName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 190
    .local v2, "type":Ljava/lang/String;
    const-string/jumbo v4, "video/mp4"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 191
    new-instance v0, Lcom/vkontakte/android/upload/VideoUploadTask$ProgressUpdateRunnable;

    invoke-direct {v0, p0, v3}, Lcom/vkontakte/android/upload/VideoUploadTask$ProgressUpdateRunnable;-><init>(Lcom/vkontakte/android/upload/VideoUploadTask;Lcom/vkontakte/android/upload/VideoUploadTask$1;)V

    .line 192
    .local v0, "progressUpdateRunnable":Ljava/lang/Runnable;
    iget-object v4, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->progressUpdateHandler:Landroid/os/Handler;

    const-wide/16 v6, 0x12c

    invoke-virtual {v4, v0, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 193
    iget-object v4, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->encoderSettings:Lcom/vkontakte/android/media/video/VideoEncoderSettings;

    .line 194
    invoke-virtual {v4}, Lcom/vkontakte/android/media/video/VideoEncoderSettings;->getShorterLength()I

    move-result v4

    iget-object v5, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->encoderSettings:Lcom/vkontakte/android/media/video/VideoEncoderSettings;

    invoke-virtual {v5}, Lcom/vkontakte/android/media/video/VideoEncoderSettings;->getBitrate()I

    move-result v5

    sget-boolean v6, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    .line 193
    invoke-static {p1, p2, v4, v5, v6}, Lcom/vkontakte/android/upload/VideoUploadTask;->nativeCompressFile(Ljava/lang/String;Ljava/lang/String;IIZ)I

    move-result v1

    .line 195
    .local v1, "result":I
    iget-object v4, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->progressUpdateHandler:Landroid/os/Handler;

    invoke-virtual {v4, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 196
    if-nez v1, :cond_0

    .line 206
    .end local v0    # "progressUpdateRunnable":Ljava/lang/Runnable;
    .end local v1    # "result":I
    .end local p2    # "outputPath":Ljava/lang/String;
    :goto_0
    return-object p2

    .line 199
    .restart local v0    # "progressUpdateRunnable":Ljava/lang/Runnable;
    .restart local v1    # "result":I
    .restart local p2    # "outputPath":Ljava/lang/String;
    :cond_0
    const-string/jumbo v4, "VideoUpload"

    const-string/jumbo v5, "Upload without compress"

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    iput-boolean v8, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->compress:Z

    move-object p2, v3

    .line 201
    goto :goto_0

    .line 204
    .end local v0    # "progressUpdateRunnable":Ljava/lang/Runnable;
    .end local v1    # "result":I
    :cond_1
    const-string/jumbo v4, "VideoUpload"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Can not guess input video type format or format is not support: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    iput-boolean v8, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->compress:Z

    move-object p2, v3

    .line 206
    goto :goto_0
.end method

.method private transcodeApi18(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;
    .locals 7
    .param p1, "input"    # Ljava/io/File;
    .param p2, "output"    # Ljava/io/File;

    .prologue
    const/4 v2, 0x0

    const/4 v6, 0x0

    .line 212
    :try_start_0
    new-instance v1, Lcom/vkontakte/android/media/video/VKFormatStrategy;

    iget-object v3, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->encoderSettings:Lcom/vkontakte/android/media/video/VideoEncoderSettings;

    invoke-direct {v1, v3}, Lcom/vkontakte/android/media/video/VKFormatStrategy;-><init>(Lcom/vkontakte/android/media/video/VideoEncoderSettings;)V

    .line 213
    .local v1, "strategy":Lnet/ypresto/androidtranscoder/format/MediaFormatStrategy;
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lcom/vkontakte/android/upload/VideoUploadTask$TranscodeRunnable;

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, p0, p1, v5, v1}, Lcom/vkontakte/android/upload/VideoUploadTask$TranscodeRunnable;-><init>(Lcom/vkontakte/android/upload/VideoUploadTask;Ljava/io/File;Ljava/lang/String;Lnet/ypresto/androidtranscoder/format/MediaFormatStrategy;)V

    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v3, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->transcodeThread:Ljava/lang/Thread;

    .line 214
    iget-object v3, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->transcodeThread:Ljava/lang/Thread;

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 215
    iget-object v3, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->transcodeThread:Ljava/lang/Thread;

    invoke-virtual {v3}, Ljava/lang/Thread;->join()V

    .line 217
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 218
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 226
    .end local v1    # "strategy":Lnet/ypresto/androidtranscoder/format/MediaFormatStrategy;
    :goto_0
    return-object v2

    .line 220
    .restart local v1    # "strategy":Lnet/ypresto/androidtranscoder/format/MediaFormatStrategy;
    :cond_0
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->compress:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 223
    .end local v1    # "strategy":Lnet/ypresto/androidtranscoder/format/MediaFormatStrategy;
    :catch_0
    move-exception v0

    .line 224
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v3, "VideoUpload"

    const-string/jumbo v4, "Transcoding process was interrupted"

    invoke-static {v3, v4}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    iput-boolean v6, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->compress:Z

    goto :goto_0
.end method

.method private transcodeVideo(Ljava/io/File;Ljava/lang/String;Lnet/ypresto/androidtranscoder/format/MediaFormatStrategy;)V
    .locals 9
    .param p1, "inputFile"    # Ljava/io/File;
    .param p2, "outputPath"    # Ljava/lang/String;
    .param p3, "strategy"    # Lnet/ypresto/androidtranscoder/format/MediaFormatStrategy;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .prologue
    .line 232
    const/4 v4, 0x0

    .line 233
    .local v4, "fileInputStream":Ljava/io/FileInputStream;
    const/4 v3, 0x0

    .line 235
    .local v3, "fileDescriptor":Ljava/io/FileDescriptor;
    :try_start_0
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_3

    .line 236
    .end local v4    # "fileInputStream":Ljava/io/FileInputStream;
    .local v5, "fileInputStream":Ljava/io/FileInputStream;
    :try_start_1
    invoke-virtual {v5}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v3

    .line 237
    new-instance v2, Lnet/ypresto/androidtranscoder/engine/MediaTranscoderEngine;

    invoke-direct {v2}, Lnet/ypresto/androidtranscoder/engine/MediaTranscoderEngine;-><init>()V

    .line 238
    .local v2, "engine":Lnet/ypresto/androidtranscoder/engine/MediaTranscoderEngine;
    new-instance v6, Lcom/vkontakte/android/upload/VideoUploadTask$3;

    invoke-direct {v6, p0}, Lcom/vkontakte/android/upload/VideoUploadTask$3;-><init>(Lcom/vkontakte/android/upload/VideoUploadTask;)V

    invoke-virtual {v2, v6}, Lnet/ypresto/androidtranscoder/engine/MediaTranscoderEngine;->setProgressCallback(Lnet/ypresto/androidtranscoder/engine/MediaTranscoderEngine$ProgressCallback;)V

    .line 245
    invoke-virtual {v2, v3}, Lnet/ypresto/androidtranscoder/engine/MediaTranscoderEngine;->setDataSource(Ljava/io/FileDescriptor;)V

    .line 246
    invoke-virtual {v2, p2, p3}, Lnet/ypresto/androidtranscoder/engine/MediaTranscoderEngine;->transcodeVideo(Ljava/lang/String;Lnet/ypresto/androidtranscoder/format/MediaFormatStrategy;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_4

    move-object v4, v5

    .line 267
    .end local v2    # "engine":Lnet/ypresto/androidtranscoder/engine/MediaTranscoderEngine;
    .end local v5    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v4    # "fileInputStream":Ljava/io/FileInputStream;
    :goto_0
    return-void

    .line 247
    :catch_0
    move-exception v0

    .line 248
    .local v0, "e":Ljava/io/IOException;
    :goto_1
    if-eqz v4, :cond_0

    .line 250
    :try_start_2
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 255
    :cond_0
    :goto_2
    if-eqz v3, :cond_1

    .line 256
    const-string/jumbo v6, "VideoUpload"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Transcode failed: input file (fd: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, ") not found"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " or could not open output file (\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "\') ."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 259
    :cond_1
    invoke-direct {p0}, Lcom/vkontakte/android/upload/VideoUploadTask;->removeTempCompressFile()V

    goto :goto_0

    .line 251
    :catch_1
    move-exception v1

    .line 252
    .local v1, "eClose":Ljava/io/IOException;
    const-string/jumbo v6, "VideoUpload"

    const-string/jumbo v7, "Can\'t close input stream: "

    invoke-static {v6, v7, v1}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 260
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "eClose":Ljava/io/IOException;
    :catch_2
    move-exception v0

    .line 261
    .local v0, "e":Ljava/lang/InterruptedException;
    :goto_3
    const-string/jumbo v6, "VideoUpload"

    const-string/jumbo v7, "Cancel transcode video file."

    invoke-static {v6, v7}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    invoke-direct {p0}, Lcom/vkontakte/android/upload/VideoUploadTask;->removeTempCompressFile()V

    goto :goto_0

    .line 263
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catch_3
    move-exception v0

    .line 264
    .local v0, "e":Ljava/lang/Throwable;
    :goto_4
    const-string/jumbo v6, "VideoUpload"

    const-string/jumbo v7, "Fatal error while transcoding, this might be invalid format or bug in engine or Android."

    invoke-static {v6, v7, v0}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 265
    invoke-direct {p0}, Lcom/vkontakte/android/upload/VideoUploadTask;->removeTempCompressFile()V

    goto :goto_0

    .line 263
    .end local v0    # "e":Ljava/lang/Throwable;
    .end local v4    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v5    # "fileInputStream":Ljava/io/FileInputStream;
    :catch_4
    move-exception v0

    move-object v4, v5

    .end local v5    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v4    # "fileInputStream":Ljava/io/FileInputStream;
    goto :goto_4

    .line 260
    .end local v4    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v5    # "fileInputStream":Ljava/io/FileInputStream;
    :catch_5
    move-exception v0

    move-object v4, v5

    .end local v5    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v4    # "fileInputStream":Ljava/io/FileInputStream;
    goto :goto_3

    .line 247
    .end local v4    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v5    # "fileInputStream":Ljava/io/FileInputStream;
    :catch_6
    move-exception v0

    move-object v4, v5

    .end local v5    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v4    # "fileInputStream":Ljava/io/FileInputStream;
    goto :goto_1
.end method


# virtual methods
.method public afterUpload()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 284
    invoke-super {p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->afterUpload()V

    .line 285
    invoke-direct {p0}, Lcom/vkontakte/android/upload/VideoUploadTask;->removeTempFile()V

    .line 286
    return-void
.end method

.method public cancel()V
    .locals 1

    .prologue
    .line 271
    invoke-static {}, Lcom/vkontakte/android/utils/OsUtil;->isAtLeastJB_MR2()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 272
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->transcodeThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 273
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->transcodeThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 278
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/vkontakte/android/upload/VideoUploadTask;->removeTempFile()V

    .line 279
    invoke-super {p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->cancel()V

    .line 280
    return-void

    .line 276
    :cond_1
    invoke-static {}, Lcom/vkontakte/android/upload/VideoUploadTask;->nativeCancel()V

    goto :goto_0
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 321
    const/4 v0, 0x0

    return v0
.end method

.method protected extractArgsForSaveFromUploadResponse(Ljava/lang/String;)V
    .locals 4
    .param p1, "response"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 118
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 119
    .local v1, "jo":Lorg/json/JSONObject;
    const-string/jumbo v2, "direct_link"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->mFromResponseDirectLink:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 123
    return-void

    .line 120
    .end local v1    # "jo":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 121
    .local v0, "ex":Lorg/json/JSONException;
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "Cannot parse response"

    invoke-direct {v2, v3, v0}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected getNotificationTitle()Ljava/lang/CharSequence;
    .locals 2

    .prologue
    .line 311
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->context:Landroid/content/Context;

    const v1, 0x7f080738

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getResult()Landroid/os/Parcelable;
    .locals 1

    .prologue
    .line 41
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/VideoUploadTask;->getResult()Lcom/vkontakte/android/api/VideoFile;

    move-result-object v0

    return-object v0
.end method

.method public getResult()Lcom/vkontakte/android/api/VideoFile;
    .locals 1

    .prologue
    .line 301
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->result:Lcom/vkontakte/android/api/VideoFile;

    return-object v0
.end method

.method public getServer()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    .line 93
    new-instance v0, Lcom/vkontakte/android/api/video/VideoSave;

    iget v1, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->ownerID:I

    iget-object v2, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->name:Ljava/lang/String;

    iget-object v3, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->descr:Ljava/lang/String;

    iget-boolean v4, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->isPrivate:Z

    const/4 v5, 0x1

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/video/VideoSave;-><init>(ILjava/lang/String;Ljava/lang/String;ZZ)V

    new-instance v1, Lcom/vkontakte/android/upload/VideoUploadTask$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/upload/VideoUploadTask$1;-><init>(Lcom/vkontakte/android/upload/VideoUploadTask;)V

    .line 94
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/video/VideoSave;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v6

    .line 107
    .local v6, "req":Lcom/vkontakte/android/api/VKAPIRequest;
    iput-object v6, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 108
    invoke-virtual {v6}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v7

    .line 109
    .local v7, "result":Z
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 110
    if-nez v7, :cond_0

    .line 111
    new-instance v0, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v1, "can\'t get upload server"

    invoke-direct {v0, v1}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 113
    :cond_0
    return-void
.end method

.method protected needShowNotifications()Z
    .locals 1

    .prologue
    .line 306
    iget-boolean v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->showNotification:Z

    return v0
.end method

.method protected onProgress(IIZ)V
    .locals 4
    .param p1, "loaded"    # I
    .param p2, "total"    # I
    .param p3, "indeterminate"    # Z

    .prologue
    .line 290
    iget-boolean v2, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->compress:Z

    if-eqz v2, :cond_0

    .line 291
    const/16 v1, 0x4b

    .line 292
    .local v1, "shift":I
    int-to-float v2, p1

    int-to-float v3, p2

    div-float v0, v2, v3

    .line 293
    .local v0, "progress":F
    const/high16 v2, 0x3e800000    # 0.25f

    mul-float/2addr v2, v0

    const/high16 v3, 0x42c80000    # 100.0f

    mul-float/2addr v2, v3

    float-to-int v2, v2

    add-int/2addr v2, v1

    const/16 v3, 0x64

    invoke-super {p0, v2, v3, p3}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->onProgress(IIZ)V

    .line 297
    .end local v0    # "progress":F
    .end local v1    # "shift":I
    :goto_0
    return-void

    .line 295
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->onProgress(IIZ)V

    goto :goto_0
.end method

.method protected preProcessFile()Ljava/lang/String;
    .locals 6

    .prologue
    .line 157
    iget-boolean v4, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->compress:Z

    if-eqz v4, :cond_5

    .line 158
    iget-object v3, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->file:Ljava/lang/String;

    .line 159
    .local v3, "sourcePath":Ljava/lang/String;
    const-string/jumbo v4, "content:"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string/jumbo v4, "file:"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 160
    :cond_0
    iget-object v4, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->file:Ljava/lang/String;

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/upload/UploadUtils;->resolvePath(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    .line 161
    const-string/jumbo v4, "unknown"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 162
    invoke-super {p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->preProcessFile()Ljava/lang/String;

    move-result-object v4

    .line 184
    .end local v3    # "sourcePath":Ljava/lang/String;
    :goto_0
    return-object v4

    .line 166
    .restart local v3    # "sourcePath":Ljava/lang/String;
    :cond_1
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 167
    .local v0, "input":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 168
    new-instance v2, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    const-string/jumbo v5, ".vkontakte"

    invoke-direct {v2, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 169
    .local v2, "outputFolder":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    const-string/jumbo v4, "temp_upload.mp4"

    invoke-direct {v1, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 170
    .local v1, "output":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->outputFilePath:Ljava/lang/String;

    .line 171
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_2

    .line 172
    invoke-virtual {v2}, Ljava/io/File;->mkdir()Z

    .line 175
    :cond_2
    invoke-static {}, Lcom/vkontakte/android/utils/OsUtil;->isAtLeastJB_MR2()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 176
    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/upload/VideoUploadTask;->transcodeApi18(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 178
    :cond_3
    iget-object v4, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->outputFilePath:Ljava/lang/String;

    invoke-direct {p0, v3, v4}, Lcom/vkontakte/android/upload/VideoUploadTask;->transcodeApi15(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 181
    .end local v1    # "output":Ljava/io/File;
    .end local v2    # "outputFolder":Ljava/io/File;
    :cond_4
    invoke-super {p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->preProcessFile()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 184
    .end local v0    # "input":Ljava/io/File;
    .end local v3    # "sourcePath":Ljava/lang/String;
    :cond_5
    invoke-super {p0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->preProcessFile()Ljava/lang/String;

    move-result-object v4

    goto :goto_0
.end method

.method public save()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vkontakte/android/upload/UploadException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 127
    new-instance v2, Lcom/vkontakte/android/api/video/VideoGetById;

    iget v3, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->ownerID:I

    iget v4, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->videoID:I

    invoke-direct {v2, v3, v4, v5}, Lcom/vkontakte/android/api/video/VideoGetById;-><init>(IILjava/lang/String;)V

    new-instance v3, Lcom/vkontakte/android/upload/VideoUploadTask$2;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/upload/VideoUploadTask$2;-><init>(Lcom/vkontakte/android/upload/VideoUploadTask;)V

    .line 128
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/video/VideoGetById;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 147
    .local v0, "req":Lcom/vkontakte/android/api/VKAPIRequest;
    iput-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 148
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v1

    .line 149
    .local v1, "result":Z
    iput-object v5, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->currentApiRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 150
    if-nez v1, :cond_0

    .line 151
    new-instance v2, Lcom/vkontakte/android/upload/UploadException;

    const-string/jumbo v3, "can\'t get video"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/upload/UploadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 153
    :cond_0
    return-void
.end method

.method protected skipNFirstBytesUntilFileIsReady()J
    .locals 2

    .prologue
    .line 351
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method protected statsGetMethodNameForUploadUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 316
    const-string/jumbo v0, "video.save"

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 326
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->writeToParcel(Landroid/os/Parcel;I)V

    .line 327
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 328
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->descr:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 329
    iget-boolean v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->isPrivate:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 330
    iget v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->ownerID:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 331
    iget v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->videoID:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 332
    iget-boolean v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->showNotification:Z

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 333
    iget-boolean v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->compress:Z

    if-eqz v0, :cond_2

    :goto_2
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByte(B)V

    .line 334
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask;->encoderSettings:Lcom/vkontakte/android/media/video/VideoEncoderSettings;

    invoke-virtual {p1, v0, v2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 335
    return-void

    :cond_0
    move v0, v2

    .line 329
    goto :goto_0

    :cond_1
    move v0, v2

    .line 332
    goto :goto_1

    :cond_2
    move v1, v2

    .line 333
    goto :goto_2
.end method
