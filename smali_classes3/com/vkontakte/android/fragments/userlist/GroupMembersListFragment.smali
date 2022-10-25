.class public Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;
.super Lcom/vkontakte/android/fragments/base/SegmenterFragment;
.source "GroupMembersListFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$Adapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/SegmenterFragment",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;"
    }
.end annotation


# static fields
.field private static final USERS_PER_PAGE:I = 0x32


# instance fields
.field private fastScroller:Lcom/vkontakte/android/ui/recyclerview/FastScroller;

.field private final mClickListener:Lcom/vkontakte/android/functions/VoidF1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private final mIndexer:Lcom/vkontakte/android/ui/util/SectionSegmenter;

.field private mSearchIndexer:Lcom/vkontakte/android/ui/util/SearchSegmenter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/ui/util/SearchSegmenter",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private mSearchMode:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    const/16 v0, 0x32

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;-><init>(I)V

    .line 33
    new-instance v0, Lcom/vkontakte/android/ui/util/SectionSegmenter;

    invoke-direct {v0}, Lcom/vkontakte/android/ui/util/SectionSegmenter;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->mIndexer:Lcom/vkontakte/android/ui/util/SectionSegmenter;

    .line 34
    invoke-static {p0}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->mClickListener:Lcom/vkontakte/android/functions/VoidF1;

    .line 43
    const v0, 0x7f0300ab

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->setListLayoutId(I)V

    .line 44
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;)Lcom/vkontakte/android/ui/util/SectionSegmenter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->mIndexer:Lcom/vkontakte/android/ui/util/SectionSegmenter;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;)Lcom/vkontakte/android/ui/util/SearchSegmenter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->mSearchIndexer:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;)Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    .prologue
    .line 30
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;)Lcom/vkontakte/android/functions/VoidF1;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->mClickListener:Lcom/vkontakte/android/functions/VoidF1;

    return-object v0
.end method

.method static synthetic lambda$onCreate$0(Ljava/lang/String;ILjava/lang/String;II)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 6
    .param p0, "fromList"    # Ljava/lang/String;
    .param p1, "groupId"    # I
    .param p2, "q"    # Ljava/lang/String;
    .param p3, "offset"    # I
    .param p4, "count"    # I

    .prologue
    .line 67
    new-instance v0, Lcom/vkontakte/android/api/users/UsersSearch$SimpleGroupSearch;

    move-object v1, p2

    move-object v2, p0

    move v3, p1

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/users/UsersSearch$SimpleGroupSearch;-><init>(Ljava/lang/String;Ljava/lang/String;III)V

    return-object v0
.end method

.method private setFastScrollerVisibility(Z)V
    .locals 3
    .param p1, "visible"    # Z

    .prologue
    const/4 v1, 0x0

    .line 116
    iget-object v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->fastScroller:Lcom/vkontakte/android/ui/recyclerview/FastScroller;

    if-eqz v0, :cond_0

    .line 117
    iget-object v2, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->fastScroller:Lcom/vkontakte/android/ui/recyclerview/FastScroller;

    if-eqz p1, :cond_3

    move v0, v1

    :goto_0
    invoke-virtual {v2, v0}, Lcom/vkontakte/android/ui/recyclerview/FastScroller;->setVisibility(I)V

    .line 119
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-eqz v0, :cond_2

    .line 120
    iget-object v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-nez p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setVerticalScrollBarEnabled(Z)V

    .line 122
    :cond_2
    return-void

    .line 117
    :cond_3
    const/16 v0, 0x8

    goto :goto_0
.end method


# virtual methods
.method protected createAdapter()Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vkontakte/android/fragments/base/SegmenterFragment",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">.GridAdapter<",
            "Lcom/vkontakte/android/UserProfile;",
            "*>;"
        }
    .end annotation

    .prologue
    .line 147
    new-instance v0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$Adapter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$1;)V

    return-object v0
.end method

.method protected doLoadData(II)V
    .locals 5
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    const/4 v4, 0x0

    .line 126
    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->mSearchMode:Z

    if-eqz v2, :cond_0

    .line 127
    iput-boolean v4, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->dataLoading:Z

    .line 143
    :goto_0
    return-void

    .line 129
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "gid"

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 130
    .local v1, "gid":I
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "filter"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 131
    .local v0, "filter":Ljava/lang/String;
    new-instance v2, Lcom/vkontakte/android/api/groups/GroupsGetMembers;

    invoke-direct {v2, v1, p1, p2, v0}, Lcom/vkontakte/android/api/groups/GroupsGetMembers;-><init>(IIILjava/lang/String;)V

    new-instance v3, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$2;

    invoke-direct {v3, p0, p0}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$2;-><init>(Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;Lme/grishka/appkit/fragments/BaseRecyclerFragment;)V

    .line 132
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/groups/GroupsGetMembers;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 141
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    goto :goto_0
.end method

.method protected getColumnsCount()I
    .locals 4

    .prologue
    .line 152
    iget-object v2, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getPaddingLeft()I

    move-result v3

    sub-int/2addr v2, v3

    iget-object v3, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getPaddingRight()I

    move-result v3

    sub-int v1, v2, v3

    .line 153
    .local v1, "listWidth":I
    iget v2, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->scrW:I

    const/16 v3, 0x258

    if-lt v2, v3, :cond_0

    const/high16 v2, 0x43200000    # 160.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    .line 154
    .local v0, "columnWidth":I
    :goto_0
    div-int v2, v1, v0

    return v2

    .end local v0    # "columnWidth":I
    :cond_0
    move v0, v1

    .line 153
    goto :goto_0
.end method

