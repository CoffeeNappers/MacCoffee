.class Lcom/vkontakte/android/fragments/PostViewFragment$27;
.super Ljava/lang/Object;
.source "PostViewFragment.java"

# interfaces
.implements Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostViewFragment;->sendPendingAttachmentComment(Lcom/vkontakte/android/attachments/PendingAttachment;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

.field final synthetic val$progress:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;Landroid/app/ProgressDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 1508
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$27;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$27;->val$progress:Landroid/app/ProgressDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDone(ILcom/vkontakte/android/attachments/Attachment;)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "attachment"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    .line 1515
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$27;->val$progress:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 1516
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$27;->val$progress:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 1517
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$27;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0, p2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1600(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/attachments/Attachment;)V

    .line 1518
    return-void
.end method

.method public onFailed(ILcom/vkontakte/android/attachments/Attachment;)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "attachment"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    .line 1522
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$27;->val$progress:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 1523
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$27;->val$progress:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 1524
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$27;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0801f9

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1525
    return-void
.end method

.method public onProgress(III)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "done"    # I
    .param p3, "total"    # I

    .prologue
    .line 1511
    return-void
.end method
