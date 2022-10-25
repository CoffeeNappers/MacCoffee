.class Lcom/vkontakte/android/stickers/StickersView$StickersPagerAdapter;
.super Landroid/support/v4/view/PagerAdapter;
.source "StickersView.java"

# interfaces
.implements Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconUrlProvider;
.implements Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconDrawableProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/stickers/StickersView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StickersPagerAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/stickers/StickersView;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/stickers/StickersView;)V
    .locals 0

    .prologue
    .line 404
    iput-object p1, p0, Lcom/vkontakte/android/stickers/StickersView$StickersPagerAdapter;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-direct {p0}, Landroid/support/v4/view/PagerAdapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/stickers/StickersView;Lcom/vkontakte/android/stickers/StickersView$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/stickers/StickersView;
    .param p2, "x1"    # Lcom/vkontakte/android/stickers/StickersView$1;

    .prologue
    .line 404
    invoke-direct {p0, p1}, Lcom/vkontakte/android/stickers/StickersView$StickersPagerAdapter;-><init>(Lcom/vkontakte/android/stickers/StickersView;)V

    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I
    .param p3, "object"    # Ljava/lang/Object;

    .prologue
    .line 429
    check-cast p3, Landroid/view/View;

    .end local p3    # "object":Ljava/lang/Object;
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 430
    return-void
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 408
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersView$StickersPagerAdapter;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-static {v0}, Lcom/vkontakte/android/stickers/StickersView;->access$100(Lcom/vkontakte/android/stickers/StickersView;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getPageIconDrawable(I)Landroid/graphics/drawable/Drawable;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 439
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersView$StickersPagerAdapter;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-static {v0}, Lcom/vkontakte/android/stickers/StickersView;->access$100(Lcom/vkontakte/android/stickers/StickersView;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/stickers/StickersViewPage;

    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/StickersViewPage;->getTitleDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getPageIconUrl(I)Ljava/lang/String;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 434
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersView$StickersPagerAdapter;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-static {v0}, Lcom/vkontakte/android/stickers/StickersView;->access$100(Lcom/vkontakte/android/stickers/StickersView;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/stickers/StickersViewPage;

    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/StickersViewPage;->getIconURL()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 3
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I

    .prologue
    .line 420
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersView$StickersPagerAdapter;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-static {v1}, Lcom/vkontakte/android/stickers/StickersView;->access$100(Lcom/vkontakte/android/stickers/StickersView;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/stickers/StickersViewPage;

    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView$StickersPagerAdapter;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-static {v2}, Lcom/vkontakte/android/stickers/StickersView;->access$700(Lcom/vkontakte/android/stickers/StickersView;)Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/stickers/StickersViewPage;->onBottomTabsVisibilityChanged(Z)V

    .line 421
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersView$StickersPagerAdapter;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-static {v1}, Lcom/vkontakte/android/stickers/StickersView;->access$100(Lcom/vkontakte/android/stickers/StickersView;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/stickers/StickersViewPage;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/stickers/StickersViewPage;->getView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v0

    .line 422
    .local v0, "view":Landroid/view/View;
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 423
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 424
    return-object v0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 413
    instance-of v2, p2, Lcom/vkontakte/android/stickers/StickersViewPage;

    if-eqz v2, :cond_2

    .line 414
    check-cast p2, Lcom/vkontakte/android/stickers/StickersViewPage;

    .end local p2    # "o":Ljava/lang/Object;
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/vkontakte/android/stickers/StickersViewPage;->getView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v2

    if-ne p1, v2, :cond_1

    .line 416
    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    .line 414
    goto :goto_0

    .line 416
    .restart local p2    # "o":Ljava/lang/Object;
    :cond_2
    if-eq p1, p2, :cond_0

    move v0, v1

    goto :goto_0
.end method
