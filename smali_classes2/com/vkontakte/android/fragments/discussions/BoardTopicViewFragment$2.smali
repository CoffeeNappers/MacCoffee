.class Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$2;
.super Ljava/lang/Object;
.source "BoardTopicViewFragment.java"

# interfaces
.implements Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->sendPendingAttachmentComment(Lcom/vkontakte/android/attachments/PendingAttachment;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

.field final synthetic val$progress:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;Landroid/app/ProgressDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    .prologue
    .line 380
    iput-object p1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$2;->val$progress:Landroid/app/ProgressDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDone(ILcom/vkontakte/android/attachments/Attachment;)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "attachment"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    .line 387
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$2;->val$progress:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 388
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$2;->val$progress:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 389
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    invoke-static {v0, p2}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->access$200(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;Lcom/vkontakte/android/attachments/Attachment;)V

    .line 390
    return-void
.end method

.method public onFailed(ILcom/vkontakte/android/attachments/Attachment;)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "attachment"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    .line 394
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$2;->val$progress:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 395
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$2;->val$progress:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 396
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0801f9

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 397
    return-void
.end method

.method public onProgress(III)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "done"    # I
    .param p3, "total"    # I

    .prologue
    .line 383
    return-void
.end method
