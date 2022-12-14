.class public Lcom/vkontakte/android/api/users/UsersSearch;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "UsersSearch.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;,
        Lcom/vkontakte/android/api/users/UsersSearch$SimpleGroupSearch;,
        Lcom/vkontakte/android/api/users/UsersSearch$SimpleSearch;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;",
        ">;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;II)V
    .locals 8
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "offset"    # I
    .param p3, "count"    # I

    .prologue
    .line 24
    const-string/jumbo v5, "execute"

    invoke-direct {p0, v5}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 25
    const-string/jumbo v1, "photo_100,photo_50,photo_200,online"

    .line 26
    .local v1, "fields":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "var s=API.users.search({q:\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\""

    const-string/jumbo v7, "\\\""

    invoke-virtual {p1, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\",offset:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ",count:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ",fields:\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\"});"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 28
    .local v0, "code":Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "pID":Z
    const/4 v3, 0x0

    .line 29
    .local v3, "pDomain":Z
    if-nez p2, :cond_1

    .line 30
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/users/UsersSearch;->intval(Ljava/lang/String;)I

    move-result v2

    .line 31
    .local v2, "iv":I
    if-lez v2, :cond_0

    .line 32
    const/4 v4, 0x1

    .line 33
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "var p_id=API.users.get({user_ids:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ",fields:\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\"});"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 35
    :cond_0
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/users/UsersSearch;->isInt(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/users/UsersSearch;->isDomain(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "id"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 36
    const/4 v3, 0x1

    .line 37
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "var p_domain=API.users.get({user_ids:\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\",fields:\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\"});"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 40
    .end local v2    # "iv":I
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "return s"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 41
    if-eqz v4, :cond_2

    .line 42
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "+{p_id:p_id[0]}"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 44
    :cond_2
    if-eqz v3, :cond_3

    .line 45
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "+{p_domain:p_domain[0]}"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 47
    :cond_3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ";"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 48
    const-string/jumbo v5, "code"

    invoke-virtual {p0, v5, v0}, Lcom/vkontakte/android/api/users/UsersSearch;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 51
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/os/Bundle;II)V
    .locals 4
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "xargs"    # Landroid/os/Bundle;
    .param p3, "offset"    # I
    .param p4, "count"    # I

    .prologue
    .line 54
    const-string/jumbo v2, "users.search"

    invoke-direct {p0, v2}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 55
    const-string/jumbo v2, "fields"

    const-string/jumbo v3, "photo_100,photo_50,photo_200,online,education,city,country,common_count,verified,is_friend"

    invoke-virtual {p0, v2, v3}, Lcom/vkontakte/android/api/users/UsersSearch;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 56
    const-string/jumbo v2, "filter"

    const-string/jumbo v3, "mutual"

    invoke-virtual {p0, v2, v3}, Lcom/vkontakte/android/api/users/UsersSearch;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 57
    const-string/jumbo v2, "q"

    invoke-virtual {p0, v2, p1}, Lcom/vkontakte/android/api/users/UsersSearch;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 58
    const-string/jumbo v2, "offset"

    invoke-virtual {p0, v2, p3}, Lcom/vkontakte/android/api/users/UsersSearch;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    const-string/jumbo v3, "count"

    invoke-virtual {v2, v3, p4}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 59
    if-nez p2, :cond_1

    .line 66
    :cond_0
    return-void

    .line 62
    :cond_1
    invoke-virtual {p2}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 63
    .local v1, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 64
    .local v0, "key":Ljava/lang/String;
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v0, v3}, Lcom/vkontakte/android/api/users/UsersSearch;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method private intval(Ljava/lang/String;)I
    .locals 6
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 89
    const-string/jumbo v1, ""

    .line 90
    .local v1, "is":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v0, v4, :cond_1

    .line 91
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->isDigit(C)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 92
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 90
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 95
    :cond_1
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_2

    .line 101
    :goto_1
    return v3

    .line 99
    :cond_2
    :try_start_0
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    goto :goto_1

    .line 100
    :catch_0
    move-exception v2

    .line 101
    .local v2, "x":Ljava/lang/Exception;
    goto :goto_1
.end method

.method private isDomain(Ljava/lang/String;)Z
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 110
    const-string/jumbo v0, "[A-Za-z0-9_\\.]{3,}"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private isInt(Ljava/lang/String;)Z
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 106
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/users/UsersSearch;->intval(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;
    .locals 6
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 70
    :try_start_0
    const-string/jumbo v4, "response"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string/jumbo v5, "p_id"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 71
    .local v1, "pID":Lorg/json/JSONObject;
    const-string/jumbo v4, "response"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string/jumbo v5, "p_domain"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 72
    .local v0, "pDomain":Lorg/json/JSONObject;
    new-instance v2, Lcom/vkontakte/android/data/VKList;

    const-string/jumbo v4, "response"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-class v5, Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;

    invoke-direct {v2, v4, v5}, Lcom/vkontakte/android/data/VKList;-><init>(Lorg/json/JSONObject;Ljava/lang/Class;)V

    .line 73
    .local v2, "r":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;>;"
    if-eqz v1, :cond_0

    .line 74
    const/4 v4, 0x0

    new-instance v5, Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;

    invoke-direct {v5, v1}, Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual {v2, v4, v5}, Lcom/vkontakte/android/data/VKList;->add(ILjava/lang/Object;)V

    .line 75
    invoke-virtual {v2}, Lcom/vkontakte/android/data/VKList;->total()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v2, v4}, Lcom/vkontakte/android/data/VKList;->setTotal(I)V

    .line 77
    :cond_0
    if-eqz v0, :cond_1

    .line 78
    const/4 v4, 0x0

    new-instance v5, Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;

    invoke-direct {v5, v0}, Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual {v2, v4, v5}, Lcom/vkontakte/android/data/VKList;->add(ILjava/lang/Object;)V

    .line 79
    invoke-virtual {v2}, Lcom/vkontakte/android/data/VKList;->total()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v2, v4}, Lcom/vkontakte/android/data/VKList;->setTotal(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    .end local v0    # "pDomain":Lorg/json/JSONObject;
    .end local v1    # "pID":Lorg/json/JSONObject;
    .end local v2    # "r":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;>;"
    :cond_1
    :goto_0
    return-object v2

    .line 82
    :catch_0
    move-exception v3

    .line 83
    .local v3, "x":Ljava/lang/Exception;
    const-string/jumbo v4, "vk"

    invoke-static {v4, v3}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 85
    const/4 v2, 0x0

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
    .line 21
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/users/UsersSearch;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;

    move-result-object v0

    return-object v0
.end method
