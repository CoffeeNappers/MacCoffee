.class Lcom/vkontakte/android/stickers/StickersView$TabsShower;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "StickersView.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/stickers/StickersView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TabsShower"
.end annotation


# instance fields
.field private animator:Landroid/view/ViewPropertyAnimator;

.field private mScrollThreshold:I

.field final synthetic this$0:Lcom/vkontakte/android/stickers/StickersView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/stickers/StickersView;)V
    .locals 1
    .param p1, "this$0"    # Lcom/vkontakte/android/stickers/StickersView;

    .prologue
    .line 443
    iput-object p1, p0, Lcom/vkontakte/android/stickers/StickersView$TabsShower;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    .line 445
    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/stickers/StickersView$TabsShower;->mScrollThreshold:I

    return-void
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/stickers/StickersView$TabsShower;ZZ)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/StickersView$TabsShower;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Z

    .prologue
    .line 443
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/stickers/StickersView$TabsShower;->toggleTabs(ZZ)V

    return-void
.end method

.method private toggleTabs(ZZ)V
    .locals 8
    .param p1, "visible"    # Z
    .param p2, "force"    # Z

    .prologue
    .line 478
    iget-object v4, p0, Lcom/vkontakte/android/stickers/StickersView$TabsShower;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-static {v4}, Lcom/vkontakte/android/stickers/StickersView;->access$700(Lcom/vkontakte/android/stickers/StickersView;)Z

    move-result v4

    if-ne v4, p1, :cond_0

    if-eqz p2, :cond_1

    .line 479
    :cond_0
    iget-object v4, p0, Lcom/vkontakte/android/stickers/StickersView$TabsShower;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-static {v4, p1}, Lcom/vkontakte/android/stickers/StickersView;->access$702(Lcom/vkontakte/android/stickers/StickersView;Z)Z

    .line 480
    iget-object v4, p0, Lcom/vkontakte/android/stickers/StickersView$TabsShower;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-static {v4}, Lcom/vkontakte/android/stickers/StickersView;->access$900(Lcom/vkontakte/android/stickers/StickersView;)Landroid/view/ViewGroup;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getHeight()I

    move-result v0

    .line 481
    .local v0, "height":I
    if-nez v0, :cond_2

    if-nez p2, :cond_2

    .line 482
    iget-object v4, p0, Lcom/vkontakte/android/stickers/StickersView$TabsShower;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-static {v4}, Lcom/vkontakte/android/stickers/StickersView;->access$900(Lcom/vkontakte/android/stickers/StickersView;)Landroid/view/ViewGroup;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v3

    .line 483
    .local v3, "vto":Landroid/view/ViewTreeObserver;
    invoke-virtual {v3}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 484
    new-instance v4, Lcom/vkontakte/android/stickers/StickersView$TabsShower$1;

    invoke-direct {v4, p0, p1}, Lcom/vkontakte/android/stickers/StickersView$TabsShower$1;-><init>(Lcom/vkontakte/android/stickers/StickersView$TabsShower;Z)V

    invoke-virtual {v3, v4}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 504
    .end local v0    # "height":I
    .end local v3    # "vto":Landroid/view/ViewTreeObserver;
    :cond_1
    return-void

    .line 498
    .restart local v0    # "height":I
    :cond_2
    if-eqz p1, :cond_3

    const/4 v2, 0x0

    .line 499
    .local v2, "translationY":I
    :goto_0
    iget-object v4, p0, Lcom/vkontakte/android/stickers/StickersView$TabsShower;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-static {v4}, Lcom/vkontakte/android/stickers/StickersView;->access$900(Lcom/vkontakte/android/stickers/StickersView;)Landroid/view/ViewGroup;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/ViewGroup;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    sget-object v5, Lcom/vkontakte/android/stickers/StickersView;->mInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v4, v5}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    const-wide/16 v6, 0xc8

    invoke-virtual {v4, v6, v7}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    int-to-float v5, v2

    invoke-virtual {v4, v5}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/stickers/StickersView$TabsShower;->animator:Landroid/view/ViewPropertyAnimator;

    .line 500
    iget-object v4, p0, Lcom/vkontakte/android/stickers/StickersView$TabsShower;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-static {v4}, Lcom/vkontakte/android/stickers/StickersView;->access$100(Lcom/vkontakte/android/stickers/StickersView;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/stickers/StickersViewPage;

    .line 501
    .local v1, "tab":Lcom/vkontakte/android/stickers/StickersViewPage;
    invoke-virtual {v1, p1}, Lcom/vkontakte/android/stickers/StickersViewPage;->onBottomTabsVisibilityChanged(Z)V

    goto :goto_1

    .end local v1    # "tab":Lcom/vkontakte/android/stickers/StickersViewPage;
    .end local v2    # "translationY":I
    :cond_3
    move v2, v0

    .line 498
    goto :goto_0
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 462
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 451
    return-void
.end method

.method public onPageSelected(I)V
    .locals 3
    .param p1, "position"    # I

    .prologue
    const/4 v2, 0x1

    .line 455
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersView$TabsShower;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-static {v0}, Lcom/vkontakte/android/stickers/StickersView;->access$800(Lcom/vkontakte/android/stickers/StickersView;)Landroid/view/View;

    move-result-object v1

    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 456
    invoke-direct {p0, v2, v2}, Lcom/vkontakte/android/stickers/StickersView$TabsShower;->toggleTabs(ZZ)V

    .line 457
    return-void

    .line 455
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method public onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .locals 0
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "newState"    # I

    .prologue
    .line 468
    return-void
.end method

.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 3
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    .prologue
    const/4 v1, 0x0

    .line 472
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iget v2, p0, Lcom/vkontakte/android/stickers/StickersView$TabsShower;->mScrollThreshold:I

    if-le v0, v2, :cond_0

    .line 473
    if-gez p3, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/stickers/StickersView$TabsShower;->toggleTabs(ZZ)V

    .line 475
    :cond_0
    return-void

    :cond_1
    move v0, v1

    .line 473
    goto :goto_0
.end method
