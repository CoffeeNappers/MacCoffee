.class Lcom/vkontakte/android/fragments/SettingsAccountFragment$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "SettingsAccountFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SettingsAccountFragment;->doLoadData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SettingsAccountFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SettingsAccountFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SettingsAccountFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsAccountFragment$1;->this$0:Lcom/vkontakte/android/fragments/SettingsAccountFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;)V
    .locals 4
    .param p1, "result"    # Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    .prologue
    .line 64
    new-instance v1, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;-><init>()V

    .line 65
    .local v1, "inner":Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/SettingsAccountFragment$1;->this$0:Lcom/vkontakte/android/fragments/SettingsAccountFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/SettingsAccountFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    if-nez v2, :cond_0

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 66
    .local v0, "args":Landroid/os/Bundle;
    :goto_0
    const-string/jumbo v2, "api_result"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 67
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->setArguments(Landroid/os/Bundle;)V

    .line 68
    iget-object v2, p0, Lcom/vkontakte/android/fragments/SettingsAccountFragment$1;->this$0:Lcom/vkontakte/android/fragments/SettingsAccountFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/SettingsAccountFragment;->getInnerFragmentManager()Landroid/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v2

    const v3, 0x7f10003c

    invoke-virtual {v2, v3, v1}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/FragmentTransaction;->commit()I

    .line 69
    iget-object v2, p0, Lcom/vkontakte/android/fragments/SettingsAccountFragment$1;->this$0:Lcom/vkontakte/android/fragments/SettingsAccountFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/SettingsAccountFragment;->access$000(Lcom/vkontakte/android/fragments/SettingsAccountFragment;)V

    .line 70
    return-void

    .line 65
    .end local v0    # "args":Landroid/os/Bundle;
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/SettingsAccountFragment$1;->this$0:Lcom/vkontakte/android/fragments/SettingsAccountFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/SettingsAccountFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 61
    check-cast p1, Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/SettingsAccountFragment$1;->success(Lcom/vkontakte/android/api/execute/ExecuteGetAccountSettings$Result;)V

    return-void
.end method
