.class public Lcom/vkontakte/android/statistics/SentTable;
.super Ljava/lang/Object;
.source "SentTable.java"


# static fields
.field public static final COLUMN_KEY:Ljava/lang/String; = "key"

.field public static final TABLE:Ljava/lang/String; = "sent_statistics"

.field static volatile keysSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static final lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    sput-object v0, Lcom/vkontakte/android/statistics/SentTable;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 14
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/statistics/SentTable;->keysSet:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static addSent(Ljava/lang/String;)V
    .locals 3
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 42
    sget-object v0, Lcom/vkontakte/android/statistics/SentTable;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 44
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/vkontakte/android/data/db/Database;->getInst(Landroid/content/Context;)Lcom/vkontakte/android/data/db/Database;

    move-result-object v0

    const/16 v1, 0x2710

    const/16 v2, 0x64

    invoke-virtual {v0, p0, v1, v2}, Lcom/vkontakte/android/data/db/Database;->addSentStatisticsAndDropOldValues(Ljava/lang/String;II)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/vkontakte/android/statistics/SentTable;->keysSet:Ljava/util/Set;

    if-eqz v0, :cond_0

    .line 46
    sget-object v0, Lcom/vkontakte/android/statistics/SentTable;->keysSet:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    :cond_0
    sget-object v0, Lcom/vkontakte/android/statistics/SentTable;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 51
    return-void

    .line 49
    :catchall_0
    move-exception v0

    sget-object v1, Lcom/vkontakte/android/statistics/SentTable;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw v0
.end method

.method public static createSql()Ljava/lang/String;
    .locals 2

    .prologue
    .line 21
    new-instance v0, Lcom/vkontakte/android/data/db/Table;

    const-string/jumbo v1, "sent_statistics"

    invoke-direct {v0, v1}, Lcom/vkontakte/android/data/db/Table;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "_id"

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table;->withIntegerColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/db/Table$Column;->setPrimaryKey()Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/db/Table$Column;->setAutoincrement()Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "key"

    .line 22
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withTextColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lcom/vkontakte/android/data/db/Table$Column;->createSql()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static init()V
    .locals 2

    .prologue
    .line 29
    sget-object v0, Lcom/vkontakte/android/statistics/SentTable;->keysSet:Ljava/util/Set;

    if-nez v0, :cond_1

    .line 30
    sget-object v0, Lcom/vkontakte/android/statistics/SentTable;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 32
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/statistics/SentTable;->keysSet:Ljava/util/Set;

    if-nez v0, :cond_0

    .line 33
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/vkontakte/android/data/db/Database;->getInst(Landroid/content/Context;)Lcom/vkontakte/android/data/db/Database;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/db/Database;->getSentStatistics()Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/statistics/SentTable;->keysSet:Ljava/util/Set;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    :cond_0
    sget-object v0, Lcom/vkontakte/android/statistics/SentTable;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 39
    :cond_1
    return-void

    .line 36
    :catchall_0
    move-exception v0

    sget-object v1, Lcom/vkontakte/android/statistics/SentTable;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw v0
.end method

.method static isSent(Ljava/lang/String;)Z
    .locals 2
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-static {}, Lcom/vkontakte/android/statistics/SentTable;->init()V

    .line 55
    sget-object v0, Lcom/vkontakte/android/statistics/SentTable;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 57
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/statistics/SentTable;->keysSet:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 59
    sget-object v1, Lcom/vkontakte/android/statistics/SentTable;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    return v0

    :catchall_0
    move-exception v0

    sget-object v1, Lcom/vkontakte/android/statistics/SentTable;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw v0
.end method
