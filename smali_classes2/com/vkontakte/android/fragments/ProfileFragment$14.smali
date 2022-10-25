.class Lcom/vkontakte/android/fragments/ProfileFragment$14;
.super Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;->buildInfoItems()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p2, "view"    # Landroid/view/View;

    .prologue
    .line 1783
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public createViewHolder()Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 2

    .prologue
    .line 1801
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$14$1;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$14;->view:Landroid/view/View;

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$14$1;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment$14;Landroid/view/View;)V

    return-object v0
.end method

.method public getImageCount()I
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1786
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/api/ExtendedUserProfile;->isDeactivated()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasPhoto:Z

    if-nez v0, :cond_1

    :cond_0
    move v0, v2

    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 1787
    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v3

    if-gez v3, :cond_2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasCover()Z

    move-result v3

    if-eqz v3, :cond_2

    :goto_1
    add-int/2addr v0, v1

    return v0

    :cond_1
    move v0, v1

    .line 1786
    goto :goto_0

    :cond_2
    move v1, v2

    .line 1787
    goto :goto_1
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 2
    .param p1, "image"    # I

    .prologue
    .line 1792
    if-nez p1, :cond_0

    .line 1793
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->bigPhoto:Ljava/lang/String;

    .line 1795
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->coverPhoto:Lcom/vkontakte/android/Photo;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/widget/Toolbar;->getMeasuredWidth()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/Photo;->getImageByWidth(I)Lcom/vkontakte/android/Photo$Image;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    goto :goto_0
.end method
