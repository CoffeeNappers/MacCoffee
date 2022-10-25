.class Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;
.super Landroid/view/View;
.source "ColorSelectorView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/attachpicker/widget/ColorSelectorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ColorView"
.end annotation


# static fields
.field private static final GRAY_BORDER_WIDTH:I

.field private static final RADIUS:I

.field private static final SELECTED_CENTER_RADIUS:I

.field private static final SELECTED_RADIUS:I

.field private static final WHITE_BORDER_WIDTH:I

.field private static final borderPaint:Landroid/graphics/Paint;

.field private static final grayBorder:Landroid/graphics/Paint;

.field private static final selectedCenter:Landroid/graphics/Paint;

.field private static final whiteBorder:Landroid/graphics/Paint;


# instance fields
.field private final color:I

.field private final coloredPaint:Landroid/graphics/Paint;

.field private isChecked:Z

.field private final useWhiteBorder:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, -0x1

    const/4 v1, 0x1

    .line 96
    const/16 v0, 0xe

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->SELECTED_RADIUS:I

    .line 97
    const/16 v0, 0xc

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->RADIUS:I

    .line 98
    const/4 v0, 0x4

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->SELECTED_CENTER_RADIUS:I

    .line 100
    const/4 v0, 0x2

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->WHITE_BORDER_WIDTH:I

    .line 101
    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->GRAY_BORDER_WIDTH:I

    .line 103
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    sput-object v0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->borderPaint:Landroid/graphics/Paint;

    .line 104
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    sput-object v0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->grayBorder:Landroid/graphics/Paint;

    .line 105
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    sput-object v0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->whiteBorder:Landroid/graphics/Paint;

    .line 106
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    sput-object v0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->selectedCenter:Landroid/graphics/Paint;

    .line 109
    sget-object v0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->grayBorder:Landroid/graphics/Paint;

    const v1, -0x201d1a

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 110
    sget-object v0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->grayBorder:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 111
    sget-object v0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->grayBorder:Landroid/graphics/Paint;

    sget v1, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->GRAY_BORDER_WIDTH:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 113
    sget-object v0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->borderPaint:Landroid/graphics/Paint;

    invoke-static {}, Lcom/vk/attachpicker/Picker;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0f00b6

    invoke-static {v1, v2}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 114
    sget-object v0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->borderPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 115
    sget-object v0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->borderPaint:Landroid/graphics/Paint;

    sget v1, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->WHITE_BORDER_WIDTH:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 117
    sget-object v0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->whiteBorder:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 118
    sget-object v0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->whiteBorder:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 119
    sget-object v0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->whiteBorder:Landroid/graphics/Paint;

    sget v1, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->WHITE_BORDER_WIDTH:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 121
    sget-object v0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->selectedCenter:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 122
    sget-object v0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->selectedCenter:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 123
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IZ)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "color"    # I
    .param p3, "useWhiteBorder"    # Z

    .prologue
    .line 132
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 125
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->coloredPaint:Landroid/graphics/Paint;

    .line 134
    iput p2, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->color:I

    .line 135
    iput-boolean p3, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->useWhiteBorder:Z

    .line 137
    iget-object v0, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->coloredPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 138
    iget-object v0, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->coloredPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 139
    return-void
.end method


# virtual methods
.method public isChecked()Z
    .locals 1

    .prologue
    .line 175
    iget-boolean v0, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->isChecked:Z

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v7, -0x1

    .line 144
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 146
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v3

    div-int/lit8 v0, v3, 0x2

    .line 147
    .local v0, "cx":I
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v3

    div-int/lit8 v1, v3, 0x2

    .line 149
    .local v1, "cy":I
    iget-boolean v3, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->isChecked:Z

    if-eqz v3, :cond_2

    .line 150
    sget v2, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->SELECTED_RADIUS:I

    .line 155
    .local v2, "radius":I
    :goto_0
    int-to-float v3, v0

    int-to-float v4, v1

    add-int/lit8 v5, v2, -0x1

    int-to-float v5, v5

    iget-object v6, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->coloredPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 157
    iget-boolean v3, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->useWhiteBorder:Z

    if-eqz v3, :cond_3

    .line 158
    int-to-float v3, v0

    int-to-float v4, v1

    sget v5, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->WHITE_BORDER_WIDTH:I

    div-int/lit8 v5, v5, 0x2

    sub-int v5, v2, v5

    int-to-float v5, v5

    sget-object v6, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->whiteBorder:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 160
    iget v3, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->color:I

    if-ne v3, v7, :cond_0

    iget-boolean v3, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->isChecked:Z

    if-nez v3, :cond_0

    .line 161
    int-to-float v3, v0

    int-to-float v4, v1

    sget v5, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->WHITE_BORDER_WIDTH:I

    sub-int v5, v2, v5

    int-to-float v5, v5

    sget-object v6, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->grayBorder:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 167
    :cond_0
    :goto_1
    iget-boolean v3, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->isChecked:Z

    if-eqz v3, :cond_1

    .line 168
    sget-object v3, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->selectedCenter:Landroid/graphics/Paint;

    iget v4, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->color:I

    invoke-static {v4}, Lcom/vk/core/util/ColorUtils;->getOverlayColor(I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 169
    int-to-float v3, v0

    int-to-float v4, v1

    sget v5, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->SELECTED_CENTER_RADIUS:I

    int-to-float v5, v5

    sget-object v6, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->selectedCenter:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 172
    :cond_1
    return-void

    .line 152
    .end local v2    # "radius":I
    :cond_2
    sget v2, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->RADIUS:I

    .restart local v2    # "radius":I
    goto :goto_0

    .line 163
    :cond_3
    iget v3, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->color:I

    if-ne v3, v7, :cond_0

    .line 164
    int-to-float v3, v0

    int-to-float v4, v1

    sget v5, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->GRAY_BORDER_WIDTH:I

    sub-int v5, v2, v5

    int-to-float v5, v5

    sget-object v6, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->grayBorder:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_1
.end method

.method public setChecked(Z)V
    .locals 0
    .param p1, "checked"    # Z

    .prologue
    .line 179
    iput-boolean p1, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->isChecked:Z

    .line 180
    invoke-virtual {p0}, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->invalidate()V

    .line 181
    return-void
.end method
