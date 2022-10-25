.class Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2$2;
.super Lcom/vkontakte/android/NetworkProxyPreferences;
.source "SettingsGeneralFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2;->onPreferenceChange(Landroid/support/v7/preference/Preference;Ljava/lang/Object;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2;

.field final synthetic val$dlg:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2;Landroid/app/ProgressDialog;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2;

    .prologue
    .line 87
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2$2;->this$1:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2$2;->val$dlg:Landroid/app/ProgressDialog;

    invoke-direct {p0}, Lcom/vkontakte/android/NetworkProxyPreferences;-><init>()V

    return-void
.end method


# virtual methods
.method protected onProxyDisabled()V
    .locals 2

    .prologue
    .line 97
    invoke-super {p0}, Lcom/vkontakte/android/NetworkProxyPreferences;->onProxyDisabled()V

    .line 98
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2$2;->val$dlg:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 99
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2$2;->this$1:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2;->val$useProxyServer:Landroid/support/v14/preference/SwitchPreference;

    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/core/network/Network;->proxy()Lcom/vk/core/network/NetworkProxy;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/core/network/NetworkProxy;->isEnable()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v14/preference/SwitchPreference;->setChecked(Z)V

    .line 100
    const v0, 0x7f080638

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 101
    return-void
.end method

.method protected onProxyEnabled()V
    .locals 2

    .prologue
    .line 90
    invoke-super {p0}, Lcom/vkontakte/android/NetworkProxyPreferences;->onProxyEnabled()V

    .line 91
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2$2;->val$dlg:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 92
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2$2;->this$1:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$2;->val$useProxyServer:Landroid/support/v14/preference/SwitchPreference;

    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/core/network/Network;->proxy()Lcom/vk/core/network/NetworkProxy;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/core/network/NetworkProxy;->isEnable()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v14/preference/SwitchPreference;->setChecked(Z)V

    .line 93
    return-void
.end method
