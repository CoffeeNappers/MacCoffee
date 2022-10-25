.class public abstract Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "SegmenterFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration$Provider;
.implements Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;
.implements Lcom/vkontakte/android/ui/recyclerview/FastScroller$Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/base/SegmenterFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x404
    name = "GridAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "VH:",
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<TT;>;>",
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter;",
        "Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration$Provider;",
        "Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;",
        "Lcom/vkontakte/android/ui/recyclerview/FastScroller$Provider;"
    }
.end annotation


# static fields
.field protected static final TYPE_FOOTER:I = 0x2

.field protected static final TYPE_HEADER:I = 0x0

.field protected static final TYPE_ITEM:I = 0x1


# instance fields
.field protected mSegmenter:Lcom/vkontakte/android/ui/util/Segmenter;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/base/SegmenterFragment;


# direct methods
.method protected constructor <init>(Lcom/vkontakte/android/fragments/base/SegmenterFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/base/SegmenterFragment;

    .prologue
    .line 134
    .local p0, "this":Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;, "Lcom/vkontakte/android/fragments/base/SegmenterFragment<TT;>.GridAdapter<TT;TVH;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->this$0:Lcom/vkontakte/android/fragments/base/SegmenterFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    return-void
.end method


# virtual methods
.method protected adjustMultiColumn(Lcom/tonicartos/superslim/GridSLM$LayoutParams;)V
    .locals 2
    .param p1, "params"    # Lcom/tonicartos/superslim/GridSLM$LayoutParams;

    .prologue
    .line 193
    .local p0, "this":Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;, "Lcom/vkontakte/android/fragments/base/SegmenterFragment<TT;>.GridAdapter<TT;TVH;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->this$0:Lcom/vkontakte/android/fragments/base/SegmenterFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;->access$100(Lcom/vkontakte/android/fragments/base/SegmenterFragment;)I

    move-result v0

    const/16 v1, 0x258

    if-lt v0, v1, :cond_1

    .line 194
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->this$0:Lcom/vkontakte/android/fragments/base/SegmenterFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;->access$200(Lcom/vkontakte/android/fragments/base/SegmenterFragment;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 195
    const/high16 v0, 0x43200000    # 160.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->setColumnWidth(I)V

    .line 196
    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->setNumColumns(I)V

    .line 204
    :goto_0
    return-void

    .line 198
    :cond_0
    const/high16 v0, 0x43870000    # 270.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->setColumnWidth(I)V

    .line 199
    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->setNumColumns(I)V

    goto :goto_0

    .line 202
    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->setNumColumns(I)V

    goto :goto_0
.end method

.method public bindCustomViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/tonicartos/superslim/GridSLM$LayoutParams;I)V
    .locals 0
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "params"    # Lcom/tonicartos/superslim/GridSLM$LayoutParams;
    .param p3, "position"    # I

    .prologue
    .line 170
    .local p0, "this":Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;, "Lcom/vkontakte/android/fragments/base/SegmenterFragment<TT;>.GridAdapter<TT;TVH;>;"
    return-void
.end method

.method public bindFooterHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/tonicartos/superslim/GridSLM$LayoutParams;I)V
    .locals 2
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "params"    # Lcom/tonicartos/superslim/GridSLM$LayoutParams;
    .param p3, "position"    # I

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;, "Lcom/vkontakte/android/fragments/base/SegmenterFragment<TT;>.GridAdapter<TT;TVH;>;"
    const/4 v1, 0x1

    .line 177
    check-cast p1, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;

    .end local p1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->mSegmenter:Lcom/vkontakte/android/ui/util/Segmenter;

    invoke-interface {v0}, Lcom/vkontakte/android/ui/util/Segmenter;->getFooter()Lcom/vkontakte/android/ui/util/Segmenter$Footer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->bind(Ljava/lang/Object;)V

    .line 178
    iput-boolean v1, p2, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->isHeader:Z

    .line 179
    iput v1, p2, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->headerDisplay:I

    .line 180
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->this$0:Lcom/vkontakte/android/fragments/base/SegmenterFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;->access$000(Lcom/vkontakte/android/fragments/base/SegmenterFragment;)Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput v0, p2, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->topMargin:I

    .line 181
    invoke-virtual {p2, p3}, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->setFirstPosition(I)V

    .line 182
    return-void

    .line 180
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->this$0:Lcom/vkontakte/android/fragments/base/SegmenterFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;->access$000(Lcom/vkontakte/android/fragments/base/SegmenterFragment;)Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;->getPaddingBottom()I

    move-result v0

    goto :goto_0
