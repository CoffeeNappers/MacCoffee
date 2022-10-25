.class public Lcom/vk/core/util/FileUtils;
.super Ljava/lang/Object;
.source "FileUtils.java"


# static fields
.field private static final BASE_DIR:Ljava/lang/String; = "VK"

.field private static final BASE_HIDDEN_DIR:Ljava/lang/String; = ".vkontakte"

.field private static final DELETE_TIMEOUT:J = 0xf731400L

.field private static final DOWNLOADS_DIR:Ljava/lang/String; = "Downloads"

.field private static final PHOTOS_DIR:Ljava/lang/String; = "Photos"

.field public static final TEMP_AYUV_PREFIX:Ljava/lang/String; = "TEMP_AYUV_"

.field public static final TEMP_GRAF_PREFIX:Ljava/lang/String; = "GRAF_"

.field public static final TEMP_TRIM_PREFIX:Ljava/lang/String; = "TEMP_TRIM_"

.field private static final TEMP_UPLOADS_DIR:Ljava/lang/String; = "TempUploads"

.field private static final VIDEOS_DIR:Ljava/lang/String; = "Videos"

.field private static final VIDEO_CACHE_DIR:Ljava/lang/String; = "vcache"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 352
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkFolder(Ljava/io/File;)Ljava/io/File;
    .locals 1
    .param p0, "dir"    # Ljava/io/File;

    .prologue
    .line 207
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 208
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    .line 210
    :cond_0
    return-object p0
.end method

.method public static clearOldFilesInUploads()V
    .locals 8

    .prologue
    .line 120
    :try_start_0
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getUploadsDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    .local v0, "f":Ljava/io/File;
    :goto_0
    if-ge v1, v3, :cond_1

    aget-object v0, v2, v1

    .line 121
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    sub-long/2addr v4, v6

    const-wide/32 v6, 0xf731400

    cmp-long v4, v4, v6

    if-lez v4, :cond_0

    .line 122
    invoke-static {v0}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 125
    :catch_0
    move-exception v1

    .line 128
    :cond_1
    return-void
.end method

.method public static copyFile(Ljava/io/File;Ljava/io/File;)V
    .locals 6
    .param p0, "sourceFile"    # Ljava/io/File;
    .param p1, "destFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 249
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 250
    invoke-virtual {p1}, Ljava/io/File;->createNewFile()Z

    .line 253
    :cond_0
    const/4 v1, 0x0

    .line 254
    .local v1, "source":Ljava/nio/channels/FileChannel;
    const/4 v0, 0x0

    .line 257
    .local v0, "destination":Ljava/nio/channels/FileChannel;
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v2}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    .line 258
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    .line 259
    const-wide/16 v2, 0x0

    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Ljava/nio/channels/FileChannel;->transferFrom(Ljava/nio/channels/ReadableByteChannel;JJ)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 262
    if-eqz v1, :cond_1

    .line 263
    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->close()V

    .line 265
    :cond_1
    if-eqz v0, :cond_2

    .line 266
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V

    .line 269
    :cond_2
    return-void

    .line 262
    :catchall_0
    move-exception v2

    if-eqz v1, :cond_3

    .line 263
    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->close()V

    .line 265
    :cond_3
    if-eqz v0, :cond_4

    .line 266
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V

    :cond_4
    throw v2
.end method

