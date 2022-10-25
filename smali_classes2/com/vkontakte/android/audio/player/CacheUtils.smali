.class public Lcom/vkontakte/android/audio/player/CacheUtils;
.super Ljava/lang/Object;
.source "CacheUtils.java"


# static fields
.field private static final MAX_TMP_SPACE:J = 0x6400000L

.field public static final MIN_FREE_SPACE:J = 0x1400000L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clearCache(Ljava/io/File;)V
    .locals 4
    .param p0, "dir"    # Ljava/io/File;

    .prologue
    .line 25
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 26
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 27
    .local v1, "files":[Ljava/io/File;
    array-length v3, v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v0, v1, v2

    .line 29
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 27
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 32
    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "files":[Ljava/io/File;
    :cond_0
    return-void
.end method

.method public static clearOldCache(Ljava/io/File;)V
    .locals 13
    .param p0, "dir"    # Ljava/io/File;

    .prologue
    const/4 v12, 0x0

    .line 36
    if-nez p0, :cond_0

    const/4 v4, 0x0

    .line 37
    .local v4, "files":[Ljava/io/File;
    :goto_0
    if-eqz v4, :cond_4

    .line 38
    :try_start_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .local v3, "fileList":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    invoke-static {v3, v4}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 40
    invoke-static {}, Lcom/vkontakte/android/audio/player/CacheUtils$$Lambda$1;->lambdaFactory$()Ljava/util/Comparator;

    move-result-object v8

    invoke-static {v3, v8}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 45
    const-wide/16 v6, 0x0

    .line 46
    .local v6, "filesSize":J
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v8

    if-ge v5, v8, :cond_1

    .line 47
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->length()J

    move-result-wide v8

    add-long/2addr v6, v8

    .line 46
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 36
    .end local v3    # "fileList":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v4    # "files":[Ljava/io/File;
    .end local v5    # "i":I
    .end local v6    # "filesSize":J
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    goto :goto_0

    .line 50
    .restart local v3    # "fileList":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .restart local v4    # "files":[Ljava/io/File;
    .restart local v5    # "i":I
    .restart local v6    # "filesSize":J
    :cond_1
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v8

    add-int/lit8 v5, v8, -0x1

    :goto_2
    if-ltz v5, :cond_4

    const-wide/32 v8, 0x6400000

    cmp-long v8, v6, v8

    if-gtz v8, :cond_2

    const/4 v8, 0x4

    if-lt v5, v8, :cond_4

    .line 51
    :cond_2
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .line 53
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, ".info"

    invoke-virtual {v8, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 54
    new-instance v2, Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    add-int/lit8 v11, v11, -0x5

    invoke-virtual {v9, v10, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v2, v8, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 58
    .local v2, "file2":Ljava/io/File;
    :goto_3
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v8

    sub-long/2addr v6, v8

    .line 59
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v8

    sub-long/2addr v6, v8

    .line 61
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 63
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 64
    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const-string/jumbo v10, "Clear audio file"

    aput-object v10, v8, v9

    const/4 v9, 0x1

    aput-object v1, v8, v9

    invoke-static {v8}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 65
    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const-string/jumbo v10, "Clear audio file"

    aput-object v10, v8, v9

    const/4 v9, 0x1

    aput-object v2, v8, v9

    invoke-static {v8}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 50
    add-int/lit8 v5, v5, -0x1

    goto :goto_2

    .line 56
    .end local v2    # "file2":Ljava/io/File;
    :cond_3
    new-instance v2, Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, ".info"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v2, v8, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .restart local v2    # "file2":Ljava/io/File;
    goto :goto_3

    .line 68
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "file2":Ljava/io/File;
    .end local v3    # "fileList":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v4    # "files":[Ljava/io/File;
    .end local v5    # "i":I
    .end local v6    # "filesSize":J
    :catch_0
    move-exception v0

    .line 69
    .local v0, "e":Ljava/lang/Exception;
    new-array v8, v12, [Ljava/lang/Object;

    invoke-static {v0, v8}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 71
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_4
    return-void
.end method

.method public static getCacheDir(Landroid/content/Context;)Ljava/io/File;
    .locals 10
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 74
    invoke-static {p0}, Landroid/support/v4/content/ContextCompat;->getExternalCacheDirs(Landroid/content/Context;)[Ljava/io/File;

    move-result-object v1

    .line 76
    .local v1, "externalDirs":[Ljava/io/File;
    if-eqz v1, :cond_0

    array-length v3, v1

    if-nez v3, :cond_2

    .line 77
    :cond_0
    const/4 v0, 0x0

    .line 97
    :cond_1
    :goto_0
    return-object v0

    .line 78
    :cond_2
    const/4 v2, 0x0

    .line 79
    .local v2, "fallbackDir":Ljava/io/File;
    array-length v4, v1

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v4, :cond_6

    aget-object v0, v1, v3

    .line 80
    .local v0, "dir":Ljava/io/File;
    if-eqz v0, :cond_5

    .line 81
    invoke-static {v0}, Lcom/vkontakte/android/audio/player/CacheUtils;->clearOldCache(Ljava/io/File;)V

    .line 82
    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/Utils;->isSdCardPath(Ljava/io/File;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 83
    invoke-virtual {v0}, Ljava/io/File;->getUsableSpace()J

    move-result-wide v6

    const-wide/32 v8, 0x1400000

    cmp-long v5, v6, v8

    if-gtz v5, :cond_1

    .line 86
    invoke-static {v0}, Lcom/vkontakte/android/audio/player/CacheUtils;->clearCache(Ljava/io/File;)V

    .line 90
    :cond_3
    if-eqz v2, :cond_4

    invoke-virtual {v2}, Ljava/io/File;->getUsableSpace()J

    move-result-wide v6

    invoke-virtual {v0}, Ljava/io/File;->getUsableSpace()J

    move-result-wide v8

    cmp-long v5, v6, v8

    if-gez v5, :cond_5

    .line 91
    :cond_4
    move-object v2, v0

    .line 79
    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 94
    .end local v0    # "dir":Ljava/io/File;
    :cond_6
    if-nez v2, :cond_7

    .line 95
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v2

    .line 97
    :cond_7
    new-instance v0, Ljava/io/File;

    const-string/jumbo v3, "PlayerProxy"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_0
.end method

.method static getLoadedTmpFile(Ljava/lang/String;)Ljava/io/File;
    .locals 9
    .param p0, "mid"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 135
    :try_start_0
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioFacade;->getTrackTmpFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 136
    .local v1, "file":Ljava/io/File;
    new-instance v3, Lcom/vkontakte/android/audio/player/proxy/FileInfo;

    invoke-direct {v3, v1}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;-><init>(Ljava/io/File;)V

    .line 137
    .local v3, "fileInfo":Lcom/vkontakte/android/audio/player/proxy/FileInfo;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v2

    .line 138
    .local v2, "fileExists":Z
    if-eqz v2, :cond_2

    .line 140
    :try_start_1
    invoke-virtual {v3}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->load()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 151
    :goto_0
    if-eqz v2, :cond_3

    .line 152
    const/4 v7, 0x0

    :try_start_2
    invoke-virtual {v3, v7}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->split(Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;)Ljava/util/List;

    move-result-object v5

    .line 153
    .local v5, "parts":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;

    .line 154
    .local v4, "part":Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;
    iget-boolean v8, v4, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->downloaded:Z

    if-nez v8, :cond_0

    move-object v1, v6

    .line 164
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "fileExists":Z
    .end local v3    # "fileInfo":Lcom/vkontakte/android/audio/player/proxy/FileInfo;
    .end local v4    # "part":Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;
    .end local v5    # "parts":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;>;"
    :cond_1
    :goto_1
    return-object v1

    .line 141
    .restart local v1    # "file":Ljava/io/File;
    .restart local v2    # "fileExists":Z
    .restart local v3    # "fileInfo":Lcom/vkontakte/android/audio/player/proxy/FileInfo;
    :catch_0
    move-exception v0

    .line 143
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 144
    const/4 v2, 0x0

    .line 145
    goto :goto_0

    .line 147
    .end local v0    # "e":Ljava/io/IOException;
    :cond_2
    invoke-virtual {v3}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->delete()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 148
    const/4 v2, 0x0

    goto :goto_0

    .line 161
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "fileExists":Z
    .end local v3    # "fileInfo":Lcom/vkontakte/android/audio/player/proxy/FileInfo;
    :catch_1
    move-exception v0

    .line 162
    .local v0, "e":Ljava/lang/Exception;
    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v0, v7}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .end local v0    # "e":Ljava/lang/Exception;
    :cond_3
    move-object v1, v6

    .line 164
    goto :goto_1
.end method

.method static synthetic lambda$clearOldCache$0(Ljava/io/File;Ljava/io/File;)I
    .locals 5
    .param p0, "o1"    # Ljava/io/File;
    .param p1, "o2"    # Ljava/io/File;

    .prologue
    const-wide/16 v0, 0x0

    .line 41
    if-nez p0, :cond_0

    move-wide v2, v0

    .line 42
    .local v2, "y":J
    :goto_0
    if-nez p1, :cond_1

    .line 43
    .local v0, "x":J
    :goto_1
    cmp-long v4, v0, v2

    if-gez v4, :cond_2

    const/4 v4, -0x1

    :goto_2
    return v4

    .line 41
    .end local v0    # "x":J
    .end local v2    # "y":J
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    goto :goto_0

    .line 42
    .restart local v2    # "y":J
    :cond_1
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    goto :goto_1

    .line 43
    .restart local v0    # "x":J
    :cond_2
    cmp-long v4, v0, v2

    if-nez v4, :cond_3

    const/4 v4, 0x0

    goto :goto_2

    :cond_3
    const/4 v4, 0x1

    goto :goto_2
.end method

.method static tryUseCacheForSaveMusic(Ljava/lang/String;Ljava/io/File;)V
    .locals 9
    .param p0, "mid"    # Ljava/lang/String;
    .param p1, "fileOut"    # Ljava/io/File;

    .prologue
    const/4 v8, 0x0

    .line 102
    :try_start_0
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioFacade;->getTrackTmpFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 103
    .local v1, "file":Ljava/io/File;
    new-instance v3, Lcom/vkontakte/android/audio/player/proxy/FileInfo;

    invoke-direct {v3, v1}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;-><init>(Ljava/io/File;)V

    .line 104
    .local v3, "fileInfo":Lcom/vkontakte/android/audio/player/proxy/FileInfo;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v2

    .line 105
    .local v2, "fileExists":Z
    if-eqz v2, :cond_2

    .line 107
    :try_start_1
    invoke-virtual {v3}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->load()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 118
    :goto_0
    if-eqz v2, :cond_1

    .line 119
    const/4 v6, 0x0

    :try_start_2
    invoke-virtual {v3, v6}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->split(Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;)Ljava/util/List;

    move-result-object v5

    .line 120
    .local v5, "parts":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;

    .line 121
    .local v4, "part":Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;
    iget-boolean v7, v4, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->downloaded:Z

    if-nez v7, :cond_0

    .line 131
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "fileExists":Z
    .end local v3    # "fileInfo":Lcom/vkontakte/android/audio/player/proxy/FileInfo;
    .end local v4    # "part":Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;
    .end local v5    # "parts":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;>;"
    :cond_1
    :goto_1
    return-void

    .line 108
    .restart local v1    # "file":Ljava/io/File;
    .restart local v2    # "fileExists":Z
    .restart local v3    # "fileInfo":Lcom/vkontakte/android/audio/player/proxy/FileInfo;
    :catch_0
    move-exception v0

    .line 110
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 111
    const/4 v2, 0x0

    .line 112
    goto :goto_0

    .line 114
    .end local v0    # "e":Ljava/io/IOException;
    :cond_2
    invoke-virtual {v3}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->delete()V

    .line 115
    const/4 v2, 0x0

    goto :goto_0

    .line 126
    .restart local v5    # "parts":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;>;"
    :cond_3
    const/4 v6, 0x0

    invoke-static {v1, p1, v6}, Lcom/vkontakte/android/audio/utils/Utils;->replaceFile(Ljava/io/File;Ljava/io/File;Z)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 128
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "fileExists":Z
    .end local v3    # "fileInfo":Lcom/vkontakte/android/audio/player/proxy/FileInfo;
    .end local v5    # "parts":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;>;"
    :catch_1
    move-exception v0

    .line 129
    .local v0, "e":Ljava/lang/Exception;
    new-array v6, v8, [Ljava/lang/Object;

    invoke-static {v0, v6}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_1
.end method
