.class Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;
.super Ljava/lang/Object;
.source "SettingsGeneralFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


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

.field final synthetic val$dest:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

.field final synthetic val$from:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

.field final synthetic val$pc:Lcom/vkontakte/android/ProgressCallback;

.field final synthetic val$pdlg:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment;Lcom/vkontakte/android/audio/AudioFacade$StorageType;Lcom/vkontakte/android/audio/AudioFacade$StorageType;Lcom/vkontakte/android/ProgressCallback;Landroid/app/ProgressDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    .prologue
    .line 298
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;->this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;->val$from:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;->val$dest:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    iput-object p4, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;->val$pc:Lcom/vkontakte/android/ProgressCallback;

    iput-object p5, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;->val$pdlg:Landroid/app/ProgressDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 302
    :try_start_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;->val$from:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;->val$dest:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;->val$pc:Lcom/vkontakte/android/ProgressCallback;

    invoke-static {v2, v3, v4}, Lcom/vkontakte/android/audio/AudioFacade;->move(Lcom/vkontakte/android/audio/AudioFacade$StorageType;Lcom/vkontakte/android/audio/AudioFacade$StorageType;Lcom/vkontakte/android/ProgressCallback;)V

    .line 303
    iget-object v2, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;->this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;->val$dest:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    iput-object v3, v2, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->currentStorageType:Lcom/vkontakte/android/audio/AudioFacade$StorageType;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 320
    :goto_0
    return-void

    .line 304
    :catch_0
    move-exception v1

    .line 305
    .local v1, "x":Ljava/lang/Exception;
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Error moving"

    invoke-static {v2, v3, v1}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 306
    invoke-virtual {v1}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    .line 307
    .local v0, "lmsg":Ljava/lang/String;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;->this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    new-instance v3, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9$1;

    invoke-direct {v3, p0, v0}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9$1;-><init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment$9;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method
