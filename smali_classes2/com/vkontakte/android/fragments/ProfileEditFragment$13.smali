.class Lcom/vkontakte/android/fragments/ProfileEditFragment$13;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "ProfileEditFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileEditFragment;->cancelNameRequest()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/account/AccountSaveProfileInfo$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 463
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$13;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/api/account/AccountSaveProfileInfo$Result;)V
    .locals 3
    .param p1, "res"    # Lcom/vkontakte/android/api/account/AccountSaveProfileInfo$Result;

    .prologue
    .line 466
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$13;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f080417

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 467
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$13;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f1004d7

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 468
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 463
    check-cast p1, Lcom/vkontakte/android/api/account/AccountSaveProfileInfo$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileEditFragment$13;->success(Lcom/vkontakte/android/api/account/AccountSaveProfileInfo$Result;)V

    return-void
.end method
