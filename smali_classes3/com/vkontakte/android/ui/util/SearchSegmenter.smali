.class public Lcom/vkontakte/android/ui/util/SearchSegmenter;
.super Ljava/lang/Object;
.source "SearchSegmenter.java"

# interfaces
.implements Lcom/vkontakte/android/ui/util/Segmenter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/util/SearchSegmenter$LoadingListener;,
        Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator;,
        Lcom/vkontakte/android/ui/util/SearchSegmenter$Handler;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/ui/util/Segmenter;"
    }
.end annotation


# instance fields
.field mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

.field final mCount:I

.field mCurrentSearchRequest:Lme/grishka/appkit/api/APIRequest;

.field mData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation
.end field

.field mExecuting:Z

.field final mFooter:Lcom/vkontakte/android/ui/util/Segmenter$Footer;

.field final mGenerator:Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator",
            "<+TT;>;"
        }
    .end annotation
.end field

.field final mGlobalSearchData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation
.end field

.field mGlobalTitle:Ljava/lang/CharSequence;

.field final mHandler:Lcom/vkontakte/android/ui/util/SearchSegmenter$Handler;

.field mListener:Lcom/vkontakte/android/ui/util/SearchSegmenter$LoadingListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/ui/util/SearchSegmenter$LoadingListener",
            "<TT;>;"
        }
    .end annotation
.end field

.field mLocalSearchData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation
.end field

.field mMoreAvailable:Z

.field mOffset:I

.field mQuery:Ljava/lang/String;

