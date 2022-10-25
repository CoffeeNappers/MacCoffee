.class Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2;
.super Ljava/lang/Object;
.source "SettingsGeneralFragment.java"

# interfaces
.implements Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

.field final synthetic val$useProxyServer:Landroid/support/v14/preference/SwitchPreference;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment;Landroid/support/v14/preference/SwitchPreference;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2;->this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2;->val$useProxyServer:Landroid/support/v14/preference/SwitchPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroid/support/v7/preference/Preference;Ljava/lang/Object;)Z
    .locals 4
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 74
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/core/network/Network;->proxy()Lcom/vk/core/network/NetworkProxy;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/core/network/NetworkProxy;->isEnable()Z

    move-result v1

    if-nez v1, :cond_0

    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 75
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/core/network/Network;->proxy()Lcom/vk/core/network/NetworkProxy;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/vk/core/network/NetworkProxy;->enableProxyByUser(Z)V

    .line 77
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2;->this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 78
    .local v0, "dlg":Landroid/app/ProgressDialog;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2;->this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    const v2, 0x7f08033d

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 79
    new-instance v1, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2$1;-><init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2;)V

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 85
    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->showDialogSafety(Landroid/app/Dialog;)V

    .line 87
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/core/network/Network;->proxy()Lcom/vk/core/network/NetworkProxy;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2$2;

    invoke-direct {v2, p0, v0}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2$2;-><init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2;Landroid/app/ProgressDialog;)V

    invoke-virtual {v1, v2}, Lcom/vk/core/network/NetworkProxy;->verify(Lcom/vk/core/network/NetworkProxy$ProxyCallback;)V

    .line 108
    .end local v0    # "dlg":Landroid/app/ProgressDialog;
    :goto_0
    return v3

    .line 104
    :cond_0
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/core/network/Network;->proxy()Lcom/vk/core/network/NetworkProxy;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/vk/core/network/NetworkProxy;->enableProxyByUser(Z)V

    .line 105
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/vk/core/network/Network;->disableProxy(Z)Z

    .line 106
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2;->val$useProxyServer:Landroid/support/v14/preference/SwitchPreference;

    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/core/network/Network;->proxy()Lcom/vk/core/network/NetworkProxy;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/core/network/NetworkProxy;->isEnable()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/support/v14/preference/SwitchPreference;->setChecked(Z)V

    goto :goto_0
.end method