.end method

.method public bindHeaderHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/tonicartos/superslim/GridSLM$LayoutParams;I)V
    .locals 2
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "params"    # Lcom/tonicartos/superslim/GridSLM$LayoutParams;
    .param p3, "position"    # I

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;, "Lcom/vkontakte/android/fragments/base/SegmenterFragment<TT;>.GridAdapter<TT;TVH;>;"
    const/4 v1, 0x1

    .line 159
    check-cast p1, Lcom/vkontakte/android/fragments/friends/HeaderHolder;

    .end local p1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {p0, p3}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->getPopupText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/friends/HeaderHolder;->bind(Ljava/lang/Object;)V

    .line 160
    iput-boolean v1, p2, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->isHeader:Z

    .line 161
    iput v1, p2, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->headerDisplay:I

    .line 162
    return-void
.end method

.method public bindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;Lcom/tonicartos/superslim/GridSLM$LayoutParams;I)V
    .locals 1
    .param p2, "params"    # Lcom/tonicartos/superslim/GridSLM$LayoutParams;
    .param p3, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TVH;",
            "Lcom/tonicartos/superslim/GridSLM$LayoutParams;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 167
    .local p0, "this":Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;, "Lcom/vkontakte/android/fragments/base/SegmenterFragment<TT;>.GridAdapter<TT;TVH;>;"
    .local p1, "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "TVH;"
    invoke-virtual {p0, p3}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->bind(Ljava/lang/Object;)V

    .line 168
    return-void
.end method

.method public createFooterHolder(Landroid/view/ViewGroup;)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 173
    .local p0, "this":Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;, "Lcom/vkontakte/android/fragments/base/SegmenterFragment<TT;>.GridAdapter<TT;TVH;>;"
    new-instance v0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;-><init>(Landroid/view/ViewGroup;)V

    return-object v0
.end method

.method public createHeaderHolder(Landroid/view/ViewGroup;)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 155
    .local p0, "this":Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;, "Lcom/vkontakte/android/fragments/base/SegmenterFragment<TT;>.GridAdapter<TT;TVH;>;"
    new-instance v0, Lcom/vkontakte/android/fragments/friends/HeaderHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/fragments/friends/HeaderHolder;-><init>(Landroid/view/ViewGroup;)V

    return-object v0
.end method

.method public abstract createViewHolder(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            ")TVH;"
        }
    .end annotation
.end method

