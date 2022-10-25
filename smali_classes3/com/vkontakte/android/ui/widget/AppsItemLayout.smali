.class public Lcom/vkontakte/android/ui/widget/AppsItemLayout;
.super Landroid/view/ViewGroup;
.source "AppsItemLayout.java"


# instance fields
.field private bubble:Landroid/view/View;

.field private icon:Landroid/view/View;

.field private iconInstant:Landroid/view/View;

.field private subtitle:Landroid/view/View;

.field private title:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 29
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 34
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 35
    return-void
.end method

.method protected static layoutChild(Landroid/view/View;II)V
    .locals 2
    .param p0, "v"    # Landroid/view/View;
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 61
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    add-int/2addr v0, p1

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    add-int/2addr v1, p2

    invoke-virtual {p0, p1, p2, v0, v1}, Landroid/view/View;->layout(IIII)V

    .line 62
    return-void
.end method


# virtual methods
.method protected onFinishInflate()V
    .locals 1

    .prologue
    .line 39
    invoke-super {p0}, Landroid/view/ViewGroup;->onFinishInflate()V

    .line 40
    const v0, 0x7f100007

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->icon:Landroid/view/View;

    .line 41
    const v0, 0x7f10000a

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->title:Landroid/view/View;

    .line 42
    const v0, 0x7f100009

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->subtitle:Landroid/view/View;

    .line 43
    const v0, 0x7f100006

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->bubble:Landroid/view/View;

    .line 44
    const v0, 0x7f1001b3

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->iconInstant:Landroid/view/View;

    .line 45
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 6
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    const/high16 v5, 0x40c00000    # 6.0f

    .line 49
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->icon:Landroid/view/View;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->getPaddingLeft()I

    move-result v3

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->getPaddingTop()I

    move-result v4

    invoke-static {v2, v3, v4}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->layoutChild(Landroid/view/View;II)V

    .line 50
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->iconInstant:Landroid/view/View;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->getPaddingLeft()I

    move-result v3

    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->getPaddingTop()I

    move-result v4

    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v5

    sub-int/2addr v4, v5

    invoke-static {v2, v3, v4}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->layoutChild(Landroid/view/View;II)V

    .line 51
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->title:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->bubble:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 52
    .local v1, "heightTopBlock":I
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->icon:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    sub-int/2addr v2, v1

    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->subtitle:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    sub-int/2addr v2, v3

    div-int/lit8 v0, v2, 0x2

    .line 53
    .local v0, "dy":I
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->title:Landroid/view/View;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->getPaddingLeft()I

    move-result v3

    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->icon:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    add-int/2addr v3, v4

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->getPaddingTop()I

    move-result v4

    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->title:Landroid/view/View;

    .line 54
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    sub-int v5, v1, v5

    div-int/lit8 v5, v5, 0x2

    add-int/2addr v4, v5

    add-int/2addr v4, v0

    .line 53
    invoke-static {v2, v3, v4}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->layoutChild(Landroid/view/View;II)V

    .line 55
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->bubble:Landroid/view/View;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->getPaddingLeft()I

    move-result v3

    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->icon:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    add-int/2addr v3, v4

    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->title:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    add-int/2addr v3, v4

    .line 56
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->getPaddingTop()I

    move-result v4

    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->bubble:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    sub-int v5, v1, v5

    div-int/lit8 v5, v5, 0x2

    add-int/2addr v4, v5

    add-int/2addr v4, v0

    .line 55
    invoke-static {v2, v3, v4}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->layoutChild(Landroid/view/View;II)V

    .line 57
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->subtitle:Landroid/view/View;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->getPaddingLeft()I

    move-result v3

    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->icon:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    add-int/2addr v3, v4

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->getPaddingTop()I

    move-result v4

    add-int/2addr v4, v1

    add-int/2addr v4, v0

    invoke-static {v2, v3, v4}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->layoutChild(Landroid/view/View;II)V

    .line 58
    return-void
.end method

.method protected onMeasure(II)V
    .locals 7
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 66
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->icon:Landroid/view/View;

    invoke-virtual {p0, v4, p1, p2}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->measureChild(Landroid/view/View;II)V

    .line 67
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->iconInstant:Landroid/view/View;

    invoke-virtual {p0, v4, p1, p2}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->measureChild(Landroid/view/View;II)V

    .line 68
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->bubble:Landroid/view/View;

    invoke-virtual {p0, v4, p1, p2}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->measureChild(Landroid/view/View;II)V

    .line 70
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 71
    .local v2, "width":I
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->icon:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->getPaddingTop()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->getPaddingBottom()I

    move-result v5

    add-int v1, v4, v5

    .line 73
    .local v1, "height":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->getPaddingLeft()I

    move-result v4

    sub-int v4, v2, v4

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->getPaddingRight()I

    move-result v5

    sub-int/2addr v4, v5

    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->icon:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    sub-int v3, v4, v5

    .line 75
    .local v3, "widthText":I
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->bubble:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-ne v4, v5, :cond_0

    const/4 v0, 0x0

    .line 76
    .local v0, "bubbleWidth":I
    :goto_0
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->title:Landroid/view/View;

    sub-int v5, v3, v0

    const/high16 v6, -0x80000000

    invoke-static {v5, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    iget-object v6, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->title:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    iget v6, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v4, v5, v6}, Landroid/view/View;->measure(II)V

    .line 77
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->subtitle:Landroid/view/View;

    const/high16 v5, 0x40000000    # 2.0f

    invoke-static {v3, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    iget-object v6, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->subtitle:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    iget v6, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v4, v5, v6}, Landroid/view/View;->measure(II)V

    .line 79
    invoke-virtual {p0, v2, v1}, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->setMeasuredDimension(II)V

    .line 80
    return-void

    .line 75
    .end local v0    # "bubbleWidth":I
    :cond_0
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/AppsItemLayout;->bubble:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    goto :goto_0
.end method
