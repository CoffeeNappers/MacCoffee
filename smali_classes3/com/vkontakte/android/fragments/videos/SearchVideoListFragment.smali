.class public Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;
.super Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;
.source "SearchVideoListFragment.java"

# interfaces
.implements Lcom/vkontakte/android/fragments/BackListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;
    }
.end annotation


# instance fields
.field final mCallbacks:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;

.field mChanged:Z

.field mExpandView:Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;

.field mHd:Z

.field mQuery:Ljava/lang/String;

.field mSafeSearch:Z

.field mSearchIcon:Landroid/view/View;

.field mSortMode:I

.field mVideoLength:I

.field searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;-><init>()V

    .line 41
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mSafeSearch:Z

    .line 43
    const/4 v0, 0x2

    iput v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mSortMode:I

    .line 47
    new-instance v0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;-><init>(Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mCallbacks:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;

    .line 56
    const v0, 0x7f03022c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->setLayout(I)V

    .line 57
    return-void
.end method

.method public static newInstance(Z)Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;
    .locals 3
    .param p0, "select"    # Z

    .prologue
    .line 31
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 32
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "select"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 34
    new-instance v1, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;-><init>()V

    .line 35
    .local v1, "result":Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->setArguments(Landroid/os/Bundle;)V

    .line 36
    return-object v1
.end method


# virtual methods
.method protected getReferer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    const-string/jumbo v0, "search"

    return-object v0
.end method

.method protected getRequest(II)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 8
    .param p1, "offset"    # I
    .param p2, "count"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/vkontakte/android/api/VKAPIRequest",
            "<",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 79
    new-instance v0, Lcom/vkontakte/android/api/video/VideoSearch;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mQuery:Ljava/lang/String;

    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mHd:Z

    iget v5, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mVideoLength:I

    iget-boolean v6, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mSafeSearch:Z

    iget v7, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mSortMode:I

    move v2, p1

    move v3, p2

    invoke-direct/range {v0 .. v7}, Lcom/vkontakte/android/api/video/VideoSearch;-><init>(Ljava/lang/String;IIZIZI)V

    return-object v0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 61
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->onAttach(Landroid/app/Activity;)V

    .line 62
    const v0, 0x7f08042e

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->setEmptyText(I)V

    .line 63
    return-void
.end method

.method public onBackPressed()Z
    .locals 1

    .prologue
    .line 143
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mExpandView:Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;->isOpened()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 144
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mExpandView:Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;->closePanel()V

    .line 145
    const/4 v0, 0x1

    .line 147
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onScrollStarted()V
    .locals 1

    .prologue
    .line 129
    invoke-super {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->onScrollStarted()V

    .line 130
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->clearFocus()V

    .line 131
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 8
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const v7, 0x1090009

    const v6, 0x1090008

    .line 93
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 94
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    const/4 v5, 0x0

    invoke-virtual {p0, v4, v5}, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->onDataLoaded(Ljava/util/List;Z)V

    .line 96
    const v4, 0x7f100255

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mSearchIcon:Landroid/view/View;

    .line 97
    const v4, 0x7f100254

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;

    iput-object v4, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mExpandView:Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;

    .line 98
    iget-object v4, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mExpandView:Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mCallbacks:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;->setProgressListener(Lcom/vkontakte/android/functions/VoidFloat;)V

    .line 99
    iget-object v4, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mExpandView:Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mCallbacks:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;->setOpenListener(Lcom/vkontakte/android/functions/VoidFBool;)V

    .line 101
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const v5, 0x7f0c0037

    invoke-static {v4, v5, v6}, Landroid/widget/ArrayAdapter;->createFromResource(Landroid/content/Context;II)Landroid/widget/ArrayAdapter;

    move-result-object v0

    .line 102
    .local v0, "durationAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/CharSequence;>;"
    invoke-virtual {v0, v7}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 103
    iget-object v4, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mExpandView:Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;

    const v5, 0x7f100594

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    .line 104
    .local v1, "durationSpinner":Landroid/widget/Spinner;
    invoke-virtual {v1, v0}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 106
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const v5, 0x7f0c0039

    invoke-static {v4, v5, v6}, Landroid/widget/ArrayAdapter;->createFromResource(Landroid/content/Context;II)Landroid/widget/ArrayAdapter;

    move-result-object v2

    .line 107
    .local v2, "sortAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/CharSequence;>;"
    invoke-virtual {v2, v7}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 108
    iget-object v4, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mExpandView:Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;

    const v5, 0x7f100595

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Spinner;

    .line 109
    .local v3, "sortSpinner":Landroid/widget/Spinner;
    invoke-virtual {v3, v2}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 111
    iget-object v4, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mExpandView:Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;

    const v5, 0x7f100596

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/CompoundButton;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mCallbacks:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;

    invoke-virtual {v4, v5}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 112
    iget-object v4, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mExpandView:Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;

    const v5, 0x7f100597

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/CompoundButton;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mCallbacks:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;

    invoke-virtual {v4, v5}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 114
    iget-object v4, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mCallbacks:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;

    invoke-virtual {v1, v4}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 115
    iget-object v4, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mCallbacks:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;

    invoke-virtual {v3, v4}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 116
    return-void
.end method

.method public reload()V
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mQuery:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mQuery:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 85
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->refreshing:Z

    .line 86
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->loaded:Z

    .line 87
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->loadData()V

    .line 89
    :cond_0
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 135
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->preloadedData:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 136
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mQuery:Ljava/lang/String;

    .line 137
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->updateList()V

    .line 138
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->loaded:Z

    .line 139
    return-void
.end method

.method public setQuery(Ljava/lang/String;)V
    .locals 1
    .param p1, "q"    # Ljava/lang/String;

    .prologue
    .line 119
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    if-eqz v0, :cond_0

    .line 120
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    invoke-virtual {v0}, Lme/grishka/appkit/api/APIRequest;->cancel()V

    .line 121
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 123
    :cond_0
    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mQuery:Ljava/lang/String;

    .line 124
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->reload()V

    .line 125
    return-void
.end method

.method public setSearchView(Lcom/vkontakte/android/ui/SearchViewWrapper;)V
    .locals 0
    .param p1, "searchView"    # Lcom/vkontakte/android/ui/SearchViewWrapper;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    .line 53
    return-void
.end method

.method protected showContent()V
    .locals 1

    .prologue
    .line 72
    invoke-super {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->showContent()V

    .line 73
    const v0, 0x7f08045d

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->setEmptyText(I)V

    .line 74
    return-void
.end method
