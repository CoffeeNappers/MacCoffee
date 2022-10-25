.class public Lcom/vkontakte/android/api/apps/AppsGetGamesPage;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "AppsGetGamesPage.java"

# interfaces
.implements Ljava/util/Comparator;
.implements Lcom/vkontakte/android/data/ServerKeys;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;",
        ">;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/vkontakte/android/data/ApiApplication;",
        ">;",
        "Lcom/vkontakte/android/data/ServerKeys;"
    }
.end annotation


# static fields
.field private static final KEY_ACTIVITY:Ljava/lang/String; = "activity"

.field private static final KEY_APPS:Ljava/lang/String; = "apps"

.field private static final KEY_CATALOG:Ljava/lang/String; = "catalog"

.field private static final KEY_CATALOG_FEATURED:Ljava/lang/String; = "catalogFeatured"

.field private static final KEY_CATALOG_HTML5:Ljava/lang/String; = "catalogHtml5"

.field private static final KEY_CATALOG_MY:Ljava/lang/String; = "catalogMy"

.field private static final KEY_CATALOG_MY_HTML5:Ljava/lang/String; = "catalogMyHtml5"

.field private static final KEY_CATALOG_NEW:Ljava/lang/String; = "catalogNew"

.field private static final KEY_FRIENDS:Ljava/lang/String; = "friends"

.field private static final KEY_PROFILES:Ljava/lang/String; = "profiles"

.field private static final KEY_REQUESTS_ANDROID:Ljava/lang/String; = "requestsAndroid"

.field private static final KEY_REQUESTS_HTML5:Ljava/lang/String; = "requestsHtml"

.field private static final KEY_SECTIONS:Ljava/lang/String; = "sections"


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 73
    const-string/jumbo v0, "execute.getGamesPage"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 74
    const-string/jumbo v0, "func_v"

    const/4 v1, 0x4

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 75
    const-string/jumbo v0, "platform"

    const-string/jumbo v1, "android"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 76
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "online,photo_100,photo_200,photo_50,sex"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 77
    return-void
.end method

