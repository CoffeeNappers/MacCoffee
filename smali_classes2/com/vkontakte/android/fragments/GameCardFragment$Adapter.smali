.class Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;
.super Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;
.source "GameCardFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/GameCardFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Adapter"
.end annotation


# static fields
.field static final TYPE_APP_INFO:I = 0x7f10002e

.field static final TYPE_BG:I = 0x7f10002f

.field static final TYPE_BUTTON_SHOW_ALL:I = 0x7f100030

.field static final TYPE_FEED_ENTRY_WITHOUT_DATE:I = 0x7f100032

.field static final TYPE_FEED_ENTRY_WITH_DATE:I = 0x7f100031

.field static final TYPE_INVITE:I = 0x7f100034

.field static final TYPE_LEADER_BOARD_ITEM:I = 0x7f100035

.field static final TYPE_LOADER:I = 0x7f100036

.field static final TYPE_NEWS_TITLE:I = 0x7f100037

.field static final TYPE_REQUEST:I = 0x7f100038

.field static final TYPE_SETTING_BUTTON:I = 0x7f100039

.field static final TYPE_SHARE_BUTTON:I = 0x7f10003a

.field static final TYPE_TITLE:I = 0x7f100033


# instance fields
.field apiApplication:Lcom/vkontakte/android/data/ApiApplication;

.field blockActivity:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;",
            ">;"
        }
    .end annotation
.end field

.field blockAppInfo:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

.field blockAppInfoRef:Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;

.field blockLeaderboard:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;",
            ">;"
        }
    .end annotation
.end field

.field blockLoader:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

.field blockNews:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

.field blockPaddingBottom:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

.field blockRequests:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;",
            ">;"
        }
    .end annotation
.end field

.field blockSettings:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;",
            ">;"
        }
    .end annotation
.end field

.field fragment:Lcom/vkontakte/android/fragments/GameCardFragment;

.field final onClickListener:Landroid/view/View$OnClickListener;

.field res:Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

.field showAllRequest:Z

.field showNews:Z


