.class Lcom/vkontakte/android/fragments/GamesFragment$Adapter;
.super Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;
.source "GamesFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/GamesFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Adapter"
.end annotation


# static fields
.field static final TYPE_APPS:I = 0x7

.field static final TYPE_BANNERS:I = 0x6

.field static final TYPE_BG:I = 0x0

.field static final TYPE_BUTTON_SHOW_ALL:I = 0x3

.field static final TYPE_FEED:I = 0x5

.field static final TYPE_HORIZONTAL_BLOCK:I = 0x4

.field static final TYPE_REQUEST:I = 0x2

.field static final TYPE_TITLE:I = 0x1


# instance fields
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

.field blockApps:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

.field blockBanners:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

.field blockHtml5Catalog:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

.field blockMyCatalog:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

.field blockNewCatalog:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

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

.field res:Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/GamesFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/GamesFragment;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 247
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;-><init>()V

    .line 306
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    .line 307
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockMyCatalog:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 308
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockHtml5Catalog:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 309
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockNewCatalog:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 310
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockActivity:Ljava/util/ArrayList;

    .line 311
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockBanners:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 312
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockApps:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 313
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockPaddingBottom:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 315
    iput-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/GamesFragment;Lcom/vkontakte/android/fragments/GamesFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/GamesFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/GamesFragment$1;

    .prologue
    .line 247
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/GamesFragment;)V

    return-void
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/GamesFragment$Adapter;Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesFragment$Adapter;
    .param p1, "x1"    # Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;
    .param p2, "x2"    # Landroid/app/Activity;
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 247
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->fillGamePage(Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method private fillGamePage(Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;Landroid/app/Activity;Ljava/lang/String;)V
    .locals 20
    .param p1, "res"    # Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;
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
    .line 399
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;

    .line 401
    const/4 v3, 0x0

    const v4, 0x7f02005d

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->bottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockPaddingBottom:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 404
    invoke-direct/range {p0 .. p3}, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->fillGameRequest(Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;Landroid/app/Activity;Ljava/lang/String;)V

    .line 407
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->html5Catalog:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    iget-boolean v3, v3, Lcom/vkontakte/android/auth/VKAccount;->htmlGamesEnabled:Z

    if-eqz v3, :cond_0

    .line 408
    new-instance v2, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;

    const v3, 0x7f08030c

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    move-object/from16 v0, p1

    iget-object v6, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->html5Catalog:Ljava/util/ArrayList;

    new-instance v7, Lcom/vkontakte/android/data/CatalogInfo;

    const v8, 0x7f08030c

    sget-object v9, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->html5:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    invoke-direct {v7, v8, v9}, Lcom/vkontakte/android/data/CatalogInfo;-><init>(ILcom/vkontakte/android/data/CatalogInfo$FilterType;)V

    const/4 v9, 0x1

    move-object/from16 v8, p3

    invoke-direct/range {v2 .. v9}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;-><init>(IILcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$OnNeedLoadNextPage;Ljava/util/ArrayList;Lcom/vkontakte/android/data/CatalogInfo;Ljava/lang/String;Z)V

    .line 411
    .local v2, "data":Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;
    const/4 v3, 0x4

    invoke-static {v3, v2}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockHtml5Catalog:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 415
    .end local v2    # "data":Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    iget-boolean v3, v3, Lcom/vkontakte/android/auth/VKAccount;->htmlGamesEnabled:Z

    if-eqz v3, :cond_3

    move-object/from16 v0, p1

    iget-object v6, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->myCatalogHtml5:Ljava/util/ArrayList;

    .line 417
    .local v6, "myCatalog":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/ApiApplication;>;"
    :goto_0
    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 419
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    iget-boolean v3, v3, Lcom/vkontakte/android/auth/VKAccount;->htmlGamesEnabled:Z

    if-eqz v3, :cond_4

    const-string/jumbo v19, "html5"

    .line 421
    .local v19, "platform":Ljava/lang/String;
    :goto_1
    new-instance v2, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;

    const v3, 0x7f08031a

    const/4 v4, 0x1

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    new-instance v7, Lcom/vkontakte/android/data/CatalogInfo;

    const v8, 0x7f08031a

    sget-object v9, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->installed:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    move-object/from16 v0, v19

    invoke-direct {v7, v8, v9, v0}, Lcom/vkontakte/android/data/CatalogInfo;-><init>(ILcom/vkontakte/android/data/CatalogInfo$FilterType;Ljava/lang/String;)V

    const/4 v9, 0x1

    move-object/from16 v8, p3

    invoke-direct/range {v2 .. v9}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;-><init>(IILcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$OnNeedLoadNextPage;Ljava/util/ArrayList;Lcom/vkontakte/android/data/CatalogInfo;Ljava/lang/String;Z)V

    .line 424
    .restart local v2    # "data":Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;
    const/4 v3, 0x4

    invoke-static {v3, v2}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockMyCatalog:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 428
    .end local v2    # "data":Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;
    .end local v19    # "platform":Ljava/lang/String;
    :cond_1
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->newCatalog:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    .line 429
    new-instance v2, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;

    const v8, 0x7f08041a

    const/4 v9, 0x2

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    move-object/from16 v0, p1

    iget-object v11, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->newCatalog:Ljava/util/ArrayList;

    new-instance v12, Lcom/vkontakte/android/data/CatalogInfo;

    const v3, 0x7f08041a

    sget-object v4, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->filterNew:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    invoke-direct {v12, v3, v4}, Lcom/vkontakte/android/data/CatalogInfo;-><init>(ILcom/vkontakte/android/data/CatalogInfo$FilterType;)V

    const/4 v14, 0x0

    move-object v7, v2

    move-object/from16 v13, p3

    invoke-direct/range {v7 .. v14}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;-><init>(IILcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$OnNeedLoadNextPage;Ljava/util/ArrayList;Lcom/vkontakte/android/data/CatalogInfo;Ljava/lang/String;Z)V

    .line 432
    .restart local v2    # "data":Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;
    const/4 v3, 0x4

    invoke-static {v3, v2}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockNewCatalog:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 436
    .end local v2    # "data":Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;
    :cond_2
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockActivity:Ljava/util/ArrayList;

    .line 437
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->feed:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_6

    .line 438
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockActivity:Ljava/util/ArrayList;

    const/4 v4, 0x1

    const v5, 0x7f080258

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->top(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 439
    const/16 v18, 0x0

    .local v18, "i":I
    :goto_2
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->feed:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    move/from16 v0, v18

    if-ge v0, v3, :cond_5

    .line 440
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->feed:Ljava/util/ArrayList;

    move/from16 v0, v18

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/vkontakte/android/data/GameFeedEntry;

    .line 441
    .local v15, "gameFeedEntry":Lcom/vkontakte/android/data/GameFeedEntry;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockActivity:Ljava/util/ArrayList;

    const/4 v4, 0x5

    invoke-static {v4, v15}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 442
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockActivity:Ljava/util/ArrayList;

    const/4 v4, 0x0

    const v5, 0x7f02011e

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 439
    add-int/lit8 v18, v18, 0x1

    goto :goto_2

    .line 415
    .end local v6    # "myCatalog":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/ApiApplication;>;"
    .end local v15    # "gameFeedEntry":Lcom/vkontakte/android/data/GameFeedEntry;
    .end local v18    # "i":I
    :cond_3
    move-object/from16 v0, p1

    iget-object v6, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->myCatalog:Ljava/util/ArrayList;

    goto/16 :goto_0

    .line 419
    .restart local v6    # "myCatalog":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/ApiApplication;>;"
    :cond_4
    const-string/jumbo v19, "android"

    goto/16 :goto_1

    .line 444
    .restart local v18    # "i":I
    :cond_5
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockActivity:Ljava/util/ArrayList;

    const/4 v4, 0x3

    new-instance v5, Lcom/vkontakte/android/ui/holder/gamepage/GameButtonShowAll$Ref;

    const v7, 0x7f08068b

    move-object/from16 v0, p3

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/GamesFragment$Adapter$$Lambda$2;->lambdaFactory$(Ljava/lang/String;Landroid/app/Activity;)Landroid/view/View$OnClickListener;

    move-result-object v8

    invoke-direct {v5, v7, v8}, Lcom/vkontakte/android/ui/holder/gamepage/GameButtonShowAll$Ref;-><init>(ILandroid/view/View$OnClickListener;)V

    invoke-static {v4, v5}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->bottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 449
    .end local v18    # "i":I
    :cond_6
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->featuredCatalog:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_7

    .line 450
    const/4 v3, 0x6

    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->featuredCatalog:Ljava/util/ArrayList;

    invoke-static {v3, v4}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->top(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockBanners:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 454
    :cond_7
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->genres:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_9

    .line 455
    new-instance v17, Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;

    invoke-direct/range {v17 .. v17}, Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;-><init>()V

    .line 456
    .local v17, "genresData":Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;, "Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex<Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder$GenresData;>;"
    new-instance v3, Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder$GenresData;

    const/4 v4, 0x0

    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->catalog:Ljava/util/ArrayList;

    invoke-direct {v3, v4, v5}, Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder$GenresData;-><init>(Lcom/vkontakte/android/data/GameGenre;Ljava/util/ArrayList;)V

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;->add(Ljava/lang/Object;)Z

    .line 457
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->genres:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/vkontakte/android/data/GameGenre;

    .line 458
    .local v16, "genre":Lcom/vkontakte/android/data/GameGenre;
    new-instance v4, Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder$GenresData;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v16

    invoke-direct {v4, v0, v5}, Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder$GenresData;-><init>(Lcom/vkontakte/android/data/GameGenre;Ljava/util/ArrayList;)V

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 460
    .end local v16    # "genre":Lcom/vkontakte/android/data/GameGenre;
    :cond_8
    const/4 v3, 0x7

    move-object/from16 v0, v17

    invoke-static {v3, v0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->bottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockApps:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 462
    .end local v17    # "genresData":Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;, "Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex<Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder$GenresData;>;"
    :cond_9
    return-void
.end method

.method private fillGameRequest(Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;Landroid/app/Activity;Ljava/lang/String;)V
    .locals 10
    .param p1, "res"    # Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;
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
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 379
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    iget-boolean v1, v1, Lcom/vkontakte/android/auth/VKAccount;->htmlGamesEnabled:Z

    if-eqz v1, :cond_1

    iget-object v0, p1, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->invitesAndRequests:Ljava/util/ArrayList;

    .line 381
    .local v0, "requestsToShow":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    :goto_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    .line 382
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 383
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    invoke-virtual {p2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0015

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v5, v8, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v8, v2}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 384
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-le v1, v8, :cond_2

    .line 385
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v9, v2}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 386
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    const v2, 0x7f02011e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v7, v2}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 387
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    const/4 v2, 0x3

    new-instance v3, Lcom/vkontakte/android/ui/holder/gamepage/GameButtonShowAll$Ref;

    const v4, 0x7f08027d

    invoke-static {v0, p3, p2}, Lcom/vkontakte/android/fragments/GamesFragment$Adapter$$Lambda$1;->lambdaFactory$(Ljava/util/ArrayList;Ljava/lang/String;Landroid/app/Activity;)Landroid/view/View$OnClickListener;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/vkontakte/android/ui/holder/gamepage/GameButtonShowAll$Ref;-><init>(ILandroid/view/View$OnClickListener;)V

    invoke-static {v2, v3}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->bottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 394
    :cond_0
    :goto_1
    return-void

    .line 379
    .end local v0    # "requestsToShow":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    :cond_1
    iget-object v0, p1, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->invites:Ljava/util/ArrayList;

    goto :goto_0

    .line 390
    .restart local v0    # "requestsToShow":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v9, v2}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 391
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockPaddingBottom:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method static synthetic lambda$fillGamePage$1(Ljava/lang/String;Landroid/app/Activity;Landroid/view/View;)V
    .locals 2
    .param p0, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 445
    const-class v0, Lcom/vkontakte/android/fragments/GamesFeedFragment;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/GamesFeedFragment;->createArgs(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    return-void
.end method

.method static synthetic lambda$fillGameRequest$0(Ljava/util/ArrayList;Ljava/lang/String;Landroid/app/Activity;Landroid/view/View;)V
    .locals 2
    .param p0, "requestsToShow"    # Ljava/util/ArrayList;
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
    .line 388
    const-class v0, Lcom/vkontakte/android/fragments/GamesRequestFragment;

    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->createBundle(Ljava/util/ArrayList;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v0, v1, p2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public build()V
    .locals 3

    .prologue
    .line 344
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 346
    .local v0, "data":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;>;"
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 347
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockRequests:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 350
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockHtml5Catalog:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    if-eqz v1, :cond_1

    .line 351
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockHtml5Catalog:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 354
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockMyCatalog:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    if-eqz v1, :cond_2

    .line 355
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockMyCatalog:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 357
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockNewCatalog:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    if-eqz v1, :cond_3

    .line 358
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockNewCatalog:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 360
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockActivity:Ljava/util/ArrayList;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockActivity:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    .line 361
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockActivity:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 363
    :cond_4
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockBanners:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    if-eqz v1, :cond_5

    .line 364
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockBanners:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 366
    :cond_5
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockApps:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    if-eqz v1, :cond_6

    .line 367
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockApps:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    iget-object v1, v1, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->object:Ljava/lang/Object;

    check-cast v1, Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    iput v2, v1, Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;->index:I

    .line 368
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockApps:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 370
    :cond_6
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->setData(Ljava/util/List;)V

    .line 371
    return-void
.end method

.method clearNotificationOnApp(I)V
    .locals 1
    .param p1, "appId"    # I

    .prologue
    .line 326
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockMyCatalog:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockMyCatalog:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    iget-object v0, v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->object:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 327
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockMyCatalog:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    iget-object v0, v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->object:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;->clearNotificationOnApp(I)V

    .line 329
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockNewCatalog:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockNewCatalog:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    iget-object v0, v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->object:Ljava/lang/Object;

    if-eqz v0, :cond_1

    .line 330
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->blockNewCatalog:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    iget-object v0, v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->object:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;->clearNotificationOnApp(I)V

    .line 332
    :cond_1
    return-void
.end method

.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 297
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->data:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->type:I

    packed-switch v0, :pswitch_data_0

    .line 302
    :pswitch_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 300
    :pswitch_1
    const/4 v0, 0x2

    goto :goto_0

    .line 297
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 247
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 9
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 260
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 261
    .local v0, "ctx":Landroid/content/Context;
    iget-object v5, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/GamesFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    const-string/jumbo v6, "visitSource"

    const-string/jumbo v7, "direct"

    invoke-static {v5, v6, v7}, Lcom/vkontakte/android/utils/Utils;->readString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 262
    .local v4, "visitSource":Ljava/lang/String;
    packed-switch p2, :pswitch_data_0

    .line 291
    const/4 v1, 0x0

    :goto_0
    return-object v1

    .line 264
    :pswitch_0
    new-instance v1, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;

    const/4 v5, 0x0

    invoke-direct {v1, p1, v5}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;-><init>(Landroid/view/ViewGroup;Z)V

    .line 265
    .local v1, "holder":Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;
    const/4 v5, 0x1

    iget-object v6, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/GamesFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    const-string/jumbo v7, "visitSource"

    const-string/jumbo v8, "direct"

    invoke-static {v6, v7, v8}, Lcom/vkontakte/android/utils/Utils;->readString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "activity"

    invoke-virtual {v1, v5, v6, v7}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->setClickInfo(ZLjava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;

    goto :goto_0

    .line 268
    .end local v1    # "holder":Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;
    :pswitch_1
    new-instance v1, Lcom/vkontakte/android/ui/holder/gamepage/GameButtonShowAll;

    invoke-direct {v1, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameButtonShowAll;-><init>(Landroid/content/Context;)V

    goto :goto_0

    .line 270
    :pswitch_2
    invoke-static {p1}, Lcom/vkontakte/android/ui/holder/commons/TitleHolder;->darkGrayTitle(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/commons/TitleHolder;

    move-result-object v1

    goto :goto_0

    .line 272
    :pswitch_3
    new-instance v1, Lcom/vkontakte/android/ui/holder/commons/BackgroundHolder;

    invoke-direct {v1, p1}, Lcom/vkontakte/android/ui/holder/commons/BackgroundHolder;-><init>(Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 274
    :pswitch_4
    new-instance v2, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;

    new-instance v5, Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;

    invoke-direct {v5}, Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;-><init>()V

    invoke-direct {v2, v0, v4, v5}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;)V

    .line 275
    .local v2, "inviteHolder":Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;
    iget-object v5, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/GamesFragment;->access$1000(Lcom/vkontakte/android/fragments/GamesFragment;)Ljava/util/ArrayList;

    move-result-object v5

    new-instance v6, Ljava/lang/ref/WeakReference;

    iget-object v7, v2, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->drawable:Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;

    invoke-direct {v6, v7}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v1, v2

    .line 276
    goto :goto_0

    .line 278
    .end local v2    # "inviteHolder":Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;
    :pswitch_5
    new-instance v1, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;

    invoke-direct {v1, v0, v4}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 280
    :pswitch_6
    new-instance v1, Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder;

    invoke-direct {v1, p1, v4}, Lcom/vkontakte/android/ui/holder/gamepage/GameGenresHolder;-><init>(Landroid/view/ViewGroup;Ljava/lang/String;)V

    goto :goto_0

    .line 282
    :pswitch_7
    iget-object v5, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    new-instance v6, Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;

    invoke-direct {v6, v0, v4}, Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-static {v5, v6}, Lcom/vkontakte/android/fragments/GamesFragment;->access$1102(Lcom/vkontakte/android/fragments/GamesFragment;Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;)Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;

    .line 283
    iget-object v5, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/GamesFragment;->access$1100(Lcom/vkontakte/android/fragments/GamesFragment;)Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;->getInfiniteViewPager()Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;

    move-result-object v3

    .line 284
    .local v3, "pager":Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;
    iget-object v5, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/GamesFragment;->isResumed()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 285
    invoke-virtual {v3}, Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;->onResume()V

    .line 289
    :goto_1
    iget-object v5, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/GamesFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/GamesFragment;->access$1100(Lcom/vkontakte/android/fragments/GamesFragment;)Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;

    move-result-object v1

    goto :goto_0

    .line 287
    :cond_0
    invoke-virtual {v3}, Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;->onPause()V

    goto :goto_1

    .line 262
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_4
        :pswitch_1
        :pswitch_5
        :pswitch_0
        :pswitch_7
        :pswitch_6
    .end packed-switch
.end method

.method removeInvites(Lcom/vkontakte/android/data/GameRequest;Landroid/app/Activity;Ljava/lang/String;)V
    .locals 1
    .param p1, "request"    # Lcom/vkontakte/android/data/GameRequest;
    .param p2, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 335
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;

    if-eqz v0, :cond_0

    .line 336
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;

    iget-object v0, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->invites:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 337
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;

    iget-object v0, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->requests:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 338
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;

    iget-object v0, v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->invitesAndRequests:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 339
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;

    invoke-direct {p0, v0, p2, p3}, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->fillGameRequest(Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;Landroid/app/Activity;Ljava/lang/String;)V

    .line 341
    :cond_0
    return-void
.end method

.method setHorData(Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;Ljava/util/ArrayList;)V
    .locals 1
    .param p1, "data"    # Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 320
    .local p2, "apiApplications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/ApiApplication;>;"
    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->object:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 321
    iget-object v0, p1, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->object:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;

    iget-object v0, v0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;->appAdapter:Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;

    invoke-virtual {v0, p2}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;->setApiApplications(Ljava/util/ArrayList;)V

    .line 323
    :cond_0
    return-void
.end method
