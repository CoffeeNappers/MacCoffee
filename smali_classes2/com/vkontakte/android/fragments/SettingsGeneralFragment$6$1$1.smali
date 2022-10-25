.class Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6$1$1;
.super Ljava/lang/Object;
.source "SettingsGeneralFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6$1;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6$1;

.field final synthetic val$dlg:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6$1;Landroid/app/ProgressDialog;)V
    .locals 0
    .param p1, "this$2"    # Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6$1;

    .prologue
    .line 191
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6$1$1;->this$2:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6$1;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6$1$1;->val$dlg:Landroid/app/ProgressDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 194
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->cancelDownloads()V

    .line 195
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    invoke-static {v0}, Lcom/vkontakte/android/audio/AudioFacade;->removeSavedTrack([Ljava/lang/String;)V

    .line 196
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$6$1$1;->val$dlg:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 197
    return-void
.end method
