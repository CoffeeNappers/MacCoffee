.class public Lcom/vkontakte/android/api/friends/FriendsGetSuggestions;
.super Lcom/vkontakte/android/api/ListAPIRequest;
.source "FriendsGetSuggestions.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/ListAPIRequest",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;"
    }
.end annotation


# instance fields
.field mutual:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 6
    .param p1, "onlyMutual"    # Z

    .prologue
    const/4 v5, 0x0

    .line 21
    const-string/jumbo v0, "execute"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ListAPIRequest;-><init>(Ljava/lang/String;)V

    .line 18
    iput-boolean v5, p0, Lcom/vkontakte/android/api/friends/FriendsGetSuggestions;->mutual:Z

    .line 22
    iput-boolean p1, p0, Lcom/vkontakte/android/api/friends/FriendsGetSuggestions;->mutual:Z

    .line 23
    const-string/jumbo v1, "code"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v3, "var f=API.friends.getSuggestions({fields:\"%s,education,city,country,common_count\",count:200%s}).items;return {f:f,mc:API.getProfiles({user_ids:%d,fields:\"country\"})[0].country.id};"

    const/4 v0, 0x3

    new-array v4, v0, [Ljava/lang/Object;

    const-string/jumbo v0, "photo_200,photo_100,photo_50"

    aput-object v0, v4, v5

    const/4 v5, 0x1

    if-eqz p1, :cond_0

    const-string/jumbo v0, ",filter:\"mutual\""

    :goto_0
    aput-object v0, v4, v5

    const/4 v0, 0x2

    .line 24
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v0

    .line 23
    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Lcom/vkontakte/android/api/friends/FriendsGetSuggestions;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 25
    return-void

    .line 23
    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method public constructor <init>(ZII)V
    .locals 2
    .param p1, "onlyMutual"    # Z
    .param p2, "offset"    # I
    .param p3, "count"    # I

    .prologue
    .line 28
    const-string/jumbo v0, "friends.getSuggestions"

    new-instance v1, Lcom/vkontakte/android/api/friends/FriendsGetSuggestions$1;

    invoke-direct {v1}, Lcom/vkontakte/android/api/friends/FriendsGetSuggestions$1;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/api/ListAPIRequest;-><init>(Ljava/lang/String;Lcom/vkontakte/android/data/Parser;)V

    .line 18
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/api/friends/FriendsGetSuggestions;->mutual:Z

    .line 40
    if-eqz p1, :cond_0

    .line 41
    const-string/jumbo v0, "filter"

    const-string/jumbo v1, "mutual"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/friends/FriendsGetSuggestions;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 43
    :cond_0
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "education,city,country,common_count,photo_50,photo_100,photo_200"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/friends/FriendsGetSuggestions;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 44
    const-string/jumbo v0, "offset"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/friends/FriendsGetSuggestions;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 45
    const-string/jumbo v0, "count"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/friends/FriendsGetSuggestions;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 46
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;
    .locals 1
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 50
    new-instance v0, Lcom/vkontakte/android/data/VKList;

    invoke-direct {v0}, Lcom/vkontakte/android/data/VKList;-><init>()V

    return-object v0
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 17
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/friends/FriendsGetSuggestions;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;

    move-result-object v0

    return-object v0
.end method
