.class public final Lcom/vk/music/view/SearchSuggestionContainer;
.super Lme/grishka/appkit/views/UsableRecyclerView;
.source "SearchSuggestionContainer.java"

# interfaces
.implements Lcom/vk/music/model/SearchSuggestionModel$Callback;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ViewConstructor"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/view/SearchSuggestionContainer$UserListener;,
        Lcom/vk/music/view/SearchSuggestionContainer$Listener;,
        Lcom/vk/music/view/SearchSuggestionContainer$LoadHintsCommand;
    }
.end annotation


# static fields
.field private static final SEARCH_DELAY:I = 0x12c

.field private static final VIEW_TYPE_CAPTION_POPULAR:I = 0x3

.field private static final VIEW_TYPE_CAPTION_RECENTS:I = 0x1

.field private static final VIEW_TYPE_HINTS:I = 0x5

.field private static final VIEW_TYPE_POPULAR:I = 0x4

.field private static final VIEW_TYPE_RECENT:I = 0x2

.field private static final VIEW_TYPE_SEARCH_ACTION:I = 0x6


# instance fields
.field final activity:Landroid/app/Activity;

.field final adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

.field final emptyAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

.field final hintsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/view/adapter/ItemAdapter",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field listener:Lcom/vk/music/view/SearchSuggestionContainer$Listener;

.field loadHintsCommand:Lcom/vk/music/view/SearchSuggestionContainer$LoadHintsCommand;

.field final model:Lcom/vk/music/model/SearchSuggestionModel;

.field final popularAdapter:Lcom/vk/music/view/adapter/ItemAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/view/adapter/ItemAdapter",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final popularCaptionAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field popularCaptionView:Landroid/widget/TextView;

.field final recentsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/view/adapter/ItemAdapter",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final recentsCaptionAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field final resourcer:Lcom/vk/core/util/Resourcer;

.field final searchActionAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field searchActionView:Landroid/widget/TextView;

.field searchInputView:Landroid/widget/EditText;

.field final searchTextWatcher:Landroid/text/TextWatcher;

