.class public Lcom/vkontakte/android/fragments/GamesRequestFragment;
.super Lcom/vkontakte/android/fragments/VKRecyclerFragment;
.source "GamesRequestFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/VKRecyclerFragment",
        "<",
        "Lcom/vkontakte/android/data/GameRequest;",
        ">;"
    }
.end annotation


# static fields
.field private static final KEY_REQUESTS:Ljava/lang/String; = "requests"


# instance fields
.field private adapter:Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;

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

.field private fadeDrawablesAndHideRequestsCalled:Z

.field private receiverDeleteRequest:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 58
    const/16 v0, 0x64

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;-><init>(I)V

    .line 41
    new-instance v0, Lcom/vkontakte/android/fragments/GamesRequestFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/GamesRequestFragment$1;-><init>(Lcom/vkontakte/android/fragments/GamesRequestFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->receiverDeleteRequest:Landroid/content/BroadcastReceiver;

    .line 55
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->drawablesList:Ljava/util/ArrayList;

    .line 59
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/GamesRequestFragment;)Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesRequestFragment;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->adapter:Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/GamesRequestFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesRequestFragment;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/GamesRequestFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesRequestFragment;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/GamesRequestFragment;Ljava/util/List;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesRequestFragment;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Z

    .prologue
    .line 37
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->onDataLoaded(Ljava/util/List;Z)V

    return-void
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/GamesRequestFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesRequestFragment;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/GamesRequestFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesRequestFragment;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->drawablesList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/GamesRequestFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesRequestFragment;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/GamesRequestFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/GamesRequestFragment;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static createBundle(Ljava/util/ArrayList;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 2
    .param p1, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/GameRequest;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Landroid/os/Bundle;"
        }
    .end annotation

    .prologue
    .line 92
    .local p0, "requests":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 93
    .local v0, "bundle":Landroid/os/Bundle;
    if-eqz p0, :cond_0

    .line 94
    const-string/jumbo v1, "requests"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 96
    :cond_0
    const-string/jumbo v1, "visitSource"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    return-object v0
.end method

.method private fadeDrawablesAndHideRequests()V
    .locals 2

    .prologue
    .line 177
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->fadeDrawablesAndHideRequestsCalled:Z

    if-eqz v1, :cond_0

    .line 191
    :goto_0
    return-void

    .line 181
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->drawablesList:Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/vkontakte/android/data/Games;->fadeDrawables(Ljava/util/ArrayList;)V

    .line 182
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->drawablesList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 184
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->adapter:Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->adapter:Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;->getGameRequestsData()Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 185
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 186
    .local v0, "toBeMarkedAsRead":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->adapter:Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;->getGameRequestsData()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 187
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/vkontakte/android/data/Games;->markRequestsAsRead(Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 190
    .end local v0    # "toBeMarkedAsRead":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    :cond_1
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->fadeDrawablesAndHideRequestsCalled:Z

    goto :goto_0
.end method

.method private getDataFromArg()Ljava/util/ArrayList;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/GameRequest;",
            ">;"
        }
    .end annotation

    .prologue
    .line 101
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v4

    const-string/jumbo v5, "requests"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 102
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v4

    const-string/jumbo v5, "requests"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    .line 103
    .local v2, "parcelables":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/Parcelable;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 104
    .local v3, "requests":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Parcelable;

    .local v1, "parcelable":Landroid/os/Parcelable;
    move-object v0, v1

    .line 105
    check-cast v0, Lcom/vkontakte/android/data/GameRequest;

    .line 106
    .local v0, "gameRequest":Lcom/vkontakte/android/data/GameRequest;
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 110
    .end local v0    # "gameRequest":Lcom/vkontakte/android/data/GameRequest;
    .end local v1    # "parcelable":Landroid/os/Parcelable;
    .end local v2    # "parcelables":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/Parcelable;>;"
    .end local v3    # "requests":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    :cond_0
    const/4 v3, 0x0

    :cond_1
    return-object v3
