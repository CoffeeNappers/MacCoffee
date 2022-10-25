.class Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "PhotoListFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/photos/PhotoListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PhotoViewHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/Photo;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;"
    }
.end annotation


# instance fields
.field private info:Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)V
    .locals 4

    .prologue
    .line 725
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .line 726
    new-instance v0, Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/view/View;)V

    .line 727
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;->itemView:Landroid/view/View;

    new-instance v1, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    const/4 v2, -0x1

    const/high16 v3, 0x43340000    # 180.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 728
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    sget-object v1, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->CENTER_CROP:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setActualScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    .line 729
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    const v1, -0xd0d0e

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderColor(I)V

    .line 730
    return-void
.end method


# virtual methods
.method public bindLayout(Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;)V
    .locals 2
    .param p1, "l"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;

    .prologue
    .line 743
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v1, p1, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->height:I

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 744
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;->info:Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;

    .line 745
    return-void
.end method

.method public onBind(Lcom/vkontakte/android/Photo;)V
    .locals 3
    .param p1, "photo"    # Lcom/vkontakte/android/Photo;

    .prologue
    .line 734
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;->info:Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;

    if-eqz v1, :cond_0

    .line 735
    const/16 v1, 0x140

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;->info:Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;

    iget v2, v2, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->height:I

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/Photo;->getImageByHeight(I)Lcom/vkontakte/android/Photo$Image;

    move-result-object v0

    .line 736
    .local v0, "image1":Lcom/vkontakte/android/Photo$Image;
    if-eqz v0, :cond_0

    .line 737
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;->itemView:Landroid/view/View;

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 740
    .end local v0    # "image1":Lcom/vkontakte/android/Photo$Image;
    :cond_0
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 721
    check-cast p1, Lcom/vkontakte/android/Photo;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;->onBind(Lcom/vkontakte/android/Photo;)V

    return-void
.end method

.method public onClick()V
    .locals 2

    .prologue
    .line 749
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->viewer:Lcom/vkontakte/android/PhotoViewer;

    if-eqz v0, :cond_0

    .line 753
    :goto_0
    return-void

    .line 752
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/Photo;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->openPhoto(Lcom/vkontakte/android/Photo;)V

    goto :goto_0
.end method
