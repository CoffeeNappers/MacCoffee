.class public Lcom/vkontakte/android/data/db/Database;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "Database.java"


# static fields
.field private static final COLUMNS:[Ljava/lang/String;

.field private static final DATABASE_NAME:Ljava/lang/String; = "databaseVerThree.db"

.field private static final DATABASE_VERSION:I = 0x16

.field private static final DATABASE_VERSION_ADD_RESTRICTION_FIELD:I = 0x15

.field private static final DATABASE_VERSION_NEW_MUSIC:I = 0x14

.field private static final DATABASE_VERSION_STATISTIC_PIXELS:I = 0x16

.field private static volatile instance:Lcom/vkontakte/android/data/db/Database;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 28
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/data/db/Database;->instance:Lcom/vkontakte/android/data/db/Database;

    .line 119
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "key"

    aput-object v2, v0, v1

    sput-object v0, Lcom/vkontakte/android/data/db/Database;->COLUMNS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "factory"    # Landroid/database/sqlite/SQLiteDatabase$CursorFactory;
    .param p4, "version"    # I

    .prologue
    .line 49
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 50
    return-void
.end method

.method public static getInst(Landroid/content/Context;)Lcom/vkontakte/android/data/db/Database;
    .locals 6
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 38
    sget-object v0, Lcom/vkontakte/android/data/db/Database;->instance:Lcom/vkontakte/android/data/db/Database;

    if-nez v0, :cond_1

    .line 39
    const-class v1, Lcom/vkontakte/android/data/db/Database;

    monitor-enter v1

    .line 40
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/data/db/Database;->instance:Lcom/vkontakte/android/data/db/Database;

    if-nez v0, :cond_0

    .line 41
    new-instance v0, Lcom/vkontakte/android/data/db/Database;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-string/jumbo v3, "databaseVerThree.db"

    const/4 v4, 0x0

    const/16 v5, 0x16

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/vkontakte/android/data/db/Database;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    sput-object v0, Lcom/vkontakte/android/data/db/Database;->instance:Lcom/vkontakte/android/data/db/Database;

    .line 43
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    :cond_1
    sget-object v0, Lcom/vkontakte/android/data/db/Database;->instance:Lcom/vkontakte/android/data/db/Database;

    return-object v0

    .line 43
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public addSentStatisticsAndDropOldValues(Ljava/lang/String;II)Z
    .locals 10
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "maxSaved"    # I
    .param p3, "period"    # I

    .prologue
    const/4 v1, 0x1

    .line 134
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 135
    if-gtz p3, :cond_0

    move p3, v1

    .line 136
    :cond_0
    if-gtz p2, :cond_1

    move p2, v1

    .line 137
    :cond_1
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 138
    .local v0, "contentValues":Landroid/content/ContentValues;
    const-string/jumbo v4, "key"

    invoke-virtual {v0, v4, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    invoke-virtual {p0}, Lcom/vkontakte/android/data/db/Database;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    const-string/jumbo v5, "sent_statistics"

    const-string/jumbo v6, "key"

    invoke-virtual {v4, v5, v6, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v2

    .line 140
    .local v2, "id":J
    int-to-long v4, p3

    rem-long v4, v2, v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-nez v4, :cond_2

    .line 141
    invoke-virtual {p0}, Lcom/vkontakte/android/data/db/Database;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    const-string/jumbo v5, "sent_statistics"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "_id< "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    int-to-long v8, p2

    sub-long v8, v2, v8

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 145
    .end local v0    # "contentValues":Landroid/content/ContentValues;
    .end local v2    # "id":J
    :cond_2
    :goto_0
    return v1

    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getRequests(ILandroid/util/SparseArray;)Ljava/util/ArrayList;
    .locals 12
    .param p1, "appId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/GameRequest;",
            ">;"
        }
    .end annotation

    .prologue
    .local p2, "profiles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    const/4 v5, 0x0

    .line 90
    invoke-virtual {p0}, Lcom/vkontakte/android/data/db/Database;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string/jumbo v1, "game_requests"

    sget-object v2, Lcom/vkontakte/android/data/GameRequest;->COLUMNS:[Ljava/lang/String;

    const-string/jumbo v3, "app_id=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v6, 0x0

    .line 91
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v6

    const-string/jumbo v7, "date"

    const-string/jumbo v8, "20"

    move-object v6, v5

    .line 90
    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 92
    .local v9, "cursor":Landroid/database/Cursor;
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 93
    .local v11, "gameRequests":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    if-eqz v9, :cond_2

    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 95
    :cond_0
    new-instance v10, Lcom/vkontakte/android/data/GameRequest;

    invoke-direct {v10, v9}, Lcom/vkontakte/android/data/GameRequest;-><init>(Landroid/database/Cursor;)V

    .line 96
    .local v10, "gameRequest":Lcom/vkontakte/android/data/GameRequest;
    if-eqz p2, :cond_1

    .line 97
    invoke-virtual {v10, p2}, Lcom/vkontakte/android/data/GameRequest;->fillUserProfiles(Landroid/util/SparseArray;)V

    .line 99
    :cond_1
    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 100
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 101
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 103
    .end local v10    # "gameRequest":Lcom/vkontakte/android/data/GameRequest;
    :cond_2
    return-object v11
.end method

.method public getSentStatistics()Ljava/util/Set;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 122
    invoke-virtual {p0}, Lcom/vkontakte/android/data/db/Database;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string/jumbo v1, "sent_statistics"

    sget-object v2, Lcom/vkontakte/android/data/db/Database;->COLUMNS:[Ljava/lang/String;

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    move-object v7, v3

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 123
    .local v8, "cursor":Landroid/database/Cursor;
    new-instance v9, Ljava/util/HashSet;

    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    .line 124
    .local v9, "sentStatistics":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-eqz v8, :cond_1

    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 126
    :cond_0
    const/4 v0, 0x0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v9, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 127
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 128
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 130
    :cond_1
    return-object v9
.end method

.method public insertRequest(Lcom/vkontakte/android/data/GameRequest;)V
    .locals 5
    .param p1, "gameRequest"    # Lcom/vkontakte/android/data/GameRequest;

    .prologue
    .line 113
    invoke-virtual {p0}, Lcom/vkontakte/android/data/db/Database;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string/jumbo v1, "game_requests"

    const/4 v2, 0x0

    .line 114
    invoke-virtual {p1}, Lcom/vkontakte/android/data/GameRequest;->toContentValues()Landroid/content/ContentValues;

    move-result-object v3

    const/4 v4, 0x5

    .line 113
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    .line 115
    return-void
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 54
    invoke-static {}, Lcom/vkontakte/android/data/GameRequest;->createSql()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 55
    invoke-static {}, Lcom/vkontakte/android/audio/player/PlayerTrack;->createSql()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 56
    invoke-static {}, Lcom/vkontakte/android/audio/player/SavedTrack;->createSql()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 57
    invoke-static {}, Lcom/vkontakte/android/statistics/SentTable;->createSql()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 58
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 5
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    const/4 v4, 0x0

    .line 62
    const-string/jumbo v1, "game_requests"

    invoke-static {v1}, Lcom/vkontakte/android/data/db/Table;->dropSql(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 63
    invoke-static {}, Lcom/vkontakte/android/data/GameRequest;->createSql()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 65
    invoke-static {}, Lcom/vkontakte/android/audio/player/PlayerTrack;->createSql()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 66
    invoke-static {}, Lcom/vkontakte/android/audio/player/SavedTrack;->createSql()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 67
    invoke-static {}, Lcom/vkontakte/android/statistics/SentTable;->createSql()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 70
    const/16 v1, 0x14

    if-lt p2, v1, :cond_0

    const/16 v1, 0x15

    if-ge p2, v1, :cond_0

    .line 71
    :try_start_0
    const-string/jumbo v1, "ALTER TABLE player_track ADD restriction int default 0"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 72
    const-string/jumbo v1, "ALTER TABLE saved_track ADD restriction int default 0"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 73
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string/jumbo v3, "ALTER TABLE isOk"

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    :cond_0
    :goto_0
    return-void

    .line 75
    :catch_0
    move-exception v0

    .line 76
    .local v0, "e":Ljava/lang/Exception;
    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 77
    invoke-static {v0}, Lcom/vk/analytics/Analytics;->logException(Ljava/lang/Throwable;)V

    .line 79
    const-string/jumbo v1, "player_track"

    invoke-static {v1}, Lcom/vkontakte/android/data/db/Table;->dropSql(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 80
    invoke-static {}, Lcom/vkontakte/android/audio/player/PlayerTrack;->createSql()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 82
    const-string/jumbo v1, "saved_track"

    invoke-static {v1}, Lcom/vkontakte/android/data/db/Table;->dropSql(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 83
    invoke-static {}, Lcom/vkontakte/android/audio/player/SavedTrack;->createSql()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public removeRequest(Lcom/vkontakte/android/data/GameRequest;)V
    .locals 6
    .param p1, "gameRequest"    # Lcom/vkontakte/android/data/GameRequest;

    .prologue
    .line 107
    iget-wide v0, p1, Lcom/vkontakte/android/data/GameRequest;->id:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 108
    invoke-virtual {p0}, Lcom/vkontakte/android/data/db/Database;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string/jumbo v1, "game_requests"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v4, p1, Lcom/vkontakte/android/data/GameRequest;->id:J

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 110
    :cond_0
    return-void
.end method
