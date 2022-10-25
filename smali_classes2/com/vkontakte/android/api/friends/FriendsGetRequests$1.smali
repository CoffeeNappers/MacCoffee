.class Lcom/vkontakte/android/api/friends/FriendsGetRequests$1;
.super Lcom/vkontakte/android/data/Parser;
.source "FriendsGetRequests.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/api/friends/FriendsGetRequests;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/friends/FriendsGetRequests$Result;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/data/Parser",
        "<",
        "Lcom/vkontakte/android/RequestUserProfile;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/api/friends/FriendsGetRequests;

.field final synthetic val$fromNames:Landroid/util/SparseArray;

.field final synthetic val$myFriends:Ljava/util/ArrayList;

.field final synthetic val$users:Landroid/util/SparseArray;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/api/friends/FriendsGetRequests;Landroid/util/SparseArray;Landroid/util/SparseArray;Ljava/util/ArrayList;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/api/friends/FriendsGetRequests;

    .prologue
    .line 101
    iput-object p1, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests$1;->this$0:Lcom/vkontakte/android/api/friends/FriendsGetRequests;

    iput-object p2, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests$1;->val$users:Landroid/util/SparseArray;

    iput-object p3, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests$1;->val$fromNames:Landroid/util/SparseArray;

    iput-object p4, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests$1;->val$myFriends:Ljava/util/ArrayList;

    invoke-direct {p0}, Lcom/vkontakte/android/data/Parser;-><init>()V

    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/RequestUserProfile;
    .locals 13
    .param p1, "jreq"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    .line 104
    iget-object v7, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests$1;->val$users:Landroid/util/SparseArray;

    const-string/jumbo v8, "user_id"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/UserProfile;

    .line 105
    .local v3, "profile":Lcom/vkontakte/android/UserProfile;
    new-instance v4, Lcom/vkontakte/android/RequestUserProfile;

    invoke-direct {v4, v3}, Lcom/vkontakte/android/RequestUserProfile;-><init>(Lcom/vkontakte/android/UserProfile;)V

    .line 106
    .local v4, "req":Lcom/vkontakte/android/RequestUserProfile;
    iget-object v7, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests$1;->this$0:Lcom/vkontakte/android/api/friends/FriendsGetRequests;

    invoke-static {v7}, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->access$000(Lcom/vkontakte/android/api/friends/FriendsGetRequests;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 107
    sget-object v7, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f080245

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    iget-object v10, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests$1;->val$fromNames:Landroid/util/SparseArray;

    const-string/jumbo v11, "from"

    invoke-virtual {p1, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v10

    aput-object v10, v9, v12

    invoke-virtual {v7, v8, v9}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v4, Lcom/vkontakte/android/RequestUserProfile;->message:Ljava/lang/String;

    .line 111
    :goto_0
    iget-object v7, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests$1;->this$0:Lcom/vkontakte/android/api/friends/FriendsGetRequests;

    invoke-static {v7}, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->access$100(Lcom/vkontakte/android/api/friends/FriendsGetRequests;)Z

    move-result v7

    iput-boolean v7, v4, Lcom/vkontakte/android/RequestUserProfile;->isOutgoing:Z

    .line 112
    iget-object v7, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests$1;->this$0:Lcom/vkontakte/android/api/friends/FriendsGetRequests;

    invoke-static {v7}, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->access$000(Lcom/vkontakte/android/api/friends/FriendsGetRequests;)Z

    move-result v7

    iput-boolean v7, v4, Lcom/vkontakte/android/RequestUserProfile;->isSuggesting:Z

    .line 113
    iget-object v7, v4, Lcom/vkontakte/android/RequestUserProfile;->university:Ljava/lang/String;

    iput-object v7, v4, Lcom/vkontakte/android/RequestUserProfile;->info:Ljava/lang/String;

    .line 114
    const-string/jumbo v7, "mutual"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 115
    const/4 v7, 0x5

    const-string/jumbo v8, "mutual"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    const-string/jumbo v9, "users"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 116
    .local v1, "nMFriends":I
    new-array v7, v1, [Lcom/vkontakte/android/UserProfile;

    iput-object v7, v4, Lcom/vkontakte/android/RequestUserProfile;->mutualFriends:[Lcom/vkontakte/android/UserProfile;

    .line 117
    const-string/jumbo v7, "mutual"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string/jumbo v8, "count"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, v4, Lcom/vkontakte/android/RequestUserProfile;->numMutualFriends:I

    .line 118
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_1
    if-ge v0, v1, :cond_4

    .line 119
    const-string/jumbo v7, "mutual"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string/jumbo v8, "users"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    invoke-virtual {v7, v0}, Lorg/json/JSONArray;->getInt(I)I

    move-result v5

    .line 120
    .local v5, "uid":I
    new-instance v6, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v6}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 121
    .local v6, "up":Lcom/vkontakte/android/UserProfile;
    iget-object v7, p0, Lcom/vkontakte/android/api/friends/FriendsGetRequests$1;->val$myFriends:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    .line 122
    .local v2, "pp":Lcom/vkontakte/android/UserProfile;
    iget v8, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    if-ne v8, v5, :cond_0

    .line 123
    move-object v6, v2

    .line 127
    .end local v2    # "pp":Lcom/vkontakte/android/UserProfile;
    :cond_1
    iget-object v7, v4, Lcom/vkontakte/android/RequestUserProfile;->mutualFriends:[Lcom/vkontakte/android/UserProfile;

    aput-object v6, v7, v0

    .line 118
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 109
    .end local v0    # "j":I
    .end local v1    # "nMFriends":I
    .end local v5    # "uid":I
    .end local v6    # "up":Lcom/vkontakte/android/UserProfile;
    :cond_2
    const-string/jumbo v7, "message"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v4, Lcom/vkontakte/android/RequestUserProfile;->message:Ljava/lang/String;

    goto/16 :goto_0

    .line 130
    :cond_3
    iput v12, v4, Lcom/vkontakte/android/RequestUserProfile;->numMutualFriends:I

    .line 133
    :cond_4
    return-object v4
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 101
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/friends/FriendsGetRequests$1;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/RequestUserProfile;

    move-result-object v0

    return-object v0
.end method
