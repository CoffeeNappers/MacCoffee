.class Lcom/vkontakte/android/fragments/PostViewFragment$28;
.super Ljava/lang/Object;
.source "PostViewFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


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

.field final synthetic val$task:Lcom/vkontakte/android/upload/UploadTask;

.field final synthetic val$uploadListener:Lcom/vkontakte/android/upload/UploadListener;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/upload/UploadTask;Lcom/vkontakte/android/upload/UploadListener;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 1529
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$28;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$28;->val$task:Lcom/vkontakte/android/upload/UploadTask;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/PostViewFragment$28;->val$uploadListener:Lcom/vkontakte/android/upload/UploadListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 1532
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$28;->val$task:Lcom/vkontakte/android/upload/UploadTask;

    invoke-virtual {v0}, Lcom/vkontakte/android/upload/UploadTask;->getID()I

    move-result v0

    invoke-static {v0}, Lcom/vkontakte/android/upload/Upload;->cancel(I)V

    .line 1533
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$28;->val$uploadListener:Lcom/vkontakte/android/upload/UploadListener;

    invoke-virtual {v0}, Lcom/vkontakte/android/upload/UploadListener;->stopListener()V

    .line 1534
    return-void
.end method
