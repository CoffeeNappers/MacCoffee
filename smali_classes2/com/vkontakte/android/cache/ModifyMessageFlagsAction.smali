.class public Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;
.super Lcom/vkontakte/android/cache/MessagesAction;
.source "ModifyMessageFlagsAction.java"


# static fields
.field public static final ACTION_CLEAR:I = 0x1

.field public static final ACTION_SET:I


# instance fields
.field private action:I

.field private flags:I

.field private in:Z

.field private le:Z

.field private mid:I

.field private peer:I


# direct methods
.method public constructor <init>(III)V
    .locals 1
    .param p1, "_mid"    # I
    .param p2, "_flags"    # I
    .param p3, "_action"    # I

    .prologue
    const/4 v0, 0x0

    .line 23
    invoke-direct {p0}, Lcom/vkontakte/android/cache/MessagesAction;-><init>()V

    .line 21
    iput-boolean v0, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->le:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->in:Z

    .line 24
    iput p1, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->mid:I

    .line 25
    iput p2, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->flags:I

    .line 26
    iput p3, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->action:I

    .line 27
    return-void
.end method

.method public constructor <init>(IIIZI)V
    .locals 1
    .param p1, "_mid"    # I
    .param p2, "_flags"    # I
    .param p3, "_action"    # I
    .param p4, "_in"    # Z
    .param p5, "_peer"    # I

    .prologue
    const/4 v0, 0x0

    .line 29
    invoke-direct {p0}, Lcom/vkontakte/android/cache/MessagesAction;-><init>()V

    .line 21
    iput-boolean v0, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->le:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->in:Z

    .line 30
    iput p1, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->mid:I

    .line 31
    iput p2, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->flags:I

    .line 32
    iput p3, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->action:I

    .line 33
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->le:Z

    .line 34
    iput-boolean p4, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->in:Z

    .line 35
    iput p5, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->peer:I

    .line 36
    return-void
.end method

.method private resetUnreadCount(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 4
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 74
    sget-boolean v1, Lcom/vkontakte/android/LongPollService;->DEBUG:Z

    if-eqz v1, :cond_0

    .line 75
    const-string/jumbo v1, "vk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Resetting unread count for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->peer:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 78
    .local v0, "values":Landroid/content/ContentValues;
    const-string/jumbo v1, "unread_count"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 79
    const-string/jumbo v1, "messages_unread_counters"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "peer="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->peer:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p1, v1, v0, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 80
    return-void
.end method


# virtual methods
.method public apply(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 13
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/sqlite/SQLiteException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v12, 0x0

    const/4 v4, 0x0

    .line 41
    const-string/jumbo v9, "flags"

    .line 42
    .local v9, "flagsAct":Ljava/lang/String;
    iget v0, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->action:I

    if-nez v0, :cond_3

    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "flags|"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->flags:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 50
    :cond_0
    :goto_0
    iget-boolean v0, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->le:Z

    if-eqz v0, :cond_6

    .line 51
    iget-boolean v0, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->in:Z

    if-eqz v0, :cond_4

    const-string/jumbo v1, "messages_read_ids_in"

    .line 52
    .local v1, "idTable":Ljava/lang/String;
    :goto_1
    const/4 v10, 0x0

    .line 53
    .local v10, "lastRead":I
    new-array v2, v3, [Ljava/lang/String;

    const-string/jumbo v0, "mid"

    aput-object v0, v2, v12

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "peer="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v3, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->peer:I

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v0, p1

    move-object v5, v4

    move-object v6, v4

    move-object v7, v4

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 54
    .local v8, "cursor":Landroid/database/Cursor;
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 55
    invoke-interface {v8, v12}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    .line 57
    :cond_1
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "UPDATE messages SET flags="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, " WHERE peer="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->peer:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, " AND mid<="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->mid:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, " AND mid>"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, " AND sender"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v0, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->in:Z

    if-eqz v0, :cond_5

    const-string/jumbo v0, "<>"

    :goto_2
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 59
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 60
    .local v11, "values":Landroid/content/ContentValues;
    const-string/jumbo v0, "peer"

    iget v2, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->peer:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v11, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 61
    const-string/jumbo v0, "mid"

    iget v2, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->mid:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v11, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 62
    const/4 v0, 0x5

    invoke-virtual {p1, v1, v4, v11, v0}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    .line 63
    iget-boolean v0, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->in:Z

    if-eqz v0, :cond_2

    .line 65
    invoke-direct {p0, p1}, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->resetUnreadCount(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 71
    .end local v1    # "idTable":Ljava/lang/String;
    .end local v8    # "cursor":Landroid/database/Cursor;
    .end local v10    # "lastRead":I
    .end local v11    # "values":Landroid/content/ContentValues;
    :cond_2
    :goto_3
    return-void

    .line 44
    :cond_3
    iget v0, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->action:I

    if-ne v0, v3, :cond_0

    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "flags&"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->flags:I

    xor-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 46
    iget-boolean v0, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->in:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-lez v0, :cond_0

    .line 47
    invoke-direct {p0, p1}, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->resetUnreadCount(Landroid/database/sqlite/SQLiteDatabase;)V

    goto/16 :goto_0

    .line 51
    :cond_4
    const-string/jumbo v1, "messages_read_ids_out"

    goto/16 :goto_1

    .line 58
    .restart local v1    # "idTable":Ljava/lang/String;
    .restart local v8    # "cursor":Landroid/database/Cursor;
    .restart local v10    # "lastRead":I
    :cond_5
    const-string/jumbo v0, "="

    goto :goto_2

    .line 68
    .end local v1    # "idTable":Ljava/lang/String;
    .end local v8    # "cursor":Landroid/database/Cursor;
    .end local v10    # "lastRead":I
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "UPDATE messages SET flags="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, " WHERE mid="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->mid:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_3
.end method
