.class public Lcom/vkontakte/android/api/video/VideoViewSegments;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "VideoViewSegments.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/util/Set;IILjava/lang/String;I)V
    .locals 4
    .param p2, "ownerId"    # I
    .param p3, "videoId"    # I
    .param p4, "referrer"    # Ljava/lang/String;
    .param p5, "searchPos"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lcom/vkontakte/android/utils/Range;",
            ">;II",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 15
    .local p1, "ranges":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/utils/Range;>;"
    const-string/jumbo v2, "video.viewSegments"

    invoke-direct {p0, v2}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 16
    const-string/jumbo v2, "owner_id"

    invoke-virtual {p0, v2, p2}, Lcom/vkontakte/android/api/video/VideoViewSegments;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 17
    const-string/jumbo v2, "video_id"

    invoke-virtual {p0, v2, p3}, Lcom/vkontakte/android/api/video/VideoViewSegments;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 18
    const-string/jumbo v2, "module"

    invoke-static {p4, p2}, Lcom/vkontakte/android/api/video/VideoViewSegments;->convertReferrerToModule(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/vkontakte/android/api/video/VideoViewSegments;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 21
    if-lez p5, :cond_0

    .line 22
    const-string/jumbo v2, "search_pos"

    invoke-virtual {p0, v2, p5}, Lcom/vkontakte/android/api/video/VideoViewSegments;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 25
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/utils/Range;

    .line 27
    .local v1, "range":Lcom/vkontakte/android/utils/Range;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_1

    .line 28
    const/16 v3, 0x2c

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 30
    :cond_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 32
    .end local v1    # "range":Lcom/vkontakte/android/utils/Range;
    :cond_2
    const-string/jumbo v2, "ranges"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/vkontakte/android/api/video/VideoViewSegments;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 33
    return-void
.end method

.method private static convertReferrerToModule(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1
    .param p0, "referrer"    # Ljava/lang/String;
    .param p1, "ownerId"    # I

    .prologue
    .line 51
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 52
    const-string/jumbo v0, "other"

    .line 70
    :goto_0
    return-object v0

    .line 53
    :cond_0
    const-string/jumbo v0, "search"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 54
    const-string/jumbo v0, "search"

    goto :goto_0

    .line 55
    :cond_1
    const-string/jumbo v0, "wall"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 56
    const-string/jumbo v0, "wall"

    goto :goto_0

    .line 57
    :cond_2
    const-string/jumbo v0, "fave"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 58
    const-string/jumbo v0, "fave"

    goto :goto_0

    .line 59
    :cond_3
    const-string/jumbo v0, "news"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 60
    const-string/jumbo v0, "feed"

    goto :goto_0

    .line 61
    :cond_4
    const-string/jumbo v0, "club"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string/jumbo v0, "videos_group"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 62
    :cond_5
    const-string/jumbo v0, "group"

    goto :goto_0

    .line 63
    :cond_6
    const-string/jumbo v0, "videos_user"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 64
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    if-ne p1, v0, :cond_7

    const-string/jumbo v0, "videos"

    goto :goto_0

    :cond_7
    const-string/jumbo v0, "profile"

    goto :goto_0

    .line 65
    :cond_8
    const-string/jumbo v0, "messages"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 66
    const-string/jumbo v0, "im"

    goto :goto_0

    .line 67
    :cond_9
    const-string/jumbo v0, "comments"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 68
    const-string/jumbo v0, "pages"

    goto :goto_0

    .line 70
    :cond_a
    const-string/jumbo v0, "other"

    goto/16 :goto_0
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Ljava/lang/Integer;
    .locals 2
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 38
    :try_start_0
    const-string/jumbo v1, "response"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 41
    :goto_0
    return-object v1

    .line 39
    :catch_0
    move-exception v0

    .line 40
    .local v0, "x":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    invoke-static {v1, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 41
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
    .line 12
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/video/VideoViewSegments;->parse(Lorg/json/JSONObject;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
