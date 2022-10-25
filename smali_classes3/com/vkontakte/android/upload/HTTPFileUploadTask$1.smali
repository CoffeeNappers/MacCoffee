.class Lcom/vkontakte/android/upload/HTTPFileUploadTask$1;
.super Ljava/lang/Object;
.source "HTTPFileUploadTask.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/upload/HTTPFileUploadTask;->cancel()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/upload/HTTPFileUploadTask;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/upload/HTTPFileUploadTask;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/upload/HTTPFileUploadTask;

    .prologue
    .line 213
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPFileUploadTask$1;, "Lcom/vkontakte/android/upload/HTTPFileUploadTask$1;"
    iput-object p1, p0, Lcom/vkontakte/android/upload/HTTPFileUploadTask$1;->this$0:Lcom/vkontakte/android/upload/HTTPFileUploadTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 216
    .local p0, "this":Lcom/vkontakte/android/upload/HTTPFileUploadTask$1;, "Lcom/vkontakte/android/upload/HTTPFileUploadTask$1;"
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPFileUploadTask$1;->this$0:Lcom/vkontakte/android/upload/HTTPFileUploadTask;

    iget-object v0, v0, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->currentRequest:Lokhttp3/Call;

    if-eqz v0, :cond_0

    .line 217
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPFileUploadTask$1;->this$0:Lcom/vkontakte/android/upload/HTTPFileUploadTask;

    iget-object v0, v0, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->currentRequest:Lokhttp3/Call;

    invoke-interface {v0}, Lokhttp3/Call;->cancel()V

    .line 218
    iget-object v0, p0, Lcom/vkontakte/android/upload/HTTPFileUploadTask$1;->this$0:Lcom/vkontakte/android/upload/HTTPFileUploadTask;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vkontakte/android/upload/HTTPFileUploadTask;->currentRequest:Lokhttp3/Call;

    .line 220
    :cond_0
    return-void
.end method
