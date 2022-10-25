.class Lcom/vkontakte/android/upload/WallPhotoUploadTask$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "WallPhotoUploadTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/upload/WallPhotoUploadTask;->save()V
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
.field final synthetic this$0:Lcom/vkontakte/android/upload/WallPhotoUploadTask;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/upload/WallPhotoUploadTask;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/upload/WallPhotoUploadTask;

    .prologue
    .line 74
    iput-object p1, p0, Lcom/vkontakte/android/upload/WallPhotoUploadTask$2;->this$0:Lcom/vkontakte/android/upload/WallPhotoUploadTask;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/attachments/PhotoAttachment;)V
    .locals 1
    .param p1, "photo"    # Lcom/vkontakte/android/attachments/PhotoAttachment;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/vkontakte/android/upload/WallPhotoUploadTask$2;->this$0:Lcom/vkontakte/android/upload/WallPhotoUploadTask;

    invoke-static {v0, p1}, Lcom/vkontakte/android/upload/WallPhotoUploadTask;->access$002(Lcom/vkontakte/android/upload/WallPhotoUploadTask;Lcom/vkontakte/android/attachments/PhotoAttachment;)Lcom/vkontakte/android/attachments/PhotoAttachment;

    .line 78
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 74
    check-cast p1, Lcom/vkontakte/android/attachments/PhotoAttachment;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/upload/WallPhotoUploadTask$2;->success(Lcom/vkontakte/android/attachments/PhotoAttachment;)V

    return-void
.end method
