.class public abstract Lcom/vkontakte/android/fragments/BaseListFragment;
.super Lcom/vkontakte/android/fragments/LoaderFragment;
.source "BaseListFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Landroid/widget/AdapterView$OnItemLongClickListener;
.implements Luk/co/senab/actionbarpulltorefresh/library/listeners/OnRefreshListener;
.implements Lme/grishka/appkit/views/UsableRecyclerView$Listener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/vkontakte/android/fragments/LoaderFragment;",
        "Landroid/widget/AdapterView$OnItemClickListener;",
        "Landroid/widget/AdapterView$OnItemLongClickListener;",
        "Luk/co/senab/actionbarpulltorefresh/library/listeners/OnRefreshListener;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Listener;"
    }
.end annotation


# instance fields
.field protected contentWrap:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;

.field protected data:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<TT;>;"
        }
    .end annotation
.end field

.field protected emptyView:Lcom/vkontakte/android/ui/EmptyView;

.field protected list:Landroid/widget/ListView;

.field private mFabHelper:Lcom/vkontakte/android/ui/FABHelper;

.field private mOnScrollListeners:Lcom/vkontakte/android/ui/ScrollListenerComposer;

.field private refreshAfterCreate:Z

.field private refreshEnabled:Z

.field protected refreshing:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    const/4 v1, 0x0

    .line 45
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/LoaderFragment;-><init>()V

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->data:Ljava/util/ArrayList;

    .line 39
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->refreshing:Z

    .line 40
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->refreshEnabled:Z

    .line 41
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->refreshAfterCreate:Z

    .line 42
    new-instance v0, Lcom/vkontakte/android/ui/ScrollListenerComposer;

    invoke-direct {v0}, Lcom/vkontakte/android/ui/ScrollListenerComposer;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->mOnScrollListeners:Lcom/vkontakte/android/ui/ScrollListenerComposer;

    .line 43
    invoke-static {}, Lcom/vkontakte/android/ui/FABHelper;->newInstance()Lcom/vkontakte/android/ui/FABHelper;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->mFabHelper:Lcom/vkontakte/android/ui/FABHelper;

    .line 47
    return-void
.end method


# virtual methods
.method public addOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/widget/AbsListView$OnScrollListener;

    .prologue
    .line 256
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->mOnScrollListeners:Lcom/vkontakte/android/ui/ScrollListenerComposer;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/ScrollListenerComposer;->addOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 257
    return-void
.end method

.method protected beforeSetAdapter()V
    .locals 0

    .prologue
    .line 111
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    return-void
.end method

.method protected cancelLoading()V
    .locals 1

    .prologue
    .line 125
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->currentRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 126
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->currentRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 127
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->currentRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 129
    :cond_0
    return-void
.end method

