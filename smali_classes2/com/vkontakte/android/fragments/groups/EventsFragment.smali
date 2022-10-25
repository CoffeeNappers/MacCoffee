.class public Lcom/vkontakte/android/fragments/groups/EventsFragment;
.super Lcom/vkontakte/android/fragments/base/SegmenterFragment;
.source "EventsFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/groups/EventsFragment$Adapter;
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
.field private mData:Lcom/vkontakte/android/ui/util/SectionSegmenter;

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
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;-><init>()V

    .line 32
    new-instance v0, Lcom/vkontakte/android/ui/util/SectionSegmenter;

    invoke-direct {v0}, Lcom/vkontakte/android/ui/util/SectionSegmenter;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/groups/EventsFragment;->mData:Lcom/vkontakte/android/ui/util/SectionSegmenter;

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/groups/EventsFragment;)Lcom/vkontakte/android/functions/VoidF1;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groups/EventsFragment;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/EventsFragment;->mSelectionListener:Lcom/vkontakte/android/functions/VoidF1;

    return-object v0
.end method

.method public static newInstance(I)Lcom/vkontakte/android/fragments/groups/EventsFragment;
    .locals 3
    .param p0, "userId"    # I

    .prologue
    .line 37
    new-instance v1, Lcom/vkontakte/android/fragments/groups/EventsFragment;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/groups/EventsFragment;-><init>()V

    .line 38
    .local v1, "fragment":Lcom/vkontakte/android/fragments/groups/EventsFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 39
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "user_id"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 40
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/groups/EventsFragment;->setArguments(Landroid/os/Bundle;)V

    .line 41
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
    .line 73
    new-instance v0, Lcom/vkontakte/android/fragments/groups/EventsFragment$Adapter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/groups/EventsFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/groups/EventsFragment;Lcom/vkontakte/android/fragments/groups/EventsFragment$1;)V

    return-object v0
.end method

.method protected doLoadData(II)V
    .locals 0
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 64
    return-void
.end method

.method protected getColumnsCount()I
    .locals 1

    .prologue
    .line 78
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/groups/EventsFragment;->isTablet:Z

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
    .line 145
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/EventsFragment;->mData:Lcom/vkontakte/android/ui/util/SectionSegmenter;

    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 46
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;->onCreate(Landroid/os/Bundle;)V

    .line 47
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/EventsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "user_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/groups/EventsFragment;->mUserId:I

    .line 48
    iget v0, p0, Lcom/vkontakte/android/fragments/groups/EventsFragment;->mUserId:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/groups/EventsFragment;->setRefreshEnabled(Z)V

    .line 49
    return-void
.end method

.method public onRefresh()V
    .locals 1

    .prologue
    .line 68
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/vkontakte/android/data/Groups;->reload(Z)V

    .line 69
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 53
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 54
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/EventsFragment;->updateList()V

    .line 55
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/groups/EventsFragment;->loaded:Z

    if-eqz v0, :cond_0

    .line 56
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/EventsFragment;->dataLoaded()V

    .line 58
    :cond_0
    return-void
.end method

.method public openGroupDetails(Lcom/vkontakte/android/api/Group;)V
    .locals 2
    .param p1, "group"    # Lcom/vkontakte/android/api/Group;

    .prologue
    .line 154
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget v1, p1, Lcom/vkontakte/android/api/Group;->id:I

    neg-int v1, v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/EventsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 155
    return-void
.end method

.method public setData(Ljava/util/ArrayList;Z)V
    .locals 9
    .param p2, "isTablet"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 83
    .local p1, "data":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Group;>;"
    iget-object v6, p0, Lcom/vkontakte/android/fragments/groups/EventsFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 84
    iget-object v6, p0, Lcom/vkontakte/android/fragments/groups/EventsFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v6, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 86
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 87
    .local v4, "mUpcomingEvents":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/Group;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 88
    .local v2, "mPastEvents":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/Group;>;"
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v5

    .line 90
    .local v5, "now":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v1, v6, :cond_1

    .line 91
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Group;

    .line 92
    .local v0, "event":Lcom/vkontakte/android/api/Group;
    iget v6, v0, Lcom/vkontakte/android/api/Group;->startTime:I

    if-le v6, v5, :cond_0

    .line 93
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 95
    :cond_0
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 98
    .end local v0    # "event":Lcom/vkontakte/android/api/Group;
    :cond_1
    iget-object v6, p0, Lcom/vkontakte/android/fragments/groups/EventsFragment;->mData:Lcom/vkontakte/android/ui/util/SectionSegmenter;

    invoke-virtual {v6}, Lcom/vkontakte/android/ui/util/SectionSegmenter;->clear()V

    .line 99
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2

    .line 100
    iget-object v6, p0, Lcom/vkontakte/android/fragments/groups/EventsFragment;->mData:Lcom/vkontakte/android/ui/util/SectionSegmenter;

    sget-object v7, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v8, 0x7f080302

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v4, v7}, Lcom/vkontakte/android/ui/util/SectionSegmenter;->addSection(Ljava/util/List;Ljava/lang/CharSequence;)V

    .line 102
    :cond_2
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_4

    .line 103
    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    invoke-direct {v3, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 104
    .local v3, "mPastEvents2":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/Group;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v1, v6, -0x1

    :goto_2
    if-ltz v1, :cond_3

    .line 105
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    add-int/lit8 v1, v1, -0x1

    goto :goto_2

    .line 107
    :cond_3
    move-object v2, v3

    .line 108
    iget-object v6, p0, Lcom/vkontakte/android/fragments/groups/EventsFragment;->mData:Lcom/vkontakte/android/ui/util/SectionSegmenter;

    sget-object v7, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v8, 0x7f080301

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v2, v7}, Lcom/vkontakte/android/ui/util/SectionSegmenter;->addSection(Ljava/util/List;Ljava/lang/CharSequence;)V

    .line 111
    .end local v3    # "mPastEvents2":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/Group;>;"
    :cond_4
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/EventsFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;

    move-result-object v6

    iget-object v7, p0, Lcom/vkontakte/android/fragments/groups/EventsFragment;->mData:Lcom/vkontakte/android/ui/util/SectionSegmenter;

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->setData(Lcom/vkontakte/android/ui/util/Segmenter;)Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;

    .line 112
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/vkontakte/android/fragments/groups/EventsFragment;->loaded:Z

    .line 113
    iget-object v6, p0, Lcom/vkontakte/android/fragments/groups/EventsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-nez v6, :cond_5

    .line 119
    :goto_3
    return-void

    .line 116
    :cond_5
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/EventsFragment;->updateList()V

    .line 117
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/EventsFragment;->dataLoaded()V

    .line 118
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/EventsFragment;->refreshDone()V

    goto :goto_3
.end method

.method public setSelectionListener(Lcom/vkontakte/android/functions/VoidF1;)Lcom/vkontakte/android/fragments/groups/EventsFragment;
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
            "Lcom/vkontakte/android/fragments/groups/EventsFragment;"
        }
    .end annotation

    .prologue
    .line 149
    .local p1, "l":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Lcom/vkontakte/android/api/Group;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groups/EventsFragment;->mSelectionListener:Lcom/vkontakte/android/functions/VoidF1;

    .line 150
    return-object p0
.end method
