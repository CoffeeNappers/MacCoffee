.class Lcom/vkontakte/android/upload/VideoUploadTask$1;
.super Ljava/lang/Object;
.source "VideoUploadTask.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/upload/VideoUploadTask;->getServer()V
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
        "Lcom/vkontakte/android/api/video/VideoSave$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/upload/VideoUploadTask;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/upload/VideoUploadTask;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/upload/VideoUploadTask;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/vkontakte/android/upload/VideoUploadTask$1;->this$0:Lcom/vkontakte/android/upload/VideoUploadTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 104
    const-string/jumbo v0, "vk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Error getting upload server "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/video/VideoSave$Result;)V
    .locals 2
    .param p1, "r"    # Lcom/vkontakte/android/api/video/VideoSave$Result;

    .prologue
    .line 97
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask$1;->this$0:Lcom/vkontakte/android/upload/VideoUploadTask;

    iget-object v1, p1, Lcom/vkontakte/android/api/video/VideoSave$Result;->uploadUrl:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/upload/VideoUploadTask;->server:Ljava/lang/String;

    .line 98
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask$1;->this$0:Lcom/vkontakte/android/upload/VideoUploadTask;

    iget v1, p1, Lcom/vkontakte/android/api/video/VideoSave$Result;->id:I

    invoke-static {v0, v1}, Lcom/vkontakte/android/upload/VideoUploadTask;->access$002(Lcom/vkontakte/android/upload/VideoUploadTask;I)I

    .line 99
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask$1;->this$0:Lcom/vkontakte/android/upload/VideoUploadTask;

    iget-object v1, p1, Lcom/vkontakte/android/api/video/VideoSave$Result;->accessKey:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vkontakte/android/upload/VideoUploadTask;->access$102(Lcom/vkontakte/android/upload/VideoUploadTask;Ljava/lang/String;)Ljava/lang/String;

    .line 100
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 94
    check-cast p1, Lcom/vkontakte/android/api/video/VideoSave$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/upload/VideoUploadTask$1;->success(Lcom/vkontakte/android/api/video/VideoSave$Result;)V

    return-void
.end method