.method private getAllRequestsAndInvites(Lorg/json/JSONArray;Lorg/json/JSONArray;Landroid/util/SparseArray;Landroid/util/SparseArray;)Ljava/util/ArrayList;
    .locals 4
    .param p1, "requestsJsonAndroid"    # Lorg/json/JSONArray;
    .param p2, "requestsJsonHtml"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "Lorg/json/JSONArray;",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/GameRequest;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 173
    .local p3, "profiles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    .local p4, "applications":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/data/ApiApplication;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 175
    .local v0, "allRequests":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 176
    new-instance v2, Lcom/vkontakte/android/data/GameRequest;

    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-direct {v2, v3, p3, p4}, Lcom/vkontakte/android/data/GameRequest;-><init>(Lorg/json/JSONObject;Landroid/util/SparseArray;Landroid/util/SparseArray;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 175
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 179
    :cond_0
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 180
    new-instance v2, Lcom/vkontakte/android/data/GameRequest;

    invoke-virtual {p2, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-direct {v2, v3, p3, p4}, Lcom/vkontakte/android/data/GameRequest;-><init>(Lorg/json/JSONObject;Landroid/util/SparseArray;Landroid/util/SparseArray;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 179
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 183
    :cond_1
    invoke-static {}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$$Lambda$1;->lambdaFactory$()Ljava/util/Comparator;

    move-result-object v2

    invoke-static {v0, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 185
    return-object v0
.end method

.method static synthetic lambda$getAllRequestsAndInvites$0(Lcom/vkontakte/android/data/GameRequest;Lcom/vkontakte/android/data/GameRequest;)I
    .locals 2
    .param p0, "gr1"    # Lcom/vkontakte/android/data/GameRequest;
    .param p1, "gr2"    # Lcom/vkontakte/android/data/GameRequest;

    .prologue
    .line 183
    iget v0, p0, Lcom/vkontakte/android/data/GameRequest;->time:I

    iget v1, p1, Lcom/vkontakte/android/data/GameRequest;->time:I

    sub-int/2addr v0, v1

    return v0
.end method

.method static parseApplications(Lorg/json/JSONObject;Landroid/util/SparseArray;Ljava/lang/String;)V
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
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 237
    .local p1, "apps":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/data/ApiApplication;>;"
    invoke-virtual {p0, p2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p0, p2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 238
    invoke-virtual {p0, p2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v4, "apps"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 239
    .local v1, "apps1":Lorg/json/JSONArray;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 240
    new-instance v0, Lcom/vkontakte/android/data/ApiApplication;

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/vkontakte/android/data/ApiApplication;-><init>(Lorg/json/JSONObject;)V

    .line 241
    .local v0, "app":Lcom/vkontakte/android/data/ApiApplication;
    iget v3, v0, Lcom/vkontakte/android/data/ApiApplication;->id:I

    invoke-virtual {p1, v3, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 239
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 244
    .end local v0    # "app":Lcom/vkontakte/android/data/ApiApplication;
    .end local v1    # "apps1":Lorg/json/JSONArray;
    .end local v2    # "i":I
    :cond_0
    return-void
.end method

.method private static parseCatalog(Lorg/json/JSONObject;Ljava/util/List;Ljava/lang/String;)V
    .locals 10
    .param p0, "o"    # Lorg/json/JSONObject;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 213
    .local p1, "catalog":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/ApiApplication;>;"
    invoke-static {p0, p2}, Lcom/vkontakte/android/api/APIUtils;->unwrapArray(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/vkontakte/android/api/JSONArrayWithCount;

    move-result-object v6

    .line 214
    .local v6, "jsonArrayWithCount":Lcom/vkontakte/android/api/JSONArrayWithCount;
    if-eqz v6, :cond_3

    .line 215
    iget-object v1, v6, Lcom/vkontakte/android/api/JSONArrayWithCount;->array:Lorg/json/JSONArray;

    .line 216
    .local v1, "catalogJson":Lorg/json/JSONArray;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v3, v8, :cond_3

    .line 217
    new-instance v0, Lcom/vkontakte/android/data/ApiApplication;

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    invoke-direct {v0, v8}, Lcom/vkontakte/android/data/ApiApplication;-><init>(Lorg/json/JSONObject;)V

    .line 218
    .local v0, "app":Lcom/vkontakte/android/data/ApiApplication;
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    const-string/jumbo v9, "friends"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 219
    .local v2, "friendsIds":Lorg/json/JSONArray;
    if-eqz v2, :cond_2

    .line 220
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_1
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v5, v8, :cond_1

    .line 221
    invoke-virtual {v2, v5}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    .line 222
    .local v4, "id":I
    invoke-static {v4}, Lcom/vkontakte/android/data/Friends;->get(I)Lcom/vkontakte/android/UserProfile;

    move-result-object v7

    .line 223
    .local v7, "user":Lcom/vkontakte/android/UserProfile;
    if-eqz v7, :cond_0

    .line 224
    iget-object v8, v0, Lcom/vkontakte/android/data/ApiApplication;->friendsPhotos:Ljava/util/ArrayList;

    iget-object v9, v7, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 220
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 227
    .end local v4    # "id":I
    .end local v7    # "user":Lcom/vkontakte/android/UserProfile;
    :cond_1
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v8

    iput v8, v0, Lcom/vkontakte/android/data/ApiApplication;->friends:I

    .line 229
    .end local v5    # "j":I
    :cond_2
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 216
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 232
    .end local v0    # "app":Lcom/vkontakte/android/data/ApiApplication;
    .end local v1    # "catalogJson":Lorg/json/JSONArray;
    .end local v2    # "friendsIds":Lorg/json/JSONArray;
    .end local v3    # "i":I
    :cond_3
    return-void
.end method

.method static parseProfiles(Lorg/json/JSONObject;Landroid/util/SparseArray;Ljava/lang/String;)V
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
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 249
    .local p1, "profiles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    invoke-virtual {p0, p2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p0, p2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 250
    invoke-virtual {p0, p2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v4, "profiles"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 251
    .local v2, "profiles1":Lorg/json/JSONArray;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v0, v3, :cond_0

    .line 252
    new-instance v1, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    .line 253
    .local v1, "p":Lcom/vkontakte/android/UserProfile;
    iget v3, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {p1, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 251
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 256
    .end local v0    # "i":I
    .end local v1    # "p":Lcom/vkontakte/android/UserProfile;
    .end local v2    # "profiles1":Lorg/json/JSONArray;
    :cond_0
    return-void
.end method

.method private static setNotificationCountToAppInList(Ljava/util/List;II)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;II)V"
        }
    .end annotation

    .prologue
    .line 189
    .local p0, "apps":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/ApiApplication;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/ApiApplication;

    .line 190
    .local v0, "app":Lcom/vkontakte/android/data/ApiApplication;
    iget v2, v0, Lcom/vkontakte/android/data/ApiApplication;->id:I

    if-ne v2, p1, :cond_0

    .line 191
    iput p2, v0, Lcom/vkontakte/android/data/ApiApplication;->notificationCount:I

    .line 195
    .end local v0    # "app":Lcom/vkontakte/android/data/ApiApplication;
    :cond_1
    return-void
.end method


# virtual methods
.method public compare(Lcom/vkontakte/android/data/ApiApplication;Lcom/vkontakte/android/data/ApiApplication;)I
    .locals 2
    .param p1, "lhs"    # Lcom/vkontakte/android/data/ApiApplication;
    .param p2, "rhs"    # Lcom/vkontakte/android/data/ApiApplication;

    .prologue
    .line 201
    iget v0, p1, Lcom/vkontakte/android/data/ApiApplication;->notificationCount:I

    if-nez v0, :cond_0

    iget v0, p2, Lcom/vkontakte/android/data/ApiApplication;->notificationCount:I

    if-nez v0, :cond_0

    .line 202
    const/4 v0, 0x0

    .line 204
    :goto_0
    return v0

    :cond_0
    iget v0, p1, Lcom/vkontakte/android/data/ApiApplication;->notificationCount:I

    iget v1, p2, Lcom/vkontakte/android/data/ApiApplication;->notificationCount:I

    if-ge v0, v1, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 27
    check-cast p1, Lcom/vkontakte/android/data/ApiApplication;

    check-cast p2, Lcom/vkontakte/android/data/ApiApplication;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;->compare(Lcom/vkontakte/android/data/ApiApplication;Lcom/vkontakte/android/data/ApiApplication;)I

    move-result v0

    return v0
.end method

.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;
    .locals 23
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 81
    :try_start_0
    new-instance v17, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;

    invoke-direct/range {v17 .. v17}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;-><init>()V

    .line 83
    .local v17, "result":Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;
    new-instance v12, Landroid/util/SparseArray;

    invoke-direct {v12}, Landroid/util/SparseArray;-><init>()V

    .line 84
    .local v12, "profiles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V

    .line 86
    .local v4, "applications":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/data/ApiApplication;>;"
    const-string/jumbo v20, "response"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 88
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->myCatalog:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    const-string/jumbo v21, "catalogMy"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;->parseCatalog(Lorg/json/JSONObject;Ljava/util/List;Ljava/lang/String;)V

    .line 89
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->myCatalogHtml5:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    const-string/jumbo v21, "catalogMyHtml5"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;->parseCatalog(Lorg/json/JSONObject;Ljava/util/List;Ljava/lang/String;)V

    .line 90
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->html5Catalog:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    const-string/jumbo v21, "catalogHtml5"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;->parseCatalog(Lorg/json/JSONObject;Ljava/util/List;Ljava/lang/String;)V

    .line 91
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->newCatalog:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    const-string/jumbo v21, "catalogNew"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;->parseCatalog(Lorg/json/JSONObject;Ljava/util/List;Ljava/lang/String;)V

    .line 92
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->featuredCatalog:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    const-string/jumbo v21, "catalogFeatured"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;->parseCatalog(Lorg/json/JSONObject;Ljava/util/List;Ljava/lang/String;)V

    .line 93
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->catalog:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    const-string/jumbo v21, "catalog"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;->parseCatalog(Lorg/json/JSONObject;Ljava/util/List;Ljava/lang/String;)V

    .line 95
    const-string/jumbo v20, "requestsAndroid"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-static {v0, v12, v1}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;->parseProfiles(Lorg/json/JSONObject;Landroid/util/SparseArray;Ljava/lang/String;)V

    .line 96
    const-string/jumbo v20, "requestsHtml"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-static {v0, v12, v1}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;->parseProfiles(Lorg/json/JSONObject;Landroid/util/SparseArray;Ljava/lang/String;)V

    .line 97
    const-string/jumbo v20, "activity"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-static {v0, v12, v1}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;->parseProfiles(Lorg/json/JSONObject;Landroid/util/SparseArray;Ljava/lang/String;)V

    .line 99
    const-string/jumbo v20, "requestsAndroid"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-static {v0, v4, v1}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;->parseApplications(Lorg/json/JSONObject;Landroid/util/SparseArray;Ljava/lang/String;)V

    .line 100
    const-string/jumbo v20, "requestsHtml"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-static {v0, v4, v1}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;->parseApplications(Lorg/json/JSONObject;Landroid/util/SparseArray;Ljava/lang/String;)V

    .line 101
    const-string/jumbo v20, "activity"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-static {v0, v4, v1}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;->parseApplications(Lorg/json/JSONObject;Landroid/util/SparseArray;Ljava/lang/String;)V

    .line 103
    new-instance v6, Landroid/util/SparseArray;

    invoke-direct {v6}, Landroid/util/SparseArray;-><init>()V

    .line 105
    .local v6, "countRequest":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/Integer;>;"
    const-string/jumbo v20, "requestsAndroid"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/vkontakte/android/api/APIUtils;->unwrapArray(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/vkontakte/android/api/JSONArrayWithCount;

    move-result-object v20

    move-object/from16 v0, v20

    iget-object v15, v0, Lcom/vkontakte/android/api/JSONArrayWithCount;->array:Lorg/json/JSONArray;

    .line 106
    .local v15, "requestsJsonAndroid":Lorg/json/JSONArray;
    const-string/jumbo v20, "requestsHtml"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/vkontakte/android/api/APIUtils;->unwrapArray(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/vkontakte/android/api/JSONArrayWithCount;

    move-result-object v20

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/vkontakte/android/api/JSONArrayWithCount;->array:Lorg/json/JSONArray;

    move-object/from16 v16, v0

    .line 108
    .local v16, "requestsJsonHtml":Lorg/json/JSONArray;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1, v12, v4}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;->getAllRequestsAndInvites(Lorg/json/JSONArray;Lorg/json/JSONArray;Landroid/util/SparseArray;Landroid/util/SparseArray;)Ljava/util/ArrayList;

    move-result-object v3

    .line 110
    .local v3, "allRequestsAndInvites":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    .line 111
    .local v18, "unreadInvitesAndRequests":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 113
    .local v13, "readInvitesAndRequests":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_0
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v20

    move/from16 v0, v20

    if-ge v11, v0, :cond_4

    .line 114
    invoke-virtual {v3, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/vkontakte/android/data/GameRequest;

    .line 115
    .local v14, "request":Lcom/vkontakte/android/data/GameRequest;
    iget v0, v14, Lcom/vkontakte/android/data/GameRequest;->type:I

    move/from16 v20, v0

    const/16 v21, 0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_0

    .line 116
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->invites:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    :goto_1
    iget-boolean v0, v14, Lcom/vkontakte/android/data/GameRequest;->unread:Z

    move/from16 v20, v0

    if-eqz v20, :cond_3

    .line 126
    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 113
    :goto_2
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 118
    :cond_0
    iget v0, v14, Lcom/vkontakte/android/data/GameRequest;->appId:I

    move/from16 v20, v0

    if-eqz v20, :cond_1

    .line 119
    iget v0, v14, Lcom/vkontakte/android/data/GameRequest;->appId:I

    move/from16 v20, v0

    const/16 v21, 0x0

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v6, v0, v1}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Integer;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 120
    .local v5, "count":I
    iget v0, v14, Lcom/vkontakte/android/data/GameRequest;->appId:I

    move/from16 v20, v0

    add-int/lit8 v21, v5, 0x1

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v6, v0, v1}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 122
    .end local v5    # "count":I
    :cond_1
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->requests:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 161
    .end local v3    # "allRequestsAndInvites":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    .end local v4    # "applications":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/data/ApiApplication;>;"
    .end local v6    # "countRequest":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/Integer;>;"
    .end local v11    # "i":I
    .end local v12    # "profiles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    .end local v13    # "readInvitesAndRequests":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    .end local v14    # "request":Lcom/vkontakte/android/data/GameRequest;
    .end local v15    # "requestsJsonAndroid":Lorg/json/JSONArray;
    .end local v16    # "requestsJsonHtml":Lorg/json/JSONArray;
    .end local v17    # "result":Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;
    .end local v18    # "unreadInvitesAndRequests":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    :catch_0
    move-exception v19

    .line 162
    .local v19, "x":Ljava/lang/Exception;
    const-string/jumbo v20, "vk"

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 164
    const/16 v17, 0x0

    .end local v19    # "x":Ljava/lang/Exception;
    :cond_2
    return-object v17

    .line 129
    .restart local v3    # "allRequestsAndInvites":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    .restart local v4    # "applications":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/data/ApiApplication;>;"
    .restart local v6    # "countRequest":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/Integer;>;"
    .restart local v11    # "i":I
    .restart local v12    # "profiles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    .restart local v13    # "readInvitesAndRequests":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    .restart local v14    # "request":Lcom/vkontakte/android/data/GameRequest;
    .restart local v15    # "requestsJsonAndroid":Lorg/json/JSONArray;
    .restart local v16    # "requestsJsonHtml":Lorg/json/JSONArray;
    .restart local v17    # "result":Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;
    .restart local v18    # "unreadInvitesAndRequests":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    :cond_3
    :try_start_1
    invoke-virtual {v13, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 134
    .end local v14    # "request":Lcom/vkontakte/android/data/GameRequest;
    :cond_4
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->invitesAndRequests:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 135
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->invitesAndRequests:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 138
    const/4 v11, 0x0

    :goto_3
    invoke-virtual {v6}, Landroid/util/SparseArray;->size()I

    move-result v20

    move/from16 v0, v20

    if-ge v11, v0, :cond_5

    .line 139
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->myCatalog:Ljava/util/ArrayList;

    move-object/from16 v21, v0

    invoke-virtual {v6, v11}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v22

    invoke-virtual {v6, v11}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Integer;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, v21

    move/from16 v1, v22

    move/from16 v2, v20

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;->setNotificationCountToAppInList(Ljava/util/List;II)V

    .line 140
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->newCatalog:Ljava/util/ArrayList;

    move-object/from16 v21, v0

    invoke-virtual {v6, v11}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v22

    invoke-virtual {v6, v11}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Integer;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, v21

    move/from16 v1, v22

    move/from16 v2, v20

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;->setNotificationCountToAppInList(Ljava/util/List;II)V

    .line 138
    add-int/lit8 v11, v11, 0x1

    goto :goto_3

    .line 143
    :cond_5
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->myCatalog:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 144
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->newCatalog:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 146
    const-string/jumbo v20, "activity"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/vkontakte/android/api/APIUtils;->unwrapArray(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/vkontakte/android/api/JSONArrayWithCount;

    move-result-object v20

    move-object/from16 v0, v20

    iget-object v7, v0, Lcom/vkontakte/android/api/JSONArrayWithCount;->array:Lorg/json/JSONArray;

    .line 147
    .local v7, "feedsJson":Lorg/json/JSONArray;
    const/4 v11, 0x0

    :goto_4
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v20

    move/from16 v0, v20

    if-ge v11, v0, :cond_7

    .line 148
    new-instance v10, Lcom/vkontakte/android/data/GameFeedEntry;

    invoke-virtual {v7, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-direct {v10, v0, v12, v4}, Lcom/vkontakte/android/data/GameFeedEntry;-><init>(Lorg/json/JSONObject;Landroid/util/SparseArray;Landroid/util/SparseArray;)V

    .line 149
    .local v10, "gfe":Lcom/vkontakte/android/data/GameFeedEntry;
    iget-object v0, v10, Lcom/vkontakte/android/data/GameFeedEntry;->user:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v20, v0

    if-eqz v20, :cond_6

    iget-object v0, v10, Lcom/vkontakte/android/data/GameFeedEntry;->app:Lcom/vkontakte/android/data/ApiApplication;

    move-object/from16 v20, v0

    if-eqz v20, :cond_6

    .line 150
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->feed:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 147
    :cond_6
    add-int/lit8 v11, v11, 0x1

    goto :goto_4

    .line 154
    .end local v10    # "gfe":Lcom/vkontakte/android/data/GameFeedEntry;
    :cond_7
    const-string/jumbo v20, "sections"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/vkontakte/android/api/APIUtils;->unwrapArray(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/vkontakte/android/api/JSONArrayWithCount;

    move-result-object v20

    move-object/from16 v0, v20

    iget-object v9, v0, Lcom/vkontakte/android/api/JSONArrayWithCount;->array:Lorg/json/JSONArray;

    .line 155
    .local v9, "genresArray":Lorg/json/JSONArray;
    const/4 v11, 0x0

    :goto_5
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v20

    move/from16 v0, v20

    if-ge v11, v0, :cond_2

    .line 156
    new-instance v8, Lcom/vkontakte/android/data/GameGenre;

    invoke-virtual {v9, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-direct {v8, v0}, Lcom/vkontakte/android/data/GameGenre;-><init>(Lorg/json/JSONObject;)V

    .line 157
    .local v8, "genre":Lcom/vkontakte/android/data/GameGenre;
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->genres:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 155
    add-int/lit8 v11, v11, 0x1

    goto :goto_5
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 27
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;

    move-result-object v0

    return-object v0
.end method
