.class Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6$1;
.super Ljava/lang/Object;
.source "SettingsGeneralFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6;->onPreferenceClick(Landroid/support/v7/preference/Preference;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6;

    .prologue
    .line 184
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6$1;->this$1:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 187
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6$1;->this$1:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6;->this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 188
    .local v0, "dlg":Landroid/app/ProgressDialog;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6$1;->this$1:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6;->this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f08033d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 189
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 190
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 191
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6$1$1;

    invoke-direct {v2, p0, v0}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6$1$1;-><init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6$1;Landroid/app/ProgressDialog;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 198
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 199
    return-void
.end method
