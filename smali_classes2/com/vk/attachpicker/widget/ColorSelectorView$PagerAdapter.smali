.class Lcom/vk/attachpicker/widget/ColorSelectorView$PagerAdapter;
.super Lcom/vk/attachpicker/widget/ViewPagerAdapter;
.source "ColorSelectorView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/attachpicker/widget/ColorSelectorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PagerAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/attachpicker/widget/ColorSelectorView;


# direct methods
.method private constructor <init>(Lcom/vk/attachpicker/widget/ColorSelectorView;)V
    .locals 0

    .prologue
    .line 184
    iput-object p1, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$PagerAdapter;->this$0:Lcom/vk/attachpicker/widget/ColorSelectorView;

    invoke-direct {p0}, Lcom/vk/attachpicker/widget/ViewPagerAdapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/attachpicker/widget/ColorSelectorView;Lcom/vk/attachpicker/widget/ColorSelectorView$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/attachpicker/widget/ColorSelectorView;
    .param p2, "x1"    # Lcom/vk/attachpicker/widget/ColorSelectorView$1;

    .prologue
    .line 184
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/widget/ColorSelectorView$PagerAdapter;-><init>(Lcom/vk/attachpicker/widget/ColorSelectorView;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 221
    sget-object v0, Lcom/vk/attachpicker/drawing/DrawingColors;->COLORS:[I

    array-length v0, v0

    div-int/lit8 v0, v0, 0x8

    return v0
.end method

.method public getView(ILandroid/support/v4/view/ViewPager;)Landroid/view/View;
    .locals 9
    .param p1, "position"    # I
    .param p2, "pager"    # Landroid/support/v4/view/ViewPager;

    .prologue
    const/16 v8, 0x8

    const/4 v6, 0x0

    .line 188
    new-instance v3, Landroid/widget/LinearLayout;

    iget-object v5, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$PagerAdapter;->this$0:Lcom/vk/attachpicker/widget/ColorSelectorView;

    invoke-virtual {v5}, Lcom/vk/attachpicker/widget/ColorSelectorView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v3, v5}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 189
    .local v3, "innerLayout":Landroid/widget/LinearLayout;
    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 190
    invoke-static {v8}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v5

    iget-object v7, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$PagerAdapter;->this$0:Lcom/vk/attachpicker/widget/ColorSelectorView;

    invoke-static {v7}, Lcom/vk/attachpicker/widget/ColorSelectorView;->access$100(Lcom/vk/attachpicker/widget/ColorSelectorView;)I

    move-result v7

    add-int/2addr v5, v7

    invoke-static {v8}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v7

    iget-object v8, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$PagerAdapter;->this$0:Lcom/vk/attachpicker/widget/ColorSelectorView;

    invoke-static {v8}, Lcom/vk/attachpicker/widget/ColorSelectorView;->access$200(Lcom/vk/attachpicker/widget/ColorSelectorView;)I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {v3, v5, v6, v7, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 192
    mul-int/lit8 v2, p1, 0x8

    .local v2, "i":I
    :goto_0
    mul-int/lit8 v5, p1, 0x8

    add-int/lit8 v5, v5, 0x8

    if-ge v2, v5, :cond_1

    .line 193
    sget-object v5, Lcom/vk/attachpicker/drawing/DrawingColors;->COLORS:[I

    aget v0, v5, v2

    .line 194
    .local v0, "color":I
    new-instance v1, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;

    iget-object v5, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$PagerAdapter;->this$0:Lcom/vk/attachpicker/widget/ColorSelectorView;

    invoke-virtual {v5}, Lcom/vk/attachpicker/widget/ColorSelectorView;->getContext()Landroid/content/Context;

    move-result-object v5

    iget-object v7, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$PagerAdapter;->this$0:Lcom/vk/attachpicker/widget/ColorSelectorView;

    invoke-static {v7}, Lcom/vk/attachpicker/widget/ColorSelectorView;->access$300(Lcom/vk/attachpicker/widget/ColorSelectorView;)Z

    move-result v7

    invoke-direct {v1, v5, v0, v7}, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;-><init>(Landroid/content/Context;IZ)V

    .line 195
    .local v1, "colorView":Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;
    iget-object v5, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$PagerAdapter;->this$0:Lcom/vk/attachpicker/widget/ColorSelectorView;

    invoke-static {v5}, Lcom/vk/attachpicker/widget/ColorSelectorView;->access$400(Lcom/vk/attachpicker/widget/ColorSelectorView;)I

    move-result v5

    if-ne v0, v5, :cond_0

    const/4 v5, 0x1

    :goto_1
    invoke-virtual {v1, v5}, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->setChecked(Z)V

    .line 197
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    invoke-direct {v4, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 198
    .local v4, "lp":Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v5, 0x3f800000    # 1.0f

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 199
    const/16 v5, 0x10

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 200
    invoke-virtual {v3, v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 202
    invoke-static {p0, v0, v1}, Lcom/vk/attachpicker/widget/ColorSelectorView$PagerAdapter$$Lambda$1;->lambdaFactory$(Lcom/vk/attachpicker/widget/ColorSelectorView$PagerAdapter;ILcom/vk/attachpicker/widget/ColorSelectorView$ColorView;)Landroid/view/View$OnClickListener;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 192
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v4    # "lp":Landroid/widget/LinearLayout$LayoutParams;
    :cond_0
    move v5, v6

    .line 195
    goto :goto_1

    .line 216
    .end local v0    # "color":I
    .end local v1    # "colorView":Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;
    :cond_1
    return-object v3
.end method

.method synthetic lambda$getView$0(ILcom/vk/attachpicker/widget/ColorSelectorView$ColorView;Landroid/view/View;)V
    .locals 5
    .param p1, "color"    # I
    .param p2, "colorView"    # Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;
    .param p3, "v"    # Landroid/view/View;

    .prologue
    .line 203
    iget-object v4, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$PagerAdapter;->this$0:Lcom/vk/attachpicker/widget/ColorSelectorView;

    invoke-static {v4, p1}, Lcom/vk/attachpicker/widget/ColorSelectorView;->access$402(Lcom/vk/attachpicker/widget/ColorSelectorView;I)I

    .line 204
    iget-object v4, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$PagerAdapter;->this$0:Lcom/vk/attachpicker/widget/ColorSelectorView;

    invoke-static {v4}, Lcom/vk/attachpicker/widget/ColorSelectorView;->access$500(Lcom/vk/attachpicker/widget/ColorSelectorView;)Lcom/vk/attachpicker/widget/ColorSelectorView$OnColorSelectedListener;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 205
    iget-object v4, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$PagerAdapter;->this$0:Lcom/vk/attachpicker/widget/ColorSelectorView;

    invoke-static {v4}, Lcom/vk/attachpicker/widget/ColorSelectorView;->access$500(Lcom/vk/attachpicker/widget/ColorSelectorView;)Lcom/vk/attachpicker/widget/ColorSelectorView$OnColorSelectedListener;

    move-result-object v4

    invoke-interface {v4, p1}, Lcom/vk/attachpicker/widget/ColorSelectorView$OnColorSelectedListener;->onColorSelected(I)V

    .line 207
    :cond_0
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    iget-object v4, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$PagerAdapter;->this$0:Lcom/vk/attachpicker/widget/ColorSelectorView;

    invoke-virtual {v4}, Lcom/vk/attachpicker/widget/ColorSelectorView;->getChildCount()I

    move-result v4

    if-ge v1, v4, :cond_3

    .line 208
    iget-object v4, p0, Lcom/vk/attachpicker/widget/ColorSelectorView$PagerAdapter;->this$0:Lcom/vk/attachpicker/widget/ColorSelectorView;

    invoke-virtual {v4, v1}, Lcom/vk/attachpicker/widget/ColorSelectorView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    .line 209
    .local v3, "ll":Landroid/widget/LinearLayout;
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_1
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    if-ge v2, v4, :cond_2

    .line 210
    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;

    .line 211
    .local v0, "cv":Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;
    if-ne v0, p2, :cond_1

    const/4 v4, 0x1

    :goto_2
    invoke-virtual {v0, v4}, Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;->setChecked(Z)V

    .line 209
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 211
    :cond_1
    const/4 v4, 0x0

    goto :goto_2

    .line 207
    .end local v0    # "cv":Lcom/vk/attachpicker/widget/ColorSelectorView$ColorView;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 214
    .end local v2    # "k":I
    .end local v3    # "ll":Landroid/widget/LinearLayout;
    :cond_3
    return-void
.end method