.method public createContentView()Landroid/view/View;
    .locals 2

    .prologue
    .line 70
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    new-instance v0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BaseListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->contentWrap:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;

    .line 71
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BaseListFragment;->createListView()Landroid/widget/ListView;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->list:Landroid/widget/ListView;

    .line 72
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->list:Landroid/widget/ListView;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/BaseListFragment;->setListViewAppearance(Landroid/widget/ListView;)V

    .line 73
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BaseListFragment;->beforeSetAdapter()V

    .line 74
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->list:Landroid/widget/ListView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BaseListFragment;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 75
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->list:Landroid/widget/ListView;

    const v1, 0x102000a

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setId(I)V

    .line 76
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->contentWrap:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->list:Landroid/widget/ListView;

    invoke-virtual {v0, v1}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;->addView(Landroid/view/View;)V

    .line 78
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BaseListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ui/EmptyView;->create(Landroid/content/Context;)Lcom/vkontakte/android/ui/EmptyView;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->emptyView:Lcom/vkontakte/android/ui/EmptyView;

    .line 79
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->emptyView:Lcom/vkontakte/android/ui/EmptyView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BaseListFragment;->getEmptyText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/EmptyView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->emptyView:Lcom/vkontakte/android/ui/EmptyView;

    const v1, 0x1020004

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/EmptyView;->setId(I)V

    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->emptyView:Lcom/vkontakte/android/ui/EmptyView;

    new-instance v1, Lcom/vkontakte/android/fragments/BaseListFragment$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/BaseListFragment$1;-><init>(Lcom/vkontakte/android/fragments/BaseListFragment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/EmptyView;->setOnBtnClickListener(Landroid/view/View$OnClickListener;)V

    .line 87
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->contentWrap:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->emptyView:Lcom/vkontakte/android/ui/EmptyView;

    invoke-virtual {v0, v1}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;->addView(Landroid/view/View;)V

    .line 88
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->list:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->emptyView:Lcom/vkontakte/android/ui/EmptyView;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->list:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 90
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->list:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 93
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BaseListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Luk/co/senab/actionbarpulltorefresh/library/ActionBarPullToRefresh;->from(Landroid/app/Activity;)Luk/co/senab/actionbarpulltorefresh/library/ActionBarPullToRefresh$SetupWizard;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [I

    fill-array-data v1, :array_0

    .line 97
    invoke-virtual {v0, v1}, Luk/co/senab/actionbarpulltorefresh/library/ActionBarPullToRefresh$SetupWizard;->theseChildrenArePullable([I)Luk/co/senab/actionbarpulltorefresh/library/ActionBarPullToRefresh$SetupWizard;

    move-result-object v0

    .line 99
    invoke-virtual {v0, p0}, Luk/co/senab/actionbarpulltorefresh/library/ActionBarPullToRefresh$SetupWizard;->listener(Luk/co/senab/actionbarpulltorefresh/library/listeners/OnRefreshListener;)Luk/co/senab/actionbarpulltorefresh/library/ActionBarPullToRefresh$SetupWizard;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->contentWrap:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;

    .line 100
    invoke-virtual {v0, v1}, Luk/co/senab/actionbarpulltorefresh/library/ActionBarPullToRefresh$SetupWizard;->setup(Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;)V

    .line 102
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->contentWrap:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->refreshEnabled:Z

    invoke-virtual {v0, v1}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;->setEnabled(Z)V

    .line 103
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->refreshAfterCreate:Z

    if-eqz v0, :cond_0

    .line 104
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BaseListFragment;->refresh()V

    .line 107
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->contentWrap:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;

    return-object v0

    .line 93
    :array_0
    .array-data 4
        0x102000a
        0x1020004
    .end array-data
.end method

.method protected createListView()Landroid/widget/ListView;
    .locals 2

    .prologue
    .line 50
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    new-instance v0, Lcom/vkontakte/android/ui/FixedScrollListView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BaseListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/FixedScrollListView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method protected abstract getAdapter()Landroid/widget/ListAdapter;
.end method

.method protected getEmptyText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 188
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    const v0, 0x7f0801ee

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/BaseListFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getImageLoaderAdapter()Lme/grishka/appkit/preloading/PrefetchInfoProvider;
    .locals 1

    .prologue
    .line 158
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    const/4 v0, 0x0

    return-object v0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 0
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    .line 63
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/LoaderFragment;->onAttach(Landroid/app/Activity;)V

    .line 66
    return-void
.end method

.method protected onDataLoaded(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    .local p1, "d":Ljava/util/List;, "Ljava/util/List<TT;>;"
    const/4 v1, 0x0

    .line 137
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->dataLoading:Z

    .line 138
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->currentRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 139
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->loaded:Z

    .line 140
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 141
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 142
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BaseListFragment;->updateList()V

    .line 143
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->list:Landroid/widget/ListView;

    if-nez v0, :cond_0

    .line 151
    :goto_0
    return-void

    .line 146
    :cond_0
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->refreshing:Z

    if-eqz v0, :cond_1

    .line 147
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BaseListFragment;->refreshDone()V

    .line 149
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->contentWrap:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 150
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->progress:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    goto :goto_0
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    const/4 v0, 0x0

    .line 178
    invoke-super {p0}, Lcom/vkontakte/android/fragments/LoaderFragment;->onDestroyView()V

    .line 179
    iput-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->contentWrap:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;

    .line 180
    iput-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->contentView:Landroid/view/ViewGroup;

    .line 181
    iput-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->list:Landroid/widget/ListView;

    .line 182
    iput-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->emptyView:Lcom/vkontakte/android/ui/EmptyView;

    .line 183
    iput-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->progress:Landroid/widget/ProgressBar;

    .line 184
    iput-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->errorView:Lcom/vkontakte/android/ui/ErrorView;

    .line 185
    return-void
.end method

.method protected onEmptyViewBtnClick()V
    .locals 0

    .prologue
    .line 115
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    return-void
.end method

.method public onError(ILjava/lang/String;)V
    .locals 1
    .param p1, "code"    # I
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 163
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->dataLoading:Z

    .line 164
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->currentRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 165
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->errorView:Lcom/vkontakte/android/ui/ErrorView;

    if-nez v0, :cond_0

    .line 174
    :goto_0
    return-void

    .line 168
    :cond_0
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->refreshing:Z

    if-eqz v0, :cond_1

    .line 169
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BaseListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lcom/vkontakte/android/api/APIUtils;->showErrorToast(Landroid/content/Context;ILjava/lang/String;)V

    .line 170
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BaseListFragment;->refreshDone()V

    goto :goto_0

    .line 172
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/LoaderFragment;->onError(ILjava/lang/String;)V

    goto :goto_0
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 221
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method

.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .locals 1
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)Z"
        }
    .end annotation

    .prologue
    .line 215
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    const/4 v0, 0x0

    return v0
.end method

.method public onRefreshStarted(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 234
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->refreshing:Z

    .line 235
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BaseListFragment;->doLoadData()V

    .line 236
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 225
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/LoaderFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 226
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xf

    if-ne v0, v1, :cond_0

    .line 228
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/BaseListFragment;->setUserVisibleHint(Z)V

    .line 230
    :cond_0
    return-void
.end method

.method public onScrollStarted()V
    .locals 0

    .prologue
    .line 248
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    return-void
.end method

.method public onScrolledToLastItem()V
    .locals 0

    .prologue
    .line 253
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    return-void
.end method

.method protected refresh()V
    .locals 2

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    const/4 v1, 0x1

    .line 192
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->loaded:Z

    if-nez v0, :cond_0

    .line 193
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BaseListFragment;->loadData()V

    .line 203
    :goto_0
    return-void

    .line 196
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->contentWrap:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;

    if-eqz v0, :cond_1

    .line 197
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->contentWrap:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;

    invoke-virtual {v0, v1}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;->setRefreshing(Z)V

    .line 198
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->contentWrap:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/BaseListFragment;->onRefreshStarted(Landroid/view/View;)V

    .line 199
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->refreshAfterCreate:Z

    goto :goto_0

    .line 201
    :cond_1
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->refreshAfterCreate:Z

    goto :goto_0
.end method

.method public refreshDone()V
    .locals 1

    .prologue
    .line 239
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->contentWrap:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;

    if-eqz v0, :cond_0

    .line 240
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->contentWrap:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;

    invoke-virtual {v0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;->setRefreshComplete()V

    .line 242
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->refreshing:Z

    .line 243
    return-void
.end method

.method public reload()V
    .locals 1

    .prologue
    .line 132
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->refreshing:Z

    .line 133
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BaseListFragment;->loadData()V

    .line 134
    return-void
.end method

.method public removeOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/widget/AbsListView$OnScrollListener;

    .prologue
    .line 260
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->mOnScrollListeners:Lcom/vkontakte/android/ui/ScrollListenerComposer;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/ScrollListenerComposer;->removeOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 261
    return-void
.end method

.method public setFloatingMenuItem(Landroid/view/MenuItem;)V
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 206
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->mFabHelper:Lcom/vkontakte/android/ui/FABHelper;

    if-eqz v0, :cond_0

    .line 207
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->mFabHelper:Lcom/vkontakte/android/ui/FABHelper;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->contentWrap:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/FABHelper;->attach(Landroid/widget/FrameLayout;)V

    .line 208
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->mFabHelper:Lcom/vkontakte/android/ui/FABHelper;

    invoke-virtual {v0, p1, p0}, Lcom/vkontakte/android/ui/FABHelper;->setData(Landroid/view/MenuItem;Lcom/vkontakte/android/ui/FABHelper$OnOptionItemSelectedListener;)V

    .line 209
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->mFabHelper:Lcom/vkontakte/android/ui/FABHelper;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/FABHelper;->attachToScroll()Landroid/widget/AbsListView$OnScrollListener;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/BaseListFragment;->addOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 211
    :cond_0
    return-void
.end method

.method protected setListViewAppearance(Landroid/widget/ListView;)V
    .locals 2
    .param p1, "l"    # Landroid/widget/ListView;

    .prologue
    .line 54
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    const v0, 0x7f02013e

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setSelector(I)V

    .line 55
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const v1, -0x201d1b

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 56
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 57
    return-void
.end method

.method protected setRefreshEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 118
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->refreshEnabled:Z

    .line 119
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->contentWrap:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;

    if-eqz v0, :cond_0

    .line 120
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BaseListFragment;->contentWrap:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;

    invoke-virtual {v0, p1}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;->setEnabled(Z)V

    .line 122
    :cond_0
    return-void
.end method

.method public updateList()V
    .locals 1

    .prologue
    .line 154
    .local p0, "this":Lcom/vkontakte/android/fragments/BaseListFragment;, "Lcom/vkontakte/android/fragments/BaseListFragment<TT;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BaseListFragment;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 155
    return-void
.end method
