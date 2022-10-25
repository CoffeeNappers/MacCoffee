.class Lcom/vkontakte/android/fragments/GameCardFragment$3;
.super Landroid/content/BroadcastReceiver;
.source "GameCardFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/GameCardFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/GameCardFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/GameCardFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/GameCardFragment;

    .prologue
    .line 118
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$3;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 121
    const-string/jumbo v1, "com.vkontakte.android.games.DELETE_REQUEST_ALL"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 122
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$3;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/GameCardFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 123
    .local v0, "activity":Landroid/app/Activity;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$3;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/GameCardFragment;->adapter:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$3;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$000(Lcom/vkontakte/android/fragments/GameCardFragment;)Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;

    move-result-object v1

    iget-object v1, v1, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->data:Ljava/util/List;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 124
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$3;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$000(Lcom/vkontakte/android/fragments/GameCardFragment;)Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;

    move-result-object v1

    invoke-static {p2}, Lcom/vkontakte/android/data/Games;->getRequestFromIntent(Landroid/content/Intent;)Lcom/vkontakte/android/data/GameRequest;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$3;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/GameCardFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->removeRequests(Lcom/vkontakte/android/data/GameRequest;Landroid/app/Activity;)V

    .line 125
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$3;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$000(Lcom/vkontakte/android/fragments/GameCardFragment;)Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->build()V

    .line 128
    .end local v0    # "activity":Landroid/app/Activity;
    :cond_0
    return-void
.end method
