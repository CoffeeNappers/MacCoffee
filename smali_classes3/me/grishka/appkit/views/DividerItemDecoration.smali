.class public Lme/grishka/appkit/views/DividerItemDecoration;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "DividerItemDecoration.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lme/grishka/appkit/views/DividerItemDecoration$Provider;
    }
.end annotation


# instance fields
.field private bottom:Landroid/graphics/drawable/Drawable;

.field private bottomHeight:I

.field private divider:Landroid/graphics/drawable/Drawable;

.field private height:I

.field private paddingBottom:I

.field private paddingLeft:I

.field private paddingRight:I

.field private paddingTop:I

.field private provider:Lme/grishka/appkit/views/DividerItemDecoration$Provider;

.field private top:Landroid/graphics/drawable/Drawable;

.field private topHeight:I

.field private useDecoratedVBounds:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "drawable"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    const/4 v0, 0x0

    .line 25
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 21
    iput v0, p0, Lme/grishka/appkit/views/DividerItemDecoration;->paddingLeft:I

    iput v0, p0, Lme/grishka/appkit/views/DividerItemDecoration;->paddingTop:I

    iput v0, p0, Lme/grishka/appkit/views/DividerItemDecoration;->paddingRight:I

    iput v0, p0, Lme/grishka/appkit/views/DividerItemDecoration;->paddingBottom:I

    .line 26
    invoke-static {p1, p2}, Lcom/vkontakte/android/ViewUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lme/grishka/appkit/views/DividerItemDecoration;->divider:Landroid/graphics/drawable/Drawable;

    .line 27
    iget-object v0, p0, Lme/grishka/appkit/views/DividerItemDecoration;->divider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    iput v0, p0, Lme/grishka/appkit/views/DividerItemDecoration;->height:I

    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 31
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    invoke-direct {p0, p1, v0}, Lme/grishka/appkit/views/DividerItemDecoration;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/graphics/drawable/Drawable;I)V
    .locals 1
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "height"    # I

    .prologue
    const/4 v0, 0x0

    .line 34
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 21
    iput v0, p0, Lme/grishka/appkit/views/DividerItemDecoration;->paddingLeft:I

    iput v0, p0, Lme/grishka/appkit/views/DividerItemDecoration;->paddingTop:I

    iput v0, p0, Lme/grishka/appkit/views/DividerItemDecoration;->paddingRight:I

    iput v0, p0, Lme/grishka/appkit/views/DividerItemDecoration;->paddingBottom:I

    .line 35
    iput-object p1, p0, Lme/grishka/appkit/views/DividerItemDecoration;->divider:Landroid/graphics/drawable/Drawable;

    .line 36
    iput p2, p0, Lme/grishka/appkit/views/DividerItemDecoration;->height:I

    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/graphics/drawable/Drawable;ILandroid/graphics/drawable/Drawable;ILandroid/graphics/drawable/Drawable;I)V
    .locals 0
    .param p1, "divider"    # Landroid/graphics/drawable/Drawable;
    .param p2, "dividerHeight"    # I
    .param p3, "top"    # Landroid/graphics/drawable/Drawable;
    .param p4, "topHeight"    # I
    .param p5, "bottom"    # Landroid/graphics/drawable/Drawable;
    .param p6, "bottomHeight"    # I

    .prologue
    .line 44
    invoke-direct {p0, p1, p2}, Lme/grishka/appkit/views/DividerItemDecoration;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 45
    iput-object p3, p0, Lme/grishka/appkit/views/DividerItemDecoration;->top:Landroid/graphics/drawable/Drawable;

    .line 46
    iput p4, p0, Lme/grishka/appkit/views/DividerItemDecoration;->topHeight:I

    .line 47
    iput-object p5, p0, Lme/grishka/appkit/views/DividerItemDecoration;->bottom:Landroid/graphics/drawable/Drawable;

    .line 48
    iput p6, p0, Lme/grishka/appkit/views/DividerItemDecoration;->bottomHeight:I

    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .locals 7
    .param p1, "divider"    # Landroid/graphics/drawable/Drawable;
    .param p2, "top"    # Landroid/graphics/drawable/Drawable;
    .param p3, "bottom"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 40
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v6

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v6}, Lme/grishka/appkit/views/DividerItemDecoration;-><init>(Landroid/graphics/drawable/Drawable;ILandroid/graphics/drawable/Drawable;ILandroid/graphics/drawable/Drawable;I)V

    .line 41
    return-void
