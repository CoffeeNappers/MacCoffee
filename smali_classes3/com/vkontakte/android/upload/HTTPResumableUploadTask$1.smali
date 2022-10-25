.class Lcom/vkontakte/android/upload/HTTPResumableUploadTask$1;
.super Ljava/lang/Object;
.source "HTTPResumableUploadTask.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->cancel()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/upload/HTTPResumableUploadTask;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/upload/HTTPResumableUploadTask;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/upload/HTTPResumableUploadTask;

    .prologue
    .line 347
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask$1;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask$1;"
    iput-object p1, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$1;->this$0:Lcom/vkontakte/android/upload/HTTPResumableUploadTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 350
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPResumableUploadTask$1;, "Lcom/vkontakte/android/upload/HTTPResumableUploadTask$1;"
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$1;->this$0:Lcom/vkontakte/android/upload/HTTPResumableUploadTask;

    invoke-static {v0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->access$200(Lcom/vkontakte/android/upload/HTTPResumableUploadTask;)Lokhttp3/Call;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 351
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$1;->this$0:Lcom/vkontakte/android/upload/HTTPResumableUploadTask;

    invoke-static {v0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->access$200(Lcom/vkontakte/android/upload/HTTPResumableUploadTask;)Lokhttp3/Call;

    move-result-object v0

    invoke-interface {v0}, Lokhttp3/Call;->cancel()V

    .line 352
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$1;->this$0:Lcom/vkontakte/android/upload/HTTPResumableUploadTask;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->access$202(Lcom/vkontakte/android/upload/HTTPResumableUploadTask;Lokhttp3/Call;)Lokhttp3/Call;

    .line 353
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPResumableUploadTask$1;->this$0:Lcom/vkontakte/android/upload/HTTPResumableUploadTask;

    invoke-static {v0}, Lcom/vkontakte/android/upload/HTTPResumableUploadTask;->access$300(Lcom/vkontakte/android/upload/HTTPResumableUploadTask;)V

    .line 355
    :cond_0
    return-void
.end method
