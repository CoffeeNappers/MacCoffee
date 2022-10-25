.class public Lcom/vkontakte/android/fragments/GamesFragment;
.super Lcom/vkontakte/android/fragments/CardRecyclerFragment;
.source "GamesFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$OnNeedLoadNextPage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/GamesFragment$Adapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/CardRecyclerFragment",
        "<",
        "Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;",
        ">;",
        "Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$OnNeedLoadNextPage;"
    }
.end annotation


# static fields
.field static final INDEX_HTML5_CATALOG:I = 0x0

.field static final INDEX_MY_CATALOG:I = 0x1

.field static final INDEX_NEW_CATALOG:I = 0x2


# instance fields
.field private adapter:Lcom/vkontakte/android/fragments/GamesFragment$Adapter;

.field private catalogLoaderHtml5:Lcom/vkontakte/android/api/apps/CatalogLoader;

.field private catalogLoaderMy:Lcom/vkontakte/android/api/apps/CatalogLoader;

.field private catalogLoaderNew:Lcom/vkontakte/android/api/apps/CatalogLoader;

.field private drawablesList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;",
            ">;>;"
        }
    .end annotation
.end field

.field private gameBannersHolder:Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;

.field private receiver1:Landroid/content/BroadcastReceiver;

.field private receiver2:Landroid/content/BroadcastReceiver;

