.class public Lcom/vkontakte/android/fragments/NewsSearchFragment;
.super Lcom/vkontakte/android/fragments/PostListFragment;
.source "NewsSearchFragment.java"


# instance fields
.field private from:Ljava/lang/String;

.field private final onClickByTrend:Landroid/view/View$OnClickListener;

.field private query:Ljava/lang/String;

.field private searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

.field private trends:[Ljava/lang/String;

.field private trendsRequest:Lcom/vkontakte/android/api/VKAPIRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/api/VKAPIRequest",
            "<[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 28
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostListFragment;-><init>()V

    .line 34
    new-instance v0, Lcom/vkontakte/android/fragments/NewsSearchFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment$1;-><init>(Lcom/vkontakte/android/fragments/NewsSearchFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->onClickByTrend:Landroid/view/View$OnClickListener;

    .line 43
    iput-object v1, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->trendsRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 44
    iput-object v1, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->trends:[Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/NewsSearchFragment;)Lcom/vkontakte/android/ui/SearchViewWrapper;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsSearchFragment;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    return-object v0
.end method

.method static synthetic access$102(Lcom/vkontakte/android/fragments/NewsSearchFragment;[Ljava/lang/String;)[Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsSearchFragment;
    .param p1, "x1"    # [Ljava/lang/String;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->trends:[Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/NewsSearchFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsSearchFragment;

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->syncTrendsVisibility()V

    return-void
.end method

.method static synthetic access$302(Lcom/vkontakte/android/fragments/NewsSearchFragment;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsSearchFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VKAPIRequest;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->trendsRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    return-object p1
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/NewsSearchFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsSearchFragment;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->query:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$402(Lcom/vkontakte/android/fragments/NewsSearchFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsSearchFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->query:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/NewsSearchFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsSearchFragment;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->preloadedData:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/NewsSearchFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsSearchFragment;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->from:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$602(Lcom/vkontakte/android/fragments/NewsSearchFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsSearchFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->from:Ljava/lang/String;

    return-object p1
.end method

.method private hideKeyboard()V
    .locals 2

    .prologue
    .line 178
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->getView()Landroid/view/View;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/NewsSearchFragment;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 182
    return-void
.end method

.method private syncTrendsVisibility()V
    .locals 9

    .prologue
    const/4 v5, 0x0

    const/16 v8, 0x8

    const v7, 0x7f100413

    .line 72
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getView()Landroid/view/View;

    move-result-object v3

    .line 73
    .local v3, "view":Landroid/view/View;
    if-eqz v3, :cond_2

    .line 74
    iget-object v4, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->trends:[Ljava/lang/String;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->trends:[Ljava/lang/String;

    array-length v4, v4

    if-nez v4, :cond_3

    .line 75
    :cond_0
    invoke-virtual {v3, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-static {v4, v8}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 89
    :cond_1
    iget-object v4, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->trends:[Ljava/lang/String;

    if-eqz v4, :cond_7

    iget-object v4, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->trends:[Ljava/lang/String;

    array-length v4, v4

    if-eqz v4, :cond_7

    iget-object v4, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_7

    iget-object v4, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->query:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 90
    invoke-virtual {v3, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 95
    :cond_2
    :goto_0
    return-void

    .line 77
    :cond_3
    const v4, 0x7f100414

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 78
    .local v2, "trendsBlock":Landroid/view/ViewGroup;
    if-eqz v2, :cond_1

    .line 79
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ge v0, v4, :cond_1

    .line 80
    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 81
    .local v1, "trendView":Landroid/widget/TextView;
    if-eqz v1, :cond_4

    .line 82
    iget-object v4, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->trends:[Ljava/lang/String;

    array-length v4, v4

    if-ge v0, v4, :cond_5

    iget-object v4, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->trends:[Ljava/lang/String;

    aget-object v4, v4, v0

    :goto_2
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 83
    iget-object v4, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->onClickByTrend:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 85
    :cond_4
    iget-object v4, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->trends:[Ljava/lang/String;

    array-length v4, v4

    if-ge v0, v4, :cond_6

    iget-object v4, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->trends:[Ljava/lang/String;

    aget-object v4, v4, v0

    :goto_3
    const/4 v6, 0x1

    invoke-static {v1, v4, v6}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;Z)V

    .line 79
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_5
    move-object v4, v5

    .line 82
    goto :goto_2

    :cond_6
    move-object v4, v5

    .line 85
    goto :goto_3

    .line 92
    .end local v0    # "i":I
    .end local v1    # "trendView":Landroid/widget/TextView;
    .end local v2    # "trendsBlock":Landroid/view/ViewGroup;
    :cond_7
    invoke-virtual {v3, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-static {v4, v8}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    goto :goto_0
.end method


# virtual methods
.method protected doLoadData(II)V
    .locals 4
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 186
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->cancelLoading()V

    .line 187
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->query:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->query:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 188
    :cond_0
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->onDataLoaded(Ljava/util/List;Z)V

    .line 235
    :goto_0
    return-void

    .line 191
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->query:Ljava/lang/String;

    .line 192
    .local v0, "query":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "domain"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 193
    new-instance v1, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "domain"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2, p1, p2}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    new-instance v2, Lcom/vkontakte/android/fragments/NewsSearchFragment$5;

    invoke-direct {v2, p0, p0, v0}, Lcom/vkontakte/android/fragments/NewsSearchFragment$5;-><init>(Lcom/vkontakte/android/fragments/NewsSearchFragment;Landroid/app/Fragment;Ljava/lang/String;)V

    .line 194
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 205
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    goto :goto_0

    .line 206
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "owner"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 207
    new-instance v1, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "owner"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-direct {v1, v0, v2, p1, p2}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;-><init>(Ljava/lang/String;III)V

    new-instance v2, Lcom/vkontakte/android/fragments/NewsSearchFragment$6;

    invoke-direct {v2, p0, p0, v0}, Lcom/vkontakte/android/fragments/NewsSearchFragment$6;-><init>(Lcom/vkontakte/android/fragments/NewsSearchFragment;Landroid/app/Fragment;Ljava/lang/String;)V

    .line 208
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 219
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    goto :goto_0

    .line 221
    :cond_3
    new-instance v2, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;

    if-nez p1, :cond_4

    const-string/jumbo v1, ""

    :goto_1
    invoke-direct {v2, v0, v1, p2}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v1, Lcom/vkontakte/android/fragments/NewsSearchFragment$7;

    invoke-direct {v1, p0, p0, v0}, Lcom/vkontakte/android/fragments/NewsSearchFragment$7;-><init>(Lcom/vkontakte/android/fragments/NewsSearchFragment;Landroid/app/Fragment;Ljava/lang/String;)V

    .line 222
    invoke-virtual {v2, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 233
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    goto/16 :goto_0

    .line 221
    :cond_4
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->from:Ljava/lang/String;

    goto :goto_1
.end method

.method protected getEmptyText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 261
    const v0, 0x7f08042e

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getListReferrer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 167
    const-string/jumbo v0, "search"

    return-object v0
.end method

.method protected getReferer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 162
    const-string/jumbo v0, "news"

    return-object v0
.end method

.method synthetic lambda$hideKeyboard$0()V
    .locals 3

    .prologue
    .line 179
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 180
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 181
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 2
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    .line 53
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/PostListFragment;->onAttach(Landroid/app/Activity;)V

    .line 55
    const v0, 0x7f030167

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->setListLayoutId(I)V

    .line 56
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->onDataLoaded(Ljava/util/List;)V

    .line 58
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "owner_name_gen"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->trends:[Ljava/lang/String;

    if-nez v0, :cond_1

    .line 60
    new-instance v0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGetTrends;

    invoke-direct {v0}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGetTrends;-><init>()V

    new-instance v1, Lcom/vkontakte/android/fragments/NewsSearchFragment$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment$2;-><init>(Lcom/vkontakte/android/fragments/NewsSearchFragment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGetTrends;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 67
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->trendsRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 69
    :cond_1
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "s"    # Landroid/os/Bundle;

    .prologue
    .line 48
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/PostListFragment;->onCreate(Landroid/os/Bundle;)V

    .line 49
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->setRefreshEnabled(Z)V

    .line 50
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "parent"    # Landroid/view/ViewGroup;
    .param p3, "state"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x0

    .line 245
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/PostListFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v1

    .line 247
    .local v1, "view":Landroid/view/View;
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v0, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 248
    .local v0, "lparams":Landroid/widget/FrameLayout$LayoutParams;
    const/16 v2, 0x30

    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 249
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->emptyView:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 251
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->emptyView:Landroid/view/View;

    const/high16 v3, 0x42c80000    # 100.0f

    invoke-static {v3}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    invoke-virtual {v2, v4, v3, v4, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 252
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "q"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 253
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->contentWrap:Landroid/view/ViewGroup;

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 254
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->progress:Landroid/view/View;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 257
    :cond_1
    return-object v1
.end method

.method protected onDataLoaded(Ljava/util/List;Z)V
    .locals 0
    .param p2, "more"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 239
    .local p1, "d":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/NewsEntry;>;"
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/PostListFragment;->onDataLoaded(Ljava/util/List;Z)V

    .line 240
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->syncTrendsVisibility()V

    .line 241
    return-void
.end method

.method public onDetach()V
    .locals 1

    .prologue
    .line 99
    invoke-super {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->onDetach()V

    .line 100
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->trendsRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 101
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->trendsRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 102
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->trendsRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 104
    :cond_0
    return-void
.end method

.method public onScrollStarted()V
    .locals 1

    .prologue
    .line 172
    invoke-super {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->onScrollStarted()V

    .line 173
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->clearFocus()V

    .line 174
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->hideKeyboard()V

    .line 175
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 108
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/PostListFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 109
    new-instance v0, Lcom/vkontakte/android/fragments/NewsSearchFragment$4;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/fragments/NewsSearchFragment$3;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment$3;-><init>(Lcom/vkontakte/android/fragments/NewsSearchFragment;)V

    invoke-direct {v0, p0, v1, v2}, Lcom/vkontakte/android/fragments/NewsSearchFragment$4;-><init>(Lcom/vkontakte/android/fragments/NewsSearchFragment;Landroid/app/Activity;Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    .line 139
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "owner_name_gen"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 140
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    const v1, 0x7f0805e7

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v4

    const-string/jumbo v5, "owner_name_gen"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setHint(Ljava/lang/String;)V

    .line 145
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->addView(Landroid/view/View;)V

    .line 146
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "q"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 147
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "q"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setTextAndSubmit(Ljava/lang/String;)V

    .line 148
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->clearFocus()V

    .line 149
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->hideKeyboard()V

    .line 151
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->syncTrendsVisibility()V

    .line 152
    return-void

    .line 142
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    const v1, 0x7f0805e4

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setHint(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setArguments(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "args"    # Landroid/os/Bundle;

    .prologue
    .line 156
    const-string/jumbo v0, "no_autoload"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 157
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/PostListFragment;->setArguments(Landroid/os/Bundle;)V

    .line 158
    return-void
.end method
