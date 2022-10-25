.class Lcom/vkontakte/android/fragments/GameCardFragment$8;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "GameCardFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/GameCardFragment;->loadInitial(ZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$count:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/GameCardFragment;Landroid/app/Fragment;Landroid/app/Activity;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/GameCardFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 376
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$8;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$8;->val$activity:Landroid/app/Activity;

    iput p4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$8;->val$count:I

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;)V
    .locals 6
    .param p1, "res"    # Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

    .prologue
    const/4 v1, 0x0

    .line 379
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$8;->val$activity:Landroid/app/Activity;

    instance-of v0, v0, Lcom/vkontakte/android/GameCardActivity;

    if-eqz v0, :cond_0

    .line 380
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$8;->val$activity:Landroid/app/Activity;

    check-cast v0, Lcom/vkontakte/android/GameCardActivity;

    iget-object v2, p1, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->application:Lcom/vkontakte/android/data/ApiApplication;

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/GameCardActivity;->updateApiAppItem(Lcom/vkontakte/android/data/ApiApplication;)V

    .line 383
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$8;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    iget-object v2, p1, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->application:Lcom/vkontakte/android/data/ApiApplication;

    invoke-static {v0, v2}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$502(Lcom/vkontakte/android/fragments/GameCardFragment;Lcom/vkontakte/android/data/ApiApplication;)Lcom/vkontakte/android/data/ApiApplication;

    .line 384
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$8;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$600(Lcom/vkontakte/android/fragments/GameCardFragment;)V

    .line 386
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$8;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$000(Lcom/vkontakte/android/fragments/GameCardFragment;)Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;

    move-result-object v0

    iget-object v2, p0, Lcom/vkontakte/android/fragments/GameCardFragment$8;->val$activity:Landroid/app/Activity;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$8;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/GameCardFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v4, "visitSource"

    const-string/jumbo v5, "direct"

    invoke-static {v3, v4, v5}, Lcom/vkontakte/android/utils/Utils;->readString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, p1, v2, v3}, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->access$700(Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;Landroid/app/Activity;Ljava/lang/String;)V

    .line 387
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$8;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$000(Lcom/vkontakte/android/fragments/GameCardFragment;)Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;

    move-result-object v2

    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$8;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/GameCardFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_2

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v2, v0}, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->build(Z)V

    .line 388
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$8;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/GameCardFragment;->updateList()V

    .line 389
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$8;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$802(Lcom/vkontakte/android/fragments/GameCardFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;

    .line 390
    iget-object v0, p1, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->application:Lcom/vkontakte/android/data/ApiApplication;

    if-eqz v0, :cond_1

    .line 391
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$8;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    iget-object v2, p1, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->application:Lcom/vkontakte/android/data/ApiApplication;

    iget v2, v2, Lcom/vkontakte/android/data/ApiApplication;->author_group:I

    neg-int v2, v2

    invoke-static {v0, v2}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$902(Lcom/vkontakte/android/fragments/GameCardFragment;I)I

    .line 392
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$8;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    iget v2, p0, Lcom/vkontakte/android/fragments/GameCardFragment$8;->val$count:I

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$1000(Lcom/vkontakte/android/fragments/GameCardFragment;II)V

    .line 395
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$8;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/GameCardFragment;->dataLoaded()V

    .line 396
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$8;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$1100(Lcom/vkontakte/android/fragments/GameCardFragment;)V

    .line 397
    return-void

    :cond_2
    move v0, v1

    .line 387
    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 376
    check-cast p1, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/GameCardFragment$8;->success(Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;)V

    return-void
.end method
