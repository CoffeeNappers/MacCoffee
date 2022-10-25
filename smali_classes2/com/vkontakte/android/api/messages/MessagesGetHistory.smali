.class public Lcom/vkontakte/android/api/messages/MessagesGetHistory;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "MessagesGetHistory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/messages/MessagesGetHistory$Result;
    }
.end annotation


# static fields
.field public static final METHOD_NAME:Ljava/lang/String; = "messages.getHistory"


# direct methods
.method public constructor <init>(IIII)V
    .locals 3
    .param p1, "uid"    # I
    .param p2, "offset"    # I
    .param p3, "count"    # I
    .param p4, "msgID"    # I

    .prologue
    .line 21
    const-string/jumbo v0, "messages.getHistory"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 22
    const-string/jumbo v0, "peer_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/messages/MessagesGetHistory;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "offset"

    invoke-virtual {v0, v1, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "count"

    invoke-virtual {v0, v1, p3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "photo_sizes"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 23
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "first_name,last_name,photo_100,photo_50"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/messages/MessagesGetHistory;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 24
    if-lez p4, :cond_0

    if-gtz p2, :cond_0

    .line 25
    const-string/jumbo v0, "start_message_id"

    invoke-virtual {p0, v0, p4}, Lcom/vkontakte/android/api/messages/MessagesGetHistory;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 27
    :cond_0
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 6
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 31
    :try_start_0
    const-string/jumbo v4, "response"

    invoke-static {p1, v4}, Lcom/vkontakte/android/api/APIUtils;->unwrapArray(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/vkontakte/android/api/JSONArrayWithCount;

    move-result-object v4

    iget-object v0, v4, Lcom/vkontakte/android/api/JSONArrayWithCount;->array:Lorg/json/JSONArray;

    .line 32
    .local v0, "a":Lorg/json/JSONArray;
    if-nez v0, :cond_0

    .line 33
    iget-object v4, p0, Lcom/vkontakte/android/api/messages/MessagesGetHistory;->callback:Lcom/vkontakte/android/api/Callback;

    if-eqz v4, :cond_0

    .line 34
    const/4 v4, 0x2

    new-array v2, v4, [Ljava/lang/Object;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v4

    const/4 v4, 0x1

    new-instance v5, Ljava/util/Vector;

    invoke-direct {v5}, Ljava/util/Vector;-><init>()V

    aput-object v5, v2, v4

    .line 52
    .end local v0    # "a":Lorg/json/JSONArray;
    :goto_0
    return-object v2

    .line 37
    .restart local v0    # "a":Lorg/json/JSONArray;
    :cond_0
    new-instance v1, Lcom/vkontakte/android/data/VKList;

    const-string/jumbo v4, "response"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    new-instance v5, Lcom/vkontakte/android/api/messages/MessagesGetHistory$1;

    invoke-direct {v5, p0}, Lcom/vkontakte/android/api/messages/MessagesGetHistory$1;-><init>(Lcom/vkontakte/android/api/messages/MessagesGetHistory;)V

    invoke-direct {v1, v4, v5}, Lcom/vkontakte/android/data/VKList;-><init>(Lorg/json/JSONObject;Lcom/vkontakte/android/data/Parser;)V

    .line 43
    .local v1, "msgs":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/Message;>;"
    invoke-static {v1}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 44
    new-instance v2, Lcom/vkontakte/android/api/messages/MessagesGetHistory$Result;

    invoke-direct {v2}, Lcom/vkontakte/android/api/messages/MessagesGetHistory$Result;-><init>()V

    .line 45
    .local v2, "res":Lcom/vkontakte/android/api/messages/MessagesGetHistory$Result;
    iput-object v1, v2, Lcom/vkontakte/android/api/messages/MessagesGetHistory$Result;->msgs:Lcom/vkontakte/android/data/VKList;

    .line 46
    const-string/jumbo v4, "response"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string/jumbo v5, "skipped"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v4

    iput v4, v2, Lcom/vkontakte/android/api/messages/MessagesGetHistory$Result;->offset:I

    .line 47
    const-string/jumbo v4, "response"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string/jumbo v5, "unread"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v4

    iput v4, v2, Lcom/vkontakte/android/api/messages/MessagesGetHistory$Result;->unread:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 49
    .end local v0    # "a":Lorg/json/JSONArray;
    .end local v1    # "msgs":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/Message;>;"
    .end local v2    # "res":Lcom/vkontakte/android/api/messages/MessagesGetHistory$Result;
    :catch_0
    move-exception v3

    .line 50
    .local v3, "x":Ljava/lang/Exception;
    const-string/jumbo v4, "vk"

    invoke-static {v4, v3}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 52
    const/4 v2, 0x0

    goto :goto_0
.end method
