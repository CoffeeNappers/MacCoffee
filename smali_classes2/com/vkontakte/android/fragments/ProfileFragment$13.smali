.class Lcom/vkontakte/android/fragments/ProfileFragment$13;
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
    .line 1753
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$13;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public createViewHolder()Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 3

    .prologue
    .line 1766
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$13;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$13;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    return-object v0
.end method

.method public getImageCount()I
    .locals 1

    .prologue
    .line 1756
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$13;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/api/ExtendedUserProfile;->isDeactivated()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$13;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasPhoto:Z

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 1761
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$13;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getHeaderImageUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
