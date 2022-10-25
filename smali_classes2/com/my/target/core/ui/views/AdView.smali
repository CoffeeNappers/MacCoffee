.class public Lcom/my/target/core/ui/views/AdView;
.super Landroid/widget/RelativeLayout;
.source "AdView.java"


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 47
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 24
    iput v0, p0, Lcom/my/target/core/ui/views/AdView;->a:I

    .line 25
    iput v0, p0, Lcom/my/target/core/ui/views/AdView;->b:I

    .line 26
    iput v0, p0, Lcom/my/target/core/ui/views/AdView;->c:I

    .line 27
    const/4 v0, 0x0

    iput v0, p0, Lcom/my/target/core/ui/views/AdView;->d:F

    .line 48
    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .locals 7

    .prologue
    const/high16 v5, 0x40000000    # 2.0f

    .line 69
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    .line 70
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 71
    iget v0, p0, Lcom/my/target/core/ui/views/AdView;->d:F

    const/4 v2, 0x0

    cmpl-float v0, v0, v2

    if-lez v0, :cond_2

    if-lez v3, :cond_2

    if-lez v1, :cond_2

    .line 74
    int-to-float v0, v3

    int-to-float v2, v1

    div-float v4, v0, v2

    .line 75
    iget v2, p0, Lcom/my/target/core/ui/views/AdView;->a:I

    .line 76
    iget v0, p0, Lcom/my/target/core/ui/views/AdView;->c:I

    .line 77
    if-gt v2, v3, :cond_0

    if-le v0, v1, :cond_5

    .line 79
    :cond_0
    iget v0, p0, Lcom/my/target/core/ui/views/AdView;->d:F

    cmpl-float v0, v4, v0

    if-lez v0, :cond_1

    .line 81
    int-to-float v0, v1

    iget v2, p0, Lcom/my/target/core/ui/views/AdView;->d:F

    mul-float/2addr v0, v2

    float-to-int v0, v0

    move v6, v1

    move v1, v0

    move v0, v6

    .line 94
    :goto_0
    invoke-static {v1, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    invoke-static {v0, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-super {p0, v1, v0}, Landroid/widget/RelativeLayout;->onMeasure(II)V

    .line 103
    :goto_1
    return-void

    .line 87
    :cond_1
    int-to-float v0, v3

    iget v1, p0, Lcom/my/target/core/ui/views/AdView;->d:F

    div-float/2addr v0, v1

    float-to-int v0, v0

    move v1, v3

    goto :goto_0

    .line 96
    :cond_2
    if-lez v3, :cond_4

    if-lez v1, :cond_4

    .line 99
    iget v0, p0, Lcom/my/target/core/ui/views/AdView;->b:I

    if-lez v0, :cond_3

    iget v0, p0, Lcom/my/target/core/ui/views/AdView;->b:I

    if-le v3, v0, :cond_3

    iget v3, p0, Lcom/my/target/core/ui/views/AdView;->b:I

    .line 100
    :cond_3
    invoke-static {v3, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-static {v1, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    invoke-super {p0, v0, v1}, Landroid/widget/RelativeLayout;->onMeasure(II)V

    goto :goto_1

    .line 102
    :cond_4
    invoke-super {p0, p1, p2}, Landroid/widget/RelativeLayout;->onMeasure(II)V

    goto :goto_1

    :cond_5
    move v1, v2

    goto :goto_0
.end method

.method public setDesiredSize(II)V
    .locals 2

    .prologue
    .line 55
    iput p1, p0, Lcom/my/target/core/ui/views/AdView;->a:I

    .line 56
    iput p2, p0, Lcom/my/target/core/ui/views/AdView;->c:I

    .line 57
    if-lez p1, :cond_0

    if-lez p2, :cond_0

    int-to-float v0, p1

    int-to-float v1, p2

    div-float/2addr v0, v1

    iput v0, p0, Lcom/my/target/core/ui/views/AdView;->d:F

    .line 59
    :goto_0
    return-void

    .line 58
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/my/target/core/ui/views/AdView;->d:F

    goto :goto_0
.end method

.method public setMaxWidth(I)V
    .locals 0

    .prologue
    .line 63
    iput p1, p0, Lcom/my/target/core/ui/views/AdView;->b:I

    .line 64
    return-void
.end method
