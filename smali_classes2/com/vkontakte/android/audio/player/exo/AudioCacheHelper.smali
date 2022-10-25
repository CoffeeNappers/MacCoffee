.class public Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;
.super Ljava/lang/Object;
.source "AudioCacheHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper$OutputStreamRandomAccessFile;
    }
.end annotation


# static fields
.field private static final PARAM_MID:Ljava/lang/String; = "mid"

.field private static final PARAM_URL:Ljava/lang/String; = "url"


# instance fields
.field private active:Z

.field private bufferedOutputStream:Ljava/io/BufferedOutputStream;

.field private currentPosition:J

.field private fileInfo:Lcom/vkontakte/android/audio/player/proxy/FileInfo;

.field private length:J

.field private lockFile:Lcom/vkontakte/android/audio/player/proxy/LockFile;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->currentPosition:J

    .line 65
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->active:Z

    return-void
.end method

.method public static createUrlFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "mid"    # Ljava/lang/String;
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 41
    const-string/jumbo v1, "afile://audio"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 42
    .local v0, "builder":Landroid/net/Uri$Builder;
    const-string/jumbo v1, "mid"

    invoke-virtual {v0, v1, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 43
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 44
    const-string/jumbo v1, "url"

    invoke-virtual {v0, v1, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 46
    :cond_0
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static createUrlHttp(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "mid"    # Ljava/lang/String;
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 50
    const-string/jumbo v1, "ahttp://audio"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 51
    .local v0, "builder":Landroid/net/Uri$Builder;
    const-string/jumbo v1, "mid"

    invoke-virtual {v0, v1, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 52
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 53
    const-string/jumbo v1, "url"

    invoke-virtual {v0, v1, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 55
    :cond_0
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method static getMidFromUrl(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 37
    const-string/jumbo v0, "mid"

    invoke-virtual {p0, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static getPlayedUrlFromUrl(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 33
    const-string/jumbo v0, "url"

    invoke-virtual {p0, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static initializeCache(Ljava/io/File;J)Lcom/vkontakte/android/audio/player/proxy/FileInfo;
    .locals 3
    .param p0, "file"    # Ljava/io/File;
    .param p1, "contentLength"    # J
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 143
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 145
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 146
    invoke-static {p0}, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->loadFileInfo(Ljava/io/File;)Lcom/vkontakte/android/audio/player/proxy/FileInfo;

    move-result-object v1

    .line 161
    :goto_0
    return-object v1

    .line 148
    :cond_0
    invoke-static {p0, p1, p2}, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->prepareFile(Ljava/io/File;J)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 150
    :try_start_0
    new-instance v1, Lcom/vkontakte/android/audio/player/proxy/FileInfo;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;-><init>(Ljava/io/File;)V

    .line 151
    .local v1, "fileInfo":Lcom/vkontakte/android/audio/player/proxy/FileInfo;
    invoke-virtual {v1, p1, p2}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->setContentLength(J)V

    .line 152
    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->setContentType(Ljava/lang/String;)V

    .line 153
    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->save()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 155
    .end local v1    # "fileInfo":Lcom/vkontakte/android/audio/player/proxy/FileInfo;
    :catch_0
    move-exception v0

    .line 156
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v0}, Lcom/vk/analytics/Analytics;->logException(Ljava/lang/Throwable;)V

    .line 157
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 161
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static loadFileInfo(Ljava/io/File;)Lcom/vkontakte/android/audio/player/proxy/FileInfo;
    .locals 3
    .param p0, "file"    # Ljava/io/File;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 166
    new-instance v2, Lcom/vkontakte/android/audio/player/proxy/FileInfo;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;-><init>(Ljava/io/File;)V

    .line 167
    .local v2, "fileInfo":Lcom/vkontakte/android/audio/player/proxy/FileInfo;
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    .line 168
    .local v1, "fileExists":Z
    if-eqz v1, :cond_0

    .line 170
    :try_start_0
    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->load()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 180
    :goto_0
    if-eqz v1, :cond_1

    .end local v2    # "fileInfo":Lcom/vkontakte/android/audio/player/proxy/FileInfo;
    :goto_1
    return-object v2

    .line 171
    .restart local v2    # "fileInfo":Lcom/vkontakte/android/audio/player/proxy/FileInfo;
    :catch_0
    move-exception v0

    .line 173
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 174
    const/4 v1, 0x0

    .line 175
    goto :goto_0

    .line 177
    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->delete()V

    .line 178
    const/4 v1, 0x0

    goto :goto_0

    .line 180
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private static prepareFile(Ljava/io/File;J)Z
    .locals 13
    .param p0, "file"    # Ljava/io/File;
    .param p1, "contentLength"    # J

    .prologue
    const/4 v8, 0x0

    .line 185
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v9

    invoke-static {v9}, Lcom/vkontakte/android/audio/player/CacheUtils;->clearOldCache(Ljava/io/File;)V

    .line 186
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v9

    invoke-virtual {v9}, Ljava/io/File;->getUsableSpace()J

    move-result-wide v6

    .line 187
    .local v6, "freeSpace":J
    const-wide/32 v10, 0x1400000

    invoke-static {p1, p2, v10, v11}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v10

    cmp-long v9, v6, v10

    if-gez v9, :cond_0

    .line 188
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v9

    invoke-static {v9}, Lcom/vkontakte/android/audio/player/CacheUtils;->clearCache(Ljava/io/File;)V

    .line 189
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v9

    invoke-virtual {v9}, Ljava/io/File;->getUsableSpace()J

    move-result-wide v6

    .line 190
    const-wide/32 v10, 0x1400000

    invoke-static {p1, p2, v10, v11}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v10

    cmp-long v9, v6, v10

    if-gez v9, :cond_0

    .line 212
    .end local v6    # "freeSpace":J
    :goto_0
    return v8

    .line 195
    .restart local v6    # "freeSpace":J
    :cond_0
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 197
    .local v3, "out":Ljava/io/FileOutputStream;
    const/high16 v9, 0x20000

    :try_start_1
    new-array v0, v9, [B

    .line 198
    .local v0, "buff":[B
    move-wide v4, p1

    .line 199
    .local v4, "elapsed":J
    :goto_1
    const-wide/16 v10, 0x0

    cmp-long v9, v4, v10

    if-lez v9, :cond_1

    .line 200
    array-length v9, v0

    int-to-long v10, v9

    invoke-static {v4, v5, v10, v11}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v10

    long-to-int v1, v10

    .line 201
    .local v1, "count":I
    const/4 v9, 0x0

    invoke-virtual {v3, v0, v9, v1}, Ljava/io/FileOutputStream;->write([BII)V

    .line 202
    int-to-long v10, v1

    sub-long/2addr v4, v10

    .line 203
    goto :goto_1

    .line 204
    .end local v1    # "count":I
    :cond_1
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 206
    :try_start_2
    invoke-static {v3}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V

    .line 208
    const/4 v8, 0x1

    goto :goto_0

    .line 206
    .end local v0    # "buff":[B
    .end local v4    # "elapsed":J
    :catchall_0
    move-exception v9

    invoke-static {v3}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V

    throw v9
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 209
    .end local v3    # "out":Ljava/io/FileOutputStream;
    .end local v6    # "freeSpace":J
    :catch_0
    move-exception v2

    .line 210
    .local v2, "e":Ljava/lang/Exception;
    new-array v9, v8, [Ljava/lang/Object;

    invoke-static {v2, v9}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 211
    invoke-static {v2}, Lcom/vk/analytics/Analytics;->logException(Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 2

    .prologue
    .line 120
    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->active:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 138
    :goto_0
    monitor-exit p0

    return-void

    .line 124
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->bufferedOutputStream:Ljava/io/BufferedOutputStream;

    invoke-static {v1}, Lcom/vkontakte/android/utils/Utils;->closeSilently(Ljava/io/Closeable;)V

    .line 125
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->bufferedOutputStream:Ljava/io/BufferedOutputStream;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 127
    :try_start_2
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->fileInfo:Lcom/vkontakte/android/audio/player/proxy/FileInfo;

    if-eqz v1, :cond_1

    .line 128
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->fileInfo:Lcom/vkontakte/android/audio/player/proxy/FileInfo;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->save()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 133
    :cond_1
    :goto_1
    :try_start_3
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->lockFile:Lcom/vkontakte/android/audio/player/proxy/LockFile;

    if-eqz v1, :cond_2

    .line 134
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->lockFile:Lcom/vkontakte/android/audio/player/proxy/LockFile;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/proxy/LockFile;->unlock()V

    .line 135
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->lockFile:Lcom/vkontakte/android/audio/player/proxy/LockFile;

    .line 137
    :cond_2
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->active:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 120
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 130
    :catch_0
    move-exception v0

    .line 131
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    :try_start_4
    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1
.end method

.method public declared-synchronized open(Lcom/google/android/exoplayer2/upstream/DataSpec;J)V
    .locals 8
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer2/upstream/DataSpec;
    .param p2, "length"    # J

    .prologue
    .line 68
    monitor-enter p0

    :try_start_0
    iget-object v4, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-static {v4}, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->getMidFromUrl(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    .line 69
    .local v2, "midStr":Ljava/lang/String;
    if-eqz v2, :cond_0

    const-string/jumbo v4, "null"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 70
    :cond_0
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->active:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    :goto_0
    monitor-exit p0

    return-void

    .line 73
    :cond_1
    const/4 v4, 0x1

    :try_start_1
    iput-boolean v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->active:Z

    .line 76
    iput-wide p2, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->length:J

    .line 77
    iget-wide v4, p1, Lcom/google/android/exoplayer2/upstream/DataSpec;->position:J

    iput-wide v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->currentPosition:J

    .line 79
    invoke-static {v2}, Lcom/vkontakte/android/audio/AudioFacade;->getTrackTmpFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 80
    .local v1, "file":Ljava/io/File;
    invoke-static {v1}, Lcom/vkontakte/android/audio/player/proxy/LockFile;->lock(Ljava/io/File;)Lcom/vkontakte/android/audio/player/proxy/LockFile;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->lockFile:Lcom/vkontakte/android/audio/player/proxy/LockFile;

    .line 81
    invoke-static {v1, p2, p3}, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->initializeCache(Ljava/io/File;J)Lcom/vkontakte/android/audio/player/proxy/FileInfo;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->fileInfo:Lcom/vkontakte/android/audio/player/proxy/FileInfo;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 83
    :try_start_2
    new-instance v3, Ljava/io/RandomAccessFile;

    const-string/jumbo v4, "rws"

    invoke-direct {v3, v1, v4}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 84
    .local v3, "randomAccessFile":Ljava/io/RandomAccessFile;
    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->currentPosition:J

    invoke-virtual {v3, v4, v5}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 86
    new-instance v4, Ljava/io/BufferedOutputStream;

    new-instance v5, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper$OutputStreamRandomAccessFile;

    invoke-direct {v5, v3}, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper$OutputStreamRandomAccessFile;-><init>(Ljava/io/RandomAccessFile;)V

    const/high16 v6, 0x20000

    invoke-direct {v4, v5, v6}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    iput-object v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->bufferedOutputStream:Ljava/io/BufferedOutputStream;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 88
    .end local v3    # "randomAccessFile":Ljava/io/RandomAccessFile;
    :catch_0
    move-exception v0

    .line 89
    .local v0, "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    :try_start_3
    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0, v4}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 68
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "midStr":Ljava/lang/String;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public read([BII)V
    .locals 11
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "readLength"    # I

    .prologue
    const/4 v10, 0x0

    .line 94
    iget-boolean v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->active:Z

    if-nez v2, :cond_0

    .line 117
    :goto_0
    return-void

    .line 99
    :cond_0
    :try_start_0
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->fileInfo:Lcom/vkontakte/android/audio/player/proxy/FileInfo;

    if-eqz v2, :cond_1

    .line 100
    add-int v2, p2, p3

    invoke-static {p1, p2, v2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v1

    .line 101
    .local v1, "xoredBuff":[B
    iget-wide v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->currentPosition:J

    invoke-static {v1, p3, v2, v3}, Lcom/vkontakte/android/audio/utils/Utils;->doXor([BIJ)V

    .line 103
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->bufferedOutputStream:Ljava/io/BufferedOutputStream;

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3, p3}, Ljava/io/BufferedOutputStream;->write([BII)V

    .line 105
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->fileInfo:Lcom/vkontakte/android/audio/player/proxy/FileInfo;

    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->currentPosition:J

    iget-wide v6, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->currentPosition:J

    int-to-long v8, p3

    add-long/2addr v6, v8

    const-wide/16 v8, 0x1

    sub-long/2addr v6, v8

    invoke-virtual {v2, v4, v5, v6, v7}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->addRange(JJ)V

    .line 107
    iget-wide v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->currentPosition:J

    int-to-long v4, p3

    add-long/2addr v2, v4

    iget-wide v4, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->length:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_1

    .line 108
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->bufferedOutputStream:Ljava/io/BufferedOutputStream;

    invoke-virtual {v2}, Ljava/io/BufferedOutputStream;->flush()V

    .line 109
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->fileInfo:Lcom/vkontakte/android/audio/player/proxy/FileInfo;

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->save()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    .end local v1    # "xoredBuff":[B
    :cond_1
    :goto_1
    iget-wide v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->currentPosition:J

    int-to-long v4, p3

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->currentPosition:J

    goto :goto_0

    .line 112
    :catch_0
    move-exception v0

    .line 113
    .local v0, "e":Ljava/lang/Exception;
    new-array v2, v10, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_1
.end method
