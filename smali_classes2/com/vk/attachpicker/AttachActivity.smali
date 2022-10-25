.class public Lcom/vk/attachpicker/AttachActivity;
.super Lcom/vkontakte/android/VKActivity;
.source "AttachActivity.java"

# interfaces
.implements Lcom/vkontakte/android/ui/ResulterProvider;
.implements Lcom/vk/attachpicker/SelectionContext$SelectionContextProvider;
.implements Lcom/vk/attachpicker/AttachResulter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/attachpicker/AttachActivity$FragmentAdapter;
    }
.end annotation


# static fields
.field private static final MONEY_ATTACH_BADGE_SEEN_KEY:Ljava/lang/String; = "MONEY_ATTACH_BADGE_SEEN"

.field private static final PREF_KEY:Ljava/lang/String; = "Attach_Prefs"


# instance fields
.field private attachCounterView:Lcom/vk/attachpicker/widget/AttachCounterView;

.field private bottomButton:Landroid/view/View;

.field private bottomSheetBehavior:Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;

.field private cancelView:Landroid/view/View;

.field private clickHandler:Landroid/view/View;

.field private enableGiftAttachment:Z

.field private enableGraffitiAttachment:Z

.field private enableMapAttachment:Z

.field private enableMoneyAttachment:Z

.field private giftUsers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private final giftsReceiver:Landroid/content/BroadcastReceiver;

.field private graffitiAvatar:Ljava/lang/String;

.field private graffitiTitle:Ljava/lang/String;

.field private final handler:Landroid/os/Handler;

.field private mainContent:Landroid/support/design/widget/CoordinatorLayout;

.field private moneyPeerId:I

.field private final moneyTransferReceiver:Landroid/content/BroadcastReceiver;

.field private final onSelectionUpdate:Lcom/vk/attachpicker/events/NotificationListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/attachpicker/events/NotificationListener",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private pager:Lcom/vk/attachpicker/widget/ContentViewPager;

.field private pagerAdapter:Lcom/vk/attachpicker/AttachActivity$FragmentAdapter;

.field private requestCode:I

.field private final selectionContext:Lcom/vk/attachpicker/SelectionContext;

.field private semiTransparentBgColor:I

.field private tabPosition:I

.field private tabPositionOffset:F

.field private tabs:Landroid/support/v7/widget/RecyclerView;

.field private tabsAdapter:Lcom/vk/attachpicker/adapter/TabsAdapter;

.field private tabsContainer:Landroid/widget/FrameLayout;

.field private tabsOverlay:Landroid/view/View;

.field private toolbarContainer:Lcom/vk/attachpicker/widget/ToolbarContainer;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/vkontakte/android/VKActivity;-><init>()V

    .line 72
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->handler:Landroid/os/Handler;

    .line 73
    new-instance v0, Lcom/vk/attachpicker/SelectionContext;

    invoke-direct {v0}, Lcom/vk/attachpicker/SelectionContext;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    .line 106
    new-instance v0, Lcom/vk/attachpicker/AttachActivity$1;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/AttachActivity$1;-><init>(Lcom/vk/attachpicker/AttachActivity;)V

    iput-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->giftsReceiver:Landroid/content/BroadcastReceiver;

    .line 113
    new-instance v0, Lcom/vk/attachpicker/AttachActivity$2;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/AttachActivity$2;-><init>(Lcom/vk/attachpicker/AttachActivity;)V

    iput-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->moneyTransferReceiver:Landroid/content/BroadcastReceiver;

    .line 625
    new-instance v0, Lcom/vk/attachpicker/AttachActivity$8;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/AttachActivity$8;-><init>(Lcom/vk/attachpicker/AttachActivity;)V

    iput-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->onSelectionUpdate:Lcom/vk/attachpicker/events/NotificationListener;

    return-void
.end method

