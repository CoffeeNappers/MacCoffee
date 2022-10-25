.class public Lcom/my/target/nativeads/views/ContentStreamCardView;
.super Landroid/widget/LinearLayout;
.source "ContentStreamCardView.java"

# interfaces
.implements Lcom/my/target/nativeads/views/PromoCardView;


# static fields
.field private static final CTA_ID:I

.field private static final MARGIN_DP:I = 0xc

.field private static final MEDIA_ID:I


# instance fields
.field private cardClickListener:Landroid/view/View$OnClickListener;

.field private final containerLayout:Landroid/widget/RelativeLayout;

.field private final ctaButton:Landroid/widget/Button;

.field private final descriptionView:Landroid/widget/TextView;

.field private final elementClickListener:Landroid/view/View$OnClickListener;

.field private final mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

.field private final textContainerLayout:Landroid/widget/LinearLayout;

.field private final titleView:Landroid/widget/TextView;

.field private final uiUtils:Lcom/my/target/core/utils/l;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    invoke-static {}, Lcom/my/target/core/utils/l;->a()I

    move-result v0

    sput v0, Lcom/my/target/nativeads/views/ContentStreamCardView;->CTA_ID:I

    .line 26
    invoke-static {}, Lcom/my/target/core/utils/l;->a()I

    move-result v0

    sput v0, Lcom/my/target/nativeads/views/ContentStreamCardView;->MEDIA_ID:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .prologue
    .line 41
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 172
    new-instance v0, Lcom/my/target/nativeads/views/ContentStreamCardView$1;

    invoke-direct {v0, p0}, Lcom/my/target/nativeads/views/ContentStreamCardView$1;-><init>(Lcom/my/target/nativeads/views/ContentStreamCardView;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->elementClickListener:Landroid/view/View$OnClickListener;

    .line 42
    new-instance v0, Lcom/my/target/nativeads/views/MediaAdView;

    invoke-direct {v0, p1}, Lcom/my/target/nativeads/views/MediaAdView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    .line 43
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->titleView:Landroid/widget/TextView;

    .line 44
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->descriptionView:Landroid/widget/TextView;

    .line 45
    new-instance v0, Landroid/widget/RelativeLayout;

    invoke-direct {v0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->containerLayout:Landroid/widget/RelativeLayout;

    .line 46
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->ctaButton:Landroid/widget/Button;

    .line 47
    new-instance v0, Lcom/my/target/core/utils/l;

    invoke-direct {v0, p1}, Lcom/my/target/core/utils/l;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    .line 48
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->textContainerLayout:Landroid/widget/LinearLayout;

    .line 49
    invoke-direct {p0}, Lcom/my/target/nativeads/views/ContentStreamCardView;->initView()V

    .line 50
    return-void
.end method

.method static synthetic access$000(Lcom/my/target/nativeads/views/ContentStreamCardView;)Landroid/view/View$OnClickListener;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->cardClickListener:Landroid/view/View$OnClickListener;

    return-object v0
.end method

.method private initView()V
    .locals 9

    .prologue
    const/16 v5, 0x8

    const/4 v8, 0x2

    const/16 v7, 0xc

    const/4 v1, 0x0

    const/4 v6, 0x1

    .line 55
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    sget v2, Lcom/my/target/nativeads/views/ContentStreamCardView;->MEDIA_ID:I

    invoke-virtual {v0, v2}, Lcom/my/target/nativeads/views/MediaAdView;->setId(I)V

    .line 56
    invoke-virtual {p0, v6}, Lcom/my/target/nativeads/views/ContentStreamCardView;->setOrientation(I)V

    .line 58
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    invoke-virtual {v0, v5}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v0

    iget-object v2, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    .line 59
    invoke-virtual {v2, v5}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v2

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    .line 60
    invoke-virtual {v3, v5}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v3

    iget-object v4, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    .line 61
    invoke-virtual {v4, v5}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v4

    .line 58
    invoke-virtual {p0, v0, v2, v3, v4}, Lcom/my/target/nativeads/views/ContentStreamCardView;->setPadding(IIII)V

    .line 63
    invoke-virtual {p0, v6}, Lcom/my/target/nativeads/views/ContentStreamCardView;->setClickable(Z)V

    .line 65
    const v0, -0x3a1508

    invoke-static {p0, v1, v0}, Lcom/my/target/core/utils/l;->a(Landroid/view/View;II)V

    .line 67
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->containerLayout:Landroid/widget/RelativeLayout;

    const v2, -0x3a1508

    const v3, -0x333334

    iget-object v4, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    .line 71
    invoke-virtual {v4, v6}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v4

    move v5, v1

    .line 67
    invoke-static/range {v0 .. v5}, Lcom/my/target/core/utils/l;->a(Landroid/view/View;IIIII)V

    .line 74
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->ctaButton:Landroid/widget/Button;

    sget v2, Lcom/my/target/nativeads/views/ContentStreamCardView;->CTA_ID:I

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setId(I)V

    .line 75
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->ctaButton:Landroid/widget/Button;

    iget-object v2, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v2

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v3

    invoke-virtual {v0, v2, v1, v3, v1}, Landroid/widget/Button;->setPadding(IIII)V

    .line 76
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->ctaButton:Landroid/widget/Button;

    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual {v0, v8, v2}, Landroid/widget/Button;->setTextSize(IF)V

    .line 77
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v2, -0x2

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    const/16 v4, 0x1e

    .line 79
    invoke-virtual {v3, v4}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v3

    invoke-direct {v0, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 80
    const/16 v2, 0xb

    const/4 v3, -0x1

    invoke-virtual {v0, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 81
    const/16 v2, 0xf

    const/4 v3, -0x1

    invoke-virtual {v0, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 83
    iget-object v2, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    invoke-virtual {v2, v7}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v2

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    .line 84
    invoke-virtual {v3, v7}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v3

    iget-object v4, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    .line 85
    invoke-virtual {v4, v7}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v4

    iget-object v5, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    .line 86
    invoke-virtual {v5, v7}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v5

    .line 83
    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 87
    iget-object v2, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->ctaButton:Landroid/widget/Button;

    invoke-virtual {v2, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 89
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->ctaButton:Landroid/widget/Button;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 90
    const/16 v0, 0x15

    invoke-static {v0}, Lcom/my/target/core/utils/l;->c(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 91
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->ctaButton:Landroid/widget/Button;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    .line 93
    :cond_0
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->ctaButton:Landroid/widget/Button;

    const v2, -0x666667

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setTextColor(I)V

    .line 95
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    sget-object v2, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    new-array v3, v8, [I

    fill-array-data v3, :array_0

    invoke-direct {v0, v2, v3}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 98
    iget-object v2, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    invoke-virtual {v2, v6}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v2

    const v3, -0x333334

    invoke-virtual {v0, v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 99
    iget-object v2, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    invoke-virtual {v2, v6}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 101
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    sget-object v3, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    new-array v4, v8, [I

    fill-array-data v4, :array_1

    invoke-direct {v2, v3, v4}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 104
    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    invoke-virtual {v3, v6}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v3

    const v4, -0x333334

    invoke-virtual {v2, v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 105
    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    invoke-virtual {v3, v6}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 107
    new-instance v3, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 108
    new-array v4, v6, [I

    const v5, 0x10100a7

    aput v5, v4, v1

    invoke-virtual {v3, v4, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 110
    sget-object v2, Landroid/util/StateSet;->WILD_CARD:[I

    invoke-virtual {v3, v2, v0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 112
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->ctaButton:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 114
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v0, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 117
    sget v2, Lcom/my/target/nativeads/views/ContentStreamCardView;->CTA_ID:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 118
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->textContainerLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 119
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->textContainerLayout:Landroid/widget/LinearLayout;

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 120
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->textContainerLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 122
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->titleView:Landroid/widget/TextView;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 123
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->titleView:Landroid/widget/TextView;

    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v8, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 124
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->titleView:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 125
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->titleView:Landroid/widget/TextView;

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setLines(I)V

    .line 126
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->titleView:Landroid/widget/TextView;

    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 127
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->titleView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    invoke-virtual {v1, v7}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iget-object v2, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    const/4 v3, 0x6

    .line 128
    invoke-virtual {v2, v3}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v2

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    .line 129
    invoke-virtual {v3, v6}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v3

    iget-object v4, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    .line 130
    invoke-virtual {v4, v6}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v4

    .line 127
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 132
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->descriptionView:Landroid/widget/TextView;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 133
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->descriptionView:Landroid/widget/TextView;

    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v0, v8, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 134
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->descriptionView:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setLines(I)V

    .line 135
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->descriptionView:Landroid/widget/TextView;

    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 136
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->descriptionView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    invoke-virtual {v1, v7}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iget-object v2, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    .line 137
    invoke-virtual {v2, v6}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v2

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    .line 138
    invoke-virtual {v3, v6}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v3

    iget-object v4, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->uiUtils:Lcom/my/target/core/utils/l;

    .line 139
    invoke-virtual {v4, v7}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v4

    .line 136
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 141
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    invoke-virtual {p0, v0}, Lcom/my/target/nativeads/views/ContentStreamCardView;->addView(Landroid/view/View;)V

    .line 142
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->containerLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {p0, v0}, Lcom/my/target/nativeads/views/ContentStreamCardView;->addView(Landroid/view/View;)V

    .line 143
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->containerLayout:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->ctaButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 144
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->containerLayout:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->textContainerLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 145
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->textContainerLayout:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->titleView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 146
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->textContainerLayout:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->descriptionView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 147
    return-void

    .line 95
    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data

    .line 101
    :array_1
    .array-data 4
        -0x3a1508
        -0x3a1508
    .end array-data
.end method


# virtual methods
.method public getCtaButtonView()Landroid/widget/Button;
    .locals 1

    .prologue
    .line 189
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->ctaButton:Landroid/widget/Button;

    return-object v0
.end method

.method public getDescriptionTextView()Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->descriptionView:Landroid/widget/TextView;

    return-object v0
.end method

.method public getMediaAdView()Lcom/my/target/nativeads/views/MediaAdView;
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    return-object v0
.end method

.method public getTitleTextView()Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->titleView:Landroid/widget/TextView;

    return-object v0
.end method

.method public getView()Landroid/view/View;
    .locals 0

    .prologue
    .line 195
    return-object p0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .prologue
    .line 201
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 202
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    .line 204
    iget-object v2, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    invoke-virtual {v2}, Lcom/my/target/nativeads/views/MediaAdView;->getLeft()I

    move-result v2

    int-to-float v2, v2

    cmpl-float v2, v0, v2

    if-lez v2, :cond_0

    iget-object v2, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    .line 205
    invoke-virtual {v2}, Lcom/my/target/nativeads/views/MediaAdView;->getRight()I

    move-result v2

    int-to-float v2, v2

    cmpg-float v0, v0, v2

    if-gez v0, :cond_0

    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    .line 206
    invoke-virtual {v0}, Lcom/my/target/nativeads/views/MediaAdView;->getTop()I

    move-result v0

    int-to-float v0, v0

    cmpl-float v0, v1, v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    .line 207
    invoke-virtual {v0}, Lcom/my/target/nativeads/views/MediaAdView;->getBottom()I

    move-result v0

    int-to-float v0, v0

    cmpg-float v0, v1, v0

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    .line 204
    goto :goto_0
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 4

    .prologue
    .line 162
    iput-object p1, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->cardClickListener:Landroid/view/View$OnClickListener;

    .line 163
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 165
    invoke-virtual {p0}, Lcom/my/target/nativeads/views/ContentStreamCardView;->getChildCount()I

    move-result v1

    .line 166
    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    .line 168
    invoke-virtual {p0, v0}, Lcom/my/target/nativeads/views/ContentStreamCardView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamCardView;->elementClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 166
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 170
    :cond_0
    return-void
.end method
