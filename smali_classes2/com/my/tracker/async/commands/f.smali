.class public abstract Lcom/my/tracker/async/commands/f;
.super Lcom/my/tracker/async/commands/c;
.source "EventsActionCommand.java"


# instance fields
.field private e:Lcom/my/tracker/database/a;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/my/tracker/database/a;Lcom/my/tracker/b;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0, p1, p3, p4}, Lcom/my/tracker/async/commands/c;-><init>(Ljava/lang/String;Lcom/my/tracker/b;Landroid/content/Context;)V

    .line 48
    iput-object p2, p0, Lcom/my/tracker/async/commands/f;->e:Lcom/my/tracker/database/a;

    .line 49
    return-void
.end method


# virtual methods
.method protected final a(Lcom/my/tracker/enums/a;)Z
    .locals 13

    .prologue
    const-wide/16 v2, 0x0

    const/4 v12, 0x0

    const/4 v0, 0x1

    const/4 v5, 0x0

    .line 92
    invoke-virtual {p0}, Lcom/my/tracker/async/commands/f;->e()Z

    move-result v1

    if-nez v1, :cond_1

    .line 94
    const-string/jumbo v0, "no internet connection"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    move v0, v5

    .line 157
    :cond_0
    :goto_0
    return v0

    .line 100
    :cond_1
    :try_start_0
    invoke-static {}, Lcom/my/tracker/utils/e;->a()Lcom/my/tracker/utils/e;

    move-result-object v1

    iget-object v4, p0, Lcom/my/tracker/async/commands/f;->a:Landroid/content/Context;

    invoke-virtual {v1, v4}, Lcom/my/tracker/utils/e;->a(Landroid/content/Context;)Lcom/my/tracker/utils/e;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 108
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "send criterion: "

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/my/tracker/enums/a;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 1162
    sget-object v1, Lcom/my/tracker/enums/a;->a:Lcom/my/tracker/enums/a;

    if-ne p1, v1, :cond_4

    .line 1164
    iget-object v1, p0, Lcom/my/tracker/async/commands/f;->e:Lcom/my/tracker/database/a;

    .line 1231
    invoke-virtual {v1}, Lcom/my/tracker/database/a;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string/jumbo v4, "SELECT COUNT(*) FROM table_events WHERE type IN (\'install\',\'install_referrer\',\'update\')"

    new-array v7, v5, [Ljava/lang/String;

    invoke-virtual {v1, v4, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 1232
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 1233
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    .line 1234
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 1164
    if-lez v4, :cond_3

    move v1, v0

    .line 109
    :goto_1
    if-eqz v1, :cond_0

    .line 111
    const-string/jumbo v1, "criterion accepted"

    invoke-static {v1}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 112
    iget-object v1, p0, Lcom/my/tracker/async/commands/f;->e:Lcom/my/tracker/database/a;

    invoke-virtual {v1}, Lcom/my/tracker/database/a;->b()Ljava/util/List;

    move-result-object v1

    .line 113
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    .line 114
    if-lez v4, :cond_b

    .line 116
    invoke-virtual {p0}, Lcom/my/tracker/async/commands/f;->d()V

    .line 118
    new-instance v7, Lcom/my/tracker/builders/a;

    invoke-direct {v7}, Lcom/my/tracker/builders/a;-><init>()V

    .line 120
    invoke-virtual {v6}, Lcom/my/tracker/utils/e;->e()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Lcom/my/tracker/builders/a;->a(J)V

    .line 121
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10

    invoke-virtual {v7, v8, v9}, Lcom/my/tracker/builders/a;->b(J)V

    .line 122
    invoke-virtual {v6}, Lcom/my/tracker/utils/e;->d()J

    move-result-wide v8

    .line 123
    cmp-long v10, v8, v2

    if-lez v10, :cond_2

    invoke-virtual {v7, v8, v9}, Lcom/my/tracker/builders/a;->c(J)V

    .line 125
    :cond_2
    invoke-static {}, Lcom/my/tracker/providers/e;->a()Lcom/my/tracker/providers/e;

    move-result-object v8

    invoke-virtual {v8, v7}, Lcom/my/tracker/providers/e;->a(Lcom/my/tracker/builders/a;)V

    .line 127
    iget-object v8, p0, Lcom/my/tracker/async/commands/f;->c:Lcom/my/tracker/b;

    invoke-virtual {v8, v7}, Lcom/my/tracker/b;->a(Lcom/my/tracker/builders/a;)V

    .line 129
    invoke-virtual {v7, v1}, Lcom/my/tracker/builders/a;->a(Ljava/util/List;)V

    .line 131
    invoke-virtual {v7}, Lcom/my/tracker/builders/a;->toString()Ljava/lang/String;

    move-result-object v1

    .line 132
    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "send events. count: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 134
    invoke-virtual {p0, v1}, Lcom/my/tracker/async/commands/f;->a(Ljava/lang/String;)Z

    move-result v4

    .line 135
    if-eqz v4, :cond_a

    .line 137
    const-string/jumbo v1, "events sent successfully"

    invoke-static {v1}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 138
    iget-object v1, p0, Lcom/my/tracker/async/commands/f;->e:Lcom/my/tracker/database/a;

    .line 1531
    const-string/jumbo v7, "delete all events except running sessions"

    invoke-static {v7}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 1532
    invoke-virtual {v1}, Lcom/my/tracker/database/a;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v7

    const-string/jumbo v8, "table_events"

    const-string/jumbo v9, "type <>?  AND event_timestamp_start IS NOT NULL"

    new-array v10, v0, [Ljava/lang/String;

    const-string/jumbo v11, "session"

    aput-object v11, v10, v5

    invoke-virtual {v7, v8, v9, v10}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v7

    .line 1533
    invoke-virtual {v1}, Lcom/my/tracker/database/a;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string/jumbo v8, "table_timestamps"

    invoke-virtual {v1, v8, v12, v12}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1534
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "deleted count: "

    invoke-direct {v1, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 139
    iget-object v1, p0, Lcom/my/tracker/async/commands/f;->e:Lcom/my/tracker/database/a;

    .line 1558
    const-string/jumbo v7, "delete all sessions"

    invoke-static {v7}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 1559
    invoke-virtual {v1}, Lcom/my/tracker/database/a;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string/jumbo v7, "table_sessions"

    invoke-virtual {v1, v7, v12, v12}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 1560
    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "deleted count: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 140
    iget-object v1, p0, Lcom/my/tracker/async/commands/f;->e:Lcom/my/tracker/database/a;

    .line 1565
    invoke-virtual {v1}, Lcom/my/tracker/database/a;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string/jumbo v7, "SELECT COUNT(*) FROM table_events WHERE type =?"

    new-array v8, v0, [Ljava/lang/String;

    const-string/jumbo v9, "session"

    aput-object v9, v8, v5

    invoke-virtual {v1, v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 1566
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 1567
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    .line 1568
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 1569
    if-lez v7, :cond_8

    move v1, v0

    .line 140
    :goto_2
    if-eqz v1, :cond_9

    .line 142
    iget-object v1, p0, Lcom/my/tracker/async/commands/f;->e:Lcom/my/tracker/database/a;

    .line 1574
    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v7, "session"

    aput-object v7, v0, v5

    .line 1578
    invoke-virtual {v1}, Lcom/my/tracker/database/a;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string/jumbo v7, "SELECT event_timestamp_start FROM table_events WHERE type=? AND event_timestamp_start IS NOT NULL "

    invoke-virtual {v1, v7, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 1581
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_c

    .line 1583
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 1584
    const-string/jumbo v0, "event_timestamp_start"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 1585
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 142
    :goto_3
    invoke-virtual {v6, v0, v1}, Lcom/my/tracker/utils/e;->b(J)V

    .line 148
    :goto_4
    iget-object v0, p0, Lcom/my/tracker/async/commands/f;->e:Lcom/my/tracker/database/a;

    .line 1593
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 1594
    const-string/jumbo v7, "timestamps_skipped"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v7, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1596
    invoke-virtual {v0}, Lcom/my/tracker/database/a;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string/jumbo v5, "table_events"

    invoke-virtual {v0, v5, v1, v12, v12}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 149
    invoke-virtual {v6, v2, v3}, Lcom/my/tracker/utils/e;->a(J)V

    .line 150
    invoke-static {}, Lcom/my/tracker/providers/e;->a()Lcom/my/tracker/providers/e;

    move-result-object v0

    iget-object v1, p0, Lcom/my/tracker/async/commands/f;->a:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/my/tracker/providers/e;->a(Landroid/content/Context;)V

    move v0, v4

    goto/16 :goto_0

    .line 101
    :catch_0
    move-exception v0

    .line 103
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "PreferencesManager error: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    move v0, v5

    .line 104
    goto/16 :goto_0

    :cond_3
    move v1, v5

    .line 1164
    goto/16 :goto_1

    .line 1166
    :cond_4
    sget-object v1, Lcom/my/tracker/enums/a;->b:Lcom/my/tracker/enums/a;

    if-ne p1, v1, :cond_6

    .line 1168
    iget-object v1, p0, Lcom/my/tracker/async/commands/f;->e:Lcom/my/tracker/database/a;

    invoke-virtual {v1}, Lcom/my/tracker/database/a;->a()I

    move-result v1

    const/16 v4, 0x64

    if-lt v1, v4, :cond_5

    move v1, v0

    goto/16 :goto_1

    :cond_5
    move v1, v5

    goto/16 :goto_1

    .line 1170
    :cond_6
    sget-object v1, Lcom/my/tracker/enums/a;->c:Lcom/my/tracker/enums/a;

    if-ne p1, v1, :cond_7

    move v1, v0

    goto/16 :goto_1

    :cond_7
    move v1, v5

    .line 1172
    goto/16 :goto_1

    :cond_8
    move v1, v5

    .line 1569
    goto/16 :goto_2

    .line 146
    :cond_9
    invoke-virtual {v6, v2, v3}, Lcom/my/tracker/utils/e;->b(J)V

    goto :goto_4

    .line 152
    :cond_a
    const-string/jumbo v0, "Send events failed"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    move v0, v4

    .line 153
    goto/16 :goto_0

    .line 154
    :cond_b
    const-string/jumbo v1, "no events to send"

    invoke-static {v1}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_c
    move-wide v0, v2

    goto :goto_3
.end method

.method protected final a(Lcom/my/tracker/models/events/c;)Z
    .locals 2

    .prologue
    .line 56
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/my/tracker/async/commands/f;->a(Lcom/my/tracker/models/events/c;J)Z

    move-result v0

    return v0
.end method

.method protected final a(Lcom/my/tracker/models/events/c;J)Z
    .locals 8

    .prologue
    .line 64
    :try_start_0
    invoke-static {}, Lcom/my/tracker/utils/e;->a()Lcom/my/tracker/utils/e;

    move-result-object v0

    iget-object v1, p0, Lcom/my/tracker/async/commands/f;->a:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/my/tracker/utils/e;->a(Landroid/content/Context;)Lcom/my/tracker/utils/e;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 71
    invoke-virtual {v6}, Lcom/my/tracker/utils/e;->e()J

    move-result-wide v2

    .line 72
    const-wide/16 v0, 0x0

    cmp-long v0, v2, v0

    if-nez v0, :cond_0

    .line 74
    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->g()J

    move-result-wide v2

    .line 75
    invoke-virtual {v6, v2, v3}, Lcom/my/tracker/utils/e;->b(J)V

    .line 78
    :cond_0
    iget-object v0, p0, Lcom/my/tracker/async/commands/f;->e:Lcom/my/tracker/database/a;

    move-object v1, p1

    move-wide v4, p2

    invoke-virtual/range {v0 .. v5}, Lcom/my/tracker/database/a;->a(Lcom/my/tracker/models/events/c;JJ)Z

    move-result v0

    if-nez v0, :cond_1

    .line 80
    iget-object v0, p0, Lcom/my/tracker/async/commands/f;->e:Lcom/my/tracker/database/a;

    invoke-virtual {v0, p1, v2, v3}, Lcom/my/tracker/database/a;->a(Lcom/my/tracker/models/events/c;J)Z

    move-result v0

    .line 81
    if-nez v0, :cond_1

    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->a()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "custom"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 83
    invoke-virtual {v6}, Lcom/my/tracker/utils/e;->d()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    invoke-virtual {v6, v0, v1}, Lcom/my/tracker/utils/e;->a(J)V

    .line 87
    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    .line 65
    :catch_0
    move-exception v0

    .line 67
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "PreferencesManager error: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 68
    const/4 v0, 0x0

    goto :goto_0
.end method
