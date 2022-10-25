.class Lcom/vkontakte/android/fragments/GameCardFragment$7;
.super Ljava/lang/Thread;
.source "GameCardFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/GameCardFragment;->fadeDrawablesAndHideRequests()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

.field final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/GameCardFragment;Landroid/app/Activity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/GameCardFragment;

    .prologue
    .line 332
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$7;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/GameCardFragment$7;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 335
    iget-object v2, p0, Lcom/vkontakte/android/fragments/GameCardFragment$7;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$000(Lcom/vkontakte/android/fragments/GameCardFragment;)Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;

    move-result-object v2

    iget-object v2, v2, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/GameCardFragment$7;->val$activity:Landroid/app/Activity;

    if-eqz v2, :cond_1

    .line 336
    iget-object v2, p0, Lcom/vkontakte/android/fragments/GameCardFragment$7;->val$activity:Landroid/app/Activity;

    invoke-static {v2}, Lcom/vkontakte/android/data/db/Database;->getInst(Landroid/content/Context;)Lcom/vkontakte/android/data/db/Database;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$7;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$000(Lcom/vkontakte/android/fragments/GameCardFragment;)Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;

    move-result-object v3

    iget-object v3, v3, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

    iget-object v3, v3, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->application:Lcom/vkontakte/android/data/ApiApplication;

    iget v3, v3, Lcom/vkontakte/android/data/ApiApplication;->id:I

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/data/db/Database;->getRequests(ILandroid/util/SparseArray;)Ljava/util/ArrayList;

    move-result-object v1

    .line 337
    .local v1, "gameRequests":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/GameRequest;>;"
    iget-object v2, p0, Lcom/vkontakte/android/fragments/GameCardFragment$7;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$000(Lcom/vkontakte/android/fragments/GameCardFragment;)Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;

    move-result-object v2

    iget-object v2, v2, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

    iget-object v2, v2, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->requestsServer:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/GameRequest;

    .line 338
    .local v0, "gameRequest":Lcom/vkontakte/android/data/GameRequest;
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 339
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$7;->val$activity:Landroid/app/Activity;

    invoke-static {v3}, Lcom/vkontakte/android/data/db/Database;->getInst(Landroid/content/Context;)Lcom/vkontakte/android/data/db/Database;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/vkontakte/android/data/db/Database;->insertRequest(Lcom/vkontakte/android/data/GameRequest;)V

    .line 340
    const/4 v3, 0x1

    iput-boolean v3, v0, Lcom/vkontakte/android/data/GameRequest;->fromDb:Z

    goto :goto_0

    .line 344
    .end local v0    # "gameRequest":Lcom/vkontakte/android/data/GameRequest;
    .end local v1    # "gameRequests":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/GameRequest;>;"
    :cond_1
    return-void
.end method
