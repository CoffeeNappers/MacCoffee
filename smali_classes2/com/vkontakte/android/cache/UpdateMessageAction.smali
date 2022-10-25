.class public Lcom/vkontakte/android/cache/UpdateMessageAction;
.super Lcom/vkontakte/android/cache/MessagesAction;
.source "UpdateMessageAction.java"


# instance fields
.field private m:Lcom/vkontakte/android/Message;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/Message;)V
    .locals 0
    .param p1, "msg"    # Lcom/vkontakte/android/Message;

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/vkontakte/android/cache/MessagesAction;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    .line 25
    return-void
.end method


# virtual methods
.method public apply(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 20
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/sqlite/SQLiteException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 29
    new-instance v14, Landroid/content/ContentValues;

    invoke-direct {v14}, Landroid/content/ContentValues;-><init>()V

    .line 30
    .local v14, "values":Landroid/content/ContentValues;
    const-string/jumbo v17, "mid"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v18, v0

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v14, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 31
    const-string/jumbo v17, "peer"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/vkontakte/android/Message;->peer:I

    move/from16 v18, v0

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v14, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 32
    const-string/jumbo v17, "random_id"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/vkontakte/android/Message;->randomId:I

    move/from16 v18, v0

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v14, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 33
    const-string/jumbo v17, "sender"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/vkontakte/android/Message;->sender:I

    move/from16 v18, v0

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v14, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 34
    const-string/jumbo v17, "text"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/vkontakte/android/Message;->text:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v14, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    const-string/jumbo v17, "time"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/vkontakte/android/Message;->time:I

    move/from16 v18, v0

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v14, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 37
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v17

    if-lez v17, :cond_3

    .line 38
    new-instance v5, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v5}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 39
    .local v5, "buf":Ljava/io/ByteArrayOutputStream;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v17

    move/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 40
    new-instance v13, Ljava/io/DataOutputStream;

    invoke-direct {v13, v5}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 41
    .local v13, "out":Ljava/io/DataOutputStream;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v17

    move/from16 v0, v17

    if-ge v9, v0, :cond_1

    .line 42
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/attachments/Attachment;

    .line 43
    .local v4, "att":Lcom/vkontakte/android/attachments/Attachment;
    if-eqz v4, :cond_0

    .line 44
    invoke-virtual {v4, v13}, Lcom/vkontakte/android/attachments/Attachment;->serialize(Ljava/io/DataOutputStream;)V

    .line 41
    :cond_0
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 47
    .end local v4    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_1
    const-string/jumbo v17, "attachments"

    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v14, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 48
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-boolean v0, v0, Lcom/vkontakte/android/Message;->out:Z

    move/from16 v17, v0

    if-nez v17, :cond_3

    .line 49
    const/4 v9, 0x0

    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v17

    move/from16 v0, v17

    if-ge v9, v0, :cond_3

    .line 50
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/attachments/Attachment;

    .line 51
    .restart local v4    # "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v0, v4, Lcom/vkontakte/android/attachments/GiftAttachment;

    move/from16 v17, v0

    if-eqz v17, :cond_2

    move-object v8, v4

    .line 52
    check-cast v8, Lcom/vkontakte/android/attachments/GiftAttachment;

    .line 53
    .local v8, "g":Lcom/vkontakte/android/attachments/GiftAttachment;
    iget v0, v8, Lcom/vkontakte/android/attachments/GiftAttachment;->packID:I

    move/from16 v17, v0

    if-eqz v17, :cond_2

    .line 54
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/vkontakte/android/stickers/Stickers;->reload()V

    .line 49
    .end local v8    # "g":Lcom/vkontakte/android/attachments/GiftAttachment;
    :cond_2
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 62
    .end local v4    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v5    # "buf":Ljava/io/ByteArrayOutputStream;
    .end local v9    # "i":I
    .end local v13    # "out":Ljava/io/DataOutputStream;
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v17

    if-lez v17, :cond_5

    .line 63
    new-instance v5, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v5}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 64
    .restart local v5    # "buf":Ljava/io/ByteArrayOutputStream;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v17

    move/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 65
    new-instance v13, Ljava/io/DataOutputStream;

    invoke-direct {v13, v5}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 66
    .restart local v13    # "out":Ljava/io/DataOutputStream;
    const/4 v9, 0x0

    .restart local v9    # "i":I
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v17

    move/from16 v0, v17

    if-ge v9, v0, :cond_4

    .line 67
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/Message$FwdMessage;

    .line 68
    .local v7, "fm":Lcom/vkontakte/android/Message$FwdMessage;
    invoke-virtual {v7, v13}, Lcom/vkontakte/android/Message$FwdMessage;->serialize(Ljava/io/DataOutputStream;)V

    .line 66
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 70
    .end local v7    # "fm":Lcom/vkontakte/android/Message$FwdMessage;
    :cond_4
    const-string/jumbo v17, "fwd"

    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v14, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 72
    .end local v5    # "buf":Ljava/io/ByteArrayOutputStream;
    .end local v9    # "i":I
    .end local v13    # "out":Ljava/io/DataOutputStream;
    :cond_5
    const/4 v6, 0x0

    .line 73
    .local v6, "flags":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-boolean v0, v0, Lcom/vkontakte/android/Message;->readState:Z

    move/from16 v17, v0

    if-nez v17, :cond_6

    .line 74
    or-int/lit8 v6, v6, 0x1

    .line 76
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-boolean v0, v0, Lcom/vkontakte/android/Message;->sendFailed:Z

    move/from16 v17, v0

    if-eqz v17, :cond_7

    .line 77
    or-int/lit8 v6, v6, 0x2

    .line 79
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-boolean v0, v0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    move/from16 v17, v0

    if-eqz v17, :cond_8

    .line 80
    or-int/lit8 v6, v6, 0x4

    .line 83
    :cond_8
    const-string/jumbo v17, "flags"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v14, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 84
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/os/Bundle;->size()I

    move-result v17

    if-lez v17, :cond_9

    .line 86
    :try_start_0
    new-instance v12, Lorg/json/JSONObject;

    invoke-direct {v12}, Lorg/json/JSONObject;-><init>()V

    .line 87
    .local v12, "obj":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v11

    .line 88
    .local v11, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_3
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_a

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 89
    .local v10, "k":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/cache/UpdateMessageAction;->m:Lcom/vkontakte/android/Message;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v12, v10, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 94
    .end local v10    # "k":Ljava/lang/String;
    .end local v11    # "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v12    # "obj":Lorg/json/JSONObject;
    :catch_0
    move-exception v15

    .line 95
    .local v15, "x":Ljava/lang/Exception;
    const-string/jumbo v17, "vk"

    const-string/jumbo v18, "Error serializing extras for message!"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v15}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 98
    .end local v15    # "x":Ljava/lang/Exception;
    :cond_9
    :goto_4
    const-string/jumbo v17, "messages"

    const/16 v18, 0x0

    const/16 v19, 0x5

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    move/from16 v3, v19

    invoke-virtual {v0, v1, v2, v14, v3}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    .line 101
    return-void

    .line 91
    .restart local v11    # "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v12    # "obj":Lorg/json/JSONObject;
    :cond_a
    :try_start_1
    invoke-virtual {v12}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v16

    .line 93
    .local v16, "xtra":Ljava/lang/String;
    const-string/jumbo v17, "extras"

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v14, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_4
.end method
