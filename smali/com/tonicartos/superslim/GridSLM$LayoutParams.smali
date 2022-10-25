.class public Lcom/tonicartos/superslim/GridSLM$LayoutParams;
.super Lcom/tonicartos/superslim/LayoutManager$LayoutParams;
.source "GridSLM.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tonicartos/superslim/GridSLM;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutParams"
.end annotation


# instance fields
.field private mColumnWidth:I

.field private mNumColumns:I


# direct methods
.method public constructor <init>(II)V
    .locals 0
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 488
    invoke-direct {p0, p1, p2}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;-><init>(II)V

    .line 489
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, -0x1

    .line 492
    invoke-direct {p0, p1, p2}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 494
    sget-object v1, Lcom/vkontakte/android/R$styleable;->superslim_GridSLM:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 495
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v1, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->mNumColumns:I

    .line 496
    const/4 v1, 0x0

    .line 497
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->mColumnWidth:I

    .line 498
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 499
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$LayoutParams;)V
    .locals 0
    .param p1, "other"    # Landroid/view/ViewGroup$LayoutParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 526
    invoke-direct {p0, p1}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 527
    invoke-direct {p0, p1}, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->init(Landroid/view/ViewGroup$LayoutParams;)V

    .line 528
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$MarginLayoutParams;)V
    .locals 0
    .param p1, "other"    # Landroid/view/ViewGroup$MarginLayoutParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 511
    invoke-direct {p0, p1}, Lcom/tonicartos/superslim/LayoutManager$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 512
    invoke-direct {p0, p1}, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->init(Landroid/view/ViewGroup$LayoutParams;)V

    .line 513
    return-void
.end method

.method public static from(Landroid/view/ViewGroup$LayoutParams;)Lcom/tonicartos/superslim/GridSLM$LayoutParams;
    .locals 3
    .param p0, "other"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    const/4 v2, -0x2

    .line 537
    if-nez p0, :cond_0

    .line 538
    const-string/jumbo v0, "SuperSLiM"

    const-string/jumbo v1, "Null value passed in call to GridSLM.LayoutParams.from()."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 539
    new-instance v0, Lcom/tonicartos/superslim/GridSLM$LayoutParams;

    invoke-direct {v0, v2, v2}, Lcom/tonicartos/superslim/GridSLM$LayoutParams;-><init>(II)V

    .line 543
    :goto_0
    return-object v0

    .line 540
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_1

    .line 541
    new-instance v0, Lcom/tonicartos/superslim/GridSLM$LayoutParams;

    check-cast p0, Landroid/view/ViewGroup$MarginLayoutParams;

    .end local p0    # "other":Landroid/view/ViewGroup$LayoutParams;
    invoke-direct {v0, p0}, Lcom/tonicartos/superslim/GridSLM$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    goto :goto_0

    .line 543
    .restart local p0    # "other":Landroid/view/ViewGroup$LayoutParams;
    :cond_1
    new-instance v0, Lcom/tonicartos/superslim/GridSLM$LayoutParams;

    invoke-direct {v0, p0}, Lcom/tonicartos/superslim/GridSLM$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0
.end method

.method private init(Landroid/view/ViewGroup$LayoutParams;)V
    .locals 3
    .param p1, "other"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    const/4 v2, -0x1

    .line 564
    instance-of v1, p1, Lcom/tonicartos/superslim/GridSLM$LayoutParams;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 565
    check-cast v0, Lcom/tonicartos/superslim/GridSLM$LayoutParams;

    .line 566
    .local v0, "lp":Lcom/tonicartos/superslim/GridSLM$LayoutParams;
    iget v1, v0, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->mNumColumns:I

    iput v1, p0, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->mNumColumns:I

    .line 567
    iget v1, v0, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->mColumnWidth:I

    iput v1, p0, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->mColumnWidth:I

    .line 572
    .end local v0    # "lp":Lcom/tonicartos/superslim/GridSLM$LayoutParams;
    :goto_0
    return-void

    .line 569
    :cond_0
    iput v2, p0, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->mNumColumns:I

    .line 570
    iput v2, p0, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->mColumnWidth:I

    goto :goto_0
.end method


# virtual methods
.method public getColumnWidth()I
    .locals 1

    .prologue
    .line 548
    iget v0, p0, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->mColumnWidth:I

    return v0
.end method

.method public getNumColumns()I
    .locals 1

    .prologue
    .line 556
    iget v0, p0, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->mNumColumns:I

    return v0
.end method

.method public setColumnWidth(I)V
    .locals 0
    .param p1, "columnWidth"    # I

    .prologue
    .line 552
    iput p1, p0, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->mColumnWidth:I

    .line 553
    return-void
.end method

.method public setNumColumns(I)V
    .locals 0
    .param p1, "numColumns"    # I

    .prologue
    .line 560
    iput p1, p0, Lcom/tonicartos/superslim/GridSLM$LayoutParams;->mNumColumns:I

    .line 561
    return-void
.end method
