.class Lcom/danikula/videocache/sourcestorage/DatabaseSourceInfoStorage;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "DatabaseSourceInfoStorage.java"

# interfaces
.implements Lcom/danikula/videocache/sourcestorage/SourceInfoStorage;


# static fields
.field private static final ALL_COLUMNS:[Ljava/lang/String;

.field private static final COLUMN_ID:Ljava/lang/String; = "_id"

.field private static final COLUMN_LENGTH:Ljava/lang/String; = "length"

.field private static final COLUMN_MIME:Ljava/lang/String; = "mime"

.field private static final COLUMN_URL:Ljava/lang/String; = "url"

.field private static final CREATE_SQL:Ljava/lang/String; = "CREATE TABLE SourceInfo (_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,url TEXT NOT NULL,mime TEXT,length INTEGER);"

.field private static final TABLE:Ljava/lang/String; = "SourceInfo"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 26
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "url"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "length"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "mime"

    aput-object v2, v0, v1

    sput-object v0, Lcom/danikula/videocache/sourcestorage/DatabaseSourceInfoStorage;->ALL_COLUMNS:[Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 36
    const-string/jumbo v0, "AndroidVideoCache.db"

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 37
    invoke-static {p1}, Lcom/danikula/videocache/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    return-void
.end method

.method private convert(Lcom/danikula/videocache/SourceInfo;)Landroid/content/ContentValues;
    .locals 3
    .param p1, "sourceInfo"    # Lcom/danikula/videocache/SourceInfo;

    .prologue
    .line 92
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 93
    .local v0, "values":Landroid/content/ContentValues;
    const-string/jumbo v1, "url"

    iget-object v2, p1, Lcom/danikula/videocache/SourceInfo;->url:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    const-string/jumbo v1, "length"

    iget v2, p1, Lcom/danikula/videocache/SourceInfo;->length:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 95
    const-string/jumbo v1, "mime"

    iget-object v2, p1, Lcom/danikula/videocache/SourceInfo;->mime:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    return-object v0
.end method

.method private convert(Landroid/database/Cursor;)Lcom/danikula/videocache/SourceInfo;
    .locals 4
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 84
    new-instance v0, Lcom/danikula/videocache/SourceInfo;

    const-string/jumbo v1, "url"

    .line 85
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "length"

    .line 86
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    const-string/jumbo v3, "mime"

    .line 87
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/danikula/videocache/SourceInfo;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lcom/danikula/videocache/SourceInfo;
    .locals 10
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x0

    .line 53
    invoke-static {p1}, Lcom/danikula/videocache/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    const/4 v8, 0x0

    .line 56
    .local v8, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Lcom/danikula/videocache/sourcestorage/DatabaseSourceInfoStorage;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string/jumbo v1, "SourceInfo"

    sget-object v2, Lcom/danikula/videocache/sourcestorage/DatabaseSourceInfoStorage;->ALL_COLUMNS:[Ljava/lang/String;

    const-string/jumbo v3, "url=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 57
    if-eqz v8, :cond_0

    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_2

    :cond_0
    move-object v0, v9

    .line 59
    :goto_0
    if-eqz v8, :cond_1

    .line 60
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_1
    return-object v0

    .line 57
    :cond_2
    :try_start_1
    invoke-direct {p0, v8}, Lcom/danikula/videocache/sourcestorage/DatabaseSourceInfoStorage;->convert(Landroid/database/Cursor;)Lcom/danikula/videocache/SourceInfo;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 59
    :catchall_0
    move-exception v0

    if-eqz v8, :cond_3

    .line 60
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 42
    invoke-static {p1}, Lcom/danikula/videocache/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    const-string/jumbo v0, "CREATE TABLE SourceInfo (_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,url TEXT NOT NULL,mime TEXT,length INTEGER);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 44
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 2
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 48
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Should not be called. There is no any migration"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public put(Ljava/lang/String;Lcom/danikula/videocache/SourceInfo;)V
    .locals 8
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "sourceInfo"    # Lcom/danikula/videocache/SourceInfo;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 67
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p1, v5, v4

    aput-object p2, v5, v3

    invoke-static {v5}, Lcom/danikula/videocache/Preconditions;->checkAllNotNull([Ljava/lang/Object;)V

    .line 68
    invoke-virtual {p0, p1}, Lcom/danikula/videocache/sourcestorage/DatabaseSourceInfoStorage;->get(Ljava/lang/String;)Lcom/danikula/videocache/SourceInfo;

    move-result-object v2

    .line 69
    .local v2, "sourceInfoFromDb":Lcom/danikula/videocache/SourceInfo;
    if-eqz v2, :cond_0

    move v1, v3

    .line 70
    .local v1, "exist":Z
    :goto_0
    invoke-direct {p0, p2}, Lcom/danikula/videocache/sourcestorage/DatabaseSourceInfoStorage;->convert(Lcom/danikula/videocache/SourceInfo;)Landroid/content/ContentValues;

    move-result-object v0

    .line 71
    .local v0, "contentValues":Landroid/content/ContentValues;
    if-eqz v1, :cond_1

    .line 72
    invoke-virtual {p0}, Lcom/danikula/videocache/sourcestorage/DatabaseSourceInfoStorage;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    const-string/jumbo v6, "SourceInfo"

    const-string/jumbo v7, "url=?"

    new-array v3, v3, [Ljava/lang/String;

    aput-object p1, v3, v4

    invoke-virtual {v5, v6, v0, v7, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 76
    :goto_1
    return-void

    .end local v0    # "contentValues":Landroid/content/ContentValues;
    .end local v1    # "exist":Z
    :cond_0
    move v1, v4

    .line 69
    goto :goto_0

    .line 74
    .restart local v0    # "contentValues":Landroid/content/ContentValues;
    .restart local v1    # "exist":Z
    :cond_1
    invoke-virtual {p0}, Lcom/danikula/videocache/sourcestorage/DatabaseSourceInfoStorage;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string/jumbo v4, "SourceInfo"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    goto :goto_1
.end method

.method public release()V
    .locals 0

    .prologue
    .line 80
    invoke-virtual {p0}, Lcom/danikula/videocache/sourcestorage/DatabaseSourceInfoStorage;->close()V

    .line 81
    return-void
.end method