.end method

.method private startHidingRequests()V
    .locals 4

    .prologue
    .line 166
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->getView()Landroid/view/View;

    move-result-object v0

    .line 167
    .local v0, "view":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 168
    invoke-static {p0}, Lcom/vkontakte/android/fragments/GamesRequestFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/GamesRequestFragment;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 174
    :cond_0
    return-void
.end method


# virtual methods
.method protected doLoadData(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 118
    new-instance v0, Lcom/vkontakte/android/api/apps/AppsGetRequests;

    invoke-direct {v0}, Lcom/vkontakte/android/api/apps/AppsGetRequests;-><init>()V

    new-instance v1, Lcom/vkontakte/android/fragments/GamesRequestFragment$2;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/GamesRequestFragment$2;-><init>(Lcom/vkontakte/android/fragments/GamesRequestFragment;Landroid/app/Fragment;)V

    .line 119
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/apps/AppsGetRequests;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 125
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 126
    return-void
.end method

.method protected bridge synthetic getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 1

    .prologue
    .line 37
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v0

    return-object v0
.end method

.method protected getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->adapter:Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;

    if-nez v0, :cond_0

    .line 150
    new-instance v0, Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/GamesRequestFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->adapter:Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;

    .line 152
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->adapter:Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;

    return-object v0
.end method

.method synthetic lambda$onCreateContentView$0(I)Z
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 134
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ge p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$startHidingRequests$1()V
    .locals 1

    .prologue
    .line 169
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 170
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->fadeDrawablesAndHideRequests()V

    .line 172
    :cond_0
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 2
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    .line 79
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onAttach(Landroid/app/Activity;)V

    .line 80
    const v1, 0x7f080263

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->setTitle(I)V

    .line 81
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->getDataFromArg()Ljava/util/ArrayList;

    move-result-object v0

    .line 82
    .local v0, "requests":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameRequest;>;"
    if-eqz v0, :cond_0

    .line 83
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->onDataLoaded(Ljava/util/List;)V

    .line 87
    :goto_0
    return-void

    .line 85
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->loadData()V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 67
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 68
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->receiverDeleteRequest:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string/jumbo v3, "com.vkontakte.android.games.DELETE_REQUEST"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 69
    return-void
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 6
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x0

    const/high16 v4, 0x41000000    # 8.0f

    .line 130
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v1

    .line 131
    .local v1, "view":Landroid/view/View;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v2, v5, v3, v5, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 132
    new-instance v0, Lme/grishka/appkit/views/DividerItemDecoration;

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f02011e

    .line 133
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const/high16 v3, 0x3f000000    # 0.5f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-direct {v0, v2, v3}, Lme/grishka/appkit/views/DividerItemDecoration;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 134
    .local v0, "dividers":Lme/grishka/appkit/views/DividerItemDecoration;
    invoke-static {p0}, Lcom/vkontakte/android/fragments/GamesRequestFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/GamesRequestFragment;)Lme/grishka/appkit/views/DividerItemDecoration$Provider;

    move-result-object v2

    invoke-virtual {v0, v2}, Lme/grishka/appkit/views/DividerItemDecoration;->setProvider(Lme/grishka/appkit/views/DividerItemDecoration$Provider;)Lme/grishka/appkit/views/DividerItemDecoration;

    .line 135
    iget-object v2, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2, v0}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 138
    return-object v1
.end method

.method protected onDataLoaded(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/GameRequest;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 157
    .local p1, "d":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/GameRequest;>;"
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onDataLoaded(Ljava/util/List;)V

    .line 158
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 159
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "requests"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 162
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->startHidingRequests()V

    .line 163
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 73
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment;->receiverDeleteRequest:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 74
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onDestroy()V

    .line 75
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 143
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 144
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->startHidingRequests()V

    .line 145
    return-void
.end method
