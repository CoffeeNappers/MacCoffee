.class Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8;
.super Ljava/lang/Object;
.source "SettingsGeneralFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ProgressCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->moveAudioCache(Lcom/vkontakte/android/audio/AudioFacade$StorageType;Lcom/vkontakte/android/audio/AudioFacade$StorageType;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

.field final synthetic val$pdlg:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment;Landroid/app/ProgressDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    .prologue
    .line 272
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8;->this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8;->val$pdlg:Landroid/app/ProgressDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 1

    .prologue
    .line 295
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8;->val$pdlg:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 296
    return-void
.end method

.method public onProgressUpdated(I)V
    .locals 2
    .param p1, "progress"    # I

    .prologue
    .line 275
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8;->this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8$1;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8$1;-><init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8;I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 281
    return-void
.end method

.method public onSetMaxValue(I)V
    .locals 2
    .param p1, "max"    # I

    .prologue
    .line 285
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8;->this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8$2;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8$2;-><init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8;I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 291
    return-void
.end method
