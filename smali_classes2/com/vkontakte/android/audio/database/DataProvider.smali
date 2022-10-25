.class public abstract Lcom/vkontakte/android/audio/database/DataProvider;
.super Ljava/lang/Object;
.source "DataProvider.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/vkontakte/android/audio/database/DataObject",
        "<*>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private mAllLoaded:Z

.field private final mCache:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/Long;",
            "TT;>;"
        }
    .end annotation
.end field

.field private final mTableName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "tableName"    # Ljava/lang/String;
    .param p2, "useCache"    # Z

    .prologue
    .line 20
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/vkontakte/android/audio/database/DataProvider;->mTableName:Ljava/lang/String;

    .line 22
    if-eqz p2, :cond_0

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    :goto_0
    iput-object v0, p0, Lcom/vkontakte/android/audio/database/DataProvider;->mCache:Ljava/util/concurrent/ConcurrentHashMap;

    .line 23
    return-void

    .line 22
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getAllFromCache(Z)Ljava/util/Collection;
    .locals 2
    .param p1, "unmodifiable"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/Collection",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    const/4 v0, 0x0

    .line 365
    invoke-direct {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->isUseCache()Z

    move-result v1

    if-nez v1, :cond_1

    .line 375
    :cond_0
    :goto_0
    return-object v0

    .line 369
    :cond_1
    monitor-enter p0

    .line 370
    :try_start_0
    iget-boolean v1, p0, Lcom/vkontakte/android/audio/database/DataProvider;->mAllLoaded:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/vkontakte/android/audio/database/DataProvider;->mCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    .line 371
    .local v0, "result":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    :cond_2
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 372
    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 373
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    goto :goto_0

    .line 371
    .end local v0    # "result":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private getFromCache(J)Lcom/vkontakte/android/audio/database/DataObject;
    .locals 3
    .param p1, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TT;"
        }
    .end annotation

    .prologue
    .line 355
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    invoke-direct {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->isUseCache()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/audio/database/DataProvider;->mCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/database/DataObject;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isUseCache()Z
    .locals 1

    .prologue
    .line 351
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/audio/database/DataProvider;->mCache:Ljava/util/concurrent/ConcurrentHashMap;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private loadListByQuery(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 12
    .param p1, "distinct"    # Z
    .param p2, "where"    # Ljava/lang/String;
    .param p3, "whereArgs"    # [Ljava/lang/String;
    .param p4, "groupBy"    # Ljava/lang/String;
    .param p5, "orderBy"    # Ljava/lang/String;
    .param p6, "limit"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 311
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iget-object v2, p0, Lcom/vkontakte/android/audio/database/DataProvider;->mTableName:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->getProjection()[Ljava/lang/String;

    move-result-object v3

    const/4 v7, 0x0

    move v1, p1

    move-object v4, p2

    move-object v5, p3

    move-object/from16 v6, p4

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    invoke-virtual/range {v0 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 313
    .local v10, "cursor":Landroid/database/Cursor;
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 314
    :try_start_1
    invoke-virtual {p0, v10}, Lcom/vkontakte/android/audio/database/DataProvider;->getListByCursor(Landroid/database/Cursor;)Ljava/util/ArrayList;

    move-result-object v11

    .line 315
    .local v11, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TT;>;"
    invoke-direct {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->isUseCache()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 316
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/database/DataProvider;->mAllLoaded:Z

    .line 318
    :cond_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 321
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    return-object v11

    .line 319
    .end local v11    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TT;>;"
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 321
    :catchall_1
    move-exception v0

    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method private removeFromCache(J)V
    .locals 1
    .param p1, "id"    # J

    .prologue
    .line 359
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/audio/database/DataProvider;->getFromCache(J)Lcom/vkontakte/android/audio/database/DataObject;

    move-result-object v0

    .line 360
    .local v0, "object":Lcom/vkontakte/android/audio/database/DataObject;, "TT;"
    if-eqz v0, :cond_0

    .line 361
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/audio/database/DataProvider;->removeFromCache(Lcom/vkontakte/android/audio/database/DataObject;)V

    .line 362
    :cond_0
    return-void
.end method


# virtual methods
.method public clearCache()V
    .locals 1

    .prologue
    .line 328
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    invoke-direct {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->isUseCache()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 329
    monitor-enter p0

    .line 330
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/database/DataProvider;->mCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 331
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/database/DataProvider;->mAllLoaded:Z

    .line 332
    monitor-exit p0

    .line 334
    :cond_0
    return-void

    .line 332
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected abstract createNew()Lcom/vkontakte/android/audio/database/DataObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public getAll()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    const/4 v0, 0x0

    .line 177
    invoke-virtual {p0, v0, v0}, Lcom/vkontakte/android/audio/database/DataProvider;->getCollectionByQuery(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method protected getByCursor(Landroid/database/Cursor;)Lcom/vkontakte/android/audio/database/DataObject;
    .locals 4
    .param p1, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 201
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    const/4 v3, 0x0

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 203
    .local v0, "id":J
    invoke-direct {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->isUseCache()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 204
    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/audio/database/DataProvider;->getFromCache(J)Lcom/vkontakte/android/audio/database/DataObject;

    move-result-object v2

    .line 205
    .local v2, "object":Lcom/vkontakte/android/audio/database/DataObject;, "TT;"
    if-nez v2, :cond_1

    .line 206
    monitor-enter p0

    .line 207
    :try_start_0
    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/audio/database/DataProvider;->getFromCache(J)Lcom/vkontakte/android/audio/database/DataObject;

    move-result-object v2

    .line 208
    if-nez v2, :cond_0

    .line 209
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->createNew()Lcom/vkontakte/android/audio/database/DataObject;

    move-result-object v2

    .line 210
    invoke-virtual {v2, p1}, Lcom/vkontakte/android/audio/database/DataObject;->loadFromCursor(Landroid/database/Cursor;)V

    .line 211
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/audio/database/DataProvider;->putToCache(Lcom/vkontakte/android/audio/database/DataObject;)V

    .line 213
    :cond_0
    monitor-exit p0

    .line 220
    :cond_1
    :goto_0
    return-object v2

    .line 213
    :catchall_0
    move-exception v3

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 216
    .end local v2    # "object":Lcom/vkontakte/android/audio/database/DataObject;, "TT;"
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->createNew()Lcom/vkontakte/android/audio/database/DataObject;

    move-result-object v2

    .line 217
    .restart local v2    # "object":Lcom/vkontakte/android/audio/database/DataObject;, "TT;"
    invoke-virtual {v2, p1}, Lcom/vkontakte/android/audio/database/DataObject;->loadFromCursor(Landroid/database/Cursor;)V

    goto :goto_0
.end method

.method public getById(J)Lcom/vkontakte/android/audio/database/DataObject;
    .locals 5
    .param p1, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TT;"
        }
    .end annotation

    .prologue
    .line 164
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/audio/database/DataProvider;->getFromCache(J)Lcom/vkontakte/android/audio/database/DataObject;

    move-result-object v0

    .line 165
    .local v0, "object":Lcom/vkontakte/android/audio/database/DataObject;, "TT;"
    if-eqz v0, :cond_0

    .line 168
    .end local v0    # "object":Lcom/vkontakte/android/audio/database/DataObject;, "TT;"
    :goto_0
    return-object v0

    .restart local v0    # "object":Lcom/vkontakte/android/audio/database/DataObject;, "TT;"
    :cond_0
    const-string/jumbo v1, "_id = ?"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/audio/database/DataProvider;->getByQuery(Ljava/lang/String;[Ljava/lang/String;)Lcom/vkontakte/android/audio/database/DataObject;

    move-result-object v0

    goto :goto_0
.end method

.method protected getByQuery(Ljava/lang/String;[Ljava/lang/String;)Lcom/vkontakte/android/audio/database/DataObject;
    .locals 10
    .param p1, "where"    # Ljava/lang/String;
    .param p2, "whereArgs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    const/4 v5, 0x0

    .line 233
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/database/DataProvider;->mTableName:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->getProjection()[Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v8, "1"

    move-object v3, p1

    move-object v4, p2

    move-object v6, v5

    move-object v7, v5

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 235
    .local v9, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, v9}, Lcom/vkontakte/android/audio/database/DataProvider;->getByCursor(Landroid/database/Cursor;)Lcom/vkontakte/android/audio/database/DataObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v5

    .line 237
    :cond_0
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    return-object v5

    :catchall_0
    move-exception v0

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method protected getCacheCount()I
    .locals 1

    .prologue
    .line 347
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    invoke-direct {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->isUseCache()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/audio/database/DataProvider;->mAllLoaded:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/audio/database/DataProvider;->mCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method protected getCollectionByQuery(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/Collection;
    .locals 8
    .param p1, "where"    # Ljava/lang/String;
    .param p2, "whereArgs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Collection",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    const/4 v4, 0x0

    .line 249
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/database/DataProvider;->getAllFromCache(Z)Ljava/util/Collection;

    move-result-object v7

    .line 250
    .local v7, "result":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    :goto_0
    if-eqz v7, :cond_1

    .line 253
    .end local v7    # "result":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    :goto_1
    return-object v7

    :cond_0
    move-object v7, v4

    .line 249
    goto :goto_0

    .line 253
    .restart local v7    # "result":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    :cond_1
    const/4 v1, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, v4

    move-object v6, v4

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/audio/database/DataProvider;->loadListByQuery(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v7

    goto :goto_1
.end method

.method public getCount()I
    .locals 13

    .prologue
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    const/4 v1, 0x0

    const/4 v4, 0x0

    .line 181
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->getCacheCount()I

    move-result v10

    .line 182
    .local v10, "count":I
    if-ltz v10, :cond_0

    move v11, v10

    .line 190
    .end local v10    # "count":I
    .local v11, "count":I
    :goto_0
    return v11

    .line 185
    .end local v11    # "count":I
    .restart local v10    # "count":I
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iget-object v2, p0, Lcom/vkontakte/android/audio/database/DataProvider;->mTableName:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const-string/jumbo v5, "count(1)"

    aput-object v5, v3, v1

    move-object v5, v4

    move-object v6, v4

    move-object v7, v4

    move-object v8, v4

    move-object v9, v4

    invoke-virtual/range {v0 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v12

    .line 186
    .local v12, "cursor":Landroid/database/Cursor;
    if-eqz v12, :cond_1

    invoke-interface {v12}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 187
    invoke-interface {v12, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    .line 188
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    :cond_1
    move v11, v10

    .line 190
    .end local v10    # "count":I
    .restart local v11    # "count":I
    goto :goto_0
.end method

.method protected abstract getDatabase()Landroid/database/sqlite/SQLiteDatabase;
.end method

.method protected getListByCursor(Landroid/database/Cursor;)Ljava/util/ArrayList;
    .locals 2
    .param p1, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/ArrayList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 294
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 295
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TT;>;"
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 297
    :cond_0
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/database/DataProvider;->getByCursor(Landroid/database/Cursor;)Lcom/vkontakte/android/audio/database/DataObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 298
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 301
    :cond_1
    return-object v0
.end method

.method protected getListByQuery(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 7
    .param p1, "where"    # Ljava/lang/String;
    .param p2, "whereArgs"    # [Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    const/4 v4, 0x0

    .line 284
    const/4 v1, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    move-object v6, v4

    invoke-virtual/range {v0 .. v6}, Lcom/vkontakte/android/audio/database/DataProvider;->getListByQuery(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method protected getListByQuery(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 2
    .param p1, "distinct"    # Z
    .param p2, "where"    # Ljava/lang/String;
    .param p3, "whereArgs"    # [Ljava/lang/String;
    .param p4, "groupBy"    # Ljava/lang/String;
    .param p5, "orderBy"    # Ljava/lang/String;
    .param p6, "limit"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 268
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    if-nez p1, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/vkontakte/android/audio/database/DataProvider;->getAllFromCache(Z)Ljava/util/Collection;

    move-result-object v0

    .line 269
    .local v0, "result":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    :goto_0
    if-eqz v0, :cond_1

    .line 270
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 272
    :goto_1
    return-object v1

    .line 268
    .end local v0    # "result":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 272
    .restart local v0    # "result":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    :cond_1
    invoke-direct/range {p0 .. p6}, Lcom/vkontakte/android/audio/database/DataProvider;->loadListByQuery(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    goto :goto_1
.end method

.method protected abstract getProjection()[Ljava/lang/String;
.end method

.method public getTableName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 31
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/audio/database/DataProvider;->mTableName:Ljava/lang/String;

    return-object v0
.end method

.method protected onTableModified()V
    .locals 0

    .prologue
    .line 308
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    return-void
.end method

.method protected putToCache(Lcom/vkontakte/android/audio/database/DataObject;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 337
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    .local p1, "object":Lcom/vkontakte/android/audio/database/DataObject;, "TT;"
    invoke-direct {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->isUseCache()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 338
    iget-object v0, p0, Lcom/vkontakte/android/audio/database/DataProvider;->mCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/database/DataObject;->getId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    :cond_0
    return-void
.end method

.method public remove(J)Z
    .locals 7
    .param p1, "id"    # J

    .prologue
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 110
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-gtz v2, :cond_0

    .line 118
    :goto_0
    return v1

    .line 113
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/audio/database/DataProvider;->mTableName:Ljava/lang/String;

    const-string/jumbo v4, "_id = ?"

    new-array v5, v0, [Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_2

    .line 114
    .local v0, "result":Z
    :goto_1
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/audio/database/DataProvider;->removeFromCache(J)V

    .line 115
    if-eqz v0, :cond_1

    .line 116
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->onTableModified()V

    :cond_1
    move v1, v0

    .line 118
    goto :goto_0

    .end local v0    # "result":Z
    :cond_2
    move v0, v1

    .line 113
    goto :goto_1
.end method

.method public remove(Lcom/vkontakte/android/audio/database/DataObject;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 128
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    .local p1, "object":Lcom/vkontakte/android/audio/database/DataObject;, "TT;"
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/database/DataObject;->getId()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/audio/database/DataProvider;->remove(J)Z

    move-result v0

    return v0
.end method

.method public remove(Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 3
    .param p1, "where"    # Ljava/lang/String;
    .param p2, "whereArgs"    # [Ljava/lang/String;

    .prologue
    .line 139
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->clearCache()V

    .line 141
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/audio/database/DataProvider;->mTableName:Ljava/lang/String;

    invoke-virtual {v1, v2, p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_1

    const/4 v0, 0x1

    .line 142
    .local v0, "result":Z
    :goto_0
    if-eqz v0, :cond_0

    .line 143
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->onTableModified()V

    .line 145
    :cond_0
    return v0

    .line 141
    .end local v0    # "result":Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public removeAll()Z
    .locals 1

    .prologue
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    const/4 v0, 0x0

    .line 154
    invoke-virtual {p0, v0, v0}, Lcom/vkontakte/android/audio/database/DataProvider;->remove(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected removeFromCache(Lcom/vkontakte/android/audio/database/DataObject;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 342
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    .local p1, "object":Lcom/vkontakte/android/audio/database/DataObject;, "TT;"
    invoke-direct {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->isUseCache()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 343
    iget-object v0, p0, Lcom/vkontakte/android/audio/database/DataProvider;->mCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/database/DataObject;->getId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 344
    :cond_0
    return-void
.end method

.method public save(Lcom/vkontakte/android/audio/database/DataObject;)Z
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    .local p1, "object":Lcom/vkontakte/android/audio/database/DataObject;, "TT;"
    const/4 v4, 0x0

    const/4 v1, 0x1

    .line 57
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 58
    .local v0, "contentValues":Landroid/content/ContentValues;
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/audio/database/DataObject;->fillContentValues(Landroid/content/ContentValues;)V

    .line 59
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/database/DataObject;->getId()J

    move-result-wide v2

    .line 60
    .local v2, "id":J
    const-wide/16 v6, 0x0

    cmp-long v5, v2, v6

    if-lez v5, :cond_0

    .line 61
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    iget-object v6, p0, Lcom/vkontakte/android/audio/database/DataProvider;->mTableName:Ljava/lang/String;

    const-string/jumbo v7, "_id = ?"

    new-array v8, v1, [Ljava/lang/String;

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v4

    invoke-virtual {v5, v6, v0, v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v5

    if-lez v5, :cond_1

    .line 62
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/database/DataProvider;->putToCache(Lcom/vkontakte/android/audio/database/DataObject;)V

    .line 63
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->onTableModified()V

    .line 78
    :goto_0
    return v1

    .line 68
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    iget-object v6, p0, Lcom/vkontakte/android/audio/database/DataProvider;->mTableName:Ljava/lang/String;

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v2

    .line 69
    const-wide/16 v6, -0x1

    cmp-long v5, v2, v6

    if-eqz v5, :cond_1

    .line 70
    invoke-virtual {p1, v2, v3}, Lcom/vkontakte/android/audio/database/DataObject;->setId(J)V

    .line 71
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/database/DataProvider;->putToCache(Lcom/vkontakte/android/audio/database/DataObject;)V

    .line 72
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->onTableModified()V

    goto :goto_0

    :cond_1
    move v1, v4

    .line 78
    goto :goto_0
.end method

.method public update(Lcom/vkontakte/android/audio/database/DataObject;)Z
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<TT;>;"
    .local p1, "object":Lcom/vkontakte/android/audio/database/DataObject;, "TT;"
    const/4 v1, 0x1

    const/4 v4, 0x0

    .line 88
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 89
    .local v0, "contentValues":Landroid/content/ContentValues;
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/audio/database/DataObject;->fillContentValues(Landroid/content/ContentValues;)V

    .line 90
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/database/DataObject;->getId()J

    move-result-wide v2

    .line 91
    .local v2, "id":J
    const-wide/16 v6, 0x0

    cmp-long v5, v2, v6

    if-lez v5, :cond_0

    .line 92
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    iget-object v6, p0, Lcom/vkontakte/android/audio/database/DataProvider;->mTableName:Ljava/lang/String;

    const-string/jumbo v7, "_id = ?"

    new-array v8, v1, [Ljava/lang/String;

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v4

    invoke-virtual {v5, v6, v0, v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v5

    if-lez v5, :cond_0

    .line 93
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/database/DataProvider;->putToCache(Lcom/vkontakte/android/audio/database/DataObject;)V

    .line 94
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/database/DataProvider;->onTableModified()V

    .line 100
    :goto_0
    return v1

    :cond_0
    move v1, v4

    goto :goto_0
.end method
