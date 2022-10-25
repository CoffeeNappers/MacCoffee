.class public Lcom/vk/attachpicker/widget/WidthSelectorView;
.super Landroid/widget/LinearLayout;
.source "WidthSelectorView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/attachpicker/widget/WidthSelectorView$OnWidthSelectedListener;,
        Lcom/vk/attachpicker/widget/WidthSelectorView$ColorView;
    }
.end annotation


# static fields
.field private static final radius:I

.field private static final viewSize:I


# instance fields
.field private final color:I

.field private onWidthSelectedListener:Lcom/vk/attachpicker/widget/WidthSelectorView$OnWidthSelectedListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    const/16 v0, 0x38

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/attachpicker/widget/WidthSelectorView;->viewSize:I

    .line 38
    const/4 v0, 0x4

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/attachpicker/widget/WidthSelectorView;->radius:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;II)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "color"    # I
    .param p3, "selectedWidth"    # I

    .prologue
    .line 45
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 46
    iput p2, p0, Lcom/vk/attachpicker/widget/WidthSelectorView;->color:I

    .line 47
    invoke-direct {p0}, Lcom/vk/attachpicker/widget/WidthSelectorView;->init()V

    .line 48
    invoke-virtual {p0, p3}, Lcom/vk/attachpicker/widget/WidthSelectorView;->setWidth(I)V

    .line 49
    return-void
.end method

.method static synthetic access$000()I
    .locals 1

    .prologue
    .line 18
    sget v0, Lcom/vk/attachpicker/widget/WidthSelectorView;->radius:I

    return v0
.end method

