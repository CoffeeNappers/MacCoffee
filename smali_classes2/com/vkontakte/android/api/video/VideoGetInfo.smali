.class public Lcom/vkontakte/android/api/video/VideoGetInfo;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "VideoGetInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/video/VideoGetInfo$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/video/VideoGetInfo$Result;",
        ">;"
    }
.end annotation


# static fields
.field private static final CODE:Ljava/lang/String; = "return {l:API.likes.getList({type:\"video\",item_id:%1$d,owner_id:%2$d,count:1}).count,il:API.likes.isLiked({type:\"video\",item_id:%1$d,owner_id:%2$d})};"


# direct methods
.method public constructor <init>(II)V
    .locals 6
    .param p1, "oid"    # I
    .param p2, "vid"    # I

    .prologue
    .line 19
    const-string/jumbo v0, "execute"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 20
    const-string/jumbo v0, "code"

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v2, "return {l:API.likes.getList({type:\"video\",item_id:%1$d,owner_id:%2$d,count:1}).count,il:API.likes.isLiked({type:\"video\",item_id:%1$d,owner_id:%2$d})};"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/video/VideoGetInfo;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 21
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/video/VideoGetInfo$Result;
    .locals 7
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    const/4 v4, 0x1

    .line 25
    const/4 v0, -0x1

    .line 26
    .local v0, "myTagID":I
    :try_start_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .local v2, "t":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    new-instance v1, Lcom/vkontakte/android/api/video/VideoGetInfo$Result;

    invoke-direct {v1}, Lcom/vkontakte/android/api/video/VideoGetInfo$Result;-><init>()V

    .line 28
    .local v1, "r":Lcom/vkontakte/android/api/video/VideoGetInfo$Result;
    iput-object v2, v1, Lcom/vkontakte/android/api/video/VideoGetInfo$Result;->tags:Ljava/util/ArrayList;

    .line 29
    const-string/jumbo v5, "response"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string/jumbo v6, "l"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v1, Lcom/vkontakte/android/api/video/VideoGetInfo$Result;->numLikes:I

    .line 30
    const-string/jumbo v5, "response"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string/jumbo v6, "il"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string/jumbo v6, "liked"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    if-ne v5, v4, :cond_0

    :goto_0
    iput-boolean v4, v1, Lcom/vkontakte/android/api/video/VideoGetInfo$Result;->isLiked:Z

    .line 31
    iput v0, v1, Lcom/vkontakte/android/api/video/VideoGetInfo$Result;->myTagID:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .end local v1    # "r":Lcom/vkontakte/android/api/video/VideoGetInfo$Result;
    .end local v2    # "t":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :goto_1
    return-object v1

    .line 30
    .restart local v1    # "r":Lcom/vkontakte/android/api/video/VideoGetInfo$Result;
    .restart local v2    # "t":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_0
    const/4 v4, 0x0

    goto :goto_0

    .line 33
    .end local v1    # "r":Lcom/vkontakte/android/api/video/VideoGetInfo$Result;
    .end local v2    # "t":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :catch_0
    move-exception v3

    .line 34
    .local v3, "x":Ljava/lang/Exception;
    const-string/jumbo v4, "vk"

    invoke-static {v4, v3}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 36
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 14
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/video/VideoGetInfo;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/video/VideoGetInfo$Result;

    move-result-object v0

    return-object v0
.end method
