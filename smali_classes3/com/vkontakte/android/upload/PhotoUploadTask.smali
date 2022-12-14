.class public abstract Lcom/vkontakte/android/upload/PhotoUploadTask;
.super Lcom/vkontakte/android/upload/HTTPFileUploadTask;
.source "PhotoUploadTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S::",
        "Landroid/os/Parcelable;",
        ">",
        "Lcom/vkontakte/android/upload/HTTPFileUploadTask",
        "<TS;>;"
    }
.end annotation


# static fields
.field public static final METHOD_NAME:Ljava/lang/String; = "photo.upload"

.field private static final benchmarkTracker:Lcom/vkontakte/android/data/BenchmarkTracker;


# instance fields
.field private disableDownscale:Z

.field private final profilerConfig:Lcom/vkontakte/android/auth/configs/ProfilerConfig;

.field private final profilerEnabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->getInstance()Lcom/vkontakte/android/data/BenchmarkTracker;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/upload/PhotoUploadTask;->benchmarkTracker:Lcom/vkontakte/android/data/BenchmarkTracker;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileName"    # Ljava/lang/String;

    .prologue
    .local p0, "this":Lcom/vkontakte/android/upload/PhotoUploadTask;, "Lcom/vkontakte/android/upload/PhotoUploadTask<TS;>;"
    const/4 v1, 0x0

    .line 42
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 36
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getProfilerConfig()Lcom/vkontakte/android/auth/configs/ProfilerConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/upload/PhotoUploadTask;->profilerConfig:Lcom/vkontakte/android/auth/configs/ProfilerConfig;

    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/upload/PhotoUploadTask;->profilerConfig:Lcom/vkontakte/android/auth/configs/ProfilerConfig;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/upload/PhotoUploadTask;->profilerConfig:Lcom/vkontakte/android/auth/configs/ProfilerConfig;

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/configs/ProfilerConfig;->isApiRequests()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/upload/PhotoUploadTask;->profilerEnabled:Z

    .line 39
    iput-boolean v1, p0, Lcom/vkontakte/android/upload/PhotoUploadTask;->disableDownscale:Z

    .line 43
    return-void

    :cond_0
    move v0, v1

    .line 37
    goto :goto_0
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .local p0, "this":Lcom/vkontakte/android/upload/PhotoUploadTask;, "Lcom/vkontakte/android/upload/PhotoUploadTask<TS;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 46
    invoke-direct {p0, p1}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;-><init>(Landroid/os/Parcel;)V

    .line 36
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getProfilerConfig()Lcom/vkontakte/android/auth/configs/ProfilerConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/upload/PhotoUploadTask;->profilerConfig:Lcom/vkontakte/android/auth/configs/ProfilerConfig;

    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/upload/PhotoUploadTask;->profilerConfig:Lcom/vkontakte/android/auth/configs/ProfilerConfig;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/upload/PhotoUploadTask;->profilerConfig:Lcom/vkontakte/android/auth/configs/ProfilerConfig;

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/configs/ProfilerConfig;->isApiRequests()Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/upload/PhotoUploadTask;->profilerEnabled:Z

    .line 39
    iput-boolean v2, p0, Lcom/vkontakte/android/upload/PhotoUploadTask;->disableDownscale:Z

    .line 47
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-ne v0, v1, :cond_1

    :goto_1
    iput-boolean v1, p0, Lcom/vkontakte/android/upload/PhotoUploadTask;->disableDownscale:Z

    .line 48
    return-void

    :cond_0
    move v0, v2

    .line 37
    goto :goto_0

    :cond_1
    move v1, v2

    .line 47
    goto :goto_1
.end method

