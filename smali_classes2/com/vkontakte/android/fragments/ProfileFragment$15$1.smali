.class Lcom/vkontakte/android/fragments/ProfileFragment$15$1;
.super Lcom/vkontakte/android/fragments/ProfileFragment$ViewViewHolder;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment$15;->createViewHolder()Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/ProfileFragment$15;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment$15;Landroid/view/View;)V
    .locals 1
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/ProfileFragment$15;
    .param p2, "itemView"    # Landroid/view/View;

    .prologue
    .line 1869
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$15$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$15;

    iget-object v0, p1, Lcom/vkontakte/android/fragments/ProfileFragment$15;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewViewHolder;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;)V
    .locals 3
    .param p1, "item"    # Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    .prologue
    .line 1873
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewViewHolder;->onBind(Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;)V

    .line 1874
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$15$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$15;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$15;->view:Landroid/view/View;

    const v1, 0x7f1001e8

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$15$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$15;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$15;->getImageURL(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 1875
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1869
    check-cast p1, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$15$1;->onBind(Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;)V

    return-void
.end method