.method public drawAfter(I)Z
    .locals 11
    .param p1, "position"    # I

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;, "Lcom/vkontakte/android/fragments/base/SegmenterFragment<TT;>.GridAdapter<TT;TVH;>;"
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 278
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->getItemViewType(I)I

    move-result v7

    if-ne v7, v8, :cond_2

    .line 279
    iget-object v7, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->mSegmenter:Lcom/vkontakte/android/ui/util/Segmenter;

    invoke-interface {v7, p1}, Lcom/vkontakte/android/ui/util/Segmenter;->getSegmentIndex(I)I

    move-result v2

    .line 280
    .local v2, "lastHeaderPosition":I
    iget-object v7, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->mSegmenter:Lcom/vkontakte/android/ui/util/Segmenter;

    invoke-interface {v7, p1}, Lcom/vkontakte/android/ui/util/Segmenter;->getSegmentForPosition(I)I

    move-result v1

    .line 281
    .local v1, "currentSection":I
    iget-object v7, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->mSegmenter:Lcom/vkontakte/android/ui/util/Segmenter;

    invoke-interface {v7, v1}, Lcom/vkontakte/android/ui/util/Segmenter;->getSegmentItemsCount(I)I

    move-result v6

    .line 282
    .local v6, "segmentItemsCount":I
    iget-object v7, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->this$0:Lcom/vkontakte/android/fragments/base/SegmenterFragment;

    invoke-virtual {v7}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;->getColumnsCount()I

    move-result v0

    .line 283
    .local v0, "columnsCount":I
    iget-object v7, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->mSegmenter:Lcom/vkontakte/android/ui/util/Segmenter;

    invoke-interface {v7, v2}, Lcom/vkontakte/android/ui/util/Segmenter;->isHeader(I)Z

    move-result v5

    .line 284
    .local v5, "segmentHasHeader":Z
    sub-int v10, p1, v2

    if-eqz v5, :cond_0

    move v7, v8

    :goto_0
    sub-int v4, v10, v7

    .line 285
    .local v4, "positionInSegment":I
    invoke-static {v6, v0}, Lcom/vkontakte/android/ui/MathUtils;->truncate(II)I

    move-result v3

    .line 287
    .local v3, "lastRowStart":I
    if-lt v4, v3, :cond_1

    iget-object v7, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->mSegmenter:Lcom/vkontakte/android/ui/util/Segmenter;

    invoke-interface {v7}, Lcom/vkontakte/android/ui/util/Segmenter;->getSegmentsCount()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    if-ge v1, v7, :cond_1

    .line 289
    .end local v0    # "columnsCount":I
    .end local v1    # "currentSection":I
    .end local v2    # "lastHeaderPosition":I
    .end local v3    # "lastRowStart":I
    .end local v4    # "positionInSegment":I
    .end local v5    # "segmentHasHeader":Z
    .end local v6    # "segmentItemsCount":I
    :goto_1
    return v8

    .restart local v0    # "columnsCount":I
    .restart local v1    # "currentSection":I
    .restart local v2    # "lastHeaderPosition":I
    .restart local v5    # "segmentHasHeader":Z
    .restart local v6    # "segmentItemsCount":I
    :cond_0
    move v7, v9

    .line 284
    goto :goto_0

    .restart local v3    # "lastRowStart":I
    .restart local v4    # "positionInSegment":I
    :cond_1
    move v8, v9

    .line 287
    goto :goto_1

    .end local v0    # "columnsCount":I
    .end local v1    # "currentSection":I
    .end local v2    # "lastHeaderPosition":I
    .end local v3    # "lastRowStart":I
    .end local v4    # "positionInSegment":I
    .end local v5    # "segmentHasHeader":Z
    .end local v6    # "segmentItemsCount":I
    :cond_2
    move v8, v9

    .line 289
    goto :goto_1
.end method

