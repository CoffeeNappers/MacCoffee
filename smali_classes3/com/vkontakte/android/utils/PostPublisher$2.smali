.class Lcom/vkontakte/android/utils/PostPublisher$2;
.super Ljava/lang/Object;
.source "PostPublisher.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/utils/PostPublisher;->publishPostInner(Landroid/content/Context;Ljava/lang/CharSequence;[Lcom/vkontakte/android/attachments/Attachment;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
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
.field final synthetic this$0:Lcom/vkontakte/android/utils/PostPublisher;

.field final synthetic val$ctx:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/utils/PostPublisher;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/utils/PostPublisher;

    .prologue
    .line 170
    iput-object p1, p0, Lcom/vkontakte/android/utils/PostPublisher$2;->this$0:Lcom/vkontakte/android/utils/PostPublisher;

    iput-object p2, p0, Lcom/vkontakte/android/utils/PostPublisher$2;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 197
    iget-object v0, p0, Lcom/vkontakte/android/utils/PostPublisher$2;->this$0:Lcom/vkontakte/android/utils/PostPublisher;

    invoke-static {v0, p1}, Lcom/vkontakte/android/utils/PostPublisher;->access$100(Lcom/vkontakte/android/utils/PostPublisher;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 198
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 170
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/utils/PostPublisher$2;->success(Lorg/json/JSONObject;)V

    return-void
.end method

.method public success(Lorg/json/JSONObject;)V
    .locals 9
    .param p1, "result"    # Lorg/json/JSONObject;

    .prologue
    .line 174
    :try_start_0
    new-instance v3, Landroid/util/SparseArray;

    invoke-direct {v3}, Landroid/util/SparseArray;-><init>()V

    .local v3, "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V

    .line 175
    .local v4, "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    .line 176
    .local v0, "account":Lcom/vkontakte/android/auth/VKAccount;
    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v6

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 177
    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v6

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getPhoto()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 178
    new-instance v1, Lcom/vkontakte/android/NewsEntry;

    const-string/jumbo v6, "response"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    const/4 v7, 0x0

    invoke-direct {v1, v6, v7, v3, v4}, Lcom/vkontakte/android/NewsEntry;-><init>(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;)V

    .line 179
    .local v1, "e":Lcom/vkontakte/android/NewsEntry;
    const v6, 0x7f080783

    invoke-static {v6}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 180
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v6, "com.vkontakte.android.NEW_POST_ADDED"

    invoke-direct {v2, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 181
    .local v2, "intent":Landroid/content/Intent;
    const-string/jumbo v6, "entry"

    invoke-virtual {v2, v6, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 182
    iget-object v6, p0, Lcom/vkontakte/android/utils/PostPublisher$2;->val$ctx:Landroid/content/Context;

    const-string/jumbo v7, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v6, v2, v7}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 183
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->hasEntries()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 184
    invoke-static {v1}, Lcom/vkontakte/android/cache/NewsfeedCache;->addToTop(Lcom/vkontakte/android/NewsEntry;)V

    .line 186
    :cond_0
    iget-object v6, p0, Lcom/vkontakte/android/utils/PostPublisher$2;->this$0:Lcom/vkontakte/android/utils/PostPublisher;

    invoke-static {v6}, Lcom/vkontakte/android/utils/PostPublisher;->access$200(Lcom/vkontakte/android/utils/PostPublisher;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 191
    iget-object v6, p0, Lcom/vkontakte/android/utils/PostPublisher$2;->this$0:Lcom/vkontakte/android/utils/PostPublisher;

    invoke-static {v6}, Lcom/vkontakte/android/utils/PostPublisher;->access$300(Lcom/vkontakte/android/utils/PostPublisher;)V

    .line 193
    .end local v0    # "account":Lcom/vkontakte/android/auth/VKAccount;
    .end local v1    # "e":Lcom/vkontakte/android/NewsEntry;
    .end local v2    # "intent":Landroid/content/Intent;
    .end local v3    # "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .end local v4    # "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    :goto_0
    return-void

    .line 187
    :catch_0
    move-exception v5

    .line 188
    .local v5, "x":Lorg/json/JSONException;
    :try_start_1
    const-string/jumbo v6, "vk"

    invoke-static {v6, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 189
    new-instance v6, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    const/4 v7, -0x2

    invoke-virtual {v5}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, v6}, Lcom/vkontakte/android/utils/PostPublisher$2;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 191
    iget-object v6, p0, Lcom/vkontakte/android/utils/PostPublisher$2;->this$0:Lcom/vkontakte/android/utils/PostPublisher;

    invoke-static {v6}, Lcom/vkontakte/android/utils/PostPublisher;->access$300(Lcom/vkontakte/android/utils/PostPublisher;)V

    goto :goto_0

    .end local v5    # "x":Lorg/json/JSONException;
    :catchall_0
    move-exception v6

    iget-object v7, p0, Lcom/vkontakte/android/utils/PostPublisher$2;->this$0:Lcom/vkontakte/android/utils/PostPublisher;

    invoke-static {v7}, Lcom/vkontakte/android/utils/PostPublisher;->access$300(Lcom/vkontakte/android/utils/PostPublisher;)V

    throw v6
.end method