.method private static deleteDirectory(Ljava/io/File;)Z
    .locals 3
    .param p0, "directory"    # Ljava/io/File;

    .prologue
    .line 191
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 192
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 193
    .local v0, "files":[Ljava/io/File;
    if-eqz v0, :cond_1

    .line 194
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 195
    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 196
    aget-object v2, v0, v1

    invoke-static {v2}, Lcom/vk/core/util/FileUtils;->deleteDirectory(Ljava/io/File;)Z

    .line 194
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 198
    :cond_0
    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    goto :goto_1

    .line 203
    .end local v0    # "files":[Ljava/io/File;
    .end local v1    # "i":I
    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v2

    return v2
.end method

.method public static deleteFile(Ljava/io/File;)Z
    .locals 2
    .param p0, "file"    # Ljava/io/File;

    .prologue
    const/4 v0, 0x0

    .line 177
    if-nez p0, :cond_1

    .line 186
    :cond_0
    :goto_0
    return v0

    .line 180
    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 183
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 184
    invoke-static {p0}, Lcom/vk/core/util/FileUtils;->deleteDirectory(Ljava/io/File;)Z

    move-result v0

    goto :goto_0

    .line 186
    :cond_2
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v0

    goto :goto_0
.end method

.method public static deleteFile(Ljava/lang/String;)Z
    .locals 1
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 167
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static doubleTryDeleteFile(Ljava/io/File;)V
    .locals 1
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 171
    invoke-static {p0}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 172
    invoke-static {p0}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    .line 174
    :cond_0
    return-void
.end method

.method public static getDir(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    .locals 1
    .param p0, "baseFolder"    # Ljava/io/File;
    .param p1, "folderName"    # Ljava/lang/String;

    .prologue
    .line 31
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 32
    .local v0, "dir":Ljava/io/File;
    invoke-static {v0}, Lcom/vk/core/util/FileUtils;->checkFolder(Ljava/io/File;)Ljava/io/File;

    .line 33
    return-object v0
.end method

.method public static getDownloadFile(Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 77
    new-instance v0, Ljava/io/File;

    invoke-static {}, Lcom/vk/core/util/FileUtils;->getDownloadsDir()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private static getDownloadsDir()Ljava/io/File;
    .locals 2

    .prologue
    .line 57
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getVKDir()Ljava/io/File;

    move-result-object v0

    const-string/jumbo v1, "Downloads"

    invoke-static {v0, v1}, Lcom/vk/core/util/FileUtils;->getDir(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method private static getHiddenDir()Ljava/io/File;
    .locals 2

    .prologue
    .line 43
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    .line 44
    .local v0, "basePath":Ljava/io/File;
    invoke-static {v0}, Lcom/vk/core/util/FileUtils;->checkFolder(Ljava/io/File;)Ljava/io/File;

    .line 45
    const-string/jumbo v1, ".vkontakte"

    invoke-static {v0, v1}, Lcom/vk/core/util/FileUtils;->getDir(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    return-object v1
.end method

.method public static getPhotoFile()Ljava/io/File;
    .locals 6

    .prologue
    .line 61
    new-instance v0, Ljava/io/File;

    invoke-static {}, Lcom/vk/core/util/FileUtils;->getPhotosDir()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ".jpg"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getPhotoFile(Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 69
    new-instance v0, Ljava/io/File;

    invoke-static {}, Lcom/vk/core/util/FileUtils;->getPhotosDir()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ".jpg"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private static getPhotosDir()Ljava/io/File;
    .locals 2

    .prologue
    .line 49
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getVKDir()Ljava/io/File;

    move-result-object v0

    const-string/jumbo v1, "Photos"

    invoke-static {v0, v1}, Lcom/vk/core/util/FileUtils;->getDir(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static getTempAyuvFile()Ljava/io/File;
    .locals 6

    .prologue
    .line 158
    new-instance v1, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    const-string/jumbo v3, ".vkontakte"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 159
    .local v1, "outputFolder":Ljava/io/File;
    new-instance v0, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "TEMP_AYUV_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ".ayuv"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 160
    .local v0, "output":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 161
    invoke-virtual {v1}, Ljava/io/File;->mkdir()Z

    .line 163
    :cond_0
    return-object v0
.end method

.method public static getTempFile()Ljava/io/File;
    .locals 6

    .prologue
    .line 131
    new-instance v1, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    const-string/jumbo v3, ".vkontakte"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 132
    .local v1, "outputFolder":Ljava/io/File;
    new-instance v0, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "TEMP_TRIM_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ".tmp"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 133
    .local v0, "output":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 134
    invoke-virtual {v1}, Ljava/io/File;->mkdir()Z

    .line 136
    :cond_0
    return-object v0
.end method

.method public static getTempGraffitiFile()Ljava/io/File;
    .locals 6

    .prologue
    .line 149
    new-instance v1, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    const-string/jumbo v3, ".vkontakte"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 150
    .local v1, "outputFolder":Ljava/io/File;
    new-instance v0, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "GRAF_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ".png"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 151
    .local v0, "output":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 152
    invoke-virtual {v1}, Ljava/io/File;->mkdir()Z

    .line 154
    :cond_0
    return-object v0
.end method

.method public static getTempTrimVideoFile()Ljava/io/File;
    .locals 6

    .prologue
    .line 140
    new-instance v1, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    const-string/jumbo v3, ".vkontakte"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 141
    .local v1, "outputFolder":Ljava/io/File;
    new-instance v0, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "TEMP_TRIM_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ".mp4"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 142
    .local v0, "output":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 143
    invoke-virtual {v1}, Ljava/io/File;->mkdir()Z

    .line 145
    :cond_0
    return-object v0
.end method

.method public static getTempUploadAudioFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 103
    const-string/jumbo v0, "mp3"

    invoke-static {v0}, Lcom/vk/core/util/FileUtils;->getTempUploadFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static getTempUploadFile(Ljava/lang/String;)Ljava/io/File;
    .locals 1
    .param p0, "extension"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 99
    const/4 v0, 0x0

    invoke-static {v0, p0}, Lcom/vk/core/util/FileUtils;->getTempUploadFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static getTempUploadFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .param p0, "name"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "extension"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 89
    if-nez p0, :cond_0

    .line 90
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0

    .line 92
    :cond_0
    if-nez p1, :cond_1

    .line 93
    const-string/jumbo p1, "tmp"

    .line 95
    :cond_1
    new-instance v0, Ljava/io/File;

    invoke-static {}, Lcom/vk/core/util/FileUtils;->getUploadsDir()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getTempUploadJpgImageFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 107
    const-string/jumbo v0, "jpg"

    invoke-static {v0}, Lcom/vk/core/util/FileUtils;->getTempUploadFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static getTempUploadPngImageFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 111
    const-string/jumbo v0, "png"

    invoke-static {v0}, Lcom/vk/core/util/FileUtils;->getTempUploadFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static getTempUploadVideoFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 115
    const-string/jumbo v0, "mp4"

    invoke-static {v0}, Lcom/vk/core/util/FileUtils;->getTempUploadFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static getUploadsDir()Ljava/io/File;
    .locals 2

    .prologue
    .line 85
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getHiddenDir()Ljava/io/File;

    move-result-object v0

    const-string/jumbo v1, "TempUploads"

    invoke-static {v0, v1}, Lcom/vk/core/util/FileUtils;->getDir(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static getVKDir()Ljava/io/File;
    .locals 2

    .prologue
    .line 37
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    .line 38
    .local v0, "basePath":Ljava/io/File;
    invoke-static {v0}, Lcom/vk/core/util/FileUtils;->checkFolder(Ljava/io/File;)Ljava/io/File;

    .line 39
    const-string/jumbo v1, "VK"

    invoke-static {v0, v1}, Lcom/vk/core/util/FileUtils;->getDir(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    return-object v1
.end method

.method public static getVideoCacheDir()Ljava/io/File;
    .locals 2

    .prologue
    .line 81
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getHiddenDir()Ljava/io/File;

    move-result-object v0

    const-string/jumbo v1, "vcache"

    invoke-static {v0, v1}, Lcom/vk/core/util/FileUtils;->getDir(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static getVideoFile()Ljava/io/File;
    .locals 6

    .prologue
    .line 65
    new-instance v0, Ljava/io/File;

    invoke-static {}, Lcom/vk/core/util/FileUtils;->getVideosDir()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ".mp4"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getVideoFile(Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 73
    new-instance v0, Ljava/io/File;

    invoke-static {}, Lcom/vk/core/util/FileUtils;->getVideosDir()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ".mp4"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private static getVideosDir()Ljava/io/File;
    .locals 2

    .prologue
    .line 53
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getVKDir()Ljava/io/File;

    move-result-object v0

    const-string/jumbo v1, "Videos"

    invoke-static {v0, v1}, Lcom/vk/core/util/FileUtils;->getDir(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static isExist(Ljava/lang/String;)Z
    .locals 1
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 272
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static saveToFile(Ljava/io/File;[B)V
    .locals 5
    .param p0, "file"    # Ljava/io/File;
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 231
    const/4 v1, 0x0

    .line 233
    .local v1, "stream":Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 234
    .end local v1    # "stream":Ljava/io/FileOutputStream;
    .local v2, "stream":Ljava/io/FileOutputStream;
    :try_start_1
    invoke-virtual {v2, p1}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 239
    if-eqz v2, :cond_0

    .line 240
    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 246
    :cond_0
    :goto_0
    return-void

    .line 235
    .end local v2    # "stream":Ljava/io/FileOutputStream;
    .restart local v1    # "stream":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v0

    .line 236
    .local v0, "e":Ljava/lang/Exception;
    :goto_1
    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 238
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    .line 239
    :goto_2
    if-eqz v1, :cond_1

    .line 240
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 244
    :cond_1
    :goto_3
    throw v3

    .line 242
    .end local v1    # "stream":Ljava/io/FileOutputStream;
    .restart local v2    # "stream":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v3

    goto :goto_0

    .end local v2    # "stream":Ljava/io/FileOutputStream;
    .restart local v1    # "stream":Ljava/io/FileOutputStream;
    :catch_2
    move-exception v4

    goto :goto_3

    .line 238
    .end local v1    # "stream":Ljava/io/FileOutputStream;
    .restart local v2    # "stream":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v3

    move-object v1, v2

    .end local v2    # "stream":Ljava/io/FileOutputStream;
    .restart local v1    # "stream":Ljava/io/FileOutputStream;
    goto :goto_2

    .line 235
    .end local v1    # "stream":Ljava/io/FileOutputStream;
    .restart local v2    # "stream":Ljava/io/FileOutputStream;
    :catch_3
    move-exception v0

    move-object v1, v2

    .end local v2    # "stream":Ljava/io/FileOutputStream;
    .restart local v1    # "stream":Ljava/io/FileOutputStream;
    goto :goto_1
.end method

.method public static touch(Ljava/io/File;)V
    .locals 2
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 214
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 215
    .local v0, "timestamp":J
    invoke-static {p0, v0, v1}, Lcom/vk/core/util/FileUtils;->touch(Ljava/io/File;J)V

    .line 216
    return-void
.end method

.method public static touch(Ljava/io/File;J)V
    .locals 1
    .param p0, "file"    # Ljava/io/File;
    .param p1, "timestamp"    # J

    .prologue
    .line 220
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 221
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 224
    :cond_0
    invoke-virtual {p0, p1, p2}, Ljava/io/File;->setLastModified(J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 228
    :goto_0
    return-void

    .line 225
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static unzip(Ljava/io/File;Ljava/io/File;)Z
    .locals 10
    .param p0, "outputPath"    # Ljava/io/File;
    .param p1, "zip"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 318
    invoke-static {p0}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    .line 319
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_0

    .line 320
    invoke-virtual {p0}, Ljava/io/File;->mkdir()Z

    .line 323
    :cond_0
    new-instance v6, Ljava/util/zip/ZipInputStream;

    new-instance v7, Ljava/io/BufferedInputStream;

    new-instance v8, Ljava/io/FileInputStream;

    invoke-direct {v8, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v7, v8}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v6, v7}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 328
    .local v6, "zis":Ljava/util/zip/ZipInputStream;
    const/16 v7, 0x2000

    :try_start_0
    new-array v0, v7, [B

    .line 329
    .local v0, "buffer":[B
    :cond_1
    :goto_0
    invoke-virtual {v6}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v5

    .local v5, "ze":Ljava/util/zip/ZipEntry;
    if-eqz v5, :cond_5

    .line 330
    new-instance v3, Ljava/io/File;

    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, p0, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 331
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v7

    if-eqz v7, :cond_2

    move-object v2, v3

    .line 332
    .local v2, "dir":Ljava/io/File;
    :goto_1
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-nez v7, :cond_3

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v7

    if-nez v7, :cond_3

    .line 333
    new-instance v7, Ljava/io/FileNotFoundException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Failed to ensure directory: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 334
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 347
    .end local v0    # "buffer":[B
    .end local v2    # "dir":Ljava/io/File;
    .end local v3    # "file":Ljava/io/File;
    .end local v5    # "ze":Ljava/util/zip/ZipEntry;
    :catchall_0
    move-exception v7

    invoke-virtual {v6}, Ljava/util/zip/ZipInputStream;->close()V

    throw v7

    .line 331
    .restart local v0    # "buffer":[B
    .restart local v3    # "file":Ljava/io/File;
    .restart local v5    # "ze":Ljava/util/zip/ZipEntry;
    :cond_2
    :try_start_1
    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    goto :goto_1

    .line 335
    .restart local v2    # "dir":Ljava/io/File;
    :cond_3
    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v7

    if-nez v7, :cond_1

    .line 337
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 339
    .local v4, "fout":Ljava/io/FileOutputStream;
    :goto_2
    :try_start_2
    invoke-virtual {v6, v0}, Ljava/util/zip/ZipInputStream;->read([B)I

    move-result v1

    .local v1, "count":I
    const/4 v7, -0x1

    if-eq v1, v7, :cond_4

    .line 340
    const/4 v7, 0x0

    invoke-virtual {v4, v0, v7, v1}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_2

    .line 343
    .end local v1    # "count":I
    :catchall_1
    move-exception v7

    :try_start_3
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    throw v7

    .restart local v1    # "count":I
    :cond_4
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 347
    .end local v1    # "count":I
    .end local v2    # "dir":Ljava/io/File;
    .end local v3    # "file":Ljava/io/File;
    .end local v4    # "fout":Ljava/io/FileOutputStream;
    :cond_5
    invoke-virtual {v6}, Ljava/util/zip/ZipInputStream;->close()V

    .line 349
    const/4 v7, 0x1

    return v7
.end method

.method public static zip(Ljava/util/ArrayList;Ljava/io/File;)Z
    .locals 14
    .param p1, "output"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/io/File;",
            ">;",
            "Ljava/io/File;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p0, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    const/4 v7, 0x0

    .line 276
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 311
    :cond_0
    :goto_0
    return v7

    .line 279
    :cond_1
    const/4 v5, 0x0

    .line 281
    .local v5, "out":Ljava/util/zip/ZipOutputStream;
    const/16 v8, 0x400

    :try_start_0
    new-array v0, v8, [B

    .line 282
    .local v0, "buffer":[B
    new-instance v6, Ljava/util/zip/ZipOutputStream;

    new-instance v8, Ljava/io/FileOutputStream;

    invoke-direct {v8, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v6, v8}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 284
    .end local v5    # "out":Ljava/util/zip/ZipOutputStream;
    .local v6, "out":Ljava/util/zip/ZipOutputStream;
    :try_start_1
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_2
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/File;

    .line 285
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v10

    const-wide/16 v12, 0x4

    cmp-long v9, v10, v12

    if-ltz v9, :cond_2

    .line 290
    new-instance v3, Ljava/io/FileInputStream;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v3, v9}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 291
    .local v3, "fis":Ljava/io/FileInputStream;
    new-instance v9, Ljava/util/zip/ZipEntry;

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v9}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 294
    :goto_2
    invoke-virtual {v3, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v4

    .local v4, "length":I
    if-lez v4, :cond_3

    .line 295
    const/4 v9, 0x0

    invoke-virtual {v6, v0, v9, v4}, Ljava/util/zip/ZipOutputStream;->write([BII)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .line 304
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "fis":Ljava/io/FileInputStream;
    .end local v4    # "length":I
    :catch_0
    move-exception v1

    move-object v5, v6

    .line 305
    .end local v0    # "buffer":[B
    .end local v6    # "out":Ljava/util/zip/ZipOutputStream;
    .local v1, "e":Ljava/lang/Exception;
    .restart local v5    # "out":Ljava/util/zip/ZipOutputStream;
    :goto_3
    :try_start_2
    invoke-static {p1}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 308
    if-eqz v5, :cond_0

    .line 310
    :try_start_3
    invoke-virtual {v5}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    .line 311
    :catch_1
    move-exception v8

    goto :goto_0

    .line 297
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v5    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v0    # "buffer":[B
    .restart local v2    # "file":Ljava/io/File;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v4    # "length":I
    .restart local v6    # "out":Ljava/util/zip/ZipOutputStream;
    :cond_3
    :try_start_4
    invoke-virtual {v6}, Ljava/util/zip/ZipOutputStream;->closeEntry()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 308
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "fis":Ljava/io/FileInputStream;
    .end local v4    # "length":I
    :catchall_0
    move-exception v7

    move-object v5, v6

    .end local v0    # "buffer":[B
    .end local v6    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v5    # "out":Ljava/util/zip/ZipOutputStream;
    :goto_4
    if-eqz v5, :cond_4

    .line 310
    :try_start_5
    invoke-virtual {v5}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    .line 311
    :cond_4
    :goto_5
    throw v7

    .line 299
    .end local v5    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v0    # "buffer":[B
    .restart local v6    # "out":Ljava/util/zip/ZipOutputStream;
    :cond_5
    :try_start_6
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-nez v8, :cond_6

    .line 300
    invoke-static {p1}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 308
    if-eqz v6, :cond_0

    .line 310
    :try_start_7
    invoke-virtual {v6}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    goto :goto_0

    .line 311
    :catch_2
    move-exception v8

    goto :goto_0

    .line 303
    :cond_6
    const/4 v7, 0x1

    .line 308
    if-eqz v6, :cond_0

    .line 310
    :try_start_8
    invoke-virtual {v6}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    goto/16 :goto_0

    .line 311
    :catch_3
    move-exception v8

    goto/16 :goto_0

    .end local v0    # "buffer":[B
    .end local v6    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v5    # "out":Ljava/util/zip/ZipOutputStream;
    :catch_4
    move-exception v8

    goto :goto_5

    .line 308
    :catchall_1
    move-exception v7

    goto :goto_4

    .line 304
    :catch_5
    move-exception v1

    goto :goto_3
.end method
