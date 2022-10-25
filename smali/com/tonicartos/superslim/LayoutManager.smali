.class public Lcom/tonicartos/superslim/LayoutManager;
.super Landroid/support/v7/widget/RecyclerView$LayoutManager;
.source "LayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tonicartos/superslim/LayoutManager$UnknownSectionLayoutException;,
        Lcom/tonicartos/superslim/LayoutManager$NotYetImplementedSlmException;,
        Lcom/tonicartos/superslim/LayoutManager$SavedState;,
        Lcom/tonicartos/superslim/LayoutManager$LayoutParams;,
        Lcom/tonicartos/superslim/LayoutManager$Builder;,
        Lcom/tonicartos/superslim/LayoutManager$Direction;
    }
.end annotation


# static fields
.field public static final INVALID_POSITON:I = -0x1

.field private static final NO_POSITION_REQUEST:I = -0x1

.field static final SECTION_MANAGER_CUSTOM:I = -0x1

.field static final SECTION_MANAGER_GRID:I = 0x2

.field static final SECTION_MANAGER_LINEAR:I = 0x1

.field static final SECTION_MANAGER_STAGGERED_GRID:I = 0x3


# instance fields
.field private final mGridSlm:Lcom/tonicartos/superslim/SectionLayoutManager;

.field private final mLinearSlm:Lcom/tonicartos/superslim/SectionLayoutManager;

.field private mRect:Landroid/graphics/Rect;

.field private mRequestPosition:I

.field private mRequestPositionOffset:I

.field private mSlms:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/tonicartos/superslim/SectionLayoutManager;",
            ">;"
        }
    .end annotation
.end field

