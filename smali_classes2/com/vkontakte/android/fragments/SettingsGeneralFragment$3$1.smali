.class Lcom/vkontakte/android/fragments/SettingsGeneralFragment$3$1;
.super Ljava/lang/Object;
.source "SettingsGeneralFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SettingsGeneralFragment$3;->onPreferenceClick(Landroid/support/v7/preference/Preference;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$3;

.field final synthetic val$dlg:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment$3;Landroid/app/ProgressDialog;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/SettingsGeneralFragment$3;

    .prologue
    .line 138
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$3$1;->this$1:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$3;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$3$1;->val$dlg:Landroid/app/ProgressDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 141
    invoke-static {}, Lcom/vk/imageloader/VKImageLoader;->clearAllCaches()V

    .line 142
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$3$1;->val$dlg:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 143
    return-void
.end method
