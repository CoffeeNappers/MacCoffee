.class final Lcom/vkontakte/android/ContactsSyncAdapterService$1;
.super Ljava/lang/Object;
.source "ContactsSyncAdapterService.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ContactsSyncAdapterService;->performSync(Landroid/content/Context;Landroid/accounts/Account;Landroid/os/Bundle;Ljava/lang/String;Landroid/content/ContentProviderClient;Landroid/content/SyncResult;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$contacts:Ljava/util/Vector;

.field final synthetic val$syncAllFriends:Z

.field final synthetic val$syncResult:Landroid/content/SyncResult;


# direct methods
.method constructor <init>(Ljava/util/Vector;ZLandroid/content/SyncResult;)V
    .locals 0

    .prologue
    .line 205
    iput-object p1, p0, Lcom/vkontakte/android/ContactsSyncAdapterService$1;->val$contacts:Ljava/util/Vector;

    iput-boolean p2, p0, Lcom/vkontakte/android/ContactsSyncAdapterService$1;->val$syncAllFriends:Z

    iput-object p3, p0, Lcom/vkontakte/android/ContactsSyncAdapterService$1;->val$syncResult:Landroid/content/SyncResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 220
    const-string/jumbo v0, "vk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Sync error "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    iget-boolean v0, p0, Lcom/vkontakte/android/ContactsSyncAdapterService$1;->val$syncAllFriends:Z

    if-nez v0, :cond_0

    .line 222
    iget-object v0, p0, Lcom/vkontakte/android/ContactsSyncAdapterService$1;->val$syncResult:Landroid/content/SyncResult;

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/content/SyncResult;->databaseError:Z

    .line 224
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 205
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ContactsSyncAdapterService$1;->success(Lorg/json/JSONObject;)V

    return-void
.end method

.method public success(Lorg/json/JSONObject;)V
    .locals 6
    .param p1, "r"    # Lorg/json/JSONObject;

    .prologue
    .line 209
    :try_start_0
    const-string/jumbo v4, "response"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 210
    .local v0, "a":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v1, v4, :cond_0

    .line 211
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 212
    .local v2, "user":Lorg/json/JSONObject;
    iget-object v4, p0, Lcom/vkontakte/android/ContactsSyncAdapterService$1;->val$contacts:Ljava/util/Vector;

    invoke-static {v2}, Lcom/vkontakte/android/ContactsSyncAdapterService;->access$200(Lorg/json/JSONObject;)Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 210
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 214
    .end local v0    # "a":Lorg/json/JSONArray;
    .end local v1    # "i":I
    .end local v2    # "user":Lorg/json/JSONObject;
    :catch_0
    move-exception v3

    .line 215
    .local v3, "x":Ljava/lang/Exception;
    const-string/jumbo v4, "vk"

    invoke-static {v4, v3}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 217
    .end local v3    # "x":Ljava/lang/Exception;
    :cond_0
    return-void
.end method
