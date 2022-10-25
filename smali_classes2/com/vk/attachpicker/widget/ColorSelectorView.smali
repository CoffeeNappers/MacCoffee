.class public Lcom/vk/attachpicker/widget/ColorSelectorView;
.super Landroid/support/v4/view/ViewPager;
.source "ColorSelectorView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/attachpicker/widget/ColorSelectorView$OnColorSelectedListener;,
        Lcom/vk/attachpicker/widget/ColorSelectorView$PagerAdapter;,
        Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;
    }
.end annotation


# static fields
.field private static final COLORS_PER_PAGE:I = 0x8

.field private static final MAX_WIDTH:I


# instance fields
.field private innerMarginLeft:I

.field private innerMarginRight:I

.field private onColorSelectedListener:Lcom/vk/attachpicker/widget/ColorSelectorView$OnColorSelectedListener;

.field private selectedColor:I

.field private whiteBorder:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    invoke-static {}, Lcom/vk/core/util/Screen;->realWidth()I

    move-result v0

    sput v0, Lcom/vk/attachpicker/widget/ColorSelectorView;->MAX_WIDTH:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 34
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vk/attachpicker/widget/ColorSelectorView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 38
    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    sget-object v1, Lcom/vk/attachpicker/drawing/DrawingColors;->COLORS:[I

    aget v1, v1, v2

    iput v1, p0, Lcom/vk/attachpicker/widget/ColorSelectorView;->selectedColor:I

    .line 40
    sget-object v1, Lcom/vkontakte/android/R$styleable;->ColorSelectorView:[I

    invoke-virtual {p1, p2, v1, v2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 41
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/vk/attachpicker/widget/ColorSelectorView;->whiteBorder:Z

    .line 42
    invoke-virtual {v0, v3, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/vk/attachpicker/widget/ColorSelectorView;->innerMarginLeft:I

    .line 43
    const/4 v1, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/vk/attachpicker/widget/ColorSelectorView;->innerMarginRight:I

    .line 44
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 46
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/ColorSelectorView;->init()V

    .line 47
    return-void
.end method

.method static synthetic access$100(Lcom/vk/attachpicker/widget/ColorSelectorView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/ColorSelectorView;

    .prologue
    .line 21
    iget v0, p0, Lcom/vk/attachpicker/widget/ColorSelectorView;->innerMarginLeft:I

    return v0
.end method

.method static synthetic access$200(Lcom/vk/attachpicker/widget/ColorSelectorView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/ColorSelectorView;

    .prologue
    .line 21
    iget v0, p0, Lcom/vk/attachpicker/widget/ColorSelectorView;->innerMarginRight:I

    return v0
.end method

.method static synthetic access$300(Lcom/vk/attachpicker/widget/ColorSelectorView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/ColorSelectorView;

    .prologue
    .line 21
    iget-boolean v0, p0, Lcom/vk/attachpicker/widget/ColorSelectorView;->whiteBorder:Z

    return v0
.end method

.method static synthetic access$400(Lcom/vk/attachpicker/widget/ColorSelectorView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/ColorSelectorView;

    .prologue
    .line 21
    iget v0, p0, Lcom/vk/attachpicker/widget/ColorSelectorView;->selectedColor:I

    return v0
.end method

.method static synthetic access$402(Lcom/vk/attachpicker/widget/ColorSelectorView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/ColorSelectorView;
    .param p1, "x1"    # I

    .prologue
    .line 21
    iput p1, p0, Lcom/vk/attachpicker/widget/ColorSelectorView;->selectedColor:I

    return p1
.end method

.method static synthetic access$500(Lcom/vk/attachpicker/widget/ColorSelectorView;)Lcom/vk/attachpicker/widget/ColorSelectorView$OnColorSelectedListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/widget/ColorSelectorView;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/vk/attachpicker/widget/ColorSelectorView;->onColorSelectedListener:Lcom/vk/attachpicker/widget/ColorSelectorView$OnColorSelectedListener;

    return-object v0
.end method

.method private init()V
    .locals 2

    .prologue
    .line 59
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/widget/ColorSelectorView;->setOffscreenPageLimit(I)V

    .line 60
    new-instance v0, Lcom/vk/attachpicker/widget/ColorSelectorView$PagerAdapter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vk/attachpicker/widget/ColorSelectorView$PagerAdapter;-><init>(Lcom/vk/attachpicker/widget/ColorSelectorView;Lcom/vk/attachpicker/widget/ColorSelectorView$1;)V

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/widget/ColorSelectorView;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 61
    return-void
.end method


# virtual methods
.method public getOnColorSelectedListener()Lcom/vk/attachpicker/widget/ColorSelectorView$OnColorSelectedListener;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/vk/attachpicker/widget/ColorSelectorView;->onColorSelectedListener:Lcom/vk/attachpicker/widget/ColorSelectorView$OnColorSelectedListener;

    return-object v0
.end method

.method public getSelectedColor()I
    .locals 1

    .prologue
    .line 83
    iget v0, p0, Lcom/vk/attachpicker/widget/ColorSelectorView;->selectedColor:I

    return v0
.end method

.method protected onMeasure(II)V
    .locals 2
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 51
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    sget v1, Lcom/vk/attachpicker/widget/ColorSelectorView;->MAX_WIDTH:I

    if-le v0, v1, :cond_0

    .line 52
    sget v0, Lcom/vk/attachpicker/widget/ColorSelectorView;->MAX_WIDTH:I

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-super {p0, v0, p2}, Landroid/support/v4/view/ViewPager;->onMeasure(II)V

    .line 56
    :goto_0
    return-void

    .line 54
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/support/v4/view/ViewPager;->onMeasure(II)V

    goto :goto_0
.end method

.method public setOnColorSelectedListener(Lcom/vk/attachpicker/widget/ColorSelectorView$OnColorSelectedListener;)V
    .locals 0
    .param p1, "onColorSelectedListener"    # Lcom/vk/attachpicker/widget/ColorSelectorView$OnColorSelectedListener;

    .prologue
    .line 91
    iput-object p1, p0, Lcom/vk/attachpicker/widget/ColorSelectorView;->onColorSelectedListener:Lcom/vk/attachpicker/widget/ColorSelectorView$OnColorSelectedListener;

    .line 92
    return-void
.end method

.method public setSelectedColor(I)V
    .locals 7
    .param p1, "color"    # I

    .prologue
    .line 64
    iput p1, p0, Lcom/vk/attachpicker/widget/ColorSelectorView;->selectedColor:I

    .line 66
    const/4 v2, -0x1

    .line 67
    .local v2, "index":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    sget-object v6, Lcom/vk/attachpicker/drawing/DrawingColors;->COLORS:[I

    array-length v6, v6

    if-ge v1, v6, :cond_0

    .line 68
    sget-object v6, Lcom/vk/attachpicker/drawing/DrawingColors;->COLORS:[I

    aget v6, v6, v1

    if-ne v6, p1, :cond_1

    .line 69
    move v2, v1

    .line 73
    :cond_0
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/ColorSelectorView;->getChildCount()I

    move-result v6

    if-ge v3, v6, :cond_4

    .line 74
    invoke-virtual {p0, v3}, Lcom/vk/attachpicker/widget/ColorSelectorView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    .line 75
    .local v5, "ll":Landroid/widget/LinearLayout;
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_2
    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v6

    if-ge v4, v6, :cond_3

    .line 76
    invoke-virtual {v5, v4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;

    .line 77
    .local v0, "cv":Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;
    mul-int/lit8 v6, v3, 0x8

    add-int/2addr v6, v4

    if-ne v2, v6, :cond_2

    const/4 v6, 0x1

    :goto_3
    invoke-virtual {v0, v6}, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->setChecked(Z)V

    .line 75
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 67
    .end local v0    # "cv":Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;
    .end local v3    # "j":I
    .end local v4    # "k":I
    .end local v5    # "ll":Landroid/widget/LinearLayout;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 77
    .restart local v0    # "cv":Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;
    .restart local v3    # "j":I
    .restart local v4    # "k":I
    .restart local v5    # "ll":Landroid/widget/LinearLayout;
    :cond_2
    const/4 v6, 0x0

    goto :goto_3

    .line 73
    .end local v0    # "cv":Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 80
    .end local v4    # "k":I
    .end local v5    # "ll":Landroid/widget/LinearLayout;
    :cond_4
    return-void
.end method
