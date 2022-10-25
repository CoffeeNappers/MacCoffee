.class public final Lru/mail/libverify/sms/d;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/sms/c;


# instance fields
.field private final a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lru/mail/libverify/sms/d;->a:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final a(Lru/mail/libverify/sms/c$a;)Ljava/util/List;
    .locals 22
    .param p1    # Lru/mail/libverify/sms/c$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lru/mail/libverify/sms/c$a;",
            ")",
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/sms/SmsItem;",
            ">;"
        }
    .end annotation

    invoke-interface/range {p1 .. p1}, Lru/mail/libverify/sms/c$a;->c()I

    move-result v11

    invoke-interface/range {p1 .. p1}, Lru/mail/libverify/sms/c$a;->d()I

    move-result v12

    invoke-interface/range {p1 .. p1}, Lru/mail/libverify/sms/c$a;->a()J

    move-result-wide v14

    invoke-interface/range {p1 .. p1}, Lru/mail/libverify/sms/c$a;->b()J

    move-result-wide v16

    const/4 v10, 0x0

    const-string/jumbo v4, "KnownSmsFinder"

    const-string/jumbo v5, "start query with params: depth %d, maxCount %d, maxTimeShift %d, minTimeShift %d"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x2

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x3

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :try_start_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lru/mail/libverify/sms/d;->a:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v5, Lru/mail/libverify/sms/a;->c:Landroid/net/Uri;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    new-instance v9, Ljava/lang/StringBuilder;

    const-string/jumbo v13, "date DESC LIMIT "

    invoke-direct {v9, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v5

    if-nez v5, :cond_1

    :try_start_1
    sget-object v4, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v5, :cond_0

    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    :cond_0
    :goto_0
    return-object v4

    :cond_1
    :try_start_2
    const-string/jumbo v4, "address"

    invoke-interface {v5, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    const-string/jumbo v4, "body"

    invoke-interface {v5, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v8

    const-string/jumbo v4, "date"

    invoke-interface {v5, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    new-instance v10, Ljava/util/HashSet;

    invoke-direct {v10}, Ljava/util/HashSet;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v5}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_6

    const/4 v6, 0x0

    :cond_2
    if-gt v6, v11, :cond_5

    invoke-interface {v5, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v18

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    sub-long v18, v20, v18

    const-wide/16 v20, 0x0

    cmp-long v13, v18, v20

    if-ltz v13, :cond_4

    cmp-long v13, v18, v16

    if-ltz v13, :cond_4

    cmp-long v13, v18, v14

    if-gtz v13, :cond_5

    invoke-interface {v5, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v5, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Lru/mail/libverify/sms/c$a;->b(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_3

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Lru/mail/libverify/sms/c$a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v19

    if-nez v19, :cond_3

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_3

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v19, Lru/mail/libverify/sms/SmsItem;

    invoke-interface {v5, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v20

    move-object/from16 v0, v19

    move-wide/from16 v1, v20

    move-object/from16 v3, v18

    invoke-direct {v0, v1, v2, v13, v3}, Lru/mail/libverify/sms/SmsItem;-><init>(JLjava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v13

    if-gt v13, v12, :cond_5

    add-int/lit8 v6, v6, 0x1

    :cond_4
    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v13

    if-nez v13, :cond_2

    :cond_5
    if-eqz v5, :cond_0

    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0

    :cond_6
    :try_start_3
    sget-object v4, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v5, :cond_0

    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0

    :catch_0
    move-exception v4

    move-object v5, v10

    :goto_1
    :try_start_4
    const-string/jumbo v6, "KnownSmsFinder"

    const-string/jumbo v7, "query sms database interrupted"

    invoke-static {v6, v7, v4}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catchall_0
    move-exception v4

    :goto_2
    if-eqz v5, :cond_7

    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    :cond_7
    throw v4

    :catch_1
    move-exception v4

    move-object v5, v10

    :goto_3
    :try_start_5
    const-string/jumbo v6, "KnownSmsFinder"

    const-string/jumbo v7, "failed to query sms database"

    invoke-static {v6, v7, v4}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-eqz v5, :cond_8

    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    :cond_8
    sget-object v4, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto/16 :goto_0

    :catchall_1
    move-exception v4

    move-object v5, v10

    goto :goto_2

    :catch_2
    move-exception v4

    goto :goto_3

    :catch_3
    move-exception v4

    goto :goto_1
.end method

.method public final a(Lru/mail/libverify/sms/c$a;Ljava/util/Collection;)Ljava/util/List;
    .locals 10
    .param p1    # Lru/mail/libverify/sms/c$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lru/mail/libverify/sms/c$a;",
            "Ljava/util/Collection",
            "<",
            "Lru/mail/libverify/sms/SmsItem;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/sms/SmsItem;",
            ">;"
        }
    .end annotation

    :try_start_0
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/sms/SmsItem;

    iget-object v4, v0, Lru/mail/libverify/sms/SmsItem;->from:Ljava/lang/String;

    iget-object v5, v0, Lru/mail/libverify/sms/SmsItem;->extracted:Ljava/lang/String;

    if-eqz v5, :cond_0

    if-eqz v4, :cond_0

    invoke-interface {p1, v4}, Lru/mail/libverify/sms/c$a;->b(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {p1, v5}, Lru/mail/libverify/sms/c$a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-virtual {v2, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-virtual {v2, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v6, Lru/mail/libverify/sms/SmsItem;

    iget-wide v8, v0, Lru/mail/libverify/sms/SmsItem;->timestamp:J

    invoke-direct {v6, v8, v9, v4, v5}, Lru/mail/libverify/sms/SmsItem;-><init>(JLjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "KnownSmsFinder"

    const-string/jumbo v2, "failed to query sms list"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_1
    return-object v0

    :cond_1
    move-object v0, v1

    goto :goto_1
.end method
