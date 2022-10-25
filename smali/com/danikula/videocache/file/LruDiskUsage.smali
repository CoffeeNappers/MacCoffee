.class abstract Lcom/danikula/videocache/file/LruDiskUsage;
.super Ljava/lang/Object;
.source "LruDiskUsage.java"

# interfaces
.implements Lcom/danikula/videocache/file/DiskUsage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/danikula/videocache/file/LruDiskUsage$TouchCallable;
    }
.end annotation


# static fields
.field private static final LOG:Lorg/slf4j/Logger;


# instance fields
.field private final workerThread:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const-string/jumbo v0, "LruDiskUsage"

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/String;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/danikula/videocache/file/LruDiskUsage;->LOG:Lorg/slf4j/Logger;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/danikula/videocache/file/LruDiskUsage;->workerThread:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method static synthetic access$000(Lcom/danikula/videocache/file/LruDiskUsage;Ljava/io/File;)V
    .locals 0
    .param p0, "x0"    # Lcom/danikula/videocache/file/LruDiskUsage;
    .param p1, "x1"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lcom/danikula/videocache/file/LruDiskUsage;->touchInBackground(Ljava/io/File;)V

    return-void
.end method

.method private countTotalSize(Ljava/util/List;)J
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;)J"
        }
    .end annotation

    .prologue
    .line 56
    .local p1, "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    const-wide/16 v2, 0x0

    .line 57
    .local v2, "totalSize":J
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 58
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    add-long/2addr v2, v4

    .line 59
    goto :goto_0

    .line 60
    .end local v0    # "file":Ljava/io/File;
    :cond_0
    return-wide v2
.end method

.method private touchInBackground(Ljava/io/File;)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 29
    invoke-static {p1}, Lcom/danikula/videocache/file/Files;->setLastModifiedNow(Ljava/io/File;)V

    .line 30
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    invoke-static {v1}, Lcom/danikula/videocache/file/Files;->getLruListFiles(Ljava/io/File;)Ljava/util/List;

    move-result-object v0

    .line 31
    .local v0, "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    invoke-direct {p0, v0}, Lcom/danikula/videocache/file/LruDiskUsage;->trim(Ljava/util/List;)V

    .line 32
    return-void
.end method

.method private trim(Ljava/util/List;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 37
    .local p1, "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    invoke-direct {p0, p1}, Lcom/danikula/videocache/file/LruDiskUsage;->countTotalSize(Ljava/util/List;)J

    move-result-wide v6

    .line 38
    .local v6, "totalSize":J
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    .line 39
    .local v3, "totalCount":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/File;

    .line 40
    .local v2, "file":Ljava/io/File;
    invoke-virtual {p0, v2, v6, v7, v3}, Lcom/danikula/videocache/file/LruDiskUsage;->accept(Ljava/io/File;JI)Z

    move-result v0

    .line 41
    .local v0, "accepted":Z
    if-nez v0, :cond_0

    .line 42
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 43
    .local v4, "fileSize":J
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v1

    .line 44
    .local v1, "deleted":Z
    if-eqz v1, :cond_1

    .line 45
    add-int/lit8 v3, v3, -0x1

    .line 46
    sub-long/2addr v6, v4

    .line 47
    sget-object v9, Lcom/danikula/videocache/file/LruDiskUsage;->LOG:Lorg/slf4j/Logger;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Cache file "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, " is deleted because it exceeds cache limit"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    goto :goto_0

    .line 49
    :cond_1
    sget-object v9, Lcom/danikula/videocache/file/LruDiskUsage;->LOG:Lorg/slf4j/Logger;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Error deleting file "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, " for trimming cache"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    goto :goto_0

    .line 53
    .end local v0    # "accepted":Z
    .end local v1    # "deleted":Z
    .end local v2    # "file":Ljava/io/File;
    .end local v4    # "fileSize":J
    :cond_2
    return-void
.end method


# virtual methods
.method protected abstract accept(Ljava/io/File;JI)Z
.end method

.method public touch(Ljava/io/File;)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 25
    iget-object v0, p0, Lcom/danikula/videocache/file/LruDiskUsage;->workerThread:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/danikula/videocache/file/LruDiskUsage$TouchCallable;

    invoke-direct {v1, p0, p1}, Lcom/danikula/videocache/file/LruDiskUsage$TouchCallable;-><init>(Lcom/danikula/videocache/file/LruDiskUsage;Ljava/io/File;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 26
    return-void
.end method
