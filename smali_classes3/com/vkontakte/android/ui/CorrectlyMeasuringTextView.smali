.class public Lcom/vkontakte/android/ui/CorrectlyMeasuringTextView;
.super Lcom/vkontakte/android/ui/LinkedTextView;
.source "CorrectlyMeasuringTextView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/LinkedTextView;-><init>(Landroid/content/Context;)V

    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 17
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/ui/LinkedTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 21
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/ui/LinkedTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 22
    return-void
.end method

.method private getMaxLineWidth(Landroid/text/Layout;)F
    .locals 5
    .param p1, "layout"    # Landroid/text/Layout;

    .prologue
    .line 38
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CorrectlyMeasuringTextView;->getMinWidth()I

    move-result v3

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CorrectlyMeasuringTextView;->getPaddingLeft()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CorrectlyMeasuringTextView;->getPaddingRight()I

    move-result v4

    sub-int/2addr v3, v4

    int-to-float v2, v3

    .line 39
    .local v2, "max_width":F
    invoke-virtual {p1}, Landroid/text/Layout;->getLineCount()I

    move-result v1

    .line 40
    .local v1, "lines":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 41
    invoke-virtual {p1, v0}, Landroid/text/Layout;->getLineWidth(I)F

    move-result v3

    cmpl-float v3, v3, v2

    if-lez v3, :cond_0

    .line 42
    invoke-virtual {p1, v0}, Landroid/text/Layout;->getLineWidth(I)F

    move-result v2

    .line 40
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 45
    :cond_1
    return v2
.end method


# virtual methods
.method protected onMeasure(II)V
    .locals 6
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 26
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/ui/LinkedTextView;->onMeasure(II)V

    .line 28
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CorrectlyMeasuringTextView;->getLayout()Landroid/text/Layout;

    move-result-object v1

    .line 29
    .local v1, "layout":Landroid/text/Layout;
    if-eqz v1, :cond_0

    .line 30
    invoke-direct {p0, v1}, Lcom/vkontakte/android/ui/CorrectlyMeasuringTextView;->getMaxLineWidth(Landroid/text/Layout;)F

    move-result v3

    float-to-double v4, v3

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v3, v4

    .line 31
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CorrectlyMeasuringTextView;->getCompoundPaddingLeft()I

    move-result v4

    add-int/2addr v3, v4

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CorrectlyMeasuringTextView;->getCompoundPaddingRight()I

    move-result v4

    add-int v2, v3, v4

    .line 32
    .local v2, "width":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/CorrectlyMeasuringTextView;->getMeasuredHeight()I

    move-result v0

    .line 33
    .local v0, "height":I
    invoke-virtual {p0, v2, v0}, Lcom/vkontakte/android/ui/CorrectlyMeasuringTextView;->setMeasuredDimension(II)V

    .line 35
    .end local v0    # "height":I
    .end local v2    # "width":I
    :cond_0
    return-void
.end method
