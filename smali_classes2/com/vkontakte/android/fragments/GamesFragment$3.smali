.class Lcom/vkontakte/android/fragments/GamesFragment$3;
.super Landroid/content/BroadcastReceiver;
.source "GamesFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/GamesFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/GamesFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/GamesFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/GamesFragment;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GamesFragment$3;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 85
    const-string/jumbo v1, "com.vkontakte.android.games.DELETE_REQUEST"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 86
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$3;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/GamesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 87
    .local v0, "activity":Landroid/app/Activity;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$3;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/GamesFragment;->access$200(Lcom/vkontakte/android/fragments/GamesFragment;)Lcom/vkontakte/android/fragments/GamesFragment$Adapter;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$3;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/GamesFragment;->access$200(Lcom/vkontakte/android/fragments/GamesFragment;)Lcom/vkontakte/android/fragments/GamesFragment$Adapter;

    move-result-object v1

    iget-object v1, v1, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->data:Ljava/util/List;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 88
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$3;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/GamesFragment;->access$200(Lcom/vkontakte/android/fragments/GamesFragment;)Lcom/vkontakte/android/fragments/GamesFragment$Adapter;

    move-result-object v1

    invoke-static {p2}, Lcom/vkontakte/android/data/Games;->getRequestFromIntent(Landroid/content/Intent;)Lcom/vkontakte/android/data/GameRequest;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/GamesFragment$3;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/GamesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/GamesFragment$3;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/GamesFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v4

    const-string/jumbo v5, "visitSource"

    const-string/jumbo v6, "direct"

    invoke-static {v4, v5, v6}, Lcom/vkontakte/android/utils/Utils;->readString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->removeInvites(Lcom/vkontakte/android/data/GameRequest;Landroid/app/Activity;Ljava/lang/String;)V

    .line 89
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$3;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/GamesFragment;->access$200(Lcom/vkontakte/android/fragments/GamesFragment;)Lcom/vkontakte/android/fragments/GamesFragment$Adapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->build()V

    .line 91
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$3;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/GamesFragment;->access$200(Lcom/vkontakte/android/fragments/GamesFragment;)Lcom/vkontakte/android/fragments/GamesFragment$Adapter;

    move-result-object v1

    invoke-static {p2}, Lcom/vkontakte/android/data/Games;->getRequestFromIntent(Landroid/content/Intent;)Lcom/vkontakte/android/data/GameRequest;

    move-result-object v2

    iget v2, v2, Lcom/vkontakte/android/data/GameRequest;->appId:I

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->clearNotificationOnApp(I)V

    .line 93
    .end local v0    # "activity":Landroid/app/Activity;
    :cond_1
    return-void
.end method
