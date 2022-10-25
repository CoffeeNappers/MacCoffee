.class public Lio/sentry/buffer/DiskBuffer;
.super Ljava/lang/Object;
.source "DiskBuffer.java"

# interfaces
.implements Lio/sentry/buffer/Buffer;


# static fields
.field public static final FILE_SUFFIX:Ljava/lang/String; = ".sentry-event"

.field private static final logger:Lorg/slf4j/Logger;


# instance fields
.field private final bufferDir:Ljava/io/File;

.field private maxEvents:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    const-class v0, Lio/sentry/buffer/DiskBuffer;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lio/sentry/buffer/DiskBuffer;->logger:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;I)V
    .locals 5
    .param p1, "bufferDir"    # Ljava/io/File;
    .param p2, "maxEvents"    # I

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lio/sentry/buffer/DiskBuffer;->bufferDir:Ljava/io/File;

    .line 41
    iput p2, p0, Lio/sentry/buffer/DiskBuffer;->maxEvents:I

    .line 43
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Could not create or write to disk buffer dir: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 45
    .local v1, "errMsg":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    .line 46
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->canWrite()Z

    move-result v2

    if-nez v2, :cond_1

    .line 47
    :cond_0
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    :catch_0
    move-exception v0

    .line 50
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 53
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    sget-object v2, Lio/sentry/buffer/DiskBuffer;->logger:Lorg/slf4j/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Lio/sentry/buffer/DiskBuffer;->getNumStoredEvents()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " stored events found in dir: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 56
    return-void
.end method

.method static synthetic access$000(Lio/sentry/buffer/DiskBuffer;Ljava/util/Iterator;)Lio/sentry/event/Event;
    .locals 1
    .param p0, "x0"    # Lio/sentry/buffer/DiskBuffer;
    .param p1, "x1"    # Ljava/util/Iterator;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lio/sentry/buffer/DiskBuffer;->getNextEvent(Ljava/util/Iterator;)Lio/sentry/event/Event;

    move-result-object v0

    return-object v0
.end method

.method private fileToEvent(Ljava/io/File;)Lio/sentry/event/Event;
    .locals 8
    .param p1, "eventFile"    # Ljava/io/File;

    .prologue
    const/4 v4, 0x0

    .line 118
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    new-instance v5, Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 119
    .local v2, "fileInputStream":Ljava/io/FileInputStream;
    new-instance v3, Ljava/io/ObjectInputStream;

    invoke-direct {v3, v2}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 120
    .local v3, "ois":Ljava/io/ObjectInputStream;
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 128
    .local v1, "eventObj":Ljava/lang/Object;
    :try_start_1
    check-cast v1, Lio/sentry/event/Event;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 132
    .end local v1    # "eventObj":Ljava/lang/Object;
    .end local v2    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v3    # "ois":Ljava/io/ObjectInputStream;
    :goto_0
    return-object v1

    .line 121
    :catch_0
    move-exception v0

    .line 122
    .local v0, "e":Ljava/lang/Exception;
    sget-object v5, Lio/sentry/buffer/DiskBuffer;->logger:Lorg/slf4j/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Error reading Event file: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 123
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-object v1, v4

    .line 124
    goto :goto_0

    .line 129
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "eventObj":Ljava/lang/Object;
    .restart local v2    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v3    # "ois":Ljava/io/ObjectInputStream;
    :catch_1
    move-exception v0

    .line 130
    .restart local v0    # "e":Ljava/lang/Exception;
    sget-object v5, Lio/sentry/buffer/DiskBuffer;->logger:Lorg/slf4j/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Error casting Object to Event: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 131
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-object v1, v4

    .line 132
    goto :goto_0
.end method