# direct methods
.method public constructor <init>(Landroid/view/View$OnClickListener;Lcom/vkontakte/android/fragments/GameCardFragment;)V
    .locals 2
    .param p1, "onClickListener"    # Landroid/view/View$OnClickListener;
    .param p2, "fragment"    # Lcom/vkontakte/android/fragments/GameCardFragment;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 560
    invoke-direct {p0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;-><init>()V

    .line 540
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockAppInfo:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 541
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockPaddingBottom:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 542
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    .line 543
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockActivity:Ljava/util/ArrayList;

    .line 544
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockSettings:Ljava/util/ArrayList;

    .line 545
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockLeaderboard:Ljava/util/ArrayList;

    .line 546
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockNews:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 547
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockLoader:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 549
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockAppInfoRef:Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;

    .line 551
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

    .line 553
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->showNews:Z

    .line 554
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->showAllRequest:Z

    .line 561
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->onClickListener:Landroid/view/View$OnClickListener;

    .line 562
    iput-object p2, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->fragment:Lcom/vkontakte/android/fragments/GameCardFragment;

    .line 563
    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;

    .prologue
    .line 475
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->fillRequests()V

    return-void
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;
    .param p1, "x1"    # Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;
    .param p2, "x2"    # Landroid/app/Activity;
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 475
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->fillGamePage(Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method private fillGamePage(Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;Landroid/app/Activity;Ljava/lang/String;)V
    .locals 11
    .param p1, "res"    # Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const v10, 0x7f100033

    const v9, 0x7f02011e

    const v8, 0x7f10002f

    .line 650
    iget-object v4, p1, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->application:Lcom/vkontakte/android/data/ApiApplication;

    iput-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    .line 651
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

    .line 654
    iget-object v4, p1, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->application:Lcom/vkontakte/android/data/ApiApplication;

    if-eqz v4, :cond_0

    iget-object v4, p1, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->application:Lcom/vkontakte/android/data/ApiApplication;

    iget-boolean v4, v4, Lcom/vkontakte/android/data/ApiApplication;->installed:Z

    if-nez v4, :cond_0

    .line 655
    const v4, 0x7f10002e

    new-instance v5, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;

    iget-object v6, p1, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->application:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v7, p1, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->userPlayed:Ljava/util/ArrayList;

    invoke-direct {v5, v6, v7}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;-><init>(Lcom/vkontakte/android/data/ApiApplication;Ljava/util/ArrayList;)V

    iput-object v5, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockAppInfoRef:Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$Ref;

    invoke-static {v4, v5}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->topBottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockAppInfo:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 658
    :cond_0
    const v4, 0x7f02005d

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v8, v4}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->bottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockPaddingBottom:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 660
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->fillRequests()V

    .line 663
    iget-object v4, p1, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->application:Lcom/vkontakte/android/data/ApiApplication;

    if-eqz v4, :cond_1

    iget-object v4, p1, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->application:Lcom/vkontakte/android/data/ApiApplication;

    iget-boolean v4, v4, Lcom/vkontakte/android/data/ApiApplication;->installed:Z

    if-eqz v4, :cond_1

    .line 664
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockSettings:Ljava/util/ArrayList;

    .line 665
    iget-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockSettings:Ljava/util/ArrayList;

    const v5, 0x7f100039

    iget-object v6, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->fragment:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v5, v6}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->top(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 666
    iget-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockSettings:Ljava/util/ArrayList;

    const v5, 0x7f02011f

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v8, v5}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 667
    iget-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockSettings:Ljava/util/ArrayList;

    const v5, 0x7f10003a

    iget-object v6, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->fragment:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v5, v6}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->bottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 670
    :cond_1
    iget-object v4, p1, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->gameLeaderboards:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    .line 671
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockLeaderboard:Ljava/util/ArrayList;

    .line 672
    iget-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockLeaderboard:Ljava/util/ArrayList;

    const v5, 0x7f080264

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v10, v5}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->top(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 673
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v4, p1, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->gameLeaderboards:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v2, v4, :cond_2

    const/4 v4, 0x5

    if-ge v2, v4, :cond_2

    .line 674
    new-instance v0, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder$Data;

    iget-object v4, p1, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->gameLeaderboards:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/data/GameLeaderboard;

    add-int/lit8 v5, v2, 0x1

    invoke-direct {v0, v4, v5}, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder$Data;-><init>(Lcom/vkontakte/android/data/GameLeaderboard;I)V

    .line 675
    .local v0, "data":Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder$Data;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockLeaderboard:Ljava/util/ArrayList;

    const v5, 0x7f100035

    invoke-static {v5, v0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 673
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 677
    .end local v0    # "data":Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder$Data;
    :cond_2
    iget-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockLeaderboard:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockPaddingBottom:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 679
    .end local v2    # "i":I
    :cond_3
    iget-object v4, p1, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->feed:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_6

    .line 680
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockActivity:Ljava/util/ArrayList;

    .line 681
    invoke-virtual {p2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f080258

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 682
    .local v3, "title":Ljava/lang/String;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockActivity:Ljava/util/ArrayList;

    invoke-static {v10, v3}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->top(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 683
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_1
    iget-object v4, p1, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->feed:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v2, v4, :cond_5

    .line 684
    iget-object v4, p1, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->feed:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/GameFeedEntry;

    .line 685
    .local v1, "gameFeedEntry":Lcom/vkontakte/android/data/GameFeedEntry;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockActivity:Ljava/util/ArrayList;

    const v5, 0x7f100031

    invoke-static {v5, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 686
    iget-object v4, p1, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->feed:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ge v2, v4, :cond_4

    .line 687
    iget-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockActivity:Ljava/util/ArrayList;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v8, v5}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 683
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 690
    .end local v1    # "gameFeedEntry":Lcom/vkontakte/android/data/GameFeedEntry;
    :cond_5
    iget-object v4, p1, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->feed:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x1

    if-le v4, v5, :cond_7

    .line 691
    iget-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockActivity:Ljava/util/ArrayList;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v8, v5}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 692
    iget-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockActivity:Ljava/util/ArrayList;

    const v5, 0x7f100030

    new-instance v6, Lcom/vkontakte/android/ui/holder/gamepage/GameButtonShowAll$Ref;

    const v7, 0x7f08068b

    invoke-static {p0, p3, p2}, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;Ljava/lang/String;Landroid/app/Activity;)Landroid/view/View$OnClickListener;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lcom/vkontakte/android/ui/holder/gamepage/GameButtonShowAll$Ref;-><init>(ILandroid/view/View$OnClickListener;)V

    invoke-static {v5, v6}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->bottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 699
    .end local v2    # "i":I
    .end local v3    # "title":Ljava/lang/String;
    :cond_6
    :goto_2
    new-instance v0, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$Data;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    iget v4, v4, Lcom/vkontakte/android/data/ApiApplication;->author_group:I

    iget-boolean v5, p1, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->isMember:Z

    invoke-direct {v0, v4, v5}, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$Data;-><init>(IZ)V

    .line 700
    .local v0, "data":Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$Data;
    const v4, 0x7f100037

    invoke-static {v4, v0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->none(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockNews:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 701
    const v4, 0x7f100036

    invoke-static {v4, v0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->none(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockLoader:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 702
    return-void

    .line 695
    .end local v0    # "data":Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$Data;
    .restart local v2    # "i":I
    .restart local v3    # "title":Ljava/lang/String;
    :cond_7
    iget-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockActivity:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockPaddingBottom:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2
.end method

.method private fillRequests()V
    .locals 10

    .prologue
    const v9, 0x7f100038

    const v8, 0x7f100033

    const v7, 0x7f080277

    const v6, 0x7f10002f

    const v5, 0x7f02011e

    .line 608
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    .line 609
    const/4 v0, 0x0

    .line 610
    .local v0, "allCount":I
    const/4 v2, 0x0

    .line 611
    .local v2, "showedCount":I
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

    iget-object v3, v3, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->requestsServer:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 612
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

    iget-object v3, v3, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->requestsServer:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/2addr v0, v3

    .line 613
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    .line 614
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v8, v4}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->top(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 615
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

    iget-object v3, v3, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->requestsServer:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_1

    .line 616
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

    iget-object v4, v4, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->requestsServer:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v9, v4}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 617
    add-int/lit8 v2, v2, 0x1

    .line 618
    if-eqz v1, :cond_0

    .line 619
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v6, v4}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 615
    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 623
    .end local v1    # "i":I
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

    iget-object v3, v3, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->requestsDb:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_8

    .line 624
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

    iget-object v3, v3, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->requestsDb:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/2addr v0, v3

    .line 625
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    if-nez v3, :cond_2

    .line 626
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    .line 627
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v8, v4}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->top(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 629
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

    iget-object v3, v3, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->requestsDb:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .restart local v1    # "i":I
    :goto_1
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

    iget-object v3, v3, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->requestsDb:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x3

    if-gt v1, v3, :cond_3

    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->showAllRequest:Z

    if-eqz v3, :cond_5

    :cond_3
    if-ltz v1, :cond_5

    .line 630
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_4

    .line 631
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v6, v4}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 633
    :cond_4
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

    iget-object v4, v4, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->requestsDb:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v9, v4}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 634
    add-int/lit8 v2, v2, 0x1

    .line 629
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 636
    :cond_5
    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->showAllRequest:Z

    if-nez v3, :cond_7

    if-ge v2, v0, :cond_7

    .line 637
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v6, v4}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 638
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    const v4, 0x7f100030

    new-instance v5, Lcom/vkontakte/android/ui/holder/gamepage/GameButtonShowAll$Ref;

    const v6, 0x7f08027e

    iget-object v7, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->onClickListener:Landroid/view/View$OnClickListener;

    invoke-direct {v5, v6, v7}, Lcom/vkontakte/android/ui/holder/gamepage/GameButtonShowAll$Ref;-><init>(ILandroid/view/View$OnClickListener;)V

    invoke-static {v4, v5}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->bottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 645
    .end local v1    # "i":I
    :cond_6
    :goto_2
    return-void

    .line 640
    .restart local v1    # "i":I
    :cond_7
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockPaddingBottom:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 642
    .end local v1    # "i":I
    :cond_8
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    if-eqz v3, :cond_6

    .line 643
    iget-object v3, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockPaddingBottom:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2
.end method


# virtual methods
.method public build()V
    .locals 1

    .prologue
    .line 576
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->showNews:Z

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->build(Z)V

    .line 577
    return-void
.end method

.method public build(Z)V
    .locals 2
    .param p1, "showNews"    # Z

    .prologue
    .line 580
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->showNews:Z

    .line 581
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 583
    .local v0, "data":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;>;"
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockAppInfo:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    if-eqz v1, :cond_0

    .line 584
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockAppInfo:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 587
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 588
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 590
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockActivity:Ljava/util/ArrayList;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockActivity:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 591
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockActivity:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 593
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockLeaderboard:Ljava/util/ArrayList;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockLeaderboard:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    .line 594
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockLeaderboard:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 596
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockSettings:Ljava/util/ArrayList;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockSettings:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    .line 597
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockSettings:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 599
    :cond_4
    if-eqz p1, :cond_6

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockNews:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    if-eqz v1, :cond_6

    .line 600
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockNews:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 604
    :cond_5
    :goto_0
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->setData(Ljava/util/List;)V

    .line 605
    return-void

    .line 601
    :cond_6
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->fragment:Lcom/vkontakte/android/fragments/GameCardFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/GameCardFragment;->items:Ljava/util/ArrayList;

    if-eqz v1, :cond_7

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->fragment:Lcom/vkontakte/android/fragments/GameCardFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/GameCardFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 602
    :cond_7
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->blockLoader:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method synthetic lambda$fillGamePage$0(Ljava/lang/String;Landroid/app/Activity;Landroid/view/View;)V
    .locals 2
    .param p1, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "v"    # Landroid/view/View;

    .prologue
    .line 693
    const-class v0, Lcom/vkontakte/android/fragments/GamesFeedFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    iget v1, v1, Lcom/vkontakte/android/data/ApiApplication;->id:I

    invoke-static {p1, v1}, Lcom/vkontakte/android/fragments/GamesFeedFragment;->createArgs(Ljava/lang/String;I)Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v0, v1, p2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 475
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 11
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    const/4 v6, 0x1

    const/4 v10, 0x0

    .line 493
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 494
    .local v2, "ctx":Landroid/content/Context;
    packed-switch p2, :pswitch_data_0

    .line 534
    const/4 v3, 0x0

    :goto_0
    return-object v3

    .line 496
    :pswitch_0
    new-instance v3, Lcom/vkontakte/android/ui/holder/commons/LoaderHolder;

    invoke-direct {v3, p1}, Lcom/vkontakte/android/ui/holder/commons/LoaderHolder;-><init>(Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 498
    :pswitch_1
    new-instance v3, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;

    invoke-direct {v3, v2, p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;-><init>(Landroid/content/Context;Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    goto :goto_0

    .line 500
    :pswitch_2
    new-instance v3, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;

    invoke-direct {v3, p1, v6}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;-><init>(Landroid/view/ViewGroup;Z)V

    .line 501
    .local v3, "holder":Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;
    iget-object v6, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->fragment:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/GameCardFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    const-string/jumbo v7, "visitSource"

    const-string/jumbo v8, "direct"

    invoke-static {v6, v7, v8}, Lcom/vkontakte/android/utils/Utils;->readString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->fragment:Lcom/vkontakte/android/fragments/GameCardFragment;

    .line 502
    invoke-virtual {v7}, Lcom/vkontakte/android/fragments/GameCardFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v7

    const-string/jumbo v8, "clickSource"

    const-string/jumbo v9, "catalog"

    invoke-static {v7, v8, v9}, Lcom/vkontakte/android/utils/Utils;->readString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 501
    invoke-virtual {v3, v10, v6, v7}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->setClickInfo(ZLjava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;

    goto :goto_0

    .line 505
    .end local v3    # "holder":Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;
    :pswitch_3
    new-instance v3, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;

    invoke-direct {v3, p1, v10}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;-><init>(Landroid/view/ViewGroup;Z)V

    .line 506
    .restart local v3    # "holder":Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;
    iget-object v6, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->fragment:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/GameCardFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    const-string/jumbo v7, "visitSource"

    const-string/jumbo v8, "direct"

    invoke-static {v6, v7, v8}, Lcom/vkontakte/android/utils/Utils;->readString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->fragment:Lcom/vkontakte/android/fragments/GameCardFragment;

    .line 507
    invoke-virtual {v7}, Lcom/vkontakte/android/fragments/GameCardFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v7

    const-string/jumbo v8, "clickSource"

    const-string/jumbo v9, "catalog"

    invoke-static {v7, v8, v9}, Lcom/vkontakte/android/utils/Utils;->readString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 506
    invoke-virtual {v3, v10, v6, v7}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->setClickInfo(ZLjava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;

    goto :goto_0

    .line 510
    .end local v3    # "holder":Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;
    :pswitch_4
    new-instance v3, Lcom/vkontakte/android/ui/holder/gamepage/GameButtonShowAll;

    invoke-direct {v3, v2}, Lcom/vkontakte/android/ui/holder/gamepage/GameButtonShowAll;-><init>(Landroid/content/Context;)V

    goto :goto_0

    .line 512
    :pswitch_5
    invoke-static {p1}, Lcom/vkontakte/android/ui/holder/commons/TitleHolder;->darkGrayTitle(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/commons/TitleHolder;

    move-result-object v3

    goto :goto_0

    .line 514
    :pswitch_6
    new-instance v3, Lcom/vkontakte/android/ui/holder/commons/BackgroundHolder;

    invoke-direct {v3, p1}, Lcom/vkontakte/android/ui/holder/commons/BackgroundHolder;-><init>(Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 516
    :pswitch_7
    new-instance v3, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;

    invoke-direct {v3, v2, v6}, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;-><init>(Landroid/content/Context;Z)V

    goto :goto_0

    .line 518
    :pswitch_8
    new-instance v3, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;

    invoke-direct {v3, v2, v10}, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;-><init>(Landroid/content/Context;Z)V

    goto :goto_0

    .line 520
    :pswitch_9
    new-instance v3, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;

    invoke-direct {v3, v2}, Lcom/vkontakte/android/ui/holder/gamepage/GameLeaderboardHolder;-><init>(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 522
    :pswitch_a
    new-instance v3, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;

    invoke-direct {v3, v2}, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;-><init>(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 524
    :pswitch_b
    new-instance v4, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->fragment:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/GameCardFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    const-string/jumbo v7, "visitSource"

    const-string/jumbo v8, "direct"

    invoke-static {v6, v7, v8}, Lcom/vkontakte/android/utils/Utils;->readString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;

    invoke-direct {v7}, Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;-><init>()V

    invoke-direct {v4, v2, v6, v7}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;)V

    .line 525
    .local v4, "inviteHolder":Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;
    iget-object v0, v4, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->drawable:Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;

    .line 526
    .local v0, "bgDrawable":Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;
    iget-object v6, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->fragment:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$2000(Lcom/vkontakte/android/fragments/GameCardFragment;)Ljava/util/ArrayList;

    move-result-object v6

    new-instance v7, Ljava/lang/ref/WeakReference;

    invoke-direct {v7, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v3, v4

    .line 527
    goto/16 :goto_0

    .line 529
    .end local v0    # "bgDrawable":Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;
    .end local v4    # "inviteHolder":Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;
    :pswitch_c
    new-instance v5, Lcom/vkontakte/android/ui/holder/gamepage/GameRequestHolder;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->fragment:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/GameCardFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    const-string/jumbo v7, "visitSource"

    const-string/jumbo v8, "direct"

    invoke-static {v6, v7, v8}, Lcom/vkontakte/android/utils/Utils;->readString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;

    invoke-direct {v7}, Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;-><init>()V

    const v8, 0x7f03003c

    invoke-direct {v5, v2, v6, v7, v8}, Lcom/vkontakte/android/ui/holder/gamepage/GameRequestHolder;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;I)V

    .line 530
    .local v5, "requestHolder":Lcom/vkontakte/android/ui/holder/gamepage/GameRequestHolder;
    iget-object v1, v5, Lcom/vkontakte/android/ui/holder/gamepage/GameRequestHolder;->drawable:Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;

    .line 531
    .local v1, "bgDrawableRequest":Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;
    iget-object v6, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->fragment:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$2000(Lcom/vkontakte/android/fragments/GameCardFragment;)Ljava/util/ArrayList;

    move-result-object v6

    new-instance v7, Ljava/lang/ref/WeakReference;

    invoke-direct {v7, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v3, v5

    .line 532
    goto/16 :goto_0

    .line 494
    nop

    :pswitch_data_0
    .packed-switch 0x7f10002e
        :pswitch_1
        :pswitch_6
        :pswitch_4
        :pswitch_2
        :pswitch_3
        :pswitch_5
        :pswitch_b
        :pswitch_9
        :pswitch_0
        :pswitch_a
        :pswitch_c
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method public removeRequests(Lcom/vkontakte/android/data/GameRequest;Landroid/app/Activity;)V
    .locals 1
    .param p1, "request"    # Lcom/vkontakte/android/data/GameRequest;
    .param p2, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 566
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

    if-eqz v0, :cond_0

    .line 567
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

    iget-object v0, v0, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->requestsServer:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 568
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

    iget-object v0, v0, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->requestsServerReal:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 569
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;

    iget-object v0, v0, Lcom/vkontakte/android/api/apps/AppsGetGamePage$Result;->requestsDb:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 570
    invoke-static {p2}, Lcom/vkontakte/android/data/db/Database;->getInst(Landroid/content/Context;)Lcom/vkontakte/android/data/db/Database;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/data/db/Database;->removeRequest(Lcom/vkontakte/android/data/GameRequest;)V

    .line 571
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/GameCardFragment$Adapter;->fillRequests()V

    .line 573
    :cond_0
    return-void
.end method
