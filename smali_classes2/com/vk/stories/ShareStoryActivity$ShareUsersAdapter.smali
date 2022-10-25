.class Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "ShareStoryActivity.java"

# interfaces
.implements Lcom/vkontakte/android/functions/VoidF1Bool;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/ShareStoryActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ShareUsersAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;",
        ">;",
        "Lcom/vkontakte/android/functions/VoidF1Bool",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;"
    }
.end annotation


# instance fields
.field private final TYPE_HEADER:I

.field private final TYPE_USER:I

.field private final context:Landroid/content/Context;

.field private isEmpty:Z

.field final synthetic this$0:Lcom/vk/stories/ShareStoryActivity;

.field private final users:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/vk/stories/ShareStoryActivity;Landroid/content/Context;)V
    .locals 3
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 287
    iput-object p1, p0, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 280
    iput v1, p0, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->TYPE_HEADER:I

    .line 281
    iput v2, p0, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->TYPE_USER:I

    .line 284
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->users:Ljava/util/ArrayList;

    .line 285
    iput-boolean v1, p0, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->isEmpty:Z

    .line 288
    iput-object p2, p0, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->context:Landroid/content/Context;

    .line 289
    invoke-virtual {p0, v2}, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->setHasStableIds(Z)V

    .line 290
    return-void
.end method


# virtual methods
.method public f(Lcom/vkontakte/android/UserProfile;Z)V
    .locals 1
    .param p1, "userProfile"    # Lcom/vkontakte/android/UserProfile;
    .param p2, "b"    # Z

    .prologue
    .line 303
    if-eqz p2, :cond_0

    .line 304
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/ShareStoryActivity;->access$800(Lcom/vk/stories/ShareStoryActivity;)Ljava/util/HashSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 308
    :goto_0
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/ShareStoryActivity;->access$700(Lcom/vk/stories/ShareStoryActivity;)V

    .line 309
    return-void

    .line 306
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/ShareStoryActivity;->access$800(Lcom/vk/stories/ShareStoryActivity;)Ljava/util/HashSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public bridge synthetic f(Ljava/lang/Object;Z)V
    .locals 0

    .prologue
    .line 278
    check-cast p1, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p0, p1, p2}, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->f(Lcom/vkontakte/android/UserProfile;Z)V

    return-void
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 324
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->users:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 338
    if-nez p1, :cond_0

    .line 339
    const-wide/16 v0, 0x0

    .line 341
    :goto_0
    return-wide v0

    :cond_0
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->users:Ljava/util/ArrayList;

    add-int/lit8 v1, p1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    int-to-long v0, v0

    goto :goto_0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 329
    if-nez p1, :cond_0

    .line 330
    const/4 v0, 0x0

    .line 332
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 278
    check-cast p1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V
    .locals 3
    .param p1, "holder"    # Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 313
    instance-of v1, p1, Lcom/vkontakte/android/ui/holder/UserHolder;

    if-eqz v1, :cond_1

    .line 314
    iget-object v1, p0, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->users:Ljava/util/ArrayList;

    add-int/lit8 v2, p2, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 315
    .local v0, "u":Lcom/vkontakte/android/UserProfile;
    iget-object v1, p0, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v1}, Lcom/vk/stories/ShareStoryActivity;->access$800(Lcom/vk/stories/ShareStoryActivity;)Ljava/util/HashSet;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/vkontakte/android/UserProfile;->isSelected:Z

    .line 316
    check-cast p1, Lcom/vkontakte/android/ui/holder/UserHolder;

    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/UserHolder;->bind(Ljava/lang/Object;)V

    .line 320
    .end local v0    # "u":Lcom/vkontakte/android/UserProfile;
    :cond_0
    :goto_0
    return-void

    .line 317
    .restart local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    :cond_1
    instance-of v1, p1, Lcom/vk/stories/ShareStoryActivity$HeaderHolder;

    if-eqz v1, :cond_0

    .line 318
    check-cast p1, Lcom/vk/stories/ShareStoryActivity$HeaderHolder;

    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    iget-boolean v1, p0, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->isEmpty:Z

    invoke-virtual {p1, v1}, Lcom/vk/stories/ShareStoryActivity$HeaderHolder;->setIsEmpty(Z)V

    goto :goto_0
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 278
    invoke-virtual {p0, p1, p2}, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 294
    if-nez p2, :cond_0

    .line 295
    new-instance v0, Lcom/vk/stories/ShareStoryActivity$HeaderHolder;

    iget-object v1, p0, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-direct {v0, v1}, Lcom/vk/stories/ShareStoryActivity$HeaderHolder;-><init>(Lcom/vk/stories/ShareStoryActivity;)V

    .line 297
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/ShareStoryActivity;->access$000(Lcom/vk/stories/ShareStoryActivity;)Lcom/vk/stories/view/ShareStoryRecyclerView;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ui/holder/UserHolder;->checkable(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/ui/holder/UserHolder;->onCheck(Lcom/vkontakte/android/functions/VoidF1Bool;)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    goto :goto_0
.end method

.method public setData(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 346
    .local p1, "docs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->users:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 347
    if-eqz p1, :cond_0

    .line 348
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->users:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 350
    :cond_0
    invoke-virtual {p0}, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->notifyDataSetChanged()V

    .line 352
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->users:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->isEmpty:Z

    .line 353
    return-void

    .line 352
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