.field private receiverDeleteRequest:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 107
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;-><init>(I)V

    .line 56
    iput-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment;->gameBannersHolder:Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;

    .line 62
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->drawablesList:Ljava/util/ArrayList;

    .line 64
    new-instance v0, Lcom/vkontakte/android/fragments/GamesFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/GamesFragment$1;-><init>(Lcom/vkontakte/android/fragments/GamesFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->receiver1:Landroid/content/BroadcastReceiver;

    .line 73
    new-instance v0, Lcom/vkontakte/android/fragments/GamesFragment$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/GamesFragment$2;-><init>(Lcom/vkontakte/android/fragments/GamesFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->receiver2:Landroid/content/BroadcastReceiver;

    .line 82
    new-instance v0, Lcom/vkontakte/android/fragments/GamesFragment$3;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/GamesFragment$3;-><init>(Lcom/vkontakte/android/fragments/GamesFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->receiverDeleteRequest:Landroid/content/BroadcastReceiver;

    .line 96
    iput-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment;->adapter:Lcom/vkontakte/android/fragments/GamesFragment$Adapter;

    .line 98
    iput-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment;->catalogLoaderHtml5:Lcom/vkontakte/android/api/apps/CatalogLoader;

    .line 99
    iput-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment;->catalogLoaderMy:Lcom/vkontakte/android/api/apps/CatalogLoader;

    .line 100
    iput-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment;->catalogLoaderNew:Lcom/vkontakte/android/api/apps/CatalogLoader;

    .line 108
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/GamesFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesFragment;

    .prologue
    .line 54
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesFragment;->refresh()V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/GamesFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesFragment;

    .prologue
    .line 54
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesFragment;->refresh()V

    return-void
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/GamesFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesFragment;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->drawablesList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/fragments/GamesFragment;)Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesFragment;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->gameBannersHolder:Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;

    return-object v0
.end method

.method static synthetic access$1102(Lcom/vkontakte/android/fragments/GamesFragment;Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;)Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GamesFragment;->gameBannersHolder:Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;

    return-object p1
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/GamesFragment;)Lcom/vkontakte/android/fragments/GamesFragment$Adapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesFragment;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->adapter:Lcom/vkontakte/android/fragments/GamesFragment$Adapter;

    return-object v0
.end method

.method static synthetic access$502(Lcom/vkontakte/android/fragments/GamesFragment;Lcom/vkontakte/android/api/apps/CatalogLoader;)Lcom/vkontakte/android/api/apps/CatalogLoader;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/api/apps/CatalogLoader;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GamesFragment;->catalogLoaderHtml5:Lcom/vkontakte/android/api/apps/CatalogLoader;

    return-object p1
.end method

.method static synthetic access$602(Lcom/vkontakte/android/fragments/GamesFragment;Lcom/vkontakte/android/api/apps/CatalogLoader;)Lcom/vkontakte/android/api/apps/CatalogLoader;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/api/apps/CatalogLoader;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GamesFragment;->catalogLoaderMy:Lcom/vkontakte/android/api/apps/CatalogLoader;

    return-object p1
.end method

.method static synthetic access$702(Lcom/vkontakte/android/fragments/GamesFragment;Lcom/vkontakte/android/api/apps/CatalogLoader;)Lcom/vkontakte/android/api/apps/CatalogLoader;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/api/apps/CatalogLoader;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GamesFragment;->catalogLoaderNew:Lcom/vkontakte/android/api/apps/CatalogLoader;

    return-object p1
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/GamesFragment;Ljava/util/List;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesFragment;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Z

    .prologue
    .line 54
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/GamesFragment;->onDataLoaded(Ljava/util/List;Z)V

    return-void
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/GamesFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesFragment;

    .prologue
    .line 54
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/GamesFragment;->startHidingRequests()V

    return-void
.end method

.method public static createArgs(Ljava/lang/String;)Landroid/os/Bundle;
    .locals 2
    .param p0, "vs"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 103
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v1, "visitSource"

    invoke-static {v0, v1, p0}, Lcom/vkontakte/android/utils/Utils;->writeString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method private fadeDrawablesAndHideRequests()V
    .locals 3

    .prologue
    .line 234
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment;->drawablesList:Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/vkontakte/android/data/Games;->fadeDrawables(Ljava/util/ArrayList;)V

    .line 235
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment;->drawablesList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 237
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment;->adapter:Lcom/vkontakte/android/fragments/GamesFragment$Adapter;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment;->adapter:Lcom/vkontakte/android/fragments/GamesFragment$Adapter;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;

    iget-object v1, v1, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->requests:Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment;->adapter:Lcom/vkontakte/android/fragments/GamesFragment$Adapter;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;

    iget-object v1, v1, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->requests:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 239
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 240
    .local v0, "toBeMarkedAsRead":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment;->adapter:Lcom/vkontakte/android/fragments/GamesFragment$Adapter;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->res:Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;

    iget-object v1, v1, Lcom/vkontakte/android/api/apps/AppsGetGamesPage$Result;->requests:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 242
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/vkontakte/android/data/Games;->markRequestsAsRead(Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 244
    .end local v0    # "toBeMarkedAsRead":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    :cond_0
    return-void
.end method

.method private startHidingRequests()V
    .locals 4

    .prologue
    .line 223
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesFragment;->getView()Landroid/view/View;

    move-result-object v0

    .line 224
    .local v0, "view":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 225
    invoke-static {p0}, Lcom/vkontakte/android/fragments/GamesFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/GamesFragment;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 231
    :cond_0
    return-void
.end method


# virtual methods
.method public doLoadData()V
    .locals 2

    .prologue
    .line 181
    new-instance v0, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;

    invoke-direct {v0}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;-><init>()V

    new-instance v1, Lcom/vkontakte/android/fragments/GamesFragment$4;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/GamesFragment$4;-><init>(Lcom/vkontakte/android/fragments/GamesFragment;Landroid/app/Fragment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/apps/AppsGetGamesPage;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 219
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 220
    return-void
.end method

.method protected doLoadData(II)V
    .locals 0
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 177
    return-void
.end method

.method protected bridge synthetic getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 1

    .prologue
    .line 54
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesFragment;->getAdapter()Lcom/vkontakte/android/fragments/GamesFragment$Adapter;

    move-result-object v0

    return-object v0
.end method

.method protected getAdapter()Lcom/vkontakte/android/fragments/GamesFragment$Adapter;
    .locals 2

    .prologue
    .line 169
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->adapter:Lcom/vkontakte/android/fragments/GamesFragment$Adapter;

    if-nez v0, :cond_0

    .line 170
    new-instance v0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/GamesFragment;Lcom/vkontakte/android/fragments/GamesFragment$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->adapter:Lcom/vkontakte/android/fragments/GamesFragment$Adapter;

    .line 172
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->adapter:Lcom/vkontakte/android/fragments/GamesFragment$Adapter;

    return-object v0
.end method

.method synthetic lambda$startHidingRequests$0()V
    .locals 1

    .prologue
    .line 226
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesFragment;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 227
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/GamesFragment;->fadeDrawablesAndHideRequests()V

    .line 229
    :cond_0
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    .line 151
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onAttach(Landroid/app/Activity;)V

    .line 152
    const v0, 0x7f080252

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/GamesFragment;->setTitle(I)V

    .line 153
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/GamesFragment;->setHasOptionsMenu(Z)V

    .line 154
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x0

    .line 130
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 131
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment;->receiverDeleteRequest:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string/jumbo v3, "com.vkontakte.android.games.DELETE_REQUEST"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 132
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment;->receiver1:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string/jumbo v3, "com.vkontakte.android.games.RELOAD_REQUESTS"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 133
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment;->receiver2:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string/jumbo v3, "com.vkontakte.android.games.RELOAD_INSTALLED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 134
    const-string/jumbo v0, "games_visit"

    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    const-string/jumbo v1, "visit_source"

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "visitSource"

    const-string/jumbo v4, "direct"

    invoke-static {v2, v3, v4}, Lcom/vkontakte/android/utils/Utils;->readString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 135
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 139
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment;->receiverDeleteRequest:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 141
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment;->receiver1:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 142
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment;->receiver2:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    :goto_0
    invoke-super {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onDestroy()V

    .line 147
    return-void

    .line 143
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onNeedLoadNextPage(I)V
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 469
    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->catalogLoaderNew:Lcom/vkontakte/android/api/apps/CatalogLoader;

    if-eqz v0, :cond_0

    .line 470
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->catalogLoaderNew:Lcom/vkontakte/android/api/apps/CatalogLoader;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/apps/CatalogLoader;->forceLoadNextPage()Z

    .line 472
    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->catalogLoaderMy:Lcom/vkontakte/android/api/apps/CatalogLoader;

    if-eqz v0, :cond_1

    .line 473
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->catalogLoaderMy:Lcom/vkontakte/android/api/apps/CatalogLoader;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/apps/CatalogLoader;->forceLoadNextPage()Z

    .line 475
    :cond_1
    if-nez p1, :cond_2

    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->catalogLoaderHtml5:Lcom/vkontakte/android/api/apps/CatalogLoader;

    if-eqz v0, :cond_2

    .line 476
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->catalogLoaderHtml5:Lcom/vkontakte/android/api/apps/CatalogLoader;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/apps/CatalogLoader;->forceLoadNextPage()Z

    .line 478
    :cond_2
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->gameBannersHolder:Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;

    if-eqz v0, :cond_0

    .line 123
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->gameBannersHolder:Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;->getInfiniteViewPager()Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;->onPause()V

    .line 125
    :cond_0
    invoke-super {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onPause()V

    .line 126
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 114
    invoke-super {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onResume()V

    .line 115
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->gameBannersHolder:Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;

    if-eqz v0, :cond_0

    .line 116
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->gameBannersHolder:Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameBannersHolder;->getInfiniteViewPager()Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/ViewPagerInfinite;->onResume()V

    .line 118
    :cond_0
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 158
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 159
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->isTablet:Z

    if-eqz v0, :cond_0

    .line 160
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const v1, -0x141210

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setBackgroundColor(I)V

    .line 162
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesFragment;->loadData()V

    .line 163
    return-void
.end method