.field final userListener:Lcom/vk/music/view/SearchSuggestionContainer$UserListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vk/music/model/SearchSuggestionModel;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "model"    # Lcom/vk/music/model/SearchSuggestionModel;

    .prologue
    const/16 v5, 0x8

    const/4 v7, 0x1

    const v8, 0x7f03014b

    const/4 v6, 0x0

    .line 146
    invoke-direct {p0, p1}, Lme/grishka/appkit/views/UsableRecyclerView;-><init>(Landroid/content/Context;)V

    .line 147
    invoke-static {p1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v4

    iput-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->activity:Landroid/app/Activity;

    .line 148
    iget-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->activity:Landroid/app/Activity;

    invoke-static {v4}, Lcom/vk/core/util/Resourcer;->of(Landroid/content/Context;)Lcom/vk/core/util/Resourcer;

    move-result-object v4

    iput-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->resourcer:Lcom/vk/core/util/Resourcer;

    .line 149
    iput-object p2, p0, Lcom/vk/music/view/SearchSuggestionContainer;->model:Lcom/vk/music/model/SearchSuggestionModel;

    .line 150
    new-instance v4, Lcom/vk/music/view/SearchSuggestionContainer$LoadHintsCommand;

    invoke-direct {v4, p0}, Lcom/vk/music/view/SearchSuggestionContainer$LoadHintsCommand;-><init>(Lcom/vk/music/view/SearchSuggestionContainer;)V

    iput-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->loadHintsCommand:Lcom/vk/music/view/SearchSuggestionContainer$LoadHintsCommand;

    .line 151
    new-instance v4, Lcom/vk/music/view/SearchSuggestionContainer$UserListener;

    invoke-direct {v4, p0}, Lcom/vk/music/view/SearchSuggestionContainer$UserListener;-><init>(Lcom/vk/music/view/SearchSuggestionContainer;)V

    iput-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->userListener:Lcom/vk/music/view/SearchSuggestionContainer$UserListener;

    .line 153
    new-instance v4, Lcom/vk/music/view/SearchSuggestionContainer$1;

    invoke-direct {v4, p0}, Lcom/vk/music/view/SearchSuggestionContainer$1;-><init>(Lcom/vk/music/view/SearchSuggestionContainer;)V

    iput-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchTextWatcher:Landroid/text/TextWatcher;

    .line 173
    invoke-static {v5}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v4

    invoke-static {v5}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v5

    invoke-virtual {p0, v6, v4, v6, v5}, Lcom/vk/music/view/SearchSuggestionContainer;->setPadding(IIII)V

    .line 174
    invoke-virtual {p0, v6}, Lcom/vk/music/view/SearchSuggestionContainer;->setClipToPadding(Z)V

    .line 175
    new-instance v4, Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v5, p0, Lcom/vk/music/view/SearchSuggestionContainer;->activity:Landroid/app/Activity;

    invoke-direct {v4, v5}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v4}, Lcom/vk/music/view/SearchSuggestionContainer;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 176
    invoke-virtual {p0, v7}, Lcom/vk/music/view/SearchSuggestionContainer;->setHasFixedSize(Z)V

    .line 178
    invoke-static {p0}, Lcom/vk/music/view/SearchSuggestionContainer$$Lambda$1;->lambdaFactory$(Lcom/vk/music/view/SearchSuggestionContainer;)Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;

    move-result-object v3

    .line 179
    .local v3, "init":Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;
    invoke-static {p0}, Lcom/vk/music/view/SearchSuggestionContainer$$Lambda$2;->lambdaFactory$(Lcom/vk/music/view/SearchSuggestionContainer;)Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;

    move-result-object v1

    .line 180
    .local v1, "clickListener":Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;, "Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener<Ljava/lang/String;>;"
    new-instance v0, Lcom/vk/music/view/SearchSuggestionContainer$2;

    invoke-direct {v0, p0}, Lcom/vk/music/view/SearchSuggestionContainer$2;-><init>(Lcom/vk/music/view/SearchSuggestionContainer;)V

    .line 194
    .local v0, "binder":Lcom/vk/music/view/adapter/ItemViewHolder$Binder;, "Lcom/vk/music/view/adapter/ItemViewHolder$Binder<Ljava/lang/String;>;"
    iget-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->activity:Landroid/app/Activity;

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    .line 195
    .local v2, "inflater":Landroid/view/LayoutInflater;
    new-instance v4, Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {p0, v2}, Lcom/vk/music/view/SearchSuggestionContainer$$Lambda$3;->lambdaFactory$(Lcom/vk/music/view/SearchSuggestionContainer;Landroid/view/LayoutInflater;)Lcom/vkontakte/android/functions/F1;

    move-result-object v5

    invoke-direct {v4, v5, v7}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;I)V

    iput-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->recentsCaptionAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 206
    new-instance v4, Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    invoke-direct {v4, v2}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;-><init>(Landroid/view/LayoutInflater;)V

    .line 207
    invoke-virtual {v4, v8}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->layout(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    .line 208
    invoke-virtual {v4, v3}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->init(Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    .line 209
    invoke-virtual {v4, v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->registerClickListener(Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    .line 210
    invoke-virtual {v4, v0}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->binder(Lcom/vk/music/view/adapter/ItemViewHolder$Binder;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    const/4 v5, 0x2

    .line 211
    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->viewType(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    .line 212
    invoke-virtual {v4}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->build()Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v4

    iput-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->recentsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    .line 213
    new-instance v4, Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {p0, v2}, Lcom/vk/music/view/SearchSuggestionContainer$$Lambda$4;->lambdaFactory$(Lcom/vk/music/view/SearchSuggestionContainer;Landroid/view/LayoutInflater;)Lcom/vkontakte/android/functions/F1;

    move-result-object v5

    invoke-static {p0, p2}, Lcom/vk/music/view/SearchSuggestionContainer$$Lambda$5;->lambdaFactory$(Lcom/vk/music/view/SearchSuggestionContainer;Lcom/vk/music/model/SearchSuggestionModel;)Lcom/vkontakte/android/functions/VoidF;

    move-result-object v6

    const/4 v7, 0x3

    invoke-direct {v4, v5, v6, v7}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;Lcom/vkontakte/android/functions/VoidF;I)V

    iput-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->popularCaptionAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 222
    new-instance v4, Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    invoke-direct {v4, v2}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;-><init>(Landroid/view/LayoutInflater;)V

    .line 223
    invoke-virtual {v4, v8}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->layout(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    .line 224
    invoke-virtual {v4, v3}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->init(Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    .line 225
    invoke-virtual {v4, v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->registerClickListener(Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    .line 226
    invoke-virtual {v4, v0}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->binder(Lcom/vk/music/view/adapter/ItemViewHolder$Binder;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    const/4 v5, 0x4

    .line 227
    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->viewType(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    .line 228
    invoke-virtual {v4}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->build()Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v4

    iput-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->popularAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    .line 229
    new-instance v4, Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-direct {v4}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;-><init>()V

    iput-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->emptyAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    .line 230
    iget-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->emptyAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v5, p0, Lcom/vk/music/view/SearchSuggestionContainer;->recentsCaptionAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v4, v5}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 231
    iget-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->emptyAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v5, p0, Lcom/vk/music/view/SearchSuggestionContainer;->recentsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v4, v5}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 232
    iget-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->emptyAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v5, p0, Lcom/vk/music/view/SearchSuggestionContainer;->popularCaptionAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v4, v5}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 233
    iget-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->emptyAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v5, p0, Lcom/vk/music/view/SearchSuggestionContainer;->popularAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v4, v5}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 235
    new-instance v4, Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    invoke-direct {v4, v2}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;-><init>(Landroid/view/LayoutInflater;)V

    .line 236
    invoke-virtual {v4, v8}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->layout(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    new-instance v5, Lcom/vk/music/view/SearchSuggestionContainer$3;

    invoke-direct {v5, p0}, Lcom/vk/music/view/SearchSuggestionContainer$3;-><init>(Lcom/vk/music/view/SearchSuggestionContainer;)V

    .line 237
    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->binder(Lcom/vk/music/view/adapter/ItemViewHolder$Binder;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    invoke-static {p0}, Lcom/vk/music/view/SearchSuggestionContainer$$Lambda$6;->lambdaFactory$(Lcom/vk/music/view/SearchSuggestionContainer;)Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;

    move-result-object v5

    .line 249
    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->registerClickListener(Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    const/4 v5, 0x5

    .line 250
    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->viewType(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    .line 251
    invoke-virtual {v4}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->build()Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v4

    iput-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->hintsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    .line 252
    new-instance v4, Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {p0, v2}, Lcom/vk/music/view/SearchSuggestionContainer$$Lambda$7;->lambdaFactory$(Lcom/vk/music/view/SearchSuggestionContainer;Landroid/view/LayoutInflater;)Lcom/vkontakte/android/functions/F1;

    move-result-object v5

    invoke-static {p0}, Lcom/vk/music/view/SearchSuggestionContainer$$Lambda$8;->lambdaFactory$(Lcom/vk/music/view/SearchSuggestionContainer;)Lcom/vkontakte/android/functions/VoidF;

    move-result-object v6

    const/4 v7, 0x6

    invoke-direct {v4, v5, v6, v7}, Lcom/vk/music/view/adapter/ViewAdapter;-><init>(Lcom/vkontakte/android/functions/F1;Lcom/vkontakte/android/functions/VoidF;I)V

    iput-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchActionAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 262
    new-instance v4, Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-direct {v4}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;-><init>()V

    iput-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    .line 263
    iget-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v5, p0, Lcom/vk/music/view/SearchSuggestionContainer;->hintsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v4, v5}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 264
    iget-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v5, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchActionAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v4, v5}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 265
    return-void
.end method

.method static synthetic access$000(Lcom/vk/music/view/SearchSuggestionContainer;)Ljava/lang/CharSequence;
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/view/SearchSuggestionContainer;

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/vk/music/view/SearchSuggestionContainer;->getSearchText()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/music/view/SearchSuggestionContainer;Ljava/lang/String;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/view/SearchSuggestionContainer;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Z

    .prologue
    .line 41
    invoke-direct {p0, p1, p2}, Lcom/vk/music/view/SearchSuggestionContainer;->setSearchText(Ljava/lang/String;Z)V

    return-void
.end method

.method private bind()V
    .locals 8

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 304
    invoke-direct {p0}, Lcom/vk/music/view/SearchSuggestionContainer;->getSearchText()Ljava/lang/CharSequence;

    move-result-object v2

    .line 305
    .local v2, "query":Ljava/lang/CharSequence;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 306
    invoke-virtual {p0}, Lcom/vk/music/view/SearchSuggestionContainer;->getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {p0}, Lcom/vk/music/view/SearchSuggestionContainer;->getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v4

    iget-object v7, p0, Lcom/vk/music/view/SearchSuggestionContainer;->emptyAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    if-eq v4, v7, :cond_1

    .line 307
    :cond_0
    iget-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->emptyAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-virtual {p0, v4}, Lcom/vk/music/view/SearchSuggestionContainer;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 309
    :cond_1
    iget-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->model:Lcom/vk/music/model/SearchSuggestionModel;

    invoke-interface {v4}, Lcom/vk/music/model/SearchSuggestionModel;->getRecents()Ljava/util/List;

    move-result-object v3

    .line 310
    .local v3, "recents":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v7, p0, Lcom/vk/music/view/SearchSuggestionContainer;->recentsCaptionAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {v3}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v4

    if-nez v4, :cond_2

    move v4, v5

    :goto_0
    invoke-virtual {v7, v4}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 311
    iget-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->recentsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v4, v3}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    .line 312
    iget-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->model:Lcom/vk/music/model/SearchSuggestionModel;

    invoke-interface {v4}, Lcom/vk/music/model/SearchSuggestionModel;->getPopular()Ljava/util/List;

    move-result-object v1

    .line 313
    .local v1, "popular":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez v1, :cond_3

    .line 314
    iget-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->popularCaptionAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v4, v6}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 315
    iget-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->model:Lcom/vk/music/model/SearchSuggestionModel;

    invoke-interface {v4}, Lcom/vk/music/model/SearchSuggestionModel;->loadPopular()V

    .line 331
    .end local v1    # "popular":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "recents":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_1
    return-void

    .restart local v3    # "recents":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_2
    move v4, v6

    .line 310
    goto :goto_0

    .line 317
    .restart local v1    # "popular":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_3
    iget-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->popularCaptionAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-static {v1}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v7

    if-nez v7, :cond_4

    :goto_2
    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 318
    iget-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->popularAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v4, v1}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    goto :goto_1

    :cond_4
    move v5, v6

    .line 317
    goto :goto_2

    .line 321
    .end local v1    # "popular":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "recents":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_5
    invoke-virtual {p0}, Lcom/vk/music/view/SearchSuggestionContainer;->getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v4

    if-eqz v4, :cond_6

    invoke-virtual {p0}, Lcom/vk/music/view/SearchSuggestionContainer;->getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v4

    iget-object v5, p0, Lcom/vk/music/view/SearchSuggestionContainer;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    if-eq v4, v5, :cond_7

    .line 322
    :cond_6
    iget-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-virtual {p0, v4}, Lcom/vk/music/view/SearchSuggestionContainer;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 324
    :cond_7
    iget-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->model:Lcom/vk/music/model/SearchSuggestionModel;

    invoke-interface {v4}, Lcom/vk/music/model/SearchSuggestionModel;->getHints()Ljava/util/List;

    move-result-object v0

    .line 325
    .local v0, "hints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez v0, :cond_8

    .line 326
    iget-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->model:Lcom/vk/music/model/SearchSuggestionModel;

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/vk/music/model/SearchSuggestionModel;->loadHints(Ljava/lang/String;)V

    goto :goto_1

    .line 328
    :cond_8
    iget-object v4, p0, Lcom/vk/music/view/SearchSuggestionContainer;->hintsAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v4, v0}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    goto :goto_1
.end method

.method private getSearchText()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 334
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchInputView:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    .line 335
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    .line 337
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private setSearchText(Ljava/lang/String;Z)V
    .locals 2
    .param p1, "text"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "ignoreSearch"    # Z

    .prologue
    .line 342
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchInputView:Landroid/widget/EditText;

    if-eqz v0, :cond_1

    .line 343
    if-eqz p2, :cond_0

    .line 344
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchInputView:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchTextWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 346
    :cond_0
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 347
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchInputView:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchInputView:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 348
    if-eqz p2, :cond_1

    .line 349
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchInputView:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchTextWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 352
    :cond_1
    return-void
.end method


# virtual methods
.method attach(Landroid/widget/EditText;)V
    .locals 2
    .param p1, "inputView"    # Landroid/widget/EditText;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 282
    iput-object p1, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchInputView:Landroid/widget/EditText;

    .line 284
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchInputView:Landroid/widget/EditText;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 285
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchInputView:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/vk/music/view/SearchSuggestionContainer;->userListener:Lcom/vk/music/view/SearchSuggestionContainer$UserListener;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 286
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchInputView:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchTextWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 287
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchInputView:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchTextWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 289
    invoke-direct {p0}, Lcom/vk/music/view/SearchSuggestionContainer;->bind()V

    .line 290
    return-void
.end method

.method detach()V
    .locals 2

    .prologue
    .line 293
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchInputView:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    .line 294
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchInputView:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchTextWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 295
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchInputView:Landroid/widget/EditText;

    .line 297
    :cond_0
    return-void
.end method

.method synthetic lambda$new$0(Landroid/view/View;)V
    .locals 2
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 178
    check-cast p1, Landroid/widget/TextView;

    .end local p1    # "itemView":Landroid/view/View;
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->resourcer:Lcom/vk/core/util/Resourcer;

    const v1, 0x7f0f008d

    invoke-virtual {v0, v1}, Lcom/vk/core/util/Resourcer;->color(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method

.method synthetic lambda$new$1(Landroid/view/View;Ljava/lang/String;I)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "s"    # Ljava/lang/String;
    .param p3, "position"    # I

    .prologue
    .line 179
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->userListener:Lcom/vk/music/view/SearchSuggestionContainer$UserListener;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/SearchSuggestionContainer$UserListener;->onRecentOrPopularClick(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$new$3(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    .line 197
    const v2, 0x7f03012d

    const/4 v3, 0x0

    invoke-virtual {p1, v2, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 198
    .local v1, "captionView":Landroid/view/View;
    const v2, 0x7f1003c5

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    const v3, 0x7f0803aa

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 199
    const v2, 0x7f1003c6

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 200
    .local v0, "captionButton":Landroid/widget/TextView;
    const v2, 0x7f0803a3

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 201
    invoke-static {p0}, Lcom/vk/music/view/SearchSuggestionContainer$$Lambda$10;->lambdaFactory$(Lcom/vk/music/view/SearchSuggestionContainer;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 202
    return-object v1
.end method

.method synthetic lambda$new$4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    .line 215
    const v0, 0x7f03012c

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->popularCaptionView:Landroid/widget/TextView;

    .line 216
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->popularCaptionView:Landroid/widget/TextView;

    const v1, 0x7f0803a9

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 217
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->popularCaptionView:Landroid/widget/TextView;

    return-object v0
.end method

.method synthetic lambda$new$5(Lcom/vk/music/model/SearchSuggestionModel;)V
    .locals 2
    .param p1, "model"    # Lcom/vk/music/model/SearchSuggestionModel;

    .prologue
    .line 219
    iget-object v1, p0, Lcom/vk/music/view/SearchSuggestionContainer;->popularCaptionView:Landroid/widget/TextView;

    invoke-interface {p1}, Lcom/vk/music/model/SearchSuggestionModel;->getRecents()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-static {v1, v0}, Lcom/vk/core/util/DrawableUtils;->setLeft(Landroid/widget/TextView;I)V

    return-void

    :cond_0
    const v0, 0x7f02030c

    goto :goto_0
.end method

.method synthetic lambda$new$6(Landroid/view/View;Ljava/lang/String;I)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "s"    # Ljava/lang/String;
    .param p3, "position"    # I

    .prologue
    .line 249
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->userListener:Lcom/vk/music/view/SearchSuggestionContainer$UserListener;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/SearchSuggestionContainer$UserListener;->onHintClick(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$new$8(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    .line 254
    const v0, 0x7f03014b

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchActionView:Landroid/widget/TextView;

    .line 255
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchActionView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/vk/music/view/SearchSuggestionContainer;->resourcer:Lcom/vk/core/util/Resourcer;

    const v2, 0x7f0f008d

    invoke-virtual {v1, v2}, Lcom/vk/core/util/Resourcer;->color(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 256
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchActionView:Landroid/widget/TextView;

    invoke-static {p0}, Lcom/vk/music/view/SearchSuggestionContainer$$Lambda$9;->lambdaFactory$(Lcom/vk/music/view/SearchSuggestionContainer;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 257
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchActionView:Landroid/widget/TextView;

    return-object v0
.end method

.method synthetic lambda$new$9()V
    .locals 6

    .prologue
    .line 259
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->searchActionView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/vk/music/view/SearchSuggestionContainer;->resourcer:Lcom/vk/core/util/Resourcer;

    const v2, 0x7f0803e7

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-direct {p0}, Lcom/vk/music/view/SearchSuggestionContainer;->getSearchText()Ljava/lang/CharSequence;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/vk/core/util/Resourcer;->str(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$null$2(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 201
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->userListener:Lcom/vk/music/view/SearchSuggestionContainer$UserListener;

    invoke-virtual {v0}, Lcom/vk/music/view/SearchSuggestionContainer$UserListener;->onClearRecentsClick()V

    return-void
.end method

.method synthetic lambda$null$7(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 256
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->userListener:Lcom/vk/music/view/SearchSuggestionContainer$UserListener;

    invoke-virtual {v0}, Lcom/vk/music/view/SearchSuggestionContainer$UserListener;->onSearchClick()V

    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .prologue
    .line 269
    invoke-super {p0}, Lme/grishka/appkit/views/UsableRecyclerView;->onAttachedToWindow()V

    .line 271
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->model:Lcom/vk/music/model/SearchSuggestionModel;

    invoke-interface {v0, p0}, Lcom/vk/music/model/SearchSuggestionModel;->subscribe(Lcom/vk/music/model/SearchSuggestionModel$Callback;)V

    .line 272
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 276
    invoke-super {p0}, Lme/grishka/appkit/views/UsableRecyclerView;->onDetachedFromWindow()V

    .line 278
    iget-object v0, p0, Lcom/vk/music/view/SearchSuggestionContainer;->model:Lcom/vk/music/model/SearchSuggestionModel;

    invoke-interface {v0, p0}, Lcom/vk/music/model/SearchSuggestionModel;->unsubscribe(Lcom/vk/music/model/SearchSuggestionModel$Callback;)V

    .line 279
    return-void
.end method

.method public onHintsLoadingDone(Lcom/vk/music/model/SearchSuggestionModel;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/SearchSuggestionModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 372
    invoke-direct {p0}, Lcom/vk/music/view/SearchSuggestionContainer;->bind()V

    .line 373
    return-void
.end method

.method public onHintsLoadingError(Lcom/vk/music/model/SearchSuggestionModel;Ljava/lang/String;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/SearchSuggestionModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "reason"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 378
    return-void
.end method

.method public onPopularLoadingDone(Lcom/vk/music/model/SearchSuggestionModel;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/SearchSuggestionModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 362
    invoke-direct {p0}, Lcom/vk/music/view/SearchSuggestionContainer;->bind()V

    .line 363
    return-void
.end method

.method public onPopularLoadingError(Lcom/vk/music/model/SearchSuggestionModel;Ljava/lang/String;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/SearchSuggestionModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "reason"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 368
    return-void
.end method

.method public onRecentsChanged(Lcom/vk/music/model/SearchSuggestionModel;)V
    .locals 0
    .param p1, "model"    # Lcom/vk/music/model/SearchSuggestionModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 357
    invoke-direct {p0}, Lcom/vk/music/view/SearchSuggestionContainer;->bind()V

    .line 358
    return-void
.end method

.method setListener(Lcom/vk/music/view/SearchSuggestionContainer$Listener;)V
    .locals 0
    .param p1, "listener"    # Lcom/vk/music/view/SearchSuggestionContainer$Listener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 300
    iput-object p1, p0, Lcom/vk/music/view/SearchSuggestionContainer;->listener:Lcom/vk/music/view/SearchSuggestionContainer$Listener;

    .line 301
    return-void
.end method
