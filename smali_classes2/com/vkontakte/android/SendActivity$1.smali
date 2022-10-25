.class Lcom/vkontakte/android/SendActivity$1;
.super Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;
.source "SendActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/SendActivity;->copyFromRestrictedProvider()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/SendActivity;

.field final synthetic val$progress:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/SendActivity;Landroid/app/ProgressDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/SendActivity;

    .prologue
    .line 389
    iput-object p1, p0, Lcom/vkontakte/android/SendActivity$1;->this$0:Lcom/vkontakte/android/SendActivity;

    iput-object p2, p0, Lcom/vkontakte/android/SendActivity$1;->val$progress:Landroid/app/ProgressDialog;

    invoke-direct {p0}, Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Ljava/util/ArrayList;)V
    .locals 5
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "newUris":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    const/4 v1, 0x1

    const/4 v3, 0x0

    .line 405
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-le v4, v1, :cond_0

    .line 406
    .local v1, "multiple":Z
    :goto_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 407
    .local v0, "intent":Landroid/content/Intent;
    iget-object v4, p0, Lcom/vkontakte/android/SendActivity$1;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-virtual {v4}, Lcom/vkontakte/android/SendActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 408
    iget-object v4, p0, Lcom/vkontakte/android/SendActivity$1;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-virtual {v4}, Lcom/vkontakte/android/SendActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 409
    if-eqz v1, :cond_1

    .line 410
    const-string/jumbo v3, "android.intent.action.SEND_MULTIPLE"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 411
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 412
    .local v2, "pl":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/Parcelable;>;"
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 413
    const-string/jumbo v3, "android.intent.extra.STREAM"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 418
    .end local v2    # "pl":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/Parcelable;>;"
    :goto_1
    iget-object v3, p0, Lcom/vkontakte/android/SendActivity$1;->val$progress:Landroid/app/ProgressDialog;

    invoke-static {v3}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 419
    iget-object v3, p0, Lcom/vkontakte/android/SendActivity$1;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-virtual {v3, v0}, Lcom/vkontakte/android/SendActivity;->setIntent(Landroid/content/Intent;)V

    .line 420
    iget-object v3, p0, Lcom/vkontakte/android/SendActivity$1;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-static {v3}, Lcom/vkontakte/android/SendActivity;->access$000(Lcom/vkontakte/android/SendActivity;)V

    .line 421
    return-void

    .end local v0    # "intent":Landroid/content/Intent;
    .end local v1    # "multiple":Z
    :cond_0
    move v1, v3

    .line 405
    goto :goto_0

    .line 415
    .restart local v0    # "intent":Landroid/content/Intent;
    .restart local v1    # "multiple":Z
    :cond_1
    const-string/jumbo v4, "android.intent.action.SEND"

    invoke-virtual {v0, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 416
    const-string/jumbo v4, "android.intent.extra.STREAM"

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Parcelable;

    invoke-virtual {v0, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    goto :goto_1
.end method

.method public onError(Ljava/lang/Exception;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Exception;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 398
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$1;->this$0:Lcom/vkontakte/android/SendActivity;

    const v1, 0x7f0801f9

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 399
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$1;->val$progress:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 400
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$1;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/SendActivity;->finish()V

    .line 401
    return-void
.end method

.method public onStart()V
    .locals 3

    .prologue
    .line 392
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$1;->val$progress:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$1;->this$0:Lcom/vkontakte/android/SendActivity;

    const v2, 0x7f08033d

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 393
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$1;->val$progress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 394
    return-void
.end method
