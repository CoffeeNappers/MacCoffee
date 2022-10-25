.class public Lcom/vk/core/logging/Logcat;
.super Ljava/lang/Object;
.source "Logcat.java"


# static fields
.field private static final BUFFER_BYTES:I = 0x20000

.field private static final BUFFER_LINES:I = 0x1388

.field private static final MAX_FILE_SIZE:I = 0x200000

.field private static final TYPE_MAIN:Ljava/lang/String; = "main"

.field private static final TYPE_SYSTEM:Ljava/lang/String; = "system"

.field private static final WAIT_TIME_MS:I = 0xfa0


# instance fields
.field private archive:Ljava/io/File;

.field private collectLogs:Ljava/lang/Runnable;

.field private collecting:Z

.field private executor:Ljava/util/concurrent/ExecutorService;

.field private fileMain:Ljava/io/File;

.field private fileSystem:Ljava/io/File;

.field private logpath:Ljava/lang/String;

.field private main:Ljava/lang/StringBuilder;

.field private final object:Ljava/lang/Object;

.field private system:Ljava/lang/StringBuilder;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "logpath"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/vk/core/logging/Logcat;->object:Ljava/lang/Object;

    .line 35
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/core/logging/Logcat;->collecting:Z

    .line 36
    new-instance v0, Lcom/vk/core/logging/Logcat$1;

    invoke-direct {v0, p0}, Lcom/vk/core/logging/Logcat$1;-><init>(Lcom/vk/core/logging/Logcat;)V

    iput-object v0, p0, Lcom/vk/core/logging/Logcat;->collectLogs:Ljava/lang/Runnable;

    .line 44
    iput-object p1, p0, Lcom/vk/core/logging/Logcat;->logpath:Ljava/lang/String;

    .line 45
    invoke-direct {p0}, Lcom/vk/core/logging/Logcat;->getArchiveUploadPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/lang/String;)Z

    .line 46
    return-void
.end method

