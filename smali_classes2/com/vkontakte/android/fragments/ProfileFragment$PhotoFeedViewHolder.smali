.class abstract Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "ProfileFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "PhotoFeedViewHolder"
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
.field final HEIGHT:I

.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 4

    .prologue
    .line 4261
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 4262
    new-instance v0, Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/view/View;)V

    .line 4259
    const/high16 v0, 0x42e00000    # 112.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;->HEIGHT:I

    .line 4263
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    sget-object v1, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->CENTER_CROP:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setActualScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    .line 4264
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0f0013

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(Landroid/graphics/drawable/Drawable;)V

    .line 4265
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/Photo;)V
    .locals 6
    .param p1, "item"    # Lcom/vkontakte/android/Photo;

    .prologue
    .line 4269
    const/16 v1, 0x6d

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v0

    .line 4270
    .local v0, "img":Lcom/vkontakte/android/Photo$Image;
    iget v1, v0, Lcom/vkontakte/android/Photo$Image;->width:I

    if-eqz v1, :cond_0

    iget v1, v0, Lcom/vkontakte/android/Photo$Image;->height:I

    if-nez v1, :cond_1

    .line 4271
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;->itemView:Landroid/view/View;

    new-instance v2, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    iget v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;->HEIGHT:I

    int-to-float v3, v3

    const/high16 v4, 0x3fa00000    # 1.25f

    mul-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    iget v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;->HEIGHT:I

    invoke-direct {v2, v3, v4}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 4275
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;->itemView:Landroid/view/View;

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 4276
    return-void

    .line 4273
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;->itemView:Landroid/view/View;

    new-instance v2, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    iget v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;->HEIGHT:I

    int-to-float v3, v3

    iget v4, v0, Lcom/vkontakte/android/Photo$Image;->width:I

    int-to-float v4, v4

    iget v5, v0, Lcom/vkontakte/android/Photo$Image;->height:I

    int-to-float v5, v5

    div-float/2addr v4, v5

    const/high16 v5, 0x3fc00000    # 1.5f

    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    move-result v4

    mul-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    iget v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;->HEIGHT:I

    invoke-direct {v2, v3, v4}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 4257
    check-cast p1, Lcom/vkontakte/android/Photo;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;->onBind(Lcom/vkontakte/android/Photo;)V

    return-void
.end method
