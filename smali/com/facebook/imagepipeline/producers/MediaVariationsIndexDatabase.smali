.class public Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;
.super Ljava/lang/Object;
.source "MediaVariationsIndexDatabase.java"

# interfaces
.implements Lcom/facebook/imagepipeline/producers/MediaVariationsIndex;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$IndexDbOpenHelper;,
        Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$LazyIndexDbOpenHelper;,
        Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$IndexEntry;
    }
.end annotation


# static fields
.field private static final PROJECTION:[Ljava/lang/String;

.field private static final SQL_DELETE_ENTRIES:Ljava/lang/String; = "DROP TABLE IF EXISTS media_variations_index"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final mDbHelper:Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$LazyIndexDbOpenHelper;

.field private final mReadExecutor:Ljava/util/concurrent/Executor;

.field private final mWriteExecutor:Ljava/util/concurrent/Executor;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 37
    const-class v0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;->TAG:Ljava/lang/String;

    .line 39
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "cache_key"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "width"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "height"

    aput-object v2, v0, v1

    sput-object v0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "readExecutor"    # Ljava/util/concurrent/Executor;
    .param p3, "writeExecutor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$LazyIndexDbOpenHelper;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$LazyIndexDbOpenHelper;-><init>(Landroid/content/Context;Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$1;)V

    iput-object v0, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;->mDbHelper:Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$LazyIndexDbOpenHelper;

    .line 57
    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;->mReadExecutor:Ljava/util/concurrent/Executor;

    .line 58
    iput-object p3, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;->mWriteExecutor:Ljava/util/concurrent/Executor;

    .line 59
    return-void
.end method

.method static synthetic access$100(Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;->getCachedVariantsSync(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;)Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$LazyIndexDbOpenHelper;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;->mDbHelper:Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$LazyIndexDbOpenHelper;

    return-object v0
.end method

.method static synthetic access$300()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    sget-object v0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private declared-synchronized getCachedVariantsSync(Ljava/lang/String;)Ljava/util/List;
    .locals 14
    .param p1, "mediaId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/imagepipeline/request/MediaVariations$Variant;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    .line 79
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;->mDbHelper:Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$LazyIndexDbOpenHelper;

    invoke-virtual {v1}, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$LazyIndexDbOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v0

    .line 80
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v8, 0x0

    .line 82
    .local v8, "c":Landroid/database/Cursor;
    :try_start_1
    const-string/jumbo v3, "media_id = ?"

    .line 83
    .local v3, "selection":Ljava/lang/String;
    const/4 v1, 0x1

    new-array v4, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v4, v1

    .line 85
    .local v4, "selectionArgs":[Ljava/lang/String;
    const-string/jumbo v1, "media_variations_index"

    sget-object v2, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;->PROJECTION:[Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 94
    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I
    :try_end_1
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    if-nez v1, :cond_1

    .line 118
    if-eqz v8, :cond_0

    .line 119
    :try_start_2
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 121
    :cond_0
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 113
    :goto_0
    monitor-exit p0

    return-object v12

    .line 98
    :cond_1
    :try_start_3
    const-string/jumbo v1, "cache_key"

    .line 99
    invoke-interface {v8, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v9

    .line 100
    .local v9, "columnIndexCacheKey":I
    const-string/jumbo v1, "width"

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v11

    .line 101
    .local v11, "columnIndexWidth":I
    const-string/jumbo v1, "height"

    .line 102
    invoke-interface {v8, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v10

    .line 104
    .local v10, "columnIndexHeight":I
    new-instance v12, Ljava/util/ArrayList;

    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v1

    invoke-direct {v12, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 105
    .local v12, "variants":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/imagepipeline/request/MediaVariations$Variant;>;"
    :goto_1
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 106
    new-instance v1, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;

    .line 107
    invoke-interface {v8, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 108
    invoke-interface {v8, v11}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    .line 109
    invoke-interface {v8, v10}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    invoke-direct {v1, v2, v5, v6}, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;-><init>(Landroid/net/Uri;II)V

    .line 106
    invoke-interface {v12, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Landroid/database/SQLException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 114
    .end local v3    # "selection":Ljava/lang/String;
    .end local v4    # "selectionArgs":[Ljava/lang/String;
    .end local v9    # "columnIndexCacheKey":I
    .end local v10    # "columnIndexHeight":I
    .end local v11    # "columnIndexWidth":I
    .end local v12    # "variants":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/imagepipeline/request/MediaVariations$Variant;>;"
    :catch_0
    move-exception v13

    .line 115
    .local v13, "x":Landroid/database/SQLException;
    :try_start_4
    sget-object v1, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "Error reading for %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-static {v1, v13, v2, v5}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 116
    throw v13
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 118
    .end local v13    # "x":Landroid/database/SQLException;
    :catchall_0
    move-exception v1

    if-eqz v8, :cond_2

    .line 119
    :try_start_5
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 121
    :cond_2
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    throw v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 79
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .end local v8    # "c":Landroid/database/Cursor;
    :catchall_1
    move-exception v1

    monitor-exit p0

    throw v1

    .line 118
    .restart local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .restart local v3    # "selection":Ljava/lang/String;
    .restart local v4    # "selectionArgs":[Ljava/lang/String;
    .restart local v8    # "c":Landroid/database/Cursor;
    .restart local v9    # "columnIndexCacheKey":I
    .restart local v10    # "columnIndexHeight":I
    .restart local v11    # "columnIndexWidth":I
    .restart local v12    # "variants":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/imagepipeline/request/MediaVariations$Variant;>;"
    :cond_3
    if-eqz v8, :cond_4

    .line 119
    :try_start_6
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 121
    :cond_4
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_0
.end method


# virtual methods
.method public getCachedVariants(Ljava/lang/String;)Lbolts/Task;
    .locals 5
    .param p1, "mediaId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lbolts/Task",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/imagepipeline/request/MediaVariations$Variant;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 64
    :try_start_0
    new-instance v1, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$1;

    invoke-direct {v1, p0, p1}, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$1;-><init>(Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;->mReadExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v1, v2}, Lbolts/Task;->call(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)Lbolts/Task;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 74
    :goto_0
    return-object v1

    .line 72
    :catch_0
    move-exception v0

    .line 73
    .local v0, "exception":Ljava/lang/Exception;
    sget-object v1, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "Failed to schedule query task for %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v1, v0, v2, v3}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 74
    invoke-static {v0}, Lbolts/Task;->forError(Ljava/lang/Exception;)Lbolts/Task;

    move-result-object v1

    goto :goto_0
.end method

.method public saveCachedVariant(Ljava/lang/String;Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)V
    .locals 2
    .param p1, "mediaId"    # Ljava/lang/String;
    .param p2, "cacheKey"    # Lcom/facebook/cache/common/CacheKey;
    .param p3, "encodedImage"    # Lcom/facebook/imagepipeline/image/EncodedImage;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;->mWriteExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$2;

    invoke-direct {v1, p0, p1, p3, p2}, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$2;-><init>(Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;Ljava/lang/String;Lcom/facebook/imagepipeline/image/EncodedImage;Lcom/facebook/cache/common/CacheKey;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 155
    return-void
.end method
