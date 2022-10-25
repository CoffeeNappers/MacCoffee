.class Lcom/vk/sharing/SharingService$RepostWallJobHandler$1;
.super Ljava/lang/Object;
.source "SharingService.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/sharing/SharingService$RepostWallJobHandler;->doWallPostSync(ILcom/vk/sharing/attachment/AttachmentInfo;Ljava/lang/String;Ljava/lang/String;)Z
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
.field final synthetic this$0:Lcom/vk/sharing/SharingService$RepostWallJobHandler;


# direct methods
.method constructor <init>(Lcom/vk/sharing/SharingService$RepostWallJobHandler;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/sharing/SharingService$RepostWallJobHandler;

    .prologue
    .line 318
    iput-object p1, p0, Lcom/vk/sharing/SharingService$RepostWallJobHandler$1;->this$0:Lcom/vk/sharing/SharingService$RepostWallJobHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 326
    const-string/jumbo v0, "vk"

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 327
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 318
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/vk/sharing/SharingService$RepostWallJobHandler$1;->success(Lorg/json/JSONObject;)V

    return-void
.end method

.method public success(Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "result"    # Lorg/json/JSONObject;

    .prologue
    .line 322
    return-void
.end method
