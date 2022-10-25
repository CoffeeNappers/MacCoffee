.class Lcom/vkontakte/android/fragments/ProfileFragment$14$1;
.super Lcom/vkontakte/android/fragments/ProfileFragment$ViewViewHolder;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment$14;->createViewHolder()Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/ProfileFragment$14;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment$14;Landroid/view/View;)V
    .locals 1
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/ProfileFragment$14;
    .param p2, "itemView"    # Landroid/view/View;

    .prologue
    .line 1801
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$14$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$14;

    iget-object v0, p1, Lcom/vkontakte/android/fragments/ProfileFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewViewHolder;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;)V
    .locals 4
    .param p1, "item"    # Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    .prologue
    const v2, 0x7f1004ee

    const v3, 0x7f1004f9

    .line 1805
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewViewHolder;->onBind(Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;)V

    .line 1806
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$14$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$14;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/api/ExtendedUserProfile;->isDeactivated()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$14$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$14;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v1

    iget-boolean v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasPhoto:Z

    if-nez v1, :cond_2

    .line 1807
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$14$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$14;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v1}, Lcom/vk/imageloader/view/VKImageView;->clear()V

    .line 1812
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$14$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$14;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    .line 1813
    .local v0, "groupCover":Lcom/vk/imageloader/view/VKImageView;
    if-eqz v0, :cond_1

    .line 1814
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$14$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$14;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v1

    if-gez v1, :cond_3

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$14$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$14;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasCover()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1815
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$14$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$14;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->getImageURL(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 1820
    :cond_1
    :goto_1
    return-void

    .line 1809
    .end local v0    # "groupCover":Lcom/vk/imageloader/view/VKImageView;
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$14$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$14;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->getImageURL(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    goto :goto_0

    .line 1817
    .restart local v0    # "groupCover":Lcom/vk/imageloader/view/VKImageView;
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$14$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$14;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v1}, Lcom/vk/imageloader/view/VKImageView;->clear()V

    goto :goto_1
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1801
    check-cast p1, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$14$1;->onBind(Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;)V

    return-void
.end method
