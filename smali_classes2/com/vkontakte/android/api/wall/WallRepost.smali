.class public Lcom/vkontakte/android/api/wall/WallRepost;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "WallRepost.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/wall/WallRepost$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/wall/WallRepost$Result;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "object"    # Ljava/lang/String;
    .param p2, "gid"    # I
    .param p3, "msg"    # Ljava/lang/String;
    .param p4, "refer"    # Ljava/lang/String;
    .param p5, "track_code"    # Ljava/lang/String;

    .prologue
    .line 31
    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/api/wall/WallRepost;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "object"    # Ljava/lang/String;
    .param p2, "gid"    # I
    .param p3, "msg"    # Ljava/lang/String;
    .param p4, "accessKey"    # Ljava/lang/String;
    .param p5, "refer"    # Ljava/lang/String;
    .param p6, "track_code"    # Ljava/lang/String;

    .prologue
    .line 13
    const-string/jumbo v0, "wall.repost"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 14
    const-string/jumbo v0, "ref"

    invoke-virtual {p0, v0, p5}, Lcom/vkontakte/android/api/wall/WallRepost;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 15
    const-string/jumbo v0, "object"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/wall/WallRepost;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 16
    const-string/jumbo v0, "message"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/wall/WallRepost;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 17
    if-eqz p2, :cond_0

    .line 18
    const-string/jumbo v0, "group_id"

    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/wall/WallRepost;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 20
    :cond_0
    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 21
    const-string/jumbo v0, "track_code"

    invoke-virtual {p0, v0, p6}, Lcom/vkontakte/android/api/wall/WallRepost;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 23
    :cond_1
    if-eqz p4, :cond_2

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_2

    .line 24
    const-string/jumbo v0, "access_key"

    invoke-virtual {p0, v0, p4}, Lcom/vkontakte/android/api/wall/WallRepost;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 27
    :cond_2
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "wall.repost"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    aput-object p5, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 28
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/wall/WallRepost$Result;
    .locals 4
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 36
    :try_start_0
    const-string/jumbo v3, "response"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 37
    .local v0, "r":Lorg/json/JSONObject;
    new-instance v1, Lcom/vkontakte/android/api/wall/WallRepost$Result;

    invoke-direct {v1}, Lcom/vkontakte/android/api/wall/WallRepost$Result;-><init>()V

    .line 38
    .local v1, "res":Lcom/vkontakte/android/api/wall/WallRepost$Result;
    const-string/jumbo v3, "likes_count"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v1, Lcom/vkontakte/android/api/wall/WallRepost$Result;->likes:I

    .line 39
    const-string/jumbo v3, "reposts_count"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v1, Lcom/vkontakte/android/api/wall/WallRepost$Result;->retweets:I

    .line 40
    const-string/jumbo v3, "post_id"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v1, Lcom/vkontakte/android/api/wall/WallRepost$Result;->postID:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .end local v0    # "r":Lorg/json/JSONObject;
    .end local v1    # "res":Lcom/vkontakte/android/api/wall/WallRepost$Result;
    :goto_0
    return-object v1

    .line 42
    :catch_0
    move-exception v2

    .line 43
    .local v2, "x":Ljava/lang/Exception;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 44
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
    .line 10
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/wall/WallRepost;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/wall/WallRepost$Result;

    move-result-object v0

    return-object v0
.end method
