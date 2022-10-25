.class public Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;
.super Landroid/widget/HorizontalScrollView;
.source "PagerSlidingTabStrip.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$SavedState;,
        Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$PageListener;,
        Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$BadgeTabProvider;,
        Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconDrawableProvider;,
        Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconUrlProvider;,
        Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$IconTabProvider;
    }
.end annotation


# static fields
.field private static final ATTRS:[I


# instance fields
.field private autoExpand:Z

.field private checkedTabWidths:Z

.field private currentPosition:I

.field private currentPositionOffset:F

.field private defaultTabLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

.field public delegatePageListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/support/v4/view/ViewPager$OnPageChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private dividerColor:I

.field private dividerPadding:I

.field private dividerPaint:Landroid/graphics/Paint;

.field private dividerWidth:I

.field private expandedTabLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

.field private indicatorColor:I

.field private indicatorHeight:I

.field private lastScrollX:I

.field private locale:Ljava/util/Locale;

.field private mFooterViews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mHeaderCount:I

.field private mHeaderViews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public final pageListener:Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$PageListener;

.field private pager:Landroid/support/v4/view/ViewPager;

.field private rectPaint:Landroid/graphics/Paint;

.field private scrollOffset:I

.field private shouldExpand:Z

.field private tabBackgroundResId:I

.field private tabColorStateList:Landroid/content/res/ColorStateList;

.field private tabCount:I

.field private tabPadding:I

.field private tabTextColor:I

.field private tabTextSize:I

.field private tabTypeface:Landroid/graphics/Typeface;

.field private tabTypefaceStyle:I

.field private tabsContainer:Landroid/widget/LinearLayout;

.field private textAllCaps:Z

.field private underlineColor:I

.field private underlineHeight:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 81
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->ATTRS:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x1010095
        0x1010098
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 141
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 142
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 145
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 146
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const v3, -0x99999a

    const/4 v7, 0x0

    const/4 v6, -0x1

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 149
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 94
    new-instance v2, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$PageListener;

    invoke-direct {v2, p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$PageListener;-><init>(Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;)V

    iput-object v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->pageListener:Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$PageListener;

    .line 102
    iput v5, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->currentPosition:I

    .line 103
    iput v7, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->currentPositionOffset:F

    .line 108
    iput-boolean v5, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->checkedTabWidths:Z

    .line 110
    iput v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->indicatorColor:I

    .line 111
    const/high16 v2, 0x1a000000

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->underlineColor:I

    .line 112
    const/high16 v2, 0x1a000000

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerColor:I

    .line 114
    iput-boolean v5, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->shouldExpand:Z

    .line 115
    iput-boolean v4, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->autoExpand:Z

    .line 116
    iput-boolean v4, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->textAllCaps:Z

    .line 118
    const/16 v2, 0x34

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->scrollOffset:I

    .line 119
    const/16 v2, 0x8

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->indicatorHeight:I

    .line 120
    const/4 v2, 0x2

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->underlineHeight:I

    .line 121
    const/16 v2, 0xc

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerPadding:I

    .line 122
    const/16 v2, 0x18

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabPadding:I

    .line 123
    iput v4, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerWidth:I

    .line 125
    const/16 v2, 0xc

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabTextSize:I

    .line 126
    iput v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabTextColor:I

    .line 128
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabTypeface:Landroid/graphics/Typeface;

    .line 129
    iput v4, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabTypefaceStyle:I

    .line 131
    iput v5, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->lastScrollX:I

    .line 133
    const v2, 0x7f020071

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabBackgroundResId:I

    .line 151
    invoke-virtual {p0, v4}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->setFillViewport(Z)V

    .line 152
    invoke-virtual {p0, v5}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->setWillNotDraw(Z)V

    .line 154
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    .line 155
    iget-object v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 156
    iget-object v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v3, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 157
    iget-object v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v2}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->addView(Landroid/view/View;)V

    .line 159
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 161
    .local v1, "dm":Landroid/util/DisplayMetrics;
    iget v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->scrollOffset:I

    int-to-float v2, v2

    invoke-static {v4, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->scrollOffset:I

    .line 162
    iget v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->indicatorHeight:I

    int-to-float v2, v2

    invoke-static {v4, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->indicatorHeight:I

    .line 163
    iget v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->underlineHeight:I

    int-to-float v2, v2

    invoke-static {v4, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->underlineHeight:I

    .line 164
    iget v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerPadding:I

    int-to-float v2, v2

    invoke-static {v4, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerPadding:I

    .line 165
    iget v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabPadding:I

    int-to-float v2, v2

    invoke-static {v4, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabPadding:I

    .line 166
    iget v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerWidth:I

    int-to-float v2, v2

    invoke-static {v4, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerWidth:I

    .line 167
    iget v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabTextSize:I

    int-to-float v2, v2

    invoke-static {v4, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabTextSize:I

    .line 171
    sget-object v2, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->ATTRS:[I

    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 173
    .local v0, "a":Landroid/content/res/TypedArray;
    iget v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabTextSize:I

    invoke-virtual {v0, v5, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabTextSize:I

    .line 174
    iget v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabTextColor:I

    invoke-virtual {v0, v4, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabTextColor:I

    .line 176
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 180
    sget-object v2, Lcom/vkontakte/android/R$styleable;->PagerSlidingTabStrip:[I

    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 182
    iget v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->indicatorColor:I

    invoke-virtual {v0, v5, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->indicatorColor:I

    .line 183
    iget v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->underlineColor:I

    invoke-virtual {v0, v4, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->underlineColor:I

    .line 184
    const/4 v2, 0x2

    iget v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerColor:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerColor:I

    .line 185
    const/4 v2, 0x3

    iget v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->indicatorHeight:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->indicatorHeight:I

    .line 186
    const/4 v2, 0x4

    iget v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->underlineHeight:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->underlineHeight:I

    .line 188
    const/4 v2, 0x5

    iget v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabPadding:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabPadding:I

    .line 189
    const/4 v2, 0x7

    iget v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabBackgroundResId:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabBackgroundResId:I

    .line 190
    const/16 v2, 0x8

    iget-boolean v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->shouldExpand:Z

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->shouldExpand:Z

    .line 191
    const/4 v2, 0x6

    iget v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->scrollOffset:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->scrollOffset:I

    .line 194
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 196
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    iput-object v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->rectPaint:Landroid/graphics/Paint;

    .line 197
    iget-object v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->rectPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 198
    iget-object v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->rectPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 200
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    iput-object v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerPaint:Landroid/graphics/Paint;

    .line 201
    iget-object v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 202
    iget-object v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerPaint:Landroid/graphics/Paint;

    iget v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerWidth:I

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 204
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, v3, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    iput-object v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->defaultTabLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

    .line 205
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v2, v5, v6, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    iput-object v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->expandedTabLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

    .line 207
    iget-object v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->locale:Ljava/util/Locale;

    if-nez v2, :cond_0

    .line 208
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget-object v2, v2, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    iput-object v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->locale:Ljava/util/Locale;

    .line 210
    :cond_0
    return-void
.end method

.method static synthetic access$000(Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;)I
    .locals 1
    .param p0, "x0"    # Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;

    .prologue
    .line 52
    iget v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->currentPosition:I

    return v0
.end method

.method static synthetic access$002(Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;I)I
    .locals 0
    .param p0, "x0"    # Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;
    .param p1, "x1"    # I

    .prologue
    .line 52
    iput p1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->currentPosition:I

    return p1
.end method

.method static synthetic access$100(Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;)Landroid/support/v4/view/ViewPager;
    .locals 1
    .param p0, "x0"    # Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    return-object v0
.end method

.method static synthetic access$200(Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;)I
    .locals 1
    .param p0, "x0"    # Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;

    .prologue
    .line 52
    iget v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->mHeaderCount:I

    return v0
.end method

.method static synthetic access$300(Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;II)V
    .locals 0
    .param p0, "x0"    # Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 52
    invoke-direct {p0, p1, p2}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->scrollToChild(II)V

    return-void
.end method

.method static synthetic access$400(Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;)V
    .locals 0
    .param p0, "x0"    # Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->doUpdateExpanded()V

    return-void
.end method

.method static synthetic access$500(Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;)Landroid/widget/LinearLayout;
    .locals 1
    .param p0, "x0"    # Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$602(Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;F)F
    .locals 0
    .param p0, "x0"    # Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;
    .param p1, "x1"    # F

    .prologue
    .line 52
    iput p1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->currentPositionOffset:F

    return p1
.end method

.method static synthetic access$700(Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;
    .param p1, "x1"    # Z

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->updateTabStyles(Z)V

    return-void
.end method

.method private addBadgeTextTab(ILjava/lang/CharSequence;Ljava/lang/String;)V
    .locals 6
    .param p1, "position"    # I
    .param p2, "title"    # Ljava/lang/CharSequence;
    .param p3, "badge"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0x11

    const/4 v4, 0x0

    .line 347
    if-nez p3, :cond_0

    .line 348
    invoke-direct {p0, p1, p2}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->addTextTab(ILjava/lang/CharSequence;)V

    .line 381
    :goto_0
    return-void

    .line 352
    :cond_0
    new-instance v2, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 353
    .local v2, "tab":Landroid/widget/TextView;
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 354
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setFocusable(Z)V

    .line 355
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 356
    invoke-virtual {v2}, Landroid/widget/TextView;->setSingleLine()V

    .line 357
    const/high16 v3, 0x40a00000    # 5.0f

    invoke-static {v3}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    invoke-virtual {v2, v4, v4, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 359
    new-instance v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 360
    .local v0, "bv":Landroid/widget/TextView;
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 361
    const/4 v3, -0x1

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 362
    const/high16 v3, 0x41500000    # 13.0f

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 363
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 364
    const v3, 0x7f020072

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 366
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 367
    .local v1, "ll":Landroid/widget/LinearLayout;
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 368
    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 369
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 370
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 372
    new-instance v3, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$3;

    invoke-direct {v3, p0, p1}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$3;-><init>(Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;I)V

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 379
    iget-object v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_0
.end method

.method private addDrawableTab(ILcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconDrawableProvider;)V
    .locals 2
    .param p1, "position"    # I
    .param p2, "provider"    # Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconDrawableProvider;

    .prologue
    .line 420
    new-instance v0, Landroid/widget/ImageButton;

    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 421
    .local v0, "tab":Landroid/widget/ImageButton;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setFocusable(Z)V

    .line 422
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 423
    invoke-interface {p2, p1}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconDrawableProvider;->getPageIconDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 425
    new-instance v1, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$6;

    invoke-direct {v1, p0, p1}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$6;-><init>(Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;I)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 432
    iget-object v1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 434
    return-void
.end method

.method private addIconTab(II)V
    .locals 2
    .param p1, "position"    # I
    .param p2, "resId"    # I

    .prologue
    .line 385
    new-instance v0, Landroid/widget/ImageButton;

    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 386
    .local v0, "tab":Landroid/widget/ImageButton;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setFocusable(Z)V

    .line 387
    invoke-virtual {v0, p2}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 389
    new-instance v1, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$4;

    invoke-direct {v1, p0, p1}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$4;-><init>(Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;I)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 396
    iget-object v1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 398
    return-void
.end method

.method private addTextTab(ILjava/lang/CharSequence;)V
    .locals 2
    .param p1, "position"    # I
    .param p2, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 328
    new-instance v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 329
    .local v0, "tab":Landroid/widget/TextView;
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 330
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setFocusable(Z)V

    .line 331
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 332
    invoke-virtual {v0}, Landroid/widget/TextView;->setSingleLine()V

    .line 334
    new-instance v1, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$2;

    invoke-direct {v1, p0, p1}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$2;-><init>(Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;I)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 340
    invoke-direct {p0, v0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->setStyle(Landroid/widget/TextView;)V

    .line 341
    iget-object v1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 344
    return-void
.end method

.method private addUrlTab(ILcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconUrlProvider;)V
    .locals 3
    .param p1, "position"    # I
    .param p2, "provider"    # Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconUrlProvider;

    .prologue
    .line 402
    new-instance v0, Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;)V

    .line 403
    .local v0, "tab":Lcom/vk/imageloader/view/VKImageView;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setFocusable(Z)V

    .line 404
    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v1

    check-cast v1, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    sget-object v2, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->CENTER_INSIDE:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {v1, v2}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setActualImageScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    .line 405
    invoke-interface {p2, p1}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconUrlProvider;->getPageIconUrl(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 407
    new-instance v1, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$5;

    invoke-direct {v1, p0, p1}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$5;-><init>(Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;I)V

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 414
    iget-object v1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 416
    return-void
.end method

.method private doUpdateExpanded()V
    .locals 12

    .prologue
    const/4 v11, -0x1

    const/4 v6, 0x0

    .line 533
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->getWidth()I

    move-result v4

    .line 534
    .local v4, "w":I
    const/4 v5, 0x0

    .line 535
    .local v5, "wSum":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v7, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v7}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v7

    if-ge v1, v7, :cond_0

    .line 536
    iget-object v7, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    const/high16 v8, -0x80000000

    or-int/2addr v8, v4

    const/high16 v9, 0x40000000    # 2.0f

    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->getHeight()I

    move-result v10

    or-int/2addr v9, v10

    invoke-virtual {v7, v8, v9}, Landroid/view/View;->measure(II)V

    .line 537
    iget-object v7, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    .line 539
    .local v2, "tw":I
    add-int/2addr v5, v2

    .line 535
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 542
    .end local v2    # "tw":I
    :cond_0
    sub-int v7, v4, v5

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    const/high16 v8, 0x42480000    # 50.0f

    invoke-static {v8}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v8

    if-ge v7, v8, :cond_1

    iget-boolean v7, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->autoExpand:Z

    if-nez v7, :cond_2

    :cond_1
    iget-boolean v7, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->shouldExpand:Z

    if-eqz v7, :cond_4

    :cond_2
    const/4 v0, 0x1

    .line 543
    .local v0, "expand":Z
    :goto_1
    const/4 v1, 0x0

    :goto_2
    iget-object v7, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v7}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v7

    if-ge v1, v7, :cond_7

    .line 544
    iget-object v7, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 545
    .local v3, "v":Landroid/view/View;
    if-eqz v0, :cond_5

    .line 546
    iget v7, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->mHeaderCount:I

    if-lt v1, v7, :cond_3

    .line 547
    invoke-virtual {v3, v6, v6, v6, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 549
    :cond_3
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v7, v11, v11, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 543
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .end local v0    # "expand":Z
    .end local v3    # "v":Landroid/view/View;
    :cond_4
    move v0, v6

    .line 542
    goto :goto_1

    .line 551
    .restart local v0    # "expand":Z
    .restart local v3    # "v":Landroid/view/View;
    :cond_5
    iget v7, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->mHeaderCount:I

    if-lt v1, v7, :cond_6

    .line 552
    iget v7, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabPadding:I

    iget v8, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabPadding:I

    invoke-virtual {v3, v7, v6, v8, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 554
    :cond_6
    iget-object v7, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->defaultTabLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v3, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_3

    .line 557
    .end local v3    # "v":Landroid/view/View;
    :cond_7
    return-void
.end method

.method private scrollToChild(II)V
    .locals 2
    .param p1, "position"    # I
    .param p2, "offset"    # I

    .prologue
    .line 572
    iget v1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabCount:I

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-ge p1, v1, :cond_0

    if-gez p1, :cond_1

    .line 586
    :cond_0
    :goto_0
    return-void

    .line 575
    :cond_1
    iget-object v1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v1

    add-int v0, v1, p2

    .line 577
    .local v0, "newScrollX":I
    if-gtz p1, :cond_2

    if-lez p2, :cond_3

    .line 578
    :cond_2
    iget v1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->scrollOffset:I

    sub-int/2addr v0, v1

    .line 581
    :cond_3
    iget v1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->lastScrollX:I

    if-eq v0, v1, :cond_0

    .line 582
    iput v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->lastScrollX:I

    .line 583
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->scrollTo(II)V

    goto :goto_0
.end method

.method private setStyle(Landroid/widget/TextView;)V
    .locals 2
    .param p1, "tab"    # Landroid/widget/TextView;

    .prologue
    .line 461
    const/4 v0, 0x0

    iget v1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabTextSize:I

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 462
    iget-object v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabTypeface:Landroid/graphics/Typeface;

    iget v1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabTypefaceStyle:I

    invoke-virtual {p1, v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 463
    iget-object v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabColorStateList:Landroid/content/res/ColorStateList;

    if-nez v0, :cond_1

    .line 464
    iget v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabTextColor:I

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 471
    :goto_0
    iget-boolean v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->textAllCaps:Z

    if-eqz v0, :cond_0

    .line 472
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_2

    .line 473
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setAllCaps(Z)V

    .line 478
    :cond_0
    :goto_1
    return-void

    .line 466
    :cond_1
    iget-object v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabColorStateList:Landroid/content/res/ColorStateList;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    goto :goto_0

    .line 475
    :cond_2
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->locale:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method

.method private updateExpanded()V
    .locals 2

    .prologue
    .line 510
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->getWidth()I

    move-result v0

    if-lez v0, :cond_0

    .line 511
    invoke-direct {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->doUpdateExpanded()V

    .line 530
    :goto_0
    return-void

    .line 514
    :cond_0
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$7;

    invoke-direct {v1, p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$7;-><init>(Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    goto :goto_0
.end method

.method private updateTabStyles(Z)V
    .locals 6
    .param p1, "selectedOnly"    # Z

    .prologue
    const/4 v5, -0x1

    const/4 v3, 0x0

    .line 437
    iget v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->mHeaderCount:I

    .local v0, "i":I
    :goto_0
    iget v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabCount:I

    iget v4, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->mHeaderCount:I

    add-int/2addr v2, v4

    if-ge v0, v2, :cond_4

    .line 439
    iget-object v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 441
    .local v1, "v":Landroid/view/View;
    iget-object v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->defaultTabLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 442
    iget v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabBackgroundResId:I

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 443
    iget-boolean v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->shouldExpand:Z

    if-eqz v2, :cond_2

    .line 444
    invoke-virtual {v1, v3, v3, v3, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 445
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v2, v5, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 450
    :goto_1
    instance-of v2, v1, Landroid/widget/TextView;

    if-eqz v2, :cond_0

    move-object v2, v1

    .line 451
    check-cast v2, Landroid/widget/TextView;

    invoke-direct {p0, v2}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->setStyle(Landroid/widget/TextView;)V

    .line 453
    :cond_0
    instance-of v2, v1, Landroid/widget/LinearLayout;

    if-eqz v2, :cond_1

    move-object v2, v1

    .line 454
    check-cast v2, Landroid/widget/LinearLayout;

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    invoke-direct {p0, v2}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->setStyle(Landroid/widget/TextView;)V

    .line 456
    :cond_1
    iget v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->currentPosition:I

    if-ne v0, v2, :cond_3

    const/4 v2, 0x1

    :goto_2
    invoke-virtual {v1, v2}, Landroid/view/View;->setSelected(Z)V

    .line 437
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 447
    :cond_2
    iget v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabPadding:I

    iget v4, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabPadding:I

    invoke-virtual {v1, v2, v3, v4, v3}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_1

    :cond_3
    move v2, v3

    .line 456
    goto :goto_2

    .line 458
    .end local v1    # "v":Landroid/view/View;
    :cond_4
    return-void
.end method


# virtual methods
.method public addFooterView(Landroid/view/View;)V
    .locals 2
    .param p1, "footer"    # Landroid/view/View;

    .prologue
    .line 222
    iget-object v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->mFooterViews:Ljava/util/List;

    if-nez v0, :cond_0

    .line 223
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->mFooterViews:Ljava/util/List;

    .line 225
    :cond_0
    iget-object v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->mFooterViews:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 227
    return-void
.end method

.method public addHeaderView(Landroid/view/View;)V
    .locals 2
    .param p1, "header"    # Landroid/view/View;

    .prologue
    .line 213
    iget-object v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->mHeaderViews:Ljava/util/List;

    if-nez v0, :cond_0

    .line 214
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->mHeaderViews:Ljava/util/List;

    .line 216
    :cond_0
    iget-object v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->mHeaderViews:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    iget v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->mHeaderCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->mHeaderCount:I

    .line 219
    return-void
.end method

.method public addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V
    .locals 1
    .param p1, "l"    # Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .prologue
    .line 247
    iget-object v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->delegatePageListeners:Ljava/util/List;

    if-nez v0, :cond_0

    .line 248
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->delegatePageListeners:Ljava/util/List;

    .line 250
    :cond_0
    iget-object v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->delegatePageListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 251
    return-void
.end method

.method public getDividerColor()I
    .locals 1

    .prologue
    .line 736
    iget v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerColor:I

    return v0
.end method

.method public getDividerPadding()I
    .locals 1

    .prologue
    .line 754
    iget v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerPadding:I

    return v0
.end method

.method public getInactiveTabTextColor()Landroid/content/res/ColorStateList;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabColorStateList:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getIndicatorColor()I
    .locals 1

    .prologue
    .line 699
    iget v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->indicatorColor:I

    return v0
.end method

.method public getIndicatorHeight()I
    .locals 1

    .prologue
    .line 708
    iget v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->indicatorHeight:I

    return v0
.end method

.method public getScrollOffset()I
    .locals 1

    .prologue
    .line 763
    iget v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->scrollOffset:I

    return v0
.end method

.method public getShouldExpand()Z
    .locals 1

    .prologue
    .line 783
    iget-boolean v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->shouldExpand:Z

    return v0
.end method

.method public getTabBackground()I
    .locals 1

    .prologue
    .line 829
    iget v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabBackgroundResId:I

    return v0
.end method

.method public getTabPaddingLeftRight()I
    .locals 1

    .prologue
    .line 838
    iget v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabPadding:I

    return v0
.end method

.method public getTextColor()I
    .locals 1

    .prologue
    .line 814
    iget v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabTextColor:I

    return v0
.end method

.method public getTextSize()I
    .locals 1

    .prologue
    .line 800
    iget v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabTextSize:I

    return v0
.end method

.method public getUnderlineColor()I
    .locals 1

    .prologue
    .line 722
    iget v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->underlineColor:I

    return v0
.end method

.method public getUnderlineHeight()I
    .locals 1

    .prologue
    .line 745
    iget v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->underlineHeight:I

    return v0
.end method

.method public isTextAllCaps()Z
    .locals 1

    .prologue
    .line 787
    iget-boolean v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->textAllCaps:Z

    return v0
.end method

.method public notifyDataSetChanged()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 255
    iget-object v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 257
    iget-object v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->mHeaderViews:Ljava/util/List;

    if-eqz v3, :cond_0

    .line 258
    iget-object v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->mHeaderViews:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 259
    .local v2, "view":Landroid/view/View;
    iget-object v4, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_0

    .line 264
    .end local v2    # "view":Landroid/view/View;
    :cond_0
    iget-object v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v3

    iput v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabCount:I

    .line 266
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabCount:I

    if-ge v0, v3, :cond_7

    .line 268
    iget-object v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    instance-of v3, v3, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$IconTabProvider;

    if-eqz v3, :cond_1

    .line 269
    iget-object v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    check-cast v3, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$IconTabProvider;

    invoke-interface {v3, v0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$IconTabProvider;->getPageIconResId(I)I

    move-result v3

    invoke-direct {p0, v0, v3}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->addIconTab(II)V

    .line 266
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 271
    :cond_1
    iget-object v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    instance-of v3, v3, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconUrlProvider;

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    instance-of v3, v3, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconDrawableProvider;

    if-eqz v3, :cond_3

    .line 272
    iget-object v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    check-cast v3, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconUrlProvider;

    invoke-interface {v3, v0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconUrlProvider;->getPageIconUrl(I)Ljava/lang/String;

    move-result-object v1

    .line 273
    .local v1, "url":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 274
    iget-object v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    check-cast v3, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconUrlProvider;

    invoke-direct {p0, v0, v3}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->addUrlTab(ILcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconUrlProvider;)V

    goto :goto_2

    .line 276
    :cond_2
    iget-object v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    check-cast v3, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconDrawableProvider;

    invoke-direct {p0, v0, v3}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->addDrawableTab(ILcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconDrawableProvider;)V

    goto :goto_2

    .line 279
    .end local v1    # "url":Ljava/lang/String;
    :cond_3
    iget-object v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    instance-of v3, v3, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconUrlProvider;

    if-eqz v3, :cond_4

    .line 280
    iget-object v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    check-cast v3, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconUrlProvider;

    invoke-direct {p0, v0, v3}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->addUrlTab(ILcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconUrlProvider;)V

    goto :goto_2

    .line 282
    :cond_4
    iget-object v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    instance-of v3, v3, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconDrawableProvider;

    if-eqz v3, :cond_5

    .line 283
    iget-object v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    check-cast v3, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconDrawableProvider;

    invoke-direct {p0, v0, v3}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->addDrawableTab(ILcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$TabIconDrawableProvider;)V

    goto :goto_2

    .line 285
    :cond_5
    iget-object v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    instance-of v3, v3, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$BadgeTabProvider;

    if-eqz v3, :cond_6

    .line 286
    iget-object v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/support/v4/view/PagerAdapter;->getPageTitle(I)Ljava/lang/CharSequence;

    move-result-object v4

    iget-object v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    check-cast v3, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$BadgeTabProvider;

    invoke-interface {v3, v0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$BadgeTabProvider;->getPageBadgeValue(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v0, v4, v3}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->addBadgeTextTab(ILjava/lang/CharSequence;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 289
    :cond_6
    iget-object v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/support/v4/view/PagerAdapter;->getPageTitle(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-direct {p0, v0, v3}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->addTextTab(ILjava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 294
    :cond_7
    iget-object v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->mFooterViews:Ljava/util/List;

    if-eqz v3, :cond_8

    .line 295
    iget-object v3, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->mFooterViews:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 296
    .restart local v2    # "view":Landroid/view/View;
    iget-object v4, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_3

    .line 300
    .end local v2    # "view":Landroid/view/View;
    :cond_8
    invoke-direct {p0, v5}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->updateTabStyles(Z)V

    .line 302
    iput-boolean v5, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->checkedTabWidths:Z

    .line 304
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v3

    new-instance v4, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$1;

    invoke-direct {v4, p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$1;-><init>(Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;)V

    invoke-virtual {v3, v4}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 322
    invoke-direct {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->updateExpanded()V

    .line 324
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 19
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 590
    invoke-super/range {p0 .. p1}, Landroid/widget/HorizontalScrollView;->onDraw(Landroid/graphics/Canvas;)V

    .line 592
    invoke-virtual/range {p0 .. p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->isInEditMode()Z

    move-result v1

    if-nez v1, :cond_0

    move-object/from16 v0, p0

    iget v1, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabCount:I

    if-nez v1, :cond_1

    .line 636
    :cond_0
    return-void

    .line 596
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->getHeight()I

    move-result v12

    .line 600
    .local v12, "height":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->rectPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->indicatorColor:I

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 603
    move-object/from16 v0, p0

    iget v1, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabCount:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->mHeaderCount:I

    add-int v18, v1, v3

    .line 604
    .local v18, "tabCount":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->currentPosition:I

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    .line 605
    .local v11, "currentTab":Landroid/view/View;
    if-eqz v11, :cond_0

    .line 608
    invoke-virtual {v11}, Landroid/view/View;->getLeft()I

    move-result v1

    int-to-float v2, v1

    .line 609
    .local v2, "lineLeft":F
    invoke-virtual {v11}, Landroid/view/View;->getRight()I

    move-result v1

    int-to-float v4, v1

    .line 612
    .local v4, "lineRight":F
    move-object/from16 v0, p0

    iget v1, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->currentPositionOffset:F

    const/4 v3, 0x0

    cmpl-float v1, v1, v3

    if-lez v1, :cond_2

    move-object/from16 v0, p0

    iget v1, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->currentPosition:I

    add-int/lit8 v3, v18, -0x1

    if-ge v1, v3, :cond_2

    .line 614
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->currentPosition:I

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v14

    .line 615
    .local v14, "nextTab":Landroid/view/View;
    invoke-virtual {v14}, Landroid/view/View;->getLeft()I

    move-result v1

    int-to-float v15, v1

    .line 616
    .local v15, "nextTabLeft":F
    invoke-virtual {v14}, Landroid/view/View;->getRight()I

    move-result v1

    int-to-float v0, v1

    move/from16 v16, v0

    .line 618
    .local v16, "nextTabRight":F
    move-object/from16 v0, p0

    iget v1, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->currentPositionOffset:F

    mul-float/2addr v1, v15

    const/high16 v3, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v5, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->currentPositionOffset:F

    sub-float/2addr v3, v5

    mul-float/2addr v3, v2

    add-float v2, v1, v3

    .line 619
    move-object/from16 v0, p0

    iget v1, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->currentPositionOffset:F

    mul-float v1, v1, v16

    const/high16 v3, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v5, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->currentPositionOffset:F

    sub-float/2addr v3, v5

    mul-float/2addr v3, v4

    add-float v4, v1, v3

    .line 622
    .end local v14    # "nextTab":Landroid/view/View;
    .end local v15    # "nextTabLeft":F
    .end local v16    # "nextTabRight":F
    :cond_2
    move-object/from16 v0, p0

    iget v1, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->indicatorHeight:I

    sub-int v1, v12, v1

    int-to-float v3, v1

    int-to-float v5, v12

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->rectPaint:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 626
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->rectPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->underlineColor:I

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 627
    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget v1, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->underlineHeight:I

    sub-int v1, v12, v1

    int-to-float v7, v1

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getWidth()I

    move-result v1

    int-to-float v8, v1

    int-to-float v9, v12

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->rectPaint:Landroid/graphics/Paint;

    move-object/from16 v5, p1

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 631
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerColor:I

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 632
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_0
    add-int/lit8 v1, v18, -0x1

    if-ge v13, v1, :cond_0

    .line 633
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v13}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v17

    .line 634
    .local v17, "tab":Landroid/view/View;
    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getRight()I

    move-result v1

    int-to-float v6, v1

    move-object/from16 v0, p0

    iget v1, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerPadding:I

    int-to-float v7, v1

    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getRight()I

    move-result v1

    int-to-float v8, v1

    move-object/from16 v0, p0

    iget v1, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerPadding:I

    sub-int v1, v12, v1

    int-to-float v9, v1

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerPaint:Landroid/graphics/Paint;

    move-object/from16 v5, p1

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 632
    add-int/lit8 v13, v13, 0x1

    goto :goto_0
.end method

.method protected onMeasure(II)V
    .locals 3
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 482
    invoke-super {p0, p1, p2}, Landroid/widget/HorizontalScrollView;->onMeasure(II)V

    .line 484
    iget-boolean v1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->shouldExpand:Z

    if-eqz v1, :cond_0

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    if-nez v1, :cond_1

    .line 507
    :cond_0
    :goto_0
    return-void

    .line 488
    :cond_1
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->getMeasuredWidth()I

    move-result v0

    .line 489
    .local v0, "myWidth":I
    iget-object v1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    const/high16 v2, 0x40000000    # 2.0f

    or-int/2addr v2, v0

    invoke-virtual {v1, v2, p2}, Landroid/widget/LinearLayout;->measure(II)V

    goto :goto_0
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 2
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 843
    move-object v0, p1

    check-cast v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$SavedState;

    .line 844
    .local v0, "savedState":Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$SavedState;
    invoke-virtual {v0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/widget/HorizontalScrollView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 845
    iget v1, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$SavedState;->currentPosition:I

    iput v1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->currentPosition:I

    .line 846
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->requestLayout()V

    .line 847
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .locals 3

    .prologue
    .line 851
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 852
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$SavedState;

    invoke-direct {v0, v1}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 853
    .local v0, "savedState":Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$SavedState;
    iget v2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->currentPosition:I

    iput v2, v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$SavedState;->currentPosition:I

    .line 854
    return-object v0
.end method

.method public onSizeChanged(IIII)V
    .locals 1
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "ow"    # I
    .param p4, "oh"    # I

    .prologue
    .line 560
    iget-boolean v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->shouldExpand:Z

    if-nez v0, :cond_0

    .line 561
    new-instance v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$8;

    invoke-direct {v0, p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$8;-><init>(Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;)V

    invoke-virtual {p0, v0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->post(Ljava/lang/Runnable;)Z

    .line 568
    :cond_0
    return-void
.end method

.method public setAllCaps(Z)V
    .locals 0
    .param p1, "textAllCaps"    # Z

    .prologue
    .line 791
    iput-boolean p1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->textAllCaps:Z

    .line 792
    return-void
.end method

.method public setAutoExpand(Z)V
    .locals 3
    .param p1, "autoExpand"    # Z

    .prologue
    const/4 v2, -0x1

    .line 775
    iput-boolean p1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->autoExpand:Z

    .line 776
    iget-object v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 777
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->updateTabStyles(Z)V

    .line 778
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->requestLayout()V

    .line 779
    return-void
.end method

.method public setDefaultTabLayoutParams(Landroid/widget/LinearLayout$LayoutParams;)V
    .locals 0
    .param p1, "defaultTabLayoutParams"    # Landroid/widget/LinearLayout$LayoutParams;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->defaultTabLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

    .line 89
    return-void
.end method

.method public setDividerColor(I)V
    .locals 0
    .param p1, "dividerColor"    # I

    .prologue
    .line 726
    iput p1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerColor:I

    .line 727
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->invalidate()V

    .line 728
    return-void
.end method

.method public setDividerColorResource(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 731
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerColor:I

    .line 732
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->invalidate()V

    .line 733
    return-void
.end method

.method public setDividerPadding(I)V
    .locals 0
    .param p1, "dividerPaddingPx"    # I

    .prologue
    .line 749
    iput p1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->dividerPadding:I

    .line 750
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->invalidate()V

    .line 751
    return-void
.end method

.method public setIndicatorColor(I)V
    .locals 0
    .param p1, "indicatorColor"    # I

    .prologue
    .line 689
    iput p1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->indicatorColor:I

    .line 690
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->invalidate()V

    .line 691
    return-void
.end method

.method public setIndicatorColorResource(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 694
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->indicatorColor:I

    .line 695
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->invalidate()V

    .line 696
    return-void
.end method

.method public setIndicatorHeight(I)V
    .locals 0
    .param p1, "indicatorLineHeightPx"    # I

    .prologue
    .line 703
    iput p1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->indicatorHeight:I

    .line 704
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->invalidate()V

    .line 705
    return-void
.end method

.method public setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/support/v4/view/ViewPager$OnPageChangeListener;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 243
    invoke-virtual {p0, p1}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 244
    return-void
.end method

.method public setScrollOffset(I)V
    .locals 0
    .param p1, "scrollOffsetPx"    # I

    .prologue
    .line 758
    iput p1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->scrollOffset:I

    .line 759
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->invalidate()V

    .line 760
    return-void
.end method

.method public setShouldExpand(Z)V
    .locals 3
    .param p1, "shouldExpand"    # Z

    .prologue
    const/4 v2, -0x1

    .line 767
    iput-boolean p1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->shouldExpand:Z

    .line 768
    iget-object v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 769
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->updateTabStyles(Z)V

    .line 770
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->requestLayout()V

    .line 771
    return-void
.end method

.method public setTabBackground(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 824
    iput p1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabBackgroundResId:I

    .line 825
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->updateTabStyles(Z)V

    .line 826
    return-void
.end method

.method public setTabPaddingLeftRight(I)V
    .locals 1
    .param p1, "paddingPx"    # I

    .prologue
    .line 833
    iput p1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabPadding:I

    .line 834
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->updateTabStyles(Z)V

    .line 835
    return-void
.end method

.method public setTextColor(I)V
    .locals 1
    .param p1, "textColor"    # I

    .prologue
    .line 804
    iput p1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabTextColor:I

    .line 805
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->updateTabStyles(Z)V

    .line 806
    return-void
.end method

.method public setTextColor(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1, "tabColorStateList"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabColorStateList:Landroid/content/res/ColorStateList;

    .line 61
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->updateTabStyles(Z)V

    .line 62
    return-void
.end method

.method public setTextColorResource(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 809
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabTextColor:I

    .line 810
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->updateTabStyles(Z)V

    .line 811
    return-void
.end method

.method public setTextSize(I)V
    .locals 1
    .param p1, "textSizePx"    # I

    .prologue
    .line 795
    iput p1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabTextSize:I

    .line 796
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->updateTabStyles(Z)V

    .line 797
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;I)V
    .locals 1
    .param p1, "typeface"    # Landroid/graphics/Typeface;
    .param p2, "style"    # I

    .prologue
    .line 818
    iput-object p1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabTypeface:Landroid/graphics/Typeface;

    .line 819
    iput p2, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->tabTypefaceStyle:I

    .line 820
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->updateTabStyles(Z)V

    .line 821
    return-void
.end method

.method public setUnderlineColor(I)V
    .locals 0
    .param p1, "underlineColor"    # I

    .prologue
    .line 712
    iput p1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->underlineColor:I

    .line 713
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->invalidate()V

    .line 714
    return-void
.end method

.method public setUnderlineColorResource(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 717
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->underlineColor:I

    .line 718
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->invalidate()V

    .line 719
    return-void
.end method

.method public setUnderlineHeight(I)V
    .locals 0
    .param p1, "underlineHeightPx"    # I

    .prologue
    .line 740
    iput p1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->underlineHeight:I

    .line 741
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->invalidate()V

    .line 742
    return-void
.end method

.method public setViewPager(Landroid/support/v4/view/ViewPager;)V
    .locals 2
    .param p1, "pager"    # Landroid/support/v4/view/ViewPager;

    .prologue
    .line 230
    iput-object p1, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;

    .line 232
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    if-nez v0, :cond_0

    .line 233
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "ViewPager does not have adapter instance."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 236
    :cond_0
    iget-object v0, p0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->pageListener:Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip$PageListener;

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 238
    invoke-virtual {p0}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->notifyDataSetChanged()V

    .line 239
    return-void
.end method
