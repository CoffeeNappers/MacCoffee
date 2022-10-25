.class Lcom/vkontakte/android/fragments/HtmlGameFragment$8;
.super Ljava/lang/Object;
.source "HtmlGameFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/HtmlGameFragment;->processShowOrderBox(Ljava/lang/String;IIZLjava/lang/String;)V
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
        "Lcom/vkontakte/android/api/Order;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

.field final synthetic val$progress:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/HtmlGameFragment;Landroid/app/ProgressDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;

    .prologue
    .line 744
    iput-object p1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$8;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$8;->val$progress:Landroid/app/ProgressDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 759
    invoke-static {}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "processShowOrderBox failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 760
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$8;->val$progress:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 761
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$8;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    const-string/jumbo v1, "fail"

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$1600(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;)V

    .line 762
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/Order;)V
    .locals 4
    .param p1, "result"    # Lcom/vkontakte/android/api/Order;

    .prologue
    .line 748
    iget-object v2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$8;->val$progress:Landroid/app/ProgressDialog;

    invoke-static {v2}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 750
    iget-object v2, p1, Lcom/vkontakte/android/api/Order;->status:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p1, Lcom/vkontakte/android/api/Order;->status:Ljava/lang/String;

    const-string/jumbo v3, "charged"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    .line 752
    .local v1, "succeeded":Z
    :goto_0
    if-eqz v1, :cond_1

    const-string/jumbo v0, "success"

    .line 754
    .local v0, "resultStr":Ljava/lang/String;
    :goto_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$8;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-static {v2, v0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$1600(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;)V

    .line 755
    return-void

    .line 750
    .end local v0    # "resultStr":Ljava/lang/String;
    .end local v1    # "succeeded":Z
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 752
    .restart local v1    # "succeeded":Z
    :cond_1
    const-string/jumbo v0, "fail"

    goto :goto_1
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 744
    check-cast p1, Lcom/vkontakte/android/api/Order;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/HtmlGameFragment$8;->success(Lcom/vkontakte/android/api/Order;)V

    return-void
.end method
