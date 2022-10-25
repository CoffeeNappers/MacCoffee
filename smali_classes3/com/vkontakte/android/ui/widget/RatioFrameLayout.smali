.class public Lcom/vkontakte/android/ui/widget/RatioFrameLayout;
.super Landroid/widget/FrameLayout;
.source "RatioFrameLayout.java"


# static fields
.field public static final HORIZONTAL:I = 0x0

.field public static final VERTICAL:I = 0x1


# instance fields
.field private imageRatio:F

.field private orientation:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 16
    const/4 v0, 0x1

    iput v0, p0, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->orientation:I

    .line 17
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->imageRatio:F

    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    const/4 v0, 0x1

    iput v0, p0, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->orientation:I

    .line 17
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->imageRatio:F

    .line 25
    invoke-direct {p0, p2}, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->init(Landroid/util/AttributeSet;)V

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 29
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 16
    const/4 v0, 0x1

    iput v0, p0, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->orientation:I

    .line 17
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->imageRatio:F

    .line 30
    invoke-direct {p0, p2}, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->init(Landroid/util/AttributeSet;)V

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 16
    const/4 v0, 0x1

    iput v0, p0, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->orientation:I

    .line 17
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->imageRatio:F

    .line 36
    invoke-direct {p0, p2}, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->init(Landroid/util/AttributeSet;)V

    .line 37
    return-void
.end method

.method private init(Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 40
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/vkontakte/android/R$styleable;->RatioImageView:[I

    invoke-virtual {v1, p1, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 41
    .local v0, "a":Landroid/content/res/TypedArray;
    if-eqz v0, :cond_0

    .line 42
    const/4 v1, 0x1

    iget v2, p0, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->imageRatio:F

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->imageRatio:F

    .line 43
    const/4 v1, 0x0

    iget v2, p0, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->orientation:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->orientation:I

    .line 44
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 46
    :cond_0
    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .locals 5
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/high16 v4, 0x40000000    # 2.0f

    .line 66
    iget v2, p0, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->imageRatio:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-eqz v2, :cond_0

    .line 67
    iget v2, p0, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->orientation:I

    packed-switch v2, :pswitch_data_0

    .line 78
    :cond_0
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 79
    return-void

    .line 69
    :pswitch_0
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 70
    .local v0, "h":I
    int-to-float v2, v0

    iget v3, p0, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->imageRatio:F

    mul-float/2addr v2, v3

    float-to-int v2, v2

    invoke-static {v2, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    .line 71
    goto :goto_0

    .line 73
    .end local v0    # "h":I
    :pswitch_1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 74
    .local v1, "w":I
    int-to-float v2, v1

    iget v3, p0, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->imageRatio:F

    mul-float/2addr v2, v3

    float-to-int v2, v2

    invoke-static {v2, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    goto :goto_0

    .line 67
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setImageRatio(F)V
    .locals 1
    .param p1, "imageRatio"    # F

    .prologue
    .line 49
    iget v0, p0, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->imageRatio:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 50
    iput p1, p0, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->imageRatio:F

    .line 51
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->requestLayout()V

    .line 53
    :cond_0
    return-void
.end method

.method public setOrientation(I)V
    .locals 0
    .param p1, "orientation"    # I

    .prologue
    .line 56
    packed-switch p1, :pswitch_data_0

    .line 62
    :goto_0
    return-void

    .line 59
    :pswitch_0
    iput p1, p0, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->orientation:I

    .line 60
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/RatioFrameLayout;->requestLayout()V

    goto :goto_0

    .line 56
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
