.class Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$3;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "SettingsAccountInnerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->updateCommunityCommentsSetting(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;

.field final synthetic val$newValue:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;Landroid/content/Context;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 157
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;

    iput-boolean p3, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$3;->val$newValue:Z

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 168
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 169
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 171
    :cond_0
    return-void
.end method

.method public success(Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 160
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$3;->val$newValue:Z

    iput-boolean v1, v0, Lcom/vkontakte/android/auth/VKAccount;->communityComments:Z

    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 162
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->access$000(Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;)V

    .line 164
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 157
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$3;->success(Ljava/lang/Boolean;)V

    return-void
.end method
