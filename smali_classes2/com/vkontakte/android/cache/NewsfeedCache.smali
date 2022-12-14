.class public Lcom/vkontakte/android/cache/NewsfeedCache;
.super Ljava/lang/Object;
.source "NewsfeedCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/cache/NewsfeedCache$CacheOpenHelper;
    }
.end annotation


# static fields
.field private static final INCREMENT_ORDER_PREFIX:Ljava/lang/String; = "UPDATE news SET order_position = order_position + "

.field private static final INCREMENT_ORDER_SUFFIX:Ljava/lang/String; = " WHERE order_position >= 0"

.field private static isNewsfeedTop:Ljava/lang/Boolean;

.field private static semaphore:Ljava/util/concurrent/Semaphore;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 86
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    sput-object v0, Lcom/vkontakte/android/cache/NewsfeedCache;->semaphore:Ljava/util/concurrent/Semaphore;

    .line 87
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/cache/NewsfeedCache;->isNewsfeedTop:Ljava/lang/Boolean;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addToTop(Lcom/vkontakte/android/NewsEntry;)V
    .locals 6
    .param p0, "entry"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    const/4 v5, 0x0

    .line 180
    :try_start_0
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string/jumbo v3, "feed_list"

    const/4 v4, 0x0

    .line 181
    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_0

    .line 191
    :goto_0
    return-void

    .line 184
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 185
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string/jumbo v2, "UPDATE news SET order_position = order_position + 1 WHERE order_position >= 0"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 186
    const/4 v2, 0x0

    iput v2, p0, Lcom/vkontakte/android/NewsEntry;->order_position:I

    .line 187
    const-string/jumbo v2, "news"

    invoke-virtual {p0, v0, v2}, Lcom/vkontakte/android/NewsEntry;->writeToSQLite(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 188
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :catch_0
    move-exception v1

    .line 189
    .local v1, "x":Ljava/lang/Exception;
    new-array v2, v5, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static addToTop(Ljava/util/Collection;)V
    .locals 6
    .param p0    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 194
    .local p0, "entries":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/NewsEntry;>;"
    if-nez p0, :cond_0

    .line 215
    :goto_0
    return-void

    .line 198
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 199
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "UPDATE news SET order_position = order_position + "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " WHERE order_position >= 0"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 200
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 202
    const/4 v2, 0x0

    .line 203
    .local v2, "i":I
    :try_start_1
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/NewsEntry;

    .line 204
    .local v1, "entry":Lcom/vkontakte/android/NewsEntry;
    iget v4, v1, Lcom/vkontakte/android/NewsEntry;->order_position:I

    if-ltz v4, :cond_1

    move v4, v2

    :goto_2
    iput v4, v1, Lcom/vkontakte/android/NewsEntry;->order_position:I

    .line 205
    const-string/jumbo v4, "news"

    invoke-virtual {v1, v0, v4}, Lcom/vkontakte/android/NewsEntry;->writeToSQLite(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 206
    add-int/lit8 v2, v2, 0x1

    .line 207
    goto :goto_1

    .line 204
    :cond_1
    iget v4, v1, Lcom/vkontakte/android/NewsEntry;->order_position:I

    goto :goto_2

    .line 208
    .end local v1    # "entry":Lcom/vkontakte/android/NewsEntry;
    :cond_2
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 210
    :try_start_2
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 212
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .end local v2    # "i":I
    :catch_0
    move-exception v3

    .line 213
    .local v3, "x":Ljava/lang/Exception;
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v3, v4}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0

    .line 210
    .end local v3    # "x":Ljava/lang/Exception;
    .restart local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .restart local v2    # "i":I
    :catchall_0
    move-exception v4

    :try_start_3
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v4
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
.end method

.method public static clear()V
    .locals 1

    .prologue
    .line 148
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache$CacheOpenHelper;->clearInstance()V

    .line 149
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/cache/NewsfeedCache;->isNewsfeedTop:Ljava/lang/Boolean;

    .line 150
    return-void
.end method

.method public static get()Ljava/util/ArrayList;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    .line 121
    :try_start_0
    sget-object v1, Lcom/vkontakte/android/cache/NewsfeedCache;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 122
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 123
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 125
    .local v10, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/NewsEntry;>;"
    :try_start_1
    const-string/jumbo v1, "news"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string/jumbo v7, "`order_position` asc"

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 126
    .local v8, "cursor":Landroid/database/Cursor;
    if-eqz v8, :cond_1

    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_1

    .line 127
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 129
    :cond_0
    new-instance v9, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v9}, Lcom/vkontakte/android/NewsEntry;-><init>()V

    .line 130
    .local v9, "entry":Lcom/vkontakte/android/NewsEntry;
    invoke-virtual {v9, v8}, Lcom/vkontakte/android/NewsEntry;->readFromSQLite(Landroid/database/Cursor;)V

    .line 131
    invoke-virtual {v10, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 132
    const-string/jumbo v1, "vk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "post from cache: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v1

    if-nez v1, :cond_0

    .line 138
    .end local v8    # "cursor":Landroid/database/Cursor;
    .end local v9    # "entry":Lcom/vkontakte/android/NewsEntry;
    :cond_1
    :goto_0
    :try_start_2
    sget-object v1, Lcom/vkontakte/android/cache/NewsfeedCache;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 144
    .end local v10    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/NewsEntry;>;"
    :goto_1
    return-object v10

    .line 135
    .restart local v10    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/NewsEntry;>;"
    :catch_0
    move-exception v11

    .line 136
    .local v11, "x":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "Error reading news cache DB!"

    invoke-static {v1, v2, v11}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 140
    .end local v10    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/NewsEntry;>;"
    .end local v11    # "x":Ljava/lang/Exception;
    :catch_1
    move-exception v11

    .line 141
    .restart local v11    # "x":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v11, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 143
    sget-object v1, Lcom/vkontakte/android/cache/NewsfeedCache;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    move-object v10, v12

    .line 144
    goto :goto_1
.end method

.method public static getFirstShowedIndex()I
    .locals 3

    .prologue
    .line 112
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "newsfeedCacheFirstShowIndex"

    const/4 v2, -0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getFirstShowedOffset()I
    .locals 3

    .prologue
    .line 116
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "newsfeedCacheFirstShowOffset"

    const/4 v2, -0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getFrom()Ljava/lang/String;
    .locals 3

    .prologue
    .line 108
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "newFromPaging"

    const-string/jumbo v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getLists()Ljava/util/ArrayList;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/NewsfeedList;",
            ">;"
        }
    .end annotation

    .prologue
    .line 337
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 339
    .local v10, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/NewsfeedList;>;"
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 341
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_1
    const-string/jumbo v1, "feed_lists"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 342
    .local v8, "cursor":Landroid/database/Cursor;
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 343
    .local v11, "values":Landroid/content/ContentValues;
    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_1

    .line 344
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 345
    invoke-static {}, Lcom/vkontakte/android/NewsfeedList;->resetCounter()V

    .line 347
    :cond_0
    invoke-static {v8, v11}, Landroid/database/DatabaseUtils;->cursorRowToContentValues(Landroid/database/Cursor;Landroid/content/ContentValues;)V

    .line 348
    const-string/jumbo v1, "promo"

    invoke-virtual {v11, v1}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_2

    .line 349
    new-instance v1, Lcom/vkontakte/android/NewsfeedList;

    const-string/jumbo v2, "pid"

    invoke-virtual {v11, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "title"

    invoke-virtual {v11, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/NewsfeedList;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 353
    :goto_0
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 355
    :cond_1
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 362
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .end local v8    # "cursor":Landroid/database/Cursor;
    .end local v11    # "values":Landroid/content/ContentValues;
    :goto_1
    return-object v10

    .line 351
    .restart local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .restart local v8    # "cursor":Landroid/database/Cursor;
    .restart local v11    # "values":Landroid/content/ContentValues;
    :cond_2
    new-instance v1, Lcom/vkontakte/android/NewsfeedList;

    const-string/jumbo v2, "lid"

    invoke-virtual {v11, v2}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const-string/jumbo v3, "title"

    invoke-virtual {v11, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/NewsfeedList;-><init>(ILjava/lang/String;)V

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 356
    .end local v8    # "cursor":Landroid/database/Cursor;
    .end local v11    # "values":Landroid/content/ContentValues;
    :catch_0
    move-exception v12

    .line 357
    .local v12, "x":Ljava/lang/Exception;
    :try_start_2
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "Error reading news cache DB!"

    invoke-static {v1, v2, v12}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 359
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .end local v12    # "x":Ljava/lang/Exception;
    :catch_1
    move-exception v9

    .line 360
    .local v9, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v9, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_1
.end method

.method public static getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    .prologue
    .line 34
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/vkontakte/android/cache/NewsfeedCache$CacheOpenHelper;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/cache/NewsfeedCache$CacheOpenHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/cache/NewsfeedCache$CacheOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/vkontakte/android/cache/NewsfeedCache$CacheOpenHelper;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/cache/NewsfeedCache$CacheOpenHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/cache/NewsfeedCache$CacheOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static hasEntries()Z
    .locals 7

    .prologue
    const/4 v4, 0x0

    .line 403
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 404
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string/jumbo v5, "SELECT COUNT(*) FROM `news`"

    const/4 v6, 0x0

    invoke-virtual {v1, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 405
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 406
    const/4 v5, 0x0

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    if-lez v5, :cond_0

    const/4 v2, 0x1

    .line 407
    .local v2, "result":Z
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 414
    .end local v0    # "cursor":Landroid/database/Cursor;
    .end local v2    # "result":Z
    :goto_1
    return v2

    .restart local v0    # "cursor":Landroid/database/Cursor;
    :cond_0
    move v2, v4

    .line 406
    goto :goto_0

    .line 410
    .end local v0    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v3

    .line 411
    .local v3, "x":Ljava/lang/Exception;
    const-string/jumbo v5, "vk"

    const-string/jumbo v6, "Error reading news cache DB!"

    invoke-static {v5, v6, v3}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    move v2, v4

    .line 414
    goto :goto_1
.end method

.method public static isNewsfeedTop()Z
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 418
    sget-object v0, Lcom/vkontakte/android/cache/NewsfeedCache;->isNewsfeedTop:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 419
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "newsfeed_is_top"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/cache/NewsfeedCache;->isNewsfeedTop:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 421
    :goto_0
    return v0

    :cond_0
    sget-object v0, Lcom/vkontakte/android/cache/NewsfeedCache;->isNewsfeedTop:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_0
.end method

.method static synthetic lambda$replace$0(Ljava/util/List;)V
    .locals 7
    .param p0, "items"    # Ljava/util/List;

    .prologue
    .line 155
    :try_start_0
    sget-object v4, Lcom/vkontakte/android/cache/NewsfeedCache;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 156
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 157
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 159
    :try_start_1
    const-string/jumbo v4, "news"

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v0, v4, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 160
    const/4 v2, 0x0

    .line 161
    .local v2, "i":I
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/NewsEntry;

    .line 162
    .local v1, "entry":Lcom/vkontakte/android/NewsEntry;
    iget v4, v1, Lcom/vkontakte/android/NewsEntry;->order_position:I

    if-ltz v4, :cond_0

    move v4, v2

    :goto_1
    iput v4, v1, Lcom/vkontakte/android/NewsEntry;->order_position:I

    .line 163
    const-string/jumbo v4, "news"

    invoke-virtual {v1, v0, v4}, Lcom/vkontakte/android/NewsEntry;->writeToSQLite(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 164
    add-int/lit8 v2, v2, 0x1

    .line 165
    goto :goto_0

    .line 162
    :cond_0
    iget v4, v1, Lcom/vkontakte/android/NewsEntry;->order_position:I

    goto :goto_1

    .line 166
    .end local v1    # "entry":Lcom/vkontakte/android/NewsEntry;
    :cond_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 170
    .end local v2    # "i":I
    :goto_2
    :try_start_2
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 174
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :goto_3
    sget-object v4, Lcom/vkontakte/android/cache/NewsfeedCache;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->release()V

    .line 175
    return-void

    .line 167
    .restart local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :catch_0
    move-exception v3

    .line 168
    .local v3, "x":Ljava/lang/Exception;
    :try_start_3
    const-string/jumbo v4, "vk"

    const-string/jumbo v5, "Error writing news cache DB!"

    invoke-static {v4, v5, v3}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_2

    .line 171
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .end local v3    # "x":Ljava/lang/Exception;
    :catch_1
    move-exception v3

    .line 172
    .restart local v3    # "x":Ljava/lang/Exception;
    const-string/jumbo v4, "vk"

    const-string/jumbo v5, "Error writing post to cache"

    invoke-static {v4, v5, v3}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3
.end method

.method static synthetic lambda$setLists$1(Ljava/util/List;)V
    .locals 8
    .param p0, "lists"    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 371
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 373
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 374
    const-string/jumbo v5, "feed_lists"

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v0, v5, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 375
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 376
    .local v3, "values":Landroid/content/ContentValues;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/NewsfeedList;

    .line 377
    .local v2, "list":Lcom/vkontakte/android/NewsfeedList;
    invoke-virtual {v2}, Lcom/vkontakte/android/NewsfeedList;->isPromoList()Z

    move-result v1

    .line 378
    .local v1, "isPromo":Z
    const-string/jumbo v6, "lid"

    invoke-virtual {v2}, Lcom/vkontakte/android/NewsfeedList;->getId()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 379
    const-string/jumbo v6, "pid"

    invoke-virtual {v2}, Lcom/vkontakte/android/NewsfeedList;->getPromoId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 380
    const-string/jumbo v6, "title"

    invoke-virtual {v2}, Lcom/vkontakte/android/NewsfeedList;->getTitle()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 381
    const-string/jumbo v6, "promo"

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 382
    const-string/jumbo v6, "feed_lists"

    const/4 v7, 0x0

    invoke-virtual {v0, v6, v7, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 385
    .end local v1    # "isPromo":Z
    .end local v2    # "list":Lcom/vkontakte/android/NewsfeedList;
    .end local v3    # "values":Landroid/content/ContentValues;
    :catch_0
    move-exception v4

    .line 386
    .local v4, "x":Ljava/lang/Exception;
    :try_start_2
    const-string/jumbo v5, "vk"

    const-string/jumbo v6, "Error reading news cache DB!"

    invoke-static {v5, v6, v4}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 388
    .end local v4    # "x":Ljava/lang/Exception;
    :goto_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 392
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :goto_2
    return-void

    .line 384
    .restart local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .restart local v3    # "values":Landroid/content/ContentValues;
    :cond_0
    :try_start_3
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_1

    .line 389
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .end local v3    # "values":Landroid/content/ContentValues;
    :catch_1
    move-exception v4

    .line 390
    .restart local v4    # "x":Ljava/lang/Exception;
    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v4, v5}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_2
.end method

.method public static remove(II)V
    .locals 5
    .param p0, "oid"    # I
    .param p1, "pid"    # I

    .prologue
    .line 234
    :try_start_0
    sget-object v2, Lcom/vkontakte/android/cache/NewsfeedCache;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 235
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 237
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_1
    const-string/jumbo v2, "news"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "`pid`="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " AND `uid`="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 244
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :goto_0
    sget-object v2, Lcom/vkontakte/android/cache/NewsfeedCache;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    .line 245
    return-void

    .line 238
    .restart local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :catch_0
    move-exception v1

    .line 239
    .local v1, "x":Ljava/lang/Exception;
    :try_start_2
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Error writing news cache DB!"

    invoke-static {v2, v3, v1}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 241
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .end local v1    # "x":Ljava/lang/Exception;
    :catch_1
    move-exception v1

    .line 242
    .restart local v1    # "x":Ljava/lang/Exception;
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static removeNotifications()V
    .locals 5

    .prologue
    .line 219
    :try_start_0
    sget-object v2, Lcom/vkontakte/android/cache/NewsfeedCache;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 220
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 222
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_1
    const-string/jumbo v2, "news"

    const-string/jumbo v3, "`uid`=2000000001"

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 229
    .local v1, "x":Ljava/lang/Exception;
    :goto_0
    sget-object v2, Lcom/vkontakte/android/cache/NewsfeedCache;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    .line 230
    return-void

    .line 223
    .end local v1    # "x":Ljava/lang/Exception;
    :catch_0
    move-exception v1

    .line 224
    .restart local v1    # "x":Ljava/lang/Exception;
    :try_start_2
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Error writing news cache DB!"

    invoke-static {v2, v3, v1}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 226
    :catch_1
    move-exception v1

    .line 227
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-static {v1, v2}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static replace(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 153
    .local p0, "items":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/NewsEntry;>;"
    new-instance v0, Ljava/lang/Thread;

    invoke-static {p0}, Lcom/vkontakte/android/cache/NewsfeedCache$$Lambda$1;->lambdaFactory$(Ljava/util/List;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 175
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 176
    return-void
.end method

.method public static replaceOne(Lcom/vkontakte/android/NewsEntry;)V
    .locals 1
    .param p0, "e"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 248
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/vkontakte/android/cache/NewsfeedCache;->replaceOne(Lcom/vkontakte/android/NewsEntry;Z)V

    .line 249
    return-void
.end method

.method public static replaceOne(Lcom/vkontakte/android/NewsEntry;Z)V
    .locals 13
    .param p0, "e"    # Lcom/vkontakte/android/NewsEntry;
    .param p1, "usingFlags"    # Z

    .prologue
    .line 253
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "`pid`="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " AND `uid`="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 254
    .local v11, "selection":Ljava/lang/StringBuilder;
    if-eqz p1, :cond_0

    .line 255
    const-string/jumbo v1, " AND `flags`="

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 257
    :cond_0
    sget-object v1, Lcom/vkontakte/android/cache/NewsfeedCache;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 258
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 260
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_1
    const-string/jumbo v1, "news"

    const/4 v2, 0x0

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string/jumbo v7, "`time` desc"

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 261
    .local v9, "cursor":Landroid/database/Cursor;
    if-eqz v9, :cond_2

    .line 262
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 263
    new-instance v10, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v10}, Lcom/vkontakte/android/NewsEntry;-><init>()V

    .line 264
    .local v10, "entry":Lcom/vkontakte/android/NewsEntry;
    invoke-virtual {v10, v9}, Lcom/vkontakte/android/NewsEntry;->readFromSQLite(Landroid/database/Cursor;)V

    .line 265
    iget v1, v10, Lcom/vkontakte/android/NewsEntry;->order_position:I

    iput v1, p0, Lcom/vkontakte/android/NewsEntry;->order_position:I

    .line 266
    const-string/jumbo v1, "vk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "post from cache: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 268
    .end local v10    # "entry":Lcom/vkontakte/android/NewsEntry;
    :cond_1
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 271
    :cond_2
    const-string/jumbo v1, "news"

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v8

    .line 272
    .local v8, "count":I
    if-lez v8, :cond_3

    .line 274
    const-string/jumbo v1, "news"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/NewsEntry;->writeToSQLite(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 282
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .end local v8    # "count":I
    .end local v9    # "cursor":Landroid/database/Cursor;
    .end local v11    # "selection":Ljava/lang/StringBuilder;
    :cond_3
    :goto_0
    sget-object v1, Lcom/vkontakte/android/cache/NewsfeedCache;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 283
    return-void

    .line 276
    .restart local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .restart local v11    # "selection":Ljava/lang/StringBuilder;
    :catch_0
    move-exception v12

    .line 277
    .local v12, "x":Ljava/lang/Exception;
    :try_start_2
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "Error writing news cache DB!"

    invoke-static {v1, v2, v12}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 279
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .end local v11    # "selection":Ljava/lang/StringBuilder;
    .end local v12    # "x":Ljava/lang/Exception;
    :catch_1
    move-exception v12

    .line 280
    .restart local v12    # "x":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v12, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static saveFirstShowedIndex(I)I
    .locals 2
    .param p0, "i"    # I

    .prologue
    .line 96
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "newsfeedCacheFirstShowIndex"

    .line 97
    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 98
    return p0
.end method

.method public static saveFirstShowedOffset(I)I
    .locals 2
    .param p0, "i"    # I

    .prologue
    .line 102
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "newsfeedCacheFirstShowOffset"

    .line 103
    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 104
    return p0
.end method

.method public static saveFrom(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "from"    # Ljava/lang/String;

    .prologue
    .line 90
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "newFromPaging"

    if-nez p0, :cond_0

    const-string/jumbo v0, "0"

    .line 91
    :goto_0
    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 92
    return-object p0

    :cond_0
    move-object v0, p0

    .line 90
    goto :goto_0
.end method

.method public static setLists(Ljava/util/List;Z)V
    .locals 2
    .param p0    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "async"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/NewsfeedList;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 366
    .local p0, "lists":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/NewsfeedList;>;"
    if-nez p0, :cond_0

    .line 398
    :goto_0
    return-void

    .line 369
    :cond_0
    invoke-static {p0}, Lcom/vkontakte/android/cache/NewsfeedCache$$Lambda$2;->lambdaFactory$(Ljava/util/List;)Ljava/lang/Runnable;

    move-result-object v0

    .line 393
    .local v0, "r":Ljava/lang/Runnable;
    if-eqz p1, :cond_1

    .line 394
    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    goto :goto_0

    .line 396
    :cond_1
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_0
.end method

.method public static setNewsfeedTop(Ljava/lang/Boolean;)V
    .locals 3
    .param p0, "b"    # Ljava/lang/Boolean;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 425
    if-eqz p0, :cond_0

    .line 426
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "newsfeed_is_top"

    sput-object p0, Lcom/vkontakte/android/cache/NewsfeedCache;->isNewsfeedTop:Ljava/lang/Boolean;

    .line 427
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 429
    :cond_0
    return-void
.end method

.method public static update(IIIIIZZ)V
    .locals 13
    .param p0, "oid"    # I
    .param p1, "pid"    # I
    .param p2, "likes"    # I
    .param p3, "comments"    # I
    .param p4, "retweets"    # I
    .param p5, "liked"    # Z
    .param p6, "retweeted"    # Z

    .prologue
    .line 288
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    .line 290
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v10, 0x0

    .line 291
    .local v10, "flags":I
    :try_start_1
    const-string/jumbo v2, "news"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string/jumbo v5, "flags"

    aput-object v5, v3, v4

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "`pid`="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " AND `uid`="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 293
    .local v9, "cursor":Landroid/database/Cursor;
    if-nez v10, :cond_2

    if-eqz v9, :cond_2

    invoke-interface {v9}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_2

    .line 294
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    .line 295
    const/4 v2, 0x0

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    .line 296
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 302
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 303
    .local v11, "values":Landroid/content/ContentValues;
    const-string/jumbo v2, "likes"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 304
    const/4 v2, -0x1

    move/from16 v0, p3

    if-eq v0, v2, :cond_0

    .line 305
    const-string/jumbo v2, "comments"

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 308
    :cond_0
    if-eqz p5, :cond_3

    .line 309
    or-int/lit8 v10, v10, 0x8

    .line 314
    :goto_0
    const/4 v2, -0x1

    move/from16 v0, p4

    if-eq v0, v2, :cond_1

    .line 315
    const-string/jumbo v2, "retweets"

    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 318
    :cond_1
    if-eqz p6, :cond_4

    .line 319
    or-int/lit8 v10, v10, 0x4

    .line 324
    :goto_1
    const-string/jumbo v2, "flags"

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 326
    const-string/jumbo v2, "news"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "`pid`="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " AND `uid`="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v11, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 334
    .end local v1    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .end local v9    # "cursor":Landroid/database/Cursor;
    .end local v10    # "flags":I
    .end local v11    # "values":Landroid/content/ContentValues;
    :goto_2
    return-void

    .line 298
    .restart local v1    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .restart local v9    # "cursor":Landroid/database/Cursor;
    .restart local v10    # "flags":I
    :cond_2
    invoke-interface {v9}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 327
    .end local v9    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v12

    .line 328
    .local v12, "x":Ljava/lang/Exception;
    :try_start_2
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Error writing news cache DB!"

    invoke-static {v2, v3, v12}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 330
    .end local v1    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .end local v10    # "flags":I
    .end local v12    # "x":Ljava/lang/Exception;
    :catch_1
    move-exception v12

    .line 331
    .restart local v12    # "x":Ljava/lang/Exception;
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v12, v2}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_2

    .line 311
    .end local v12    # "x":Ljava/lang/Exception;
    .restart local v1    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .restart local v9    # "cursor":Landroid/database/Cursor;
    .restart local v10    # "flags":I
    .restart local v11    # "values":Landroid/content/ContentValues;
    :cond_3
    and-int/lit8 v10, v10, -0x9

    goto :goto_0

    .line 321
    :cond_4
    and-int/lit8 v10, v10, -0x5

    goto :goto_1
.end method
