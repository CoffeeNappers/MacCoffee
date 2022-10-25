.class Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment$2;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "PublicServicesFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->save()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 151
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment$2;->this$0:Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 3

    .prologue
    .line 154
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.RELOAD_PROFILE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 155
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "id"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment$2;->this$0:Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->access$200(Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;)I

    move-result v2

    neg-int v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 156
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment$2;->this$0:Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 157
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment$2;->this$0:Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/app/Activity;->setResult(I)V

    .line 158
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment$2;->this$0:Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/groupadmin/PublicServicesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 159
    return-void
.end method