.field mSearchIndexer:Lcom/vkontakte/android/fragments/friends/SearchIndexer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/fragments/friends/SearchIndexer",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/friends/SearchIndexer$Provider;Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator;I)V
    .locals 2
    .param p1    # Lcom/vkontakte/android/fragments/friends/SearchIndexer$Provider;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/fragments/friends/SearchIndexer$Provider",
            "<-TT;>;",
            "Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator",
            "<TT;>;I)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/vkontakte/android/ui/util/SearchSegmenter;, "Lcom/vkontakte/android/ui/util/SearchSegmenter<TT;>;"
    .local p1, "provider":Lcom/vkontakte/android/fragments/friends/SearchIndexer$Provider;, "Lcom/vkontakte/android/fragments/friends/SearchIndexer$Provider<-TT;>;"
    .local p2, "generator":Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator;, "Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator<TT;>;"
    const/4 v1, 0x0

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Lcom/vkontakte/android/ui/util/SearchSegmenter$Handler;

    invoke-direct {v0}, Lcom/vkontakte/android/ui/util/SearchSegmenter$Handler;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mHandler:Lcom/vkontakte/android/ui/util/SearchSegmenter$Handler;

    .line 27
    new-instance v0, Lcom/vkontakte/android/ui/util/Segmenter$Footer;

    invoke-direct {v0}, Lcom/vkontakte/android/ui/util/Segmenter$Footer;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mFooter:Lcom/vkontakte/android/ui/util/Segmenter$Footer;

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mGlobalSearchData:Ljava/util/List;

    .line 37
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mMoreAvailable:Z

    .line 38
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mExecuting:Z

    .line 98
    new-instance v0, Lcom/vkontakte/android/fragments/friends/SearchIndexer;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/fragments/friends/SearchIndexer;-><init>(Lcom/vkontakte/android/fragments/friends/SearchIndexer$Provider;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mSearchIndexer:Lcom/vkontakte/android/fragments/friends/SearchIndexer;

    .line 99
    iput-object p2, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mGenerator:Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator;

    .line 100
    iput p3, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mCount:I

    .line 101
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/util/SearchSegmenter;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/util/SearchSegmenter;

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->notifyDataSetChanged()V

    return-void
.end method

.method static empty(Ljava/util/Collection;)Z
    .locals 1
    .param p0, "collection"    # Ljava/util/Collection;

    .prologue
    .line 272
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private notifyDataSetChanged()V
    .locals 1

    .prologue
    .line 260
    .local p0, "this":Lcom/vkontakte/android/ui/util/SearchSegmenter;, "Lcom/vkontakte/android/ui/util/SearchSegmenter<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    if-eqz v0, :cond_0

    .line 261
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 263
    :cond_0
    return-void
.end method


# virtual methods
.method public attach(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1
    .param p1, "list"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 104
    .local p0, "this":Lcom/vkontakte/android/ui/util/SearchSegmenter;, "Lcom/vkontakte/android/ui/util/SearchSegmenter<TT;>;"
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    .line 106
    return-void
.end method

.method public bind(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 116
    .local p0, "this":Lcom/vkontakte/android/ui/util/SearchSegmenter;, "Lcom/vkontakte/android/ui/util/SearchSegmenter<TT;>;"
    .local p1, "data":Ljava/util/List;, "Ljava/util/List<TT;>;"
    iput-object p1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mData:Ljava/util/List;

    .line 117
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mSearchIndexer:Lcom/vkontakte/android/fragments/friends/SearchIndexer;

    iget-object v1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mData:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/SearchIndexer;->bind(Ljava/util/List;)V

    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mSearchIndexer:Lcom/vkontakte/android/fragments/friends/SearchIndexer;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/SearchIndexer;->build()V

    .line 119
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 242
    .local p0, "this":Lcom/vkontakte/android/ui/util/SearchSegmenter;, "Lcom/vkontakte/android/ui/util/SearchSegmenter<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 243
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 245
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mGlobalSearchData:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 246
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mGlobalSearchData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 248
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mSearchIndexer:Lcom/vkontakte/android/fragments/friends/SearchIndexer;

    if-eqz v0, :cond_2

    .line 249
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mSearchIndexer:Lcom/vkontakte/android/fragments/friends/SearchIndexer;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/SearchIndexer;->clear()V

    .line 251
    :cond_2
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mData:Ljava/util/List;

    .line 252
    return-void
.end method

.method public getFooter()Lcom/vkontakte/android/ui/util/Segmenter$Footer;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 268
    .local p0, "this":Lcom/vkontakte/android/ui/util/SearchSegmenter;, "Lcom/vkontakte/android/ui/util/SearchSegmenter<TT;>;"
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mMoreAvailable:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mFooter:Lcom/vkontakte/android/ui/util/Segmenter$Footer;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 3
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<D:",
            "Ljava/lang/Object;",
            ">(I)TD;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/vkontakte/android/ui/util/SearchSegmenter;, "Lcom/vkontakte/android/ui/util/SearchSegmenter<TT;>;"
    const/4 v1, 0x0

    .line 219
    iget-object v2, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    invoke-static {v2}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->empty(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v0, v1

    .line 220
    .local v0, "localSize":I
    :goto_0
    if-ge p1, v0, :cond_1

    .line 221
    iget-object v1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 226
    :goto_1
    return-object v1

    .line 219
    .end local v0    # "localSize":I
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0

    .line 223
    .restart local v0    # "localSize":I
    :cond_1
    if-ne p1, v0, :cond_2

    .line 224
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->getSegment(I)Ljava/lang/CharSequence;

    move-result-object v1

    goto :goto_1

    .line 226
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mGlobalSearchData:Ljava/util/List;

    sub-int v2, p1, v0

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1
.end method

.method public getItemCount()I
    .locals 2

    .prologue
    .line 157
    .local p0, "this":Lcom/vkontakte/android/ui/util/SearchSegmenter;, "Lcom/vkontakte/android/ui/util/SearchSegmenter<TT;>;"
    const/4 v0, 0x0

    .line 158
    .local v0, "count":I
    iget-object v1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    invoke-static {v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->empty(Ljava/util/Collection;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 159
    iget-object v1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr v0, v1

    .line 161
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mGlobalSearchData:Ljava/util/List;

    invoke-static {v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->empty(Ljava/util/Collection;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 162
    iget-object v1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mGlobalSearchData:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr v0, v1

    .line 163
    add-int/lit8 v0, v0, 0x1

    .line 165
    :cond_1
    return v0
.end method

.method public getPositionForSegment(I)I
    .locals 1
    .param p1, "segment"    # I

    .prologue
    .line 196
    .local p0, "this":Lcom/vkontakte/android/ui/util/SearchSegmenter;, "Lcom/vkontakte/android/ui/util/SearchSegmenter<TT;>;"
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 197
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    invoke-static {v0}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->empty(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 198
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 201
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSegment(I)Ljava/lang/CharSequence;
    .locals 1
    .param p1, "section"    # I

    .prologue
    .line 231
    .local p0, "this":Lcom/vkontakte/android/ui/util/SearchSegmenter;, "Lcom/vkontakte/android/ui/util/SearchSegmenter<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mGlobalTitle:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getSegmentForPosition(I)I
    .locals 3
    .param p1, "position"    # I

    .prologue
    .local p0, "this":Lcom/vkontakte/android/ui/util/SearchSegmenter;, "Lcom/vkontakte/android/ui/util/SearchSegmenter<TT;>;"
    const/4 v1, 0x0

    .line 206
    iget-object v2, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    invoke-static {v2}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->empty(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_1

    move v0, v1

    .line 207
    .local v0, "localSize":I
    :goto_0
    if-lt p1, v0, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    invoke-static {v2}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->empty(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_0
    :goto_1
    return v1

    .line 206
    .end local v0    # "localSize":I
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0

    .line 207
    .restart local v0    # "localSize":I
    :cond_2
    const/4 v1, 0x1

    goto :goto_1
.end method

.method public getSegmentIndex(I)I
    .locals 3
    .param p1, "position"    # I

    .prologue
    .local p0, "this":Lcom/vkontakte/android/ui/util/SearchSegmenter;, "Lcom/vkontakte/android/ui/util/SearchSegmenter<TT;>;"
    const/4 v1, 0x0

    .line 212
    iget-object v2, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    invoke-static {v2}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->empty(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_2

    move v0, v1

    .line 213
    .local v0, "localSize":I
    :goto_0
    if-lt p1, v0, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    invoke-static {v2}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->empty(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    move v0, v1

    .end local v0    # "localSize":I
    :cond_1
    return v0

    .line 212
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getSegmentItemsCount(I)I
    .locals 1
    .param p1, "segment"    # I

    .prologue
    .line 182
    .local p0, "this":Lcom/vkontakte/android/ui/util/SearchSegmenter;, "Lcom/vkontakte/android/ui/util/SearchSegmenter<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    invoke-static {v0}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->empty(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 183
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mGlobalSearchData:Ljava/util/List;

    invoke-static {v0}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->empty(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 184
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mGlobalSearchData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 191
    :goto_0
    return v0

    .line 187
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    invoke-static {v0}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->empty(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 188
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0

    .line 191
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSegmentsCount()I
    .locals 2

    .prologue
    .line 170
    .local p0, "this":Lcom/vkontakte/android/ui/util/SearchSegmenter;, "Lcom/vkontakte/android/ui/util/SearchSegmenter<TT;>;"
    const/4 v0, 0x0

    .line 171
    .local v0, "count":I
    iget-object v1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    invoke-static {v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->empty(Ljava/util/Collection;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 172
    add-int/lit8 v0, v0, 0x1

    .line 174
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mGlobalSearchData:Ljava/util/List;

    invoke-static {v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->empty(Ljava/util/Collection;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 175
    add-int/lit8 v0, v0, 0x1

    .line 177
    :cond_1
    return v0
.end method

.method public isHeader(I)Z
    .locals 3
    .param p1, "position"    # I

    .prologue
    .local p0, "this":Lcom/vkontakte/android/ui/util/SearchSegmenter;, "Lcom/vkontakte/android/ui/util/SearchSegmenter<TT;>;"
    const/4 v1, 0x0

    .line 236
    iget-object v2, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    invoke-static {v2}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->empty(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_1

    move v0, v1

    .line 237
    .local v0, "localSize":I
    :goto_0
    if-ne p1, v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    .line 236
    .end local v0    # "localSize":I
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0
.end method

.method public onScrollToLastItem()V
    .locals 2

    .prologue
    .line 110
    .local p0, "this":Lcom/vkontakte/android/ui/util/SearchSegmenter;, "Lcom/vkontakte/android/ui/util/SearchSegmenter<TT;>;"
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mMoreAvailable:Z

    if-eqz v0, :cond_0

    .line 111
    iget v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mOffset:I

    iget v1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mCount:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->runSearchRequest(II)V

    .line 113
    :cond_0
    return-void
.end method

.method public remove(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 122
    .local p0, "this":Lcom/vkontakte/android/ui/util/SearchSegmenter;, "Lcom/vkontakte/android/ui/util/SearchSegmenter<TT;>;"
    .local p1, "object":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 123
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 125
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mGlobalSearchData:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 126
    return-void
.end method

.method runSearchRequest(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 47
    .local p0, "this":Lcom/vkontakte/android/ui/util/SearchSegmenter;, "Lcom/vkontakte/android/ui/util/SearchSegmenter<TT;>;"
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mExecuting:Z

    if-nez v0, :cond_2

    .line 48
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mCurrentSearchRequest:Lme/grishka/appkit/api/APIRequest;

    if-eqz v0, :cond_0

    .line 49
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mCurrentSearchRequest:Lme/grishka/appkit/api/APIRequest;

    invoke-virtual {v0}, Lme/grishka/appkit/api/APIRequest;->cancel()V

    .line 51
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mFooter:Lcom/vkontakte/android/ui/util/Segmenter$Footer;

    iget-object v0, v0, Lcom/vkontakte/android/ui/util/Segmenter$Footer;->mState:Lcom/vkontakte/android/ui/util/Segmenter$Footer$State;

    sget-object v1, Lcom/vkontakte/android/ui/util/Segmenter$Footer$State;->Loading:Lcom/vkontakte/android/ui/util/Segmenter$Footer$State;

    if-eq v0, v1, :cond_1

    .line 52
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mFooter:Lcom/vkontakte/android/ui/util/Segmenter$Footer;

    sget-object v1, Lcom/vkontakte/android/ui/util/Segmenter$Footer$State;->Loading:Lcom/vkontakte/android/ui/util/Segmenter$Footer$State;

    iput-object v1, v0, Lcom/vkontakte/android/ui/util/Segmenter$Footer;->mState:Lcom/vkontakte/android/ui/util/Segmenter$Footer$State;

    .line 53
    invoke-direct {p0}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->notifyDataSetChanged()V

    .line 55
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mExecuting:Z

    .line 56
    iget-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mGenerator:Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator;

    iget-object v1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mQuery:Ljava/lang/String;

    invoke-interface {v0, v1, p1, p2}, Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator;->getSearchRequest(Ljava/lang/String;II)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/ui/util/SearchSegmenter$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/vkontakte/android/ui/util/SearchSegmenter$1;-><init>(Lcom/vkontakte/android/ui/util/SearchSegmenter;II)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 93
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/os/Looper;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mCurrentSearchRequest:Lme/grishka/appkit/api/APIRequest;

    .line 95
    :cond_2
    return-void
.end method

.method public search(Ljava/lang/String;)V
    .locals 1
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 152
    .local p0, "this":Lcom/vkontakte/android/ui/util/SearchSegmenter;, "Lcom/vkontakte/android/ui/util/SearchSegmenter<TT;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->search(Ljava/lang/String;Z)V

    .line 153
    return-void
.end method

.method public search(Ljava/lang/String;Z)V
    .locals 4
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "global"    # Z

    .prologue
    .line 134
    .local p0, "this":Lcom/vkontakte/android/ui/util/SearchSegmenter;, "Lcom/vkontakte/android/ui/util/SearchSegmenter<TT;>;"
    iput-object p1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mQuery:Ljava/lang/String;

    .line 135
    iget-object v1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mSearchIndexer:Lcom/vkontakte/android/fragments/friends/SearchIndexer;

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/fragments/friends/SearchIndexer;->search(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mLocalSearchData:Ljava/util/List;

    .line 136
    iget-object v1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mCurrentSearchRequest:Lme/grishka/appkit/api/APIRequest;

    if-eqz v1, :cond_0

    .line 137
    iget-object v1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mCurrentSearchRequest:Lme/grishka/appkit/api/APIRequest;

    invoke-virtual {v1}, Lme/grishka/appkit/api/APIRequest;->cancel()V

    .line 139
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mExecuting:Z

    .line 140
    iget-object v1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mGlobalSearchData:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 141
    iput-boolean p2, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mMoreAvailable:Z

    .line 142
    invoke-direct {p0}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->notifyDataSetChanged()V

    .line 143
    if-eqz p2, :cond_1

    .line 144
    iget-object v1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mHandler:Lcom/vkontakte/android/ui/util/SearchSegmenter$Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/util/SearchSegmenter$Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 145
    iget-object v1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mHandler:Lcom/vkontakte/android/ui/util/SearchSegmenter$Handler;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter$Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 146
    .local v0, "message":Landroid/os/Message;
    iput-object p0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 147
    iget-object v1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mHandler:Lcom/vkontakte/android/ui/util/SearchSegmenter$Handler;

    const-wide/16 v2, 0x190

    invoke-virtual {v1, v0, v2, v3}, Lcom/vkontakte/android/ui/util/SearchSegmenter$Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 149
    .end local v0    # "message":Landroid/os/Message;
    :cond_1
    return-void
.end method

.method public setGlobalTitle(Ljava/lang/CharSequence;)Lcom/vkontakte/android/ui/util/SearchSegmenter;
    .locals 0
    .param p1, "title"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")",
            "Lcom/vkontakte/android/ui/util/SearchSegmenter",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 129
    .local p0, "this":Lcom/vkontakte/android/ui/util/SearchSegmenter;, "Lcom/vkontakte/android/ui/util/SearchSegmenter<TT;>;"
    iput-object p1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mGlobalTitle:Ljava/lang/CharSequence;

    .line 130
    return-object p0
.end method

.method public setLoadingListener(Lcom/vkontakte/android/ui/util/SearchSegmenter$LoadingListener;)Lcom/vkontakte/android/ui/util/SearchSegmenter;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/ui/util/SearchSegmenter$LoadingListener",
            "<TT;>;)",
            "Lcom/vkontakte/android/ui/util/SearchSegmenter",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 255
    .local p0, "this":Lcom/vkontakte/android/ui/util/SearchSegmenter;, "Lcom/vkontakte/android/ui/util/SearchSegmenter<TT;>;"
    .local p1, "listener":Lcom/vkontakte/android/ui/util/SearchSegmenter$LoadingListener;, "Lcom/vkontakte/android/ui/util/SearchSegmenter$LoadingListener<TT;>;"
    iput-object p1, p0, Lcom/vkontakte/android/ui/util/SearchSegmenter;->mListener:Lcom/vkontakte/android/ui/util/SearchSegmenter$LoadingListener;

    .line 256
    return-object p0
.end method