.method private addWidthView(FII)V
    .locals 6
    .param p1, "width"    # F
    .param p2, "widthIndex"    # I
    .param p3, "height"    # I

    .prologue
    const/4 v5, 0x1

    .line 81
    new-instance v0, Lcom/vk/attachpicker/widget/WidthSelectorView$ColorView;

    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/WidthSelectorView;->getContext()Landroid/content/Context;

    move-result-object v2

    iget v3, p0, Lcom/vk/attachpicker/widget/WidthSelectorView;->color:I

    invoke-direct {v0, v2, v3, p1}, Lcom/vk/attachpicker/widget/WidthSelectorView$ColorView;-><init>(Landroid/content/Context;IF)V

    .line 82
    .local v0, "colorView":Lcom/vk/attachpicker/widget/WidthSelectorView$ColorView;
    iget v2, p0, Lcom/vk/attachpicker/widget/WidthSelectorView;->color:I

    int-to-float v2, v2

    sget-object v3, Lcom/vk/attachpicker/drawing/DrawingState;->WIDTH:[F

    const/4 v4, 0x0

    aget v3, v3, v4

    cmpl-float v2, v2, v3

    if-nez v2, :cond_0

    .line 83
    invoke-virtual {v0, v5}, Lcom/vk/attachpicker/widget/WidthSelectorView$ColorView;->setChecked(Z)V

    .line 85
    :cond_0
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    sget v2, Lcom/vk/attachpicker/widget/WidthSelectorView;->viewSize:I

    invoke-direct {v1, v2, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 86
    .local v1, "lp":Landroid/widget/LinearLayout$LayoutParams;
    iput v5, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 87
    invoke-virtual {p0, v0, v1}, Lcom/vk/attachpicker/widget/WidthSelectorView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 89
    invoke-static {p0, v0, p2}, Lcom/vk/attachpicker/widget/WidthSelectorView$$Lambda$2;->lambdaFactory$(Lcom/vk/attachpicker/widget/WidthSelectorView;Lcom/vk/attachpicker/widget/WidthSelectorView$ColorView;I)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/vk/attachpicker/widget/WidthSelectorView$ColorView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 98
    return-void
.end method

.method private init()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 52
    invoke-virtual {p0, v3}, Lcom/vk/attachpicker/widget/WidthSelectorView;->setOrientation(I)V

    .line 53
    const/16 v0, 0x8

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    const/16 v1, 0x18

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v1

    invoke-virtual {p0, v2, v0, v2, v1}, Lcom/vk/attachpicker/widget/WidthSelectorView;->setPadding(IIII)V

    .line 54
    const v0, 0x7f020343

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/widget/WidthSelectorView;->setBackgroundResource(I)V

    .line 56
    sget-object v0, Lcom/vk/attachpicker/drawing/DrawingState;->WIDTH:[F

    aget v0, v0, v6

    const/16 v1, 0x38

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v1

    invoke-direct {p0, v0, v6, v1}, Lcom/vk/attachpicker/widget/WidthSelectorView;->addWidthView(FII)V

    .line 57
    sget-object v0, Lcom/vk/attachpicker/drawing/DrawingState;->WIDTH:[F

    aget v0, v0, v5

    const/16 v1, 0x30

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v1

    invoke-direct {p0, v0, v5, v1}, Lcom/vk/attachpicker/widget/WidthSelectorView;->addWidthView(FII)V

    .line 58
    sget-object v0, Lcom/vk/attachpicker/drawing/DrawingState;->WIDTH:[F

    aget v0, v0, v4

    const/16 v1, 0x2c

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v1

    invoke-direct {p0, v0, v4, v1}, Lcom/vk/attachpicker/widget/WidthSelectorView;->addWidthView(FII)V

    .line 59
    sget-object v0, Lcom/vk/attachpicker/drawing/DrawingState;->WIDTH:[F

    aget v0, v0, v3

    const/16 v1, 0x28

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v1

    invoke-direct {p0, v0, v3, v1}, Lcom/vk/attachpicker/widget/WidthSelectorView;->addWidthView(FII)V

    .line 60
    sget-object v0, Lcom/vk/attachpicker/drawing/DrawingState;->WIDTH:[F

    aget v0, v0, v2

    const/16 v1, 0x20

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v1

    invoke-direct {p0, v0, v2, v1}, Lcom/vk/attachpicker/widget/WidthSelectorView;->addWidthView(FII)V

    .line 61
    return-void
.end method

.method static synthetic lambda$show$0(Lcom/vk/attachpicker/widget/WidthSelectorView$OnWidthSelectedListener;Landroid/widget/PopupWindow;I)V
    .locals 0
    .param p0, "onWidthSelectedListener"    # Lcom/vk/attachpicker/widget/WidthSelectorView$OnWidthSelectedListener;
    .param p1, "window"    # Landroid/widget/PopupWindow;
    .param p2, "widthIndex"    # I

    .prologue
    .line 25
    if-eqz p0, :cond_0

    .line 26
    invoke-interface {p0, p2}, Lcom/vk/attachpicker/widget/WidthSelectorView$OnWidthSelectedListener;->onWidthSelected(I)V

    .line 28
    :cond_0
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->dismiss()V

    .line 29
    return-void
.end method

.method public static show(Landroid/view/View;IILcom/vk/attachpicker/widget/WidthSelectorView$OnWidthSelectedListener;)V
    .locals 5
    .param p0, "view"    # Landroid/view/View;
    .param p1, "color"    # I
    .param p2, "selectedWidth"    # I
    .param p3, "onWidthSelectedListener"    # Lcom/vk/attachpicker/widget/WidthSelectorView$OnWidthSelectedListener;

    .prologue
    const/4 v4, 0x1

    .line 21
    new-instance v0, Lcom/vk/attachpicker/widget/WidthSelectorView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2, p1, p2}, Lcom/vk/attachpicker/widget/WidthSelectorView;-><init>(Landroid/content/Context;II)V

    .line 22
    .local v0, "widthSelectorView":Lcom/vk/attachpicker/widget/WidthSelectorView;
    new-instance v1, Landroid/widget/PopupWindow;

    const/16 v2, 0x40

    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v2

    const/16 v3, 0xf4

    invoke-static {v3}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v3

    invoke-direct {v1, v0, v2, v3, v4}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    .line 24
    .local v1, "window":Landroid/widget/PopupWindow;
    invoke-static {p3, v1}, Lcom/vk/attachpicker/widget/WidthSelectorView$$Lambda$1;->lambdaFactory$(Lcom/vk/attachpicker/widget/WidthSelectorView$OnWidthSelectedListener;Landroid/widget/PopupWindow;)Lcom/vk/attachpicker/widget/WidthSelectorView$OnWidthSelectedListener;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/vk/attachpicker/widget/WidthSelectorView;->setOnWidthSelectedListener(Lcom/vk/attachpicker/widget/WidthSelectorView$OnWidthSelectedListener;)V

    .line 31
    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 32
    invoke-virtual {v1, v4}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 34
    invoke-virtual {v1, p0}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;)V

    .line 35
    return-void
.end method


# virtual methods
.method public getColor()I
    .locals 1

    .prologue
    .line 77
    iget v0, p0, Lcom/vk/attachpicker/widget/WidthSelectorView;->color:I

    return v0
.end method

.method synthetic lambda$addWidthView$1(Lcom/vk/attachpicker/widget/WidthSelectorView$ColorView;ILandroid/view/View;)V
    .locals 3
    .param p1, "colorView"    # Lcom/vk/attachpicker/widget/WidthSelectorView$ColorView;
    .param p2, "widthIndex"    # I
    .param p3, "v"    # Landroid/view/View;

    .prologue
    .line 90
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/WidthSelectorView;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 91
    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/widget/WidthSelectorView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/widget/WidthSelectorView$ColorView;

    .line 92
    .local v0, "cv":Lcom/vk/attachpicker/widget/WidthSelectorView$ColorView;
    if-ne v0, p1, :cond_0

    const/4 v2, 0x1

    :goto_1
    invoke-virtual {v0, v2}, Lcom/vk/attachpicker/widget/WidthSelectorView$ColorView;->setChecked(Z)V

    .line 90
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 92
    :cond_0
    const/4 v2, 0x0

    goto :goto_1

    .line 94
    .end local v0    # "cv":Lcom/vk/attachpicker/widget/WidthSelectorView$ColorView;
    :cond_1
    iget-object v2, p0, Lcom/vk/attachpicker/widget/WidthSelectorView;->onWidthSelectedListener:Lcom/vk/attachpicker/widget/WidthSelectorView$OnWidthSelectedListener;

    if-eqz v2, :cond_2

    .line 95
    iget-object v2, p0, Lcom/vk/attachpicker/widget/WidthSelectorView;->onWidthSelectedListener:Lcom/vk/attachpicker/widget/WidthSelectorView$OnWidthSelectedListener;

    invoke-interface {v2, p2}, Lcom/vk/attachpicker/widget/WidthSelectorView$OnWidthSelectedListener;->onWidthSelected(I)V

    .line 97
    :cond_2
    return-void
.end method

.method public setOnWidthSelectedListener(Lcom/vk/attachpicker/widget/WidthSelectorView$OnWidthSelectedListener;)V
    .locals 0
    .param p1, "onWidthSelectedListener"    # Lcom/vk/attachpicker/widget/WidthSelectorView$OnWidthSelectedListener;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/vk/attachpicker/widget/WidthSelectorView;->onWidthSelectedListener:Lcom/vk/attachpicker/widget/WidthSelectorView$OnWidthSelectedListener;

    .line 66
    return-void
.end method

.method public setWidth(I)V
    .locals 4
    .param p1, "widthIndex"    # I

    .prologue
    .line 69
    sget-object v3, Lcom/vk/attachpicker/drawing/DrawingState;->WIDTH:[F

    array-length v3, v3

    sub-int/2addr v3, p1

    add-int/lit8 v2, v3, -0x1

    .line 70
    .local v2, "realIndex":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/WidthSelectorView;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 71
    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/widget/WidthSelectorView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/widget/WidthSelectorView$ColorView;

    .line 72
    .local v0, "cv":Lcom/vk/attachpicker/widget/WidthSelectorView$ColorView;
    if-ne v2, v1, :cond_0

    const/4 v3, 0x1

    :goto_1
    invoke-virtual {v0, v3}, Lcom/vk/attachpicker/widget/WidthSelectorView$ColorView;->setChecked(Z)V

    .line 70
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 72
    :cond_0
    const/4 v3, 0x0

    goto :goto_1

    .line 74
    .end local v0    # "cv":Lcom/vk/attachpicker/widget/WidthSelectorView$ColorView;
    :cond_1
    return-void
.end method
