.class Lcom/vkontakte/android/fragments/news/PollEditorFragment$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "PollEditorFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/news/PollEditorFragment;->onDone()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/attachments/PollAttachment;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/news/PollEditorFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/news/PollEditorFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/news/PollEditorFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 353
    iput-object p1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment$2;->this$0:Lcom/vkontakte/android/fragments/news/PollEditorFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/attachments/PollAttachment;)V
    .locals 3
    .param p1, "poll"    # Lcom/vkontakte/android/attachments/PollAttachment;

    .prologue
    .line 356
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 357
    .local v0, "result":Landroid/content/Intent;
    const-string/jumbo v1, "poll"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 358
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment$2;->this$0:Lcom/vkontakte/android/fragments/news/PollEditorFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 359
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment$2;->this$0:Lcom/vkontakte/android/fragments/news/PollEditorFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 360
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 353
    check-cast p1, Lcom/vkontakte/android/attachments/PollAttachment;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/news/PollEditorFragment$2;->success(Lcom/vkontakte/android/attachments/PollAttachment;)V

    return-void
.end method