.method protected getSegmenter()Lcom/vkontakte/android/ui/util/Segmenter;
    .locals 1

    .prologue
    .line 99
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->mSearchMode:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->mSearchIndexer:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->mIndexer:Lcom/vkontakte/android/ui/util/SectionSegmenter;

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 48
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;->onCreate(Landroid/os/Bundle;)V

    .line 49
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->setRefreshEnabled(Z)V

    .line 50
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "gid"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 51
    .local v1, "groupId":I
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "from_list"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 52
    .local v0, "fromList":Ljava/lang/String;
    new-instance v2, Lcom/vkontakte/android/ui/util/SearchSegmenter;

    new-instance v3, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$1;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$1;-><init>(Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;)V

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$$Lambda$2;->lambdaFactory$(Ljava/lang/String;I)Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator;

    move-result-object v4

    const/16 v5, 0x32

    invoke-direct {v2, v3, v4, v5}, Lcom/vkontakte/android/ui/util/SearchSegmenter;-><init>(Lcom/vkontakte/android/fragments/friends/SearchIndexer$Provider;Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator;I)V

    iput-object v2, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->mSearchIndexer:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    .line 68
    iget-object v2, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->mSearchIndexer:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f0805eb

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->setGlobalTitle(Ljava/lang/CharSequence;)Lcom/vkontakte/android/ui/util/SearchSegmenter;

    .line 69
    return-void
.end method

.method protected onCreateCardDecorator()Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    .locals 6

    .prologue
    .line 73
    new-instance v0, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    const/4 v3, 0x0

    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->isTablet:Z

    if-nez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    invoke-direct {v0, v3, v2}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;-><init>(Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration$Provider;Z)V

    .line 75
    .local v0, "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    const/high16 v2, 0x41000000    # 8.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    .line 76
    .local v1, "paddingTop":I
    iget-object v2, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget v3, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->margin:I

    iget v4, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->padding:I

    add-int/2addr v3, v4

    iget v4, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->margin:I

    iget v5, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->padding:I

    add-int/2addr v4, v5

    iget v5, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->padding:I

    invoke-virtual {v2, v3, v1, v4, v5}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 77
    iget v2, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->padding:I

    iget v3, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->padding:I

    iget v4, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->padding:I

    invoke-virtual {v0, v2, v1, v3, v4}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;->setPadding(IIII)Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    .line 78
    return-object v0

    .line 73
    .end local v0    # "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    .end local v1    # "paddingTop":I
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v1, 0x0

    .line 83
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    .line 85
    .local v0, "view":Landroid/view/View;
    iget v2, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->scrW:I

    const/16 v3, 0x258

    if-lt v2, v3, :cond_1

    .line 86
    const/high16 v2, 0x41400000    # 12.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->padding:I

    .line 93
    :goto_0
    iget v2, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->scrW:I

    const/16 v3, 0x39c

    if-lt v2, v3, :cond_0

    const/16 v1, 0x10

    iget v2, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->scrW:I

    add-int/lit16 v2, v2, -0x348

    add-int/lit8 v2, v2, -0x54

    div-int/lit8 v2, v2, 0x2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v1, v1

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    :cond_0
    iput v1, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->margin:I

    .line 94
    return-object v0

    .line 87
    :cond_1
    iget v2, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->scrW:I

    const/16 v3, 0x1e0

    if-lt v2, v3, :cond_2

    .line 88
    const/high16 v2, 0x41000000    # 8.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->padding:I

    goto :goto_0

    .line 90
    :cond_2
    iput v1, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->padding:I

    goto :goto_0
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 104
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 105
    const v0, 0x7f100290

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/recyclerview/FastScroller;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->fastScroller:Lcom/vkontakte/android/ui/recyclerview/FastScroller;

    .line 106
    iget-object v1, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->fastScroller:Lcom/vkontakte/android/ui/recyclerview/FastScroller;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const v0, 0x7f1002b8

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v1, v2, v0}, Lcom/vkontakte/android/ui/recyclerview/FastScroller;->setup(Landroid/support/v7/widget/RecyclerView;Landroid/widget/TextView;)V

    .line 107
    iget-object v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->mSearchIndexer:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->attach(Landroid/support/v7/widget/RecyclerView;)V

    .line 108
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->updateList()V

    .line 109
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->loaded:Z

    if-eqz v0, :cond_0

    .line 110
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->dataLoaded()V

    .line 112
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->setFastScrollerVisibility(Z)V

    .line 113
    return-void
.end method

.method public openUserDetails(Lcom/vkontakte/android/UserProfile;)V
    .locals 2
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 178
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget v1, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 179
    return-void
.end method

.method public updateFilter(Ljava/lang/String;)V
    .locals 3
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 157
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 158
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->mSearchMode:Z

    if-nez v0, :cond_0

    .line 159
    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->mSearchMode:Z

    .line 160
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->setRefreshEnabled(Z)V

    .line 161
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->updateDecorator()V

    .line 162
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->updateList()V

    .line 163
    invoke-direct {p0, v1}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->setFastScrollerVisibility(Z)V

    .line 165
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->mSearchIndexer:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    invoke-virtual {v0, p1, v2}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->search(Ljava/lang/String;Z)V

    .line 175
    :cond_1
    :goto_0
    return-void

    .line 167
    :cond_2
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->mSearchMode:Z

    if-eqz v0, :cond_1

    .line 168
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->mSearchMode:Z

    .line 169
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->setRefreshEnabled(Z)V

    .line 170
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->updateDecorator()V

    .line 171
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->updateList()V

    .line 172
    invoke-direct {p0, v1}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->setFastScrollerVisibility(Z)V

    goto :goto_0
.end method
