.class public Lcom/vk/music/fragment/MusicPromoFragment;
.super Landroid/app/Fragment;
.source "MusicPromoFragment.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;
.implements Landroid/view/View$OnClickListener;
.implements Lcom/vkontakte/android/fragments/BackListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/fragment/MusicPromoFragment$Adapter;,
        Lcom/vk/music/fragment/MusicPromoFragment$Item;,
        Lcom/vk/music/fragment/MusicPromoFragment$Builder;
    }
.end annotation


# instance fields
.field private adapter:Lcom/vk/music/fragment/MusicPromoFragment$Adapter;

.field private button:Landroid/widget/TextView;

.field private pageIndicator:Lcom/vkontakte/android/ui/widget/PageIndicator;

.field private viewPager:Landroid/support/v4/view/ViewPager;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 29
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 57
    new-instance v0, Lcom/vk/music/fragment/MusicPromoFragment$Adapter;

    invoke-static {}, Lcom/vk/music/fragment/MusicPromoFragment;->createItems()[Lcom/vk/music/fragment/MusicPromoFragment$Item;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/music/fragment/MusicPromoFragment$Adapter;-><init>([Lcom/vk/music/fragment/MusicPromoFragment$Item;)V

    iput-object v0, p0, Lcom/vk/music/fragment/MusicPromoFragment;->adapter:Lcom/vk/music/fragment/MusicPromoFragment$Adapter;

    return-void
.end method

.method private static createItems()[Lcom/vk/music/fragment/MusicPromoFragment$Item;
    .locals 7

    .prologue
    .line 101
    const/4 v1, 0x4

    new-array v0, v1, [Lcom/vk/music/fragment/MusicPromoFragment$Item;

    .line 102
    .local v0, "items":[Lcom/vk/music/fragment/MusicPromoFragment$Item;
    const/4 v1, 0x0

    new-instance v2, Lcom/vk/music/fragment/MusicPromoFragment$Item;

    const v3, 0x7f0803da

    const v4, 0x7f0803d6

    const v5, 0x7f0803d2

    const v6, 0x7f02030f

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/vk/music/fragment/MusicPromoFragment$Item;-><init>(IIII)V

    aput-object v2, v0, v1

    .line 104
    const/4 v1, 0x1

    new-instance v2, Lcom/vk/music/fragment/MusicPromoFragment$Item;

    const v3, 0x7f0803db

    const v4, 0x7f0803d7

    const v5, 0x7f0803d3

    const v6, 0x7f020312

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/vk/music/fragment/MusicPromoFragment$Item;-><init>(IIII)V

    aput-object v2, v0, v1

    .line 106
    const/4 v1, 0x2

    new-instance v2, Lcom/vk/music/fragment/MusicPromoFragment$Item;

    const v3, 0x7f0803dc

    const v4, 0x7f0803d8

    const v5, 0x7f0803d4

    const v6, 0x7f020313

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/vk/music/fragment/MusicPromoFragment$Item;-><init>(IIII)V

    aput-object v2, v0, v1

    .line 108
    const/4 v1, 0x3

    new-instance v2, Lcom/vk/music/fragment/MusicPromoFragment$Item;

    const v3, 0x7f0803dd

    const v4, 0x7f0803d9

    const v5, 0x7f0803d5

    const v6, 0x7f020310

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/vk/music/fragment/MusicPromoFragment$Item;-><init>(IIII)V

    aput-object v2, v0, v1

    .line 110
    return-object v0
.end method

.method private musicIntroWasShowed()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 114
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->editCurrent()Lcom/vkontakte/android/auth/VKAccountEditor;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/auth/VKAccountEditor;->setMusicIntro(Z)Lcom/vkontakte/android/auth/VKAccountEditor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccountEditor;->commit()V

    .line 115
    new-instance v0, Lcom/vkontakte/android/api/account/AccountSetInfo;

    invoke-direct {v0}, Lcom/vkontakte/android/api/account/AccountSetInfo;-><init>()V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/account/AccountSetInfo;->setMusicIntro(Z)Lcom/vkontakte/android/api/account/AccountSetInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/api/account/AccountSetInfo;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 116
    return-void
.end method


# virtual methods
.method public onBackPressed()Z
    .locals 1

    .prologue
    .line 122
    invoke-direct {p0}, Lcom/vk/music/fragment/MusicPromoFragment;->musicIntroWasShowed()V

    .line 123
    const/4 v0, 0x0

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 130
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 140
    :goto_0
    return-void

    .line 132
    :pswitch_0
    iget-object v0, p0, Lcom/vk/music/fragment/MusicPromoFragment;->viewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 133
    invoke-virtual {p0}, Lcom/vk/music/fragment/MusicPromoFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 134
    invoke-direct {p0}, Lcom/vk/music/fragment/MusicPromoFragment;->musicIntroWasShowed()V

    goto :goto_0

    .line 136
    :cond_0
    iget-object v0, p0, Lcom/vk/music/fragment/MusicPromoFragment;->viewPager:Landroid/support/v4/view/ViewPager;

    iget-object v1, p0, Lcom/vk/music/fragment/MusicPromoFragment;->viewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    goto :goto_0

    .line 130
    nop

    :pswitch_data_0
    .packed-switch 0x7f10010f
        :pswitch_0
    .end packed-switch
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 82
    invoke-super {p0, p1}, Landroid/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 83
    iget-object v0, p0, Lcom/vk/music/fragment/MusicPromoFragment;->viewPager:Landroid/support/v4/view/ViewPager;

    if-eqz v0, :cond_0

    .line 84
    iget-object v0, p0, Lcom/vk/music/fragment/MusicPromoFragment;->viewPager:Landroid/support/v4/view/ViewPager;

    iget-object v1, p0, Lcom/vk/music/fragment/MusicPromoFragment;->adapter:Lcom/vk/music/fragment/MusicPromoFragment$Adapter;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 88
    :goto_0
    return-void

    .line 86
    :cond_0
    iget-object v0, p0, Lcom/vk/music/fragment/MusicPromoFragment;->adapter:Lcom/vk/music/fragment/MusicPromoFragment$Adapter;

    invoke-virtual {v0}, Lcom/vk/music/fragment/MusicPromoFragment$Adapter;->notifyDataSetChanged()V

    goto :goto_0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 65
    const v1, 0x7f030146

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 67
    .local v0, "view":Landroid/view/View;
    const v1, 0x7f10018c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v4/view/ViewPager;

    iput-object v1, p0, Lcom/vk/music/fragment/MusicPromoFragment;->viewPager:Landroid/support/v4/view/ViewPager;

    .line 68
    iget-object v1, p0, Lcom/vk/music/fragment/MusicPromoFragment;->viewPager:Landroid/support/v4/view/ViewPager;

    iget-object v2, p0, Lcom/vk/music/fragment/MusicPromoFragment;->adapter:Lcom/vk/music/fragment/MusicPromoFragment$Adapter;

    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 69
    iget-object v1, p0, Lcom/vk/music/fragment/MusicPromoFragment;->viewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1, p0}, Landroid/support/v4/view/ViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 71
    const v1, 0x7f1002cf

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/widget/PageIndicator;

    iput-object v1, p0, Lcom/vk/music/fragment/MusicPromoFragment;->pageIndicator:Lcom/vkontakte/android/ui/widget/PageIndicator;

    .line 72
    iget-object v1, p0, Lcom/vk/music/fragment/MusicPromoFragment;->pageIndicator:Lcom/vkontakte/android/ui/widget/PageIndicator;

    iget-object v2, p0, Lcom/vk/music/fragment/MusicPromoFragment;->adapter:Lcom/vk/music/fragment/MusicPromoFragment$Adapter;

    invoke-virtual {v2}, Lcom/vk/music/fragment/MusicPromoFragment$Adapter;->getCount()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/widget/PageIndicator;->setCountOfPages(I)V

    .line 74
    const v1, 0x7f10010f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vk/music/fragment/MusicPromoFragment;->button:Landroid/widget/TextView;

    .line 75
    iget-object v1, p0, Lcom/vk/music/fragment/MusicPromoFragment;->button:Landroid/widget/TextView;

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 77
    return-object v0
.end method

.method public onDestroyView()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 92
    iget-object v0, p0, Lcom/vk/music/fragment/MusicPromoFragment;->viewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0, p0}, Landroid/support/v4/view/ViewPager;->removeOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 93
    iput-object v1, p0, Lcom/vk/music/fragment/MusicPromoFragment;->viewPager:Landroid/support/v4/view/ViewPager;

    .line 94
    iput-object v1, p0, Lcom/vk/music/fragment/MusicPromoFragment;->pageIndicator:Lcom/vkontakte/android/ui/widget/PageIndicator;

    .line 95
    iput-object v1, p0, Lcom/vk/music/fragment/MusicPromoFragment;->button:Landroid/widget/TextView;

    .line 97
    invoke-super {p0}, Landroid/app/Fragment;->onDestroyView()V

    .line 98
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 156
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 146
    return-void
.end method

.method public onPageSelected(I)V
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 150
    iget-object v0, p0, Lcom/vk/music/fragment/MusicPromoFragment;->pageIndicator:Lcom/vkontakte/android/ui/widget/PageIndicator;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/vkontakte/android/ui/widget/PageIndicator;->setIndexOfCurrentPage(IZ)V

    .line 151
    iget-object v0, p0, Lcom/vk/music/fragment/MusicPromoFragment;->button:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/vk/music/fragment/MusicPromoFragment;->adapter:Lcom/vk/music/fragment/MusicPromoFragment$Adapter;

    iget-object v1, v1, Lcom/vk/music/fragment/MusicPromoFragment$Adapter;->items:[Lcom/vk/music/fragment/MusicPromoFragment$Item;

    aget-object v1, v1, p1

    iget v1, v1, Lcom/vk/music/fragment/MusicPromoFragment$Item;->button:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;)V

    .line 152
    return-void
.end method