.end method

.method private getItemBottom(Landroid/view/View;Landroid/support/v7/widget/RecyclerView;)I
    .locals 2
    .param p1, "item"    # Landroid/view/View;
    .param p2, "parent"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 85
    iget-boolean v0, p0, Lme/grishka/appkit/views/DividerItemDecoration;->useDecoratedVBounds:Z

    if-eqz v0, :cond_0

    .line 86
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v0

    .line 87
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result v0

    iget v1, p0, Lme/grishka/appkit/views/DividerItemDecoration;->height:I

    add-int/2addr v0, v1

    goto :goto_0
.end method

.method private getItemTop(Landroid/view/View;Landroid/support/v7/widget/RecyclerView;)I
    .locals 1
    .param p1, "item"    # Landroid/view/View;
    .param p2, "parent"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 91
    iget-boolean v0, p0, Lme/grishka/appkit/views/DividerItemDecoration;->useDecoratedVBounds:Z

    if-eqz v0, :cond_0

    .line 92
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v0

    .line 93
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v0

    goto :goto_0
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 3
    .param p1, "outRect"    # Landroid/graphics/Rect;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p4, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v1, 0x0

    .line 58
    invoke-virtual {p1, v1, v1, v1, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 59
    invoke-virtual {p3, p2}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v0

    .line 60
    .local v0, "pos":I
    if-nez v0, :cond_0

    .line 61
    iget v1, p1, Landroid/graphics/Rect;->top:I

    iget v2, p0, Lme/grishka/appkit/views/DividerItemDecoration;->topHeight:I

    add-int/2addr v1, v2

    iput v1, p1, Landroid/graphics/Rect;->top:I

    .line 64
    :cond_0
    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_2

    .line 65
    iget v1, p0, Lme/grishka/appkit/views/DividerItemDecoration;->bottomHeight:I

    if-lez v1, :cond_1

    .line 66
    iget v1, p1, Landroid/graphics/Rect;->bottom:I

    iget v2, p0, Lme/grishka/appkit/views/DividerItemDecoration;->bottomHeight:I

    add-int/2addr v1, v2

    iput v1, p1, Landroid/graphics/Rect;->bottom:I

    .line 70
    :cond_1
    :goto_0
    return-void

    .line 67
    :cond_2
    iget-object v1, p0, Lme/grishka/appkit/views/DividerItemDecoration;->provider:Lme/grishka/appkit/views/DividerItemDecoration$Provider;

    if-eqz v1, :cond_3

    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lme/grishka/appkit/views/DividerItemDecoration;->provider:Lme/grishka/appkit/views/DividerItemDecoration$Provider;

    invoke-interface {v1, v0}, Lme/grishka/appkit/views/DividerItemDecoration$Provider;->needDrawDividerAfter(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 68
    :cond_3
    iget v1, p1, Landroid/graphics/Rect;->bottom:I

    iget v2, p0, Lme/grishka/appkit/views/DividerItemDecoration;->height:I

    add-int/2addr v1, v2

    iput v1, p1, Landroid/graphics/Rect;->bottom:I

    goto :goto_0
.end method

.method public isUseDecoratedVBounds()Z
    .locals 1

    .prologue
    .line 73
    iget-boolean v0, p0, Lme/grishka/appkit/views/DividerItemDecoration;->useDecoratedVBounds:Z

    return v0
.end method

.method public onDrawOver(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 10
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 98
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v2

    .line 99
    .local v2, "lm":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v4

    if-ge v0, v4, :cond_4

    .line 100
    invoke-virtual {v2, v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 101
    .local v1, "item":Landroid/view/View;
    invoke-virtual {v2, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v3

    .line 102
    .local v3, "pos":I
    if-nez v3, :cond_0

    iget-object v4, p0, Lme/grishka/appkit/views/DividerItemDecoration;->top:Landroid/graphics/drawable/Drawable;

    if-eqz v4, :cond_0

    .line 103
    iget-object v4, p0, Lme/grishka/appkit/views/DividerItemDecoration;->top:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v5

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v6

    iget v7, p0, Lme/grishka/appkit/views/DividerItemDecoration;->topHeight:I

    sub-int/2addr v6, v7

    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    move-result v7

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v8

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 104
    iget-object v4, p0, Lme/grishka/appkit/views/DividerItemDecoration;->top:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 106
    :cond_0
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ne v3, v4, :cond_2

    .line 107
    iget-object v4, p0, Lme/grishka/appkit/views/DividerItemDecoration;->bottom:Landroid/graphics/drawable/Drawable;

    if-eqz v4, :cond_1

    .line 108
    iget-object v4, p0, Lme/grishka/appkit/views/DividerItemDecoration;->bottom:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v5

    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v6

    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    move-result v7

    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v8

    iget v9, p0, Lme/grishka/appkit/views/DividerItemDecoration;->bottomHeight:I

    add-int/2addr v8, v9

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 109
    iget-object v4, p0, Lme/grishka/appkit/views/DividerItemDecoration;->bottom:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 99
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 111
    :cond_2
    iget-object v4, p0, Lme/grishka/appkit/views/DividerItemDecoration;->provider:Lme/grishka/appkit/views/DividerItemDecoration$Provider;

    if-eqz v4, :cond_3

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v4

    if-ge v3, v4, :cond_1

    iget-object v4, p0, Lme/grishka/appkit/views/DividerItemDecoration;->provider:Lme/grishka/appkit/views/DividerItemDecoration$Provider;

    invoke-interface {v4, v3}, Lme/grishka/appkit/views/DividerItemDecoration$Provider;->needDrawDividerAfter(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 112
    :cond_3
    iget-object v4, p0, Lme/grishka/appkit/views/DividerItemDecoration;->divider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v5

    invoke-direct {p0, v1, p2}, Lme/grishka/appkit/views/DividerItemDecoration;->getItemBottom(Landroid/view/View;Landroid/support/v7/widget/RecyclerView;)I

    move-result v6

    iget v7, p0, Lme/grishka/appkit/views/DividerItemDecoration;->height:I

    sub-int/2addr v6, v7

    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    move-result v7

    invoke-direct {p0, v1, p2}, Lme/grishka/appkit/views/DividerItemDecoration;->getItemBottom(Landroid/view/View;Landroid/support/v7/widget/RecyclerView;)I

    move-result v8

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 113
    iget-object v4, p0, Lme/grishka/appkit/views/DividerItemDecoration;->divider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_1

    .line 116
    .end local v1    # "item":Landroid/view/View;
    .end local v3    # "pos":I
    :cond_4
    return-void
.end method

.method public setProvider(Lme/grishka/appkit/views/DividerItemDecoration$Provider;)Lme/grishka/appkit/views/DividerItemDecoration;
    .locals 0
    .param p1, "p"    # Lme/grishka/appkit/views/DividerItemDecoration$Provider;

    .prologue
    .line 52
    iput-object p1, p0, Lme/grishka/appkit/views/DividerItemDecoration;->provider:Lme/grishka/appkit/views/DividerItemDecoration$Provider;

    .line 53
    return-object p0
.end method

.method public setUseDecoratedVBounds(Z)V
    .locals 0
    .param p1, "useDecoratedVBounds"    # Z

    .prologue
    .line 81
    iput-boolean p1, p0, Lme/grishka/appkit/views/DividerItemDecoration;->useDecoratedVBounds:Z

    .line 82
    return-void
.end method
