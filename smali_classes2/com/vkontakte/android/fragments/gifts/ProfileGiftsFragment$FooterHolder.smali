.class final Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "ProfileGiftsFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "FooterHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/api/models/GiftItem;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;"
    }
.end annotation


# instance fields
.field private mOptionsValue:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;Landroid/view/ViewGroup;)V
    .locals 5
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v4, 0x0

    .line 342
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    .line 343
    const v0, 0x7f0300f3

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 344
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->itemView:Landroid/view/View;

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->mOptionsValue:Landroid/widget/TextView;

    .line 345
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->mOptionsValue:Landroid/widget/TextView;

    new-instance v1, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    const v2, 0x7f020155

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const v3, -0xae7e48

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v0, v1, v4, v4, v4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 346
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/api/models/GiftItem;)V
    .locals 8
    .param p1, "data"    # Lcom/vkontakte/android/api/models/GiftItem;

    .prologue
    const/4 v7, -0x1

    const/high16 v5, 0x42440000    # 49.0f

    const/4 v6, 0x0

    .line 357
    iget-object v4, p1, Lcom/vkontakte/android/api/models/GiftItem;->from:Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;

    if-eqz v4, :cond_2

    .line 358
    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 359
    .local v1, "lp":Landroid/view/ViewGroup$LayoutParams;
    if-nez v1, :cond_1

    .line 360
    new-instance v1, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    .end local v1    # "lp":Landroid/view/ViewGroup$LayoutParams;
    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-direct {v1, v7, v4}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;-><init>(II)V

    .line 364
    .restart local v1    # "lp":Landroid/view/ViewGroup$LayoutParams;
    :goto_0
    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 366
    const v4, 0x7f080559

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 367
    .local v0, "longText":Ljava/lang/String;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->mOptionsValue:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->mOptionsValue:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getCompoundDrawablePadding()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v4, v5

    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->mOptionsValue:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getPaddingLeft()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v4, v5

    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->mOptionsValue:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getPaddingRight()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v4, v5

    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->mOptionsValue:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v5

    aget-object v5, v5, v6

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v4, v5

    float-to-int v3, v4

    .line 368
    .local v3, "requiredWidth":I
    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->access$300(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v4

    invoke-virtual {v4}, Lme/grishka/appkit/views/UsableRecyclerView;->getWidth()I

    move-result v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->access$400(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v5

    invoke-virtual {v5}, Lme/grishka/appkit/views/UsableRecyclerView;->getPaddingLeft()I

    move-result v5

    sub-int/2addr v4, v5

    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->access$500(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v5

    invoke-virtual {v5}, Lme/grishka/appkit/views/UsableRecyclerView;->getPaddingRight()I

    move-result v5

    sub-int/2addr v4, v5

    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    iget-object v5, v5, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->bottomDividerDecoration:Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    invoke-virtual {v5}, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;->getPaddingLeft()I

    move-result v5

    sub-int/2addr v4, v5

    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    iget-object v5, v5, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->bottomDividerDecoration:Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    invoke-virtual {v5}, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;->getPaddingRight()I

    move-result v5

    sub-int v2, v4, v5

    .line 369
    .local v2, "maxWidth":I
    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->mOptionsValue:Landroid/widget/TextView;

    if-le v3, v2, :cond_0

    const v5, 0x7f080558

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->getString(I)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "longText":Ljava/lang/String;
    :cond_0
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 379
    .end local v2    # "maxWidth":I
    .end local v3    # "requiredWidth":I
    :goto_1
    return-void

    .line 362
    :cond_1
    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    iput v4, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto/16 :goto_0

    .line 371
    .end local v1    # "lp":Landroid/view/ViewGroup$LayoutParams;
    :cond_2
    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 372
    .restart local v1    # "lp":Landroid/view/ViewGroup$LayoutParams;
    if-nez v1, :cond_3

    .line 373
    new-instance v1, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    .end local v1    # "lp":Landroid/view/ViewGroup$LayoutParams;
    invoke-direct {v1, v7, v6}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;-><init>(II)V

    .line 377
    .restart local v1    # "lp":Landroid/view/ViewGroup$LayoutParams;
    :goto_2
    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_1

    .line 375
    :cond_3
    iput v6, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_2
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 338
    check-cast p1, Lcom/vkontakte/android/api/models/GiftItem;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->onBind(Lcom/vkontakte/android/api/models/GiftItem;)V

    return-void
.end method

.method public onClick()V
    .locals 2

    .prologue
    .line 350
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/GiftItem;

    iget-object v0, v0, Lcom/vkontakte/android/api/models/GiftItem;->from:Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;

    if-eqz v0, :cond_0

    .line 351
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$FooterHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/GiftItem;

    iget-object v0, v0, Lcom/vkontakte/android/api/models/GiftItem;->from:Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->sendGiftTo(Lcom/vkontakte/android/UserProfile;)V

    .line 353
    :cond_0
    return-void
.end method
