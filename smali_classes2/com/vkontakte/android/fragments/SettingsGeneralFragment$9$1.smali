.class Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9$1;
.super Ljava/lang/Object;
.source "SettingsGeneralFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;

.field final synthetic val$lmsg:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;

    .prologue
    .line 307
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9$1;->this$1:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9$1;->val$lmsg:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 310
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9$1;->this$1:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;->val$pdlg:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 311
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9$1;->this$1:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;->this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0801f9

    .line 312
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9$1;->this$1:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;->this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    const v2, 0x7f0801fd

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9$1;->val$lmsg:Ljava/lang/String;

    aput-object v5, v3, v4

    .line 313
    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080479

    const/4 v2, 0x0

    .line 314
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 315
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 316
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9$1;->this$1:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;->this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    const-string/jumbo v1, "audioCacheLocation"

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/support/v7/preference/ListPreference;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9$1;->this$1:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;->val$from:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    iget-object v1, v1, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->nameForPreference:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/support/v7/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 317
    return-void
.end method
