.class public Lcom/vkontakte/android/api/wall/WallLike;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "WallLike.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/wall/WallLike$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/wall/WallLike$Result;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 35
    return-void
.end method

.method public constructor <init>(ZIIZIILjava/lang/String;)V
    .locals 5
    .param p1, "add"    # Z
    .param p2, "oid"    # I
    .param p3, "pid"    # I
    .param p4, "pub"    # Z
    .param p5, "type"    # I
    .param p6, "parentType"    # I
    .param p7, "akey"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 38
    if-nez p5, :cond_7

    if-eqz p1, :cond_6

    const-string/jumbo v1, "wall.addLike"

    :goto_0
    invoke-direct {p0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 40
    const/16 v1, 0xc

    if-ne p5, v1, :cond_0

    .line 41
    const-string/jumbo v1, "owner_id"

    invoke-virtual {p0, v1, p2}, Lcom/vkontakte/android/api/wall/WallLike;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    const-string/jumbo v2, "post_id"

    invoke-virtual {v1, v2, p3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    const-string/jumbo v2, "type"

    const-string/jumbo v3, "post_ads"

    .line 42
    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    const-string/jumbo v2, "owner_id"

    invoke-virtual {v1, v2, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    const-string/jumbo v2, "item_id"

    invoke-virtual {v1, v2, p3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 43
    if-eqz p1, :cond_0

    if-eqz p4, :cond_0

    .line 44
    const-string/jumbo v1, "need_publish"

    invoke-virtual {p0, v1, v4}, Lcom/vkontakte/android/api/wall/WallLike;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 47
    :cond_0
    if-nez p5, :cond_1

    .line 48
    const-string/jumbo v1, "owner_id"

    invoke-virtual {p0, v1, p2}, Lcom/vkontakte/android/api/wall/WallLike;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    const-string/jumbo v2, "post_id"

    invoke-virtual {v1, v2, p3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 49
    if-eqz p1, :cond_1

    if-eqz p4, :cond_1

    .line 50
    const-string/jumbo v1, "need_publish"

    invoke-virtual {p0, v1, v4}, Lcom/vkontakte/android/api/wall/WallLike;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 53
    :cond_1
    if-ne p5, v4, :cond_2

    .line 54
    const-string/jumbo v1, "type"

    const-string/jumbo v2, "photo"

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/api/wall/WallLike;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    const-string/jumbo v2, "owner_id"

    invoke-virtual {v1, v2, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    const-string/jumbo v2, "item_id"

    invoke-virtual {v1, v2, p3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 55
    if-eqz p7, :cond_2

    invoke-virtual {p7}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2

    .line 56
    const-string/jumbo v1, "access_key"

    invoke-virtual {p0, v1, p7}, Lcom/vkontakte/android/api/wall/WallLike;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 59
    :cond_2
    const/4 v1, 0x2

    if-ne p5, v1, :cond_3

    .line 60
    const-string/jumbo v1, "type"

    const-string/jumbo v2, "video"

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/api/wall/WallLike;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    const-string/jumbo v2, "owner_id"

    invoke-virtual {v1, v2, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    const-string/jumbo v2, "item_id"

    invoke-virtual {v1, v2, p3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 61
    if-eqz p7, :cond_3

    invoke-virtual {p7}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_3

    .line 62
    const-string/jumbo v1, "access_key"

    invoke-virtual {p0, v1, p7}, Lcom/vkontakte/android/api/wall/WallLike;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 65
    :cond_3
    const/4 v1, 0x5

    if-ne p5, v1, :cond_4

    .line 66
    const-string/jumbo v0, ""

    .line 67
    .local v0, "t":Ljava/lang/String;
    packed-switch p6, :pswitch_data_0

    .line 78
    :goto_1
    :pswitch_0
    const-string/jumbo v1, "type"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "comment"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/api/wall/WallLike;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    const-string/jumbo v2, "owner_id"

    invoke-virtual {v1, v2, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    const-string/jumbo v2, "item_id"

    invoke-virtual {v1, v2, p3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 80
    .end local v0    # "t":Ljava/lang/String;
    :cond_4
    const/4 v1, 0x4

    if-ne p5, v1, :cond_5

    .line 81
    const-string/jumbo v1, "type"

    const-string/jumbo v2, "topic"

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/api/wall/WallLike;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    const-string/jumbo v2, "owner_id"

    invoke-virtual {v1, v2, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    const-string/jumbo v2, "item_id"

    invoke-virtual {v1, v2, p3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 83
    :cond_5
    return-void

    .line 38
    :cond_6
    const-string/jumbo v1, "wall.deleteLike"

    goto/16 :goto_0

    :cond_7
    if-eqz p1, :cond_8

    const-string/jumbo v1, "likes.add"

    goto/16 :goto_0

    :cond_8
    const-string/jumbo v1, "likes.delete"

    goto/16 :goto_0

    .line 69
    .restart local v0    # "t":Ljava/lang/String;
    :pswitch_1
    const-string/jumbo v0, "photo_"

    .line 70
    goto :goto_1

    .line 72
    :pswitch_2
    const-string/jumbo v0, "video_"

    .line 73
    goto :goto_1

    .line 75
    :pswitch_3
    const-string/jumbo v0, "topic_"

    goto :goto_1

    .line 67
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method public static market(Lcom/vkontakte/android/api/board/BoardComment;I)Lcom/vkontakte/android/api/wall/WallLike;
    .locals 3
    .param p0, "comment"    # Lcom/vkontakte/android/api/board/BoardComment;
    .param p1, "owner_id"    # I

    .prologue
    .line 21
    new-instance v1, Lcom/vkontakte/android/api/wall/WallLike;

    invoke-virtual {p0}, Lcom/vkontakte/android/api/board/BoardComment;->isLiked()Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "likes.add"

    :goto_0
    invoke-direct {v1, v0}, Lcom/vkontakte/android/api/wall/WallLike;-><init>(Ljava/lang/String;)V

    const-string/jumbo v0, "type"

    const-string/jumbo v2, "market_comment"

    invoke-virtual {v1, v0, v2}, Lcom/vkontakte/android/api/wall/WallLike;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "item_id"

    .line 22
    invoke-virtual {p0}, Lcom/vkontakte/android/api/board/BoardComment;->getId()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "owner_id"

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/wall/WallLike;

    return-object v0

    .line 21
    :cond_0
    const-string/jumbo v0, "likes.delete"

    goto :goto_0
.end method

.method public static market(Lcom/vkontakte/android/data/Good;)Lcom/vkontakte/android/api/wall/WallLike;
    .locals 3
    .param p0, "good"    # Lcom/vkontakte/android/data/Good;

    .prologue
    .line 16
    new-instance v1, Lcom/vkontakte/android/api/wall/WallLike;

    iget v0, p0, Lcom/vkontakte/android/data/Good;->user_likes:I

    if-eqz v0, :cond_0

    const-string/jumbo v0, "likes.add"

    :goto_0
    invoke-direct {v1, v0}, Lcom/vkontakte/android/api/wall/WallLike;-><init>(Ljava/lang/String;)V

    const-string/jumbo v0, "type"

    const-string/jumbo v2, "market"

    invoke-virtual {v1, v0, v2}, Lcom/vkontakte/android/api/wall/WallLike;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "item_id"

    iget v2, p0, Lcom/vkontakte/android/data/Good;->id:I

    .line 17
    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "owner_id"

    iget v2, p0, Lcom/vkontakte/android/data/Good;->owner_id:I

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/wall/WallLike;

    return-object v0

    .line 16
    :cond_0
    const-string/jumbo v0, "likes.delete"

    goto :goto_0
.end method

.method public static newsEntry(Lcom/vkontakte/android/NewsEntry;ZLjava/lang/String;)Lcom/vkontakte/android/api/wall/WallLike;
    .locals 8
    .param p0, "e"    # Lcom/vkontakte/android/NewsEntry;
    .param p1, "liked"    # Z
    .param p2, "akey"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 26
    new-instance v0, Lcom/vkontakte/android/api/wall/WallLike;

    iget v2, p0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget v5, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    move v1, p1

    move v6, v4

    move-object v7, p2

    invoke-direct/range {v0 .. v7}, Lcom/vkontakte/android/api/wall/WallLike;-><init>(ZIIZIILjava/lang/String;)V

    .line 27
    .local v0, "wallLike":Lcom/vkontakte/android/api/wall/WallLike;
    invoke-virtual {p0}, Lcom/vkontakte/android/NewsEntry;->hasTrackCode()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 28
    const-string/jumbo v1, "track_code"

    invoke-virtual {p0}, Lcom/vkontakte/android/NewsEntry;->getTrackCode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/wall/WallLike;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 30
    :cond_0
    return-object v0
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/wall/WallLike$Result;
    .locals 6
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 87
    :try_start_0
    const-string/jumbo v3, "response"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v4, "likes"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 88
    .local v0, "likes":I
    new-instance v1, Lcom/vkontakte/android/api/wall/WallLike$Result;

    invoke-direct {v1}, Lcom/vkontakte/android/api/wall/WallLike$Result;-><init>()V

    .line 89
    .local v1, "res":Lcom/vkontakte/android/api/wall/WallLike$Result;
    iput v0, v1, Lcom/vkontakte/android/api/wall/WallLike$Result;->likes:I

    .line 90
    const-string/jumbo v3, "response"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v4, "reposts"

    const/4 v5, -0x1

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    iput v3, v1, Lcom/vkontakte/android/api/wall/WallLike$Result;->retweets:I

    .line 91
    const-string/jumbo v3, "response"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v4, "reposted_post_id"

    const/4 v5, -0x1

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    iput v3, v1, Lcom/vkontakte/android/api/wall/WallLike$Result;->postID:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    .end local v0    # "likes":I
    .end local v1    # "res":Lcom/vkontakte/android/api/wall/WallLike$Result;
    :goto_0
    return-object v1

    .line 93
    :catch_0
    move-exception v2

    .line 94
    .local v2, "x":Ljava/lang/Exception;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 96
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
    .line 13
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/wall/WallLike;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/wall/WallLike$Result;

    move-result-object v0

    return-object v0
.end method
