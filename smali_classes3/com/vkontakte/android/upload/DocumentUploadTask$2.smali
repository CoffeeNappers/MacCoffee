.class Lcom/vkontakte/android/upload/DocumentUploadTask$2;
.super Ljava/lang/Object;
.source "DocumentUploadTask.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/upload/DocumentUploadTask;->save()V
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
.field final synthetic this$0:Lcom/vkontakte/android/upload/DocumentUploadTask;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/upload/DocumentUploadTask;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/upload/DocumentUploadTask;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/vkontakte/android/upload/DocumentUploadTask$2;->this$0:Lcom/vkontakte/android/upload/DocumentUploadTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 97
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/Document;)V
    .locals 1
    .param p1, "doc"    # Lcom/vkontakte/android/api/Document;

    .prologue
    .line 91
    iget-object v0, p0, Lcom/vkontakte/android/upload/DocumentUploadTask$2;->this$0:Lcom/vkontakte/android/upload/DocumentUploadTask;

    iput-object p1, v0, Lcom/vkontakte/android/upload/DocumentUploadTask;->result:Lcom/vkontakte/android/api/Document;

    .line 92
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 88
    check-cast p1, Lcom/vkontakte/android/api/Document;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/upload/DocumentUploadTask$2;->success(Lcom/vkontakte/android/api/Document;)V

    return-void
.end method
