.class public Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$PagerDotsView;
.super Landroid/widget/LinearLayout;
.source "StickersDetailsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PagerDotsView"
.end annotation


# static fields
.field public static final LP:Landroid/widget/LinearLayout$LayoutParams;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/high16 v2, 0x41400000    # 12.0f

    .line 328
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v1

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    sput-object v0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$PagerDotsView;->LP:Landroid/widget/LinearLayout$LayoutParams;

    .line 331
    sget-object v0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$PagerDotsView;->LP:Landroid/widget/LinearLayout$LayoutParams;

    sget-object v1, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$PagerDotsView;->LP:Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 332
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 335
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 336
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 339
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 340
    return-void
.end method


# virtual methods
.method public setSelection(I)V
    .locals 3
    .param p1, "position"    # I

    .prologue
    .line 343
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$PagerDotsView;->getChildCount()I

    move-result v1

    rem-int/2addr p1, v1

    .line 344
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$PagerDotsView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 345
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$PagerDotsView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    if-ne v0, p1, :cond_0

    const/4 v1, 0x1

    :goto_1
    invoke-virtual {v2, v1}, Landroid/view/View;->setSelected(Z)V

    .line 344
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 345
    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    .line 347
    :cond_1
    return-void
.end method

.method public setViewPager(Landroid/support/v4/view/ViewPager;)V
    .locals 7
    .param p1, "pager"    # Landroid/support/v4/view/ViewPager;

    .prologue
    .line 350
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/ui/infiniteviewpager/InfinitePagerAdapter;

    invoke-virtual {v5}, Lcom/vkontakte/android/ui/infiniteviewpager/InfinitePagerAdapter;->getRealCount()I

    move-result v4

    .line 351
    .local v4, "total":I
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v3

    .line 352
    .local v3, "item":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v4, :cond_1

    .line 353
    new-instance v0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$PagerDotsView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v0, v5}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 354
    .local v0, "dot":Landroid/widget/ImageView;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$PagerDotsView;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0203c6

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 355
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    sget-object v5, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 356
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 357
    if-ne v2, v3, :cond_0

    const/4 v5, 0x1

    :goto_1
    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 358
    sget-object v5, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$PagerDotsView;->LP:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0, v0, v5}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$PagerDotsView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 352
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 357
    :cond_0
    const/4 v5, 0x0

    goto :goto_1

    .line 360
    .end local v0    # "dot":Landroid/widget/ImageView;
    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_1
    return-void
.end method
