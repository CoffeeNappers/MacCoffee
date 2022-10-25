.class public Lcom/vkontakte/android/ui/holder/market/GoodGridItemHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GoodGridItemHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/data/Good;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field final image:Lcom/vk/imageloader/view/VKImageView;

.field final text1:Landroid/widget/TextView;

.field final text2:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 4
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 25
    const v0, 0x7f030101

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 26
    const v0, 0x1020014

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/market/GoodGridItemHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/market/GoodGridItemHolder;->text1:Landroid/widget/TextView;

    .line 27
    const v0, 0x1020015

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/market/GoodGridItemHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/market/GoodGridItemHolder;->text2:Landroid/widget/TextView;

    .line 28
    const v0, 0x1020006

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/market/GoodGridItemHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/market/GoodGridItemHolder;->image:Lcom/vk/imageloader/view/VKImageView;

    .line 29
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/market/GoodGridItemHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 31
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/market/GoodGridItemHolder;->image:Lcom/vk/imageloader/view/VKImageView;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setAspectRatio(F)V

    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/market/GoodGridItemHolder;->image:Lcom/vk/imageloader/view/VKImageView;

    sget-object v1, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->FOCUS_CROP:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setActualScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/market/GoodGridItemHolder;->image:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v0

    check-cast v0, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    new-instance v1, Landroid/graphics/PointF;

    const/high16 v2, 0x3f000000    # 0.5f

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setActualImageFocusPoint(Landroid/graphics/PointF;)V

    .line 34
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/data/Good;)V
    .locals 3
    .param p1, "item"    # Lcom/vkontakte/android/data/Good;

    .prologue
    const/4 v2, 0x0

    .line 38
    if-nez p1, :cond_0

    .line 39
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/market/GoodGridItemHolder;->itemView:Landroid/view/View;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 48
    :goto_0
    return-void

    .line 41
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/market/GoodGridItemHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 42
    iget-object v1, p1, Lcom/vkontakte/android/data/Good;->photos:[Lcom/vkontakte/android/Photo;

    if-eqz v1, :cond_1

    iget-object v1, p1, Lcom/vkontakte/android/data/Good;->photos:[Lcom/vkontakte/android/Photo;

    array-length v1, v1

    if-lez v1, :cond_1

    iget-object v1, p1, Lcom/vkontakte/android/data/Good;->photos:[Lcom/vkontakte/android/Photo;

    aget-object v1, v1, v2

    const/high16 v2, 0x43300000    # 176.0f

    .line 43
    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/Photo;->getImageByWidth(I)Lcom/vkontakte/android/Photo$Image;

    move-result-object v1

    iget-object v0, v1, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    .line 44
    .local v0, "url":Ljava/lang/String;
    :goto_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/market/GoodGridItemHolder;->image:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v1, v0}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 45
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/market/GoodGridItemHolder;->text1:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/data/Good;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/market/GoodGridItemHolder;->text2:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/data/Good;->price_text:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 43
    .end local v0    # "url":Ljava/lang/String;
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 18
    check-cast p1, Lcom/vkontakte/android/data/Good;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/market/GoodGridItemHolder;->onBind(Lcom/vkontakte/android/data/Good;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 54
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/market/GoodGridItemHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 55
    new-instance v1, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder;

    sget-object v2, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;->market:Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/market/GoodGridItemHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/Good;

    iget v3, v0, Lcom/vkontakte/android/data/Good;->owner_id:I

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/market/GoodGridItemHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/Good;

    iget v0, v0, Lcom/vkontakte/android/data/Good;->id:I

    invoke-direct {v1, v2, v3, v0}, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder;-><init>(Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;II)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder;->go(Landroid/content/Context;)Z

    .line 57
    :cond_0
    return-void
.end method