.field private mSmoothScrollEnabled:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 64
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;-><init>()V

    .line 54
    const/4 v0, -0x1

    iput v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mRequestPosition:I

    .line 56
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mRect:Landroid/graphics/Rect;

    .line 58
    const/4 v0, 0x0

    iput v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mRequestPositionOffset:I

    .line 62
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mSmoothScrollEnabled:Z

    .line 65
    new-instance v0, Lcom/tonicartos/superslim/LinearSLM;

    invoke-direct {v0, p0}, Lcom/tonicartos/superslim/LinearSLM;-><init>(Lcom/tonicartos/superslim/LayoutManager;)V

    iput-object v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mLinearSlm:Lcom/tonicartos/superslim/SectionLayoutManager;

    .line 66
    new-instance v0, Lcom/tonicartos/superslim/GridSLM;

    invoke-direct {v0, p0, p1}, Lcom/tonicartos/superslim/GridSLM;-><init>(Lcom/tonicartos/superslim/LayoutManager;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mGridSlm:Lcom/tonicartos/superslim/SectionLayoutManager;

    .line 67
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mSlms:Ljava/util/HashMap;

    .line 68
    return-void
.end method

.method constructor <init>(Lcom/tonicartos/superslim/LayoutManager$Builder;)V
    .locals 2
    .param p1, "builder"    # Lcom/tonicartos/superslim/LayoutManager$Builder;

    .prologue
    .line 70
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;-><init>()V

    .line 54
    const/4 v0, -0x1

    iput v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mRequestPosition:I

    .line 56
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mRect:Landroid/graphics/Rect;

    .line 58
    const/4 v0, 0x0

    iput v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mRequestPositionOffset:I

    .line 62
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mSmoothScrollEnabled:Z

    .line 71
    new-instance v0, Lcom/tonicartos/superslim/LinearSLM;

    invoke-direct {v0, p0}, Lcom/tonicartos/superslim/LinearSLM;-><init>(Lcom/tonicartos/superslim/LayoutManager;)V

    iput-object v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mLinearSlm:Lcom/tonicartos/superslim/SectionLayoutManager;

    .line 72
    new-instance v0, Lcom/tonicartos/superslim/GridSLM;

    iget-object v1, p1, Lcom/tonicartos/superslim/LayoutManager$Builder;->context:Landroid/content/Context;

    invoke-direct {v0, p0, v1}, Lcom/tonicartos/superslim/GridSLM;-><init>(Lcom/tonicartos/superslim/LayoutManager;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mGridSlm:Lcom/tonicartos/superslim/SectionLayoutManager;

    .line 73
    iget-object v0, p1, Lcom/tonicartos/superslim/LayoutManager$Builder;->slms:Ljava/util/HashMap;

    iput-object v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mSlms:Ljava/util/HashMap;

    .line 74
    return-void
.end method

.method static synthetic access$000(Lcom/tonicartos/superslim/LayoutManager;I)I
    .locals 1
    .param p0, "x0"    # Lcom/tonicartos/superslim/LayoutManager;
    .param p1, "x1"    # I

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/tonicartos/superslim/LayoutManager;->getDirectionToPosition(I)I

    move-result v0

    return v0
.end method

.method private attachHeaderForStart(Landroid/view/View;ILcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)V
    .locals 1
    .param p1, "header"    # Landroid/view/View;
    .param p2, "leadingEdge"    # I
    .param p3, "sd"    # Lcom/tonicartos/superslim/SectionData;
    .param p4, "state"    # Lcom/tonicartos/superslim/LayoutState;

    .prologue
    .line 660
    iget v0, p3, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    invoke-virtual {p4, v0}, Lcom/tonicartos/superslim/LayoutState;->getCachedView(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 661
    invoke-virtual {p0, p1}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v0

    if-le v0, p2, :cond_0

    .line 662
    iget v0, p3, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    invoke-direct {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->findLastIndexForSection(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/tonicartos/superslim/LayoutManager;->addView(Landroid/view/View;I)V

    .line 663
    iget v0, p3, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    invoke-virtual {p4, v0}, Lcom/tonicartos/superslim/LayoutState;->decacheView(I)V

    .line 668
    :cond_0
    return-void
.end method

.method private binarySearchForLastPosition(III)I
    .locals 7
    .param p1, "min"    # I
    .param p2, "max"    # I
    .param p3, "sfp"    # I

    .prologue
    .line 671
    if-ge p2, p1, :cond_1

    .line 672
    const/4 v2, -0x1

    .line 709
    :cond_0
    :goto_0
    return v2

    .line 675
    :cond_1
    sub-int v5, p2, p1

    div-int/lit8 v5, v5, 0x2

    add-int v2, p1, v5

    .line 677
    .local v2, "mid":I
    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 678
    .local v0, "candidate":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 679
    .local v4, "params":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    invoke-virtual {v4}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getTestedFirstPosition()I

    move-result v5

    if-ge v5, p3, :cond_2

    .line 680
    add-int/lit8 v5, v2, 0x1

    invoke-direct {p0, v5, p2, p3}, Lcom/tonicartos/superslim/LayoutManager;->binarySearchForLastPosition(III)I

    move-result v2

    goto :goto_0

    .line 683
    :cond_2
    invoke-virtual {v4}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getTestedFirstPosition()I

    move-result v5

    if-gt v5, p3, :cond_3

    iget-boolean v5, v4, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeader:Z

    if-eqz v5, :cond_4

    .line 684
    :cond_3
    add-int/lit8 v5, v2, -0x1

    invoke-direct {p0, p1, v5, p3}, Lcom/tonicartos/superslim/LayoutManager;->binarySearchForLastPosition(III)I

    move-result v2

    goto :goto_0

    .line 687
    :cond_4
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-eq v2, v5, :cond_0

    .line 691
    add-int/lit8 v5, v2, 0x1

    invoke-virtual {p0, v5}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 692
    .local v3, "next":Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 693
    .local v1, "lp":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    invoke-virtual {v1}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getTestedFirstPosition()I

    move-result v5

    if-ne v5, p3, :cond_0

    .line 697
    iget-boolean v5, v1, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeader:Z

    if-eqz v5, :cond_5

    .line 698
    add-int/lit8 v5, v2, 0x1

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-eq v5, v6, :cond_0

    .line 702
    add-int/lit8 v5, v2, 0x2

    invoke-virtual {p0, v5}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 703
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .end local v1    # "lp":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    check-cast v1, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 704
    .restart local v1    # "lp":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    invoke-virtual {v1}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getTestedFirstPosition()I

    move-result v5

    if-ne v5, p3, :cond_0

    .line 709
    :cond_5
    add-int/lit8 v5, v2, 0x1

    invoke-direct {p0, v5, p2, p3}, Lcom/tonicartos/superslim/LayoutManager;->binarySearchForLastPosition(III)I

    move-result v2

    goto :goto_0
.end method

.method private fillNextSectionToEnd(IILcom/tonicartos/superslim/LayoutState;)I
    .locals 8
    .param p1, "leadingEdge"    # I
    .param p2, "markerLine"    # I
    .param p3, "state"    # Lcom/tonicartos/superslim/LayoutState;

    .prologue
    .line 723
    if-lt p2, p1, :cond_0

    move v1, p2

    .line 761
    :goto_0
    return v1

    .line 727
    :cond_0
    invoke-direct {p0}, Lcom/tonicartos/superslim/LayoutManager;->getAnchorAtEnd()Landroid/view/View;

    move-result-object v7

    .line 728
    .local v7, "last":Landroid/view/View;
    if-nez v7, :cond_1

    move v1, p2

    .line 729
    goto :goto_0

    .line 731
    :cond_1
    invoke-virtual {p0, v7}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    add-int/lit8 v3, v1, 0x1

    .line 733
    .local v3, "anchorPosition":I
    invoke-virtual {p3}, Lcom/tonicartos/superslim/LayoutState;->getRecyclerState()Landroid/support/v7/widget/RecyclerView$State;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v1

    if-lt v3, v1, :cond_2

    move v1, p2

    .line 734
    goto :goto_0

    .line 737
    :cond_2
    invoke-virtual {p3, v3}, Lcom/tonicartos/superslim/LayoutState;->getView(I)Lcom/tonicartos/superslim/LayoutState$View;

    move-result-object v6

    .line 738
    .local v6, "header":Lcom/tonicartos/superslim/LayoutState$View;
    new-instance v4, Lcom/tonicartos/superslim/SectionData;

    iget-object v1, v6, Lcom/tonicartos/superslim/LayoutState$View;->view:Landroid/view/View;

    invoke-direct {v4, p0, v1}, Lcom/tonicartos/superslim/SectionData;-><init>(Lcom/tonicartos/superslim/LayoutManager;Landroid/view/View;)V

    .line 739
    .local v4, "sd":Lcom/tonicartos/superslim/SectionData;
    iget-boolean v1, v4, Lcom/tonicartos/superslim/SectionData;->hasHeader:Z

    if-eqz v1, :cond_6

    .line 740
    iget-object v1, v6, Lcom/tonicartos/superslim/LayoutState$View;->view:Landroid/view/View;

    invoke-virtual {p0, v1}, Lcom/tonicartos/superslim/LayoutManager;->measureHeader(Landroid/view/View;)V

    .line 741
    new-instance v4, Lcom/tonicartos/superslim/SectionData;

    .end local v4    # "sd":Lcom/tonicartos/superslim/SectionData;
    iget-object v1, v6, Lcom/tonicartos/superslim/LayoutState$View;->view:Landroid/view/View;

    invoke-direct {v4, p0, v1}, Lcom/tonicartos/superslim/SectionData;-><init>(Lcom/tonicartos/superslim/LayoutManager;Landroid/view/View;)V

    .line 742
    .restart local v4    # "sd":Lcom/tonicartos/superslim/SectionData;
    iget-object v1, v6, Lcom/tonicartos/superslim/LayoutState$View;->view:Landroid/view/View;

    invoke-direct {p0, v1, p2, v4, p3}, Lcom/tonicartos/superslim/LayoutManager;->layoutHeaderTowardsEnd(Landroid/view/View;ILcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)I

    move-result p2

    .line 743
    add-int/lit8 v3, v3, 0x1

    .line 748
    :goto_1
    invoke-virtual {p3}, Lcom/tonicartos/superslim/LayoutState;->getRecyclerState()Landroid/support/v7/widget/RecyclerView$State;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v1

    if-ge v3, v1, :cond_3

    .line 749
    invoke-direct {p0, v4}, Lcom/tonicartos/superslim/LayoutManager;->getSlm(Lcom/tonicartos/superslim/SectionData;)Lcom/tonicartos/superslim/SectionLayoutManager;

    move-result-object v0

    .local v0, "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    move v1, p1

    move v2, p2

    move-object v5, p3

    .line 750
    invoke-virtual/range {v0 .. v5}, Lcom/tonicartos/superslim/SectionLayoutManager;->fillToEnd(IIILcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)I

    move-result p2

    .line 753
    .end local v0    # "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    :cond_3
    iget-boolean v1, v4, Lcom/tonicartos/superslim/SectionData;->hasHeader:Z

    if-eqz v1, :cond_5

    .line 754
    iget-object v1, v6, Lcom/tonicartos/superslim/LayoutState$View;->view:Landroid/view/View;

    invoke-virtual {p0, v1}, Lcom/tonicartos/superslim/LayoutManager;->addView(Landroid/view/View;)V

    .line 755
    iget-boolean v1, v6, Lcom/tonicartos/superslim/LayoutState$View;->wasCached:Z

    if-eqz v1, :cond_4

    .line 756
    iget v1, v4, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    invoke-virtual {p3, v1}, Lcom/tonicartos/superslim/LayoutState;->decacheView(I)V

    .line 758
    :cond_4
    iget-object v1, v6, Lcom/tonicartos/superslim/LayoutState$View;->view:Landroid/view/View;

    invoke-virtual {p0, v1}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v1

    invoke-static {v1, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 761
    :cond_5
    invoke-direct {p0, p1, p2, p3}, Lcom/tonicartos/superslim/LayoutManager;->fillNextSectionToEnd(IILcom/tonicartos/superslim/LayoutState;)I

    move-result v1

    goto :goto_0

    .line 745
    :cond_6
    iget-object v1, v6, Lcom/tonicartos/superslim/LayoutState$View;->view:Landroid/view/View;

    invoke-virtual {p3, v3, v1}, Lcom/tonicartos/superslim/LayoutState;->cacheView(ILandroid/view/View;)V

    goto :goto_1
.end method

.method private fillNextSectionToStart(IILcom/tonicartos/superslim/LayoutState;)I
    .locals 23
    .param p1, "leadingEdge"    # I
    .param p2, "markerLine"    # I
    .param p3, "state"    # Lcom/tonicartos/superslim/LayoutState;

    .prologue
    .line 773
    move/from16 v0, p2

    move/from16 v1, p1

    if-ge v0, v1, :cond_0

    move/from16 v4, p2

    .line 830
    :goto_0
    return v4

    .line 777
    :cond_0
    invoke-direct/range {p0 .. p0}, Lcom/tonicartos/superslim/LayoutManager;->getAnchorAtStart()Landroid/view/View;

    move-result-object v20

    .line 778
    .local v20, "preAnchor":Landroid/view/View;
    invoke-virtual/range {v20 .. v20}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v21

    check-cast v21, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 779
    .local v21, "preAnchorParams":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    invoke-virtual/range {v21 .. v21}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getFirstPosition()I

    move-result v4

    const/4 v5, 0x0

    sget-object v8, Lcom/tonicartos/superslim/LayoutManager$Direction;->START:Lcom/tonicartos/superslim/LayoutManager$Direction;

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5, v8}, Lcom/tonicartos/superslim/LayoutManager;->findAttachedHeaderOrFirstViewForSection(IILcom/tonicartos/superslim/LayoutManager$Direction;)Landroid/view/View;

    move-result-object v18

    .line 782
    .local v18, "first":Landroid/view/View;
    if-eqz v18, :cond_1

    .line 783
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v4

    add-int/lit8 v6, v4, -0x1

    .line 788
    .local v6, "anchorPosition":I
    :goto_1
    if-gez v6, :cond_2

    move/from16 v4, p2

    .line 789
    goto :goto_0

    .line 785
    .end local v6    # "anchorPosition":I
    :cond_1
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v4

    add-int/lit8 v6, v4, -0x1

    .restart local v6    # "anchorPosition":I
    goto :goto_1

    .line 792
    :cond_2
    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Lcom/tonicartos/superslim/LayoutState;->getView(I)Lcom/tonicartos/superslim/LayoutState$View;

    move-result-object v16

    .line 793
    .local v16, "anchor":Lcom/tonicartos/superslim/LayoutState$View;
    invoke-virtual/range {v16 .. v16}, Lcom/tonicartos/superslim/LayoutState$View;->getLayoutParams()Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    move-result-object v17

    .line 795
    .local v17, "anchorParams":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    invoke-virtual/range {v17 .. v17}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getTestedFirstPosition()I

    move-result v22

    .line 798
    .local v22, "sfp":I
    sget-object v4, Lcom/tonicartos/superslim/LayoutManager$Direction;->START:Lcom/tonicartos/superslim/LayoutManager$Direction;

    move-object/from16 v0, p0

    move/from16 v1, v22

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v4, v2}, Lcom/tonicartos/superslim/LayoutManager;->getHeaderOrFirstViewForSection(ILcom/tonicartos/superslim/LayoutManager$Direction;Lcom/tonicartos/superslim/LayoutState;)Landroid/view/View;

    move-result-object v9

    .line 799
    .local v9, "header":Landroid/view/View;
    new-instance v7, Lcom/tonicartos/superslim/SectionData;

    move-object/from16 v0, p0

    invoke-direct {v7, v0, v9}, Lcom/tonicartos/superslim/SectionData;-><init>(Lcom/tonicartos/superslim/LayoutManager;Landroid/view/View;)V

    .line 800
    .local v7, "sd":Lcom/tonicartos/superslim/SectionData;
    iget-boolean v4, v7, Lcom/tonicartos/superslim/SectionData;->hasHeader:Z

    if-eqz v4, :cond_3

    .line 801
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lcom/tonicartos/superslim/LayoutManager;->measureHeader(Landroid/view/View;)V

    .line 802
    new-instance v7, Lcom/tonicartos/superslim/SectionData;

    .end local v7    # "sd":Lcom/tonicartos/superslim/SectionData;
    move-object/from16 v0, p0

    invoke-direct {v7, v0, v9}, Lcom/tonicartos/superslim/SectionData;-><init>(Lcom/tonicartos/superslim/LayoutManager;Landroid/view/View;)V

    .line 806
    .restart local v7    # "sd":Lcom/tonicartos/superslim/SectionData;
    :cond_3
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/tonicartos/superslim/LayoutManager;->getSlm(Lcom/tonicartos/superslim/SectionData;)Lcom/tonicartos/superslim/SectionLayoutManager;

    move-result-object v3

    .line 807
    .local v3, "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    move/from16 v13, p2

    .line 808
    .local v13, "sectionBottom":I
    if-ltz v6, :cond_4

    move/from16 v4, p1

    move/from16 v5, p2

    move-object/from16 v8, p3

    .line 809
    invoke-virtual/range {v3 .. v8}, Lcom/tonicartos/superslim/SectionLayoutManager;->fillToStart(IIILcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)I

    move-result p2

    .line 813
    :cond_4
    iget-boolean v4, v7, Lcom/tonicartos/superslim/SectionData;->hasHeader:Z

    if-eqz v4, :cond_7

    .line 814
    const/4 v12, 0x0

    .line 815
    .local v12, "headerOffset":I
    iget-object v4, v7, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-virtual {v4}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderInline()Z

    move-result v4

    if-eqz v4, :cond_5

    iget-object v4, v7, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-virtual {v4}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderOverlay()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 816
    :cond_5
    iget v4, v7, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Lcom/tonicartos/superslim/SectionLayoutManager;->getFirstVisibleView(IZ)Landroid/view/View;

    move-result-object v19

    .line 817
    .local v19, "firstVisibleView":Landroid/view/View;
    if-nez v19, :cond_8

    .line 818
    const/4 v12, 0x0

    .end local v19    # "firstVisibleView":Landroid/view/View;
    :cond_6
    :goto_2
    move-object/from16 v8, p0

    move/from16 v10, p1

    move/from16 v11, p2

    move-object v14, v7

    move-object/from16 v15, p3

    .line 824
    invoke-direct/range {v8 .. v15}, Lcom/tonicartos/superslim/LayoutManager;->layoutHeaderTowardsStart(Landroid/view/View;IIIILcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)I

    move-result p2

    .line 827
    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p3

    invoke-direct {v0, v9, v1, v7, v2}, Lcom/tonicartos/superslim/LayoutManager;->attachHeaderForStart(Landroid/view/View;ILcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)V

    .line 830
    .end local v12    # "headerOffset":I
    :cond_7
    invoke-direct/range {p0 .. p3}, Lcom/tonicartos/superslim/LayoutManager;->fillNextSectionToStart(IILcom/tonicartos/superslim/LayoutState;)I

    move-result v4

    goto/16 :goto_0

    .line 821
    .restart local v12    # "headerOffset":I
    .restart local v19    # "firstVisibleView":Landroid/view/View;
    :cond_8
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v4

    move-object/from16 v0, p3

    invoke-virtual {v3, v4, v7, v0}, Lcom/tonicartos/superslim/SectionLayoutManager;->computeHeaderOffset(ILcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)I

    move-result v12

    goto :goto_2
.end method

.method private fillToEnd(ILcom/tonicartos/superslim/LayoutState;)I
    .locals 9
    .param p1, "leadingEdge"    # I
    .param p2, "state"    # Lcom/tonicartos/superslim/LayoutState;

    .prologue
    .line 841
    invoke-direct {p0}, Lcom/tonicartos/superslim/LayoutManager;->getAnchorAtEnd()Landroid/view/View;

    move-result-object v0

    .line 843
    .local v0, "anchor":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 844
    .local v1, "anchorParams":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    invoke-virtual {v1}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getTestedFirstPosition()I

    move-result v6

    .line 845
    .local v6, "sfp":I
    sget-object v8, Lcom/tonicartos/superslim/LayoutManager$Direction;->END:Lcom/tonicartos/superslim/LayoutManager$Direction;

    invoke-direct {p0, v6, v8, p2}, Lcom/tonicartos/superslim/LayoutManager;->getHeaderOrFirstViewForSection(ILcom/tonicartos/superslim/LayoutManager$Direction;Lcom/tonicartos/superslim/LayoutState;)Landroid/view/View;

    move-result-object v2

    .line 846
    .local v2, "first":Landroid/view/View;
    new-instance v5, Lcom/tonicartos/superslim/SectionData;

    invoke-direct {v5, p0, v2}, Lcom/tonicartos/superslim/SectionData;-><init>(Lcom/tonicartos/superslim/LayoutManager;Landroid/view/View;)V

    .line 848
    .local v5, "sd":Lcom/tonicartos/superslim/SectionData;
    invoke-direct {p0, v5}, Lcom/tonicartos/superslim/LayoutManager;->getSlm(Lcom/tonicartos/superslim/SectionData;)Lcom/tonicartos/superslim/SectionLayoutManager;

    move-result-object v7

    .line 849
    .local v7, "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    invoke-virtual {v7, p1, v0, v5, p2}, Lcom/tonicartos/superslim/SectionLayoutManager;->finishFillToEnd(ILandroid/view/View;Lcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)I

    move-result v4

    .line 851
    .local v4, "markerLine":I
    iget v8, v5, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    invoke-direct {p0, v8}, Lcom/tonicartos/superslim/LayoutManager;->findAttachedHeaderForSectionFromEnd(I)Landroid/view/View;

    move-result-object v3

    .line 852
    .local v3, "header":Landroid/view/View;
    invoke-direct {p0, v3, v4}, Lcom/tonicartos/superslim/LayoutManager;->updateHeaderForEnd(Landroid/view/View;I)I

    move-result v4

    .line 854
    if-gt v4, p1, :cond_0

    .line 855
    invoke-direct {p0, p1, v4, p2}, Lcom/tonicartos/superslim/LayoutManager;->fillNextSectionToEnd(IILcom/tonicartos/superslim/LayoutState;)I

    move-result v4

    .line 858
    :cond_0
    return v4
.end method

.method private fillToStart(ILcom/tonicartos/superslim/LayoutState;)I
    .locals 11
    .param p1, "leadingEdge"    # I
    .param p2, "state"    # Lcom/tonicartos/superslim/LayoutState;

    .prologue
    .line 869
    invoke-direct {p0}, Lcom/tonicartos/superslim/LayoutManager;->getAnchorAtStart()Landroid/view/View;

    move-result-object v6

    .line 871
    .local v6, "anchor":Landroid/view/View;
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 872
    .local v7, "anchorParams":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    invoke-virtual {v7}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getTestedFirstPosition()I

    move-result v9

    .line 873
    .local v9, "sfp":I
    sget-object v0, Lcom/tonicartos/superslim/LayoutManager$Direction;->START:Lcom/tonicartos/superslim/LayoutManager$Direction;

    invoke-direct {p0, v9, v0, p2}, Lcom/tonicartos/superslim/LayoutManager;->getHeaderOrFirstViewForSection(ILcom/tonicartos/superslim/LayoutManager$Direction;Lcom/tonicartos/superslim/LayoutState;)Landroid/view/View;

    move-result-object v1

    .line 874
    .local v1, "first":Landroid/view/View;
    new-instance v4, Lcom/tonicartos/superslim/SectionData;

    invoke-direct {v4, p0, v1}, Lcom/tonicartos/superslim/SectionData;-><init>(Lcom/tonicartos/superslim/LayoutManager;Landroid/view/View;)V

    .line 876
    .local v4, "sd":Lcom/tonicartos/superslim/SectionData;
    invoke-direct {p0, v4}, Lcom/tonicartos/superslim/LayoutManager;->getSlm(Lcom/tonicartos/superslim/SectionData;)Lcom/tonicartos/superslim/SectionLayoutManager;

    move-result-object v10

    .line 879
    .local v10, "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    invoke-virtual {p0, v6}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v8

    .line 880
    .local v8, "anchorPosition":I
    iget v0, v4, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    if-ne v8, v0, :cond_1

    .line 881
    invoke-virtual {p0, v6}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v3

    .local v3, "markerLine":I
    :goto_0
    move-object v0, p0

    move v2, p1

    move-object v5, p2

    .line 891
    invoke-direct/range {v0 .. v5}, Lcom/tonicartos/superslim/LayoutManager;->updateHeaderForStart(Landroid/view/View;IILcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)I

    move-result v3

    .line 893
    if-le v3, p1, :cond_0

    .line 894
    invoke-direct {p0, p1, v3, p2}, Lcom/tonicartos/superslim/LayoutManager;->fillNextSectionToStart(IILcom/tonicartos/superslim/LayoutState;)I

    move-result v3

    .line 897
    :cond_0
    return v3

    .line 883
    .end local v3    # "markerLine":I
    :cond_1
    add-int/lit8 v0, v8, -0x1

    iget v2, v4, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    if-ne v0, v2, :cond_2

    iget-boolean v0, v4, Lcom/tonicartos/superslim/SectionData;->hasHeader:Z

    if-eqz v0, :cond_2

    .line 885
    invoke-virtual {p0, v6}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v3

    .restart local v3    # "markerLine":I
    goto :goto_0

    .line 887
    .end local v3    # "markerLine":I
    :cond_2
    invoke-virtual {v10, p1, v6, v4, p2}, Lcom/tonicartos/superslim/SectionLayoutManager;->finishFillToStart(ILandroid/view/View;Lcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)I

    move-result v3

    .restart local v3    # "markerLine":I
    goto :goto_0
.end method

.method private fillUntil(ILcom/tonicartos/superslim/LayoutManager$Direction;Lcom/tonicartos/superslim/LayoutState;)I
    .locals 1
    .param p1, "leadingEdge"    # I
    .param p2, "direction"    # Lcom/tonicartos/superslim/LayoutManager$Direction;
    .param p3, "layoutState"    # Lcom/tonicartos/superslim/LayoutState;

    .prologue
    .line 910
    sget-object v0, Lcom/tonicartos/superslim/LayoutManager$Direction;->START:Lcom/tonicartos/superslim/LayoutManager$Direction;

    if-ne p2, v0, :cond_0

    .line 911
    invoke-direct {p0, p1, p3}, Lcom/tonicartos/superslim/LayoutManager;->fillToStart(ILcom/tonicartos/superslim/LayoutState;)I

    move-result v0

    .line 913
    :goto_0
    return v0

    :cond_0
    invoke-direct {p0, p1, p3}, Lcom/tonicartos/superslim/LayoutManager;->fillToEnd(ILcom/tonicartos/superslim/LayoutState;)I

    move-result v0

    goto :goto_0
.end method

.method private findAttachedHeaderForSection(ILcom/tonicartos/superslim/LayoutManager$Direction;)Landroid/view/View;
    .locals 2
    .param p1, "sfp"    # I
    .param p2, "from"    # Lcom/tonicartos/superslim/LayoutManager$Direction;

    .prologue
    .line 927
    sget-object v0, Lcom/tonicartos/superslim/LayoutManager$Direction;->END:Lcom/tonicartos/superslim/LayoutManager$Direction;

    if-ne p2, v0, :cond_0

    .line 928
    invoke-direct {p0, p1}, Lcom/tonicartos/superslim/LayoutManager;->findAttachedHeaderForSectionFromEnd(I)Landroid/view/View;

    move-result-object v0

    .line 930
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-direct {p0, v0, v1, p1}, Lcom/tonicartos/superslim/LayoutManager;->findAttachedHeaderForSectionFromStart(III)Landroid/view/View;

    move-result-object v0

    goto :goto_0
.end method

.method private findAttachedHeaderForSectionFromEnd(I)Landroid/view/View;
    .locals 4
    .param p1, "sfp"    # I

    .prologue
    .line 941
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_0

    .line 942
    invoke-virtual {p0, v1}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 943
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 944
    .local v2, "params":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    invoke-virtual {v2}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getTestedFirstPosition()I

    move-result v3

    if-eq v3, p1, :cond_2

    .line 951
    .end local v0    # "child":Landroid/view/View;
    .end local v2    # "params":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    :cond_0
    const/4 v0, 0x0

    :cond_1
    return-object v0

    .line 946
    .restart local v0    # "child":Landroid/view/View;
    .restart local v2    # "params":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    :cond_2
    iget-boolean v3, v2, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeader:Z

    if-nez v3, :cond_1

    .line 941
    add-int/lit8 v1, v1, -0x1

    goto :goto_0
.end method

.method private findAttachedHeaderForSectionFromStart(III)Landroid/view/View;
    .locals 4
    .param p1, "min"    # I
    .param p2, "max"    # I
    .param p3, "sfp"    # I

    .prologue
    .line 964
    if-ge p2, p1, :cond_1

    .line 965
    const/4 v0, 0x0

    .line 980
    :cond_0
    :goto_0
    return-object v0

    .line 968
    :cond_1
    sub-int v3, p2, p1

    div-int/lit8 v3, v3, 0x2

    add-int v1, p1, v3

    .line 970
    .local v1, "mid":I
    invoke-virtual {p0, v1}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 971
    .local v0, "candidate":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 972
    .local v2, "params":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    invoke-virtual {v2}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getTestedFirstPosition()I

    move-result v3

    if-eq v3, p3, :cond_2

    .line 973
    add-int/lit8 v3, v1, -0x1

    invoke-direct {p0, p1, v3, p3}, Lcom/tonicartos/superslim/LayoutManager;->findAttachedHeaderForSectionFromStart(III)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    .line 976
    :cond_2
    iget-boolean v3, v2, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeader:Z

    if-nez v3, :cond_0

    .line 980
    add-int/lit8 v3, v1, 0x1

    invoke-direct {p0, v3, p2, p3}, Lcom/tonicartos/superslim/LayoutManager;->findAttachedHeaderForSectionFromStart(III)Landroid/view/View;

    move-result-object v0

    goto :goto_0
.end method

.method private findAttachedHeaderOrFirstViewForSection(IILcom/tonicartos/superslim/LayoutManager$Direction;)Landroid/view/View;
    .locals 5
    .param p1, "sfp"    # I
    .param p2, "startIndex"    # I
    .param p3, "from"    # Lcom/tonicartos/superslim/LayoutManager$Direction;

    .prologue
    .line 994
    move v1, p2

    .line 995
    .local v1, "childIndex":I
    sget-object v4, Lcom/tonicartos/superslim/LayoutManager$Direction;->START:Lcom/tonicartos/superslim/LayoutManager$Direction;

    if-ne p3, v4, :cond_0

    const/4 v3, 0x1

    .line 996
    .local v3, "step":I
    :goto_0
    if-ltz v1, :cond_2

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v4

    if-ge v1, v4, :cond_2

    .line 997
    invoke-virtual {p0, v1}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 999
    .local v0, "child":Landroid/view/View;
    invoke-virtual {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v4

    if-ne v4, p1, :cond_1

    .line 1008
    .end local v0    # "child":Landroid/view/View;
    :goto_1
    return-object v0

    .line 995
    .end local v3    # "step":I
    :cond_0
    const/4 v3, -0x1

    goto :goto_0

    .line 1002
    .restart local v0    # "child":Landroid/view/View;
    .restart local v3    # "step":I
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 1003
    .local v2, "params":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    invoke-virtual {v2}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getTestedFirstPosition()I

    move-result v4

    if-eq v4, p1, :cond_3

    .line 1008
    .end local v0    # "child":Landroid/view/View;
    .end local v2    # "params":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    .line 996
    .restart local v0    # "child":Landroid/view/View;
    .restart local v2    # "params":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    :cond_3
    add-int/2addr v1, v3

    goto :goto_0
.end method

.method private findLastIndexForSection(I)I
    .locals 2
    .param p1, "sfp"    # I

    .prologue
    .line 1012
    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-direct {p0, v0, v1, p1}, Lcom/tonicartos/superslim/LayoutManager;->binarySearchForLastPosition(III)I

    move-result v0

    return v0
.end method

.method private fixOverscroll(ILcom/tonicartos/superslim/LayoutState;)V
    .locals 4
    .param p1, "bottomLine"    # I
    .param p2, "state"    # Lcom/tonicartos/superslim/LayoutState;

    .prologue
    .line 1016
    invoke-direct {p0, p2}, Lcom/tonicartos/superslim/LayoutManager;->isOverscrolled(Lcom/tonicartos/superslim/LayoutState;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1031
    :cond_0
    :goto_0
    return-void

    .line 1021
    :cond_1
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getHeight()I

    move-result v2

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v2, v3

    sub-int v0, v2, p1

    .line 1022
    .local v0, "delta":I
    invoke-virtual {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->offsetChildrenVertical(I)V

    .line 1025
    const/4 v2, 0x0

    invoke-direct {p0, v2, p2}, Lcom/tonicartos/superslim/LayoutManager;->fillToStart(ILcom/tonicartos/superslim/LayoutState;)I

    move-result v1

    .line 1027
    .local v1, "topLine":I
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getPaddingTop()I

    move-result v2

    if-le v1, v2, :cond_0

    .line 1029
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getPaddingTop()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->offsetChildrenVertical(I)V

    goto :goto_0
.end method

.method private getAnchorAtEnd()Landroid/view/View;
    .locals 6

    .prologue
    .line 1039
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_1

    .line 1040
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1055
    :cond_0
    :goto_0
    return-object v0

    .line 1042
    :cond_1
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {p0, v4}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1043
    .local v0, "candidate":Landroid/view/View;
    if-nez v0, :cond_2

    .line 1044
    const/4 v0, 0x0

    goto :goto_0

    .line 1046
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 1047
    .local v1, "candidateParams":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    iget-boolean v4, v1, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeader:Z

    if-eqz v4, :cond_0

    .line 1049
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v4

    add-int/lit8 v4, v4, -0x2

    invoke-virtual {p0, v4}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1050
    .local v2, "check":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 1051
    .local v3, "checkParams":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    invoke-virtual {v3}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getTestedFirstPosition()I

    move-result v4

    invoke-virtual {v1}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getTestedFirstPosition()I

    move-result v5

    if-ne v4, v5, :cond_0

    .line 1052
    move-object v0, v2

    goto :goto_0
.end method

.method private getAnchorAtStart()Landroid/view/View;
    .locals 7

    .prologue
    .line 1065
    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1066
    .local v2, "child":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 1067
    .local v4, "params":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    invoke-virtual {v4}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getTestedFirstPosition()I

    move-result v5

    .line 1069
    .local v5, "sfp":I
    iget-boolean v6, v4, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeader:Z

    if-nez v6, :cond_1

    .line 1082
    .end local v2    # "child":Landroid/view/View;
    :cond_0
    :goto_0
    return-object v2

    .line 1073
    .restart local v2    # "child":Landroid/view/View;
    :cond_1
    const/4 v3, 0x1

    .line 1074
    .local v3, "i":I
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v6

    if-ge v3, v6, :cond_0

    .line 1075
    invoke-virtual {p0, v3}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1076
    .local v0, "candidate":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 1077
    .local v1, "candidateParams":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    invoke-virtual {v1}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getTestedFirstPosition()I

    move-result v6

    if-ne v6, v5, :cond_0

    move-object v2, v0

    .line 1078
    goto :goto_0
.end method

.method private getAnchorChild()Landroid/view/View;
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 1091
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v5

    if-nez v5, :cond_1

    .line 1092
    const/4 v0, 0x0

    .line 1125
    :cond_0
    :goto_0
    return-object v0

    .line 1095
    :cond_1
    invoke-virtual {p0, v6}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1096
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 1097
    .local v3, "params":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    invoke-virtual {v3}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getTestedFirstPosition()I

    move-result v4

    .line 1099
    .local v4, "sfp":I
    sget-object v5, Lcom/tonicartos/superslim/LayoutManager$Direction;->START:Lcom/tonicartos/superslim/LayoutManager$Direction;

    invoke-direct {p0, v4, v6, v5}, Lcom/tonicartos/superslim/LayoutManager;->findAttachedHeaderOrFirstViewForSection(IILcom/tonicartos/superslim/LayoutManager$Direction;)Landroid/view/View;

    move-result-object v1

    .line 1100
    .local v1, "first":Landroid/view/View;
    if-eqz v1, :cond_0

    .line 1104
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 1105
    .local v2, "firstParams":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    iget-boolean v5, v2, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeader:Z

    if-eqz v5, :cond_0

    .line 1109
    invoke-virtual {v2}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderInline()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-virtual {v2}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderOverlay()Z

    move-result v5

    if-nez v5, :cond_2

    .line 1110
    invoke-virtual {p0, v1}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v5

    invoke-virtual {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v6

    if-gt v5, v6, :cond_0

    move-object v0, v1

    .line 1111
    goto :goto_0

    .line 1117
    :cond_2
    invoke-virtual {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v5

    invoke-virtual {p0, v1}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v6

    if-lt v5, v6, :cond_0

    .line 1121
    add-int/lit8 v5, v4, 0x1

    invoke-virtual {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v6

    if-ne v5, v6, :cond_0

    move-object v0, v1

    .line 1122
    goto :goto_0
.end method

.method private getDirectionToPosition(I)I
    .locals 5
    .param p1, "targetPosition"    # I

    .prologue
    const/4 v2, 0x1

    .line 1130
    new-instance v0, Lcom/tonicartos/superslim/SectionData;

    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-direct {v0, p0, v3}, Lcom/tonicartos/superslim/SectionData;-><init>(Lcom/tonicartos/superslim/LayoutManager;Landroid/view/View;)V

    .line 1131
    .local v0, "sd":Lcom/tonicartos/superslim/SectionData;
    invoke-direct {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->getSlm(Lcom/tonicartos/superslim/SectionData;)Lcom/tonicartos/superslim/SectionLayoutManager;

    move-result-object v3

    iget v4, v0, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    .line 1132
    invoke-virtual {v3, v4, v2}, Lcom/tonicartos/superslim/SectionLayoutManager;->getFirstVisibleView(IZ)Landroid/view/View;

    move-result-object v1

    .line 1133
    .local v1, "startSectionFirstView":Landroid/view/View;
    invoke-virtual {p0, v1}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v3

    if-ge p1, v3, :cond_0

    const/4 v2, -0x1

    :cond_0
    return v2
.end method

.method private getFractionOfContentAbove(Landroid/support/v7/widget/RecyclerView$State;Z)F
    .locals 15
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p2, "ignorePosition"    # Z

    .prologue
    .line 1137
    const/4 v4, 0x0

    .line 1139
    .local v4, "fractionOffscreen":F
    const/4 v13, 0x0

    invoke-virtual {p0, v13}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1141
    .local v2, "child":Landroid/view/View;
    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v0

    .line 1142
    .local v0, "anchorPosition":I
    const/4 v8, 0x0

    .line 1144
    .local v8, "numBeforeAnchor":I
    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v13

    int-to-float v12, v13

    .line 1145
    .local v12, "top":F
    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v13

    int-to-float v1, v13

    .line 1146
    .local v1, "bottom":F
    const/4 v13, 0x0

    cmpg-float v13, v1, v13

    if-gez v13, :cond_0

    .line 1147
    const/high16 v4, 0x3f800000    # 1.0f

    .line 1154
    :goto_0
    new-instance v11, Lcom/tonicartos/superslim/SectionData;

    invoke-direct {v11, p0, v2}, Lcom/tonicartos/superslim/SectionData;-><init>(Lcom/tonicartos/superslim/LayoutManager;Landroid/view/View;)V

    .line 1155
    .local v11, "sd":Lcom/tonicartos/superslim/SectionData;
    iget-object v13, v11, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    iget-boolean v13, v13, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeader:Z

    if-eqz v13, :cond_2

    iget-object v13, v11, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-virtual {v13}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderInline()Z

    move-result v13

    if-eqz v13, :cond_2

    move v13, v4

    .line 1195
    :goto_1
    return v13

    .line 1148
    .end local v11    # "sd":Lcom/tonicartos/superslim/SectionData;
    :cond_0
    const/4 v13, 0x0

    cmpg-float v13, v13, v12

    if-gtz v13, :cond_1

    .line 1149
    const/4 v4, 0x0

    goto :goto_0

    .line 1151
    :cond_1
    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    move-result v13

    int-to-float v5, v13

    .line 1152
    .local v5, "height":F
    neg-float v13, v12

    div-float v4, v13, v5

    goto :goto_0

    .line 1161
    .end local v5    # "height":F
    .restart local v11    # "sd":Lcom/tonicartos/superslim/SectionData;
    :cond_2
    const/4 v3, -0x1

    .line 1162
    .local v3, "firstPosition":I
    new-instance v10, Landroid/util/SparseArray;

    invoke-direct {v10}, Landroid/util/SparseArray;-><init>()V

    .line 1163
    .local v10, "positionsOffscreen":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/Boolean;>;"
    const/4 v6, 0x1

    .local v6, "i":I
    :goto_2
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v13

    if-ge v6, v13, :cond_3

    .line 1164
    invoke-virtual {p0, v6}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1165
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 1166
    .local v7, "lp":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    invoke-virtual {v11, v7}, Lcom/tonicartos/superslim/SectionData;->sameSectionManager(Lcom/tonicartos/superslim/LayoutManager$LayoutParams;)Z

    move-result v13

    if-nez v13, :cond_4

    .line 1194
    .end local v7    # "lp":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    :cond_3
    int-to-float v13, v8

    sub-float v13, v4, v13

    invoke-direct {p0, v11}, Lcom/tonicartos/superslim/LayoutManager;->getSlm(Lcom/tonicartos/superslim/SectionData;)Lcom/tonicartos/superslim/SectionLayoutManager;

    move-result-object v14

    .line 1195
    invoke-virtual {v14, v3, v10}, Lcom/tonicartos/superslim/SectionLayoutManager;->howManyMissingAbove(ILandroid/util/SparseArray;)I

    move-result v14

    int-to-float v14, v14

    sub-float/2addr v13, v14

    goto :goto_1

    .line 1170
    .restart local v7    # "lp":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    :cond_4
    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v9

    .line 1171
    .local v9, "position":I
    if-nez p2, :cond_5

    if-ge v9, v0, :cond_5

    .line 1172
    add-int/lit8 v8, v8, 0x1

    .line 1175
    :cond_5
    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v13

    int-to-float v12, v13

    .line 1176
    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v13

    int-to-float v1, v13

    .line 1177
    const/4 v13, 0x0

    cmpg-float v13, v1, v13

    if-gez v13, :cond_8

    .line 1178
    const/high16 v13, 0x3f800000    # 1.0f

    add-float/2addr v4, v13

    .line 1186
    :goto_3
    iget-boolean v13, v7, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeader:Z

    if-nez v13, :cond_7

    .line 1187
    const/4 v13, -0x1

    if-ne v3, v13, :cond_6

    .line 1188
    move v3, v9

    .line 1190
    :cond_6
    const/4 v13, 0x1

    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v13

    invoke-virtual {v10, v9, v13}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 1163
    :cond_7
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 1179
    :cond_8
    const/4 v13, 0x0

    cmpg-float v13, v13, v12

    if-lez v13, :cond_7

    .line 1182
    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    move-result v13

    int-to-float v5, v13

    .line 1183
    .restart local v5    # "height":F
    neg-float v13, v12

    div-float/2addr v13, v5

    add-float/2addr v4, v13

    goto :goto_3
.end method

.method private getFractionOfContentBelow(Landroid/support/v7/widget/RecyclerView$State;Z)F
    .locals 17
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p2, "ignorePosition"    # Z

    .prologue
    .line 1199
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/superslim/LayoutManager;->getHeight()I

    move-result v15

    int-to-float v10, v15

    .line 1200
    .local v10, "parentHeight":F
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v15

    add-int/lit8 v15, v15, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 1202
    .local v3, "child":Landroid/view/View;
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    .line 1203
    .local v1, "anchorPosition":I
    const/4 v4, 0x0

    .line 1205
    .local v4, "countAfter":I
    new-instance v13, Lcom/tonicartos/superslim/SectionData;

    move-object/from16 v0, p0

    invoke-direct {v13, v0, v3}, Lcom/tonicartos/superslim/SectionData;-><init>(Lcom/tonicartos/superslim/LayoutManager;Landroid/view/View;)V

    .line 1207
    .local v13, "sd":Lcom/tonicartos/superslim/SectionData;
    const/4 v5, 0x0

    .line 1208
    .local v5, "fractionOffscreen":F
    const/4 v8, -0x1

    .line 1209
    .local v8, "lastPosition":I
    new-instance v12, Landroid/util/SparseArray;

    invoke-direct {v12}, Landroid/util/SparseArray;-><init>()V

    .line 1211
    .local v12, "positionsOffscreen":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/Boolean;>;"
    const/4 v7, 0x1

    .local v7, "i":I
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v15

    if-gt v7, v15, :cond_0

    .line 1212
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v15

    sub-int/2addr v15, v7

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 1213
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 1214
    .local v9, "lp":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    invoke-virtual {v13, v9}, Lcom/tonicartos/superslim/SectionData;->sameSectionManager(Lcom/tonicartos/superslim/LayoutManager$LayoutParams;)Z

    move-result v15

    if-nez v15, :cond_1

    .line 1242
    .end local v9    # "lp":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    :cond_0
    int-to-float v15, v4

    sub-float v15, v5, v15

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/tonicartos/superslim/LayoutManager;->getSlm(Lcom/tonicartos/superslim/SectionData;)Lcom/tonicartos/superslim/SectionLayoutManager;

    move-result-object v16

    .line 1243
    move-object/from16 v0, v16

    invoke-virtual {v0, v8, v12}, Lcom/tonicartos/superslim/SectionLayoutManager;->howManyMissingBelow(ILandroid/util/SparseArray;)I

    move-result v16

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    sub-float v15, v15, v16

    return v15

    .line 1218
    .restart local v9    # "lp":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    :cond_1
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v11

    .line 1219
    .local v11, "position":I
    iget-boolean v15, v9, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeader:Z

    if-nez v15, :cond_2

    if-nez p2, :cond_2

    if-le v11, v1, :cond_2

    .line 1220
    add-int/lit8 v4, v4, 0x1

    .line 1223
    :cond_2
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v15

    int-to-float v2, v15

    .line 1224
    .local v2, "bottom":F
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v15

    int-to-float v14, v15

    .line 1225
    .local v14, "top":F
    cmpg-float v15, v2, v10

    if-gtz v15, :cond_4

    .line 1211
    :cond_3
    :goto_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 1227
    :cond_4
    cmpg-float v15, v10, v14

    if-gez v15, :cond_6

    .line 1228
    const/high16 v15, 0x3f800000    # 1.0f

    add-float/2addr v5, v15

    .line 1234
    :goto_2
    iget-boolean v15, v9, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeader:Z

    if-nez v15, :cond_3

    .line 1235
    const/4 v15, -0x1

    if-ne v8, v15, :cond_5

    .line 1236
    move v8, v11

    .line 1238
    :cond_5
    const/4 v15, 0x1

    invoke-static {v15}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v15

    invoke-virtual {v12, v11, v15}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_1

    .line 1230
    :cond_6
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    move-result v15

    int-to-float v6, v15

    .line 1231
    .local v6, "height":F
    sub-float v15, v2, v10

    div-float/2addr v15, v6

    add-float/2addr v5, v15

    goto :goto_2
.end method

.method private getHeaderOrFirstViewForSection(ILcom/tonicartos/superslim/LayoutManager$Direction;Lcom/tonicartos/superslim/LayoutState;)Landroid/view/View;
    .locals 3
    .param p1, "sfp"    # I
    .param p2, "direction"    # Lcom/tonicartos/superslim/LayoutManager$Direction;
    .param p3, "state"    # Lcom/tonicartos/superslim/LayoutState;

    .prologue
    .line 1247
    sget-object v2, Lcom/tonicartos/superslim/LayoutManager$Direction;->START:Lcom/tonicartos/superslim/LayoutManager$Direction;

    if-ne p2, v2, :cond_2

    const/4 v2, 0x0

    :goto_0
    invoke-direct {p0, p1, v2, p2}, Lcom/tonicartos/superslim/LayoutManager;->findAttachedHeaderOrFirstViewForSection(IILcom/tonicartos/superslim/LayoutManager$Direction;)Landroid/view/View;

    move-result-object v1

    .line 1249
    .local v1, "view":Landroid/view/View;
    if-nez v1, :cond_1

    .line 1250
    invoke-virtual {p3, p1}, Lcom/tonicartos/superslim/LayoutState;->getView(I)Lcom/tonicartos/superslim/LayoutState$View;

    move-result-object v0

    .line 1251
    .local v0, "stateView":Lcom/tonicartos/superslim/LayoutState$View;
    iget-object v1, v0, Lcom/tonicartos/superslim/LayoutState$View;->view:Landroid/view/View;

    .line 1252
    invoke-virtual {v0}, Lcom/tonicartos/superslim/LayoutState$View;->getLayoutParams()Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    move-result-object v2

    iget-boolean v2, v2, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeader:Z

    if-eqz v2, :cond_0

    .line 1253
    iget-object v2, v0, Lcom/tonicartos/superslim/LayoutState$View;->view:Landroid/view/View;

    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->measureHeader(Landroid/view/View;)V

    .line 1255
    :cond_0
    invoke-virtual {p3, p1, v1}, Lcom/tonicartos/superslim/LayoutState;->cacheView(ILandroid/view/View;)V

    .line 1257
    .end local v0    # "stateView":Lcom/tonicartos/superslim/LayoutState$View;
    :cond_1
    return-object v1

    .line 1248
    .end local v1    # "view":Landroid/view/View;
    :cond_2
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    goto :goto_0
.end method

.method private getSLM(ILjava/lang/String;)Lcom/tonicartos/superslim/SectionLayoutManager;
    .locals 1
    .param p1, "kind"    # I
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 1261
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 1262
    iget-object v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mSlms:Ljava/util/HashMap;

    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tonicartos/superslim/SectionLayoutManager;

    .line 1266
    :goto_0
    return-object v0

    .line 1263
    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 1264
    iget-object v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mLinearSlm:Lcom/tonicartos/superslim/SectionLayoutManager;

    goto :goto_0

    .line 1265
    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    .line 1266
    iget-object v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mGridSlm:Lcom/tonicartos/superslim/SectionLayoutManager;

    goto :goto_0

    .line 1268
    :cond_2
    new-instance v0, Lcom/tonicartos/superslim/LayoutManager$NotYetImplementedSlmException;

    invoke-direct {v0, p0, p1}, Lcom/tonicartos/superslim/LayoutManager$NotYetImplementedSlmException;-><init>(Lcom/tonicartos/superslim/LayoutManager;I)V

    throw v0
.end method

.method private getSlm(Lcom/tonicartos/superslim/LayoutManager$LayoutParams;)Lcom/tonicartos/superslim/SectionLayoutManager;
    .locals 2
    .param p1, "params"    # Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .prologue
    .line 1273
    iget v0, p1, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->sectionManagerKind:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 1274
    iget-object v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mSlms:Ljava/util/HashMap;

    iget-object v1, p1, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->sectionManager:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tonicartos/superslim/SectionLayoutManager;

    .line 1278
    :goto_0
    return-object v0

    .line 1275
    :cond_0
    iget v0, p1, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->sectionManagerKind:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 1276
    iget-object v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mLinearSlm:Lcom/tonicartos/superslim/SectionLayoutManager;

    goto :goto_0

    .line 1277
    :cond_1
    iget v0, p1, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->sectionManagerKind:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 1278
    iget-object v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mGridSlm:Lcom/tonicartos/superslim/SectionLayoutManager;

    goto :goto_0

    .line 1280
    :cond_2
    new-instance v0, Lcom/tonicartos/superslim/LayoutManager$NotYetImplementedSlmException;

    iget v1, p1, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->sectionManagerKind:I

    invoke-direct {v0, p0, v1}, Lcom/tonicartos/superslim/LayoutManager$NotYetImplementedSlmException;-><init>(Lcom/tonicartos/superslim/LayoutManager;I)V

    throw v0
.end method

.method private getSlm(Lcom/tonicartos/superslim/SectionData;)Lcom/tonicartos/superslim/SectionLayoutManager;
    .locals 3
    .param p1, "sd"    # Lcom/tonicartos/superslim/SectionData;

    .prologue
    .line 1286
    iget-object v1, p1, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    iget v1, v1, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->sectionManagerKind:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 1287
    iget-object v1, p0, Lcom/tonicartos/superslim/LayoutManager;->mSlms:Ljava/util/HashMap;

    iget-object v2, p1, Lcom/tonicartos/superslim/SectionData;->sectionManager:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tonicartos/superslim/SectionLayoutManager;

    .line 1288
    .local v0, "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    if-nez v0, :cond_1

    .line 1289
    new-instance v1, Lcom/tonicartos/superslim/LayoutManager$UnknownSectionLayoutException;

    iget-object v2, p1, Lcom/tonicartos/superslim/SectionData;->sectionManager:Ljava/lang/String;

    invoke-direct {v1, p0, v2}, Lcom/tonicartos/superslim/LayoutManager$UnknownSectionLayoutException;-><init>(Lcom/tonicartos/superslim/LayoutManager;Ljava/lang/String;)V

    throw v1

    .line 1291
    .end local v0    # "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    :cond_0
    iget-object v1, p1, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    iget v1, v1, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->sectionManagerKind:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_2

    .line 1292
    iget-object v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mLinearSlm:Lcom/tonicartos/superslim/SectionLayoutManager;

    .line 1299
    .restart local v0    # "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    :cond_1
    :goto_0
    invoke-virtual {v0, p1}, Lcom/tonicartos/superslim/SectionLayoutManager;->init(Lcom/tonicartos/superslim/SectionData;)Lcom/tonicartos/superslim/SectionLayoutManager;

    move-result-object v1

    return-object v1

    .line 1293
    .end local v0    # "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    :cond_2
    iget-object v1, p1, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    iget v1, v1, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->sectionManagerKind:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_3

    .line 1294
    iget-object v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mGridSlm:Lcom/tonicartos/superslim/SectionLayoutManager;

    .restart local v0    # "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    goto :goto_0

    .line 1296
    .end local v0    # "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    :cond_3
    new-instance v1, Lcom/tonicartos/superslim/LayoutManager$NotYetImplementedSlmException;

    iget-object v2, p1, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    iget v2, v2, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->sectionManagerKind:I

    invoke-direct {v1, p0, v2}, Lcom/tonicartos/superslim/LayoutManager$NotYetImplementedSlmException;-><init>(Lcom/tonicartos/superslim/LayoutManager;I)V

    throw v1
.end method

.method private isOverscrolled(Lcom/tonicartos/superslim/LayoutState;)Z
    .locals 13
    .param p1, "state"    # Lcom/tonicartos/superslim/LayoutState;

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 1303
    invoke-virtual {p1}, Lcom/tonicartos/superslim/LayoutState;->getRecyclerState()Landroid/support/v7/widget/RecyclerView$State;

    move-result-object v10

    invoke-virtual {v10}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v4

    .line 1305
    .local v4, "itemCount":I
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v10

    if-nez v10, :cond_1

    .line 1329
    :cond_0
    :goto_0
    return v9

    .line 1309
    :cond_1
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->findFirstVisibleItem()Landroid/view/View;

    move-result-object v3

    .line 1310
    .local v3, "firstVisibleView":Landroid/view/View;
    invoke-virtual {p0, v3}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v10

    if-nez v10, :cond_2

    move v2, v8

    .line 1311
    .local v2, "firstVisibleIsFirstItem":Z
    :goto_1
    invoke-virtual {p0, v3}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v10

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getPaddingTop()I

    move-result v11

    if-le v10, v11, :cond_3

    move v0, v8

    .line 1312
    .local v0, "firstVisibleAfterStart":Z
    :goto_2
    invoke-virtual {p0, v3}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v10

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getPaddingTop()I

    move-result v11

    if-ne v10, v11, :cond_4

    move v1, v8

    .line 1314
    .local v1, "firstVisibleAtStart":Z
    :goto_3
    if-eqz v2, :cond_5

    if-eqz v0, :cond_5

    move v9, v8

    .line 1315
    goto :goto_0

    .end local v0    # "firstVisibleAfterStart":Z
    .end local v1    # "firstVisibleAtStart":Z
    .end local v2    # "firstVisibleIsFirstItem":Z
    :cond_2
    move v2, v9

    .line 1310
    goto :goto_1

    .restart local v2    # "firstVisibleIsFirstItem":Z
    :cond_3
    move v0, v9

    .line 1311
    goto :goto_2

    .restart local v0    # "firstVisibleAfterStart":Z
    :cond_4
    move v1, v9

    .line 1312
    goto :goto_3

    .line 1316
    .restart local v1    # "firstVisibleAtStart":Z
    :cond_5
    if-eqz v2, :cond_6

    if-nez v1, :cond_0

    .line 1320
    :cond_6
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->findLastVisibleItem()Landroid/view/View;

    move-result-object v7

    .line 1321
    .local v7, "lastVisibleView":Landroid/view/View;
    invoke-virtual {p0, v7}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v10

    add-int/lit8 v11, v4, -0x1

    if-ne v10, v11, :cond_7

    move v6, v8

    .line 1323
    .local v6, "lastVisibleIsLastItem":Z
    :goto_4
    invoke-virtual {p0, v7}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v10

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getHeight()I

    move-result v11

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getPaddingBottom()I

    move-result v12

    sub-int/2addr v11, v12

    if-ge v10, v11, :cond_8

    move v5, v8

    .line 1325
    .local v5, "lastVisibleBeforeEnd":Z
    :goto_5
    if-eqz v6, :cond_0

    if-eqz v5, :cond_0

    move v9, v8

    .line 1326
    goto :goto_0

    .end local v5    # "lastVisibleBeforeEnd":Z
    .end local v6    # "lastVisibleIsLastItem":Z
    :cond_7
    move v6, v9

    .line 1321
    goto :goto_4

    .restart local v6    # "lastVisibleIsLastItem":Z
    :cond_8
    move v5, v9

    .line 1323
    goto :goto_5
.end method

.method private layoutChildren(IILcom/tonicartos/superslim/LayoutState;)I
    .locals 19
    .param p1, "anchorPosition"    # I
    .param p2, "borderLine"    # I
    .param p3, "state"    # Lcom/tonicartos/superslim/LayoutState;

    .prologue
    .line 1340
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/superslim/LayoutManager;->getHeight()I

    move-result v4

    .line 1342
    .local v4, "height":I
    move-object/from16 v0, p3

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/tonicartos/superslim/LayoutState;->getView(I)Lcom/tonicartos/superslim/LayoutState$View;

    move-result-object v16

    .line 1343
    .local v16, "anchor":Lcom/tonicartos/superslim/LayoutState$View;
    move-object/from16 v0, v16

    iget-object v8, v0, Lcom/tonicartos/superslim/LayoutState$View;->view:Landroid/view/View;

    move-object/from16 v0, p3

    move/from16 v1, p1

    invoke-virtual {v0, v1, v8}, Lcom/tonicartos/superslim/LayoutState;->cacheView(ILandroid/view/View;)V

    .line 1345
    invoke-virtual/range {v16 .. v16}, Lcom/tonicartos/superslim/LayoutState$View;->getLayoutParams()Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    move-result-object v8

    invoke-virtual {v8}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getTestedFirstPosition()I

    move-result v18

    .line 1346
    .local v18, "sfp":I
    move-object/from16 v0, p3

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/tonicartos/superslim/LayoutState;->getView(I)Lcom/tonicartos/superslim/LayoutState$View;

    move-result-object v17

    .line 1347
    .local v17, "first":Lcom/tonicartos/superslim/LayoutState$View;
    move-object/from16 v0, v17

    iget-object v8, v0, Lcom/tonicartos/superslim/LayoutState$View;->view:Landroid/view/View;

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/tonicartos/superslim/LayoutManager;->measureHeader(Landroid/view/View;)V

    .line 1348
    move-object/from16 v0, v17

    iget-object v8, v0, Lcom/tonicartos/superslim/LayoutState$View;->view:Landroid/view/View;

    move-object/from16 v0, p3

    move/from16 v1, v18

    invoke-virtual {v0, v1, v8}, Lcom/tonicartos/superslim/LayoutState;->cacheView(ILandroid/view/View;)V

    .line 1350
    new-instance v7, Lcom/tonicartos/superslim/SectionData;

    move-object/from16 v0, v17

    iget-object v8, v0, Lcom/tonicartos/superslim/LayoutState$View;->view:Landroid/view/View;

    move-object/from16 v0, p0

    invoke-direct {v7, v0, v8}, Lcom/tonicartos/superslim/SectionData;-><init>(Lcom/tonicartos/superslim/LayoutManager;Landroid/view/View;)V

    .line 1352
    .local v7, "sd":Lcom/tonicartos/superslim/SectionData;
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/tonicartos/superslim/LayoutManager;->getSlm(Lcom/tonicartos/superslim/SectionData;)Lcom/tonicartos/superslim/SectionLayoutManager;

    move-result-object v3

    .line 1354
    .local v3, "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    move/from16 v5, p2

    .line 1355
    .local v5, "markerLine":I
    move/from16 v6, p1

    .line 1356
    .local v6, "contentPosition":I
    iget-boolean v8, v7, Lcom/tonicartos/superslim/SectionData;->hasHeader:Z

    if-eqz v8, :cond_0

    iget v8, v7, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    move/from16 v0, p1

    if-ne v0, v8, :cond_0

    .line 1357
    move-object/from16 v0, v17

    iget-object v8, v0, Lcom/tonicartos/superslim/LayoutState$View;->view:Landroid/view/View;

    move-object/from16 v0, p0

    move/from16 v1, p2

    move-object/from16 v2, p3

    invoke-direct {v0, v8, v1, v7, v2}, Lcom/tonicartos/superslim/LayoutManager;->layoutHeaderTowardsEnd(Landroid/view/View;ILcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)I

    move-result v5

    .line 1358
    add-int/lit8 v6, v6, 0x1

    :cond_0
    move-object/from16 v8, p3

    .line 1362
    invoke-virtual/range {v3 .. v8}, Lcom/tonicartos/superslim/SectionLayoutManager;->fillToEnd(IIILcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)I

    move-result v5

    .line 1364
    iget-boolean v8, v7, Lcom/tonicartos/superslim/SectionData;->hasHeader:Z

    if-eqz v8, :cond_2

    iget v8, v7, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    move/from16 v0, p1

    if-eq v0, v8, :cond_2

    .line 1365
    move-object/from16 v0, p3

    invoke-virtual {v3, v6, v7, v0}, Lcom/tonicartos/superslim/SectionLayoutManager;->computeHeaderOffset(ILcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)I

    move-result v12

    .line 1366
    .local v12, "offset":I
    move-object/from16 v0, v17

    iget-object v9, v0, Lcom/tonicartos/superslim/LayoutState$View;->view:Landroid/view/View;

    const/4 v10, 0x0

    move-object/from16 v8, p0

    move/from16 v11, p2

    move v13, v5

    move-object v14, v7

    move-object/from16 v15, p3

    invoke-direct/range {v8 .. v15}, Lcom/tonicartos/superslim/LayoutManager;->layoutHeaderTowardsStart(Landroid/view/View;IIIILcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)I

    .line 1371
    .end local v12    # "offset":I
    :goto_0
    iget-boolean v8, v7, Lcom/tonicartos/superslim/SectionData;->hasHeader:Z

    if-eqz v8, :cond_1

    move-object/from16 v0, v17

    iget-object v8, v0, Lcom/tonicartos/superslim/LayoutState$View;->view:Landroid/view/View;

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v8

    if-lez v8, :cond_1

    .line 1372
    move-object/from16 v0, v17

    iget-object v8, v0, Lcom/tonicartos/superslim/LayoutState$View;->view:Landroid/view/View;

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/tonicartos/superslim/LayoutManager;->addView(Landroid/view/View;)V

    .line 1373
    iget v8, v7, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v8}, Lcom/tonicartos/superslim/LayoutState;->decacheView(I)V

    .line 1377
    :cond_1
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v4, v5, v1}, Lcom/tonicartos/superslim/LayoutManager;->fillNextSectionToEnd(IILcom/tonicartos/superslim/LayoutState;)I

    move-result v5

    .line 1379
    return v5

    .line 1368
    :cond_2
    move-object/from16 v0, v17

    iget-object v8, v0, Lcom/tonicartos/superslim/LayoutState$View;->view:Landroid/view/View;

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v8

    invoke-static {v5, v8}, Ljava/lang/Math;->max(II)I

    move-result v5

    goto :goto_0
.end method

.method private layoutHeaderTowardsEnd(Landroid/view/View;ILcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)I
    .locals 7
    .param p1, "header"    # Landroid/view/View;
    .param p2, "markerLine"    # I
    .param p3, "sd"    # Lcom/tonicartos/superslim/SectionData;
    .param p4, "state"    # Lcom/tonicartos/superslim/LayoutState;

    .prologue
    .line 1393
    iget-object v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mRect:Landroid/graphics/Rect;

    invoke-direct {p0, v0, p3, p4}, Lcom/tonicartos/superslim/LayoutManager;->setHeaderRectSides(Landroid/graphics/Rect;Lcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)Landroid/graphics/Rect;

    move-result-object v6

    .line 1395
    .local v6, "r":Landroid/graphics/Rect;
    iput p2, v6, Landroid/graphics/Rect;->top:I

    .line 1396
    iget v0, v6, Landroid/graphics/Rect;->top:I

    iget v1, p3, Lcom/tonicartos/superslim/SectionData;->headerHeight:I

    add-int/2addr v0, v1

    iput v0, v6, Landroid/graphics/Rect;->bottom:I

    .line 1398
    iget-object v0, p3, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-virtual {v0}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderInline()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p3, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-virtual {v0}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderOverlay()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1399
    iget p2, v6, Landroid/graphics/Rect;->bottom:I

    .line 1402
    :cond_0
    iget-object v0, p3, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-virtual {v0}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderSticky()Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, v6, Landroid/graphics/Rect;->top:I

    if-gez v0, :cond_1

    .line 1403
    const/4 v0, 0x0

    iput v0, v6, Landroid/graphics/Rect;->top:I

    .line 1404
    iget v0, v6, Landroid/graphics/Rect;->top:I

    iget v1, p3, Lcom/tonicartos/superslim/SectionData;->headerHeight:I

    add-int/2addr v0, v1

    iput v0, v6, Landroid/graphics/Rect;->bottom:I

    .line 1407
    :cond_1
    iget v2, v6, Landroid/graphics/Rect;->left:I

    iget v3, v6, Landroid/graphics/Rect;->top:I

    iget v4, v6, Landroid/graphics/Rect;->right:I

    iget v5, v6, Landroid/graphics/Rect;->bottom:I

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/tonicartos/superslim/LayoutManager;->layoutDecorated(Landroid/view/View;IIII)V

    .line 1409
    return p2
.end method

.method private layoutHeaderTowardsStart(Landroid/view/View;IIIILcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)I
    .locals 7
    .param p1, "header"    # Landroid/view/View;
    .param p2, "leadingEdge"    # I
    .param p3, "markerLine"    # I
    .param p4, "offset"    # I
    .param p5, "sectionBottom"    # I
    .param p6, "sd"    # Lcom/tonicartos/superslim/SectionData;
    .param p7, "state"    # Lcom/tonicartos/superslim/LayoutState;

    .prologue
    .line 1424
    iget-object v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mRect:Landroid/graphics/Rect;

    invoke-direct {p0, v0, p6, p7}, Lcom/tonicartos/superslim/LayoutManager;->setHeaderRectSides(Landroid/graphics/Rect;Lcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)Landroid/graphics/Rect;

    move-result-object v6

    .line 1426
    .local v6, "r":Landroid/graphics/Rect;
    iget-object v0, p6, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-virtual {v0}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderInline()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p6, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-virtual {v0}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderOverlay()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1427
    iput p3, v6, Landroid/graphics/Rect;->bottom:I

    .line 1428
    iget v0, v6, Landroid/graphics/Rect;->bottom:I

    iget v1, p6, Lcom/tonicartos/superslim/SectionData;->headerHeight:I

    sub-int/2addr v0, v1

    iput v0, v6, Landroid/graphics/Rect;->top:I

    .line 1437
    :goto_0
    iget-object v0, p6, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-virtual {v0}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderSticky()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, v6, Landroid/graphics/Rect;->top:I

    if-ge v0, p2, :cond_0

    iget v0, p6, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    .line 1438
    invoke-virtual {p7}, Lcom/tonicartos/superslim/LayoutState;->getRecyclerState()Landroid/support/v7/widget/RecyclerView$State;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$State;->getTargetScrollPosition()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 1439
    iput p2, v6, Landroid/graphics/Rect;->top:I

    .line 1440
    iget v0, v6, Landroid/graphics/Rect;->top:I

    iget v1, p6, Lcom/tonicartos/superslim/SectionData;->headerHeight:I

    add-int/2addr v0, v1

    iput v0, v6, Landroid/graphics/Rect;->bottom:I

    .line 1441
    iget-object v0, p6, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-virtual {v0}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderInline()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p6, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-virtual {v0}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderOverlay()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1442
    iget v0, p6, Lcom/tonicartos/superslim/SectionData;->headerHeight:I

    sub-int/2addr p3, v0

    .line 1446
    :cond_0
    iget v0, v6, Landroid/graphics/Rect;->bottom:I

    if-le v0, p5, :cond_1

    .line 1447
    iput p5, v6, Landroid/graphics/Rect;->bottom:I

    .line 1448
    iget v0, v6, Landroid/graphics/Rect;->bottom:I

    iget v1, p6, Lcom/tonicartos/superslim/SectionData;->headerHeight:I

    sub-int/2addr v0, v1

    iput v0, v6, Landroid/graphics/Rect;->top:I

    .line 1451
    :cond_1
    iget v2, v6, Landroid/graphics/Rect;->left:I

    iget v3, v6, Landroid/graphics/Rect;->top:I

    iget v4, v6, Landroid/graphics/Rect;->right:I

    iget v5, v6, Landroid/graphics/Rect;->bottom:I

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/tonicartos/superslim/LayoutManager;->layoutDecorated(Landroid/view/View;IIII)V

    .line 1453
    iget v0, v6, Landroid/graphics/Rect;->top:I

    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0

    .line 1429
    :cond_2
    if-gtz p4, :cond_3

    .line 1430
    add-int v0, p3, p4

    iput v0, v6, Landroid/graphics/Rect;->top:I

    .line 1431
    iget v0, v6, Landroid/graphics/Rect;->top:I

    iget v1, p6, Lcom/tonicartos/superslim/SectionData;->headerHeight:I

    add-int/2addr v0, v1

    iput v0, v6, Landroid/graphics/Rect;->bottom:I

    goto :goto_0

    .line 1433
    :cond_3
    iput p2, v6, Landroid/graphics/Rect;->bottom:I

    .line 1434
    iget v0, v6, Landroid/graphics/Rect;->bottom:I

    iget v1, p6, Lcom/tonicartos/superslim/SectionData;->headerHeight:I

    sub-int/2addr v0, v1

    iput v0, v6, Landroid/graphics/Rect;->top:I

    goto :goto_0
.end method

.method private setHeaderRectSides(Landroid/graphics/Rect;Lcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)Landroid/graphics/Rect;
    .locals 4
    .param p1, "r"    # Landroid/graphics/Rect;
    .param p2, "sd"    # Lcom/tonicartos/superslim/SectionData;
    .param p3, "state"    # Lcom/tonicartos/superslim/LayoutState;

    .prologue
    .line 1457
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getPaddingLeft()I

    move-result v0

    .line 1458
    .local v0, "paddingLeft":I
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getPaddingRight()I

    move-result v1

    .line 1460
    .local v1, "paddingRight":I
    iget-object v2, p2, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-virtual {v2}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderEndAligned()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1462
    iget-object v2, p2, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-virtual {v2}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderOverlay()Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p2, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    iget-boolean v2, v2, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->headerEndMarginIsAuto:Z

    if-nez v2, :cond_1

    iget v2, p2, Lcom/tonicartos/superslim/SectionData;->marginEnd:I

    if-lez v2, :cond_1

    .line 1465
    iget-boolean v2, p3, Lcom/tonicartos/superslim/LayoutState;->isLTR:Z

    if-eqz v2, :cond_0

    .line 1466
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getWidth()I

    move-result v2

    iget v3, p2, Lcom/tonicartos/superslim/SectionData;->marginEnd:I

    sub-int/2addr v2, v3

    sub-int/2addr v2, v1

    iput v2, p1, Landroid/graphics/Rect;->left:I

    .line 1467
    iget v2, p1, Landroid/graphics/Rect;->left:I

    iget v3, p2, Lcom/tonicartos/superslim/SectionData;->headerWidth:I

    add-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->right:I

    .line 1504
    :goto_0
    return-object p1

    .line 1469
    :cond_0
    iget v2, p2, Lcom/tonicartos/superslim/SectionData;->marginEnd:I

    add-int/2addr v2, v0

    iput v2, p1, Landroid/graphics/Rect;->right:I

    .line 1470
    iget v2, p1, Landroid/graphics/Rect;->right:I

    iget v3, p2, Lcom/tonicartos/superslim/SectionData;->headerWidth:I

    sub-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->left:I

    goto :goto_0

    .line 1472
    :cond_1
    iget-boolean v2, p3, Lcom/tonicartos/superslim/LayoutState;->isLTR:Z

    if-eqz v2, :cond_2

    .line 1473
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getWidth()I

    move-result v2

    sub-int/2addr v2, v1

    iput v2, p1, Landroid/graphics/Rect;->right:I

    .line 1474
    iget v2, p1, Landroid/graphics/Rect;->right:I

    iget v3, p2, Lcom/tonicartos/superslim/SectionData;->headerWidth:I

    sub-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->left:I

    goto :goto_0

    .line 1476
    :cond_2
    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 1477
    iget v2, p1, Landroid/graphics/Rect;->left:I

    iget v3, p2, Lcom/tonicartos/superslim/SectionData;->headerWidth:I

    add-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->right:I

    goto :goto_0

    .line 1479
    :cond_3
    iget-object v2, p2, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-virtual {v2}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderStartAligned()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 1481
    iget-object v2, p2, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-virtual {v2}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderOverlay()Z

    move-result v2

    if-nez v2, :cond_5

    iget-object v2, p2, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    iget-boolean v2, v2, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->headerStartMarginIsAuto:Z

    if-nez v2, :cond_5

    iget v2, p2, Lcom/tonicartos/superslim/SectionData;->marginStart:I

    if-lez v2, :cond_5

    .line 1484
    iget-boolean v2, p3, Lcom/tonicartos/superslim/LayoutState;->isLTR:Z

    if-eqz v2, :cond_4

    .line 1485
    iget v2, p2, Lcom/tonicartos/superslim/SectionData;->marginStart:I

    add-int/2addr v2, v0

    iput v2, p1, Landroid/graphics/Rect;->right:I

    .line 1486
    iget v2, p1, Landroid/graphics/Rect;->right:I

    iget v3, p2, Lcom/tonicartos/superslim/SectionData;->headerWidth:I

    sub-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->left:I

    goto :goto_0

    .line 1488
    :cond_4
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getWidth()I

    move-result v2

    iget v3, p2, Lcom/tonicartos/superslim/SectionData;->marginStart:I

    sub-int/2addr v2, v3

    sub-int/2addr v2, v1

    iput v2, p1, Landroid/graphics/Rect;->left:I

    .line 1489
    iget v2, p1, Landroid/graphics/Rect;->left:I

    iget v3, p2, Lcom/tonicartos/superslim/SectionData;->headerWidth:I

    add-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->right:I

    goto :goto_0

    .line 1491
    :cond_5
    iget-boolean v2, p3, Lcom/tonicartos/superslim/LayoutState;->isLTR:Z

    if-eqz v2, :cond_6

    .line 1492
    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 1493
    iget v2, p1, Landroid/graphics/Rect;->left:I

    iget v3, p2, Lcom/tonicartos/superslim/SectionData;->headerWidth:I

    add-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->right:I

    goto :goto_0

    .line 1495
    :cond_6
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getWidth()I

    move-result v2

    sub-int/2addr v2, v1

    iput v2, p1, Landroid/graphics/Rect;->right:I

    .line 1496
    iget v2, p1, Landroid/graphics/Rect;->right:I

    iget v3, p2, Lcom/tonicartos/superslim/SectionData;->headerWidth:I

    sub-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->left:I

    goto/16 :goto_0

    .line 1500
    :cond_7
    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 1501
    iget v2, p1, Landroid/graphics/Rect;->left:I

    iget v3, p2, Lcom/tonicartos/superslim/SectionData;->headerWidth:I

    add-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->right:I

    goto/16 :goto_0
.end method

.method private trimEnd(Lcom/tonicartos/superslim/LayoutState;)V
    .locals 4
    .param p1, "state"    # Lcom/tonicartos/superslim/LayoutState;

    .prologue
    .line 1513
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getHeight()I

    move-result v1

    .line 1514
    .local v1, "height":I
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v3

    add-int/lit8 v2, v3, -0x1

    .local v2, "i":I
    :goto_0
    if-ltz v2, :cond_2

    .line 1515
    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1516
    .local v0, "child":Landroid/view/View;
    invoke-virtual {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v3

    if-lt v3, v1, :cond_1

    .line 1517
    iget-object v3, p1, Lcom/tonicartos/superslim/LayoutState;->recycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {p0, v0, v3}, Lcom/tonicartos/superslim/LayoutManager;->removeAndRecycleView(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 1514
    :cond_0
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 1519
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    iget-boolean v3, v3, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeader:Z

    if-nez v3, :cond_0

    .line 1524
    .end local v0    # "child":Landroid/view/View;
    :cond_2
    return-void
.end method

.method private trimStart(Lcom/tonicartos/superslim/LayoutState;)V
    .locals 10
    .param p1, "state"    # Lcom/tonicartos/superslim/LayoutState;

    .prologue
    .line 1533
    const/4 v0, 0x0

    .line 1534
    .local v0, "anchor":Landroid/view/View;
    const/4 v1, 0x0

    .line 1535
    .local v1, "anchorIndex":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v8

    if-ge v4, v8, :cond_0

    .line 1536
    invoke-virtual {p0, v4}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 1537
    .local v5, "look":Landroid/view/View;
    invoke-virtual {p0, v5}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v8

    if-lez v8, :cond_2

    .line 1538
    move-object v0, v5

    .line 1539
    move v1, v4

    .line 1544
    .end local v5    # "look":Landroid/view/View;
    :cond_0
    if-nez v0, :cond_3

    .line 1545
    iget-object v8, p1, Lcom/tonicartos/superslim/LayoutState;->recycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {p0, v8}, Lcom/tonicartos/superslim/LayoutManager;->detachAndScrapAttachedViews(Landroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 1579
    :cond_1
    :goto_1
    return-void

    .line 1535
    .restart local v5    # "look":Landroid/view/View;
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1549
    .end local v5    # "look":Landroid/view/View;
    :cond_3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 1550
    .local v2, "anchorParams":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    iget-boolean v8, v2, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeader:Z

    if-eqz v8, :cond_4

    .line 1551
    add-int/lit8 v4, v1, -0x1

    :goto_2
    if-ltz v4, :cond_4

    .line 1552
    invoke-virtual {p0, v4}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 1553
    .restart local v5    # "look":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 1554
    .local v6, "lookParams":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    invoke-virtual {v6}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getTestedFirstPosition()I

    move-result v8

    invoke-virtual {v2}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getTestedFirstPosition()I

    move-result v9

    if-ne v8, v9, :cond_5

    .line 1555
    move-object v0, v5

    .line 1556
    move-object v2, v6

    .line 1557
    move v1, v4

    .line 1563
    .end local v5    # "look":Landroid/view/View;
    .end local v6    # "lookParams":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    :cond_4
    const/4 v4, 0x0

    :goto_3
    if-ge v4, v1, :cond_6

    .line 1564
    const/4 v8, 0x0

    iget-object v9, p1, Lcom/tonicartos/superslim/LayoutState;->recycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {p0, v8, v9}, Lcom/tonicartos/superslim/LayoutManager;->removeAndRecycleViewAt(ILandroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 1563
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 1551
    .restart local v5    # "look":Landroid/view/View;
    .restart local v6    # "lookParams":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    :cond_5
    add-int/lit8 v4, v4, -0x1

    goto :goto_2

    .line 1567
    .end local v5    # "look":Landroid/view/View;
    .end local v6    # "lookParams":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    :cond_6
    invoke-virtual {v2}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getTestedFirstPosition()I

    move-result v7

    .line 1569
    .local v7, "sfp":I
    sget-object v8, Lcom/tonicartos/superslim/LayoutManager$Direction;->START:Lcom/tonicartos/superslim/LayoutManager$Direction;

    invoke-direct {p0, v7, v8}, Lcom/tonicartos/superslim/LayoutManager;->findAttachedHeaderForSection(ILcom/tonicartos/superslim/LayoutManager$Direction;)Landroid/view/View;

    move-result-object v3

    .line 1570
    .local v3, "header":Landroid/view/View;
    if-eqz v3, :cond_1

    .line 1571
    invoke-virtual {p0, v3}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v8

    if-gez v8, :cond_7

    .line 1572
    invoke-direct {p0, v3}, Lcom/tonicartos/superslim/LayoutManager;->updateHeaderForTrimFromStart(Landroid/view/View;)V

    .line 1575
    :cond_7
    invoke-virtual {p0, v3}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v8

    if-gtz v8, :cond_1

    .line 1576
    iget-object v8, p1, Lcom/tonicartos/superslim/LayoutState;->recycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {p0, v3, v8}, Lcom/tonicartos/superslim/LayoutManager;->removeAndRecycleView(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Recycler;)V

    goto :goto_1
.end method

.method private trimTail(Lcom/tonicartos/superslim/LayoutManager$Direction;Lcom/tonicartos/superslim/LayoutState;)V
    .locals 1
    .param p1, "direction"    # Lcom/tonicartos/superslim/LayoutManager$Direction;
    .param p2, "state"    # Lcom/tonicartos/superslim/LayoutState;

    .prologue
    .line 1590
    sget-object v0, Lcom/tonicartos/superslim/LayoutManager$Direction;->START:Lcom/tonicartos/superslim/LayoutManager$Direction;

    if-ne p1, v0, :cond_0

    .line 1591
    invoke-direct {p0, p2}, Lcom/tonicartos/superslim/LayoutManager;->trimStart(Lcom/tonicartos/superslim/LayoutState;)V

    .line 1595
    :goto_0
    return-void

    .line 1593
    :cond_0
    invoke-direct {p0, p2}, Lcom/tonicartos/superslim/LayoutManager;->trimEnd(Lcom/tonicartos/superslim/LayoutState;)V

    goto :goto_0
.end method

.method private updateHeaderForEnd(Landroid/view/View;I)I
    .locals 1
    .param p1, "header"    # Landroid/view/View;
    .param p2, "markerLine"    # I

    .prologue
    .line 1606
    if-nez p1, :cond_0

    .line 1614
    .end local p2    # "markerLine":I
    :goto_0
    return p2

    .line 1611
    .restart local p2    # "markerLine":I
    :cond_0
    invoke-virtual {p0, p1}, Lcom/tonicartos/superslim/LayoutManager;->detachView(Landroid/view/View;)V

    .line 1612
    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Lcom/tonicartos/superslim/LayoutManager;->attachView(Landroid/view/View;I)V

    .line 1614
    invoke-virtual {p0, p1}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v0

    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    move-result p2

    goto :goto_0
.end method

.method private updateHeaderForStart(Landroid/view/View;IILcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)I
    .locals 21
    .param p1, "header"    # Landroid/view/View;
    .param p2, "leadingEdge"    # I
    .param p3, "markerLine"    # I
    .param p4, "sd"    # Lcom/tonicartos/superslim/SectionData;
    .param p5, "state"    # Lcom/tonicartos/superslim/LayoutState;

    .prologue
    .line 1629
    move-object/from16 v0, p4

    iget-boolean v5, v0, Lcom/tonicartos/superslim/SectionData;->hasHeader:Z

    if-nez v5, :cond_0

    move/from16 v16, p3

    .line 1672
    .end local p3    # "markerLine":I
    .local v16, "markerLine":I
    :goto_0
    return v16

    .line 1633
    .end local v16    # "markerLine":I
    .restart local p3    # "markerLine":I
    :cond_0
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Lcom/tonicartos/superslim/LayoutManager;->getSlm(Lcom/tonicartos/superslim/SectionData;)Lcom/tonicartos/superslim/SectionLayoutManager;

    move-result-object v19

    .line 1634
    .local v19, "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    move-object/from16 v0, p4

    iget v5, v0, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/tonicartos/superslim/LayoutManager;->findLastIndexForSection(I)I

    move-result v18

    .line 1635
    .local v18, "sli":I
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/superslim/LayoutManager;->getHeight()I

    move-result v10

    .line 1636
    .local v10, "sectionBottom":I
    const/4 v5, -0x1

    move/from16 v0, v18

    if-ne v0, v5, :cond_5

    const/4 v15, 0x0

    .local v15, "i":I
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v5

    if-ge v15, v5, :cond_1

    .line 1637
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v20

    .line 1638
    .local v20, "view":Landroid/view/View;
    invoke-virtual/range {v20 .. v20}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v17

    check-cast v17, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 1639
    .local v17, "params":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    invoke-virtual/range {v17 .. v17}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getTestedFirstPosition()I

    move-result v5

    move-object/from16 v0, p4

    iget v6, v0, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    if-eq v5, v6, :cond_7

    .line 1641
    invoke-virtual/range {v17 .. v17}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getTestedFirstPosition()I

    move-result v5

    sget-object v6, Lcom/tonicartos/superslim/LayoutManager$Direction;->START:Lcom/tonicartos/superslim/LayoutManager$Direction;

    .line 1640
    move-object/from16 v0, p0

    invoke-direct {v0, v5, v15, v6}, Lcom/tonicartos/superslim/LayoutManager;->findAttachedHeaderOrFirstViewForSection(IILcom/tonicartos/superslim/LayoutManager$Direction;)Landroid/view/View;

    move-result-object v13

    .line 1643
    .local v13, "first":Landroid/view/View;
    if-nez v13, :cond_6

    .line 1644
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v10

    .line 1653
    .end local v13    # "first":Landroid/view/View;
    .end local v17    # "params":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    .end local v20    # "view":Landroid/view/View;
    :cond_1
    :goto_2
    const/4 v5, -0x1

    move/from16 v0, v18

    if-ne v0, v5, :cond_2

    move-object/from16 v0, p4

    iget-object v5, v0, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-virtual {v5}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderInline()Z

    move-result v5

    if-eqz v5, :cond_2

    move-object/from16 v0, p4

    iget-object v5, v0, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-virtual {v5}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderOverlay()Z

    move-result v5

    if-nez v5, :cond_2

    .line 1654
    move/from16 p3, v10

    .line 1657
    :cond_2
    const/4 v9, 0x0

    .line 1658
    .local v9, "offset":I
    move-object/from16 v0, p4

    iget-object v5, v0, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-virtual {v5}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderInline()Z

    move-result v5

    if-eqz v5, :cond_3

    move-object/from16 v0, p4

    iget-object v5, v0, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-virtual {v5}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderOverlay()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 1659
    :cond_3
    move-object/from16 v0, p4

    iget v5, v0, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    const/4 v6, 0x1

    move-object/from16 v0, v19

    invoke-virtual {v0, v5, v6}, Lcom/tonicartos/superslim/SectionLayoutManager;->getFirstVisibleView(IZ)Landroid/view/View;

    move-result-object v14

    .line 1660
    .local v14, "firstVisibleView":Landroid/view/View;
    if-nez v14, :cond_8

    .line 1661
    const/4 v9, 0x0

    .end local v14    # "firstVisibleView":Landroid/view/View;
    :cond_4
    :goto_3
    move-object/from16 v5, p0

    move-object/from16 v6, p1

    move/from16 v7, p2

    move/from16 v8, p3

    move-object/from16 v11, p4

    move-object/from16 v12, p5

    .line 1667
    invoke-direct/range {v5 .. v12}, Lcom/tonicartos/superslim/LayoutManager;->layoutHeaderTowardsStart(Landroid/view/View;IIIILcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)I

    move-result p3

    .line 1670
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/tonicartos/superslim/LayoutManager;->attachHeaderForStart(Landroid/view/View;ILcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)V

    move/from16 v16, p3

    .line 1672
    .end local p3    # "markerLine":I
    .restart local v16    # "markerLine":I
    goto/16 :goto_0

    .end local v9    # "offset":I
    .end local v15    # "i":I
    .end local v16    # "markerLine":I
    .restart local p3    # "markerLine":I
    :cond_5
    move/from16 v15, v18

    .line 1636
    goto/16 :goto_1

    .line 1646
    .restart local v13    # "first":Landroid/view/View;
    .restart local v15    # "i":I
    .restart local v17    # "params":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    .restart local v20    # "view":Landroid/view/View;
    :cond_6
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v10

    .line 1648
    goto :goto_2

    .line 1636
    .end local v13    # "first":Landroid/view/View;
    :cond_7
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_1

    .line 1663
    .end local v17    # "params":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    .end local v20    # "view":Landroid/view/View;
    .restart local v9    # "offset":I
    .restart local v14    # "firstVisibleView":Landroid/view/View;
    :cond_8
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v5

    move-object/from16 v0, v19

    move-object/from16 v1, p4

    move-object/from16 v2, p5

    invoke-virtual {v0, v5, v1, v2}, Lcom/tonicartos/superslim/SectionLayoutManager;->computeHeaderOffset(ILcom/tonicartos/superslim/SectionData;Lcom/tonicartos/superslim/LayoutState;)I

    move-result v9

    goto :goto_3
.end method

.method private updateHeaderForTrimFromStart(Landroid/view/View;)V
    .locals 13
    .param p1, "header"    # Landroid/view/View;

    .prologue
    const/4 v12, 0x0

    .line 1676
    new-instance v7, Lcom/tonicartos/superslim/SectionData;

    invoke-direct {v7, p0, p1}, Lcom/tonicartos/superslim/SectionData;-><init>(Lcom/tonicartos/superslim/LayoutManager;Landroid/view/View;)V

    .line 1677
    .local v7, "sd":Lcom/tonicartos/superslim/SectionData;
    iget-object v0, v7, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-virtual {v0}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderSticky()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1706
    :cond_0
    :goto_0
    return-void

    .line 1681
    :cond_1
    iget v0, v7, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    invoke-direct {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->findLastIndexForSection(I)I

    move-result v11

    .line 1682
    .local v11, "slp":I
    const/4 v0, -0x1

    if-eq v11, v0, :cond_0

    .line 1686
    invoke-direct {p0, v7}, Lcom/tonicartos/superslim/LayoutManager;->getSlm(Lcom/tonicartos/superslim/SectionData;)Lcom/tonicartos/superslim/SectionLayoutManager;

    move-result-object v10

    .line 1687
    .local v10, "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    iget v0, v7, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getHeight()I

    move-result v1

    invoke-virtual {v10, v0, v11, v1}, Lcom/tonicartos/superslim/SectionLayoutManager;->getLowestEdge(III)I

    move-result v8

    .line 1688
    .local v8, "sectionBottom":I
    iget v0, v7, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    invoke-virtual {v10, v0, v12, v12}, Lcom/tonicartos/superslim/SectionLayoutManager;->getHighestEdge(III)I

    move-result v9

    .line 1690
    .local v9, "sectionTop":I
    invoke-virtual {p0, p1}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    move-result v6

    .line 1691
    .local v6, "height":I
    iget-object v0, v7, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-virtual {v0}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderInline()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, v7, Lcom/tonicartos/superslim/SectionData;->headerParams:Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-virtual {v0}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderOverlay()Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    sub-int v0, v8, v9

    if-lt v0, v6, :cond_0

    .line 1693
    :cond_3
    invoke-virtual {p0, p1}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedLeft(Landroid/view/View;)I

    move-result v2

    .line 1694
    .local v2, "left":I
    invoke-virtual {p0, p1}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedRight(Landroid/view/View;)I

    move-result v4

    .line 1696
    .local v4, "right":I
    const/4 v3, 0x0

    .line 1697
    .local v3, "top":I
    add-int v5, v3, v6

    .line 1699
    .local v5, "bottom":I
    if-le v5, v8, :cond_4

    .line 1700
    move v5, v8

    .line 1701
    sub-int v3, v5, v6

    :cond_4
    move-object v0, p0

    move-object v1, p1

    .line 1704
    invoke-virtual/range {v0 .. v5}, Lcom/tonicartos/superslim/LayoutManager;->layoutDecorated(Landroid/view/View;IIII)V

    goto :goto_0
.end method


# virtual methods
.method public addSlm(Ljava/lang/String;Lcom/tonicartos/superslim/SectionLayoutManager;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "slm"    # Lcom/tonicartos/superslim/SectionLayoutManager;

    .prologue
    .line 83
    iget-object v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mSlms:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    return-void
.end method

.method public canScrollVertically()Z
    .locals 1

    .prologue
    .line 388
    const/4 v0, 0x1

    return v0
.end method

.method public computeVerticalScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I
    .locals 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v2, 0x1

    .line 555
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v1

    if-nez v1, :cond_1

    .line 556
    :cond_0
    const/4 v1, 0x0

    .line 569
    :goto_0
    return v1

    .line 559
    :cond_1
    iget-boolean v1, p0, Lcom/tonicartos/superslim/LayoutManager;->mSmoothScrollEnabled:Z

    if-nez v1, :cond_2

    .line 560
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v1

    goto :goto_0

    .line 563
    :cond_2
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v1

    int-to-float v0, v1

    .line 566
    .local v0, "contentInView":F
    invoke-direct {p0, p1, v2}, Lcom/tonicartos/superslim/LayoutManager;->getFractionOfContentAbove(Landroid/support/v7/widget/RecyclerView$State;Z)F

    move-result v1

    sub-float/2addr v0, v1

    .line 567
    invoke-direct {p0, p1, v2}, Lcom/tonicartos/superslim/LayoutManager;->getFractionOfContentBelow(Landroid/support/v7/widget/RecyclerView$State;Z)F

    move-result v1

    sub-float/2addr v0, v1

    .line 569
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v1

    int-to-float v1, v1

    div-float v1, v0, v1

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getHeight()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v1, v2

    float-to-int v1, v1

    goto :goto_0
.end method

.method public computeVerticalScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I
    .locals 4
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v2, 0x0

    .line 574
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v3

    if-nez v3, :cond_1

    .line 585
    :cond_0
    :goto_0
    return v2

    .line 578
    :cond_1
    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 579
    .local v0, "child":Landroid/view/View;
    iget-boolean v3, p0, Lcom/tonicartos/superslim/LayoutManager;->mSmoothScrollEnabled:Z

    if-nez v3, :cond_2

    .line 580
    invoke-virtual {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v2

    goto :goto_0

    .line 583
    :cond_2
    invoke-virtual {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v3

    int-to-float v1, v3

    .line 584
    .local v1, "contentAbove":F
    invoke-direct {p0, p1, v2}, Lcom/tonicartos/superslim/LayoutManager;->getFractionOfContentAbove(Landroid/support/v7/widget/RecyclerView$State;Z)F

    move-result v2

    add-float/2addr v1, v2

    .line 585
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v2

    int-to-float v2, v2

    div-float v2, v1, v2

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getHeight()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v2, v3

    float-to-int v2, v2

    goto :goto_0
.end method

.method public computeVerticalScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I
    .locals 1
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 590
    iget-boolean v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mSmoothScrollEnabled:Z

    if-nez v0, :cond_0

    .line 591
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    .line 594
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getHeight()I

    move-result v0

    goto :goto_0
.end method

.method public findFirstCompletelyVisibleItem()Landroid/view/View;
    .locals 12

    .prologue
    const/4 v9, 0x0

    .line 92
    const/4 v2, 0x0

    .line 93
    .local v2, "firstVisibleView":Landroid/view/View;
    const/4 v7, 0x0

    .line 94
    .local v7, "sd":Lcom/tonicartos/superslim/SectionData;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    if-ge v6, v10, :cond_0

    .line 95
    new-instance v7, Lcom/tonicartos/superslim/SectionData;

    .end local v7    # "sd":Lcom/tonicartos/superslim/SectionData;
    invoke-virtual {p0, v9}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    invoke-direct {v7, p0, v10}, Lcom/tonicartos/superslim/SectionData;-><init>(Lcom/tonicartos/superslim/LayoutManager;Landroid/view/View;)V

    .line 96
    .restart local v7    # "sd":Lcom/tonicartos/superslim/SectionData;
    invoke-direct {p0, v7}, Lcom/tonicartos/superslim/LayoutManager;->getSlm(Lcom/tonicartos/superslim/SectionData;)Lcom/tonicartos/superslim/SectionLayoutManager;

    move-result-object v8

    .line 98
    .local v8, "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    iget v10, v7, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    invoke-virtual {v8, v10, v9}, Lcom/tonicartos/superslim/SectionLayoutManager;->getFirstCompletelyVisibleView(IZ)Landroid/view/View;

    move-result-object v2

    .line 99
    if-eqz v2, :cond_2

    .line 103
    .end local v8    # "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    :cond_0
    if-nez v2, :cond_3

    .line 104
    const/4 v2, 0x0

    .line 135
    .end local v2    # "firstVisibleView":Landroid/view/View;
    :cond_1
    :goto_1
    return-object v2

    .line 94
    .restart local v2    # "firstVisibleView":Landroid/view/View;
    .restart local v8    # "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 107
    .end local v8    # "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    :cond_3
    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    .line 108
    .local v1, "firstVisiblePosition":I
    iget v10, v7, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    if-eq v1, v10, :cond_1

    iget v10, v7, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    add-int/lit8 v10, v10, 0x1

    if-gt v1, v10, :cond_1

    .line 115
    iget v10, v7, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    sget-object v11, Lcom/tonicartos/superslim/LayoutManager$Direction;->START:Lcom/tonicartos/superslim/LayoutManager$Direction;

    invoke-direct {p0, v10, v9, v11}, Lcom/tonicartos/superslim/LayoutManager;->findAttachedHeaderOrFirstViewForSection(IILcom/tonicartos/superslim/LayoutManager$Direction;)Landroid/view/View;

    move-result-object v3

    .line 117
    .local v3, "header":Landroid/view/View;
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    iget-boolean v10, v10, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeader:Z

    if-eqz v10, :cond_1

    .line 121
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getClipToPadding()Z

    move-result v10

    if-eqz v10, :cond_4

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getPaddingTop()I

    move-result v9

    .line 122
    .local v9, "topEdge":I
    :cond_4
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getClipToPadding()Z

    move-result v10

    if-eqz v10, :cond_5

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getHeight()I

    move-result v10

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getPaddingBottom()I

    move-result v11

    sub-int v0, v10, v11

    .line 124
    .local v0, "bottomEdge":I
    :goto_2
    invoke-virtual {p0, v3}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v5

    .line 125
    .local v5, "headerTop":I
    invoke-virtual {p0, v3}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v4

    .line 127
    .local v4, "headerBottom":I
    if-lt v5, v9, :cond_1

    if-lt v0, v4, :cond_1

    .line 131
    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v10

    if-ge v5, v10, :cond_1

    move-object v2, v3

    .line 132
    goto :goto_1

    .line 122
    .end local v0    # "bottomEdge":I
    .end local v4    # "headerBottom":I
    .end local v5    # "headerTop":I
    :cond_5
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getHeight()I

    move-result v0

    goto :goto_2
.end method

.method public findFirstCompletelyVisibleItemPosition()I
    .locals 2

    .prologue
    .line 144
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->findFirstCompletelyVisibleItem()Landroid/view/View;

    move-result-object v0

    .line 145
    .local v0, "item":Landroid/view/View;
    if-nez v0, :cond_0

    .line 146
    const/4 v1, -0x1

    .line 149
    :goto_0
    return v1

    :cond_0
    invoke-virtual {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    goto :goto_0
.end method

.method public findFirstVisibleItem()Landroid/view/View;
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 158
    new-instance v4, Lcom/tonicartos/superslim/SectionData;

    invoke-virtual {p0, v8}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-direct {v4, p0, v6}, Lcom/tonicartos/superslim/SectionData;-><init>(Lcom/tonicartos/superslim/LayoutManager;Landroid/view/View;)V

    .line 159
    .local v4, "sd":Lcom/tonicartos/superslim/SectionData;
    invoke-direct {p0, v4}, Lcom/tonicartos/superslim/LayoutManager;->getSlm(Lcom/tonicartos/superslim/SectionData;)Lcom/tonicartos/superslim/SectionLayoutManager;

    move-result-object v5

    .line 160
    .local v5, "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    iget v6, v4, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    invoke-virtual {v5, v6, v8}, Lcom/tonicartos/superslim/SectionLayoutManager;->getFirstVisibleView(IZ)Landroid/view/View;

    move-result-object v2

    .line 161
    .local v2, "firstVisibleView":Landroid/view/View;
    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v3

    .line 162
    .local v3, "position":I
    iget v6, v4, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    add-int/lit8 v6, v6, 0x1

    if-gt v3, v6, :cond_0

    iget v6, v4, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    if-ne v3, v6, :cond_1

    .line 180
    .end local v2    # "firstVisibleView":Landroid/view/View;
    :cond_0
    :goto_0
    return-object v2

    .line 165
    .restart local v2    # "firstVisibleView":Landroid/view/View;
    :cond_1
    iget v6, v4, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    sget-object v7, Lcom/tonicartos/superslim/LayoutManager$Direction;->START:Lcom/tonicartos/superslim/LayoutManager$Direction;

    invoke-direct {p0, v6, v8, v7}, Lcom/tonicartos/superslim/LayoutManager;->findAttachedHeaderOrFirstViewForSection(IILcom/tonicartos/superslim/LayoutManager$Direction;)Landroid/view/View;

    move-result-object v0

    .line 166
    .local v0, "first":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 170
    invoke-virtual {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v6

    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v7

    if-gt v6, v7, :cond_2

    move-object v2, v0

    .line 171
    goto :goto_0

    .line 174
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 175
    .local v1, "firstParams":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    invoke-virtual {v1}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderInline()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-virtual {v1}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderOverlay()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 176
    :cond_3
    invoke-virtual {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v6

    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v7

    if-ne v6, v7, :cond_0

    move-object v2, v0

    .line 177
    goto :goto_0
.end method

.method public findFirstVisibleItemPosition()I
    .locals 2

    .prologue
    .line 189
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->findFirstVisibleItem()Landroid/view/View;

    move-result-object v0

    .line 190
    .local v0, "item":Landroid/view/View;
    if-nez v0, :cond_0

    .line 191
    const/4 v1, -0x1

    .line 193
    :goto_0
    return v1

    :cond_0
    invoke-virtual {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    goto :goto_0
.end method

.method public findLastCompletelyVisibleItem()Landroid/view/View;
    .locals 3

    .prologue
    .line 202
    new-instance v0, Lcom/tonicartos/superslim/SectionData;

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, p0, v2}, Lcom/tonicartos/superslim/SectionData;-><init>(Lcom/tonicartos/superslim/LayoutManager;Landroid/view/View;)V

    .line 203
    .local v0, "sd":Lcom/tonicartos/superslim/SectionData;
    invoke-direct {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->getSlm(Lcom/tonicartos/superslim/SectionData;)Lcom/tonicartos/superslim/SectionLayoutManager;

    move-result-object v1

    .line 205
    .local v1, "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    iget v2, v0, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    invoke-virtual {v1, v2}, Lcom/tonicartos/superslim/SectionLayoutManager;->getLastCompletelyVisibleView(I)Landroid/view/View;

    move-result-object v2

    return-object v2
.end method

.method public findLastCompletelyVisibleItemPosition()I
    .locals 3

    .prologue
    .line 214
    new-instance v0, Lcom/tonicartos/superslim/SectionData;

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, p0, v2}, Lcom/tonicartos/superslim/SectionData;-><init>(Lcom/tonicartos/superslim/LayoutManager;Landroid/view/View;)V

    .line 215
    .local v0, "sd":Lcom/tonicartos/superslim/SectionData;
    invoke-direct {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->getSlm(Lcom/tonicartos/superslim/SectionData;)Lcom/tonicartos/superslim/SectionLayoutManager;

    move-result-object v1

    .line 217
    .local v1, "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    iget v2, v0, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    invoke-virtual {v1, v2}, Lcom/tonicartos/superslim/SectionLayoutManager;->findLastCompletelyVisibleItemPosition(I)I

    move-result v2

    return v2
.end method

.method public findLastVisibleItem()Landroid/view/View;
    .locals 3

    .prologue
    .line 226
    new-instance v0, Lcom/tonicartos/superslim/SectionData;

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, p0, v2}, Lcom/tonicartos/superslim/SectionData;-><init>(Lcom/tonicartos/superslim/LayoutManager;Landroid/view/View;)V

    .line 227
    .local v0, "sd":Lcom/tonicartos/superslim/SectionData;
    invoke-direct {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->getSlm(Lcom/tonicartos/superslim/SectionData;)Lcom/tonicartos/superslim/SectionLayoutManager;

    move-result-object v1

    .line 229
    .local v1, "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    iget v2, v0, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    invoke-virtual {v1, v2}, Lcom/tonicartos/superslim/SectionLayoutManager;->getLastVisibleView(I)Landroid/view/View;

    move-result-object v2

    return-object v2
.end method

.method public findLastVisibleItemPosition()I
    .locals 3

    .prologue
    .line 238
    new-instance v0, Lcom/tonicartos/superslim/SectionData;

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, p0, v2}, Lcom/tonicartos/superslim/SectionData;-><init>(Lcom/tonicartos/superslim/LayoutManager;Landroid/view/View;)V

    .line 239
    .local v0, "sd":Lcom/tonicartos/superslim/SectionData;
    invoke-direct {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->getSlm(Lcom/tonicartos/superslim/SectionData;)Lcom/tonicartos/superslim/SectionLayoutManager;

    move-result-object v1

    .line 241
    .local v1, "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    iget v2, v0, Lcom/tonicartos/superslim/SectionData;->firstPosition:I

    invoke-virtual {v1, v2}, Lcom/tonicartos/superslim/SectionLayoutManager;->findLastVisibleItemPosition(I)I

    move-result v2

    return v2
.end method

.method public generateDefaultLayoutParams()Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .locals 2

    .prologue
    const/4 v1, -0x2

    .line 285
    new-instance v0, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    invoke-direct {v0, v1, v1}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .locals 9
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x0

    const/4 v5, 0x1

    const/4 v8, 0x3

    .line 302
    sget-object v6, Lcom/vkontakte/android/R$styleable;->superslim_LayoutManager:[I

    invoke-virtual {p1, p2, v6}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 303
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x15

    if-ge v6, v7, :cond_1

    .line 304
    new-instance v4, Landroid/util/TypedValue;

    invoke-direct {v4}, Landroid/util/TypedValue;-><init>()V

    .line 305
    .local v4, "value":Landroid/util/TypedValue;
    invoke-virtual {v0, v8, v4}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 306
    iget v6, v4, Landroid/util/TypedValue;->type:I

    if-ne v6, v8, :cond_0

    move v1, v5

    .line 312
    .end local v4    # "value":Landroid/util/TypedValue;
    .local v1, "isString":Z
    :cond_0
    :goto_0
    const/4 v2, 0x0

    .line 314
    .local v2, "sectionManager":Ljava/lang/String;
    if-eqz v1, :cond_4

    .line 316
    invoke-virtual {v0, v8}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 317
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 318
    const/4 v3, 0x1

    .line 327
    .local v3, "sectionManagerKind":I
    :goto_1
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 329
    invoke-direct {p0, v3, v2}, Lcom/tonicartos/superslim/LayoutManager;->getSLM(ILjava/lang/String;)Lcom/tonicartos/superslim/SectionLayoutManager;

    move-result-object v5

    invoke-virtual {v5, p1, p2}, Lcom/tonicartos/superslim/SectionLayoutManager;->generateLayoutParams(Landroid/content/Context;Landroid/util/AttributeSet;)Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    move-result-object v5

    return-object v5

    .line 309
    .end local v1    # "isString":Z
    .end local v2    # "sectionManager":Ljava/lang/String;
    .end local v3    # "sectionManagerKind":I
    :cond_1
    invoke-virtual {v0, v8}, Landroid/content/res/TypedArray;->getType(I)I

    move-result v6

    if-ne v6, v8, :cond_2

    move v1, v5

    .restart local v1    # "isString":Z
    :cond_2
    goto :goto_0

    .line 320
    .restart local v2    # "sectionManager":Ljava/lang/String;
    :cond_3
    const/4 v3, -0x1

    .restart local v3    # "sectionManagerKind":I
    goto :goto_1

    .line 324
    .end local v3    # "sectionManagerKind":I
    :cond_4
    invoke-virtual {v0, v8, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    .restart local v3    # "sectionManagerKind":I
    goto :goto_1
.end method

.method public bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .locals 1

    .prologue
    .line 36
    invoke-virtual {p0, p1}, Lcom/tonicartos/superslim/LayoutManager;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    .locals 2
    .param p1, "lp"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    const/4 v1, -0x1

    .line 290
    invoke-static {p1}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->from(Landroid/view/ViewGroup$LayoutParams;)Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    move-result-object v0

    .line 291
    .local v0, "params":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    iput v1, v0, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->width:I

    .line 292
    iput v1, v0, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->height:I

    .line 294
    invoke-direct {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->getSlm(Lcom/tonicartos/superslim/LayoutManager$LayoutParams;)Lcom/tonicartos/superslim/SectionLayoutManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/tonicartos/superslim/SectionLayoutManager;->generateLayoutParams(Lcom/tonicartos/superslim/LayoutManager$LayoutParams;)Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    move-result-object v1

    return-object v1
.end method

.method getBorderLine(Landroid/view/View;Lcom/tonicartos/superslim/LayoutManager$Direction;)I
    .locals 2
    .param p1, "anchorView"    # Landroid/view/View;
    .param p2, "direction"    # Lcom/tonicartos/superslim/LayoutManager$Direction;

    .prologue
    .line 628
    if-nez p1, :cond_1

    .line 629
    sget-object v1, Lcom/tonicartos/superslim/LayoutManager$Direction;->START:Lcom/tonicartos/superslim/LayoutManager$Direction;

    if-ne p2, v1, :cond_0

    .line 630
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getPaddingBottom()I

    move-result v0

    .line 639
    .local v0, "borderline":I
    :goto_0
    return v0

    .line 632
    .end local v0    # "borderline":I
    :cond_0
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getPaddingTop()I

    move-result v0

    .restart local v0    # "borderline":I
    goto :goto_0

    .line 634
    .end local v0    # "borderline":I
    :cond_1
    sget-object v1, Lcom/tonicartos/superslim/LayoutManager$Direction;->START:Lcom/tonicartos/superslim/LayoutManager$Direction;

    if-ne p2, v1, :cond_2

    .line 635
    invoke-virtual {p0, p1}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v0

    .restart local v0    # "borderline":I
    goto :goto_0

    .line 637
    .end local v0    # "borderline":I
    :cond_2
    invoke-virtual {p0, p1}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v0

    .restart local v0    # "borderline":I
    goto :goto_0
.end method

.method public getDecoratedBottom(Landroid/view/View;)I
    .locals 3
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 516
    .line 517
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 518
    .local v0, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v1

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v1, v2

    return v1
.end method

.method public getDecoratedLeft(Landroid/view/View;)I
    .locals 3
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 495
    .line 496
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 497
    .local v0, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getDecoratedLeft(Landroid/view/View;)I

    move-result v1

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    sub-int/2addr v1, v2

    return v1
.end method

.method public getDecoratedMeasuredHeight(Landroid/view/View;)I
    .locals 3
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 480
    .line 481
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 482
    .local v0, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    move-result v1

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v1, v2

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v1, v2

    return v1
.end method

.method public getDecoratedMeasuredWidth(Landroid/view/View;)I
    .locals 3
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 473
    .line 474
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 475
    .local v0, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getDecoratedMeasuredWidth(Landroid/view/View;)I

    move-result v1

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v1, v2

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v1, v2

    return v1
.end method

.method public getDecoratedRight(Landroid/view/View;)I
    .locals 3
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 509
    .line 510
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 511
    .local v0, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getDecoratedRight(Landroid/view/View;)I

    move-result v1

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v1, v2

    return v1
.end method

.method public getDecoratedTop(Landroid/view/View;)I
    .locals 3
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 502
    .line 503
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 504
    .local v0, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v1

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    sub-int/2addr v1, v2

    return v1
.end method

.method public isSmoothScrollEnabled()Z
    .locals 1

    .prologue
    .line 245
    iget-boolean v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mSmoothScrollEnabled:Z

    return v0
.end method

.method public layoutDecorated(Landroid/view/View;IIII)V
    .locals 7
    .param p1, "child"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 487
    .line 488
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 489
    .local v6, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    iget v0, v6, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int v2, p2, v0

    iget v0, v6, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int v3, p3, v0

    iget v0, v6, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    sub-int v4, p4, v0

    iget v0, v6, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    sub-int v5, p5, v0

    move-object v0, p0

    move-object v1, p1

    invoke-super/range {v0 .. v5}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->layoutDecorated(Landroid/view/View;IIII)V

    .line 491
    return-void
.end method

.method measureHeader(Landroid/view/View;)V
    .locals 5
    .param p1, "header"    # Landroid/view/View;

    .prologue
    .line 645
    const/4 v2, 0x0

    .line 646
    .local v2, "unavailableWidth":I
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 647
    .local v0, "lp":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getPaddingStart()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getPaddingEnd()I

    move-result v4

    sub-int v1, v3, v4

    .line 648
    .local v1, "recyclerWidth":I
    invoke-virtual {v0}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderOverlay()Z

    move-result v3

    if-nez v3, :cond_0

    .line 649
    invoke-virtual {v0}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderStartAligned()Z

    move-result v3

    if-eqz v3, :cond_1

    iget-boolean v3, v0, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->headerStartMarginIsAuto:Z

    if-nez v3, :cond_1

    .line 650
    iget v3, v0, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->headerMarginStart:I

    sub-int v2, v1, v3

    .line 655
    :cond_0
    :goto_0
    const/4 v3, 0x0

    invoke-virtual {p0, p1, v2, v3}, Lcom/tonicartos/superslim/LayoutManager;->measureChildWithMargins(Landroid/view/View;II)V

    .line 656
    return-void

    .line 651
    :cond_1
    invoke-virtual {v0}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->isHeaderEndAligned()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-boolean v3, v0, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->headerEndMarginIsAuto:Z

    if-nez v3, :cond_0

    .line 652
    iget v3, v0, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->headerMarginEnd:I

    sub-int v2, v1, v3

    goto :goto_0
.end method

.method public onAdapterChanged(Landroid/support/v7/widget/RecyclerView$Adapter;Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .locals 0
    .param p1, "oldAdapter"    # Landroid/support/v7/widget/RecyclerView$Adapter;
    .param p2, "newAdapter"    # Landroid/support/v7/widget/RecyclerView$Adapter;

    .prologue
    .line 523
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->removeAllViews()V

    .line 524
    return-void
.end method

.method public onItemsChanged(Landroid/support/v7/widget/RecyclerView;)V
    .locals 2
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 528
    invoke-direct {p0}, Lcom/tonicartos/superslim/LayoutManager;->getAnchorChild()Landroid/view/View;

    move-result-object v0

    .line 529
    .local v0, "view":Landroid/view/View;
    if-nez v0, :cond_0

    .line 530
    const/4 v1, -0x1

    iput v1, p0, Lcom/tonicartos/superslim/LayoutManager;->mRequestPosition:I

    .line 531
    const/4 v1, 0x0

    iput v1, p0, Lcom/tonicartos/superslim/LayoutManager;->mRequestPositionOffset:I

    .line 536
    :goto_0
    return-void

    .line 533
    :cond_0
    invoke-virtual {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    iput v1, p0, Lcom/tonicartos/superslim/LayoutManager;->mRequestPosition:I

    .line 534
    invoke-virtual {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v1

    iput v1, p0, Lcom/tonicartos/superslim/LayoutManager;->mRequestPositionOffset:I

    goto :goto_0
.end method

.method public onItemsUpdated(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 4
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I

    .prologue
    .line 540
    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onItemsUpdated(Landroid/support/v7/widget/RecyclerView;II)V

    .line 542
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 543
    .local v0, "first":Landroid/view/View;
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p0, v2}, Lcom/tonicartos/superslim/LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 544
    .local v1, "last":Landroid/view/View;
    add-int v2, p2, p3

    invoke-virtual {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v3

    if-gt v2, v3, :cond_1

    .line 551
    :cond_0
    :goto_0
    return-void

    .line 548
    :cond_1
    invoke-virtual {p0, v1}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v2

    if-gt p2, v2, :cond_0

    .line 549
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->requestLayout()V

    goto :goto_0
.end method

.method public onLayoutChildren(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 10
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v6, 0x0

    const/4 v9, -0x1

    .line 254
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v3

    .line 255
    .local v3, "itemCount":I
    if-nez v3, :cond_0

    .line 256
    invoke-virtual {p0, p1}, Lcom/tonicartos/superslim/LayoutManager;->detachAndScrapAttachedViews(Landroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 281
    :goto_0
    return-void

    .line 263
    :cond_0
    iget v7, p0, Lcom/tonicartos/superslim/LayoutManager;->mRequestPosition:I

    if-eq v7, v9, :cond_1

    .line 264
    iget v7, p0, Lcom/tonicartos/superslim/LayoutManager;->mRequestPosition:I

    add-int/lit8 v8, v3, -0x1

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 265
    .local v5, "requestedPosition":I
    iput v9, p0, Lcom/tonicartos/superslim/LayoutManager;->mRequestPosition:I

    .line 266
    iget v1, p0, Lcom/tonicartos/superslim/LayoutManager;->mRequestPositionOffset:I

    .line 267
    .local v1, "borderLine":I
    iput v6, p0, Lcom/tonicartos/superslim/LayoutManager;->mRequestPositionOffset:I

    .line 275
    :goto_1
    invoke-virtual {p0, p1}, Lcom/tonicartos/superslim/LayoutManager;->detachAndScrapAttachedViews(Landroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 277
    new-instance v4, Lcom/tonicartos/superslim/LayoutState;

    invoke-direct {v4, p0, p1, p2}, Lcom/tonicartos/superslim/LayoutState;-><init>(Landroid/support/v7/widget/RecyclerView$LayoutManager;Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V

    .line 278
    .local v4, "layoutState":Lcom/tonicartos/superslim/LayoutState;
    invoke-direct {p0, v5, v1, v4}, Lcom/tonicartos/superslim/LayoutManager;->layoutChildren(IILcom/tonicartos/superslim/LayoutState;)I

    move-result v2

    .line 280
    .local v2, "bottomLine":I
    invoke-direct {p0, v2, v4}, Lcom/tonicartos/superslim/LayoutManager;->fixOverscroll(ILcom/tonicartos/superslim/LayoutState;)V

    goto :goto_0

    .line 269
    .end local v1    # "borderLine":I
    .end local v2    # "bottomLine":I
    .end local v4    # "layoutState":Lcom/tonicartos/superslim/LayoutState;
    .end local v5    # "requestedPosition":I
    :cond_1
    invoke-direct {p0}, Lcom/tonicartos/superslim/LayoutManager;->getAnchorChild()Landroid/view/View;

    move-result-object v0

    .line 270
    .local v0, "anchorView":Landroid/view/View;
    if-nez v0, :cond_2

    move v5, v6

    .line 272
    .restart local v5    # "requestedPosition":I
    :goto_2
    sget-object v6, Lcom/tonicartos/superslim/LayoutManager$Direction;->END:Lcom/tonicartos/superslim/LayoutManager$Direction;

    invoke-virtual {p0, v0, v6}, Lcom/tonicartos/superslim/LayoutManager;->getBorderLine(Landroid/view/View;Lcom/tonicartos/superslim/LayoutManager$Direction;)I

    move-result v1

    .restart local v1    # "borderLine":I
    goto :goto_1

    .line 271
    .end local v1    # "borderLine":I
    .end local v5    # "requestedPosition":I
    :cond_2
    invoke-virtual {p0, v0}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v6

    add-int/lit8 v7, v3, -0x1

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v5

    goto :goto_2
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 1
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 613
    move-object v0, p1

    check-cast v0, Lcom/tonicartos/superslim/LayoutManager$SavedState;

    iget v0, v0, Lcom/tonicartos/superslim/LayoutManager$SavedState;->anchorPosition:I

    iput v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mRequestPosition:I

    .line 614
    check-cast p1, Lcom/tonicartos/superslim/LayoutManager$SavedState;

    .end local p1    # "state":Landroid/os/Parcelable;
    iget v0, p1, Lcom/tonicartos/superslim/LayoutManager$SavedState;->anchorOffset:I

    iput v0, p0, Lcom/tonicartos/superslim/LayoutManager;->mRequestPositionOffset:I

    .line 615
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->requestLayout()V

    .line 616
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 599
    new-instance v0, Lcom/tonicartos/superslim/LayoutManager$SavedState;

    invoke-direct {v0}, Lcom/tonicartos/superslim/LayoutManager$SavedState;-><init>()V

    .line 600
    .local v0, "state":Lcom/tonicartos/superslim/LayoutManager$SavedState;
    invoke-direct {p0}, Lcom/tonicartos/superslim/LayoutManager;->getAnchorChild()Landroid/view/View;

    move-result-object v1

    .line 601
    .local v1, "view":Landroid/view/View;
    if-nez v1, :cond_0

    .line 602
    iput v2, v0, Lcom/tonicartos/superslim/LayoutManager$SavedState;->anchorPosition:I

    .line 603
    iput v2, v0, Lcom/tonicartos/superslim/LayoutManager$SavedState;->anchorOffset:I

    .line 608
    :goto_0
    return-object v0

    .line 605
    :cond_0
    invoke-virtual {p0, v1}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v2

    iput v2, v0, Lcom/tonicartos/superslim/LayoutManager$SavedState;->anchorPosition:I

    .line 606
    invoke-virtual {p0, v1}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v2

    iput v2, v0, Lcom/tonicartos/superslim/LayoutManager$SavedState;->anchorOffset:I

    goto :goto_0
.end method

.method public scrollToPosition(I)V
    .locals 3
    .param p1, "position"    # I

    .prologue
    .line 393
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getItemCount()I

    move-result v0

    if-gt v0, p1, :cond_1

    .line 394
    :cond_0
    const-string/jumbo v0, "SuperSLiM.LayoutManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Ignored scroll to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " as it is not within the item range 0 - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 395
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getItemCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 394
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 401
    :goto_0
    return-void

    .line 399
    :cond_1
    iput p1, p0, Lcom/tonicartos/superslim/LayoutManager;->mRequestPosition:I

    .line 400
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->requestLayout()V

    goto :goto_0
.end method

.method public scrollVerticallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .locals 19
    .param p1, "dy"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 335
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v13

    .line 336
    .local v13, "numChildren":I
    if-nez v13, :cond_0

    .line 337
    const/4 v3, 0x0

    .line 383
    :goto_0
    return v3

    .line 340
    :cond_0
    new-instance v11, Lcom/tonicartos/superslim/LayoutState;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-direct {v11, v0, v1, v2}, Lcom/tonicartos/superslim/LayoutState;-><init>(Landroid/support/v7/widget/RecyclerView$LayoutManager;Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V

    .line 342
    .local v11, "layoutState":Lcom/tonicartos/superslim/LayoutState;
    if-lez p1, :cond_1

    sget-object v4, Lcom/tonicartos/superslim/LayoutManager$Direction;->END:Lcom/tonicartos/superslim/LayoutManager$Direction;

    .line 343
    .local v4, "direction":Lcom/tonicartos/superslim/LayoutManager$Direction;
    :goto_1
    sget-object v16, Lcom/tonicartos/superslim/LayoutManager$Direction;->END:Lcom/tonicartos/superslim/LayoutManager$Direction;

    move-object/from16 v0, v16

    if-ne v4, v0, :cond_2

    const/4 v10, 0x1

    .line 344
    .local v10, "isDirectionEnd":Z
    :goto_2
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/superslim/LayoutManager;->getHeight()I

    move-result v9

    .line 346
    .local v9, "height":I
    if-eqz v10, :cond_3

    add-int v12, v9, p1

    .line 351
    .local v12, "leadingEdge":I
    :goto_3
    if-eqz v10, :cond_4

    .line 352
    invoke-direct/range {p0 .. p0}, Lcom/tonicartos/superslim/LayoutManager;->getAnchorAtEnd()Landroid/view/View;

    move-result-object v5

    .line 353
    .local v5, "end":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v14

    check-cast v14, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;

    .line 354
    .local v14, "params":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/tonicartos/superslim/LayoutManager;->getSlm(Lcom/tonicartos/superslim/LayoutManager$LayoutParams;)Lcom/tonicartos/superslim/SectionLayoutManager;

    move-result-object v15

    .line 356
    .local v15, "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    invoke-virtual {v14}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;->getTestedFirstPosition()I

    move-result v16

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/superslim/LayoutManager;->getChildCount()I

    move-result v17

    add-int/lit8 v17, v17, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/tonicartos/superslim/LayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v18

    .line 355
    invoke-virtual/range {v15 .. v18}, Lcom/tonicartos/superslim/SectionLayoutManager;->getLowestEdge(III)I

    move-result v6

    .line 357
    .local v6, "endEdge":I
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/superslim/LayoutManager;->getPaddingBottom()I

    move-result v16

    sub-int v16, v9, v16

    move/from16 v0, v16

    if-ge v6, v0, :cond_4

    .line 358
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/tonicartos/superslim/LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v16

    invoke-virtual/range {p3 .. p3}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v17

    add-int/lit8 v17, v17, -0x1

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_4

    .line 359
    const/4 v3, 0x0

    goto :goto_0

    .line 342
    .end local v4    # "direction":Lcom/tonicartos/superslim/LayoutManager$Direction;
    .end local v5    # "end":Landroid/view/View;
    .end local v6    # "endEdge":I
    .end local v9    # "height":I
    .end local v10    # "isDirectionEnd":Z
    .end local v12    # "leadingEdge":I
    .end local v14    # "params":Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
    .end local v15    # "slm":Lcom/tonicartos/superslim/SectionLayoutManager;
    :cond_1
    sget-object v4, Lcom/tonicartos/superslim/LayoutManager$Direction;->START:Lcom/tonicartos/superslim/LayoutManager$Direction;

    goto :goto_1

    .line 343
    .restart local v4    # "direction":Lcom/tonicartos/superslim/LayoutManager$Direction;
    :cond_2
    const/4 v10, 0x0

    goto :goto_2

    .restart local v9    # "height":I
    .restart local v10    # "isDirectionEnd":Z
    :cond_3
    move/from16 v12, p1

    .line 346
    goto :goto_3

    .line 363
    .restart local v12    # "leadingEdge":I
    :cond_4
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v4, v11}, Lcom/tonicartos/superslim/LayoutManager;->fillUntil(ILcom/tonicartos/superslim/LayoutManager$Direction;Lcom/tonicartos/superslim/LayoutState;)I

    move-result v8

    .line 366
    .local v8, "fillEdge":I
    if-eqz v10, :cond_7

    .line 368
    sub-int v16, v8, v9

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/superslim/LayoutManager;->getPaddingBottom()I

    move-result v17

    add-int v7, v16, v17

    .line 369
    .local v7, "fillDelta":I
    move/from16 v0, p1

    if-ge v7, v0, :cond_6

    move v3, v7

    .line 375
    .local v3, "delta":I
    :goto_4
    if-eqz v3, :cond_5

    .line 376
    neg-int v0, v3

    move/from16 v16, v0

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/tonicartos/superslim/LayoutManager;->offsetChildrenVertical(I)V

    .line 378
    if-eqz v10, :cond_9

    sget-object v16, Lcom/tonicartos/superslim/LayoutManager$Direction;->START:Lcom/tonicartos/superslim/LayoutManager$Direction;

    :goto_5
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1, v11}, Lcom/tonicartos/superslim/LayoutManager;->trimTail(Lcom/tonicartos/superslim/LayoutManager$Direction;Lcom/tonicartos/superslim/LayoutState;)V

    .line 381
    :cond_5
    invoke-virtual {v11}, Lcom/tonicartos/superslim/LayoutState;->recycleCache()V

    goto/16 :goto_0

    .end local v3    # "delta":I
    :cond_6
    move/from16 v3, p1

    .line 369
    goto :goto_4

    .line 371
    .end local v7    # "fillDelta":I
    :cond_7
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/superslim/LayoutManager;->getPaddingTop()I

    move-result v16

    sub-int v7, v8, v16

    .line 372
    .restart local v7    # "fillDelta":I
    move/from16 v0, p1

    if-le v7, v0, :cond_8

    move v3, v7

    .restart local v3    # "delta":I
    :goto_6
    goto :goto_4

    .end local v3    # "delta":I
    :cond_8
    move/from16 v3, p1

    goto :goto_6

    .line 378
    .restart local v3    # "delta":I
    :cond_9
    sget-object v16, Lcom/tonicartos/superslim/LayoutManager$Direction;->END:Lcom/tonicartos/superslim/LayoutManager$Direction;

    goto :goto_5
.end method

.method public setSmoothScrollEnabled(Z)V
    .locals 0
    .param p1, "smoothScrollEnabled"    # Z

    .prologue
    .line 249
    iput-boolean p1, p0, Lcom/tonicartos/superslim/LayoutManager;->mSmoothScrollEnabled:Z

    .line 250
    return-void
.end method

.method public smoothScrollToPosition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;I)V
    .locals 3
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "position"    # I

    .prologue
    .line 406
    if-ltz p3, :cond_0

    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getItemCount()I

    move-result v0

    if-gt v0, p3, :cond_1

    .line 407
    :cond_0
    const-string/jumbo v0, "SuperSLiM.LayoutManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Ignored smooth scroll to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " as it is not within the item range 0 - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 408
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->getItemCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 407
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 469
    :goto_0
    return-void

    .line 413
    :cond_1
    invoke-virtual {p0}, Lcom/tonicartos/superslim/LayoutManager;->requestLayout()V

    .line 415
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/tonicartos/superslim/LayoutManager$1;

    invoke-direct {v1, p0, p1, p3}, Lcom/tonicartos/superslim/LayoutManager$1;-><init>(Lcom/tonicartos/superslim/LayoutManager;Landroid/support/v7/widget/RecyclerView;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method