.method private getNextEvent(Ljava/util/Iterator;)Lio/sentry/event/Event;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator",
            "<",
            "Ljava/io/File;",
            ">;)",
            "Lio/sentry/event/Event;"
        }
    .end annotation

    .prologue
    .line 143
    .local p1, "files":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/io/File;>;"
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 144
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .line 147
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, ".sentry-event"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 151
    invoke-direct {p0, v1}, Lio/sentry/buffer/DiskBuffer;->fileToEvent(Ljava/io/File;)Lio/sentry/event/Event;

    move-result-object v0

    .line 152
    .local v0, "event":Lio/sentry/event/Event;
    if-eqz v0, :cond_0

    .line 157
    .end local v0    # "event":Lio/sentry/event/Event;
    .end local v1    # "file":Ljava/io/File;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getNumStoredEvents()I
    .locals 7

    .prologue
    .line 198
    const/4 v1, 0x0

    .line 199
    .local v1, "count":I
    iget-object v5, p0, Lio/sentry/buffer/DiskBuffer;->bufferDir:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .local v0, "arr$":[Ljava/io/File;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v2, v0, v3

    .line 200
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, ".sentry-event"

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 201
    add-int/lit8 v1, v1, 0x1

    .line 199
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 204
    .end local v2    # "file":Ljava/io/File;
    :cond_1
    return v1
.end method


# virtual methods
.method public add(Lio/sentry/event/Event;)V
    .locals 9
    .param p1, "event"    # Lio/sentry/event/Event;

    .prologue
    const/4 v7, 0x0

    .line 66
    invoke-direct {p0}, Lio/sentry/buffer/DiskBuffer;->getNumStoredEvents()I

    move-result v5

    iget v6, p0, Lio/sentry/buffer/DiskBuffer;->maxEvents:I

    if-lt v5, v6, :cond_0

    .line 67
    sget-object v5, Lio/sentry/buffer/DiskBuffer;->logger:Lorg/slf4j/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Not adding Event because at least "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p0, Lio/sentry/buffer/DiskBuffer;->maxEvents:I

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " events are already stored: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Lio/sentry/event/Event;->getId()Ljava/util/UUID;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 91
    :goto_0
    return-void

    .line 72
    :cond_0
    new-instance v1, Ljava/io/File;

    iget-object v5, p0, Lio/sentry/buffer/DiskBuffer;->bufferDir:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lio/sentry/event/Event;->getId()Ljava/util/UUID;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v8, ".sentry-event"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v1, v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .local v1, "eventFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 74
    sget-object v5, Lio/sentry/buffer/DiskBuffer;->logger:Lorg/slf4j/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Not adding Event to offline storage because it already exists: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->trace(Ljava/lang/String;)V

    goto :goto_0

    .line 78
    :cond_1
    sget-object v5, Lio/sentry/buffer/DiskBuffer;->logger:Lorg/slf4j/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Adding Event to offline storage: "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 81
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .local v2, "fileOutputStream":Ljava/io/FileOutputStream;
    const/4 v5, 0x0

    .line 82
    :try_start_1
    new-instance v3, Ljava/io/ObjectOutputStream;

    invoke-direct {v3, v2}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 81
    .local v3, "objectOutputStream":Ljava/io/ObjectOutputStream;
    const/4 v6, 0x0

    .line 83
    :try_start_2
    invoke-virtual {v3, p1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 84
    if-eqz v3, :cond_2

    if-eqz v7, :cond_5

    :try_start_3
    invoke-virtual {v3}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :cond_2
    :goto_1
    if-eqz v2, :cond_3

    if-eqz v7, :cond_8

    :try_start_4
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_5
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 88
    .end local v2    # "fileOutputStream":Ljava/io/FileOutputStream;
    .end local v3    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    :cond_3
    :goto_2
    sget-object v5, Lio/sentry/buffer/DiskBuffer;->logger:Lorg/slf4j/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Lio/sentry/buffer/DiskBuffer;->getNumStoredEvents()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " stored events are now in dir: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lio/sentry/buffer/DiskBuffer;->bufferDir:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 84
    .restart local v2    # "fileOutputStream":Ljava/io/FileOutputStream;
    .restart local v3    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    :catch_0
    move-exception v4

    .local v4, "x2":Ljava/lang/Throwable;
    :try_start_5
    invoke-virtual {v6, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_1

    .line 81
    .end local v3    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    .end local v4    # "x2":Ljava/lang/Throwable;
    :catch_1
    move-exception v5

    :try_start_6
    throw v5
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 84
    :catchall_0
    move-exception v6

    move-object v7, v5

    move-object v5, v6

    :goto_3
    if-eqz v2, :cond_4

    if-eqz v7, :cond_9

    :try_start_7
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_6
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    :cond_4
    :goto_4
    :try_start_8
    throw v5
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2

    .end local v2    # "fileOutputStream":Ljava/io/FileOutputStream;
    :catch_2
    move-exception v0

    .line 85
    .local v0, "e":Ljava/lang/Exception;
    sget-object v5, Lio/sentry/buffer/DiskBuffer;->logger:Lorg/slf4j/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Error writing Event to offline storage: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Lio/sentry/event/Event;->getId()Ljava/util/UUID;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 84
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "fileOutputStream":Ljava/io/FileOutputStream;
    .restart local v3    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    :cond_5
    :try_start_9
    invoke-virtual {v3}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    goto :goto_1

    .end local v3    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    :catchall_1
    move-exception v5

    goto :goto_3

    .line 81
    .restart local v3    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    :catch_3
    move-exception v6

    :try_start_a
    throw v6
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 84
    :catchall_2
    move-exception v5

    :goto_5
    if-eqz v3, :cond_6

    if-eqz v6, :cond_7

    :try_start_b
    invoke-virtual {v3}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_b
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_b} :catch_4
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    :cond_6
    :goto_6
    :try_start_c
    throw v5

    :catch_4
    move-exception v4

    .restart local v4    # "x2":Ljava/lang/Throwable;
    invoke-virtual {v6, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_6

    .end local v4    # "x2":Ljava/lang/Throwable;
    :cond_7
    invoke-virtual {v3}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_1
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    goto :goto_6

    :catch_5
    move-exception v4

    .restart local v4    # "x2":Ljava/lang/Throwable;
    :try_start_d
    invoke-virtual {v5, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_2

    .end local v4    # "x2":Ljava/lang/Throwable;
    :cond_8
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    goto :goto_2

    .end local v3    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    :catch_6
    move-exception v4

    .restart local v4    # "x2":Ljava/lang/Throwable;
    invoke-virtual {v7, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_4

    .end local v4    # "x2":Ljava/lang/Throwable;
    :cond_9
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_2

    goto :goto_4

    .restart local v3    # "objectOutputStream":Ljava/io/ObjectOutputStream;
    :catchall_3
    move-exception v5

    move-object v6, v7

    goto :goto_5
.end method

.method public discard(Lio/sentry/event/Event;)V
    .locals 4
    .param p1, "event"    # Lio/sentry/event/Event;

    .prologue
    .line 100
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lio/sentry/buffer/DiskBuffer;->bufferDir:Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lio/sentry/event/Event;->getId()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ".sentry-event"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 101
    .local v0, "eventFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 102
    sget-object v1, Lio/sentry/buffer/DiskBuffer;->logger:Lorg/slf4j/Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Discarding Event from offline storage: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 103
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 105
    :cond_0
    return-void
.end method

.method public getEvents()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lio/sentry/event/Event;",
            ">;"
        }
    .end annotation

    .prologue
    .line 173
    iget-object v1, p0, Lio/sentry/buffer/DiskBuffer;->bufferDir:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 175
    .local v0, "files":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/io/File;>;"
    new-instance v1, Lio/sentry/buffer/DiskBuffer$1;

    invoke-direct {v1, p0, v0}, Lio/sentry/buffer/DiskBuffer$1;-><init>(Lio/sentry/buffer/DiskBuffer;Ljava/util/Iterator;)V

    return-object v1
.end method
