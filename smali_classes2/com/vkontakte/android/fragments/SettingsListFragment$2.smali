.class Lcom/vkontakte/android/fragments/SettingsListFragment$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "SettingsListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SettingsListFragment;->deletePhoto()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SettingsListFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SettingsListFragment;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SettingsListFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 188
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsListFragment$2;->this$0:Lcom/vkontakte/android/fragments/SettingsListFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 188
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/SettingsListFragment$2;->success(Ljava/lang/String;)V

    return-void
.end method

.method public success(Ljava/lang/String;)V
    .locals 4
    .param p1, "newPhoto"    # Ljava/lang/String;

    .prologue
    .line 191
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsListFragment$2;->this$0:Lcom/vkontakte/android/fragments/SettingsListFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/SettingsListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 192
    .local v0, "act":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 193
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.USER_PHOTO_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "photo"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "id"

    .line 194
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    .line 193
    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 196
    :cond_0
    return-void
.end method
