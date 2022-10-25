.class Lcom/vkontakte/android/upload/MessagesPhotoUploadTask$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "MessagesPhotoUploadTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;->save()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/attachments/PhotoAttachment;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask$2;->this$0:Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/attachments/PhotoAttachment;)V
    .locals 1
    .param p1, "photo"    # Lcom/vkontakte/android/attachments/PhotoAttachment;

    .prologue
    .line 78
    iget-object v0, p0, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask$2;->this$0:Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;

    invoke-static {v0, p1}, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;->access$002(Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;Lcom/vkontakte/android/attachments/PhotoAttachment;)Lcom/vkontakte/android/attachments/PhotoAttachment;

    .line 79
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 75
    check-cast p1, Lcom/vkontakte/android/attachments/PhotoAttachment;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask$2;->success(Lcom/vkontakte/android/attachments/PhotoAttachment;)V

    return-void
.end method
