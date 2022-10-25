.class Lcom/vkontakte/android/LinkRedirActivity$13;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "LinkRedirActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LinkRedirActivity;->openPromoFeed(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/util/ArrayList",
        "<",
        "Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists$Item;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/LinkRedirActivity;

.field final synthetic val$key:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/LinkRedirActivity;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/LinkRedirActivity;

    .prologue
    .line 1509
    iput-object p1, p0, Lcom/vkontakte/android/LinkRedirActivity$13;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iput-object p2, p0, Lcom/vkontakte/android/LinkRedirActivity$13;->val$key:Ljava/lang/String;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 1530
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 1531
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$13;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1532
    const-class v0, Lcom/vkontakte/android/fragments/NewsFragment;

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    iget-object v2, p0, Lcom/vkontakte/android/LinkRedirActivity$13;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 1533
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$13;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 1534
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1509
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/LinkRedirActivity$13;->success(Ljava/util/ArrayList;)V

    return-void
.end method

.method public success(Ljava/util/ArrayList;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists$Item;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1512
    .local p1, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists$Item;>;"
    const/4 v2, 0x0

    .line 1513
    .local v2, "visible":I
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1514
    .local v0, "args":Landroid/os/Bundle;
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists$Item;

    .line 1515
    .local v1, "item":Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists$Item;
    iget-object v4, p0, Lcom/vkontakte/android/LinkRedirActivity$13;->val$key:Ljava/lang/String;

    iget-object v5, v1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists$Item;->id:Ljava/lang/String;

    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1516
    const-string/jumbo v4, "feed_id"

    iget-object v5, p0, Lcom/vkontakte/android/LinkRedirActivity$13;->val$key:Ljava/lang/String;

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1517
    const-string/jumbo v4, "list_id"

    rsub-int/lit8 v5, v2, -0xa

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1519
    :cond_1
    iget-boolean v4, v1, Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists$Item;->hidden:Z

    if-nez v4, :cond_0

    .line 1520
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1523
    .end local v1    # "item":Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists$Item;
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/LinkRedirActivity$13;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1524
    const-class v3, Lcom/vkontakte/android/fragments/NewsFragment;

    iget-object v4, p0, Lcom/vkontakte/android/LinkRedirActivity$13;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-static {v3, v0, v4}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 1525
    iget-object v3, p0, Lcom/vkontakte/android/LinkRedirActivity$13;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v3}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 1526
    return-void
.end method