.method public getBlockType(I)I
    .locals 4
    .param p1, "position"    # I

    .prologue
    .line 265
    .local p0, "this":Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;, "Lcom/vkontakte/android/fragments/base/SegmenterFragment<TT;>.GridAdapter<TT;TVH;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->getItemCount()I

    move-result v3

    iget-object v2, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->mSegmenter:Lcom/vkontakte/android/ui/util/Segmenter;

    invoke-interface {v2}, Lcom/vkontakte/android/ui/util/Segmenter;->getFooter()Lcom/vkontakte/android/ui/util/Segmenter$Footer;

    move-result-object v2

    if-eqz v2, :cond_2

    const/4 v2, 0x2

    :goto_0
    sub-int v0, v3, v2

    .line 266
    .local v0, "itemCount":I
    const/4 v1, 0x0

    .line 267
    .local v1, "result":I
    if-nez p1, :cond_0

    .line 268
    or-int/lit8 v1, v1, 0x2

    .line 270
    :cond_0
    if-nez v1, :cond_1

    if-gt p1, v0, :cond_1

    .line 271
    or-int/lit8 v1, v1, 0x1

    .line 273
    :cond_1
    return v1

    .line 265
    .end local v0    # "itemCount":I
    .end local v1    # "result":I
    :cond_2
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public getImageCountForItem(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 255
    .local p0, "this":Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;, "Lcom/vkontakte/android/fragments/base/SegmenterFragment<TT;>.GridAdapter<TT;TVH;>;"
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->getItemViewType(I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->getImagesCountForItem(I)I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 1
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 260
    .local p0, "this":Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;, "Lcom/vkontakte/android/fragments/base/SegmenterFragment<TT;>.GridAdapter<TT;TVH;>;"
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->getImageUrl(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getImageUrl(II)Ljava/lang/String;
    .locals 1
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 189
    .local p0, "this":Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;, "Lcom/vkontakte/android/fragments/base/SegmenterFragment<TT;>.GridAdapter<TT;TVH;>;"
    const/4 v0, 0x0

    return-object v0
.end method

.method public getImagesCountForItem(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 185
    .local p0, "this":Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;, "Lcom/vkontakte/android/fragments/base/SegmenterFragment<TT;>.GridAdapter<TT;TVH;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 306
    .local p0, "this":Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;, "Lcom/vkontakte/android/fragments/base/SegmenterFragment<TT;>.GridAdapter<TT;TVH;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->mSegmenter:Lcom/vkontakte/android/ui/util/Segmenter;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/ui/util/Segmenter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 294
    .local p0, "this":Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;, "Lcom/vkontakte/android/fragments/base/SegmenterFragment<TT;>.GridAdapter<TT;TVH;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->mSegmenter:Lcom/vkontakte/android/ui/util/Segmenter;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->mSegmenter:Lcom/vkontakte/android/ui/util/Segmenter;

    invoke-interface {v0}, Lcom/vkontakte/android/ui/util/Segmenter;->getFooter()Lcom/vkontakte/android/ui/util/Segmenter$Footer;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->mSegmenter:Lcom/vkontakte/android/ui/util/Segmenter;

    invoke-interface {v0}, Lcom/vkontakte/android/ui/util/Segmenter;->getItemCount()I

    move-result v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->mSegmenter:Lcom/vkontakte/android/ui/util/Segmenter;

    invoke-interface {v0}, Lcom/vkontakte/android/ui/util/Segmenter;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 250
    .local p0, "this":Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;, "Lcom/vkontakte/android/fragments/base/SegmenterFragment<TT;>.GridAdapter<TT;TVH;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->mSegmenter:Lcom/vkontakte/android/ui/util/Segmenter;

    invoke-interface {v0}, Lcom/vkontakte/android/ui/util/Segmenter;->getItemCount()I

    move-result v0

    if-ne p1, v0, :cond_0

    const/4 v0, 0x2

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->mSegmenter:Lcom/vkontakte/android/ui/util/Segmenter;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/ui/util/Segmenter;->isHeader(I)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getPopupText(I)Ljava/lang/CharSequence;
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 299
    .local p0, "this":Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;, "Lcom/vkontakte/android/fragments/base/SegmenterFragment<TT;>.GridAdapter<TT;TVH;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->getItemCount()I

    move-result v0

    if-ne p1, v0, :cond_0

    .line 300
    add-int/lit8 p1, p1, -0x1

    .line 302
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->mSegmenter:Lcom/vkontakte/android/ui/util/Segmenter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->mSegmenter:Lcom/vkontakte/android/ui/util/Segmenter;

    invoke-interface {v1, p1}, Lcom/vkontakte/android/ui/util/Segmenter;->getSegmentForPosition(I)I

    move-result v1

    invoke-interface {v0, v1}, Lcom/vkontakte/android/ui/util/Segmenter;->getSegment(I)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 3
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;, "Lcom/vkontakte/android/fragments/base/SegmenterFragment<TT;>.GridAdapter<TT;TVH;>;"
    const/4 v2, 0x0

    .line 221
    iget-object v1, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-static {v1}, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->from(Landroid/view/ViewGroup$LayoutParams;)Lcom/tonicartos/superslim/GridSLM$LayoutParams;

    move-result-object v0

    .line 222
    .local v0, "params":Lcom/tonicartos/superslim/GridSLM$LayoutParams;
    const/4 v1, -0x2

    iput v1, v0, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->height:I

    .line 223
    iget-object v1, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->this$0:Lcom/vkontakte/android/fragments/base/SegmenterFragment;

    invoke-virtual {v1, p2}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;->getColumnsCount(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->setNumColumns(I)V

    .line 225
    iget-object v1, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->mSegmenter:Lcom/vkontakte/android/ui/util/Segmenter;

    invoke-interface {v1, p2}, Lcom/vkontakte/android/ui/util/Segmenter;->getSegmentIndex(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->setFirstPosition(I)V

    .line 226
    iput v2, v0, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->bottomMargin:I

    .line 227
    iput v2, v0, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->topMargin:I

    .line 228
    sget v1, Lcom/tonicartos/superslim/GridSLM;->ID:I

    invoke-virtual {v0, v1}, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->setSlm(I)V

    .line 229
    iget-object v1, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 231
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->getItemViewType(I)I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 242
    invoke-virtual {p0, p1, v0, p2}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->bindCustomViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/tonicartos/superslim/GridSLM$LayoutParams;I)V

    .line 245
    .end local p1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :goto_0
    return-void

    .line 233
    .restart local p1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :pswitch_0
    check-cast p1, Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    .end local p1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {p0, p1, v0, p2}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->bindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;Lcom/tonicartos/superslim/GridSLM$LayoutParams;I)V

    goto :goto_0

    .line 236
    .restart local p1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :pswitch_1
    invoke-virtual {p0, p1, v0, p2}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->bindHeaderHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/tonicartos/superslim/GridSLM$LayoutParams;I)V

    goto :goto_0

    .line 239
    :pswitch_2
    invoke-virtual {p0, p1, v0, p2}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->bindFooterHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/tonicartos/superslim/GridSLM$LayoutParams;I)V

    goto :goto_0

    .line 231
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 208
    .local p0, "this":Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;, "Lcom/vkontakte/android/fragments/base/SegmenterFragment<TT;>.GridAdapter<TT;TVH;>;"
    packed-switch p2, :pswitch_data_0

    .line 216
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 210
    :pswitch_0
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->createViewHolder(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    move-result-object v0

    goto :goto_0

    .line 212
    :pswitch_1
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->createHeaderHolder(Landroid/view/ViewGroup;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    goto :goto_0

    .line 214
    :pswitch_2
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->createFooterHolder(Landroid/view/ViewGroup;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    goto :goto_0

    .line 208
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public setData(Lcom/vkontakte/android/ui/util/Segmenter;)Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;
    .locals 0
    .param p1, "segmenter"    # Lcom/vkontakte/android/ui/util/Segmenter;

    .prologue
    .line 144
    .local p0, "this":Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;, "Lcom/vkontakte/android/fragments/base/SegmenterFragment<TT;>.GridAdapter<TT;TVH;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->mSegmenter:Lcom/vkontakte/android/ui/util/Segmenter;

    .line 145
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->notifyDataSetChanged()V

    .line 146
    return-object p0
.end method

.method public setDataWithoutUpdate(Lcom/vkontakte/android/ui/util/Segmenter;)Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;
    .locals 0
    .param p1, "segmenter"    # Lcom/vkontakte/android/ui/util/Segmenter;

    .prologue
    .line 150
    .local p0, "this":Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;, "Lcom/vkontakte/android/fragments/base/SegmenterFragment<TT;>.GridAdapter<TT;TVH;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->mSegmenter:Lcom/vkontakte/android/ui/util/Segmenter;

    .line 151
    return-object p0
.end method
