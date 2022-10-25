.class Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;
.super Ljava/lang/Object;
.source "GroupsFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/groups/GroupsFragment;->doLoadData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Ljava/util/ArrayList",
        "<",
        "Lcom/vkontakte/android/api/Group;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    .prologue
    .line 289
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 314
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->onError(Lme/grishka/appkit/api/ErrorResponse;)V

    .line 315
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$1400(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 316
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$1500(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 317
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$1302(Lcom/vkontakte/android/fragments/groups/GroupsFragment;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 318
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 289
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;->success(Ljava/util/ArrayList;)V

    return-void
.end method

.method public success(Ljava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 292
    .local p1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Group;>;"
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$400(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 293
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$400(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 294
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$600(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 295
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$700(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 296
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Group;

    .line 297
    .local v0, "g":Lcom/vkontakte/android/api/Group;
    iget v2, v0, Lcom/vkontakte/android/api/Group;->type:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 298
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$700(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 300
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$600(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 303
    .end local v0    # "g":Lcom/vkontakte/android/api/Group;
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$300(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$600(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->setData(Ljava/util/ArrayList;)V

    .line 304
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$900(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Lcom/vkontakte/android/fragments/groups/EventsFragment;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$700(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$1000(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Z

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/fragments/groups/EventsFragment;->setData(Ljava/util/ArrayList;Z)V

    .line 305
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$100(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)V

    .line 306
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$1100(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Landroid/view/ViewGroup;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 307
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$1200(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x8

    invoke-static {v1, v2}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 308
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$1302(Lcom/vkontakte/android/fragments/groups/GroupsFragment;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 309
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->dataLoaded()V

    .line 310
    return-void
.end method