.method static synthetic access$000(Lcom/vk/core/logging/Logcat;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/logging/Logcat;

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/vk/core/logging/Logcat;->waitingForLogs()V

    return-void
.end method

.method private appendToFile(Ljava/lang/StringBuilder;Ljava/io/File;)V
    .locals 5
    .param p1, "builder"    # Ljava/lang/StringBuilder;
    .param p2, "file"    # Ljava/io/File;

    .prologue
    .line 202
    const/4 v1, 0x0

    .line 204
    .local v1, "f":Ljava/io/FileOutputStream;
    :try_start_0
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 205
    invoke-virtual {p2}, Ljava/io/File;->createNewFile()Z

    .line 208
    :cond_0
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 209
    .local v0, "bytes":[B
    new-instance v2, Ljava/io/FileOutputStream;

    const/4 v3, 0x1

    invoke-direct {v2, p2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 210
    .end local v1    # "f":Ljava/io/FileOutputStream;
    .local v2, "f":Ljava/io/FileOutputStream;
    if-eqz v2, :cond_1

    .line 211
    :try_start_1
    invoke-virtual {v2, v0}, Ljava/io/FileOutputStream;->write([B)V

    .line 212
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->flush()V

    .line 213
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 218
    :cond_1
    if-eqz v2, :cond_2

    .line 219
    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :cond_2
    move-object v1, v2

    .line 224
    .end local v0    # "bytes":[B
    .end local v2    # "f":Ljava/io/FileOutputStream;
    .restart local v1    # "f":Ljava/io/FileOutputStream;
    :cond_3
    :goto_0
    return-void

    .line 221
    .end local v1    # "f":Ljava/io/FileOutputStream;
    .restart local v0    # "bytes":[B
    .restart local v2    # "f":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v3

    move-object v1, v2

    .line 223
    .end local v2    # "f":Ljava/io/FileOutputStream;
    .restart local v1    # "f":Ljava/io/FileOutputStream;
    goto :goto_0

    .line 215
    .end local v0    # "bytes":[B
    :catch_1
    move-exception v3

    .line 218
    :goto_1
    if-eqz v1, :cond_3

    .line 219
    :try_start_3
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 221
    :catch_2
    move-exception v3

    goto :goto_0

    .line 217
    :catchall_0
    move-exception v3

    .line 218
    :goto_2
    if-eqz v1, :cond_4

    .line 219
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 222
    :cond_4
    :goto_3
    throw v3

    .line 221
    :catch_3
    move-exception v4

    goto :goto_3

    .line 217
    .end local v1    # "f":Ljava/io/FileOutputStream;
    .restart local v0    # "bytes":[B
    .restart local v2    # "f":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v3

    move-object v1, v2

    .end local v2    # "f":Ljava/io/FileOutputStream;
    .restart local v1    # "f":Ljava/io/FileOutputStream;
    goto :goto_2

    .line 215
    .end local v1    # "f":Ljava/io/FileOutputStream;
    .restart local v2    # "f":Ljava/io/FileOutputStream;
    :catch_4
    move-exception v3

    move-object v1, v2

    .end local v2    # "f":Ljava/io/FileOutputStream;
    .restart local v1    # "f":Ljava/io/FileOutputStream;
    goto :goto_1
.end method

.method private archive()Z
    .locals 8

    .prologue
    const/4 v2, 0x1

    .line 232
    new-instance v3, Ljava/io/File;

    invoke-direct {p0}, Lcom/vk/core/logging/Logcat;->getArchivePath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lcom/vk/core/logging/Logcat;->archive:Ljava/io/File;

    .line 234
    iget-object v3, p0, Lcom/vk/core/logging/Logcat;->archive:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-lez v3, :cond_1

    .line 261
    :cond_0
    :goto_0
    return v2

    .line 238
    :cond_1
    invoke-direct {p0}, Lcom/vk/core/logging/Logcat;->initPaths()V

    .line 240
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 241
    .local v1, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    iget-object v3, p0, Lcom/vk/core/logging/Logcat;->fileSystem:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 242
    iget-object v3, p0, Lcom/vk/core/logging/Logcat;->fileSystem:Ljava/io/File;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 244
    :cond_2
    iget-object v3, p0, Lcom/vk/core/logging/Logcat;->fileMain:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 245
    iget-object v3, p0, Lcom/vk/core/logging/Logcat;->fileMain:Ljava/io/File;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 247
    :cond_3
    new-instance v3, Ljava/io/File;

    iget-object v4, p0, Lcom/vk/core/logging/Logcat;->logpath:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 248
    new-instance v3, Ljava/io/File;

    iget-object v4, p0, Lcom/vk/core/logging/Logcat;->logpath:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 251
    :cond_4
    iget-object v3, p0, Lcom/vk/core/logging/Logcat;->archive:Ljava/io/File;

    invoke-static {v1, v3}, Lcom/vk/core/util/FileUtils;->zip(Ljava/util/ArrayList;Ljava/io/File;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 252
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_5
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 253
    .local v0, "f":Ljava/io/File;
    if-eqz v0, :cond_5

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 254
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    goto :goto_1

    .line 259
    .end local v0    # "f":Ljava/io/File;
    :cond_6
    iget-object v2, p0, Lcom/vk/core/logging/Logcat;->archive:Ljava/io/File;

    invoke-static {v2}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    .line 260
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vk/core/logging/Logcat;->archive:Ljava/io/File;

    .line 261
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private clear()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 137
    const/4 v0, 0x0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string/jumbo v2, "logcat"

    aput-object v2, v1, v4

    const/4 v2, 0x1

    const-string/jumbo v3, "-c"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/vk/core/logging/Logcat;->run(Ljava/lang/StringBuilder;[Ljava/lang/String;)V

    .line 138
    iget-object v0, p0, Lcom/vk/core/logging/Logcat;->main:Ljava/lang/StringBuilder;

    if-eqz v0, :cond_0

    .line 139
    iget-object v0, p0, Lcom/vk/core/logging/Logcat;->main:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 141
    :cond_0
    iget-object v0, p0, Lcom/vk/core/logging/Logcat;->system:Ljava/lang/StringBuilder;

    if-eqz v0, :cond_1

    .line 142
    iget-object v0, p0, Lcom/vk/core/logging/Logcat;->system:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 144
    :cond_1
    return-void
.end method

.method private collect(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .locals 3
    .param p1, "builder"    # Ljava/lang/StringBuilder;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 147
    if-nez p1, :cond_0

    .line 148
    new-instance p1, Ljava/lang/StringBuilder;

    .end local p1    # "builder":Ljava/lang/StringBuilder;
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 150
    .restart local p1    # "builder":Ljava/lang/StringBuilder;
    :cond_0
    const-string/jumbo v1, "\n"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    const/16 v1, 0x8

    new-array v0, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "logcat"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "-t"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const/16 v2, 0x1388

    .line 152
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "-b"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    aput-object p2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "-v"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "time"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "brief"

    aput-object v2, v0, v1

    .line 155
    .local v0, "args":[Ljava/lang/String;
    invoke-static {p1, v0}, Lcom/vk/core/logging/Logcat;->run(Ljava/lang/StringBuilder;[Ljava/lang/String;)V

    .line 156
    return-void
.end method

.method private dump()Z
    .locals 8

    .prologue
    const-wide/32 v6, 0x200000

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 123
    iget-object v4, p0, Lcom/vk/core/logging/Logcat;->fileMain:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v4

    cmp-long v4, v4, v6

    if-gez v4, :cond_4

    move v0, v2

    .line 124
    .local v0, "hasMain":Z
    :goto_0
    iget-object v4, p0, Lcom/vk/core/logging/Logcat;->fileMain:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v4

    cmp-long v4, v4, v6

    if-gez v4, :cond_5

    move v1, v2

    .line 125
    .local v1, "hasSystem":Z
    :goto_1
    if-eqz v0, :cond_0

    .line 126
    iget-object v4, p0, Lcom/vk/core/logging/Logcat;->main:Ljava/lang/StringBuilder;

    const-string/jumbo v5, "main"

    invoke-direct {p0, v4, v5}, Lcom/vk/core/logging/Logcat;->collect(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 127
    iget-object v4, p0, Lcom/vk/core/logging/Logcat;->main:Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/vk/core/logging/Logcat;->fileMain:Ljava/io/File;

    invoke-direct {p0, v4, v5}, Lcom/vk/core/logging/Logcat;->appendToFile(Ljava/lang/StringBuilder;Ljava/io/File;)V

    .line 129
    :cond_0
    if-eqz v1, :cond_1

    .line 130
    iget-object v4, p0, Lcom/vk/core/logging/Logcat;->system:Ljava/lang/StringBuilder;

    const-string/jumbo v5, "system"

    invoke-direct {p0, v4, v5}, Lcom/vk/core/logging/Logcat;->collect(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 131
    iget-object v4, p0, Lcom/vk/core/logging/Logcat;->system:Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/vk/core/logging/Logcat;->fileSystem:Ljava/io/File;

    invoke-direct {p0, v4, v5}, Lcom/vk/core/logging/Logcat;->appendToFile(Ljava/lang/StringBuilder;Ljava/io/File;)V

    .line 133
    :cond_1
    if-nez v0, :cond_2

    if-eqz v1, :cond_3

    :cond_2
    move v3, v2

    :cond_3
    return v3

    .end local v0    # "hasMain":Z
    .end local v1    # "hasSystem":Z
    :cond_4
    move v0, v3

    .line 123
    goto :goto_0

    .restart local v0    # "hasMain":Z
    :cond_5
    move v1, v3

    .line 124
    goto :goto_1
.end method

.method private getArchivePath()Ljava/lang/String;
    .locals 2

    .prologue
    .line 265
    iget-object v0, p0, Lcom/vk/core/logging/Logcat;->logpath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/vk/core/logging/Logcat;->logpath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".zip"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getArchiveUploadPath()Ljava/lang/String;
    .locals 2

    .prologue
    .line 269
    iget-object v0, p0, Lcom/vk/core/logging/Logcat;->logpath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/vk/core/logging/Logcat;->logpath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "up.zip"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private initPaths()V
    .locals 3

    .prologue
    .line 227
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/vk/core/logging/Logcat;->logpath:Ljava/lang/String;

    const-string/jumbo v2, "main"

    invoke-direct {p0, v1, v2}, Lcom/vk/core/logging/Logcat;->makePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/vk/core/logging/Logcat;->fileMain:Ljava/io/File;

    .line 228
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/vk/core/logging/Logcat;->logpath:Ljava/lang/String;

    const-string/jumbo v2, "system"

    invoke-direct {p0, v1, v2}, Lcom/vk/core/logging/Logcat;->makePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/vk/core/logging/Logcat;->fileSystem:Ljava/io/File;

    .line 229
    return-void
.end method

.method private makePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 188
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".log"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static run(Ljava/lang/StringBuilder;[Ljava/lang/String;)V
    .locals 6
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    .line 159
    if-eqz p1, :cond_0

    array-length v4, p1

    if-nez v4, :cond_1

    .line 185
    :cond_0
    :goto_0
    return-void

    .line 163
    :cond_1
    const/4 v0, 0x0

    .line 164
    .local v0, "bufReader":Ljava/io/BufferedReader;
    const/4 v3, 0x0

    .line 166
    .local v3, "process":Ljava/lang/Process;
    :try_start_0
    new-instance v4, Ljava/lang/ProcessBuilder;

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/ProcessBuilder;->command([Ljava/lang/String;)Ljava/lang/ProcessBuilder;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/ProcessBuilder;->redirectErrorStream(Z)Ljava/lang/ProcessBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;

    move-result-object v3

    .line 167
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    invoke-virtual {v3}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/high16 v5, 0x20000

    invoke-direct {v1, v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 169
    .end local v0    # "bufReader":Ljava/io/BufferedReader;
    .local v1, "bufReader":Ljava/io/BufferedReader;
    :goto_1
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .local v2, "line":Ljava/lang/String;
    if-eqz v2, :cond_3

    .line 170
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    const-string/jumbo v4, "\n"

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    .line 173
    .end local v2    # "line":Ljava/lang/String;
    :catch_0
    move-exception v4

    move-object v0, v1

    .line 175
    .end local v1    # "bufReader":Ljava/io/BufferedReader;
    .restart local v0    # "bufReader":Ljava/io/BufferedReader;
    :goto_2
    if-eqz v3, :cond_2

    .line 176
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V

    .line 178
    :cond_2
    if-eqz v0, :cond_0

    .line 180
    :try_start_2
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 181
    :catch_1
    move-exception v4

    goto :goto_0

    .line 175
    .end local v0    # "bufReader":Ljava/io/BufferedReader;
    .restart local v1    # "bufReader":Ljava/io/BufferedReader;
    .restart local v2    # "line":Ljava/lang/String;
    :cond_3
    if-eqz v3, :cond_4

    .line 176
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V

    .line 178
    :cond_4
    if-eqz v1, :cond_7

    .line 180
    :try_start_3
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    move-object v0, v1

    .line 182
    .end local v1    # "bufReader":Ljava/io/BufferedReader;
    .restart local v0    # "bufReader":Ljava/io/BufferedReader;
    goto :goto_0

    .line 181
    .end local v0    # "bufReader":Ljava/io/BufferedReader;
    .restart local v1    # "bufReader":Ljava/io/BufferedReader;
    :catch_2
    move-exception v4

    move-object v0, v1

    .line 182
    .end local v1    # "bufReader":Ljava/io/BufferedReader;
    .restart local v0    # "bufReader":Ljava/io/BufferedReader;
    goto :goto_0

    .line 175
    .end local v2    # "line":Ljava/lang/String;
    :catchall_0
    move-exception v4

    :goto_3
    if-eqz v3, :cond_5

    .line 176
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V

    .line 178
    :cond_5
    if-eqz v0, :cond_6

    .line 180
    :try_start_4
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 182
    :cond_6
    :goto_4
    throw v4

    .line 181
    :catch_3
    move-exception v5

    goto :goto_4

    .line 175
    .end local v0    # "bufReader":Ljava/io/BufferedReader;
    .restart local v1    # "bufReader":Ljava/io/BufferedReader;
    :catchall_1
    move-exception v4

    move-object v0, v1

    .end local v1    # "bufReader":Ljava/io/BufferedReader;
    .restart local v0    # "bufReader":Ljava/io/BufferedReader;
    goto :goto_3

    .line 173
    :catch_4
    move-exception v4

    goto :goto_2

    .end local v0    # "bufReader":Ljava/io/BufferedReader;
    .restart local v1    # "bufReader":Ljava/io/BufferedReader;
    .restart local v2    # "line":Ljava/lang/String;
    :cond_7
    move-object v0, v1

    .end local v1    # "bufReader":Ljava/io/BufferedReader;
    .restart local v0    # "bufReader":Ljava/io/BufferedReader;
    goto :goto_0
.end method

.method private verify(Ljava/io/File;)Z
    .locals 1
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 193
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 194
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 196
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 198
    :goto_0
    return v0

    .line 197
    :catch_0
    move-exception v0

    .line 198
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private waitingForLogs()V
    .locals 4

    .prologue
    .line 111
    :try_start_0
    iget-object v1, p0, Lcom/vk/core/logging/Logcat;->object:Ljava/lang/Object;

    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    :try_start_1
    iget-object v0, p0, Lcom/vk/core/logging/Logcat;->object:Ljava/lang/Object;

    const-wide/16 v2, 0xfa0

    invoke-virtual {v0, v2, v3}, Ljava/lang/Object;->wait(J)V

    .line 113
    invoke-direct {p0}, Lcom/vk/core/logging/Logcat;->dump()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vk/core/logging/Logcat;->collecting:Z

    if-eqz v0, :cond_0

    .line 114
    invoke-direct {p0}, Lcom/vk/core/logging/Logcat;->clear()V

    .line 115
    iget-object v0, p0, Lcom/vk/core/logging/Logcat;->executor:Ljava/util/concurrent/ExecutorService;

    iget-object v2, p0, Lcom/vk/core/logging/Logcat;->collectLogs:Ljava/lang/Runnable;

    invoke-interface {v0, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 117
    :cond_0
    monitor-exit v1

    .line 120
    :goto_0
    return-void

    .line 117
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 118
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public getDocumentUri()Ljava/lang/String;
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 93
    iget-object v3, p0, Lcom/vk/core/logging/Logcat;->archive:Ljava/io/File;

    if-eqz v3, :cond_0

    .line 94
    invoke-direct {p0}, Lcom/vk/core/logging/Logcat;->getArchivePath()Ljava/lang/String;

    move-result-object v1

    .line 95
    .local v1, "source":Ljava/lang/String;
    invoke-static {v1}, Lcom/vk/core/util/FileUtils;->isExist(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 97
    :try_start_0
    invoke-direct {p0}, Lcom/vk/core/logging/Logcat;->getArchiveUploadPath()Ljava/lang/String;

    move-result-object v0

    .line 98
    .local v0, "destination":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v3, v4}, Lcom/vk/core/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;)V

    .line 99
    invoke-static {v1}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/lang/String;)Z

    .line 100
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/vk/core/logging/Logcat;->archive:Ljava/io/File;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    .end local v0    # "destination":Ljava/lang/String;
    .end local v1    # "source":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 102
    .restart local v1    # "source":Ljava/lang/String;
    :catch_0
    move-exception v3

    .end local v1    # "source":Ljava/lang/String;
    :cond_0
    move-object v0, v2

    .line 106
    goto :goto_0
.end method

.method public start()V
    .locals 3

    .prologue
    .line 49
    iget-object v0, p0, Lcom/vk/core/logging/Logcat;->logpath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 70
    :cond_0
    :goto_0
    return-void

    .line 53
    :cond_1
    invoke-direct {p0}, Lcom/vk/core/logging/Logcat;->initPaths()V

    .line 54
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/core/logging/Logcat;->executor:Ljava/util/concurrent/ExecutorService;

    .line 56
    iget-object v0, p0, Lcom/vk/core/logging/Logcat;->fileMain:Ljava/io/File;

    invoke-direct {p0, v0}, Lcom/vk/core/logging/Logcat;->verify(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/core/logging/Logcat;->fileSystem:Ljava/io/File;

    invoke-direct {p0, v0}, Lcom/vk/core/logging/Logcat;->verify(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 60
    invoke-direct {p0}, Lcom/vk/core/logging/Logcat;->getArchivePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/lang/String;)Z

    .line 61
    invoke-direct {p0}, Lcom/vk/core/logging/Logcat;->getArchiveUploadPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/lang/String;)Z

    .line 63
    iget-object v1, p0, Lcom/vk/core/logging/Logcat;->object:Ljava/lang/Object;

    monitor-enter v1

    .line 64
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const/high16 v2, 0x20000

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/vk/core/logging/Logcat;->main:Ljava/lang/StringBuilder;

    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    const/high16 v2, 0x20000

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/vk/core/logging/Logcat;->system:Ljava/lang/StringBuilder;

    .line 67
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/core/logging/Logcat;->collecting:Z

    .line 68
    iget-object v0, p0, Lcom/vk/core/logging/Logcat;->executor:Ljava/util/concurrent/ExecutorService;

    iget-object v2, p0, Lcom/vk/core/logging/Logcat;->collectLogs:Ljava/lang/Runnable;

    invoke-interface {v0, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 69
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public stop()Z
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 73
    iget-object v1, p0, Lcom/vk/core/logging/Logcat;->logpath:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 89
    :goto_0
    return v0

    .line 77
    :cond_0
    iget-object v1, p0, Lcom/vk/core/logging/Logcat;->object:Ljava/lang/Object;

    monitor-enter v1

    .line 78
    :try_start_0
    iget-boolean v0, p0, Lcom/vk/core/logging/Logcat;->collecting:Z

    if-eqz v0, :cond_1

    .line 79
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/core/logging/Logcat;->collecting:Z

    .line 80
    iget-object v0, p0, Lcom/vk/core/logging/Logcat;->object:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/vk/core/logging/Logcat;->executor:Ljava/util/concurrent/ExecutorService;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vk/core/logging/Logcat;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->isTerminated()Z

    move-result v0

    if-nez v0, :cond_2

    .line 85
    iget-object v0, p0, Lcom/vk/core/logging/Logcat;->executor:Ljava/util/concurrent/ExecutorService;

    const-wide/16 v2, 0x1f4

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v2, v3, v4}, Ljava/util/concurrent/ExecutorService;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 88
    :cond_2
    :goto_1
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 89
    invoke-direct {p0}, Lcom/vk/core/logging/Logcat;->archive()Z

    move-result v0

    goto :goto_0

    .line 88
    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0

    .line 87
    :catch_0
    move-exception v0

    goto :goto_1
.end method
