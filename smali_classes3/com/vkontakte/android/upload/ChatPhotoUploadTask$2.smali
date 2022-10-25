.class Lcom/vkontakte/android/upload/ChatPhotoUploadTask$2;
.super Ljava/lang/Object;
.source "ChatPhotoUploadTask.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/upload/ChatPhotoUploadTask;->afterUpload()V
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
.field final synthetic this$0:Lcom/vkontakte/android/upload/ChatPhotoUploadTask;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/upload/ChatPhotoUploadTask;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/upload/ChatPhotoUploadTask;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask$2;->this$0:Lcom/vkontakte/android/upload/ChatPhotoUploadTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 108
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 88
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/upload/ChatPhotoUploadTask$2;->success(Lorg/json/JSONObject;)V

    return-void
.end method

.method public success(Lorg/json/JSONObject;)V
    .locals 7
    .param p1, "r"    # Lorg/json/JSONObject;

    .prologue
    .line 91
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

    .line 92
    .local v2, "photo":Ljava/lang/String;
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    .line 93
    .local v0, "account":Lcom/vkontakte/android/auth/VKAccount;
    iget-object v4, p0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask$2;->this$0:Lcom/vkontakte/android/upload/ChatPhotoUploadTask;

    invoke-static {v4}, Lcom/vkontakte/android/upload/ChatPhotoUploadTask;->access$000(Lcom/vkontakte/android/upload/ChatPhotoUploadTask;)I

    move-result v4

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    if-ne v4, v5, :cond_0

    .line 94
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->editCurrent()Lcom/vkontakte/android/auth/VKAccountEditor;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/vkontakte/android/auth/VKAccountEditor;->setPhoto(Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAccountEditor;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccountEditor;->commit()V

    .line 96
    :cond_0
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v4, "com.vkontakte.android.USER_PHOTO_CHANGED"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 97
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v4, "photo"

    invoke-virtual {v1, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 98
    const-string/jumbo v4, "id"

    iget-object v5, p0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask$2;->this$0:Lcom/vkontakte/android/upload/ChatPhotoUploadTask;

    invoke-static {v5}, Lcom/vkontakte/android/upload/ChatPhotoUploadTask;->access$000(Lcom/vkontakte/android/upload/ChatPhotoUploadTask;)I

    move-result v5

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 99
    iget-object v4, p0, Lcom/vkontakte/android/upload/ChatPhotoUploadTask$2;->this$0:Lcom/vkontakte/android/upload/ChatPhotoUploadTask;

    iget-object v4, v4, Lcom/vkontakte/android/upload/ChatPhotoUploadTask;->context:Landroid/content/Context;

    const-string/jumbo v5, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v4, v1, v5}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 103
    .end local v0    # "account":Lcom/vkontakte/android/auth/VKAccount;
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "photo":Ljava/lang/String;
    :goto_1
    return-void

    .line 91
    :cond_1
    const-string/jumbo v4, "photo_50"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 100
    :catch_0
    move-exception v3

    .line 101
    .local v3, "x":Ljava/lang/Exception;
    const-string/jumbo v4, "vk"

    invoke-static {v4, v3}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method