.method private copyExifLocation(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "from"    # Ljava/lang/String;
    .param p2, "to"    # Ljava/lang/String;

    .prologue
    .line 196
    .local p0, "this":Lcom/vkontakte/android/upload/PhotoUploadTask;, "Lcom/vkontakte/android/upload/PhotoUploadTask<TS;>;"
    :try_start_0
    new-instance v3, Landroid/media/ExifInterface;

    invoke-direct {v3, p1}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 197
    .local v3, "srcExif":Landroid/media/ExifInterface;
    new-instance v2, Landroid/media/ExifInterface;

    invoke-direct {v2, p2}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 198
    .local v2, "dstExif":Landroid/media/ExifInterface;
    const/16 v4, 0x8

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string/jumbo v6, "GPSAltitude"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string/jumbo v6, "GPSAltitudeRef"

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string/jumbo v6, "GPSLatitude"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string/jumbo v6, "GPSLatitudeRef"

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-string/jumbo v6, "GPSLongitude"

    aput-object v6, v4, v5

    const/4 v5, 0x5

    const-string/jumbo v6, "GPSLongitudeRef"

    aput-object v6, v4, v5

    const/4 v5, 0x6

    const-string/jumbo v6, "Make"

    aput-object v6, v4, v5

    const/4 v5, 0x7

    const-string/jumbo v6, "Model"

    aput-object v6, v4, v5

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 199
    .local v1, "attrs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 200
    .local v0, "attr":Ljava/lang/String;
    invoke-virtual {v3, v0}, Landroid/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 201
    invoke-virtual {v3, v0}, Landroid/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v0, v5}, Landroid/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 205
    .end local v0    # "attr":Ljava/lang/String;
    .end local v1    # "attrs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v2    # "dstExif":Landroid/media/ExifInterface;
    .end local v3    # "srcExif":Landroid/media/ExifInterface;
    :catch_0
    move-exception v4

    .line 208
    :goto_1
    return-void

    .line 204
    .restart local v1    # "attrs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v2    # "dstExif":Landroid/media/ExifInterface;
    .restart local v3    # "srcExif":Landroid/media/ExifInterface;
    :cond_1
    invoke-virtual {v2}, Landroid/media/ExifInterface;->saveAttributes()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1
.end method


# virtual methods
.method public isDisableDownscale()Z
    .locals 1

    .prologue
    .line 160
    .local p0, "this":Lcom/vkontakte/android/upload/PhotoUploadTask;, "Lcom/vkontakte/android/upload/PhotoUploadTask<TS;>;"
    iget-boolean v0, p0, Lcom/vkontakte/android/upload/PhotoUploadTask;->disableDownscale:Z

    return v0
.end method

