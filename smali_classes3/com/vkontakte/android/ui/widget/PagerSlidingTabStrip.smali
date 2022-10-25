.class public Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;
.super Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;
.source "PagerSlidingTabStrip.java"

# interfaces
.implements Lcom/vkontakte/android/ui/widget/SubPagerOfList$Decor;


# instance fields
.field private pager:Landroid/support/v4/view/ViewPager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;-><init>(Landroid/content/Context;)V

    .line 20
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;->init()V

    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 25
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;->init()V

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 29
    invoke-direct {p0, p1, p2, p3}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 30
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;->init()V

    .line 31
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;
    .param p1, "x1"    # I

    .prologue
    .line 14
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;->updateTabsState(I)V

    return-void
.end method

.method private getTabsContainer()Landroid/view/ViewGroup;
    .locals 3
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 83
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;->getChildCount()I

    move-result v2

    if-lez v2, :cond_0

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 84
    .local v0, "tabsContainer":Landroid/view/View;
    :goto_0
    instance-of v2, v0, Landroid/view/ViewGroup;

    if-eqz v2, :cond_1

    check-cast v0, Landroid/view/ViewGroup;

    .end local v0    # "tabsContainer":Landroid/view/View;
    :goto_1
    return-object v0

    :cond_0
    move-object v0, v1

    .line 83
    goto :goto_0

    .restart local v0    # "tabsContainer":Landroid/view/View;
    :cond_1
    move-object v0, v1

    .line 84
    goto :goto_1
.end method

.method private init()V
    .locals 2

    .prologue
    .line 34
    sget-object v0, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v0, v0, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 36
    new-instance v0, Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip$1;-><init>(Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;)V

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 50
    return-void
.end method

.method private updateTabsState(I)V
    .locals 4
    .param p1, "currentSelect"    # I

    .prologue
    .line 65
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;->getTabsContainer()Landroid/view/ViewGroup;

    move-result-object v1

    .line 66
    .local v1, "tabsContainer":Landroid/view/ViewGroup;
    if-nez v1, :cond_1

    .line 79
    :cond_0
    return-void

    .line 69
    :cond_1
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_0

    .line 70
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 71
    .local v2, "view":Landroid/view/View;
    instance-of v3, v2, Landroid/widget/TextView;

    if-eqz v3, :cond_2

    .line 72
    if-ne v0, p1, :cond_3

    .line 73
    check-cast v2, Landroid/widget/TextView;

    .end local v2    # "view":Landroid/view/View;
    const v3, -0xae7e48

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 69
    :cond_2
    :goto_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 75
    .restart local v2    # "view":Landroid/view/View;
    :cond_3
    check-cast v2, Landroid/widget/TextView;

    .end local v2    # "view":Landroid/view/View;
    const v3, -0x65ae7e48

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_1
.end method


# virtual methods
.method public notifyDataSetChanged()V
    .locals 1

    .prologue
    .line 54
    invoke-super {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->notifyDataSetChanged()V

    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;->updateTabsState(I)V

    .line 56
    return-void
.end method

.method public setViewPager(Landroid/support/v4/view/ViewPager;)V
    .locals 0
    .param p1, "pager"    # Landroid/support/v4/view/ViewPager;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    .line 61
    invoke-super {p0, p1}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->setViewPager(Landroid/support/v4/view/ViewPager;)V

    .line 62
    return-void
.end method
