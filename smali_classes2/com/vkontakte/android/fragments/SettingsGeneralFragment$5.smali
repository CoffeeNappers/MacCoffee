.class Lcom/vkontakte/android/fragments/SettingsGeneralFragment$5;
.super Ljava/lang/Object;
.source "SettingsGeneralFragment.java"

# interfaces
.implements Landroid/support/v7/preference/Preference$OnPreferenceClickListener;


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


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    .prologue
    .line 169
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$5;->this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/support/v7/preference/Preference;)Z
    .locals 1
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 172
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$5;->this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->access$000(Landroid/content/Context;)V

    .line 173
    const/4 v0, 0x1

    return v0
.end method
