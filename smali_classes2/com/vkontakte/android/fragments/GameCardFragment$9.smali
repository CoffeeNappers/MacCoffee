.class Lcom/vkontakte/android/fragments/GameCardFragment$9;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "GameCardFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/GameCardFragment;->loadWall(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/wall/WallGet$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

.field final synthetic val$count:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/GameCardFragment;Landroid/app/Fragment;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/GameCardFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 408
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$9;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    iput p3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$9;->val$count:I

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 448
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$9;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$1902(Lcom/vkontakte/android/fragments/GameCardFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;

    .line 449
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/wall/WallGet$Result;)V
    .locals 8
    .param p1, "res"    # Lcom/vkontakte/android/api/wall/WallGet$Result;

    .prologue
    const/16 v7, 0x400

    const/4 v6, 0x0

    .line 412
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$9;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/GameCardFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    if-nez v3, :cond_0

    .line 444
    :goto_0
    return-void

    .line 415
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$9;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$1200(Lcom/vkontakte/android/fragments/GameCardFragment;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v3}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v3

    if-lez v3, :cond_1

    iget-object v3, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v3, v6}, Lcom/vkontakte/android/data/VKList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v3, v7}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 416
    iget-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$9;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    iget-object v3, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v3, v6}, Lcom/vkontakte/android/data/VKList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-static {v4, v3}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$1302(Lcom/vkontakte/android/fragments/GameCardFragment;I)I

    .line 419
    :cond_1
    iget-object v3, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v3}, Lcom/vkontakte/android/data/VKList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/NewsEntry;

    .line 420
    .local v2, "p":Lcom/vkontakte/android/NewsEntry;
    iget v4, v2, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget-object v5, p0, Lcom/vkontakte/android/fragments/GameCardFragment$9;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$1300(Lcom/vkontakte/android/fragments/GameCardFragment;)I

    move-result v5

    if-ne v4, v5, :cond_2

    invoke-virtual {v2, v7}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v4

    if-nez v4, :cond_2

    .line 421
    iget-object v3, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v3, v2}, Lcom/vkontakte/android/data/VKList;->remove(Ljava/lang/Object;)Z

    .line 425
    .end local v2    # "p":Lcom/vkontakte/android/NewsEntry;
    :cond_3
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$9;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    iget v4, v3, Lcom/vkontakte/android/fragments/GameCardFragment;->offset:I

    iget v5, p0, Lcom/vkontakte/android/fragments/GameCardFragment$9;->val$count:I

    add-int/2addr v4, v5

    iput v4, v3, Lcom/vkontakte/android/fragments/GameCardFragment;->offset:I

    .line 427
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$9;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$1400(Lcom/vkontakte/android/fragments/GameCardFragment;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 428
    iget-object v3, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v3}, Lcom/vkontakte/android/data/VKList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 429
    .local v1, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/NewsEntry;>;"
    :cond_4
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 430
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsEntry;

    .line 431
    .local v0, "e":Lcom/vkontakte/android/NewsEntry;
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$9;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$1500(Lcom/vkontakte/android/fragments/GameCardFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-static {v1, v0, v3}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$1600(Ljava/util/Iterator;Lcom/vkontakte/android/NewsEntry;Ljava/util/Collection;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 432
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$9;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$1700(Lcom/vkontakte/android/fragments/GameCardFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-static {v1, v0, v3}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$1600(Ljava/util/Iterator;Lcom/vkontakte/android/NewsEntry;Ljava/util/Collection;)Z

    goto :goto_1

    .line 437
    .end local v0    # "e":Lcom/vkontakte/android/NewsEntry;
    .end local v1    # "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/NewsEntry;>;"
    :cond_5
    iget-object v3, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->next_from:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 438
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$9;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$1802(Lcom/vkontakte/android/fragments/GameCardFragment;Ljava/lang/String;)Ljava/lang/String;

    .line 439
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$9;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    iget-object v4, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v3, v4, v6}, Lcom/vkontakte/android/fragments/GameCardFragment;->onDataLoaded(Ljava/util/List;Z)V

    goto/16 :goto_0

    .line 441
    :cond_6
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$9;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    iget-object v4, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->next_from:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$1802(Lcom/vkontakte/android/fragments/GameCardFragment;Ljava/lang/String;)Ljava/lang/String;

    .line 442
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$9;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    iget-object v4, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/fragments/GameCardFragment;->onDataLoaded(Ljava/util/List;Z)V

    goto/16 :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 408
    check-cast p1, Lcom/vkontakte/android/api/wall/WallGet$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/GameCardFragment$9;->success(Lcom/vkontakte/android/api/wall/WallGet$Result;)V

    return-void
.end method
