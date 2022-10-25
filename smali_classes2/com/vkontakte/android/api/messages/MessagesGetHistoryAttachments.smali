.class public Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments;
.super Ljava/lang/Object;
.source "MessagesGetHistoryAttachments.java"

# interfaces
.implements Lcom/vkontakte/android/data/ServerKeys;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$WallRequest;,
        Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$VKListImpl;,
        Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$ListAPIRequestImpl;,
        Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/lang/Class;ILjava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 7
    .param p1, "peerId"    # I
    .param p2, "startFrom"    # Ljava/lang/String;
    .param p3, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;I",
            "Ljava/lang/String;",
            "I)",
            "Lcom/vkontakte/android/api/VKAPIRequest",
            "<",
            "Lcom/vkontakte/android/data/VKList",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 45
    .local p0, "tClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v2, 0x0

    .line 46
    .local v2, "type":Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;
    invoke-static {}, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->values()[Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    move-result-object v4

    array-length v5, v4

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v5, :cond_0

    aget-object v1, v4, v3

    .line 47
    .local v1, "t":Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;
    iget-object v6, v1, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->aClass:Ljava/lang/Class;

    invoke-virtual {v6, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 48
    move-object v2, v1

    .line 54
    .end local v1    # "t":Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;
    :cond_0
    sget-object v3, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->wall:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    if-ne v2, v3, :cond_2

    .line 55
    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$WallRequest;

    const-string/jumbo v3, "messages.getHistoryAttachments"

    invoke-direct {v0, v3}, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$WallRequest;-><init>(Ljava/lang/String;)V

    .line 56
    .local v0, "request":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lcom/vkontakte/android/data/VKList<TT;>;>;"
    const-string/jumbo v3, "fields"

    const-string/jumbo v4, "sex,photo_100,photo_50"

    invoke-virtual {v0, v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 62
    :goto_1
    if-nez v2, :cond_3

    .line 63
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Class "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " is unsupported"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 46
    .end local v0    # "request":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lcom/vkontakte/android/data/VKList<TT;>;>;"
    .restart local v1    # "t":Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 58
    .end local v1    # "t":Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;
    :cond_2
    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$ListAPIRequestImpl;

    const-string/jumbo v3, "messages.getHistoryAttachments"

    invoke-direct {v0, v3, p0}, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$ListAPIRequestImpl;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 59
    .restart local v0    # "request":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lcom/vkontakte/android/data/VKList<TT;>;>;"
    const-string/jumbo v3, "fields"

    const-string/jumbo v4, "sex,photo_100,photo_50"

    invoke-virtual {v0, v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_1

    .line 65
    :cond_3
    const-string/jumbo v3, "peer_id"

    invoke-virtual {v0, v3, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "count"

    invoke-virtual {v3, v4, p3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "photo_sizes"

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "media_type"

    invoke-virtual {v2}, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 66
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 67
    const-string/jumbo v3, "start_from"

    invoke-virtual {v0, v3, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 69
    :cond_4
    return-object v0
.end method

.method public static nextFrom(Ljava/util/List;)Ljava/lang/String;
    .locals 1
    .param p0, "vkList"    # Ljava/util/List;

    .prologue
    .line 74
    instance-of v0, p0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$VKListImpl;

    if-eqz v0, :cond_0

    .line 75
    check-cast p0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$VKListImpl;

    .end local p0    # "vkList":Ljava/util/List;
    iget-object v0, p0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$VKListImpl;->nextFrom:Ljava/lang/String;

    .line 77
    :goto_0
    return-object v0

    .restart local p0    # "vkList":Ljava/util/List;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static parseProfiles(Lorg/json/JSONObject;Landroid/util/SparseArray;Ljava/lang/String;Z)V
    .locals 5
    .param p0, "o"    # Lorg/json/JSONObject;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/util/SparseArray;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "isGroup"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 128
    .local p1, "profiles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    invoke-virtual {p0, p2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {p0, p2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 129
    invoke-virtual {p0, p2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 130
    .local v3, "profiles1":Lorg/json/JSONArray;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v0, v4, :cond_1

    .line 131
    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 132
    .local v1, "jo":Lorg/json/JSONObject;
    if-eqz p3, :cond_0

    new-instance v2, Lcom/vkontakte/android/UserProfile;

    new-instance v4, Lcom/vkontakte/android/api/Group;

    invoke-direct {v4, v1}, Lcom/vkontakte/android/api/Group;-><init>(Lorg/json/JSONObject;)V

    invoke-direct {v2, v4}, Lcom/vkontakte/android/UserProfile;-><init>(Lcom/vkontakte/android/api/Group;)V

    .line 133
    .local v2, "p":Lcom/vkontakte/android/UserProfile;
    :goto_1
    iget v4, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {p1, v4, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 130
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 132
    .end local v2    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_0
    new-instance v2, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v2, v1}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    goto :goto_1

    .line 136
    .end local v0    # "i":I
    .end local v1    # "jo":Lorg/json/JSONObject;
    .end local v3    # "profiles1":Lorg/json/JSONArray;
    :cond_1
    return-void
.end method
