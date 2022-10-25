.class Lcom/vkontakte/android/fragments/SettingsGeneralFragment$7;
.super Ljava/lang/Object;
.source "SettingsGeneralFragment.java"

# interfaces
.implements Landroid/support/v7/preference/Preference$OnPreferenceChangeListener;


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
    .line 235
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$7;->this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroid/support/v7/preference/Preference;Ljava/lang/Object;)Z
    .locals 3
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;
    .param p2, "val"    # Ljava/lang/Object;

    .prologue
    .line 238
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$7;->this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->currentStorageType:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    iget-object v0, v0, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->nameForPreference:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 239
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$7;->this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$7;->this$0:Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->currentStorageType:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    check-cast p2, Ljava/lang/String;

    .end local p2    # "val":Ljava/lang/Object;
    invoke-static {p2}, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->parseFromPreferences(Ljava/lang/String;)Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->access$100(Lcom/vkontakte/android/fragments/SettingsGeneralFragment;Lcom/vkontakte/android/audio/AudioFacade$StorageType;Lcom/vkontakte/android/audio/AudioFacade$StorageType;)V

    .line 241
    :cond_0
    const/4 v0, 0x1

    return v0
.end method
