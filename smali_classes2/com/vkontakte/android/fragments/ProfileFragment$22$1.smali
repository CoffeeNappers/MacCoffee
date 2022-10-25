.class Lcom/vkontakte/android/fragments/ProfileFragment$22$1;
.super Ljava/lang/Object;
.source "ProfileFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment$22;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/ProfileFragment$22;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment$22;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/ProfileFragment$22;

    .prologue
    .line 2895
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$22;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 2898
    new-instance v0, Lcom/vkontakte/android/api/account/AccountBanUser;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$22;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/account/AccountBanUser;-><init>(IZ)V

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$22$1$1;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$22;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$22$1$1;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment$22$1;Landroid/app/Fragment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/account/AccountBanUser;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$22;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 2906
    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$22;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 2907
    return-void
.end method
