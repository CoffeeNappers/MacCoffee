.class Lcom/vkontakte/android/upload/GraffitiUploadTask$2;
.super Ljava/lang/Object;
.source "GraffitiUploadTask.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/upload/GraffitiUploadTask;->save()V
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
        "Lcom/vkontakte/android/api/Document;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/upload/GraffitiUploadTask;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/upload/GraffitiUploadTask;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/upload/GraffitiUploadTask;

    .prologue
    .line 93
    iput-object p1, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask$2;->this$0:Lcom/vkontakte/android/upload/GraffitiUploadTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 102
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/Document;)V
    .locals 1
    .param p1, "doc"    # Lcom/vkontakte/android/api/Document;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/vkontakte/android/upload/GraffitiUploadTask$2;->this$0:Lcom/vkontakte/android/upload/GraffitiUploadTask;

    invoke-static {v0, p1}, Lcom/vkontakte/android/upload/GraffitiUploadTask;->access$002(Lcom/vkontakte/android/upload/GraffitiUploadTask;Lcom/vkontakte/android/api/Document;)Lcom/vkontakte/android/api/Document;

    .line 97
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 93
    check-cast p1, Lcom/vkontakte/android/api/Document;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/upload/GraffitiUploadTask$2;->success(Lcom/vkontakte/android/api/Document;)V

    return-void
.end method
