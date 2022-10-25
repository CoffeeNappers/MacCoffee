.class Lcom/vkontakte/android/fragments/SettingsListFragment$1;
.super Landroid/content/BroadcastReceiver;
.source "SettingsListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/SettingsListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SettingsListFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SettingsListFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SettingsListFragment;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsListFragment$1;->this$0:Lcom/vkontakte/android/fragments/SettingsListFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 64
    const-string/jumbo v1, "com.vkontakte.android.STATE_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 65
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsListFragment$1;->this$0:Lcom/vkontakte/android/fragments/SettingsListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/SettingsListFragment;->access$000(Lcom/vkontakte/android/fragments/SettingsListFragment;)V

    .line 67
    :cond_0
    const-string/jumbo v1, "com.vkontakte.android.USER_PHOTO_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 68
    const-string/jumbo v1, "id"

    const/4 v2, 0x0

    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 69
    .local v0, "id":I
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 70
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsListFragment$1;->this$0:Lcom/vkontakte/android/fragments/SettingsListFragment;

    const-string/jumbo v2, "photo"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/SettingsListFragment;->access$100(Lcom/vkontakte/android/fragments/SettingsListFragment;Ljava/lang/String;)V

    .line 73
    .end local v0    # "id":I
    :cond_1
    return-void
.end method
