.class public Lcom/vkontakte/android/cache/Cache;
.super Ljava/lang/Object;
.source "Cache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/cache/Cache$BirthdayEntry;,
        Lcom/vkontakte/android/cache/Cache$OpenHelper;
    }
.end annotation


# static fields
.field private static final DEBUG:Z

.field private static lockSemaphore:Ljava/util/concurrent/Semaphore;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 49
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    sput-object v0, Lcom/vkontakte/android/cache/Cache;->lockSemaphore:Ljava/util/concurrent/Semaphore;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addMessages(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/Message;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 606
    .local p0, "msgs":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/Message;>;"
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 609
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 610
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_2

    .line 611
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/Message;

    iget v4, v4, Lcom/vkontakte/android/Message;->id:I

    if-gez v4, :cond_0

    .line 610
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 614
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_1

    .line 615
    const/16 v4, 0x2c

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/Message;

    iget v4, v4, Lcom/vkontakte/android/Message;->randomId:I

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 627
    .end local v0    # "builder":Ljava/lang/StringBuilder;
    .end local v2    # "i":I
    :catch_0
    move-exception v3

    .line 628
    .local v3, "x":Ljava/lang/Exception;
    :try_start_1
    const-string/jumbo v4, "vk"

    const-string/jumbo v5, "Error writing messages cache DB!"

    invoke-static {v4, v5, v3}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 630
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 632
    .end local v3    # "x":Ljava/lang/Exception;
    :goto_2
    return-void

    .line 617
    .restart local v0    # "builder":Ljava/lang/StringBuilder;
    .restart local v2    # "i":I
    :cond_1
    :try_start_2
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/Message;

    iget v4, v4, Lcom/vkontakte/android/Message;->randomId:I

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 630
    .end local v0    # "builder":Ljava/lang/StringBuilder;
    .end local v2    # "i":I
    :catchall_0
    move-exception v4

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v4

    .line 620
    .restart local v0    # "builder":Ljava/lang/StringBuilder;
    .restart local v2    # "i":I
    :cond_2
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/cache/Cache;->clearSendingMessage(Ljava/lang/String;)V

    .line 622
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 623
    const/4 v2, 0x0

    :goto_3
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_3

    .line 624
    new-instance v5, Lcom/vkontakte/android/cache/AddMessageAction;

    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/Message;

    invoke-direct {v5, v4}, Lcom/vkontakte/android/cache/AddMessageAction;-><init>(Lcom/vkontakte/android/Message;)V

    invoke-virtual {v5, v1}, Lcom/vkontakte/android/cache/AddMessageAction;->apply(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 623
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 626
    :cond_3
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 630
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_2
.end method

.method public static applyMessagesActions(Ljava/util/ArrayList;)I
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/cache/MessagesAction;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 906
    .local p0, "acts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/cache/MessagesAction;>;"
    const/4 v2, 0x0

    .line 907
    .local v2, "result":I
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 908
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 910
    .local v4, "t":J
    :try_start_0
    sget-object v8, Lcom/vkontakte/android/cache/Cache;->lockSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v8}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 911
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 912
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/cache/MessagesAction;

    .line 913
    .local v0, "act":Lcom/vkontakte/android/cache/MessagesAction;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 914
    .local v6, "t1":J
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/cache/MessagesAction;->apply(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 920
    .end local v0    # "act":Lcom/vkontakte/android/cache/MessagesAction;
    .end local v6    # "t1":J
    :catch_0
    move-exception v3

    .line 921
    .local v3, "x":Ljava/lang/Exception;
    :try_start_1
    const-string/jumbo v8, "vk"

    const-string/jumbo v9, "Error writing messages cache DB!"

    invoke-static {v8, v9, v3}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 923
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 928
    .end local v3    # "x":Ljava/lang/Exception;
    :goto_1
    sget-object v8, Lcom/vkontakte/android/cache/Cache;->lockSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v8}, Ljava/util/concurrent/Semaphore;->release()V

    .line 929
    return v2

    .line 919
    :cond_0
    :try_start_2
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 923
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_1

    :catchall_0
    move-exception v8

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v8
.end method

.method public static clear()V
    .locals 0

    .prologue
    .line 106
    invoke-static {}, Lcom/vkontakte/android/cache/Cache$OpenHelper;->clear()V

    .line 107
    return-void
.end method

.method public static clearSendingMessage(Ljava/lang/String;)V
    .locals 11
    .param p0, "randomIds"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 731
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string/jumbo v1, "messages"

    new-array v2, v10, [Ljava/lang/String;

    const-string/jumbo v3, "mid"

    aput-object v3, v2, v9

    const-string/jumbo v3, "mid<0 AND random_id IN  (?)"

    new-array v4, v10, [Ljava/lang/String;

    .line 732
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v9

    move-object v6, v5

    move-object v7, v5

    .line 731
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 733
    .local v8, "cursor":Landroid/database/Cursor;
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 735
    :cond_0
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.MESSAGE_DELETED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "msg_id"

    .line 736
    invoke-interface {v8, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    .line 735
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 737
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 738
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string/jumbo v1, "messages"

    const-string/jumbo v2, "mid<0 AND random_id IN (?)"

    new-array v3, v10, [Ljava/lang/String;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v9

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 740
    :cond_1
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 741
    return-void
.end method

.method public static containsMessage(I)Z
    .locals 13
    .param p0, "mid"    # I

    .prologue
    const/4 v11, 0x1

    const/4 v12, 0x0

    .line 758
    const/4 v9, 0x0

    .line 759
    .local v9, "result":Z
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 761
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    const-string/jumbo v1, "messages"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string/jumbo v4, "mid"

    aput-object v4, v2, v3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "mid="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 762
    .local v8, "cursor":Landroid/database/Cursor;
    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_0

    move v9, v11

    .line 763
    :goto_0
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 767
    .end local v8    # "cursor":Landroid/database/Cursor;
    :goto_1
    return v9

    .restart local v8    # "cursor":Landroid/database/Cursor;
    :cond_0
    move v9, v12

    .line 762
    goto :goto_0

    .line 764
    .end local v8    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v10

    .line 765
    .local v10, "x":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "Error writing messages cache DB!"

    invoke-static {v1, v2, v10}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public static deleteAllMessages()V
    .locals 5

    .prologue
    .line 1054
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1056
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    const-string/jumbo v2, "messages"

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1057
    const-string/jumbo v2, "chats"

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1058
    const-string/jumbo v2, "chats_users"

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1063
    :goto_0
    return-void

    .line 1060
    :catch_0
    move-exception v1

    .line 1061
    .local v1, "x":Ljava/lang/Exception;
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Error reading messages cache DB!"

    invoke-static {v2, v3, v1}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static deleteApiRequest(I)V
    .locals 5
    .param p0, "id"    # I

    .prologue
    .line 1172
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1174
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    const-string/jumbo v2, "api_queue"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1178
    :goto_0
    return-void

    .line 1175
    :catch_0
    move-exception v1

    .line 1176
    .local v1, "x":Ljava/lang/Exception;
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Error writing api queue DB!"

    invoke-static {v2, v3, v1}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static deleteDialog(I)V
    .locals 5
    .param p0, "peer"    # I

    .prologue
    .line 771
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 773
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    const-string/jumbo v2, "messages"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "peer="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 774
    const-string/jumbo v2, "messages_top_ids"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "peer="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 778
    :goto_0
    return-void

    .line 775
    :catch_0
    move-exception v1

    .line 776
    .local v1, "x":Ljava/lang/Exception;
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Error writing messages cache DB!"

    invoke-static {v2, v3, v1}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static deleteMessages(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1045
    .local p0, "ids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1047
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    const-string/jumbo v2, "messages"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "mid in ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ","

    invoke-static {v4, p0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1051
    :goto_0
    return-void

    .line 1048
    :catch_0
    move-exception v1

    .line 1049
    .local v1, "x":Ljava/lang/Exception;
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Error reading messages cache DB!"

    invoke-static {v2, v3, v1}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static getApiRequest()Lcom/vkontakte/android/data/PersistentAPIRequest;
    .locals 16

    .prologue
    .line 1181
    const/4 v12, 0x0

    .line 1182
    .local v12, "res":Lcom/vkontakte/android/data/PersistentAPIRequest;
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1184
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    new-instance v14, Landroid/content/ContentValues;

    invoke-direct {v14}, Landroid/content/ContentValues;-><init>()V

    .line 1185
    .local v14, "values":Landroid/content/ContentValues;
    const-string/jumbo v1, "api_queue"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string/jumbo v8, "1"

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 1186
    .local v10, "cursor":Landroid/database/Cursor;
    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_1

    .line 1187
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    .line 1188
    invoke-static {v10, v14}, Landroid/database/DatabaseUtils;->cursorRowToContentValues(Landroid/database/Cursor;Landroid/content/ContentValues;)V

    .line 1189
    new-instance v13, Lcom/vkontakte/android/data/PersistentAPIRequest;

    invoke-direct {v13}, Lcom/vkontakte/android/data/PersistentAPIRequest;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 1190
    .end local v12    # "res":Lcom/vkontakte/android/data/PersistentAPIRequest;
    .local v13, "res":Lcom/vkontakte/android/data/PersistentAPIRequest;
    :try_start_1
    const-string/jumbo v1, "id"

    invoke-virtual {v14, v1}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, v13, Lcom/vkontakte/android/data/PersistentAPIRequest;->id:I

    .line 1191
    const-string/jumbo v1, "args"

    invoke-virtual {v14, v1}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2

    new-instance v1, Lorg/json/JSONObject;

    const-string/jumbo v2, "args"

    invoke-virtual {v14, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    :goto_0
    iput-object v1, v13, Lcom/vkontakte/android/data/PersistentAPIRequest;->args:Lorg/json/JSONObject;

    .line 1192
    const-string/jumbo v1, "user_data"

    invoke-virtual {v14, v1}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_3

    new-instance v1, Lorg/json/JSONObject;

    const-string/jumbo v2, "user_data"

    invoke-virtual {v14, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    :goto_1
    iput-object v1, v13, Lcom/vkontakte/android/data/PersistentAPIRequest;->userdata:Lorg/json/JSONObject;

    .line 1193
    const-string/jumbo v1, "success_callback"

    invoke-virtual {v14, v1}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1195
    :try_start_2
    const-string/jumbo v1, "success_callback"

    invoke-virtual {v14, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    .line 1196
    .local v11, "m":[Ljava/lang/String;
    const/4 v1, 0x0

    aget-object v1, v11, v1

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    .line 1197
    .local v9, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x1

    aget-object v1, v11, v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Lorg/json/JSONObject;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-class v4, Lorg/json/JSONObject;

    aput-object v4, v2, v3

    invoke-virtual {v9, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, v13, Lcom/vkontakte/android/data/PersistentAPIRequest;->callback:Ljava/lang/reflect/Method;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 1202
    .end local v9    # "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v11    # "m":[Ljava/lang/String;
    :cond_0
    :goto_2
    :try_start_3
    const-string/jumbo v1, "method"

    invoke-virtual {v14, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v13, Lcom/vkontakte/android/data/PersistentAPIRequest;->method:Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    move-object v12, v13

    .line 1204
    .end local v13    # "res":Lcom/vkontakte/android/data/PersistentAPIRequest;
    .restart local v12    # "res":Lcom/vkontakte/android/data/PersistentAPIRequest;
    :cond_1
    :try_start_4
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 1208
    .end local v10    # "cursor":Landroid/database/Cursor;
    .end local v14    # "values":Landroid/content/ContentValues;
    :goto_3
    return-object v12

    .line 1191
    .end local v12    # "res":Lcom/vkontakte/android/data/PersistentAPIRequest;
    .restart local v10    # "cursor":Landroid/database/Cursor;
    .restart local v13    # "res":Lcom/vkontakte/android/data/PersistentAPIRequest;
    .restart local v14    # "values":Landroid/content/ContentValues;
    :cond_2
    const/4 v1, 0x0

    goto :goto_0

    .line 1192
    :cond_3
    const/4 v1, 0x0

    goto :goto_1

    .line 1198
    :catch_0
    move-exception v15

    .line 1199
    .local v15, "x":Ljava/lang/Exception;
    :try_start_5
    const-string/jumbo v1, "vk"

    invoke-static {v1, v15}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_2

    .line 1205
    .end local v15    # "x":Ljava/lang/Exception;
    :catch_1
    move-exception v15

    move-object v12, v13

    .line 1206
    .end local v10    # "cursor":Landroid/database/Cursor;
    .end local v13    # "res":Lcom/vkontakte/android/data/PersistentAPIRequest;
    .end local v14    # "values":Landroid/content/ContentValues;
    .restart local v12    # "res":Lcom/vkontakte/android/data/PersistentAPIRequest;
    .restart local v15    # "x":Ljava/lang/Exception;
    :goto_4
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "Error reading api queue DB!"

    invoke-static {v1, v2, v15}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3

    .line 1205
    .end local v15    # "x":Ljava/lang/Exception;
    :catch_2
    move-exception v15

    goto :goto_4
.end method

.method public static getBirthdays(J)Ljava/util/ArrayList;
    .locals 14
    .param p0, "date"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 114
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 115
    .local v3, "db":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 117
    .local v5, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :try_start_0
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 118
    .local v1, "d":Ljava/util/Date;
    new-instance v2, Ljava/util/Date;

    const-wide/32 v8, 0x5265c00

    add-long/2addr v8, p0

    invoke-direct {v2, v8, v9}, Ljava/util/Date;-><init>(J)V

    .line 119
    .local v2, "d2":Ljava/util/Date;
    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v9, "SELECT * FROM users WHERE ((bday=%d AND bmonth=%d) OR (bday=%d AND bmonth=%d)) AND is_friend = 1 ORDER BY bmonth,bday"

    const/4 v10, 0x4

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-virtual {v1}, Ljava/util/Date;->getDate()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    invoke-virtual {v1}, Ljava/util/Date;->getMonth()I

    move-result v12

    add-int/lit8 v12, v12, 0x1

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x2

    invoke-virtual {v2}, Ljava/util/Date;->getDate()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x3

    invoke-virtual {v2}, Ljava/util/Date;->getMonth()I

    move-result v12

    add-int/lit8 v12, v12, 0x1

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v3, v8, v9}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 120
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_1

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v8

    if-lez v8, :cond_1

    .line 121
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 122
    .local v6, "values":Landroid/content/ContentValues;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 124
    :cond_0
    invoke-static {v0, v6}, Landroid/database/DatabaseUtils;->cursorRowToContentValues(Landroid/database/Cursor;Landroid/content/ContentValues;)V

    .line 125
    new-instance v4, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v4}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 126
    .local v4, "profile":Lcom/vkontakte/android/UserProfile;
    const-string/jumbo v8, "uid"

    invoke-virtual {v6, v8}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    iput v8, v4, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 127
    const-string/jumbo v8, "firstname"

    invoke-virtual {v6, v8}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v4, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 128
    const-string/jumbo v8, "domain"

    invoke-virtual {v6, v8}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v4, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    .line 129
    const-string/jumbo v8, "lastname"

    invoke-virtual {v6, v8}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v4, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 130
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, v4, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, v4, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v4, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 131
    const-string/jumbo v8, "photo_small"

    invoke-virtual {v6, v8}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v4, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 132
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "bday"

    invoke-virtual {v6, v9}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "bmonth"

    invoke-virtual {v6, v9}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v8, "byear"

    invoke-virtual {v6, v8}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    if-eqz v8, :cond_2

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "."

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v10, "byear"

    invoke-virtual {v6, v10}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    :goto_0
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v4, Lcom/vkontakte/android/UserProfile;->bdate:Ljava/lang/String;

    .line 133
    const-string/jumbo v8, "name_r"

    invoke-virtual {v6, v8}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v4, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    .line 134
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 135
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v8

    if-nez v8, :cond_0

    .line 137
    .end local v4    # "profile":Lcom/vkontakte/android/UserProfile;
    .end local v6    # "values":Landroid/content/ContentValues;
    :cond_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 141
    .end local v0    # "cursor":Landroid/database/Cursor;
    .end local v1    # "d":Ljava/util/Date;
    .end local v2    # "d2":Ljava/util/Date;
    :goto_1
    return-object v5

    .line 132
    .restart local v0    # "cursor":Landroid/database/Cursor;
    .restart local v1    # "d":Ljava/util/Date;
    .restart local v2    # "d2":Ljava/util/Date;
    .restart local v4    # "profile":Lcom/vkontakte/android/UserProfile;
    .restart local v6    # "values":Landroid/content/ContentValues;
    :cond_2
    const-string/jumbo v8, ""
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 138
    .end local v0    # "cursor":Landroid/database/Cursor;
    .end local v1    # "d":Ljava/util/Date;
    .end local v2    # "d2":Ljava/util/Date;
    .end local v4    # "profile":Lcom/vkontakte/android/UserProfile;
    .end local v6    # "values":Landroid/content/ContentValues;
    :catch_0
    move-exception v7

    .line 139
    .local v7, "x":Ljava/lang/Exception;
    const-string/jumbo v8, "vk"

    const-string/jumbo v9, "Error reading friends cache DB!"

    invoke-static {v8, v9, v7}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public static getChatAdmin(I)I
    .locals 6
    .param p0, "id"    # I

    .prologue
    .line 962
    const/4 v2, 0x0

    .line 963
    .local v2, "result":I
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 965
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "SELECT admin FROM chats WHERE cid="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 966
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 967
    const/4 v4, 0x0

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 968
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 972
    .end local v0    # "cursor":Landroid/database/Cursor;
    :goto_0
    return v2

    .line 969
    :catch_0
    move-exception v3

    .line 970
    .local v3, "x":Ljava/lang/Exception;
    const-string/jumbo v4, "vk"

    const-string/jumbo v5, "Error reading messages cache DB!"

    invoke-static {v4, v5, v3}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static getChatInfo(I)[Ljava/lang/String;
    .locals 8
    .param p0, "id"    # I

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 947
    const/4 v4, 0x2

    new-array v2, v4, [Ljava/lang/String;

    const-string/jumbo v4, "?"

    aput-object v4, v2, v5

    aput-object v7, v2, v6

    .line 948
    .local v2, "result":[Ljava/lang/String;
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 950
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "SELECT title, photo FROM chats WHERE cid="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 951
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 952
    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    .line 953
    const/4 v4, 0x1

    const/4 v5, 0x1

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    .line 954
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 958
    .end local v0    # "cursor":Landroid/database/Cursor;
    :goto_0
    return-object v2

    .line 955
    :catch_0
    move-exception v3

    .line 956
    .local v3, "x":Ljava/lang/Exception;
    const-string/jumbo v4, "vk"

    const-string/jumbo v5, "Error reading messages cache DB!"

    invoke-static {v4, v5, v3}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static getChatUsers(I)Ljava/util/ArrayList;
    .locals 19
    .param p0, "id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ChatUser;",
            ">;"
        }
    .end annotation

    .prologue
    .line 976
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 977
    .local v15, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ChatUser;>;"
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 978
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 981
    .local v11, "needGet":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :try_start_0
    const-string/jumbo v2, "chats_users"

    const/4 v3, 0x0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "cid="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 982
    .local v10, "cursor":Landroid/database/Cursor;
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    .line 983
    new-instance v17, Landroid/content/ContentValues;

    invoke-direct/range {v17 .. v17}, Landroid/content/ContentValues;-><init>()V

    .line 984
    .local v17, "values":Landroid/content/ContentValues;
    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_3

    .line 986
    :cond_0
    move-object/from16 v0, v17

    invoke-static {v10, v0}, Landroid/database/DatabaseUtils;->cursorRowToContentValues(Landroid/database/Cursor;Landroid/content/ContentValues;)V

    .line 987
    new-instance v9, Lcom/vkontakte/android/ChatUser;

    invoke-direct {v9}, Lcom/vkontakte/android/ChatUser;-><init>()V

    .line 988
    .local v9, "cu":Lcom/vkontakte/android/ChatUser;
    new-instance v2, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v2}, Lcom/vkontakte/android/UserProfile;-><init>()V

    iput-object v2, v9, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    .line 989
    new-instance v2, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v2}, Lcom/vkontakte/android/UserProfile;-><init>()V

    iput-object v2, v9, Lcom/vkontakte/android/ChatUser;->inviter:Lcom/vkontakte/android/UserProfile;

    .line 990
    iget-object v2, v9, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    const-string/jumbo v3, "uid"

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iput v3, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 991
    iget-object v2, v9, Lcom/vkontakte/android/ChatUser;->inviter:Lcom/vkontakte/android/UserProfile;

    const-string/jumbo v3, "inviter"

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iput v3, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 992
    iget-object v2, v9, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    iget v2, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v11, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 993
    iget-object v2, v9, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    iget v2, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v11, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 995
    :cond_1
    iget-object v2, v9, Lcom/vkontakte/android/ChatUser;->inviter:Lcom/vkontakte/android/UserProfile;

    iget v2, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v11, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 996
    iget-object v2, v9, Lcom/vkontakte/android/ChatUser;->inviter:Lcom/vkontakte/android/UserProfile;

    iget v2, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v11, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 998
    :cond_2
    invoke-virtual {v15, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 999
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1001
    .end local v9    # "cu":Lcom/vkontakte/android/ChatUser;
    :cond_3
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1005
    .end local v10    # "cursor":Landroid/database/Cursor;
    .end local v17    # "values":Landroid/content/ContentValues;
    :goto_0
    invoke-static {v11}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v13

    .line 1006
    .local v13, "pp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    new-instance v14, Landroid/util/SparseArray;

    invoke-direct {v14}, Landroid/util/SparseArray;-><init>()V

    .line 1007
    .local v14, "profiles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/vkontakte/android/UserProfile;

    .line 1008
    .local v12, "p":Lcom/vkontakte/android/UserProfile;
    iget v3, v12, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v14, v3, v12}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_1

    .line 1002
    .end local v12    # "p":Lcom/vkontakte/android/UserProfile;
    .end local v13    # "pp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    .end local v14    # "profiles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    :catch_0
    move-exception v18

    .line 1003
    .local v18, "x":Ljava/lang/Exception;
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Error reading messages cache DB!"

    move-object/from16 v0, v18

    invoke-static {v2, v3, v0}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 1010
    .end local v18    # "x":Ljava/lang/Exception;
    .restart local v13    # "pp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    .restart local v14    # "profiles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    :cond_4
    invoke-virtual {v15}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/vkontakte/android/ChatUser;

    .line 1011
    .local v16, "user":Lcom/vkontakte/android/ChatUser;
    move-object/from16 v0, v16

    iget-object v2, v0, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    iget v2, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v14, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    move-object/from16 v0, v16

    iput-object v2, v0, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    .line 1012
    move-object/from16 v0, v16

    iget-object v2, v0, Lcom/vkontakte/android/ChatUser;->inviter:Lcom/vkontakte/android/UserProfile;

    iget v2, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v14, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    move-object/from16 v0, v16

    iput-object v2, v0, Lcom/vkontakte/android/ChatUser;->inviter:Lcom/vkontakte/android/UserProfile;

    goto :goto_2

    .line 1014
    .end local v16    # "user":Lcom/vkontakte/android/ChatUser;
    :cond_5
    return-object v15
.end method

.method public static getDialogs(II)Ljava/util/ArrayList;
    .locals 18
    .param p0, "offset"    # I
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/DialogEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 651
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 652
    .local v13, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/DialogEntry;>;"
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 654
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    const-string/jumbo v2, "dialogs"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string/jumbo v8, "msg_time desc"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v0, p0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v17, ","

    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move/from16 v0, p1

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual/range {v1 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 655
    .local v10, "cursor":Landroid/database/Cursor;
    new-instance v15, Landroid/content/ContentValues;

    invoke-direct {v15}, Landroid/content/ContentValues;-><init>()V

    .line 656
    .local v15, "values":Landroid/content/ContentValues;
    const-string/jumbo v2, "vk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "count="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 657
    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_2

    .line 658
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    .line 660
    :cond_0
    invoke-static {v10, v15}, Landroid/database/DatabaseUtils;->cursorRowToContentValues(Landroid/database/Cursor;Landroid/content/ContentValues;)V

    .line 662
    new-instance v12, Lcom/vkontakte/android/Message;

    invoke-direct {v12, v15}, Lcom/vkontakte/android/Message;-><init>(Landroid/content/ContentValues;)V

    .line 665
    .local v12, "msg":Lcom/vkontakte/android/Message;
    new-instance v14, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v14}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 666
    .local v14, "user":Lcom/vkontakte/android/UserProfile;
    iget v2, v12, Lcom/vkontakte/android/Message;->peer:I

    iput v2, v14, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 667
    iget v2, v12, Lcom/vkontakte/android/Message;->peer:I

    const v3, 0x77359400

    if-ge v2, v3, :cond_3

    .line 668
    const-string/jumbo v2, "firstname"

    invoke-virtual {v15, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v14, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 669
    const-string/jumbo v2, "lastname"

    invoke-virtual {v15, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v14, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 670
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v14, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v14, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v14, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 671
    const-string/jumbo v2, "photo_small"

    invoke-virtual {v15, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v14, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 672
    iget v2, v14, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v2}, Lcom/vkontakte/android/data/Friends;->getOnlineStatus(I)I

    move-result v2

    iput v2, v14, Lcom/vkontakte/android/UserProfile;->online:I

    .line 681
    :goto_0
    new-instance v11, Lcom/vkontakte/android/DialogEntry;

    invoke-direct {v11}, Lcom/vkontakte/android/DialogEntry;-><init>()V

    .line 682
    .local v11, "e":Lcom/vkontakte/android/DialogEntry;
    iput-object v12, v11, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    .line 683
    iput-object v14, v11, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    .line 684
    const-string/jumbo v2, "unread_count"

    invoke-virtual {v15, v2}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 685
    const-string/jumbo v2, "unread_count"

    invoke-virtual {v15, v2}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, v11, Lcom/vkontakte/android/DialogEntry;->unreadCount:I

    .line 688
    :cond_1
    invoke-virtual {v13, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 689
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 691
    .end local v11    # "e":Lcom/vkontakte/android/DialogEntry;
    .end local v12    # "msg":Lcom/vkontakte/android/Message;
    .end local v14    # "user":Lcom/vkontakte/android/UserProfile;
    :cond_2
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 695
    .end local v10    # "cursor":Landroid/database/Cursor;
    .end local v15    # "values":Landroid/content/ContentValues;
    :goto_1
    return-object v13

    .line 674
    .restart local v10    # "cursor":Landroid/database/Cursor;
    .restart local v12    # "msg":Lcom/vkontakte/android/Message;
    .restart local v14    # "user":Lcom/vkontakte/android/UserProfile;
    .restart local v15    # "values":Landroid/content/ContentValues;
    :cond_3
    const-string/jumbo v2, "title"

    invoke-virtual {v15, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v14, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 675
    const-string/jumbo v2, "admin"

    invoke-virtual {v15, v2}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 676
    const-string/jumbo v2, "admin"

    invoke-virtual {v15, v2}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, v14, Lcom/vkontakte/android/UserProfile;->online:I

    .line 678
    :cond_4
    const-string/jumbo v2, "photo"

    invoke-virtual {v15, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v14, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 692
    .end local v10    # "cursor":Landroid/database/Cursor;
    .end local v12    # "msg":Lcom/vkontakte/android/Message;
    .end local v14    # "user":Lcom/vkontakte/android/UserProfile;
    .end local v15    # "values":Landroid/content/ContentValues;
    :catch_0
    move-exception v16

    .line 693
    .local v16, "x":Ljava/lang/Exception;
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Error reading messages cache DB!"

    move-object/from16 v0, v16

    invoke-static {v2, v3, v0}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public static getDialogsCount()I
    .locals 6

    .prologue
    .line 699
    const/4 v2, 0x0

    .line 700
    .local v2, "result":I
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 702
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    const-string/jumbo v4, "SELECT count(*) FROM dialogs"

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 703
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 704
    const/4 v4, 0x0

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 705
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 709
    .end local v0    # "cursor":Landroid/database/Cursor;
    :goto_0
    return v2

    .line 706
    :catch_0
    move-exception v3

    .line 707
    .local v3, "x":Ljava/lang/Exception;
    const-string/jumbo v4, "vk"

    const-string/jumbo v5, "Error reading messages cache DB!"

    invoke-static {v4, v5, v3}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static getFriendLists()Ljava/util/ArrayList;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/Friends$Folder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 498
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 499
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 501
    .local v10, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/Friends$Folder;>;"
    :try_start_0
    const-string/jumbo v1, "friendlists"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 502
    .local v8, "cursor":Landroid/database/Cursor;
    if-eqz v8, :cond_1

    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_1

    .line 503
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 504
    .local v11, "values":Landroid/content/ContentValues;
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 506
    :cond_0
    invoke-static {v8, v11}, Landroid/database/DatabaseUtils;->cursorRowToContentValues(Landroid/database/Cursor;Landroid/content/ContentValues;)V

    .line 507
    new-instance v9, Lcom/vkontakte/android/data/Friends$Folder;

    invoke-direct {v9}, Lcom/vkontakte/android/data/Friends$Folder;-><init>()V

    .line 508
    .local v9, "list":Lcom/vkontakte/android/data/Friends$Folder;
    const-string/jumbo v1, "lid"

    invoke-virtual {v11, v1}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, v9, Lcom/vkontakte/android/data/Friends$Folder;->id:I

    .line 509
    const-string/jumbo v1, "name"

    invoke-virtual {v11, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v9, Lcom/vkontakte/android/data/Friends$Folder;->name:Ljava/lang/String;

    .line 510
    invoke-virtual {v10, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 511
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 513
    .end local v9    # "list":Lcom/vkontakte/android/data/Friends$Folder;
    .end local v11    # "values":Landroid/content/ContentValues;
    :cond_1
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 517
    .end local v8    # "cursor":Landroid/database/Cursor;
    :goto_0
    return-object v10

    .line 514
    :catch_0
    move-exception v12

    .line 515
    .local v12, "x":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "Error reading friends cache DB!"

    invoke-static {v1, v2, v12}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static getFriends()Ljava/util/ArrayList;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 331
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 332
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 335
    .local v4, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :try_start_0
    const-string/jumbo v7, "SELECT users.* FROM users LEFT JOIN friends_hints_order ON users.uid=friends_hints_order.uid WHERE is_friend=1 ORDER BY friends_hints_order.list_order ASC"

    const/4 v9, 0x0

    invoke-virtual {v1, v7, v9}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 336
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_1

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v7

    if-lez v7, :cond_1

    .line 337
    const/4 v2, 0x0

    .line 338
    .local v2, "i":I
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    .line 339
    .local v5, "values":Landroid/content/ContentValues;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 341
    :cond_0
    invoke-static {v0, v5}, Landroid/database/DatabaseUtils;->cursorRowToContentValues(Landroid/database/Cursor;Landroid/content/ContentValues;)V

    .line 342
    new-instance v3, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v3}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 343
    .local v3, "profile":Lcom/vkontakte/android/UserProfile;
    const-string/jumbo v7, "uid"

    invoke-virtual {v5, v7}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    iput v7, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 344
    const-string/jumbo v7, "firstname"

    invoke-virtual {v5, v7}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v3, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 345
    const-string/jumbo v7, "lastname"

    invoke-virtual {v5, v7}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v3, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 346
    const-string/jumbo v7, "domain"

    invoke-virtual {v5, v7}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v3, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    .line 347
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, v3, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v9, " "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v9, v3, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v3, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 348
    const-string/jumbo v7, "photo_small"

    invoke-virtual {v5, v7}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v3, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 349
    const-string/jumbo v7, "f"

    invoke-virtual {v5, v7}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-ne v7, v8, :cond_2

    move v7, v8

    :goto_0
    iput-boolean v7, v3, Lcom/vkontakte/android/UserProfile;->f:Z

    .line 350
    const/4 v7, 0x1

    iput-boolean v7, v3, Lcom/vkontakte/android/UserProfile;->isFriend:Z

    .line 351
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 352
    add-int/lit8 v2, v2, 0x1

    .line 353
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v7

    if-nez v7, :cond_0

    .line 355
    .end local v2    # "i":I
    .end local v3    # "profile":Lcom/vkontakte/android/UserProfile;
    .end local v5    # "values":Landroid/content/ContentValues;
    :cond_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 359
    .end local v0    # "cursor":Landroid/database/Cursor;
    :goto_1
    return-object v4

    .line 349
    .restart local v0    # "cursor":Landroid/database/Cursor;
    .restart local v2    # "i":I
    .restart local v3    # "profile":Lcom/vkontakte/android/UserProfile;
    .restart local v5    # "values":Landroid/content/ContentValues;
    :cond_2
    const/4 v7, 0x0

    goto :goto_0

    .line 356
    .end local v0    # "cursor":Landroid/database/Cursor;
    .end local v2    # "i":I
    .end local v3    # "profile":Lcom/vkontakte/android/UserProfile;
    .end local v5    # "values":Landroid/content/ContentValues;
    :catch_0
    move-exception v6

    .line 357
    .local v6, "x":Ljava/lang/Exception;
    const-string/jumbo v7, "vk"

    const-string/jumbo v8, "Error reading friends cache DB!"

    invoke-static {v7, v8, v6}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public static getImportedContacts(I)Ljava/util/ArrayList;
    .locals 14
    .param p0, "service"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 405
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 406
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 408
    .local v11, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :try_start_0
    const-string/jumbo v1, "imported_contacts"

    const/4 v2, 0x0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "service="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 409
    .local v8, "cursor":Landroid/database/Cursor;
    if-eqz v8, :cond_1

    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_1

    .line 410
    const/4 v9, 0x0

    .line 411
    .local v9, "i":I
    new-instance v12, Landroid/content/ContentValues;

    invoke-direct {v12}, Landroid/content/ContentValues;-><init>()V

    .line 412
    .local v12, "values":Landroid/content/ContentValues;
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 414
    :cond_0
    invoke-static {v8, v12}, Landroid/database/DatabaseUtils;->cursorRowToContentValues(Landroid/database/Cursor;Landroid/content/ContentValues;)V

    .line 415
    new-instance v10, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v10}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 416
    .local v10, "profile":Lcom/vkontakte/android/UserProfile;
    const-string/jumbo v1, "vk_id"

    invoke-virtual {v12, v1}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, v10, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 417
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    iput-object v1, v10, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    .line 418
    iget-object v1, v10, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v2, "external_id"

    const-string/jumbo v3, "external_id"

    invoke-virtual {v12, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 419
    const-string/jumbo v1, "external_name"

    invoke-virtual {v12, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v10, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 420
    const-string/jumbo v1, "external_photo"

    invoke-virtual {v12, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v10, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 421
    const-string/jumbo v1, "description"

    invoke-virtual {v12, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v10, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    .line 422
    const-string/jumbo v1, "req_sent"

    invoke-virtual {v12, v1}, Landroid/content/ContentValues;->getAsBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, v10, Lcom/vkontakte/android/UserProfile;->isFriend:Z

    .line 423
    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 424
    add-int/lit8 v9, v9, 0x1

    .line 425
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 427
    .end local v9    # "i":I
    .end local v10    # "profile":Lcom/vkontakte/android/UserProfile;
    .end local v12    # "values":Landroid/content/ContentValues;
    :cond_1
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 431
    .end local v8    # "cursor":Landroid/database/Cursor;
    :goto_0
    return-object v11

    .line 428
    :catch_0
    move-exception v13

    .line 429
    .local v13, "x":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "Error reading friends cache DB!"

    invoke-static {v1, v2, v13}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static getMaxMsgId()I
    .locals 6

    .prologue
    .line 892
    const/4 v2, 0x0

    .line 893
    .local v2, "result":I
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 895
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    const-string/jumbo v4, "SELECT max(mid) FROM messages"

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 896
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 897
    const/4 v4, 0x0

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 898
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 902
    .end local v0    # "cursor":Landroid/database/Cursor;
    :goto_0
    return v2

    .line 899
    :catch_0
    move-exception v3

    .line 900
    .local v3, "x":Ljava/lang/Exception;
    const-string/jumbo v4, "vk"

    const-string/jumbo v5, "Error reading messages cache DB!"

    invoke-static {v4, v5, v3}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static getMessageByID(I)Lcom/vkontakte/android/Message;
    .locals 13
    .param p0, "mid"    # I

    .prologue
    const v12, 0x77359400

    .line 869
    const/4 v9, 0x0

    .line 870
    .local v9, "result":Lcom/vkontakte/android/Message;
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 872
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    const-string/jumbo v1, "messages"

    sget-object v2, Lcom/vkontakte/android/Message;->SELECTION:[Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "mid="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 873
    .local v8, "cursor":Landroid/database/Cursor;
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 874
    new-instance v10, Lcom/vkontakte/android/Message;

    invoke-direct {v10, v8}, Lcom/vkontakte/android/Message;-><init>(Landroid/database/Cursor;)V

    .end local v9    # "result":Lcom/vkontakte/android/Message;
    .local v10, "result":Lcom/vkontakte/android/Message;
    move-object v9, v10

    .line 876
    .end local v10    # "result":Lcom/vkontakte/android/Message;
    .restart local v9    # "result":Lcom/vkontakte/android/Message;
    :cond_0
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 877
    if-eqz v9, :cond_2

    iget v1, v9, Lcom/vkontakte/android/Message;->peer:I

    if-le v1, v12, :cond_2

    .line 878
    const-string/jumbo v1, "chats"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string/jumbo v4, "title"

    aput-object v4, v2, v3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "cid="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v9, Lcom/vkontakte/android/Message;->peer:I

    sub-int/2addr v4, v12

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 879
    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_1

    .line 880
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 881
    const/4 v1, 0x0

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v9, Lcom/vkontakte/android/Message;->title:Ljava/lang/String;

    .line 883
    :cond_1
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 888
    .end local v8    # "cursor":Landroid/database/Cursor;
    :cond_2
    :goto_0
    return-object v9

    .line 885
    :catch_0
    move-exception v11

    .line 886
    .local v11, "x":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "Error writing users cache DB!"

    invoke-static {v1, v2, v11}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static getMessagesHistory(III)Ljava/util/ArrayList;
    .locals 13
    .param p0, "peer"    # I
    .param p1, "offset"    # I
    .param p2, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Message;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1066
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 1067
    .local v10, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1071
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    const-string/jumbo v1, "messages"

    sget-object v2, Lcom/vkontakte/android/Message;->SELECTION:[Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "peer="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " AND mid<0"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string/jumbo v7, "time desc"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v12, ","

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 1072
    .local v9, "cursor":Landroid/database/Cursor;
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1074
    :cond_0
    const/4 v1, 0x0

    new-instance v2, Lcom/vkontakte/android/Message;

    invoke-direct {v2, v9}, Lcom/vkontakte/android/Message;-><init>(Landroid/database/Cursor;)V

    invoke-virtual {v10, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 1075
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1077
    :cond_1
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 1079
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr p2, v1

    .line 1080
    const-string/jumbo v1, "messages"

    sget-object v2, Lcom/vkontakte/android/Message;->SELECTION:[Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "peer="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " AND mid>0"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string/jumbo v7, "mid desc"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v12, ","

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 1081
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1083
    :cond_2
    const/4 v1, 0x0

    new-instance v2, Lcom/vkontakte/android/Message;

    invoke-direct {v2, v9}, Lcom/vkontakte/android/Message;-><init>(Landroid/database/Cursor;)V

    invoke-virtual {v10, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 1084
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_2

    .line 1086
    :cond_3
    invoke-interface {v9}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1090
    .end local v9    # "cursor":Landroid/database/Cursor;
    :goto_0
    return-object v10

    .line 1087
    :catch_0
    move-exception v11

    .line 1088
    .local v11, "x":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "Error reading messages cache DB!"

    invoke-static {v1, v2, v11}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static getMessagesHistoryCount(I)I
    .locals 6
    .param p0, "peer"    # I

    .prologue
    .line 933
    const/4 v2, 0x0

    .line 934
    .local v2, "result":I
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 936
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "SELECT count(*) FROM messages WHERE peer="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 937
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 938
    const/4 v4, 0x0

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 939
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 943
    .end local v0    # "cursor":Landroid/database/Cursor;
    :goto_0
    return v2

    .line 940
    :catch_0
    move-exception v3

    .line 941
    .local v3, "x":Ljava/lang/Exception;
    const-string/jumbo v4, "vk"

    const-string/jumbo v5, "Error reading messages cache DB!"

    invoke-static {v4, v5, v3}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static getNumUnreadMessages(I)I
    .locals 11
    .param p0, "peer"    # I

    .prologue
    .line 591
    const/4 v9, -0x1

    .line 592
    .local v9, "result":I
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 594
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    const-string/jumbo v1, "messages_unread_counters"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string/jumbo v4, "unread_count"

    aput-object v4, v2, v3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "peer="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 595
    .local v8, "crsr":Landroid/database/Cursor;
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 596
    const/4 v1, 0x0

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    .line 598
    :cond_0
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 602
    .end local v8    # "crsr":Landroid/database/Cursor;
    :goto_0
    return v9

    .line 599
    :catch_0
    move-exception v10

    .line 600
    .local v10, "x":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "Error writing messages cache DB!"

    invoke-static {v1, v2, v10}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    .prologue
    .line 56
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/vkontakte/android/cache/Cache$OpenHelper;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/cache/Cache$OpenHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/cache/Cache$OpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static getResendableMessages()Ljava/util/ArrayList;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Message;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1094
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 1095
    .local v9, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1097
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    const-string/jumbo v1, "messages"

    sget-object v2, Lcom/vkontakte/android/Message;->SELECTION:[Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "mid<0 AND time>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v4

    add-int/lit16 v4, v4, -0x12c

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string/jumbo v7, "time desc"

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 1098
    .local v8, "cursor":Landroid/database/Cursor;
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1100
    :cond_0
    const/4 v1, 0x0

    new-instance v2, Lcom/vkontakte/android/Message;

    invoke-direct {v2, v8}, Lcom/vkontakte/android/Message;-><init>(Landroid/database/Cursor;)V

    invoke-virtual {v9, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 1101
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1103
    :cond_1
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1107
    .end local v8    # "cursor":Landroid/database/Cursor;
    :goto_0
    return-object v9

    .line 1104
    :catch_0
    move-exception v10

    .line 1105
    .local v10, "x":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "Error reading messages cache DB!"

    invoke-static {v1, v2, v10}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static getTodayBirthdays()Ljava/util/List;
    .locals 16
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/cache/Cache$BirthdayEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 222
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 223
    .local v1, "context":Landroid/content/Context;
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 224
    .local v5, "resources":Landroid/content/res/Resources;
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 228
    .local v3, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 229
    .local v0, "calendar":Ljava/util/Calendar;
    const/4 v11, 0x5

    invoke-virtual {v0, v11}, Ljava/util/Calendar;->get(I)I

    move-result v7

    .line 230
    .local v7, "startDay":I
    const/4 v11, 0x2

    invoke-virtual {v0, v11}, Ljava/util/Calendar;->get(I)I

    move-result v8

    .line 232
    .local v8, "startMonth":I
    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v12, "SELECT * FROM users WHERE (bday=%d AND bmonth=%d) AND is_friend = 1 ORDER BY bmonth,bday"

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x1

    add-int/lit8 v15, v8, 0x1

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v11, v12, v13}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    invoke-virtual {v3, v11, v12}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 234
    .local v2, "cursor":Landroid/database/Cursor;
    if-eqz v2, :cond_4

    .line 235
    new-instance v6, Ljava/util/ArrayList;

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v11

    invoke-direct {v6, v11}, Ljava/util/ArrayList;-><init>(I)V

    .line 237
    .local v6, "result":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/cache/Cache$BirthdayEntry;>;"
    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v11

    if-lez v11, :cond_3

    .line 238
    new-instance v9, Landroid/content/ContentValues;

    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V

    .line 239
    .local v9, "values":Landroid/content/ContentValues;
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_0
    invoke-interface {v2}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v11

    if-nez v11, :cond_3

    .line 240
    invoke-static {v2, v9}, Landroid/database/DatabaseUtils;->cursorRowToContentValues(Landroid/database/Cursor;Landroid/content/ContentValues;)V

    .line 241
    new-instance v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;

    invoke-direct {v4}, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;-><init>()V

    .line 242
    .local v4, "profile":Lcom/vkontakte/android/cache/Cache$BirthdayEntry;
    const-string/jumbo v11, "uid"

    invoke-virtual {v9, v11}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    iput v11, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->uid:I

    .line 243
    const-string/jumbo v11, "firstname"

    invoke-virtual {v9, v11}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->firstName:Ljava/lang/String;

    .line 244
    const-string/jumbo v11, "lastname"

    invoke-virtual {v9, v11}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->lastName:Ljava/lang/String;

    .line 245
    const-string/jumbo v11, "domain"

    invoke-virtual {v9, v11}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->domain:Ljava/lang/String;

    .line 246
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->firstName:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->lastName:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    iput-object v11, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->fullName:Ljava/lang/String;

    .line 247
    const-string/jumbo v11, "photo_small"

    invoke-virtual {v9, v11}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->photo:Ljava/lang/String;

    .line 248
    const-string/jumbo v11, "bday"

    invoke-virtual {v9, v11}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    iput v11, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bDay:I

    .line 249
    const-string/jumbo v11, "bmonth"

    invoke-virtual {v9, v11}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    iput v11, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bMonth:I

    .line 250
    const-string/jumbo v11, "byear"

    invoke-virtual {v9, v11}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v11

    if-eqz v11, :cond_0

    const-string/jumbo v11, "byear"

    invoke-virtual {v9, v11}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    :goto_1
    iput v11, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bYear:I

    .line 251
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    iget v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bDay:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, "."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bMonth:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    iget v11, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bYear:I

    if-lez v11, :cond_1

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "."

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v13, "byear"

    invoke-virtual {v9, v13}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    :goto_2
    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    iput-object v11, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bdate:Ljava/lang/String;

    .line 252
    const-string/jumbo v11, "name_r"

    invoke-virtual {v9, v11}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->university:Ljava/lang/String;

    .line 253
    const/4 v11, 0x1

    iput-boolean v11, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->isToday:Z

    .line 255
    iget v11, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bYear:I

    if-lez v11, :cond_2

    .line 256
    iget v11, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bDay:I

    iget v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bMonth:I

    iget v13, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bYear:I

    invoke-static {v11, v12, v13}, Lcom/vkontakte/android/TimeUtils;->getAge(III)I

    move-result v10

    .line 257
    .local v10, "years":I
    const v11, 0x7f0d0006

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-virtual {v5, v11, v10, v12}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->subtitle:Ljava/lang/String;

    .line 261
    .end local v10    # "years":I
    :goto_3
    iget-object v11, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->subtitle:Ljava/lang/String;

    iput-object v11, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->date:Ljava/lang/String;

    .line 262
    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 239
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    goto/16 :goto_0

    .line 250
    :cond_0
    const/4 v11, -0x1

    goto :goto_1

    .line 251
    :cond_1
    const-string/jumbo v11, ""

    goto :goto_2

    .line 259
    :cond_2
    const v11, 0x7f080709

    invoke-virtual {v1, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->subtitle:Ljava/lang/String;

    goto :goto_3

    .line 265
    .end local v4    # "profile":Lcom/vkontakte/android/cache/Cache$BirthdayEntry;
    .end local v9    # "values":Landroid/content/ContentValues;
    :cond_3
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 268
    .end local v6    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/cache/Cache$BirthdayEntry;>;"
    :goto_4
    return-object v6

    :cond_4
    const/4 v6, 0x0

    goto :goto_4
.end method

.method public static getTomorrowBirthdays()Ljava/util/List;
    .locals 17
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/cache/Cache$BirthdayEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 275
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 276
    .local v1, "context":Landroid/content/Context;
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 277
    .local v5, "resources":Landroid/content/res/Resources;
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 281
    .local v3, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 282
    .local v0, "calendar":Ljava/util/Calendar;
    const/4 v12, 0x5

    const/4 v13, 0x5

    invoke-virtual {v0, v13}, Ljava/util/Calendar;->get(I)I

    move-result v13

    add-int/lit8 v13, v13, 0x1

    invoke-virtual {v0, v12, v13}, Ljava/util/Calendar;->set(II)V

    .line 283
    const/4 v12, 0x5

    invoke-virtual {v0, v12}, Ljava/util/Calendar;->get(I)I

    move-result v7

    .line 284
    .local v7, "startDay":I
    const/4 v12, 0x2

    invoke-virtual {v0, v12}, Ljava/util/Calendar;->get(I)I

    move-result v8

    .line 286
    .local v8, "startMonth":I
    sget-object v12, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v13, "SELECT * FROM users WHERE (bday=%d AND bmonth=%d) AND is_friend = 1 ORDER BY bmonth,bday"

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    add-int/lit8 v16, v8, 0x1

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v12, v13, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v3, v12, v13}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 288
    .local v2, "cursor":Landroid/database/Cursor;
    if-eqz v2, :cond_4

    .line 289
    new-instance v6, Ljava/util/ArrayList;

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v12

    invoke-direct {v6, v12}, Ljava/util/ArrayList;-><init>(I)V

    .line 291
    .local v6, "result":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/cache/Cache$BirthdayEntry;>;"
    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v12

    if-lez v12, :cond_3

    .line 292
    new-instance v9, Landroid/content/ContentValues;

    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V

    .line 293
    .local v9, "values":Landroid/content/ContentValues;
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_0
    invoke-interface {v2}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v12

    if-nez v12, :cond_3

    .line 294
    invoke-static {v2, v9}, Landroid/database/DatabaseUtils;->cursorRowToContentValues(Landroid/database/Cursor;Landroid/content/ContentValues;)V

    .line 295
    new-instance v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;

    invoke-direct {v4}, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;-><init>()V

    .line 296
    .local v4, "profile":Lcom/vkontakte/android/cache/Cache$BirthdayEntry;
    const-string/jumbo v12, "uid"

    invoke-virtual {v9, v12}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    iput v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->uid:I

    .line 297
    const-string/jumbo v12, "firstname"

    invoke-virtual {v9, v12}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->firstName:Ljava/lang/String;

    .line 298
    const-string/jumbo v12, "lastname"

    invoke-virtual {v9, v12}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->lastName:Ljava/lang/String;

    .line 299
    const-string/jumbo v12, "domain"

    invoke-virtual {v9, v12}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->domain:Ljava/lang/String;

    .line 300
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v13, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->firstName:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, " "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->lastName:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    iput-object v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->fullName:Ljava/lang/String;

    .line 301
    const-string/jumbo v12, "photo_small"

    invoke-virtual {v9, v12}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->photo:Ljava/lang/String;

    .line 302
    const-string/jumbo v12, "bday"

    invoke-virtual {v9, v12}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    iput v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bDay:I

    .line 303
    const-string/jumbo v12, "bmonth"

    invoke-virtual {v9, v12}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    iput v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bMonth:I

    .line 304
    const-string/jumbo v12, "byear"

    invoke-virtual {v9, v12}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v12

    if-eqz v12, :cond_0

    const-string/jumbo v12, "byear"

    invoke-virtual {v9, v12}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    :goto_1
    iput v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bYear:I

    .line 305
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    iget v13, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bDay:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget v13, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bMonth:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    iget v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bYear:I

    if-lez v12, :cond_1

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "."

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v14, "byear"

    invoke-virtual {v9, v14}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    :goto_2
    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    iput-object v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bdate:Ljava/lang/String;

    .line 306
    const-string/jumbo v12, "name_r"

    invoke-virtual {v9, v12}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->university:Ljava/lang/String;

    .line 308
    iget v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bYear:I

    if-lez v12, :cond_2

    .line 309
    iget v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bDay:I

    iget v13, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bMonth:I

    iget v14, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bYear:I

    invoke-static {v12, v13, v14}, Lcom/vkontakte/android/TimeUtils;->getAge(III)I

    move-result v12

    add-int/lit8 v10, v12, 0x1

    .line 310
    .local v10, "years":I
    const v12, 0x7f0d0005

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-virtual {v5, v12, v10, v13}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    .line 311
    .local v11, "yearsString":Ljava/lang/CharSequence;
    const v12, 0x7f08070c

    invoke-virtual {v1, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->date:Ljava/lang/String;

    .line 312
    const v12, 0x7f08010c

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object v11, v13, v14

    invoke-virtual {v1, v12, v13}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->upcoming:Ljava/lang/String;

    .line 313
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v13, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->date:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const v13, 0x7f08010a

    invoke-virtual {v1, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->upcoming:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    iput-object v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->subtitle:Ljava/lang/String;

    .line 319
    .end local v10    # "years":I
    .end local v11    # "yearsString":Ljava/lang/CharSequence;
    :goto_3
    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 293
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    goto/16 :goto_0

    .line 304
    :cond_0
    const/4 v12, -0x1

    goto/16 :goto_1

    .line 305
    :cond_1
    const-string/jumbo v12, ""

    goto :goto_2

    .line 315
    :cond_2
    const v12, 0x7f08070c

    invoke-virtual {v1, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->date:Ljava/lang/String;

    .line 316
    iget-object v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->date:Ljava/lang/String;

    iput-object v12, v4, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->subtitle:Ljava/lang/String;

    goto :goto_3

    .line 322
    .end local v4    # "profile":Lcom/vkontakte/android/cache/Cache$BirthdayEntry;
    .end local v9    # "values":Landroid/content/ContentValues;
    :cond_3
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 325
    .end local v6    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/cache/Cache$BirthdayEntry;>;"
    :goto_4
    return-object v6

    :cond_4
    const/4 v6, 0x0

    goto :goto_4
.end method

.method public static getUnread(I)Ljava/util/ArrayList;
    .locals 13
    .param p0, "limit"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Message;",
            ">;"
        }
    .end annotation

    .prologue
    .line 853
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 854
    .local v10, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 856
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    const-string/jumbo v1, "messages"

    sget-object v2, Lcom/vkontakte/android/Message;->SELECTION:[Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "(flags & 1) = 1 AND sender<>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string/jumbo v7, "time desc"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v12, ""

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 857
    .local v9, "cursor":Landroid/database/Cursor;
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 859
    :cond_0
    new-instance v1, Lcom/vkontakte/android/Message;

    invoke-direct {v1, v9}, Lcom/vkontakte/android/Message;-><init>(Landroid/database/Cursor;)V

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 860
    invoke-interface {v9}, Landroid/database/Cursor;->moveToLast()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    if-nez v1, :cond_0

    .line 865
    .end local v9    # "cursor":Landroid/database/Cursor;
    :cond_1
    :goto_0
    return-object v10

    .line 862
    :catch_0
    move-exception v11

    .line 863
    .local v11, "x":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "Error writing users cache DB!"

    invoke-static {v1, v2, v11}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static getUpcomingBirthdays()Ljava/util/List;
    .locals 22
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/cache/Cache$BirthdayEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 146
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 147
    .local v3, "context":Landroid/content/Context;
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    .line 148
    .local v10, "resources":Landroid/content/res/Resources;
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    .line 149
    .local v5, "db":Landroid/database/sqlite/SQLiteDatabase;
    const v17, 0x7f0c0016

    move/from16 v0, v17

    invoke-virtual {v10, v0}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v8

    .line 154
    .local v8, "months":[Ljava/lang/String;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    .line 155
    .local v2, "calendar":Ljava/util/Calendar;
    const/16 v17, 0x5

    move/from16 v0, v17

    invoke-virtual {v2, v0}, Ljava/util/Calendar;->get(I)I

    move-result v12

    .line 156
    .local v12, "startDay":I
    const/16 v17, 0x2

    move/from16 v0, v17

    invoke-virtual {v2, v0}, Ljava/util/Calendar;->get(I)I

    move-result v13

    .line 157
    .local v13, "startMonth":I
    const/16 v17, 0x2

    add-int/lit8 v18, v13, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v2, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 159
    const/16 v17, 0x5

    move/from16 v0, v17

    invoke-virtual {v2, v0}, Ljava/util/Calendar;->get(I)I

    move-result v6

    .line 160
    .local v6, "endDay":I
    const/16 v17, 0x2

    move/from16 v0, v17

    invoke-virtual {v2, v0}, Ljava/util/Calendar;->get(I)I

    move-result v7

    .line 162
    .local v7, "endMonth":I
    sget-object v17, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v18, "SELECT * FROM users WHERE ((bday>%d AND bmonth=%d) OR (bday<%d AND bmonth=%d)) AND is_friend = 1 ORDER BY bmonth,bday"

    const/16 v19, 0x4

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    add-int/lit8 v21, v12, 0x1

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x1

    add-int/lit8 v21, v13, 0x1

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x2

    add-int/lit8 v21, v6, 0x1

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x3

    add-int/lit8 v21, v7, 0x1

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    aput-object v21, v19, v20

    invoke-static/range {v17 .. v19}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v5, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    .line 164
    .local v4, "cursor":Landroid/database/Cursor;
    if-eqz v4, :cond_4

    .line 165
    new-instance v11, Ljava/util/ArrayList;

    invoke-interface {v4}, Landroid/database/Cursor;->getCount()I

    move-result v17

    move/from16 v0, v17

    invoke-direct {v11, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 167
    .local v11, "result":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/cache/Cache$BirthdayEntry;>;"
    invoke-interface {v4}, Landroid/database/Cursor;->getCount()I

    move-result v17

    if-lez v17, :cond_3

    .line 168
    new-instance v14, Landroid/content/ContentValues;

    invoke-direct {v14}, Landroid/content/ContentValues;-><init>()V

    .line 169
    .local v14, "values":Landroid/content/ContentValues;
    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_0
    invoke-interface {v4}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v17

    if-nez v17, :cond_3

    .line 170
    invoke-static {v4, v14}, Landroid/database/DatabaseUtils;->cursorRowToContentValues(Landroid/database/Cursor;Landroid/content/ContentValues;)V

    .line 171
    new-instance v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;

    invoke-direct {v9}, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;-><init>()V

    .line 172
    .local v9, "profile":Lcom/vkontakte/android/cache/Cache$BirthdayEntry;
    const-string/jumbo v17, "uid"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v17

    move/from16 v0, v17

    iput v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->uid:I

    .line 173
    const-string/jumbo v17, "firstname"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->firstName:Ljava/lang/String;

    .line 174
    const-string/jumbo v17, "lastname"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->lastName:Ljava/lang/String;

    .line 175
    const-string/jumbo v17, "domain"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->domain:Ljava/lang/String;

    .line 176
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->firstName:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, " "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    iget-object v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->lastName:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->fullName:Ljava/lang/String;

    .line 177
    const-string/jumbo v17, "photo_small"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->photo:Ljava/lang/String;

    .line 178
    const-string/jumbo v17, "bday"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v17

    move/from16 v0, v17

    iput v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bDay:I

    .line 179
    const-string/jumbo v17, "bmonth"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v17

    move/from16 v0, v17

    iput v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bMonth:I

    .line 180
    const-string/jumbo v17, "byear"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v17

    if-eqz v17, :cond_1

    const-string/jumbo v17, "byear"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v17

    :goto_1
    move/from16 v0, v17

    iput v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bYear:I

    .line 181
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    iget v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bDay:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, "."

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    iget v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bMonth:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    iget v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bYear:I

    move/from16 v17, v0

    if-lez v17, :cond_2

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "."

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v19, "byear"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    :goto_2
    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bdate:Ljava/lang/String;

    .line 182
    const-string/jumbo v17, "name_r"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->university:Ljava/lang/String;

    .line 183
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    iget v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bDay:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0x20

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v17

    iget v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bMonth:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, -0x1

    aget-object v18, v8, v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->date:Ljava/lang/String;

    .line 184
    iget-object v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->date:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iput-object v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->subtitle:Ljava/lang/String;

    .line 185
    iget v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bYear:I

    move/from16 v17, v0

    if-lez v17, :cond_0

    .line 187
    iget v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bDay:I

    move/from16 v17, v0

    iget v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bMonth:I

    move/from16 v18, v0

    iget v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bYear:I

    move/from16 v19, v0

    invoke-static/range {v17 .. v19}, Lcom/vkontakte/android/TimeUtils;->getAge(III)I

    move-result v17

    add-int/lit8 v15, v17, 0x1

    .line 188
    .local v15, "years":I
    const v17, 0x7f0d0005

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v18, v19

    move/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v15, v1}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    .line 189
    .local v16, "yearsString":Ljava/lang/CharSequence;
    const v17, 0x7f08010c

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v16, v18, v19

    move/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->upcoming:Ljava/lang/String;

    .line 190
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->subtitle:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const v18, 0x7f08010a

    move/from16 v0, v18

    invoke-virtual {v3, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    iget-object v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->upcoming:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v9, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->subtitle:Ljava/lang/String;

    .line 192
    .end local v15    # "years":I
    .end local v16    # "yearsString":Ljava/lang/CharSequence;
    :cond_0
    invoke-interface {v11, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    goto/16 :goto_0

    .line 180
    :cond_1
    const/16 v17, -0x1

    goto/16 :goto_1

    .line 181
    :cond_2
    const-string/jumbo v17, ""

    goto/16 :goto_2

    .line 195
    .end local v9    # "profile":Lcom/vkontakte/android/cache/Cache$BirthdayEntry;
    .end local v14    # "values":Landroid/content/ContentValues;
    :cond_3
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 197
    invoke-static {v13, v7}, Lcom/vkontakte/android/cache/Cache$$Lambda$1;->lambdaFactory$(II)Ljava/util/Comparator;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-static {v11, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 215
    .end local v11    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/cache/Cache$BirthdayEntry;>;"
    :goto_3
    return-object v11

    :cond_4
    const/4 v11, 0x0

    goto :goto_3
.end method

.method public static getUsers(Ljava/util/List;Z)Ljava/util/ArrayList;
    .locals 1
    .param p1, "forceOld"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;Z)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 363
    .local p0, "ids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/vkontakte/android/cache/Cache;->getUsers(Ljava/util/List;ZI)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public static getUsers(Ljava/util/List;ZI)Ljava/util/ArrayList;
    .locals 16
    .param p1, "forceOld"    # Z
    .param p2, "nameCase"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;ZI)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 367
    .local p0, "ids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 368
    .local v2, "db":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 371
    .local v13, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    if-nez p2, :cond_4

    .line 372
    :try_start_0
    const-string/jumbo v3, "users"

    const/4 v4, 0x0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "uid in ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ","

    move-object/from16 v0, p0

    invoke-static {v6, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 376
    .local v10, "cursor":Landroid/database/Cursor;
    :goto_0
    if-eqz v10, :cond_3

    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-lez v3, :cond_3

    .line 377
    const/4 v11, 0x0

    .line 378
    .local v11, "i":I
    new-instance v14, Landroid/content/ContentValues;

    invoke-direct {v14}, Landroid/content/ContentValues;-><init>()V

    .line 379
    .local v14, "values":Landroid/content/ContentValues;
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    .line 381
    :cond_0
    invoke-static {v10, v14}, Landroid/database/DatabaseUtils;->cursorRowToContentValues(Landroid/database/Cursor;Landroid/content/ContentValues;)V

    .line 382
    new-instance v12, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v12}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 383
    .local v12, "profile":Lcom/vkontakte/android/UserProfile;
    const-string/jumbo v3, "uid"

    invoke-virtual {v14, v3}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iput v3, v12, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 384
    const-string/jumbo v3, "firstname"

    invoke-virtual {v14, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v12, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 385
    const-string/jumbo v3, "lastname"

    invoke-virtual {v14, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v12, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 386
    const-string/jumbo v3, "domain"

    invoke-virtual {v14, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v12, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    .line 387
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v12, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v12, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v12, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 388
    const-string/jumbo v3, "photo_small"

    invoke-virtual {v14, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v12, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 389
    const-string/jumbo v3, "f"

    invoke-virtual {v14, v3}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_5

    const/4 v3, 0x1

    :goto_1
    iput-boolean v3, v12, Lcom/vkontakte/android/UserProfile;->f:Z

    .line 390
    const-string/jumbo v3, "is_friend"

    invoke-virtual {v14, v3}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_6

    const/4 v3, 0x1

    :goto_2
    iput-boolean v3, v12, Lcom/vkontakte/android/UserProfile;->isFriend:Z

    .line 391
    if-nez p1, :cond_1

    const-string/jumbo v3, "last_updated"

    invoke-virtual {v14, v3}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-long v4, v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const-wide/16 v8, 0x3e8

    div-long/2addr v6, v8

    const-wide/32 v8, 0x15180

    sub-long/2addr v6, v8

    cmp-long v3, v4, v6

    if-lez v3, :cond_2

    .line 392
    :cond_1
    invoke-virtual {v13, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 394
    :cond_2
    add-int/lit8 v11, v11, 0x1

    .line 395
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 397
    .end local v11    # "i":I
    .end local v12    # "profile":Lcom/vkontakte/android/UserProfile;
    .end local v14    # "values":Landroid/content/ContentValues;
    :cond_3
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 401
    .end local v10    # "cursor":Landroid/database/Cursor;
    :goto_3
    return-object v13

    .line 374
    :cond_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "SELECT users.uid, users_name_cases.firstname, users_name_cases.lastname, users.photo_small, users.f, users.domain, users.is_friend, users.last_updated FROM users_name_cases JOIN users ON users_name_cases.uid=users.uid WHERE users_name_cases.uid IN ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ","

    move-object/from16 v0, p0

    invoke-static {v4, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ") and name_case="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v10

    .restart local v10    # "cursor":Landroid/database/Cursor;
    goto/16 :goto_0

    .line 389
    .restart local v11    # "i":I
    .restart local v12    # "profile":Lcom/vkontakte/android/UserProfile;
    .restart local v14    # "values":Landroid/content/ContentValues;
    :cond_5
    const/4 v3, 0x0

    goto :goto_1

    .line 390
    :cond_6
    const/4 v3, 0x0

    goto :goto_2

    .line 398
    .end local v10    # "cursor":Landroid/database/Cursor;
    .end local v11    # "i":I
    .end local v12    # "profile":Lcom/vkontakte/android/UserProfile;
    .end local v14    # "values":Landroid/content/ContentValues;
    :catch_0
    move-exception v15

    .line 399
    .local v15, "x":Ljava/lang/Exception;
    const-string/jumbo v3, "vk"

    const-string/jumbo v4, "Error reading friends cache DB!"

    invoke-static {v3, v4, v15}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3
.end method

.method public static getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    .prologue
    .line 52
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/vkontakte/android/cache/Cache$OpenHelper;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/cache/Cache$OpenHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/cache/Cache$OpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$getUpcomingBirthdays$0(IILcom/vkontakte/android/cache/Cache$BirthdayEntry;Lcom/vkontakte/android/cache/Cache$BirthdayEntry;)I
    .locals 4
    .param p0, "startMonth"    # I
    .param p1, "endMonth"    # I
    .param p2, "lhs"    # Lcom/vkontakte/android/cache/Cache$BirthdayEntry;
    .param p3, "rhs"    # Lcom/vkontakte/android/cache/Cache$BirthdayEntry;

    .prologue
    const/4 v1, 0x1

    const/4 v0, -0x1

    .line 198
    iget v2, p2, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bMonth:I

    iget v3, p3, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bMonth:I

    if-ne v2, v3, :cond_3

    .line 199
    iget v2, p2, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bDay:I

    iget v3, p3, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bDay:I

    if-ge v2, v3, :cond_1

    .line 211
    :cond_0
    :goto_0
    return v0

    .line 199
    :cond_1
    iget v0, p2, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bDay:I

    iget v2, p3, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bDay:I

    if-ne v0, v2, :cond_2

    const/4 v0, 0x0

    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_0

    .line 203
    :cond_3
    iget v2, p2, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bMonth:I

    add-int/lit8 v3, p0, 0x1

    if-ne v2, v3, :cond_4

    iget v2, p3, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bMonth:I

    add-int/lit8 v3, p1, 0x1

    if-eq v2, v3, :cond_0

    .line 206
    :cond_4
    iget v2, p3, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bMonth:I

    add-int/lit8 v3, p0, 0x1

    if-ne v2, v3, :cond_5

    iget v2, p2, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bMonth:I

    add-int/lit8 v3, p1, 0x1

    if-ne v2, v3, :cond_5

    move v0, v1

    .line 207
    goto :goto_0

    .line 211
    :cond_5
    iget v2, p2, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bMonth:I

    iget v3, p3, Lcom/vkontakte/android/cache/Cache$BirthdayEntry;->bMonth:I

    if-lt v2, v3, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public static needUpdateChat(I)Z
    .locals 8
    .param p0, "id"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 1018
    const/4 v2, 0x1

    .line 1019
    .local v2, "result":Z
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 1021
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "SELECT need_update_users FROM chats WHERE cid="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v1, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 1022
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1023
    const/4 v6, 0x0

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    if-ne v6, v4, :cond_1

    move v2, v4

    .line 1025
    :cond_0
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1029
    .end local v0    # "cursor":Landroid/database/Cursor;
    :goto_1
    return v2

    .restart local v0    # "cursor":Landroid/database/Cursor;
    :cond_1
    move v2, v5

    .line 1023
    goto :goto_0

    .line 1026
    .end local v0    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v3

    .line 1027
    .local v3, "x":Ljava/lang/Exception;
    const-string/jumbo v4, "vk"

    const-string/jumbo v5, "Error reading messages cache DB!"

    invoke-static {v4, v5, v3}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public static putApiRequest(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/reflect/Method;Lorg/json/JSONObject;)V
    .locals 8
    .param p0, "method"    # Ljava/lang/String;
    .param p1, "params"    # Lorg/json/JSONObject;
    .param p2, "callback"    # Ljava/lang/reflect/Method;
    .param p3, "userdata"    # Lorg/json/JSONObject;

    .prologue
    .line 1151
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 1153
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 1154
    .local v3, "values":Landroid/content/ContentValues;
    const-string/jumbo v5, "method"

    invoke-virtual {v3, v5, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1155
    const-string/jumbo v5, "args"

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1156
    if-eqz p2, :cond_0

    .line 1157
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    .line 1158
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    .line 1159
    .local v2, "name":Ljava/lang/String;
    const-string/jumbo v5, "success_callback"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1161
    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "name":Ljava/lang/String;
    :cond_0
    if-eqz p3, :cond_1

    .line 1162
    const-string/jumbo v5, "user_data"

    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1164
    :cond_1
    const-string/jumbo v5, "api_queue"

    const/4 v6, 0x0

    invoke-virtual {v1, v5, v6, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 1165
    const-string/jumbo v5, "vk"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Insert api request "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ") ok"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1169
    .end local v3    # "values":Landroid/content/ContentValues;
    :goto_0
    return-void

    .line 1166
    :catch_0
    move-exception v4

    .line 1167
    .local v4, "x":Ljava/lang/Exception;
    const-string/jumbo v5, "vk"

    const-string/jumbo v6, "Error writing api queue DB!"

    invoke-static {v5, v6, v4}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static removeFriend(I)V
    .locals 6
    .param p0, "uid"    # I

    .prologue
    .line 576
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 578
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 579
    .local v1, "values":Landroid/content/ContentValues;
    const-string/jumbo v3, "is_friend"

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 580
    const-string/jumbo v3, "users"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "uid="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v0, v3, v1, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 584
    .end local v1    # "values":Landroid/content/ContentValues;
    :goto_0
    return-void

    .line 581
    :catch_0
    move-exception v2

    .line 582
    .local v2, "x":Ljava/lang/Exception;
    const-string/jumbo v3, "vk"

    const-string/jumbo v4, "Error writing friends cache DB!"

    invoke-static {v3, v4, v2}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static saveImportedContacts(Ljava/util/List;IZ)V
    .locals 9
    .param p1, "service"    # I
    .param p2, "deleteOld"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;IZ)V"
        }
    .end annotation

    .prologue
    .local p0, "users":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    const/4 v6, 0x0

    .line 435
    new-instance v1, Lcom/vkontakte/android/cache/Cache$OpenHelper;

    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-direct {v1, v5, v6}, Lcom/vkontakte/android/cache/Cache$OpenHelper;-><init>(Landroid/content/Context;Lcom/vkontakte/android/cache/Cache$1;)V

    .line 436
    .local v1, "helper":Lcom/vkontakte/android/cache/Cache$OpenHelper;
    invoke-virtual {v1}, Lcom/vkontakte/android/cache/Cache$OpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 438
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    sget-object v5, Lcom/vkontakte/android/cache/Cache;->lockSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v5}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 440
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 441
    if-eqz p2, :cond_0

    .line 442
    const-string/jumbo v5, "imported_contacts"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "service="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v0, v5, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 444
    :cond_0
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 445
    .local v3, "values":Landroid/content/ContentValues;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    .line 446
    .local v2, "u":Lcom/vkontakte/android/UserProfile;
    invoke-virtual {v3}, Landroid/content/ContentValues;->clear()V

    .line 447
    const-string/jumbo v6, "vk_id"

    iget v7, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 448
    const-string/jumbo v6, "external_id"

    iget-object v7, v2, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v8, "external_id"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 449
    iget v6, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    if-nez v6, :cond_1

    .line 450
    const-string/jumbo v6, "external_name"

    iget-object v7, v2, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v3, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 451
    const-string/jumbo v6, "external_photo"

    iget-object v7, v2, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v3, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 453
    :cond_1
    const-string/jumbo v6, "service"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 454
    const-string/jumbo v6, "description"

    iget-object v7, v2, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    invoke-virtual {v3, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 455
    const-string/jumbo v6, "req_sent"

    iget-boolean v7, v2, Lcom/vkontakte/android/UserProfile;->isFriend:Z

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 457
    const-string/jumbo v6, "imported_contacts"

    const/4 v7, 0x0

    const/4 v8, 0x5

    invoke-virtual {v0, v6, v7, v3, v8}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 460
    .end local v2    # "u":Lcom/vkontakte/android/UserProfile;
    .end local v3    # "values":Landroid/content/ContentValues;
    :catch_0
    move-exception v4

    .line 461
    .local v4, "x":Ljava/lang/Exception;
    :try_start_1
    const-string/jumbo v5, "vk"

    const-string/jumbo v6, "Error writing messages cache DB!"

    invoke-static {v5, v6, v4}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 463
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 465
    .end local v4    # "x":Ljava/lang/Exception;
    :goto_1
    sget-object v5, Lcom/vkontakte/android/cache/Cache;->lockSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v5}, Ljava/util/concurrent/Semaphore;->release()V

    .line 466
    return-void

    .line 459
    .restart local v3    # "values":Landroid/content/ContentValues;
    :cond_2
    :try_start_2
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 463
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_1

    .end local v3    # "values":Landroid/content/ContentValues;
    :catchall_0
    move-exception v5

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v5
.end method

.method public static setMessageID(III)V
    .locals 6
    .param p0, "mid"    # I
    .param p1, "peerID"    # I
    .param p2, "newID"    # I

    .prologue
    .line 744
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 746
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 747
    .local v1, "values":Landroid/content/ContentValues;
    const-string/jumbo v3, "mid"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 748
    const-string/jumbo v3, "messages"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "mid="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v0, v3, v1, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 749
    invoke-virtual {v1}, Landroid/content/ContentValues;->clear()V

    .line 750
    const-string/jumbo v3, "msg_id"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 751
    const-string/jumbo v3, "messages_top_ids"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "peer="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v0, v3, v1, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 755
    .end local v1    # "values":Landroid/content/ContentValues;
    :goto_0
    return-void

    .line 752
    :catch_0
    move-exception v2

    .line 753
    .local v2, "x":Ljava/lang/Exception;
    const-string/jumbo v3, "vk"

    const-string/jumbo v4, "Error writing messages cache DB!"

    invoke-static {v3, v4, v2}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static setMessageReadState(IZ)V
    .locals 5
    .param p0, "mid"    # I
    .param p1, "state"    # Z

    .prologue
    const/4 v2, 0x1

    .line 713
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 715
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    new-instance v3, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;

    const/4 v4, 0x1

    if-eqz p1, :cond_0

    :goto_0
    invoke-direct {v3, p0, v4, v2}, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;-><init>(III)V

    invoke-virtual {v3, v0}, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->apply(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 719
    :goto_1
    return-void

    .line 715
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 716
    :catch_0
    move-exception v1

    .line 717
    .local v1, "x":Ljava/lang/Exception;
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Error writing messages cache DB!"

    invoke-static {v2, v3, v1}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public static setMessageReadStateUpto(IIZZ)V
    .locals 8
    .param p0, "mid"    # I
    .param p1, "peer"    # I
    .param p2, "state"    # Z
    .param p3, "in"    # Z

    .prologue
    const/4 v3, 0x1

    .line 722
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    .line 724
    .local v6, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    new-instance v0, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;

    const/4 v2, 0x1

    if-eqz p2, :cond_0

    :goto_0
    move v1, p0

    move v4, p3

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;-><init>(IIIZI)V

    invoke-virtual {v0, v6}, Lcom/vkontakte/android/cache/ModifyMessageFlagsAction;->apply(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 728
    :goto_1
    return-void

    .line 724
    :cond_0
    const/4 v3, 0x0

    goto :goto_0

    .line 725
    :catch_0
    move-exception v7

    .line 726
    .local v7, "x":Ljava/lang/Exception;
    const-string/jumbo v0, "vk"

    const-string/jumbo v1, "Error writing messages cache DB!"

    invoke-static {v0, v1, v7}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public static setNeedUpdateChat(I)V
    .locals 6
    .param p0, "id"    # I

    .prologue
    .line 1033
    const-string/jumbo v3, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "SET NEED UPDATE CHAT "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1034
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1036
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 1037
    .local v1, "values":Landroid/content/ContentValues;
    const-string/jumbo v3, "need_update_users"

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1038
    const-string/jumbo v3, "chats"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "cid="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v0, v3, v1, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1042
    .end local v1    # "values":Landroid/content/ContentValues;
    :goto_0
    return-void

    .line 1039
    :catch_0
    move-exception v2

    .line 1040
    .local v2, "x":Ljava/lang/Exception;
    const-string/jumbo v3, "vk"

    const-string/jumbo v4, "Error writing messages cache DB!"

    invoke-static {v3, v4, v2}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static updateChat(ILjava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 8
    .param p0, "id"    # I
    .param p1, "title"    # Ljava/lang/String;
    .param p3, "photo"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ChatUser;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1111
    .local p2, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ChatUser;>;"
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1112
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1114
    .local v1, "profiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :try_start_0
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 1115
    .local v3, "values":Landroid/content/ContentValues;
    if-eqz p1, :cond_0

    .line 1116
    const-string/jumbo v5, "title"

    invoke-virtual {v3, v5, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1117
    const-string/jumbo v5, "need_update_users"

    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1118
    const-string/jumbo v5, "chats"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "cid="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v0, v5, v3, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1120
    :cond_0
    if-eqz p3, :cond_1

    .line 1121
    const-string/jumbo v5, "photo"

    invoke-virtual {v3, v5, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1122
    const-string/jumbo v5, "chats"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "cid="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v0, v5, v3, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1124
    :cond_1
    if-eqz p2, :cond_4

    .line 1125
    const-string/jumbo v5, "need_update_users"

    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1126
    const-string/jumbo v5, "chats"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "cid="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v0, v5, v3, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1127
    const-string/jumbo v5, "chats_users"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "cid="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v0, v5, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1128
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_2
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/ChatUser;

    .line 1129
    .local v2, "user":Lcom/vkontakte/android/ChatUser;
    invoke-virtual {v3}, Landroid/content/ContentValues;->clear()V

    .line 1130
    const-string/jumbo v6, "cid"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1131
    const-string/jumbo v6, "uid"

    iget-object v7, v2, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    iget v7, v7, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1132
    const-string/jumbo v6, "inviter"

    iget-object v7, v2, Lcom/vkontakte/android/ChatUser;->inviter:Lcom/vkontakte/android/UserProfile;

    iget v7, v7, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1133
    const-string/jumbo v6, "invited"

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1134
    const-string/jumbo v6, "chats_users"

    const/4 v7, 0x0

    invoke-virtual {v0, v6, v7, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 1135
    iget-object v6, v2, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 1136
    iget-object v6, v2, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1138
    :cond_3
    iget-object v6, v2, Lcom/vkontakte/android/ChatUser;->inviter:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 1139
    iget-object v6, v2, Lcom/vkontakte/android/ChatUser;->inviter:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1144
    .end local v2    # "user":Lcom/vkontakte/android/ChatUser;
    .end local v3    # "values":Landroid/content/ContentValues;
    :catch_0
    move-exception v4

    .line 1145
    .local v4, "x":Ljava/lang/Exception;
    const-string/jumbo v5, "vk"

    const-string/jumbo v6, "Error writing messages DB!"

    invoke-static {v5, v6, v4}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1147
    .end local v4    # "x":Ljava/lang/Exception;
    :cond_4
    const/4 v5, 0x1

    invoke-static {v1, v5}, Lcom/vkontakte/android/cache/Cache;->updatePeers(Ljava/util/List;Z)V

    .line 1148
    return-void
.end method

.method public static updateFriendLists(Ljava/util/List;Z)V
    .locals 8
    .param p1, "replace"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/Friends$Folder;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 470
    .local p0, "lists":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/Friends$Folder;>;"
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 472
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    sget-object v5, Lcom/vkontakte/android/cache/Cache;->lockSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v5}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 474
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 475
    if-eqz p1, :cond_0

    .line 476
    const-string/jumbo v5, "friendlists"

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v0, v5, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 478
    :cond_0
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 479
    .local v3, "values":Landroid/content/ContentValues;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v5

    if-ge v1, v5, :cond_1

    .line 480
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/data/Friends$Folder;

    .line 481
    .local v2, "list":Lcom/vkontakte/android/data/Friends$Folder;
    invoke-virtual {v3}, Landroid/content/ContentValues;->clear()V

    .line 482
    const-string/jumbo v5, "lid"

    iget v6, v2, Lcom/vkontakte/android/data/Friends$Folder;->id:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 483
    const-string/jumbo v5, "name"

    iget-object v6, v2, Lcom/vkontakte/android/data/Friends$Folder;->name:Ljava/lang/String;

    invoke-virtual {v3, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 485
    const-string/jumbo v5, "friendlists"

    const/4 v6, 0x0

    const/4 v7, 0x5

    invoke-virtual {v0, v5, v6, v3, v7}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    .line 479
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 487
    .end local v2    # "list":Lcom/vkontakte/android/data/Friends$Folder;
    :cond_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 491
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 493
    .end local v1    # "i":I
    .end local v3    # "values":Landroid/content/ContentValues;
    :goto_1
    sget-object v5, Lcom/vkontakte/android/cache/Cache;->lockSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v5}, Ljava/util/concurrent/Semaphore;->release()V

    .line 494
    return-void

    .line 488
    :catch_0
    move-exception v4

    .line 489
    .local v4, "x":Ljava/lang/Exception;
    :try_start_1
    const-string/jumbo v5, "vk"

    const-string/jumbo v6, "Error writing friends cache DB!"

    invoke-static {v5, v6, v4}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 491
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_1

    .end local v4    # "x":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v5
.end method

.method public static updateFriends(Ljava/util/List;Z)V
    .locals 12
    .param p1, "replace"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .local p0, "users":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    const/4 v11, 0x2

    const/4 v10, 0x1

    .line 521
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 523
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    sget-object v6, Lcom/vkontakte/android/cache/Cache;->lockSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v6}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 524
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 525
    .local v4, "values":Landroid/content/ContentValues;
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 526
    if-eqz p1, :cond_0

    .line 527
    const-string/jumbo v6, "is_friend"

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 528
    const-string/jumbo v6, "users"

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual {v1, v6, v4, v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 529
    const-string/jumbo v6, "friends_hints_order"

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual {v1, v6, v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 531
    :cond_0
    const/4 v2, 0x0

    .line 532
    .local v2, "i":I
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/UserProfile;

    .line 533
    .local v3, "user":Lcom/vkontakte/android/UserProfile;
    invoke-virtual {v4}, Landroid/content/ContentValues;->clear()V

    .line 534
    const-string/jumbo v6, "uid"

    iget v8, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 535
    const-string/jumbo v6, "firstname"

    iget-object v8, v3, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v4, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 536
    const-string/jumbo v6, "lastname"

    iget-object v8, v3, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v4, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 537
    const-string/jumbo v6, "photo_small"

    iget-object v8, v3, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v4, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 538
    const-string/jumbo v6, "domain"

    iget-object v8, v3, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    invoke-virtual {v4, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 539
    const-string/jumbo v6, "is_friend"

    const/4 v8, 0x1

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v4, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 540
    const-string/jumbo v6, "f"

    iget-boolean v8, v3, Lcom/vkontakte/android/UserProfile;->f:Z

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v4, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 541
    const-string/jumbo v6, "last_updated"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    long-to-int v8, v8

    div-int/lit16 v8, v8, 0x3e8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 542
    const-string/jumbo v6, "lists"

    iget v8, v3, Lcom/vkontakte/android/UserProfile;->country:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 543
    iget-object v6, v3, Lcom/vkontakte/android/UserProfile;->bdate:Ljava/lang/String;

    if-eqz v6, :cond_1

    iget-object v6, v3, Lcom/vkontakte/android/UserProfile;->bdate:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_1

    .line 544
    const-string/jumbo v6, "uid"

    iget v8, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 545
    const-string/jumbo v6, "name_r"

    iget-object v8, v3, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    invoke-virtual {v4, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 546
    iget-object v6, v3, Lcom/vkontakte/android/UserProfile;->bdate:Ljava/lang/String;

    const-string/jumbo v8, "\\."

    invoke-virtual {v6, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 547
    .local v0, "bd":[Ljava/lang/String;
    array-length v6, v0

    if-le v6, v10, :cond_1

    .line 549
    const-string/jumbo v6, "bday"

    const/4 v8, 0x0

    aget-object v8, v0, v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 550
    const-string/jumbo v6, "bmonth"

    const/4 v8, 0x1

    aget-object v8, v0, v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 551
    array-length v6, v0

    if-le v6, v11, :cond_2

    .line 552
    const-string/jumbo v6, "byear"

    const/4 v8, 0x2

    aget-object v8, v0, v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 558
    .end local v0    # "bd":[Ljava/lang/String;
    :cond_1
    :goto_1
    const-string/jumbo v6, "users"

    const/4 v8, 0x0

    const/4 v9, 0x5

    invoke-virtual {v1, v6, v8, v4, v9}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    .line 559
    invoke-virtual {v4}, Landroid/content/ContentValues;->clear()V

    .line 561
    const-string/jumbo v6, "uid"

    iget v8, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 562
    const-string/jumbo v8, "list_order"

    if-eqz p1, :cond_3

    move v6, v2

    :goto_2
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v8, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 563
    const-string/jumbo v6, "friends_hints_order"

    const/4 v8, 0x0

    invoke-virtual {v1, v6, v8, v4}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 564
    add-int/lit8 v2, v2, 0x1

    .line 565
    goto/16 :goto_0

    .line 554
    .restart local v0    # "bd":[Ljava/lang/String;
    :cond_2
    const-string/jumbo v6, "byear"

    const/4 v8, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 567
    .end local v0    # "bd":[Ljava/lang/String;
    .end local v2    # "i":I
    .end local v3    # "user":Lcom/vkontakte/android/UserProfile;
    .end local v4    # "values":Landroid/content/ContentValues;
    :catch_0
    move-exception v5

    .line 568
    .local v5, "x":Ljava/lang/Exception;
    :try_start_1
    const-string/jumbo v6, "vk"

    const-string/jumbo v7, "Error writing friends cache DB!"

    invoke-static {v6, v7, v5}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 570
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 572
    .end local v5    # "x":Ljava/lang/Exception;
    :goto_3
    sget-object v6, Lcom/vkontakte/android/cache/Cache;->lockSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v6}, Ljava/util/concurrent/Semaphore;->release()V

    .line 573
    return-void

    .line 562
    .restart local v2    # "i":I
    .restart local v3    # "user":Lcom/vkontakte/android/UserProfile;
    .restart local v4    # "values":Landroid/content/ContentValues;
    :cond_3
    const v6, 0x5f5e0ff

    goto :goto_2

    .line 566
    .end local v3    # "user":Lcom/vkontakte/android/UserProfile;
    :cond_4
    :try_start_2
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 570
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_3

    .end local v2    # "i":I
    .end local v4    # "values":Landroid/content/ContentValues;
    :catchall_0
    move-exception v6

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v6
.end method

.method public static updateMessagesUnreadCount(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 635
    .local p0, "counts":Ljava/util/List;, "Ljava/util/List<Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;>;"
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 638
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 639
    .local v2, "values":Landroid/content/ContentValues;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Pair;

    .line 640
    .local v1, "dlg":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    const-string/jumbo v4, "vk"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "update unread for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 641
    const-string/jumbo v6, "peer"

    iget-object v4, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v2, v6, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 642
    const-string/jumbo v6, "unread_count"

    iget-object v4, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v2, v6, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 643
    const-string/jumbo v4, "messages_unread_counters"

    const/4 v6, 0x0

    const/4 v7, 0x5

    invoke-virtual {v0, v4, v6, v2, v7}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 645
    .end local v1    # "dlg":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .end local v2    # "values":Landroid/content/ContentValues;
    :catch_0
    move-exception v3

    .line 646
    .local v3, "x":Ljava/lang/Exception;
    const-string/jumbo v4, "vk"

    const-string/jumbo v5, "Error writing messages cache DB!"

    invoke-static {v4, v5, v3}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 648
    .end local v3    # "x":Ljava/lang/Exception;
    :cond_0
    return-void
.end method

.method public static updatePeers(Ljava/util/List;Z)V
    .locals 1
    .param p1, "replace"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 781
    .local p0, "users":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/vkontakte/android/cache/Cache;->updatePeers(Ljava/util/List;ZI)V

    .line 782
    return-void
.end method

.method public static updatePeers(Ljava/util/List;ZI)V
    .locals 12
    .param p1, "replace"    # Z
    .param p2, "nameCase"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;ZI)V"
        }
    .end annotation

    .prologue
    .line 786
    .local p0, "users":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 788
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    sget-object v5, Lcom/vkontakte/android/cache/Cache;->lockSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v5}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 789
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 790
    .local v3, "values":Landroid/content/ContentValues;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 791
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_9

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    .line 792
    .local v2, "user":Lcom/vkontakte/android/UserProfile;
    invoke-virtual {v3}, Landroid/content/ContentValues;->clear()V

    .line 793
    iget v5, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    if-gez v5, :cond_3

    iget v5, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    const v7, -0x77359400

    if-le v5, v7, :cond_3

    .line 794
    const-string/jumbo v5, "uid"

    iget v7, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 795
    const-string/jumbo v5, "firstname"

    iget-object v7, v2, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v3, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 796
    const-string/jumbo v5, "lastname"

    const-string/jumbo v7, ""

    invoke-virtual {v3, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 797
    const-string/jumbo v5, "photo_small"

    iget-object v7, v2, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v3, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 798
    const-string/jumbo v5, "is_friend"

    iget-boolean v7, v2, Lcom/vkontakte/android/UserProfile;->isFriend:Z

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v3, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 799
    const-string/jumbo v5, "f"

    iget-boolean v7, v2, Lcom/vkontakte/android/UserProfile;->f:Z

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v3, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 800
    const-string/jumbo v5, "last_updated"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10

    long-to-int v7, v8

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 801
    iget-object v5, v2, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 802
    const-string/jumbo v5, "domain"

    iget-object v7, v2, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    invoke-virtual {v3, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 804
    :cond_1
    const-string/jumbo v7, "users"

    const/4 v8, 0x0

    if-eqz p1, :cond_2

    const/4 v5, 0x5

    :goto_1
    invoke-virtual {v0, v7, v8, v3, v5}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_0

    .line 844
    .end local v2    # "user":Lcom/vkontakte/android/UserProfile;
    .end local v3    # "values":Landroid/content/ContentValues;
    :catch_0
    move-exception v4

    .line 845
    .local v4, "x":Ljava/lang/Exception;
    :try_start_1
    const-string/jumbo v5, "vk"

    const-string/jumbo v6, "Error writing users cache DB!"

    invoke-static {v5, v6, v4}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 847
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 849
    .end local v4    # "x":Ljava/lang/Exception;
    :goto_2
    sget-object v5, Lcom/vkontakte/android/cache/Cache;->lockSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v5}, Ljava/util/concurrent/Semaphore;->release()V

    .line 850
    return-void

    .line 804
    .restart local v2    # "user":Lcom/vkontakte/android/UserProfile;
    .restart local v3    # "values":Landroid/content/ContentValues;
    :cond_2
    const/4 v5, 0x4

    goto :goto_1

    .line 805
    :cond_3
    :try_start_2
    iget v5, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    const v7, 0x77359400

    if-ge v5, v7, :cond_8

    .line 806
    const-string/jumbo v5, "uid"

    iget v7, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 807
    const-string/jumbo v5, "firstname"

    iget-object v7, v2, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v3, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 808
    const-string/jumbo v5, "lastname"

    iget-object v7, v2, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v3, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 810
    if-nez p2, :cond_6

    .line 811
    const-string/jumbo v5, "photo_small"

    iget-object v7, v2, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v3, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 812
    const-string/jumbo v5, "is_friend"

    iget-boolean v7, v2, Lcom/vkontakte/android/UserProfile;->isFriend:Z

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v3, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 813
    const-string/jumbo v5, "f"

    iget-boolean v7, v2, Lcom/vkontakte/android/UserProfile;->f:Z

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v3, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 814
    const-string/jumbo v5, "last_updated"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10

    long-to-int v7, v8

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 816
    iget-object v5, v2, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 817
    const-string/jumbo v5, "domain"

    iget-object v7, v2, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    invoke-virtual {v3, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 820
    :cond_4
    const-string/jumbo v7, "users"

    const/4 v8, 0x0

    if-eqz p1, :cond_5

    const/4 v5, 0x5

    :goto_3
    invoke-virtual {v0, v7, v8, v3, v5}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0

    .line 847
    .end local v2    # "user":Lcom/vkontakte/android/UserProfile;
    .end local v3    # "values":Landroid/content/ContentValues;
    :catchall_0
    move-exception v5

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v5

    .line 820
    .restart local v2    # "user":Lcom/vkontakte/android/UserProfile;
    .restart local v3    # "values":Landroid/content/ContentValues;
    :cond_5
    const/4 v5, 0x4

    goto :goto_3

    .line 822
    :cond_6
    if-eqz p1, :cond_7

    .line 823
    :try_start_3
    const-string/jumbo v5, "users_name_cases"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "uid="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " AND name_case="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v0, v5, v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 825
    :cond_7
    const-string/jumbo v5, "name_case"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 826
    const-string/jumbo v5, "users_name_cases"

    const/4 v7, 0x0

    invoke-virtual {v0, v5, v7, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    goto/16 :goto_0

    .line 830
    :cond_8
    const-string/jumbo v5, "cid"

    iget v7, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    const v8, 0x77359400

    sub-int/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 831
    const-string/jumbo v5, "title"

    iget-object v7, v2, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v3, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 832
    const-string/jumbo v5, "admin"

    iget v7, v2, Lcom/vkontakte/android/UserProfile;->online:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 833
    const-string/jumbo v5, "photo"

    iget-object v7, v2, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v3, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 834
    const-string/jumbo v5, "need_update_users"

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 835
    const-string/jumbo v5, "chats"

    const/4 v7, 0x0

    const/4 v8, 0x5

    invoke-virtual {v0, v5, v7, v3, v8}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    .line 836
    iget-object v5, v2, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    if-eqz v5, :cond_0

    .line 837
    iget-object v4, v2, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    .line 838
    .local v4, "x":Landroid/os/Bundle;
    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v7, "notify"

    const/4 v8, 0x0

    invoke-virtual {v5, v7, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 839
    .local v1, "nprefs":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "mute"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "mute"

    invoke-virtual {v4, v8}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v8

    invoke-interface {v5, v7, v8}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "dnd"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "dnd"

    invoke-virtual {v4, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v8

    invoke-interface {v5, v7, v8}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto/16 :goto_0

    .line 843
    .end local v1    # "nprefs":Landroid/content/SharedPreferences;
    .end local v2    # "user":Lcom/vkontakte/android/UserProfile;
    .end local v4    # "x":Landroid/os/Bundle;
    :cond_9
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 847
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_2
.end method
