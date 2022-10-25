.class public final Lcom/my/tracker/database/a;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "MyTrackerDBHelper.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 3

    .prologue
    .line 164
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "mytracker_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".db"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x4

    invoke-direct {p0, p2, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 165
    return-void
.end method

.method private a(J)Ljava/util/ArrayList;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/ArrayList",
            "<[",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 454
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 456
    invoke-virtual {p0}, Lcom/my/tracker/database/a;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string/jumbo v2, "SELECT * FROM table_sessions WHERE sid=?"

    new-array v3, v6, [Ljava/lang/String;

    .line 457
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v7

    .line 456
    invoke-virtual {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 458
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_1

    .line 460
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 461
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v2

    if-nez v2, :cond_1

    .line 463
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Long;

    const-string/jumbo v3, "session_timestamp_start"

    .line 464
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v2, v7

    const/4 v3, 0x0

    aput-object v3, v2, v6

    .line 467
    const-string/jumbo v3, "session_timestamp_end"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v3

    if-nez v3, :cond_0

    .line 469
    const-string/jumbo v3, "session_timestamp_end"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v2, v6

    .line 471
    :cond_0
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 472
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 476
    :cond_1
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 477
    return-object v0
.end method


# virtual methods
.method public final a()I
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 195
    invoke-virtual {p0}, Lcom/my/tracker/database/a;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string/jumbo v1, "SELECT COUNT(*) FROM table_events"

    new-array v2, v3, [Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 196
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 197
    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    .line 198
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 199
    return v1
.end method

.method public final a(Lcom/my/tracker/models/events/c;J)Z
    .locals 12

    .prologue
    const/4 v10, 0x0

    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 240
    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->a()Ljava/lang/String;

    move-result-object v2

    .line 241
    const-string/jumbo v3, "custom"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1204
    invoke-virtual {p0}, Lcom/my/tracker/database/a;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string/jumbo v4, "SELECT COUNT(*) FROM table_events WHERE type=?"

    new-array v5, v1, [Ljava/lang/String;

    aput-object v2, v5, v0

    invoke-virtual {v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    .line 1205
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    .line 1206
    invoke-interface {v3, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    .line 1207
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 244
    const/16 v3, 0x1f4

    if-lt v4, v3, :cond_0

    .line 246
    const-string/jumbo v1, "exceeded maximum number of custom events, event ignored"

    invoke-static {v1}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 282
    :goto_0
    return v0

    .line 251
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "insert event type: "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 253
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 254
    const-string/jumbo v3, "type"

    invoke-virtual {v0, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    const-string/jumbo v2, "name"

    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->b()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    const-string/jumbo v2, "timestamps_skipped"

    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->h()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 257
    const-string/jumbo v2, "event_timestamp_start"

    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->i()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 258
    const-string/jumbo v2, "value"

    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->c()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    const-string/jumbo v2, "old_value"

    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->d()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 260
    const-string/jumbo v2, "params"

    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->e()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    invoke-virtual {p0}, Lcom/my/tracker/database/a;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 264
    const-string/jumbo v3, "table_events"

    invoke-virtual {v2, v3, v10, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v4

    .line 266
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 268
    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->f()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 270
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 271
    const-string/jumbo v7, "event_id"

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 272
    const-string/jumbo v7, "timestamp"

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    sub-long/2addr v8, p2

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v6, v7, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 273
    const-string/jumbo v0, "table_timestamps"

    invoke-virtual {v2, v0, v10, v6}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    goto :goto_1

    .line 275
    :cond_1
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 276
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 278
    invoke-virtual {p0}, Lcom/my/tracker/database/a;->a()I

    move-result v0

    .line 279
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "events count: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    move v0, v1

    .line 282
    goto/16 :goto_0
.end method

.method public final a(Lcom/my/tracker/models/events/c;JJ)Z
    .locals 14

    .prologue
    .line 288
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "try to update event type: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->a()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 289
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->a()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->b()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    .line 290
    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->c()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->d()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x4

    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->e()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 291
    invoke-virtual {p0}, Lcom/my/tracker/database/a;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string/jumbo v2, "SELECT id, event_timestamp_start, timestamps_skipped FROM table_events WHERE type=? AND name=? AND value=? AND old_value=? AND params=?"

    invoke-virtual {v1, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 292
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_7

    .line 294
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 295
    const-string/jumbo v0, "id"

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    .line 296
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "found event for update. id: "

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 297
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 298
    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->a()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v5, "session"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 300
    const-string/jumbo v0, "event_timestamp_start"

    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->i()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v4, v0, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 301
    const-string/jumbo v0, "event_timestamp_start"

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 303
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 342
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/my/tracker/database/a;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 344
    invoke-virtual {v4}, Landroid/content/ContentValues;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 346
    const-string/jumbo v0, "table_events"

    const-string/jumbo v5, "id=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    .line 349
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    .line 346
    invoke-virtual {v1, v0, v4, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 352
    :cond_1
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 354
    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->f()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 356
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    .line 357
    const-string/jumbo v6, "event_id"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 358
    const-string/jumbo v6, "timestamp"

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    sub-long v8, v8, p2

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v5, v6, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 359
    const-string/jumbo v0, "table_timestamps"

    const/4 v6, 0x0

    invoke-virtual {v1, v0, v6, v5}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    goto :goto_1

    .line 307
    :cond_2
    const-string/jumbo v0, "event_timestamp_start"

    .line 308
    invoke-interface {v1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    .line 1434
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "push session ["

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sub-long v8, v6, p2

    invoke-virtual {v0, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v5, ","

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-wide/16 v8, 0x0

    cmp-long v0, p4, v8

    if-nez v0, :cond_3

    const-string/jumbo v0, "null"

    .line 1436
    :goto_2
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v5, "]"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1434
    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 1437
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 1438
    const-string/jumbo v5, "sid"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v0, v5, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1439
    const-string/jumbo v5, "session_timestamp_start"

    sub-long v6, v6, p2

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1440
    const-wide/16 v6, 0x0

    cmp-long v5, p4, v6

    if-nez v5, :cond_4

    .line 1442
    const-string/jumbo v5, "session_timestamp_end"

    invoke-virtual {v0, v5}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 1449
    :goto_3
    invoke-virtual {p0}, Lcom/my/tracker/database/a;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    const-string/jumbo v6, "table_sessions"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 311
    const-string/jumbo v0, "timestamps_skipped"

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    .line 312
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 2213
    invoke-virtual {p0}, Lcom/my/tracker/database/a;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string/jumbo v5, "SELECT COUNT(*) FROM table_sessions WHERE sid=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {v1, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 2214
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 2215
    const/4 v5, 0x0

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    .line 2216
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 315
    const/16 v1, 0x1f4

    if-le v5, v1, :cond_0

    .line 317
    add-int/lit16 v1, v5, -0x1f4

    .line 318
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "exceeded maximum number of sessions, remove oldest sessions. count: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 2539
    const-string/jumbo v5, "delete sessions"

    invoke-static {v5}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 2540
    invoke-virtual {p0}, Lcom/my/tracker/database/a;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    const-string/jumbo v6, "table_sessions"

    const-string/jumbo v7, "rowid IN (SELECT rowid FROM table_sessions WHERE sid=? LIMIT ?)"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    .line 2542
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    .line 2540
    invoke-virtual {v5, v6, v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v5

    .line 2543
    new-instance v6, Ljava/lang/StringBuilder;

    const-string/jumbo v7, "deleted count: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 320
    const-string/jumbo v5, "timestamps_skipped"

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v4, v5, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 1434
    :cond_3
    sub-long v8, p4, p2

    .line 1436
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto/16 :goto_2

    .line 1446
    :cond_4
    const-string/jumbo v5, "session_timestamp_end"

    sub-long v6, p4, p2

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto/16 :goto_3

    .line 326
    :cond_5
    const-string/jumbo v0, "timestamps_skipped"

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    .line 327
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 3482
    invoke-virtual {p0}, Lcom/my/tracker/database/a;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string/jumbo v1, "SELECT COUNT(*) FROM table_timestamps WHERE event_id=?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v8, 0x0

    .line 3483
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v5, v8

    .line 3482
    invoke-virtual {v0, v1, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 3484
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 3485
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    .line 3486
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 331
    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->f()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/2addr v0, v1

    add-int/lit16 v0, v0, -0x3e8

    .line 333
    if-lez v0, :cond_0

    .line 335
    int-to-long v0, v0

    .line 3548
    const-string/jumbo v5, "delete timestamps"

    invoke-static {v5}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 3549
    invoke-virtual {p0}, Lcom/my/tracker/database/a;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    const-string/jumbo v8, "table_timestamps"

    const-string/jumbo v9, "rowid IN (SELECT rowid FROM table_timestamps WHERE event_id=? LIMIT ?)"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/String;

    const/4 v11, 0x0

    .line 3551
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v10, v11

    .line 3549
    invoke-virtual {v5, v8, v9, v10}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 3552
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "deleted count: "

    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 336
    int-to-long v0, v0

    add-long/2addr v0, v6

    .line 337
    const-string/jumbo v5, "timestamps_skipped"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v4, v5, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto/16 :goto_0

    .line 361
    :cond_6
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 362
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 364
    const-string/jumbo v0, "event updated"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 367
    const/4 v0, 0x1

    .line 375
    :goto_4
    return v0

    .line 371
    :cond_7
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 372
    const-string/jumbo v0, "no events found for update"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 375
    const/4 v0, 0x0

    goto :goto_4
.end method

.method public final b()Ljava/util/List;
    .locals 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/my/tracker/models/events/c;",
            ">;"
        }
    .end annotation

    .prologue
    .line 380
    .line 4492
    invoke-virtual/range {p0 .. p0}, Lcom/my/tracker/database/a;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string/jumbo v3, "SELECT * FROM table_timestamps"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    .line 4494
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 4495
    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_1

    .line 4497
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    .line 4498
    :goto_0
    invoke-interface {v3}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v2

    if-nez v2, :cond_1

    .line 4501
    const-string/jumbo v2, "event_id"

    invoke-interface {v3, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v3, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    .line 4503
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v11, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 4505
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 4506
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v11, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4512
    :goto_1
    const-string/jumbo v4, "timestamp"

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4514
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 4509
    :cond_0
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v11, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    goto :goto_1

    .line 4517
    :cond_1
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 382
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    .line 384
    invoke-virtual/range {p0 .. p0}, Lcom/my/tracker/database/a;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string/jumbo v3, "SELECT * FROM table_events ORDER BY id"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v19

    .line 385
    invoke-interface/range {v19 .. v19}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_6

    .line 387
    invoke-interface/range {v19 .. v19}, Landroid/database/Cursor;->moveToFirst()Z

    .line 388
    :goto_2
    invoke-interface/range {v19 .. v19}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v2

    if-nez v2, :cond_6

    .line 390
    const-string/jumbo v2, "id"

    move-object/from16 v0, v19

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v19

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v20

    .line 392
    const-string/jumbo v2, "type"

    .line 394
    move-object/from16 v0, v19

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v19

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v2, "name"

    .line 395
    move-object/from16 v0, v19

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v19

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v2, "value"

    .line 396
    move-object/from16 v0, v19

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v19

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v2, "old_value"

    .line 397
    move-object/from16 v0, v19

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v19

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    const-string/jumbo v2, "params"

    .line 398
    move-object/from16 v0, v19

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v19

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v2, "event_timestamp_start"

    .line 399
    move-object/from16 v0, v19

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v19

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v12

    .line 400
    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v11, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    const-string/jumbo v2, "timestamps_skipped"

    .line 401
    move-object/from16 v0, v19

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v19

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v9

    .line 5109
    const/4 v2, -0x1

    invoke-virtual {v6}, Ljava/lang/String;->hashCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_0

    :cond_2
    :goto_3
    packed-switch v2, :pswitch_data_0

    .line 5136
    new-instance v12, Lcom/my/tracker/models/events/b;

    move-object v13, v5

    move-object v14, v7

    move-object v15, v8

    move-wide/from16 v16, v9

    invoke-direct/range {v12 .. v17}, Lcom/my/tracker/models/events/b;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;J)V

    move-object v2, v12

    .line 5139
    :goto_4
    move-wide/from16 v0, v20

    invoke-interface {v2, v0, v1}, Lcom/my/tracker/models/events/c;->c(J)V

    .line 405
    invoke-interface {v2}, Lcom/my/tracker/models/events/c;->a()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "session"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    instance-of v3, v2, Lcom/my/tracker/models/events/h;

    if-eqz v3, :cond_5

    .line 407
    check-cast v2, Lcom/my/tracker/models/events/h;

    .line 408
    invoke-virtual {v2}, Lcom/my/tracker/models/events/h;->j()J

    move-result-wide v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lcom/my/tracker/database/a;->a(J)Ljava/util/ArrayList;

    move-result-object v3

    .line 409
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_4

    .line 411
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_5
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/Long;

    .line 413
    invoke-virtual {v2, v3}, Lcom/my/tracker/models/events/h;->a([Ljava/lang/Long;)V

    goto :goto_5

    .line 5109
    :sswitch_0
    const-string/jumbo v3, "install"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v2, 0x0

    goto :goto_3

    :sswitch_1
    const-string/jumbo v3, "install_referrer"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v2, 0x1

    goto :goto_3

    :sswitch_2
    const-string/jumbo v3, "update"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v2, 0x2

    goto :goto_3

    :sswitch_3
    const-string/jumbo v3, "invite"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v2, 0x3

    goto :goto_3

    :sswitch_4
    const-string/jumbo v3, "login"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v2, 0x4

    goto :goto_3

    :sswitch_5
    const-string/jumbo v3, "registration"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v2, 0x5

    goto/16 :goto_3

    :sswitch_6
    const-string/jumbo v3, "launch"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v2, 0x6

    goto/16 :goto_3

    :sswitch_7
    const-string/jumbo v3, "session"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v2, 0x7

    goto/16 :goto_3

    :sswitch_8
    const-string/jumbo v3, "level_achieved"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/16 v2, 0x8

    goto/16 :goto_3

    :sswitch_9
    const-string/jumbo v3, "purchase"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/16 v2, 0x9

    goto/16 :goto_3

    .line 5112
    :pswitch_0
    new-instance v3, Lcom/my/tracker/models/events/d;

    invoke-static {v4}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    const/4 v6, 0x0

    invoke-direct/range {v3 .. v8}, Lcom/my/tracker/models/events/d;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    move-object v2, v3

    .line 5113
    goto/16 :goto_4

    .line 5115
    :pswitch_1
    new-instance v3, Lcom/my/tracker/models/events/g;

    const/4 v2, 0x0

    invoke-direct {v3, v4, v2, v7, v8}, Lcom/my/tracker/models/events/g;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    move-object v2, v3

    .line 5116
    goto/16 :goto_4

    .line 5118
    :pswitch_2
    new-instance v3, Lcom/my/tracker/models/events/j;

    const/4 v6, 0x0

    invoke-direct/range {v3 .. v8}, Lcom/my/tracker/models/events/j;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    move-object v2, v3

    .line 5119
    goto/16 :goto_4

    .line 5124
    :pswitch_3
    new-instance v5, Lcom/my/tracker/models/events/i;

    invoke-direct/range {v5 .. v10}, Lcom/my/tracker/models/events/i;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;J)V

    move-object v2, v5

    .line 5125
    goto/16 :goto_4

    .line 5127
    :pswitch_4
    new-instance v3, Lcom/my/tracker/models/events/h;

    invoke-direct {v3, v12, v13, v9, v10}, Lcom/my/tracker/models/events/h;-><init>(JJ)V

    move-object v2, v3

    .line 5128
    goto/16 :goto_4

    .line 5130
    :pswitch_5
    new-instance v3, Lcom/my/tracker/models/events/e;

    invoke-direct {v3, v7, v8, v9, v10}, Lcom/my/tracker/models/events/e;-><init>(Ljava/lang/String;Ljava/util/List;J)V

    move-object v2, v3

    .line 5131
    goto/16 :goto_4

    .line 5133
    :pswitch_6
    new-instance v3, Lcom/my/tracker/models/events/f;

    invoke-direct {v3, v7, v8}, Lcom/my/tracker/models/events/f;-><init>(Ljava/lang/String;Ljava/util/List;)V

    move-object v2, v3

    .line 5134
    goto/16 :goto_4

    .line 415
    :cond_3
    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 424
    :cond_4
    :goto_6
    invoke-interface/range {v19 .. v19}, Landroid/database/Cursor;->moveToNext()Z

    goto/16 :goto_2

    .line 420
    :cond_5
    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 427
    :cond_6
    invoke-interface/range {v19 .. v19}, Landroid/database/Cursor;->close()V

    .line 429
    return-object v18

    .line 5109
    :sswitch_data_0
    .sparse-switch
        -0x507c1747 -> :sswitch_5
        -0x468dd0f7 -> :sswitch_3
        -0x4226dc4d -> :sswitch_6
        -0x31ffc737 -> :sswitch_2
        0x625ef69 -> :sswitch_4
        0x4a8a8a8e -> :sswitch_8
        0x4f36a643 -> :sswitch_1
        0x67e90501 -> :sswitch_9
        0x74ae259b -> :sswitch_0
        0x76508296 -> :sswitch_7
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public final onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    .prologue
    .line 173
    const-string/jumbo v0, "CREATE TABLE table_events (id integer primary key autoincrement, type text not null, name text not null, timestamps_skipped integer not null, event_timestamp_start integer, value text not null, old_value text not null, params text not null  );"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 174
    const-string/jumbo v0, "CREATE TABLE table_sessions (sid integer not null, session_timestamp_start integer not null, session_timestamp_end integer  );"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 175
    const-string/jumbo v0, "CREATE TABLE table_timestamps (event_id integer not null, timestamp integer not null  );"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 176
    return-void
.end method

.method public final onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0

    .prologue
    .line 190
    invoke-virtual {p0, p1, p2, p3}, Lcom/my/tracker/database/a;->onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V

    .line 191
    return-void
.end method

.method public final onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 1

    .prologue
    .line 181
    const-string/jumbo v0, "DROP TABLE IF EXISTS table_events"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 182
    const-string/jumbo v0, "DROP TABLE IF EXISTS table_sessions"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 183
    const-string/jumbo v0, "DROP TABLE IF EXISTS table_timestamps"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 184
    invoke-virtual {p0, p1}, Lcom/my/tracker/database/a;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 185
    return-void
.end method
