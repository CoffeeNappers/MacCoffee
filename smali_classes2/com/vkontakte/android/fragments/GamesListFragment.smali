.class public Lcom/vkontakte/android/fragments/GamesListFragment;
.super Lcom/vkontakte/android/fragments/VKRecyclerFragment;
.source "GamesListFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder$GetterData;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/GamesListFragment$AppsAdapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/VKRecyclerFragment",
        "<",
        "Lcom/vkontakte/android/data/ApiApplication;",
        ">;",
        "Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder$GetterData;"
    }
.end annotation


# static fields
.field private static final KEY_CATALOG_INFO:Ljava/lang/String; = "key_filter"

.field private static final KEY_TITLE:Ljava/lang/String; = "key_title"


# instance fields
.field private adapter:Lcom/vkontakte/android/fragments/GamesListFragment$AppsAdapter;

.field private receiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 63
    const/16 v0, 0x32

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;-><init>(I)V

    .line 53
    new-instance v0, Lcom/vkontakte/android/fragments/GamesListFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/GamesListFragment$1;-><init>(Lcom/vkontakte/android/fragments/GamesListFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/GamesListFragment;->receiver:Landroid/content/BroadcastReceiver;

    .line 64
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/GamesListFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesListFragment;

    .prologue
    .line 35
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesListFragment;->refresh()V

    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/GamesListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesListFragment;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/GamesListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesListFragment;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/GamesListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesListFragment;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static createArgs(Lcom/vkontakte/android/data/CatalogInfo;ILjava/lang/String;)Landroid/os/Bundle;
    .locals 2
    .param p0, "info"    # Lcom/vkontakte/android/data/CatalogInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "titleRes"    # I
    .param p2, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 41
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 42
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v1, "key_filter"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 43
    const-string/jumbo v1, "key_title"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 44
    const-string/jumbo v1, "visitSource"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    return-object v0
.end method

.method private getCatalogInfo()Lcom/vkontakte/android/data/CatalogInfo;
    .locals 2

    .prologue
    .line 49
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "key_filter"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/CatalogInfo;

    return-object v0
.end method


# virtual methods
.method protected doLoadData(II)V
    .locals 3
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 99
    new-instance v0, Lcom/vkontakte/android/api/apps/AppsGetCatalog;

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/GamesListFragment;->getCatalogInfo()Lcom/vkontakte/android/data/CatalogInfo;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/data/CatalogInfo;->getServerKey()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/GamesListFragment;->getCatalogInfo()Lcom/vkontakte/android/data/CatalogInfo;

    move-result-object v2

    iget-object v2, v2, Lcom/vkontakte/android/data/CatalogInfo;->platform:Ljava/lang/String;

    invoke-direct {v0, v1, p1, p2, v2}, Lcom/vkontakte/android/api/apps/AppsGetCatalog;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/api/SimpleListCallback;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/api/SimpleListCallback;-><init>(Lme/grishka/appkit/fragments/BaseRecyclerFragment;)V

    .line 100
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/apps/AppsGetCatalog;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 101
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/os/Looper;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/GamesListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 102
    return-void
.end method

.method protected bridge synthetic getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 1

    .prologue
    .line 35
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesListFragment;->getAdapter()Lcom/vkontakte/android/fragments/GamesListFragment$AppsAdapter;

    move-result-object v0

    return-object v0
.end method

.method protected getAdapter()Lcom/vkontakte/android/fragments/GamesListFragment$AppsAdapter;
    .locals 2

    .prologue
    .line 117
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesListFragment;->adapter:Lcom/vkontakte/android/fragments/GamesListFragment$AppsAdapter;

    if-nez v0, :cond_0

    .line 118
    new-instance v0, Lcom/vkontakte/android/fragments/GamesListFragment$AppsAdapter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/GamesListFragment$AppsAdapter;-><init>(Lcom/vkontakte/android/fragments/GamesListFragment;Lcom/vkontakte/android/fragments/GamesListFragment$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/GamesListFragment;->adapter:Lcom/vkontakte/android/fragments/GamesListFragment$AppsAdapter;

    .line 120
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesListFragment;->adapter:Lcom/vkontakte/android/fragments/GamesListFragment$AppsAdapter;

    return-object v0
.end method

.method public getApiApplications()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;"
        }
    .end annotation

    .prologue
    .line 152
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 2
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    .line 68
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onAttach(Landroid/app/Activity;)V

    .line 69
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesListFragment;->loadData()V

    .line 70
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "key_title"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/GamesListFragment;->setTitle(I)V

    .line 71
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 82
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 83
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 84
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.vkontakte.android.games.RELOAD_INSTALLED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 85
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/GamesListFragment;->receiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 86
    return-void
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x0

    const/high16 v3, 0x41000000    # 8.0f

    .line 75
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    .line 76
    .local v0, "view":Landroid/view/View;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-virtual {v1, v4, v2, v4, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 77
    return-object v0
.end method

.method protected onDataLoaded(Ljava/util/List;Z)V
    .locals 4
    .param p2, "more"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 106
    .local p1, "d":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/ApiApplication;>;"
    if-eqz p1, :cond_0

    .line 107
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/GamesListFragment;->getCatalogInfo()Lcom/vkontakte/android/data/CatalogInfo;

    move-result-object v1

    .line 108
    .local v1, "catalogInfo":Lcom/vkontakte/android/data/CatalogInfo;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/ApiApplication;

    .line 109
    .local v0, "application":Lcom/vkontakte/android/data/ApiApplication;
    iput-object v1, v0, Lcom/vkontakte/android/data/ApiApplication;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    goto :goto_0

    .line 112
    .end local v0    # "application":Lcom/vkontakte/android/data/ApiApplication;
    .end local v1    # "catalogInfo":Lcom/vkontakte/android/data/CatalogInfo;
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onDataLoaded(Ljava/util/List;Z)V

    .line 113
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 90
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onDestroy()V

    .line 92
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesListFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    :goto_0
    return-void

    .line 93
    :catch_0
    move-exception v0

    goto :goto_0
.end method
