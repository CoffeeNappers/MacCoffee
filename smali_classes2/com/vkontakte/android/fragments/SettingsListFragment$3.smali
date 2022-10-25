.class Lcom/vkontakte/android/fragments/SettingsListFragment$3;
.super Ljava/lang/Thread;
.source "SettingsListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SettingsListFragment;->lambda$confirmLogout$1(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SettingsListFragment;

.field final synthetic val$dlg:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SettingsListFragment;Landroid/app/ProgressDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SettingsListFragment;

    .prologue
    .line 210
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsListFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsListFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/SettingsListFragment$3;->val$dlg:Landroid/app/ProgressDialog;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$run$0(Landroid/app/ProgressDialog;)V
    .locals 1
    .param p1, "dlg"    # Landroid/app/ProgressDialog;

    .prologue
    .line 214
    invoke-static {p1}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 217
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsListFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsListFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    instance-of v0, v0, Lcom/vkontakte/android/MainActivity;

    if-eqz v0, :cond_0

    .line 218
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsListFragment$3;->this$0:Lcom/vkontakte/android/fragments/SettingsListFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/MainActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/MainActivity;->restartAfterLogout()V

    .line 220
    :cond_0
    return-void
.end method

.method public run()V
    .locals 1

    .prologue
    .line 212
    invoke-static {}, Lcom/vkontakte/android/auth/VKAuth;->logout()Z

    .line 213
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsListFragment$3;->val$dlg:Landroid/app/ProgressDialog;

    invoke-static {p0, v0}, Lcom/vkontakte/android/fragments/SettingsListFragment$3$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsListFragment$3;Landroid/app/ProgressDialog;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 221
    return-void
.end method
