.class Lcom/vkontakte/android/ui/AttachmentsEditorView$9;
.super Ljava/lang/Object;
.source "AttachmentsEditorView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/AttachmentsEditorView;->uploadAttachment(Lcom/vkontakte/android/attachments/PendingAttachment;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

.field final synthetic val$attachment:Lcom/vkontakte/android/attachments/PendingAttachment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/AttachmentsEditorView;Lcom/vkontakte/android/attachments/PendingAttachment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/AttachmentsEditorView;

    .prologue
    .line 696
    iput-object p1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$9;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    iput-object p2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$9;->val$attachment:Lcom/vkontakte/android/attachments/PendingAttachment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 699
    iget-object v2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$9;->val$attachment:Lcom/vkontakte/android/attachments/PendingAttachment;

    instance-of v2, v2, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    if-eqz v2, :cond_0

    .line 700
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$9;->val$attachment:Lcom/vkontakte/android/attachments/PendingAttachment;

    check-cast v1, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    .line 701
    .local v1, "photoAttachment":Lcom/vkontakte/android/attachments/PendingPhotoAttachment;
    iget-object v2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$9;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    iget-boolean v2, v2, Lcom/vkontakte/android/ui/AttachmentsEditorView;->isWallPhoto:Z

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->setWallPhoto(Z)V

    .line 702
    iget-object v2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$9;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    iget v2, v2, Lcom/vkontakte/android/ui/AttachmentsEditorView;->uploadOwnerId:I

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->setOwnerId(I)V

    .line 704
    .end local v1    # "photoAttachment":Lcom/vkontakte/android/attachments/PendingPhotoAttachment;
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$9;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 705
    .local v0, "context":Landroid/content/Context;
    iget-object v2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$9;->val$attachment:Lcom/vkontakte/android/attachments/PendingAttachment;

    invoke-interface {v2, v0}, Lcom/vkontakte/android/attachments/PendingAttachment;->createUploadTask(Landroid/content/Context;)Lcom/vkontakte/android/upload/UploadTask;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/vkontakte/android/upload/Upload;->start(Landroid/content/Context;Lcom/vkontakte/android/upload/UploadTask;)V

    .line 706
    return-void
.end method
