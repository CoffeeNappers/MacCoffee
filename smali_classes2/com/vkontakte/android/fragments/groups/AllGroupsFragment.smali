.class public Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;
.super Lcom/vkontakte/android/fragments/base/SegmenterFragment;
.source "AllGroupsFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/groups/AllGroupsFragment$Adapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/SegmenterFragment",
        "<",
        "Lcom/vkontakte/android/api/Group;",
        ">;"
    }
.end annotation


# static fields
.field public static final USER_ID:Ljava/lang/String; = "user_id"


# instance fields
.field private mData:Lcom/vkontakte/android/ui/util/ListSegmenter;

.field private mGlobalSearchEnabled:Z

.field private mSearchIndexer:Lcom/vkontakte/android/ui/util/SearchSegmenter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/ui/util/SearchSegmenter",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;"
        }
    .end annotation
.end field

.field private mSearchMode:Z

.field private mSelectionListener:Lcom/vkontakte/android/functions/VoidF1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;"
        }
    .end annotation
.end field

.field private mUserId:I


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;-><init>()V

    .line 34
    new-instance v0, Lcom/vkontakte/android/ui/util/SearchSegmenter;

    new-instance v1, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment$1;-><init>(Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;)V

    invoke-static {}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment$$Lambda$1;->lambdaFactory$()Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator;

    move-result-object v2

    const/16 v3, 0x32

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/ui/util/SearchSegmenter;-><init>(Lcom/vkontakte/android/fragments/friends/SearchIndexer$Provider;Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator;I)V

    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v2, 0x7f0805e5

    .line 49
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->setGlobalTitle(Ljava/lang/CharSequence;)Lcom/vkontakte/android/ui/util/SearchSegmenter;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mSearchIndexer:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    .line 53
    new-instance v0, Lcom/vkontakte/android/ui/util/ListSegmenter;

    invoke-direct {v0}, Lcom/vkontakte/android/ui/util/ListSegmenter;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mData:Lcom/vkontakte/android/ui/util/ListSegmenter;

    .line 54
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mGlobalSearchEnabled:Z

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;)Lcom/vkontakte/android/functions/VoidF1;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mSelectionListener:Lcom/vkontakte/android/functions/VoidF1;

    return-object v0
.end method

.method public static newInstance(I)Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;
    .locals 3
    .param p0, "userId"    # I

    .prologue
    .line 57
    new-instance v1, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;-><init>()V

    .line 58
    .local v1, "fragment":Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 59
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "user_id"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 60
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->setArguments(Landroid/os/Bundle;)V

    .line 61
    return-object v1
.end method


# virtual methods
.method protected createAdapter()Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vkontakte/android/fragments/base/SegmenterFragment",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">.GridAdapter<",
            "Lcom/vkontakte/android/api/Group;",
            "*>;"
        }
    .end annotation

    .prologue
    .line 97
    new-instance v0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment$Adapter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;Lcom/vkontakte/android/fragments/groups/AllGroupsFragment$1;)V

    return-object v0
.end method

.method protected doLoadData(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 107
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->preloader:Lme/grishka/appkit/utils/Preloader;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lme/grishka/appkit/utils/Preloader;->setMoreAvailable(Z)V

    .line 109
    return-void
.end method

.method protected getColumnsCount()I
    .locals 1

    .prologue
    .line 102
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->isTablet:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method protected getSegmenter()Lcom/vkontakte/android/ui/util/Segmenter;
    .locals 1

    .prologue
    .line 92
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mSearchMode:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mSearchIndexer:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mData:Lcom/vkontakte/android/ui/util/ListSegmenter;

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 66
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;->onCreate(Landroid/os/Bundle;)V

    .line 67
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "user_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mUserId:I

    .line 68
    iget v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mUserId:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->setRefreshEnabled(Z)V

    .line 69
    return-void
.end method

.method public onRefresh()V
    .locals 1

    .prologue
    .line 77
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/vkontakte/android/data/Groups;->reload(Z)V

    .line 78
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 82
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 83
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mSearchIndexer:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->attach(Landroid/support/v7/widget/RecyclerView;)V

    .line 84
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->updateList()V

    .line 85
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->loaded:Z

    if-eqz v0, :cond_0

    .line 86
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->dataLoaded()V

    .line 88
    :cond_0
    return-void
.end method

.method public openGroupDetails(Lcom/vkontakte/android/api/Group;)V
    .locals 2
    .param p1, "group"    # Lcom/vkontakte/android/api/Group;

    .prologue
    .line 173
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget v1, p1, Lcom/vkontakte/android/api/Group;->id:I

    neg-int v1, v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 174
    return-void
.end method

.method public setData(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 112
    .local p1, "data":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Group;>;"
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mSearchMode:Z

    .line 113
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 114
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 115
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mData:Lcom/vkontakte/android/ui/util/ListSegmenter;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/util/ListSegmenter;->clear()V

    .line 116
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mData:Lcom/vkontakte/android/ui/util/ListSegmenter;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/util/ListSegmenter;->bind(Ljava/util/List;)Lcom/vkontakte/android/ui/util/ListSegmenter;

    .line 117
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mSearchIndexer:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->clear()V

    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mSearchIndexer:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->bind(Ljava/util/List;)V

    .line 119
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mData:Lcom/vkontakte/android/ui/util/ListSegmenter;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->setData(Lcom/vkontakte/android/ui/util/Segmenter;)Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;

    .line 120
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->loaded:Z

    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-nez v0, :cond_0

    .line 127
    :goto_0
    return-void

    .line 124
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->updateList()V

    .line 125
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->dataLoaded()V

    .line 126
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->refreshDone()V

    goto :goto_0
.end method

.method public setGlobalSearch(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .prologue
    .line 72
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mGlobalSearchEnabled:Z

    .line 73
    return-void
.end method

.method public setSelectionListener(Lcom/vkontakte/android/functions/VoidF1;)Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;
    .locals 0
    .param p1    # Lcom/vkontakte/android/functions/VoidF1;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;)",
            "Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;"
        }
    .end annotation

    .prologue
    .line 177
    .local p1, "l":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Lcom/vkontakte/android/api/Group;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mSelectionListener:Lcom/vkontakte/android/functions/VoidF1;

    .line 178
    return-object p0
.end method

.method public updateFilter(Ljava/lang/String;)V
    .locals 3
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 130
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 131
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mSearchMode:Z

    if-nez v0, :cond_0

    .line 132
    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mSearchMode:Z

    .line 133
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->updateList()V

    .line 134
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->setRefreshEnabled(Z)V

    .line 136
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mSearchIndexer:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mGlobalSearchEnabled:Z

    invoke-virtual {v0, p1, v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->search(Ljava/lang/String;Z)V

    .line 144
    :cond_1
    :goto_0
    return-void

    .line 138
    :cond_2
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mSearchMode:Z

    if-eqz v0, :cond_1

    .line 139
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->mSearchMode:Z

    .line 140
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->updateList()V

    .line 141
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->setRefreshEnabled(Z)V

    goto :goto_0
.end method
