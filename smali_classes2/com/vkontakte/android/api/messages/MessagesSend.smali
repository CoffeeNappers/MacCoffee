.class public Lcom/vkontakte/android/api/messages/MessagesSend;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "MessagesSend.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# static fields
.field public static final METHOD_NAME:Ljava/lang/String; = "messages.send"


# direct methods
.method public constructor <init>(IILjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "uid"    # I
    .param p2, "rid"    # I
    .param p3, "text"    # Ljava/lang/String;
    .param p4, "attachment"    # Ljava/lang/String;

    .prologue
    const v1, 0x77359400

    .line 73
    const-string/jumbo v0, "messages.send"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 74
    if-ge p1, v1, :cond_2

    .line 75
    const-string/jumbo v0, "peer_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/messages/MessagesSend;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 79
    :goto_0
    const-string/jumbo v0, "random_id"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/messages/MessagesSend;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 80
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 81
    const-string/jumbo v0, "message"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/messages/MessagesSend;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 83
    :cond_0
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 84
    const-string/jumbo v0, "attachment"

    invoke-virtual {p0, v0, p4}, Lcom/vkontakte/android/api/messages/MessagesSend;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 86
    :cond_1
    return-void

    .line 77
    :cond_2
    const-string/jumbo v0, "chat_id"

    sub-int v1, p1, v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/messages/MessagesSend;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method public constructor <init>(ILcom/vkontakte/android/Message;Ljava/util/List;Ljava/util/List;Lcom/vkontakte/android/attachments/GeoAttachment;)V
    .locals 10
    .param p1, "uid"    # I
    .param p2, "message"    # Lcom/vkontakte/android/Message;
    .param p5, "location"    # Lcom/vkontakte/android/attachments/GeoAttachment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/vkontakte/android/Message;",
            "Ljava/util/List",
            "<*>;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/vkontakte/android/attachments/GeoAttachment;",
            ")V"
        }
    .end annotation

    .prologue
    .local p3, "attachments":Ljava/util/List;, "Ljava/util/List<*>;"
    .local p4, "fwdMessages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const v8, 0x77359400

    .line 19
    const-string/jumbo v5, "messages.send"

    invoke-direct {p0, v5}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 20
    iget-object v1, p2, Lcom/vkontakte/android/Message;->text:Ljava/lang/String;

    .line 22
    .local v1, "msg":Ljava/lang/String;
    const-string/jumbo v5, "device"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v7, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lcom/vkontakte/android/api/messages/MessagesSend;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 23
    if-ge p1, v8, :cond_9

    .line 24
    const-string/jumbo v5, "peer_id"

    invoke-virtual {p0, v5, p1}, Lcom/vkontakte/android/api/messages/MessagesSend;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 28
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 29
    const-string/jumbo v5, "message"

    invoke-virtual {p0, v5, v1}, Lcom/vkontakte/android/api/messages/MessagesSend;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 31
    :cond_0
    if-eqz p5, :cond_1

    .line 32
    const-string/jumbo v5, "lat"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v8, p5, Lcom/vkontakte/android/attachments/GeoAttachment;->lat:D

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lcom/vkontakte/android/api/messages/MessagesSend;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    const-string/jumbo v6, "long"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v8, p5, Lcom/vkontakte/android/attachments/GeoAttachment;->lon:D

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, ""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 36
    :cond_1
    iget-object v5, p2, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v6, "ref"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .local v2, "ref":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 37
    const-string/jumbo v5, "ref"

    invoke-virtual {p0, v5, v2}, Lcom/vkontakte/android/api/messages/MessagesSend;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 40
    :cond_2
    iget-object v5, p2, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v6, "ref_source"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .local v3, "refSource":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 41
    const-string/jumbo v5, "ref_source"

    invoke-virtual {p0, v5, v3}, Lcom/vkontakte/android/api/messages/MessagesSend;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 44
    :cond_3
    if-eqz p3, :cond_6

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_6

    .line 45
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 46
    .local v0, "att":Ljava/lang/Object;
    instance-of v6, v0, Lcom/vkontakte/android/attachments/StickerAttachment;

    if-eqz v6, :cond_4

    move-object v4, v0

    .line 48
    check-cast v4, Lcom/vkontakte/android/attachments/StickerAttachment;

    .line 49
    .local v4, "sa":Lcom/vkontakte/android/attachments/StickerAttachment;
    const-string/jumbo v5, "sticker_id"

    iget v6, v4, Lcom/vkontakte/android/attachments/StickerAttachment;->id:I

    invoke-virtual {p0, v5, v6}, Lcom/vkontakte/android/api/messages/MessagesSend;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 51
    iget-object v5, v4, Lcom/vkontakte/android/attachments/StickerAttachment;->stickerReferrer:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 52
    const-string/jumbo v5, "sticker_referrer"

    iget-object v6, v4, Lcom/vkontakte/android/attachments/StickerAttachment;->stickerReferrer:Ljava/lang/String;

    invoke-virtual {p0, v5, v6}, Lcom/vkontakte/android/api/messages/MessagesSend;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 55
    :cond_5
    invoke-interface {p3, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 61
    .end local v0    # "att":Ljava/lang/Object;
    .end local v4    # "sa":Lcom/vkontakte/android/attachments/StickerAttachment;
    :cond_6
    if-eqz p3, :cond_7

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_7

    .line 62
    const-string/jumbo v5, "attachment"

    const-string/jumbo v6, ","

    invoke-static {v6, p3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lcom/vkontakte/android/api/messages/MessagesSend;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 64
    :cond_7
    if-eqz p4, :cond_8

    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_8

    .line 65
    const-string/jumbo v5, "forward_messages"

    const-string/jumbo v6, ","

    invoke-static {v6, p4}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lcom/vkontakte/android/api/messages/MessagesSend;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 68
    :cond_8
    invoke-virtual {p2}, Lcom/vkontakte/android/Message;->generateRandomId()V

    .line 69
    const-string/jumbo v5, "random_id"

    iget v6, p2, Lcom/vkontakte/android/Message;->randomId:I

    invoke-virtual {p0, v5, v6}, Lcom/vkontakte/android/api/messages/MessagesSend;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 70
    return-void

    .line 26
    .end local v2    # "ref":Ljava/lang/String;
    .end local v3    # "refSource":Ljava/lang/String;
    :cond_9
    const-string/jumbo v5, "chat_id"

    sub-int v6, p1, v8

    invoke-virtual {p0, v5, v6}, Lcom/vkontakte/android/api/messages/MessagesSend;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Ljava/lang/Integer;
    .locals 2
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 90
    :try_start_0
    const-string/jumbo v1, "response"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 92
    :goto_0
    return-object v1

    .line 91
    :catch_0
    move-exception v0

    .line 92
    .local v0, "x":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 15
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/messages/MessagesSend;->parse(Lorg/json/JSONObject;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
