.class Lcom/vkontakte/android/upload/VideoUploadTask$2;
.super Ljava/lang/Object;
.source "VideoUploadTask.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/upload/VideoUploadTask;->save()V
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
        "Lcom/vkontakte/android/api/VideoFile;",
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
    .line 128
    iput-object p1, p0, Lcom/vkontakte/android/upload/VideoUploadTask$2;->this$0:Lcom/vkontakte/android/upload/VideoUploadTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 144
    const-string/jumbo v0, "vk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Error getting video "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 2
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 131
    iget-object v0, p1, Lcom/vkontakte/android/api/VideoFile;->url240:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p1, Lcom/vkontakte/android/api/VideoFile;->url240:Ljava/lang/String;

    const-string/jumbo v1, ".vk.flv"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 132
    const/4 v0, 0x0

    iput-object v0, p1, Lcom/vkontakte/android/api/VideoFile;->url240:Ljava/lang/String;

    .line 134
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask$2;->this$0:Lcom/vkontakte/android/upload/VideoUploadTask;

    invoke-static {v0, p1}, Lcom/vkontakte/android/upload/VideoUploadTask;->access$202(Lcom/vkontakte/android/upload/VideoUploadTask;Lcom/vkontakte/android/api/VideoFile;)Lcom/vkontakte/android/api/VideoFile;

    .line 135
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask$2;->this$0:Lcom/vkontakte/android/upload/VideoUploadTask;

    invoke-static {v0}, Lcom/vkontakte/android/upload/VideoUploadTask;->access$200(Lcom/vkontakte/android/upload/VideoUploadTask;)Lcom/vkontakte/android/api/VideoFile;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/upload/VideoUploadTask$2;->this$0:Lcom/vkontakte/android/upload/VideoUploadTask;

    invoke-static {v1}, Lcom/vkontakte/android/upload/VideoUploadTask;->access$100(Lcom/vkontakte/android/upload/VideoUploadTask;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/api/VideoFile;->accessKey:Ljava/lang/String;

    .line 136
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask$2;->this$0:Lcom/vkontakte/android/upload/VideoUploadTask;

    invoke-static {v0}, Lcom/vkontakte/android/upload/VideoUploadTask;->access$200(Lcom/vkontakte/android/upload/VideoUploadTask;)Lcom/vkontakte/android/api/VideoFile;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask$2;->this$0:Lcom/vkontakte/android/upload/VideoUploadTask;

    invoke-static {v0}, Lcom/vkontakte/android/upload/VideoUploadTask;->access$300(Lcom/vkontakte/android/upload/VideoUploadTask;)Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, v1, Lcom/vkontakte/android/api/VideoFile;->canAdd:Z

    .line 137
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask$2;->this$0:Lcom/vkontakte/android/upload/VideoUploadTask;

    invoke-static {v0}, Lcom/vkontakte/android/upload/VideoUploadTask;->access$400(Lcom/vkontakte/android/upload/VideoUploadTask;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 138
    iget-object v0, p0, Lcom/vkontakte/android/upload/VideoUploadTask$2;->this$0:Lcom/vkontakte/android/upload/VideoUploadTask;

    invoke-static {v0}, Lcom/vkontakte/android/upload/VideoUploadTask;->access$200(Lcom/vkontakte/android/upload/VideoUploadTask;)Lcom/vkontakte/android/api/VideoFile;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/upload/VideoUploadTask$2;->this$0:Lcom/vkontakte/android/upload/VideoUploadTask;

    invoke-static {v1}, Lcom/vkontakte/android/upload/VideoUploadTask;->access$400(Lcom/vkontakte/android/upload/VideoUploadTask;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/api/VideoFile;->url240:Ljava/lang/String;

    .line 140
    :cond_1
    return-void

    .line 136
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 128
    check-cast p1, Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/upload/VideoUploadTask$2;->success(Lcom/vkontakte/android/api/VideoFile;)V

    return-void
.end method