.method protected preProcessFile()Ljava/lang/String;
    .locals 29

    .prologue
    .line 52
    .local p0, "this":Lcom/vkontakte/android/upload/PhotoUploadTask;, "Lcom/vkontakte/android/upload/PhotoUploadTask<TS;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/upload/PhotoUploadTask;->context:Landroid/content/Context;

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v22

    .line 53
    .local v22, "prefs":Landroid/content/SharedPreferences;
    const-string/jumbo v2, "compressPhotos"

    const/4 v3, 0x1

    move-object/from16 v0, v22

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_0

    .line 54
    const/16 v24, 0x0

    .line 156
    :goto_0
    return-object v24

    .line 56
    :cond_0
    const/16 v24, 0x0

    .line 58
    .local v24, "res":Ljava/lang/String;
    :try_start_0
    new-instance v18, Landroid/graphics/BitmapFactory$Options;

    invoke-direct/range {v18 .. v18}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 59
    .local v18, "opts":Landroid/graphics/BitmapFactory$Options;
    const/4 v2, 0x1

    move-object/from16 v0, v18

    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 61
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/upload/PhotoUploadTask;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/upload/PhotoUploadTask;->file:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const-string/jumbo v5, "r"

    invoke-virtual {v2, v3, v5}, Landroid/content/ContentResolver;->openAssetFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v15

    .line 62
    .local v15, "f":Landroid/content/res/AssetFileDescriptor;
    invoke-virtual {v15}, Landroid/content/res/AssetFileDescriptor;->createInputStream()Ljava/io/FileInputStream;

    move-result-object v16

    .line 63
    .local v16, "is":Ljava/io/FileInputStream;
    const/4 v2, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-static {v0, v2, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 64
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v2

    const-wide/16 v6, 0x0

    invoke-virtual {v2, v6, v7}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    .line 65
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "in img size "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v18

    iget v5, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, "x"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v18

    iget v5, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    move-object/from16 v0, v18

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    move-object/from16 v0, v18

    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-le v2, v3, :cond_1

    move-object/from16 v0, v18

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    const/16 v3, 0x500

    if-gt v2, v3, :cond_2

    :cond_1
    move-object/from16 v0, v18

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    move-object/from16 v0, v18

    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-gt v2, v3, :cond_a

    move-object/from16 v0, v18

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    const/16 v3, 0x400

    if-le v2, v3, :cond_a

    .line 69
    :cond_2
    const/high16 v26, 0x3f800000    # 1.0f

    .line 70
    .local v26, "sample":F
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "disableDownscale "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/vkontakte/android/upload/PhotoUploadTask;->disableDownscale:Z

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/vkontakte/android/upload/PhotoUploadTask;->disableDownscale:Z

    if-nez v2, :cond_3

    .line 72
    move-object/from16 v0, v18

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    move-object/from16 v0, v18

    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-le v2, v3, :cond_b

    .line 73
    move-object/from16 v0, v18

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    move-object/from16 v0, v18

    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x44a00000    # 1280.0f

    div-float v26, v2, v3

    .line 78
    :cond_3
    :goto_1
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "sample size="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v26

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "new size="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v18

    iget v5, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    int-to-float v5, v5

    div-float v5, v5, v26

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, "x"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v18

    iget v5, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    int-to-float v5, v5

    div-float v5, v5, v26

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    const/4 v2, 0x0

    move-object/from16 v0, v18

    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 82
    move/from16 v0, v26

    float-to-double v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    double-to-int v2, v2

    move-object/from16 v0, v18

    iput v2, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    const/4 v2, 0x0

    :try_start_1
    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-static {v0, v2, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v12

    .line 91
    .local v12, "bmp":Landroid/graphics/Bitmap;
    :goto_2
    :try_start_2
    new-instance v27, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    const-string/jumbo v3, ".vkontakte"

    move-object/from16 v0, v27

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 92
    .local v27, "vkDir":Ljava/io/File;
    invoke-virtual/range {v27 .. v27}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_4

    .line 93
    invoke-virtual/range {v27 .. v27}, Ljava/io/File;->mkdirs()Z

    .line 95
    :cond_4
    new-instance v20, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    const-string/jumbo v3, ".vkontakte/temp_upload.jpg"

    move-object/from16 v0, v20

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 96
    .local v20, "outfile":Ljava/io/File;
    const/16 v25, 0x0

    .line 97
    .local v25, "rotation":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/upload/PhotoUploadTask;->file:Ljava/lang/String;

    const-string/jumbo v3, "content:"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    move-result v2

    if-eqz v2, :cond_6

    .line 99
    const/4 v2, 0x1

    :try_start_3
    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string/jumbo v3, "orientation"

    aput-object v3, v4, v2

    .line 100
    .local v4, "projection":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/upload/PhotoUploadTask;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/upload/PhotoUploadTask;->file:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .line 101
    .local v13, "c":Landroid/database/Cursor;
    invoke-interface {v13}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 102
    const/4 v2, 0x0

    invoke-interface {v13, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v25

    .line 104
    :cond_5
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "img rotation is "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v25

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0

    .line 108
    .end local v4    # "projection":[Ljava/lang/String;
    .end local v13    # "c":Landroid/database/Cursor;
    :cond_6
    :goto_3
    :try_start_4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/upload/PhotoUploadTask;->file:Ljava/lang/String;

    const-string/jumbo v3, "content:"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    if-nez v25, :cond_8

    .line 109
    :cond_7
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/upload/PhotoUploadTask;->file:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/upload/UploadUtils;->resolvePath(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v23

    .line 110
    .local v23, "realName":Ljava/lang/String;
    if-eqz v23, :cond_8

    .line 111
    new-instance v14, Landroid/media/ExifInterface;

    move-object/from16 v0, v23

    invoke-direct {v14, v0}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 112
    .local v14, "exif":Landroid/media/ExifInterface;
    const-string/jumbo v2, "Orientation"

    const/4 v3, 0x0

    invoke-virtual {v14, v2, v3}, Landroid/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v17

    .line 113
    .local v17, "o":I
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Exif orientation "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    packed-switch v17, :pswitch_data_0

    .line 130
    .end local v14    # "exif":Landroid/media/ExifInterface;
    .end local v17    # "o":I
    .end local v23    # "realName":Ljava/lang/String;
    :cond_8
    :goto_4
    :pswitch_0
    if-eqz v25, :cond_9

    .line 131
    new-instance v10, Landroid/graphics/Matrix;

    invoke-direct {v10}, Landroid/graphics/Matrix;-><init>()V

    .line 132
    .local v10, "matrix":Landroid/graphics/Matrix;
    move/from16 v0, v25

    int-to-float v2, v0

    invoke-virtual {v10, v2}, Landroid/graphics/Matrix;->preRotate(F)Z
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0

    .line 134
    const/4 v6, 0x0

    const/4 v7, 0x0

    :try_start_5
    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    const/4 v11, 0x0

    move-object v5, v12

    invoke-static/range {v5 .. v11}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;
    :try_end_5
    .catch Ljava/lang/OutOfMemoryError; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_0

    move-result-object v12

    .line 140
    .end local v10    # "matrix":Landroid/graphics/Matrix;
    :cond_9
    :goto_5
    :try_start_6
    new-instance v19, Ljava/io/FileOutputStream;

    invoke-direct/range {v19 .. v20}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 141
    .local v19, "out":Ljava/io/FileOutputStream;
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v3, 0x5a

    move-object/from16 v0, v19

    invoke-virtual {v12, v2, v3, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 142
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "out img size = "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, " x "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    const/4 v12, 0x0

    .line 145
    invoke-virtual/range {v19 .. v19}, Ljava/io/FileOutputStream;->close()V

    .line 146
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/upload/PhotoUploadTask;->file:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/upload/UploadUtils;->resolvePath(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v21

    .line 147
    .local v21, "path":Ljava/lang/String;
    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/upload/PhotoUploadTask;->copyExifLocation(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "file size = "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->length()J

    move-result-wide v6

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v24

    .line 151
    .end local v12    # "bmp":Landroid/graphics/Bitmap;
    .end local v19    # "out":Ljava/io/FileOutputStream;
    .end local v20    # "outfile":Ljava/io/File;
    .end local v21    # "path":Ljava/lang/String;
    .end local v25    # "rotation":I
    .end local v26    # "sample":F
    .end local v27    # "vkDir":Ljava/io/File;
    :cond_a
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileInputStream;->close()V

    .line 152
    invoke-virtual {v15}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_0

    goto/16 :goto_0

    .line 153
    .end local v15    # "f":Landroid/content/res/AssetFileDescriptor;
    .end local v16    # "is":Ljava/io/FileInputStream;
    .end local v18    # "opts":Landroid/graphics/BitmapFactory$Options;
    :catch_0
    move-exception v28

    .line 154
    .local v28, "x":Ljava/lang/Throwable;
    const-string/jumbo v2, "vk"

    move-object/from16 v0, v28

    invoke-static {v2, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 75
    .end local v28    # "x":Ljava/lang/Throwable;
    .restart local v15    # "f":Landroid/content/res/AssetFileDescriptor;
    .restart local v16    # "is":Ljava/io/FileInputStream;
    .restart local v18    # "opts":Landroid/graphics/BitmapFactory$Options;
    .restart local v26    # "sample":F
    :cond_b
    :try_start_7
    move-object/from16 v0, v18

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    move-object/from16 v0, v18

    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x44800000    # 1024.0f

    div-float v26, v2, v3

    goto/16 :goto_1

    .line 86
    :catch_1
    move-exception v28

    .line 87
    .local v28, "x":Ljava/lang/OutOfMemoryError;
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "fallback!"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    invoke-static {}, Lcom/vk/imageloader/VKImageLoader;->clearMemoryCache()V

    .line 89
    const/4 v2, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-static {v0, v2, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v12

    .restart local v12    # "bmp":Landroid/graphics/Bitmap;
    goto/16 :goto_2

    .line 116
    .end local v28    # "x":Ljava/lang/OutOfMemoryError;
    .restart local v14    # "exif":Landroid/media/ExifInterface;
    .restart local v17    # "o":I
    .restart local v20    # "outfile":Ljava/io/File;
    .restart local v23    # "realName":Ljava/lang/String;
    .restart local v25    # "rotation":I
    .restart local v27    # "vkDir":Ljava/io/File;
    :pswitch_1
    const/16 v25, 0x0

    .line 117
    goto/16 :goto_4

    .line 119
    :pswitch_2
    const/16 v25, 0x5a

    .line 120
    goto/16 :goto_4

    .line 122
    :pswitch_3
    const/16 v25, 0xb4

    .line 123
    goto/16 :goto_4

    .line 125
    :pswitch_4
    const/16 v25, 0x10e

    goto/16 :goto_4

    .line 135
    .end local v14    # "exif":Landroid/media/ExifInterface;
    .end local v17    # "o":I
    .end local v23    # "realName":Ljava/lang/String;
    .restart local v10    # "matrix":Landroid/graphics/Matrix;
    :catch_2
    move-exception v28

    .line 136
    .restart local v28    # "x":Ljava/lang/OutOfMemoryError;
    invoke-static {}, Lcom/vk/imageloader/VKImageLoader;->clearMemoryCache()V

    .line 137
    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    const/4 v11, 0x0

    move-object v5, v12

    invoke-static/range {v5 .. v11}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_0

    move-result-object v12

    goto/16 :goto_5

    .line 105
    .end local v10    # "matrix":Landroid/graphics/Matrix;
    .end local v28    # "x":Ljava/lang/OutOfMemoryError;
    :catch_3
    move-exception v2

    goto/16 :goto_3

    .line 114
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method public setDisableDownscale(Z)V
    .locals 0
    .param p1, "disableDownscale"    # Z

    .prologue
    .line 164
    .local p0, "this":Lcom/vkontakte/android/upload/PhotoUploadTask;, "Lcom/vkontakte/android/upload/PhotoUploadTask<TS;>;"
    iput-boolean p1, p0, Lcom/vkontakte/android/upload/PhotoUploadTask;->disableDownscale:Z

    .line 165
    return-void
.end method

.method protected trackErrorApiUpload(I)V
    .locals 3
    .param p1, "totalTime"    # I

    .prologue
    .line 176
    .local p0, "this":Lcom/vkontakte/android/upload/PhotoUploadTask;, "Lcom/vkontakte/android/upload/PhotoUploadTask<TS;>;"
    iget-boolean v0, p0, Lcom/vkontakte/android/upload/PhotoUploadTask;->profilerEnabled:Z

    if-eqz v0, :cond_0

    .line 177
    sget-object v0, Lcom/vkontakte/android/upload/PhotoUploadTask;->benchmarkTracker:Lcom/vkontakte/android/data/BenchmarkTracker;

    const-string/jumbo v1, "photo.upload"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Lcom/vkontakte/android/data/BenchmarkTracker;->addErrorApiMeasurement(Ljava/lang/String;II)V

    .line 179
    :cond_0
    return-void
.end method

.method protected trackFailureUpload()V
    .locals 2

    .prologue
    .line 183
    .local p0, "this":Lcom/vkontakte/android/upload/PhotoUploadTask;, "Lcom/vkontakte/android/upload/PhotoUploadTask<TS;>;"
    iget-boolean v0, p0, Lcom/vkontakte/android/upload/PhotoUploadTask;->profilerEnabled:Z

    if-eqz v0, :cond_0

    .line 184
    sget-object v0, Lcom/vkontakte/android/upload/PhotoUploadTask;->benchmarkTracker:Lcom/vkontakte/android/data/BenchmarkTracker;

    const-string/jumbo v1, "photo.upload"

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/BenchmarkTracker;->countFailedApiMeasurement(Ljava/lang/String;)V

    .line 186
    :cond_0
    return-void
.end method

.method protected trackSuccessfulUpload(IJ)V
    .locals 6
    .param p1, "totalTime"    # I
    .param p2, "byteSize"    # J

    .prologue
    .line 169
    .local p0, "this":Lcom/vkontakte/android/upload/PhotoUploadTask;, "Lcom/vkontakte/android/upload/PhotoUploadTask<TS;>;"
    iget-boolean v0, p0, Lcom/vkontakte/android/upload/PhotoUploadTask;->profilerEnabled:Z

    if-eqz v0, :cond_0

    .line 170
    sget-object v0, Lcom/vkontakte/android/upload/PhotoUploadTask;->benchmarkTracker:Lcom/vkontakte/android/data/BenchmarkTracker;

    const-string/jumbo v1, "photo.upload"

    const/4 v3, 0x0

    move v2, p1

    move-wide v4, p2

    invoke-virtual/range {v0 .. v5}, Lcom/vkontakte/android/data/BenchmarkTracker;->addSuccessApiMeasurement(Ljava/lang/String;IIJ)V

    .line 172
    :cond_0
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 190
    .local p0, "this":Lcom/vkontakte/android/upload/PhotoUploadTask;, "Lcom/vkontakte/android/upload/PhotoUploadTask<TS;>;"
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->writeToParcel(Landroid/os/Parcel;I)V

    .line 191
    iget-boolean v0, p0, Lcom/vkontakte/android/upload/PhotoUploadTask;->disableDownscale:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 192
    return-void

    .line 191
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