.method static synthetic access$000(Lcom/vk/attachpicker/AttachActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;

    .prologue
    .line 67
    iget v0, p0, Lcom/vk/attachpicker/AttachActivity;->tabPosition:I

    return v0
.end method

.method static synthetic access$002(Lcom/vk/attachpicker/AttachActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;
    .param p1, "x1"    # I

    .prologue
    .line 67
    iput p1, p0, Lcom/vk/attachpicker/AttachActivity;->tabPosition:I

    return p1
.end method

.method static synthetic access$100(Lcom/vk/attachpicker/AttachActivity;)F
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;

    .prologue
    .line 67
    iget v0, p0, Lcom/vk/attachpicker/AttachActivity;->tabPositionOffset:F

    return v0
.end method

.method static synthetic access$1000(Lcom/vk/attachpicker/AttachActivity;)Landroid/support/design/widget/CoordinatorLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->mainContent:Landroid/support/design/widget/CoordinatorLayout;

    return-object v0
.end method

.method static synthetic access$102(Lcom/vk/attachpicker/AttachActivity;F)F
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;
    .param p1, "x1"    # F

    .prologue
    .line 67
    iput p1, p0, Lcom/vk/attachpicker/AttachActivity;->tabPositionOffset:F

    return p1
.end method

.method static synthetic access$1100(Lcom/vk/attachpicker/AttachActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/vk/attachpicker/AttachActivity;->finishInternal()V

    return-void
.end method

.method static synthetic access$1200(Lcom/vk/attachpicker/AttachActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/vk/attachpicker/AttachActivity;->updateAllowHorizontalScroll()V

    return-void
.end method

.method static synthetic access$1300(Lcom/vk/attachpicker/AttachActivity;)Landroid/widget/FrameLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->tabsContainer:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/vk/attachpicker/AttachActivity;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->bottomButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/vk/attachpicker/AttachActivity;)Lcom/vk/attachpicker/widget/ToolbarContainer;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->toolbarContainer:Lcom/vk/attachpicker/widget/ToolbarContainer;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/vk/attachpicker/AttachActivity;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->tabsOverlay:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/vk/attachpicker/AttachActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;

    .prologue
    .line 67
    iget v0, p0, Lcom/vk/attachpicker/AttachActivity;->semiTransparentBgColor:I

    return v0
.end method

.method static synthetic access$1800(Lcom/vk/attachpicker/AttachActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;
    .param p1, "x1"    # I

    .prologue
    .line 67
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/AttachActivity;->setStatusBarColor(I)V

    return-void
.end method

.method static synthetic access$1900(Lcom/vk/attachpicker/AttachActivity;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->cancelView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vk/attachpicker/AttachActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/vk/attachpicker/AttachActivity;->updateSelection()V

    return-void
.end method

.method static synthetic access$2000(Lcom/vk/attachpicker/AttachActivity;)Lcom/vk/attachpicker/widget/AttachCounterView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->attachCounterView:Lcom/vk/attachpicker/widget/AttachCounterView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vk/attachpicker/AttachActivity;)Landroid/support/v7/widget/RecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->tabs:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vk/attachpicker/AttachActivity;)Lcom/vk/attachpicker/SelectionContext;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vk/attachpicker/AttachActivity;)Lcom/vk/attachpicker/widget/ContentViewPager;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->pager:Lcom/vk/attachpicker/widget/ContentViewPager;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vk/attachpicker/AttachActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/vk/attachpicker/AttachActivity;->hideCancelButton()V

    return-void
.end method

.method static synthetic access$700(Lcom/vk/attachpicker/AttachActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/vk/attachpicker/AttachActivity;->showCancelButton()V

    return-void
.end method

.method static synthetic access$800(Lcom/vk/attachpicker/AttachActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/vk/attachpicker/AttachActivity;->onPageSelected()V

    return-void
.end method

.method static synthetic access$900(Lcom/vk/attachpicker/AttachActivity;)Lcom/vk/attachpicker/adapter/TabsAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/AttachActivity;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->tabsAdapter:Lcom/vk/attachpicker/adapter/TabsAdapter;

    return-object v0
.end method

.method private finishInternal()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 520
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->finish()V

    .line 521
    invoke-virtual {p0, v0, v0}, Lcom/vk/attachpicker/AttachActivity;->overridePendingTransition(II)V

    .line 522
    return-void
.end method

.method private handleOrientation(I)V
    .locals 4
    .param p1, "orientation"    # I

    .prologue
    const/high16 v3, 0x40400000    # 3.0f

    .line 525
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 526
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->bottomSheetBehavior:Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;

    invoke-static {}, Lcom/vk/core/util/Screen;->height()I

    move-result v1

    int-to-float v1, v1

    const v2, 0x3fe66666    # 1.8f

    mul-float/2addr v1, v2

    div-float/2addr v1, v3

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;->setPeekHeight(I)V

    .line 530
    :goto_0
    return-void

    .line 528
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->bottomSheetBehavior:Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;

    invoke-static {}, Lcom/vk/core/util/Screen;->height()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v3

    const/high16 v2, 0x40a00000    # 5.0f

    div-float/2addr v1, v2

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;->setPeekHeight(I)V

    goto :goto_0
.end method

.method private hideCancelButton()V
    .locals 4

    .prologue
    .line 542
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->cancelView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    .line 543
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/vk/attachpicker/AttachActivity$7;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/AttachActivity$7;-><init>(Lcom/vk/attachpicker/AttachActivity;)V

    .line 544
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xc8

    .line 550
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 551
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 552
    return-void
.end method

.method private initTabs()V
    .locals 9

    .prologue
    const v8, 0x7f02035c

    const/4 v4, 0x1

    .line 388
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 389
    .local v2, "tabInfos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;>;"
    new-instance v3, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;

    const v5, 0x7f0804e8

    invoke-static {}, Lcom/vk/attachpicker/AttachActivity$$Lambda$10;->lambdaFactory$()Lcom/vkontakte/android/functions/F0;

    move-result-object v6

    invoke-direct {v3, v8, v5, v6}, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;-><init>(IILcom/vkontakte/android/functions/F0;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 398
    new-instance v3, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;

    const v5, 0x7f02036b

    const v6, 0x7f0804e4

    invoke-static {}, Lcom/vk/attachpicker/AttachActivity$$Lambda$11;->lambdaFactory$()Lcom/vkontakte/android/functions/F0;

    move-result-object v7

    invoke-direct {v3, v5, v6, v7}, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;-><init>(IILcom/vkontakte/android/functions/F0;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 409
    iget-boolean v3, p0, Lcom/vk/attachpicker/AttachActivity;->enableGraffitiAttachment:Z

    if-eqz v3, :cond_0

    .line 410
    new-instance v3, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;

    const v5, 0x7f020367

    const v6, 0x7f0804cd

    invoke-static {p0}, Lcom/vk/attachpicker/AttachActivity$$Lambda$12;->lambdaFactory$(Lcom/vk/attachpicker/AttachActivity;)Lcom/vkontakte/android/functions/F0;

    move-result-object v7

    invoke-direct {v3, v5, v6, v7}, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;-><init>(IILcom/vkontakte/android/functions/F0;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 427
    :cond_0
    iget-boolean v3, p0, Lcom/vk/attachpicker/AttachActivity;->enableMoneyAttachment:Z

    if-eqz v3, :cond_1

    .line 428
    new-instance v0, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;

    const v3, 0x7f020201

    const v5, 0x7f08036b

    invoke-static {p0}, Lcom/vk/attachpicker/AttachActivity$$Lambda$13;->lambdaFactory$(Lcom/vk/attachpicker/AttachActivity;)Lcom/vkontakte/android/functions/F0;

    move-result-object v6

    invoke-direct {v0, v4, v3, v5, v6}, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;-><init>(ZIILcom/vkontakte/android/functions/F0;)V

    .line 447
    .local v0, "moneyTabInfo":Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;
    const/4 v1, 0x1

    .line 449
    .local v1, "seenBadge":Z
    if-nez v1, :cond_4

    move v3, v4

    :goto_0
    iput-boolean v3, v0, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;->showBadge:Z

    .line 451
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 454
    .end local v0    # "moneyTabInfo":Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;
    .end local v1    # "seenBadge":Z
    :cond_1
    iget-boolean v3, p0, Lcom/vk/attachpicker/AttachActivity;->enableGiftAttachment:Z

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/vk/attachpicker/AttachActivity;->giftUsers:Ljava/util/ArrayList;

    if-eqz v3, :cond_2

    .line 455
    new-instance v3, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;

    const v5, 0x7f020365

    const v6, 0x7f0804e6

    invoke-static {p0}, Lcom/vk/attachpicker/AttachActivity$$Lambda$14;->lambdaFactory$(Lcom/vk/attachpicker/AttachActivity;)Lcom/vkontakte/android/functions/F0;

    move-result-object v7

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;-><init>(ZIILcom/vkontakte/android/functions/F0;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 470
    :cond_2
    new-instance v3, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;

    const v4, 0x7f020359

    const v5, 0x7f0804e5

    invoke-static {}, Lcom/vk/attachpicker/AttachActivity$$Lambda$15;->lambdaFactory$()Lcom/vkontakte/android/functions/F0;

    move-result-object v6

    invoke-direct {v3, v4, v5, v6}, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;-><init>(IILcom/vkontakte/android/functions/F0;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 481
    iget-boolean v3, p0, Lcom/vk/attachpicker/AttachActivity;->enableMapAttachment:Z

    if-eqz v3, :cond_3

    .line 482
    new-instance v3, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;

    const v4, 0x7f02036d

    const v5, 0x7f0804e7

    invoke-static {}, Lcom/vk/attachpicker/AttachActivity$$Lambda$16;->lambdaFactory$()Lcom/vkontakte/android/functions/F0;

    move-result-object v6

    invoke-direct {v3, v4, v5, v6}, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;-><init>(IILcom/vkontakte/android/functions/F0;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 489
    :cond_3
    new-instance v3, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;

    const v4, 0x7f0804e9

    invoke-static {}, Lcom/vk/attachpicker/AttachActivity$$Lambda$17;->lambdaFactory$()Lcom/vkontakte/android/functions/F0;

    move-result-object v5

    invoke-direct {v3, v8, v4, v5}, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;-><init>(IILcom/vkontakte/android/functions/F0;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 496
    new-instance v3, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;

    const v4, 0x7f02037d

    const v5, 0x7f0804ea

    invoke-static {}, Lcom/vk/attachpicker/AttachActivity$$Lambda$18;->lambdaFactory$()Lcom/vkontakte/android/functions/F0;

    move-result-object v6

    invoke-direct {v3, v4, v5, v6}, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;-><init>(IILcom/vkontakte/android/functions/F0;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 504
    iget-object v3, p0, Lcom/vk/attachpicker/AttachActivity;->tabsAdapter:Lcom/vk/attachpicker/adapter/TabsAdapter;

    invoke-virtual {v3, v2}, Lcom/vk/attachpicker/adapter/TabsAdapter;->setItems(Ljava/util/ArrayList;)V

    .line 505
    return-void

    .line 449
    .restart local v0    # "moneyTabInfo":Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;
    .restart local v1    # "seenBadge":Z
    :cond_4
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private initViews()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 197
    invoke-direct {p0, v2}, Lcom/vk/attachpicker/AttachActivity;->setStatusBarColor(I)V

    .line 198
    const v0, 0x7f03018d

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/AttachActivity;->setContentView(I)V

    .line 200
    const v0, 0x7f100452

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/AttachActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->tabs:Landroid/support/v7/widget/RecyclerView;

    .line 201
    const v0, 0x7f100451

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/AttachActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->tabsContainer:Landroid/widget/FrameLayout;

    .line 202
    const v0, 0x7f100453

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/AttachActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->tabsOverlay:Landroid/view/View;

    .line 203
    const v0, 0x7f100454

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/AttachActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/widget/ToolbarContainer;

    iput-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->toolbarContainer:Lcom/vk/attachpicker/widget/ToolbarContainer;

    .line 204
    const v0, 0x7f1001ab

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/AttachActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/design/widget/CoordinatorLayout;

    iput-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->mainContent:Landroid/support/design/widget/CoordinatorLayout;

    .line 205
    const v0, 0x7f100335

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/AttachActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->clickHandler:Landroid/view/View;

    .line 206
    const v0, 0x7f10018c

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/AttachActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/widget/ContentViewPager;

    iput-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->pager:Lcom/vk/attachpicker/widget/ContentViewPager;

    .line 207
    const v0, 0x7f100455

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/AttachActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->bottomButton:Landroid/view/View;

    .line 208
    const v0, 0x7f100456

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/AttachActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/widget/AttachCounterView;

    iput-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->attachCounterView:Lcom/vk/attachpicker/widget/AttachCounterView;

    .line 209
    const v0, 0x7f100457

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/AttachActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->cancelView:Landroid/view/View;

    .line 211
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->toolbarContainer:Lcom/vk/attachpicker/widget/ToolbarContainer;

    invoke-static {}, Lcom/vk/attachpicker/AttachActivity$$Lambda$2;->lambdaFactory$()Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/ToolbarContainer;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 212
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->attachCounterView:Lcom/vk/attachpicker/widget/AttachCounterView;

    invoke-static {p0}, Lcom/vk/attachpicker/AttachActivity$$Lambda$3;->lambdaFactory$(Lcom/vk/attachpicker/AttachActivity;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/AttachCounterView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 215
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->cancelView:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/attachpicker/AttachActivity$$Lambda$4;->lambdaFactory$(Lcom/vk/attachpicker/AttachActivity;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 217
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->tabsContainer:Landroid/widget/FrameLayout;

    invoke-static {}, Lcom/vk/attachpicker/AttachActivity$$Lambda$5;->lambdaFactory$()Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 218
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->tabs:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/vk/attachpicker/widget/TabsLayoutManager;

    invoke-direct {v1, p0, v2, v2}, Lcom/vk/attachpicker/widget/TabsLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 219
    new-instance v0, Lcom/vk/attachpicker/adapter/TabsAdapter;

    new-instance v1, Lcom/vk/attachpicker/AttachActivity$3;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/AttachActivity$3;-><init>(Lcom/vk/attachpicker/AttachActivity;)V

    invoke-direct {v0, v1}, Lcom/vk/attachpicker/adapter/TabsAdapter;-><init>(Lcom/vk/attachpicker/adapter/TabsAdapter$CurrentSelectionProvider;)V

    iput-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->tabsAdapter:Lcom/vk/attachpicker/adapter/TabsAdapter;

    .line 230
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->tabsAdapter:Lcom/vk/attachpicker/adapter/TabsAdapter;

    invoke-static {p0}, Lcom/vk/attachpicker/AttachActivity$$Lambda$6;->lambdaFactory$(Lcom/vk/attachpicker/AttachActivity;)Lcom/vk/attachpicker/widget/OnItemClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/adapter/TabsAdapter;->setItemClickListener(Lcom/vk/attachpicker/widget/OnItemClickListener;)V

    .line 237
    invoke-direct {p0}, Lcom/vk/attachpicker/AttachActivity;->initTabs()V

    .line 238
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->tabs:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/vk/attachpicker/AttachActivity;->tabsAdapter:Lcom/vk/attachpicker/adapter/TabsAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 239
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->tabs:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/vk/attachpicker/AttachActivity$4;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/AttachActivity$4;-><init>(Lcom/vk/attachpicker/AttachActivity;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 246
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->mainContent:Landroid/support/design/widget/CoordinatorLayout;

    invoke-virtual {v0, v2}, Landroid/support/design/widget/CoordinatorLayout;->setStatusBarBackgroundColor(I)V

    .line 247
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->clickHandler:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/attachpicker/AttachActivity$$Lambda$7;->lambdaFactory$(Lcom/vk/attachpicker/AttachActivity;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 249
    new-instance v0, Lcom/vk/attachpicker/AttachActivity$FragmentAdapter;

    invoke-virtual {p0}, Lcom/vk/attachpicker/AttachActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/vk/attachpicker/AttachActivity$FragmentAdapter;-><init>(Lcom/vk/attachpicker/AttachActivity;Landroid/app/FragmentManager;)V

    iput-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->pagerAdapter:Lcom/vk/attachpicker/AttachActivity$FragmentAdapter;

    .line 250
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->pager:Lcom/vk/attachpicker/widget/ContentViewPager;

    iget-object v1, p0, Lcom/vk/attachpicker/AttachActivity;->pagerAdapter:Lcom/vk/attachpicker/AttachActivity$FragmentAdapter;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/ContentViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 252
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->pager:Lcom/vk/attachpicker/widget/ContentViewPager;

    new-instance v1, Lcom/vk/attachpicker/AttachActivity$5;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/AttachActivity$5;-><init>(Lcom/vk/attachpicker/AttachActivity;)V

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/ContentViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 288
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->pager:Lcom/vk/attachpicker/widget/ContentViewPager;

    invoke-static {v0}, Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;->from(Landroid/view/View;)Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->bottomSheetBehavior:Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;

    .line 289
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->bottomSheetBehavior:Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;->setHideable(Z)V

    .line 290
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->bottomSheetBehavior:Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;->setState(I)V

    .line 291
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->bottomSheetBehavior:Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;

    new-instance v1, Lcom/vk/attachpicker/AttachActivity$6;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/AttachActivity$6;-><init>(Lcom/vk/attachpicker/AttachActivity;)V

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;->setBottomSheetCallback(Lcom/vk/attachpicker/widget/VkBottomSheetBehavior$BottomSheetCallback;)V

    .line 354
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->pager:Lcom/vk/attachpicker/widget/ContentViewPager;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/ContentViewPager;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-static {p0}, Lcom/vk/attachpicker/AttachActivity$$Lambda$8;->lambdaFactory$(Lcom/vk/attachpicker/AttachActivity;)Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 356
    invoke-virtual {p0}, Lcom/vk/attachpicker/AttachActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    invoke-direct {p0, v0}, Lcom/vk/attachpicker/AttachActivity;->handleOrientation(I)V

    .line 358
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->pager:Lcom/vk/attachpicker/widget/ContentViewPager;

    invoke-static {p0}, Lcom/vk/attachpicker/AttachActivity$$Lambda$9;->lambdaFactory$(Lcom/vk/attachpicker/AttachActivity;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/attachpicker/util/Utils;->runOnPreDraw(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 361
    return-void
.end method

.method static synthetic lambda$initTabs$10()Landroid/app/Fragment;
    .locals 2

    .prologue
    .line 403
    new-instance v0, Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/AudioListFragment;-><init>()V

    .line 404
    .local v0, "audioListFragment":Lcom/vkontakte/android/fragments/AudioListFragment;
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/AudioListFragment;->setArguments(Landroid/os/Bundle;)V

    .line 405
    return-object v0
.end method

.method static synthetic lambda$initTabs$14()Landroid/app/Fragment;
    .locals 4

    .prologue
    .line 472
    new-instance v1, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;-><init>()V

    .line 473
    .local v1, "documentsChooserFragment":Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 474
    .local v0, "b":Landroid/os/Bundle;
    const-string/jumbo v2, "select"

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 475
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->setArguments(Landroid/os/Bundle;)V

    .line 477
    return-object v1
.end method

.method static synthetic lambda$initTabs$15()Landroid/app/Fragment;
    .locals 1

    .prologue
    .line 483
    new-instance v0, Lcom/vkontakte/android/fragments/location/CheckInFragment;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;-><init>()V

    .line 484
    .local v0, "checkInFragment":Lcom/vkontakte/android/fragments/location/CheckInFragment;
    return-object v0
.end method

.method static synthetic lambda$initTabs$16()Landroid/app/Fragment;
    .locals 1

    .prologue
    .line 492
    new-instance v0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;-><init>()V

    .line 493
    .local v0, "pickVKPhotoFragment":Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;
    return-object v0
.end method

.method static synthetic lambda$initTabs$17()Landroid/app/Fragment;
    .locals 1

    .prologue
    .line 499
    new-instance v0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;-><init>()V

    .line 501
    .local v0, "videoFragment":Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;
    return-object v0
.end method

.method static synthetic lambda$initTabs$9()Landroid/app/Fragment;
    .locals 4

    .prologue
    .line 390
    new-instance v1, Lcom/vk/attachpicker/fragment/GalleryFragment;

    invoke-direct {v1}, Lcom/vk/attachpicker/fragment/GalleryFragment;-><init>()V

    .line 391
    .local v1, "fragment":Lcom/vk/attachpicker/fragment/GalleryFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 392
    .local v0, "b":Landroid/os/Bundle;
    const-string/jumbo v2, "media_type"

    const/16 v3, 0x6f

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 393
    invoke-virtual {v1, v0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->setArguments(Landroid/os/Bundle;)V

    .line 394
    return-object v1
.end method

.method static synthetic lambda$initViews$1(Landroid/view/View;)V
    .locals 0
    .param p0, "v"    # Landroid/view/View;

    .prologue
    .line 211
    return-void
.end method

.method static synthetic lambda$initViews$4(Landroid/view/View;)V
    .locals 0
    .param p0, "v"    # Landroid/view/View;

    .prologue
    .line 217
    return-void
.end method

.method private onPageSelected()V
    .locals 0

    .prologue
    .line 372
    invoke-direct {p0}, Lcom/vk/attachpicker/AttachActivity;->updateAllowHorizontalScroll()V

    .line 373
    return-void
.end method

.method private setStatusBarColor(I)V
    .locals 2
    .param p1, "color"    # I

    .prologue
    .line 514
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 515
    invoke-virtual {p0}, Lcom/vk/attachpicker/AttachActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 517
    :cond_0
    return-void
.end method

.method private showCancelButton()V
    .locals 4

    .prologue
    .line 533
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->cancelView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 534
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->cancelView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    .line 535
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    .line 536
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xc8

    .line 537
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 538
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 539
    return-void
.end method

.method private updateAllowHorizontalScroll()V
    .locals 3

    .prologue
    .line 377
    iget-object v1, p0, Lcom/vk/attachpicker/AttachActivity;->bottomSheetBehavior:Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;->getState()I

    move-result v1

    const/4 v2, 0x3

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lcom/vk/attachpicker/AttachActivity;->tabsAdapter:Lcom/vk/attachpicker/adapter/TabsAdapter;

    invoke-virtual {v1}, Lcom/vk/attachpicker/adapter/TabsAdapter;->getItems()Ljava/util/ArrayList;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/attachpicker/AttachActivity;->pager:Lcom/vk/attachpicker/widget/ContentViewPager;

    invoke-virtual {v2}, Lcom/vk/attachpicker/widget/ContentViewPager;->getCurrentItem()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;

    iget-boolean v1, v1, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;->allowHorizontalScroll:Z

    if-eqz v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    .line 378
    .local v0, "allowNestedHorizontalScroll":Z
    :goto_0
    iget-object v1, p0, Lcom/vk/attachpicker/AttachActivity;->pager:Lcom/vk/attachpicker/widget/ContentViewPager;

    invoke-virtual {v1, v0}, Lcom/vk/attachpicker/widget/ContentViewPager;->setAllowNestedViewHorizontalScroll(Z)V

    .line 379
    return-void

    .line 377
    .end local v0    # "allowNestedHorizontalScroll":Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private updateSelection()V
    .locals 5

    .prologue
    .line 364
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lcom/vk/attachpicker/AttachActivity;->tabs:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 365
    iget-object v3, p0, Lcom/vk/attachpicker/AttachActivity;->tabs:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3, v1}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 366
    .local v2, "v":Landroid/view/View;
    iget-object v3, p0, Lcom/vk/attachpicker/AttachActivity;->tabs:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3, v2}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v0

    .line 367
    .local v0, "adapterPosition":I
    check-cast v2, Lcom/vk/attachpicker/widget/TabView;

    .end local v2    # "v":Landroid/view/View;
    iget v3, p0, Lcom/vk/attachpicker/AttachActivity;->tabPosition:I

    iget v4, p0, Lcom/vk/attachpicker/AttachActivity;->tabPositionOffset:F

    invoke-virtual {v2, v0, v3, v4}, Lcom/vk/attachpicker/widget/TabView;->setSelection(IIF)V

    .line 364
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 369
    .end local v0    # "adapterPosition":I
    :cond_0
    return-void
.end method


# virtual methods
.method public finish()V
    .locals 2

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->bottomSheetBehavior:Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;->setState(I)V

    .line 190
    return-void
.end method

.method public getSelectionContext()Lcom/vk/attachpicker/SelectionContext;
    .locals 1

    .prologue
    .line 384
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    return-object v0
.end method

.method synthetic lambda$initTabs$11()Landroid/app/Fragment;
    .locals 4

    .prologue
    .line 411
    new-instance v1, Lcom/vk/attachpicker/fragment/GraffitiFragment;

    invoke-direct {v1}, Lcom/vk/attachpicker/fragment/GraffitiFragment;-><init>()V

    .line 413
    .local v1, "graffitiFragment":Lcom/vk/attachpicker/fragment/GraffitiFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 414
    .local v0, "b":Landroid/os/Bundle;
    iget-object v2, p0, Lcom/vk/attachpicker/AttachActivity;->graffitiAvatar:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 415
    const-string/jumbo v2, "graffiti_avatar"

    iget-object v3, p0, Lcom/vk/attachpicker/AttachActivity;->graffitiAvatar:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 417
    :cond_0
    iget-object v2, p0, Lcom/vk/attachpicker/AttachActivity;->graffitiTitle:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 418
    const-string/jumbo v2, "graffiti_title"

    iget-object v3, p0, Lcom/vk/attachpicker/AttachActivity;->graffitiTitle:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 420
    :cond_1
    invoke-virtual {v1, v0}, Lcom/vk/attachpicker/fragment/GraffitiFragment;->setArguments(Landroid/os/Bundle;)V

    .line 422
    return-object v1
.end method

.method synthetic lambda$initTabs$12()Landroid/app/Fragment;
    .locals 4

    .prologue
    .line 433
    new-instance v1, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;-><init>()V

    .line 434
    .local v1, "moneyTransfersFragment":Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 435
    .local v0, "b":Landroid/os/Bundle;
    const-string/jumbo v2, "peer_id"

    iget v3, p0, Lcom/vk/attachpicker/AttachActivity;->moneyPeerId:I

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 436
    const-string/jumbo v2, "filter"

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 437
    const-string/jumbo v2, "allow_refresh"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 438
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->setArguments(Landroid/os/Bundle;)V

    .line 439
    return-object v1
.end method

.method synthetic lambda$initTabs$13()Landroid/app/Fragment;
    .locals 4

    .prologue
    .line 458
    new-instance v1, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;-><init>()V

    .line 460
    .local v1, "giftFragment":Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 462
    .local v0, "b":Landroid/os/Bundle;
    const-string/jumbo v2, "users"

    iget-object v3, p0, Lcom/vk/attachpicker/AttachActivity;->giftUsers:Ljava/util/ArrayList;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 464
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->setArguments(Landroid/os/Bundle;)V

    .line 466
    return-object v1
.end method

.method synthetic lambda$initViews$2(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 213
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {v0}, Lcom/vk/attachpicker/SelectionContext;->getPackedSelection()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/AttachActivity;->setResultAndFinish(Landroid/content/Intent;)V

    .line 214
    return-void
.end method

.method synthetic lambda$initViews$3(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 215
    invoke-virtual {p0}, Lcom/vk/attachpicker/AttachActivity;->finish()V

    return-void
.end method

.method synthetic lambda$initViews$5(I)V
    .locals 3
    .param p1, "position"    # I

    .prologue
    const/4 v0, 0x1

    .line 231
    iget-object v1, p0, Lcom/vk/attachpicker/AttachActivity;->bottomSheetBehavior:Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vk/attachpicker/AttachActivity;->bottomSheetBehavior:Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;->getState()I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_0

    .line 233
    iget-object v1, p0, Lcom/vk/attachpicker/AttachActivity;->pager:Lcom/vk/attachpicker/widget/ContentViewPager;

    iget-object v2, p0, Lcom/vk/attachpicker/AttachActivity;->pager:Lcom/vk/attachpicker/widget/ContentViewPager;

    invoke-virtual {v2}, Lcom/vk/attachpicker/widget/ContentViewPager;->getCurrentItem()I

    move-result v2

    sub-int/2addr v2, p1

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    if-gt v2, v0, :cond_1

    :goto_0
    invoke-virtual {v1, p1, v0}, Lcom/vk/attachpicker/widget/ContentViewPager;->setCurrentItem(IZ)V

    .line 234
    invoke-direct {p0}, Lcom/vk/attachpicker/AttachActivity;->updateSelection()V

    .line 236
    :cond_0
    return-void

    .line 233
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$initViews$6(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 247
    invoke-virtual {p0}, Lcom/vk/attachpicker/AttachActivity;->finish()V

    return-void
.end method

.method synthetic lambda$initViews$7()V
    .locals 2

    .prologue
    .line 354
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->bottomSheetBehavior:Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;

    iget-object v1, p0, Lcom/vk/attachpicker/AttachActivity;->pager:Lcom/vk/attachpicker/widget/ContentViewPager;

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/ContentViewPager;->getTop()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;->dispatchOnSlide(I)V

    return-void
.end method

.method synthetic lambda$initViews$8()V
    .locals 0

    .prologue
    .line 359
    invoke-direct {p0}, Lcom/vk/attachpicker/AttachActivity;->onPageSelected()V

    .line 360
    return-void
.end method

.method synthetic lambda$onCreate$0()V
    .locals 2

    .prologue
    .line 156
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->tabsContainer:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 157
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->bottomSheetBehavior:Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;->setState(I)V

    .line 158
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->pager:Lcom/vk/attachpicker/widget/ContentViewPager;

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/ContentViewPager;->getCurrentItem()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {v0}, Lcom/vk/attachpicker/SelectionContext;->selectionCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 181
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {v0}, Lcom/vk/attachpicker/SelectionContext;->clear()V

    .line 185
    :goto_0
    return-void

    .line 183
    :cond_0
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onBackPressed()V

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 509
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 510
    iget v0, p1, Landroid/content/res/Configuration;->orientation:I

    invoke-direct {p0, v0}, Lcom/vk/attachpicker/AttachActivity;->handleOrientation(I)V

    .line 511
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 122
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onCreate(Landroid/os/Bundle;)V

    .line 123
    invoke-virtual {p0, v4, v4}, Lcom/vk/attachpicker/AttachActivity;->overridePendingTransition(II)V

    .line 124
    invoke-static {p0}, Lcom/vk/core/util/KeyboardUtils;->setSoftInputModeNothing(Landroid/app/Activity;)V

    .line 126
    invoke-static {p0}, Lcom/vk/attachpicker/Picker;->init(Landroid/app/Activity;)V

    .line 127
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    .line 128
    const v0, 0x7f0f00bf

    invoke-static {p0, v0}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/vk/attachpicker/AttachActivity;->semiTransparentBgColor:I

    .line 130
    invoke-virtual {p0}, Lcom/vk/attachpicker/AttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "request_code"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/vk/attachpicker/AttachActivity;->requestCode:I

    .line 131
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {p0}, Lcom/vk/attachpicker/AttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "selection_limit"

    const/16 v3, 0xa

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/SelectionContext;->setLimit(I)V

    .line 132
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    iget v1, p0, Lcom/vk/attachpicker/AttachActivity;->requestCode:I

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/SelectionContext;->setRequestCode(I)V

    .line 134
    invoke-virtual {p0}, Lcom/vk/attachpicker/AttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "enable_map_attachment"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/attachpicker/AttachActivity;->enableMapAttachment:Z

    .line 135
    invoke-virtual {p0}, Lcom/vk/attachpicker/AttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "enable_gift_attachment"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/attachpicker/AttachActivity;->enableGiftAttachment:Z

    .line 136
    invoke-virtual {p0}, Lcom/vk/attachpicker/AttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "enable_graffiti_att"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/attachpicker/AttachActivity;->enableGraffitiAttachment:Z

    .line 137
    invoke-virtual {p0}, Lcom/vk/attachpicker/AttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "enable_money_attachment"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/attachpicker/AttachActivity;->enableMoneyAttachment:Z

    .line 139
    invoke-virtual {p0}, Lcom/vk/attachpicker/AttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "gift_users"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 140
    invoke-virtual {p0}, Lcom/vk/attachpicker/AttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "gift_users"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->giftUsers:Ljava/util/ArrayList;

    .line 143
    :cond_0
    invoke-virtual {p0}, Lcom/vk/attachpicker/AttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "money_peer_id"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/vk/attachpicker/AttachActivity;->moneyPeerId:I

    .line 146
    invoke-virtual {p0}, Lcom/vk/attachpicker/AttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "graffiti_avatar"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->graffitiAvatar:Ljava/lang/String;

    .line 147
    invoke-virtual {p0}, Lcom/vk/attachpicker/AttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "graffiti_title"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->graffitiTitle:Ljava/lang/String;

    .line 149
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->giftsReceiver:Landroid/content/BroadcastReceiver;

    new-instance v1, Landroid/content/IntentFilter;

    const-string/jumbo v2, "com.vkontakte.android.ACTION_GIFT_SENT"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {p0, v0, v1, v2, v5}, Lcom/vk/attachpicker/AttachActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 150
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->moneyTransferReceiver:Landroid/content/BroadcastReceiver;

    new-instance v1, Landroid/content/IntentFilter;

    const-string/jumbo v2, "com.vkontakte.android.ACTION_MONEY_TRANSFER_SENT"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {p0, v0, v1, v2, v5}, Lcom/vk/attachpicker/AttachActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 151
    invoke-direct {p0}, Lcom/vk/attachpicker/AttachActivity;->initViews()V

    .line 152
    invoke-static {}, Lcom/vk/attachpicker/events/NotificationCenter;->getInstance()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v0

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vk/attachpicker/AttachActivity;->onSelectionUpdate:Lcom/vk/attachpicker/events/NotificationListener;

    invoke-virtual {v0, v1, v2}, Lcom/vk/attachpicker/events/NotificationCenter;->addListener(ILcom/vk/attachpicker/events/NotificationListener;)V

    .line 154
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->handler:Landroid/os/Handler;

    invoke-static {p0}, Lcom/vk/attachpicker/AttachActivity$$Lambda$1;->lambdaFactory$(Lcom/vk/attachpicker/AttachActivity;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x40

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 161
    invoke-static {}, Lcom/vk/attachpicker/util/PickerStickers;->loadFromServer()V

    .line 162
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 172
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onDestroy()V

    .line 173
    invoke-static {}, Lcom/vk/attachpicker/events/NotificationCenter;->getInstance()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/attachpicker/AttachActivity;->onSelectionUpdate:Lcom/vk/attachpicker/events/NotificationListener;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/events/NotificationCenter;->removeListener(Lcom/vk/attachpicker/events/NotificationListener;)V

    .line 174
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->giftsReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/AttachActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 175
    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity;->moneyTransferReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/AttachActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 176
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 166
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onResume()V

    .line 167
    invoke-direct {p0}, Lcom/vk/attachpicker/AttachActivity;->onPageSelected()V

    .line 168
    return-void
.end method

.method public registerActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V
    .locals 0
    .param p1, "result"    # Lcom/vkontakte/android/ui/ActivityResulter;

    .prologue
    .line 557
    return-void
.end method

.method public setResultAndFinish(Landroid/content/Intent;)V
    .locals 1
    .param p1, "result"    # Landroid/content/Intent;

    .prologue
    .line 566
    if-nez p1, :cond_0

    .line 567
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/AttachActivity;->setResult(I)V

    .line 568
    invoke-virtual {p0}, Lcom/vk/attachpicker/AttachActivity;->finish()V

    .line 573
    :goto_0
    return-void

    .line 570
    :cond_0
    const/4 v0, -0x1

    invoke-virtual {p0, v0, p1}, Lcom/vk/attachpicker/AttachActivity;->setResult(ILandroid/content/Intent;)V

    .line 571
    invoke-virtual {p0}, Lcom/vk/attachpicker/AttachActivity;->finish()V

    goto :goto_0
.end method

.method public superFinish()V
    .locals 0

    .prologue
    .line 193
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->finish()V

    .line 194
    return-void
.end method

.method public unregisterActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V
    .locals 0
    .param p1, "result"    # Lcom/vkontakte/android/ui/ActivityResulter;

    .prologue
    .line 562
    return-void
.end method
