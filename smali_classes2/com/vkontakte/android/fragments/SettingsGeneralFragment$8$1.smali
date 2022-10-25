.class Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8$1;
.super Ljava/lang/Object;
.source "SettingsGeneralFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8;->onProgressUpdated(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8;

.field final synthetic val$progress:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8;I)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8;

    .prologue
    .line 275
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8$1;->this$1:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8;

    iput p2, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8$1;->val$progress:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 278
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8$1;->this$1:Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8;->val$pdlg:Landroid/app/ProgressDialog;

    iget v1, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$8$1;->val$progress:I

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 279
    return-void
.end method
