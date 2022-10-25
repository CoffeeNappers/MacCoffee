.class Lcom/vkontakte/android/fragments/AuthCheckFragment$3;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "AuthCheckFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/AuthCheckFragment;->resendCode()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/AuthCheckFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/AuthCheckFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/AuthCheckFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 396
    iput-object p1, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment$3;->this$0:Lcom/vkontakte/android/fragments/AuthCheckFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 406
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment$3;->this$0:Lcom/vkontakte/android/fragments/AuthCheckFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->access$500(Lcom/vkontakte/android/fragments/AuthCheckFragment;)Landroid/widget/TextView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 407
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment$3;->this$0:Lcom/vkontakte/android/fragments/AuthCheckFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->access$600(Lcom/vkontakte/android/fragments/AuthCheckFragment;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 408
    return-void
.end method

.method public success()V
    .locals 2

    .prologue
    .line 399
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment$3;->this$0:Lcom/vkontakte/android/fragments/AuthCheckFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->access$500(Lcom/vkontakte/android/fragments/AuthCheckFragment;)Landroid/widget/TextView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 400
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment$3;->this$0:Lcom/vkontakte/android/fragments/AuthCheckFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->access$500(Lcom/vkontakte/android/fragments/AuthCheckFragment;)Landroid/widget/TextView;

    move-result-object v0

    const v1, 0x7f080106

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;)V

    .line 401
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment$3;->this$0:Lcom/vkontakte/android/fragments/AuthCheckFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/AuthCheckFragment;->access$600(Lcom/vkontakte/android/fragments/AuthCheckFragment;)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 402
    return-void
.end method
