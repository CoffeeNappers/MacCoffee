.class Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$2;
.super Ljava/lang/Object;
.source "ProfilePhotoUploadTask.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->afterUpload()V
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
.field final synthetic this$0:Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    .prologue
    .line 156
    iput-object p1, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$2;->this$0:Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 176
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 156
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$2;->success(Lorg/json/JSONObject;)V

    return-void
.end method

.method public success(Lorg/json/JSONObject;)V
    .locals 7
    .param p1, "r"    # Lorg/json/JSONObject;

    .prologue
    .line 159
    :try_start_0
    const-string/jumbo v4, "response"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    sget v4, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v6, 0x3f800000    # 1.0f

    cmpl-float v4, v4, v6

    if-lez v4, :cond_1

    const-string/jumbo v4, "photo_100"

    :goto_0
    invoke-virtual {v5, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 160
    .local v2, "photo":Ljava/lang/String;
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    .line 161
    .local v0, "account":Lcom/vkontakte/android/auth/VKAccount;
    iget-object v4, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$2;->this$0:Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    invoke-static {v4}, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->access$400(Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;)I

    move-result v4

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    if-ne v4, v5, :cond_0

    .line 162
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->editCurrent()Lcom/vkontakte/android/auth/VKAccountEditor;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/vkontakte/android/auth/VKAccountEditor;->setPhoto(Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAccountEditor;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccountEditor;->commit()V

    .line 164
    :cond_0
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v4, "com.vkontakte.android.USER_PHOTO_CHANGED"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 165
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v4, "photo"

    invoke-virtual {v1, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 166
    const-string/jumbo v4, "id"

    iget-object v5, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$2;->this$0:Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    invoke-static {v5}, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->access$400(Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;)I

    move-result v5

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 167
    iget-object v4, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$2;->this$0:Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    iget-object v4, v4, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->context:Landroid/content/Context;

    const-string/jumbo v5, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v4, v1, v5}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 171
    .end local v0    # "account":Lcom/vkontakte/android/auth/VKAccount;
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "photo":Ljava/lang/String;
    :goto_1
    return-void

    .line 159
    :cond_1
    const-string/jumbo v4, "photo_50"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 168
    :catch_0
    move-exception v3

    .line 169
    .local v3, "x":Ljava/lang/Exception;
    const-string/jumbo v4, "vk"

    invoke-static {v4, v3}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method
