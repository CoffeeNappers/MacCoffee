.class public Lcom/my/target/nativeads/views/ContentStreamAdView;
.super Landroid/widget/RelativeLayout;
.source "ContentStreamAdView.java"


# static fields
.field protected static final AD_ID:I

.field protected static final AGE_ID:I

.field protected static final COLOR_PLACEHOLDER_GRAY:I = -0x111112

.field protected static final CTA_ID:I

.field protected static final DESC_ID:I

.field protected static final ICON_ID:I

.field protected static final LABELS_ID:I

.field protected static final MEDIA_ID:I

.field protected static final RATING_ID:I

.field protected static final STARS_ID:I

.field protected static final TITLE_2_ID:I

.field protected static final TITLE_ID:I

.field protected static final URL_2_ID:I

.field protected static final URL_ID:I

.field protected static final VOTES_ID:I


# instance fields
.field protected final advertisingLabel:Landroid/widget/TextView;

.field protected advertisingLabelParams:Landroid/widget/RelativeLayout$LayoutParams;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field protected final ageRestrictionLabel:Lcom/my/target/core/ui/views/BorderedTextView;

.field protected ageRestrictionParams:Landroid/widget/RelativeLayout$LayoutParams;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field protected banner:Lcom/my/target/nativeads/banners/NativePromoBanner;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field protected final ctaButton:Landroid/widget/Button;

.field protected ctaParams:Landroid/widget/RelativeLayout$LayoutParams;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field protected final descriptionLabel:Landroid/widget/TextView;

.field protected descriptionLabelParams:Landroid/widget/RelativeLayout$LayoutParams;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field protected final disclaimerLabel:Landroid/widget/TextView;

.field protected disclaimerParams:Landroid/widget/RelativeLayout$LayoutParams;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field protected iconImageParams:Landroid/widget/RelativeLayout$LayoutParams;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field protected final iconImageView:Lcom/my/target/core/ui/views/CacheImageView;

.field protected final labelsLayout:Landroid/widget/LinearLayout;

.field protected labelsLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field protected mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field protected mediaAdViewParams:Landroid/widget/RelativeLayout$LayoutParams;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private promoCardRecyclerView:Lcom/my/target/nativeads/views/PromoCardRecyclerView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field protected final ratingLayout:Landroid/widget/LinearLayout;

.field protected ratingParams:Landroid/widget/RelativeLayout$LayoutParams;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field protected starsParams:Landroid/widget/LinearLayout$LayoutParams;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field protected final starsView:Lcom/my/target/nativeads/views/StarsRatingView;

.field protected final title2Label:Landroid/widget/TextView;

.field protected title2Params:Landroid/widget/RelativeLayout$LayoutParams;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field protected final titleLabel:Landroid/widget/TextView;

.field protected titleLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field protected final uiUtils:Lcom/my/target/core/utils/l;

.field protected final url2Label:Landroid/widget/TextView;

.field protected url2Params:Landroid/widget/RelativeLayout$LayoutParams;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field protected final urlLabel:Landroid/widget/TextView;

.field protected urlLabelParams:Landroid/widget/RelativeLayout$LayoutParams;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field protected final votesLabel:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    invoke-static {}, Lcom/my/target/core/utils/l;->a()I

    move-result v0

    sput v0, Lcom/my/target/nativeads/views/ContentStreamAdView;->AGE_ID:I

    .line 38
    invoke-static {}, Lcom/my/target/core/utils/l;->a()I

    move-result v0

    sput v0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ICON_ID:I

    .line 39
    invoke-static {}, Lcom/my/target/core/utils/l;->a()I

    move-result v0

    sput v0, Lcom/my/target/nativeads/views/ContentStreamAdView;->LABELS_ID:I

    .line 40
    invoke-static {}, Lcom/my/target/core/utils/l;->a()I

    move-result v0

    sput v0, Lcom/my/target/nativeads/views/ContentStreamAdView;->TITLE_ID:I

    .line 41
    invoke-static {}, Lcom/my/target/core/utils/l;->a()I

    move-result v0

    sput v0, Lcom/my/target/nativeads/views/ContentStreamAdView;->URL_ID:I

    .line 42
    invoke-static {}, Lcom/my/target/core/utils/l;->a()I

    move-result v0

    sput v0, Lcom/my/target/nativeads/views/ContentStreamAdView;->DESC_ID:I

    .line 43
    invoke-static {}, Lcom/my/target/core/utils/l;->a()I

    move-result v0

    sput v0, Lcom/my/target/nativeads/views/ContentStreamAdView;->AD_ID:I

    .line 44
    invoke-static {}, Lcom/my/target/core/utils/l;->a()I

    move-result v0

    sput v0, Lcom/my/target/nativeads/views/ContentStreamAdView;->MEDIA_ID:I

    .line 45
    invoke-static {}, Lcom/my/target/core/utils/l;->a()I

    move-result v0

    sput v0, Lcom/my/target/nativeads/views/ContentStreamAdView;->TITLE_2_ID:I

    .line 46
    invoke-static {}, Lcom/my/target/core/utils/l;->a()I

    move-result v0

    sput v0, Lcom/my/target/nativeads/views/ContentStreamAdView;->URL_2_ID:I

    .line 47
    invoke-static {}, Lcom/my/target/core/utils/l;->a()I

    move-result v0

    sput v0, Lcom/my/target/nativeads/views/ContentStreamAdView;->CTA_ID:I

    .line 48
    invoke-static {}, Lcom/my/target/core/utils/l;->a()I

    move-result v0

    sput v0, Lcom/my/target/nativeads/views/ContentStreamAdView;->STARS_ID:I

    .line 49
    invoke-static {}, Lcom/my/target/core/utils/l;->a()I

    move-result v0

    sput v0, Lcom/my/target/nativeads/views/ContentStreamAdView;->VOTES_ID:I

    .line 50
    invoke-static {}, Lcom/my/target/core/utils/l;->a()I

    move-result v0

    sput v0, Lcom/my/target/nativeads/views/ContentStreamAdView;->RATING_ID:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .prologue
    .line 374
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/my/target/nativeads/views/ContentStreamAdView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 375
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .prologue
    .line 379
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/my/target/nativeads/views/ContentStreamAdView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 380
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .prologue
    .line 384
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 385
    new-instance v0, Lcom/my/target/core/ui/views/BorderedTextView;

    invoke-direct {v0, p1}, Lcom/my/target/core/ui/views/BorderedTextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ageRestrictionLabel:Lcom/my/target/core/ui/views/BorderedTextView;

    .line 386
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->advertisingLabel:Landroid/widget/TextView;

    .line 387
    new-instance v0, Lcom/my/target/core/ui/views/CacheImageView;

    invoke-direct {v0, p1}, Lcom/my/target/core/ui/views/CacheImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->iconImageView:Lcom/my/target/core/ui/views/CacheImageView;

    .line 388
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->labelsLayout:Landroid/widget/LinearLayout;

    .line 389
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->titleLabel:Landroid/widget/TextView;

    .line 390
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->urlLabel:Landroid/widget/TextView;

    .line 391
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->descriptionLabel:Landroid/widget/TextView;

    .line 392
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->title2Label:Landroid/widget/TextView;

    .line 393
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->url2Label:Landroid/widget/TextView;

    .line 394
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ratingLayout:Landroid/widget/LinearLayout;

    .line 395
    new-instance v0, Lcom/my/target/nativeads/views/StarsRatingView;

    invoke-direct {v0, p1}, Lcom/my/target/nativeads/views/StarsRatingView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->starsView:Lcom/my/target/nativeads/views/StarsRatingView;

    .line 396
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->votesLabel:Landroid/widget/TextView;

    .line 397
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerLabel:Landroid/widget/TextView;

    .line 398
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ctaButton:Landroid/widget/Button;

    .line 399
    new-instance v0, Lcom/my/target/core/utils/l;

    invoke-direct {v0, p1}, Lcom/my/target/core/utils/l;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    .line 401
    invoke-virtual {p0}, Lcom/my/target/nativeads/views/ContentStreamAdView;->initView()V

    .line 402
    return-void
.end method

.method private createPromoCardAdapter(Ljava/util/List;)Lcom/my/target/nativeads/views/PromoCardRecyclerView$PromoCardAdapter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/my/target/nativeads/banners/NativePromoCard;",
            ">;)",
            "Lcom/my/target/nativeads/views/PromoCardRecyclerView$PromoCardAdapter;"
        }
    .end annotation

    .prologue
    .line 362
    new-instance v0, Lcom/my/target/nativeads/views/ContentStreamAdView$1;

    invoke-direct {v0, p0, p1}, Lcom/my/target/nativeads/views/ContentStreamAdView$1;-><init>(Lcom/my/target/nativeads/views/ContentStreamAdView;Ljava/util/List;)V

    return-object v0
.end method

.method private updateDefaultParams()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/high16 v5, -0x1000000

    const/high16 v4, 0x41600000    # 14.0f

    const/4 v3, 0x2

    const v2, -0x666667

    .line 553
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ageRestrictionLabel:Lcom/my/target/core/ui/views/BorderedTextView;

    invoke-virtual {v0, v2}, Lcom/my/target/core/ui/views/BorderedTextView;->setTextColor(I)V

    .line 554
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ageRestrictionLabel:Lcom/my/target/core/ui/views/BorderedTextView;

    invoke-virtual {v0, v6, v2}, Lcom/my/target/core/ui/views/BorderedTextView;->setBorder(II)V

    .line 555
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ageRestrictionLabel:Lcom/my/target/core/ui/views/BorderedTextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/BorderedTextView;->setBackgroundColor(I)V

    .line 557
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->advertisingLabel:Landroid/widget/TextView;

    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 558
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->advertisingLabel:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 560
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->titleLabel:Landroid/widget/TextView;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 561
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->titleLabel:Landroid/widget/TextView;

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, v3, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 562
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->titleLabel:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 564
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->urlLabel:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 565
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->urlLabel:Landroid/widget/TextView;

    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 567
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->descriptionLabel:Landroid/widget/TextView;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 568
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->descriptionLabel:Landroid/widget/TextView;

    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 570
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->title2Label:Landroid/widget/TextView;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 571
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->title2Label:Landroid/widget/TextView;

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, v3, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 572
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->title2Label:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 574
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->url2Label:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 575
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->url2Label:Landroid/widget/TextView;

    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 577
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->votesLabel:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 578
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->votesLabel:Landroid/widget/TextView;

    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 580
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerLabel:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 581
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerLabel:Landroid/widget/TextView;

    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v0, v3, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 583
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ctaButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setTextColor(I)V

    .line 584
    return-void
.end method


# virtual methods
.method public getAdvertisingTextView()Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->advertisingLabel:Landroid/widget/TextView;

    return-object v0
.end method

.method public getAgeRestrictionTextView()Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ageRestrictionLabel:Lcom/my/target/core/ui/views/BorderedTextView;

    return-object v0
.end method

.method public getCtaButtonView()Landroid/widget/Button;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ctaButton:Landroid/widget/Button;

    return-object v0
.end method

.method public getDescriptionTextView()Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 118
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->descriptionLabel:Landroid/widget/TextView;

    return-object v0
.end method

.method public getDisclaimerTextView()Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerLabel:Landroid/widget/TextView;

    return-object v0
.end method

.method public getDomainOrCategoryTextView()Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->urlLabel:Landroid/widget/TextView;

    return-object v0
.end method

.method public getIconImageView()Landroid/widget/ImageView;
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->iconImageView:Lcom/my/target/core/ui/views/CacheImageView;

    return-object v0
.end method

.method public getMediaAdView()Lcom/my/target/nativeads/views/MediaAdView;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 139
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    return-object v0
.end method

.method public getPromoCardRecyclerView()Lcom/my/target/nativeads/views/PromoCardRecyclerView;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 145
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->promoCardRecyclerView:Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    return-object v0
.end method

.method public getSecondDomainOrCategoryTextView()Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->url2Label:Landroid/widget/TextView;

    return-object v0
.end method

.method public getSecondTitleTextView()Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->title2Label:Landroid/widget/TextView;

    return-object v0
.end method

.method public getStarsRatingView()Lcom/my/target/nativeads/views/StarsRatingView;
    .locals 1

    .prologue
    .line 160
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->starsView:Lcom/my/target/nativeads/views/StarsRatingView;

    return-object v0
.end method

.method public getTitleTextView()Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->titleLabel:Landroid/widget/TextView;

    return-object v0
.end method

.method public getVotesTextView()Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->votesLabel:Landroid/widget/TextView;

    return-object v0
.end method

.method public initView()V
    .locals 10

    .prologue
    const/16 v9, 0x9

    const/4 v8, 0x3

    const/4 v7, 0x0

    const/4 v6, 0x1

    const/4 v5, -0x2

    .line 406
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    const/16 v1, 0xc

    invoke-virtual {v0, v1}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v0

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    const/16 v2, 0xc

    .line 407
    invoke-virtual {v1, v2}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iget-object v2, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    const/16 v3, 0xc

    .line 408
    invoke-virtual {v2, v3}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v2

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    const/16 v4, 0xc

    .line 409
    invoke-virtual {v3, v4}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v3

    .line 406
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/my/target/nativeads/views/ContentStreamAdView;->setPadding(IIII)V

    .line 412
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ageRestrictionLabel:Lcom/my/target/core/ui/views/BorderedTextView;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->AGE_ID:I

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/BorderedTextView;->setId(I)V

    .line 413
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ageRestrictionLabel:Lcom/my/target/core/ui/views/BorderedTextView;

    const v1, -0x777778

    invoke-virtual {v0, v6, v1}, Lcom/my/target/core/ui/views/BorderedTextView;->setBorder(II)V

    .line 414
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ageRestrictionLabel:Lcom/my/target/core/ui/views/BorderedTextView;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    invoke-virtual {v0, v1, v7, v7, v7}, Lcom/my/target/core/ui/views/BorderedTextView;->setPadding(IIII)V

    .line 415
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v5, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ageRestrictionParams:Landroid/widget/RelativeLayout$LayoutParams;

    .line 417
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ageRestrictionParams:Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    invoke-virtual {v1, v9}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    .line 418
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ageRestrictionLabel:Lcom/my/target/core/ui/views/BorderedTextView;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ageRestrictionParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/BorderedTextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 420
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->advertisingLabel:Landroid/widget/TextView;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->AD_ID:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setId(I)V

    .line 421
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v5, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->advertisingLabelParams:Landroid/widget/RelativeLayout$LayoutParams;

    .line 423
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->advertisingLabelParams:Landroid/widget/RelativeLayout$LayoutParams;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->AGE_ID:I

    invoke-virtual {v0, v6, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 424
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->advertisingLabel:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->advertisingLabelParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 427
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->iconImageView:Lcom/my/target/core/ui/views/CacheImageView;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->ICON_ID:I

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/CacheImageView;->setId(I)V

    .line 428
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    const/16 v2, 0x36

    invoke-virtual {v1, v2}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iget-object v2, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    const/16 v3, 0x36

    invoke-virtual {v2, v3}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->iconImageParams:Landroid/widget/RelativeLayout$LayoutParams;

    .line 429
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->iconImageParams:Landroid/widget/RelativeLayout$LayoutParams;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->AD_ID:I

    invoke-virtual {v0, v8, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 430
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->iconImageParams:Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    invoke-virtual {v1, v9}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 431
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->iconImageView:Lcom/my/target/core/ui/views/CacheImageView;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->iconImageParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/CacheImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 434
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->labelsLayout:Landroid/widget/LinearLayout;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->LABELS_ID:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setId(I)V

    .line 435
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->labelsLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 436
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->labelsLayout:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    const/16 v2, 0x36

    invoke-virtual {v1, v2}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 437
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->labelsLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    .line 439
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->labelsLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->AD_ID:I

    invoke-virtual {v0, v8, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 440
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->labelsLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->ICON_ID:I

    invoke-virtual {v0, v6, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 441
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->labelsLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    invoke-virtual {v1, v9}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 442
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->labelsLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    invoke-virtual {v1, v8}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 443
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->labelsLayout:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->labelsLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 445
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->titleLabel:Landroid/widget/TextView;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->TITLE_ID:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setId(I)V

    .line 446
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v5, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->titleLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    .line 448
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->titleLabel:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->titleLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 450
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->urlLabel:Landroid/widget/TextView;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->URL_ID:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setId(I)V

    .line 451
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v5, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->urlLabelParams:Landroid/widget/RelativeLayout$LayoutParams;

    .line 453
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->urlLabelParams:Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    invoke-virtual {v1, v9}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 454
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->urlLabel:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->urlLabelParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 456
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->descriptionLabel:Landroid/widget/TextView;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->DESC_ID:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setId(I)V

    .line 457
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v5, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->descriptionLabelParams:Landroid/widget/RelativeLayout$LayoutParams;

    .line 459
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->descriptionLabelParams:Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    invoke-virtual {v1, v9}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 460
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->descriptionLabel:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->descriptionLabelParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 463
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->title2Label:Landroid/widget/TextView;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->TITLE_2_ID:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setId(I)V

    .line 464
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v5, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->title2Params:Landroid/widget/RelativeLayout$LayoutParams;

    .line 466
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->title2Params:Landroid/widget/RelativeLayout$LayoutParams;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->MEDIA_ID:I

    invoke-virtual {v0, v8, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 467
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->title2Params:Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    invoke-virtual {v1, v9}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 468
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->title2Label:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->title2Params:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 470
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->url2Label:Landroid/widget/TextView;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->URL_2_ID:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setId(I)V

    .line 471
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v5, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->url2Params:Landroid/widget/RelativeLayout$LayoutParams;

    .line 473
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->url2Params:Landroid/widget/RelativeLayout$LayoutParams;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->TITLE_2_ID:I

    invoke-virtual {v0, v8, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 474
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->url2Label:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->url2Params:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 476
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ratingLayout:Landroid/widget/LinearLayout;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->RATING_ID:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setId(I)V

    .line 477
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ratingLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 478
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v5, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ratingParams:Landroid/widget/RelativeLayout$LayoutParams;

    .line 480
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ratingParams:Landroid/widget/RelativeLayout$LayoutParams;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->TITLE_2_ID:I

    invoke-virtual {v0, v8, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 481
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ratingLayout:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ratingParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 483
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->starsView:Lcom/my/target/nativeads/views/StarsRatingView;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->STARS_ID:I

    invoke-virtual {v0, v1}, Lcom/my/target/nativeads/views/StarsRatingView;->setId(I)V

    .line 484
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    const/16 v2, 0x49

    invoke-virtual {v1, v2}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iget-object v2, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    const/16 v3, 0xc

    .line 485
    invoke-virtual {v2, v3}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->starsParams:Landroid/widget/LinearLayout$LayoutParams;

    .line 486
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->starsParams:Landroid/widget/LinearLayout$LayoutParams;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 487
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->starsView:Lcom/my/target/nativeads/views/StarsRatingView;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->starsParams:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v0, v1}, Lcom/my/target/nativeads/views/StarsRatingView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 489
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->votesLabel:Landroid/widget/TextView;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->VOTES_ID:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setId(I)V

    .line 491
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v5, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerParams:Landroid/widget/RelativeLayout$LayoutParams;

    .line 493
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerParams:Landroid/widget/RelativeLayout$LayoutParams;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->RATING_ID:I

    invoke-virtual {v0, v8, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 494
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerLabel:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 496
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ctaButton:Landroid/widget/Button;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->CTA_ID:I

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setId(I)V

    .line 497
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ctaButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    iget-object v2, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v2

    invoke-virtual {v0, v1, v7, v2, v7}, Landroid/widget/Button;->setPadding(IIII)V

    .line 498
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    const/16 v2, 0x1e

    invoke-virtual {v1, v2}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    invoke-direct {v0, v5, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ctaParams:Landroid/widget/RelativeLayout$LayoutParams;

    .line 499
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ctaParams:Landroid/widget/RelativeLayout$LayoutParams;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->TITLE_2_ID:I

    invoke-virtual {v0, v8, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 500
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ctaParams:Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 501
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ctaButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ctaParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 502
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ctaButton:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 504
    const v0, -0x3a1508

    invoke-static {p0, v7, v0}, Lcom/my/target/core/utils/l;->a(Landroid/view/View;II)V

    .line 506
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const/4 v2, 0x2

    new-array v2, v2, [I

    fill-array-data v2, :array_0

    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 509
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    invoke-virtual {v1, v6}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    const v2, -0x333334

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 510
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    invoke-virtual {v1, v6}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 512
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    sget-object v2, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const/4 v3, 0x2

    new-array v3, v3, [I

    fill-array-data v3, :array_1

    invoke-direct {v1, v2, v3}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 515
    iget-object v2, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    invoke-virtual {v2, v6}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v2

    const v3, -0x333334

    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 516
    iget-object v2, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    invoke-virtual {v2, v6}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 518
    new-instance v2, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 519
    new-array v3, v6, [I

    const v4, 0x10100a7

    aput v4, v3, v7

    invoke-virtual {v2, v3, v1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 521
    sget-object v1, Landroid/util/StateSet;->WILD_CARD:[I

    invoke-virtual {v2, v1, v0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 523
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ctaButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 525
    invoke-virtual {p0, v6}, Lcom/my/target/nativeads/views/ContentStreamAdView;->setClickable(Z)V

    .line 528
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ageRestrictionLabel:Lcom/my/target/core/ui/views/BorderedTextView;

    invoke-virtual {p0, v0}, Lcom/my/target/nativeads/views/ContentStreamAdView;->addView(Landroid/view/View;)V

    .line 529
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->advertisingLabel:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Lcom/my/target/nativeads/views/ContentStreamAdView;->addView(Landroid/view/View;)V

    .line 530
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->iconImageView:Lcom/my/target/core/ui/views/CacheImageView;

    invoke-virtual {p0, v0}, Lcom/my/target/nativeads/views/ContentStreamAdView;->addView(Landroid/view/View;)V

    .line 531
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->labelsLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0}, Lcom/my/target/nativeads/views/ContentStreamAdView;->addView(Landroid/view/View;)V

    .line 533
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->labelsLayout:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->titleLabel:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 534
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->labelsLayout:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->urlLabel:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 535
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->labelsLayout:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->descriptionLabel:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 537
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->title2Label:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Lcom/my/target/nativeads/views/ContentStreamAdView;->addView(Landroid/view/View;)V

    .line 538
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->url2Label:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Lcom/my/target/nativeads/views/ContentStreamAdView;->addView(Landroid/view/View;)V

    .line 539
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ctaButton:Landroid/widget/Button;

    invoke-virtual {p0, v0}, Lcom/my/target/nativeads/views/ContentStreamAdView;->addView(Landroid/view/View;)V

    .line 540
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ratingLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0}, Lcom/my/target/nativeads/views/ContentStreamAdView;->addView(Landroid/view/View;)V

    .line 541
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerLabel:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Lcom/my/target/nativeads/views/ContentStreamAdView;->addView(Landroid/view/View;)V

    .line 543
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ratingLayout:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->starsView:Lcom/my/target/nativeads/views/StarsRatingView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 544
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ratingLayout:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->votesLabel:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 546
    invoke-direct {p0}, Lcom/my/target/nativeads/views/ContentStreamAdView;->updateDefaultParams()V

    .line 547
    return-void

    .line 506
    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data

    .line 512
    :array_1
    .array-data 4
        -0x3a1508
        -0x3a1508
    .end array-data
.end method

.method public loadImages()V
    .locals 3

    .prologue
    .line 627
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->banner:Lcom/my/target/nativeads/banners/NativePromoBanner;

    if-nez v0, :cond_1

    .line 644
    :cond_0
    :goto_0
    return-void

    .line 629
    :cond_1
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->banner:Lcom/my/target/nativeads/banners/NativePromoBanner;

    invoke-interface {v0}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getIcon()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 630
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->banner:Lcom/my/target/nativeads/banners/NativePromoBanner;

    invoke-interface {v0}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getIcon()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/nativeads/models/ImageData;->getData()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_4

    .line 631
    invoke-static {}, Lcom/my/target/core/net/b;->a()Lcom/my/target/core/net/b;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->banner:Lcom/my/target/nativeads/banners/NativePromoBanner;

    invoke-interface {v1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getIcon()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v1

    iget-object v2, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->iconImageView:Lcom/my/target/core/ui/views/CacheImageView;

    invoke-virtual {v0, v1, v2}, Lcom/my/target/core/net/b;->a(Lcom/my/target/nativeads/models/ImageData;Landroid/widget/ImageView;)V

    .line 634
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->banner:Lcom/my/target/nativeads/banners/NativePromoBanner;

    invoke-interface {v0}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getImage()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    if-eqz v0, :cond_3

    .line 635
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->banner:Lcom/my/target/nativeads/banners/NativePromoBanner;

    invoke-interface {v0}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getImage()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/nativeads/models/ImageData;->getData()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_5

    .line 636
    invoke-static {}, Lcom/my/target/core/net/b;->a()Lcom/my/target/core/net/b;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->banner:Lcom/my/target/nativeads/banners/NativePromoBanner;

    .line 637
    invoke-interface {v1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getImage()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v1

    iget-object v2, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    invoke-virtual {v2}, Lcom/my/target/nativeads/views/MediaAdView;->getImageView()Lcom/my/target/core/ui/views/CacheImageView;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/my/target/core/net/b;->a(Lcom/my/target/nativeads/models/ImageData;Landroid/widget/ImageView;)V

    .line 640
    :cond_3
    :goto_2
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->banner:Lcom/my/target/nativeads/banners/NativePromoBanner;

    invoke-interface {v0}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getCards()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->promoCardRecyclerView:Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    if-eqz v0, :cond_0

    .line 642
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->promoCardRecyclerView:Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    invoke-virtual {v0}, Lcom/my/target/nativeads/views/PromoCardRecyclerView;->loadImages()V

    goto :goto_0

    .line 632
    :cond_4
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->iconImageView:Lcom/my/target/core/ui/views/CacheImageView;

    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->banner:Lcom/my/target/nativeads/banners/NativePromoBanner;

    invoke-interface {v0}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getIcon()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/nativeads/models/ImageData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-virtual {v1, v0}, Lcom/my/target/core/ui/views/CacheImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_1

    .line 638
    :cond_5
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    invoke-virtual {v0}, Lcom/my/target/nativeads/views/MediaAdView;->getImageView()Lcom/my/target/core/ui/views/CacheImageView;

    move-result-object v1

    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->banner:Lcom/my/target/nativeads/banners/NativePromoBanner;

    invoke-interface {v0}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getImage()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/nativeads/models/ImageData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-virtual {v1, v0}, Lcom/my/target/core/ui/views/CacheImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_2
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 589
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    .line 590
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    .line 592
    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ctaButton:Landroid/widget/Button;

    invoke-virtual {v3}, Landroid/widget/Button;->getLeft()I

    move-result v3

    int-to-float v3, v3

    cmpl-float v3, v1, v3

    if-lez v3, :cond_1

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ctaButton:Landroid/widget/Button;

    .line 593
    invoke-virtual {v3}, Landroid/widget/Button;->getRight()I

    move-result v3

    int-to-float v3, v3

    cmpg-float v3, v1, v3

    if-gez v3, :cond_1

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ctaButton:Landroid/widget/Button;

    .line 594
    invoke-virtual {v3}, Landroid/widget/Button;->getTop()I

    move-result v3

    int-to-float v3, v3

    cmpl-float v3, v2, v3

    if-lez v3, :cond_1

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ctaButton:Landroid/widget/Button;

    .line 595
    invoke-virtual {v3}, Landroid/widget/Button;->getBottom()I

    move-result v3

    int-to-float v3, v3

    cmpg-float v3, v2, v3

    if-gez v3, :cond_1

    .line 622
    :cond_0
    :goto_0
    return v0

    .line 601
    :cond_1
    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->banner:Lcom/my/target/nativeads/banners/NativePromoBanner;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->banner:Lcom/my/target/nativeads/banners/NativePromoBanner;

    .line 602
    invoke-interface {v3}, Lcom/my/target/nativeads/banners/NativePromoBanner;->hasVideo()Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    .line 603
    invoke-virtual {v3}, Lcom/my/target/nativeads/views/MediaAdView;->getLeft()I

    move-result v3

    int-to-float v3, v3

    cmpl-float v3, v1, v3

    if-lez v3, :cond_2

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    .line 604
    invoke-virtual {v3}, Lcom/my/target/nativeads/views/MediaAdView;->getRight()I

    move-result v3

    int-to-float v3, v3

    cmpg-float v3, v1, v3

    if-gez v3, :cond_2

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    .line 605
    invoke-virtual {v3}, Lcom/my/target/nativeads/views/MediaAdView;->getTop()I

    move-result v3

    int-to-float v3, v3

    cmpl-float v3, v2, v3

    if-lez v3, :cond_2

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    .line 606
    invoke-virtual {v3}, Lcom/my/target/nativeads/views/MediaAdView;->getBottom()I

    move-result v3

    int-to-float v3, v3

    cmpg-float v3, v2, v3

    if-ltz v3, :cond_0

    .line 612
    :cond_2
    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->promoCardRecyclerView:Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->banner:Lcom/my/target/nativeads/banners/NativePromoBanner;

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->banner:Lcom/my/target/nativeads/banners/NativePromoBanner;

    .line 613
    invoke-interface {v3}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getCards()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->promoCardRecyclerView:Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    .line 614
    invoke-virtual {v3}, Lcom/my/target/nativeads/views/PromoCardRecyclerView;->getLeft()I

    move-result v3

    int-to-float v3, v3

    cmpl-float v3, v1, v3

    if-lez v3, :cond_3

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->promoCardRecyclerView:Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    .line 615
    invoke-virtual {v3}, Lcom/my/target/nativeads/views/PromoCardRecyclerView;->getRight()I

    move-result v3

    int-to-float v3, v3

    cmpg-float v1, v1, v3

    if-gez v1, :cond_3

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->promoCardRecyclerView:Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    .line 616
    invoke-virtual {v1}, Lcom/my/target/nativeads/views/PromoCardRecyclerView;->getTop()I

    move-result v1

    int-to-float v1, v1

    cmpl-float v1, v2, v1

    if-lez v1, :cond_3

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->promoCardRecyclerView:Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    .line 617
    invoke-virtual {v1}, Lcom/my/target/nativeads/views/PromoCardRecyclerView;->getBottom()I

    move-result v1

    int-to-float v1, v1

    cmpg-float v1, v2, v1

    if-ltz v1, :cond_0

    .line 622
    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public setupView(Lcom/my/target/nativeads/banners/NativePromoBanner;)V
    .locals 10

    .prologue
    const/4 v9, 0x3

    const/4 v8, -0x1

    const/4 v2, 0x0

    const/4 v7, -0x2

    const/16 v6, 0x8

    .line 175
    iput-object p1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->banner:Lcom/my/target/nativeads/banners/NativePromoBanner;

    .line 176
    const-string/jumbo v0, "Setup banner"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 179
    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getCards()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    const/4 v0, 0x1

    move v1, v0

    .line 180
    :goto_0
    if-eqz v1, :cond_6

    .line 182
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->title2Label:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 183
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->url2Label:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 184
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ctaButton:Landroid/widget/Button;

    invoke-virtual {v0, v6}, Landroid/widget/Button;->setVisibility(I)V

    .line 185
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ratingLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 186
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerLabel:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 188
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    if-eqz v0, :cond_0

    .line 190
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    invoke-virtual {v0}, Lcom/my/target/nativeads/views/MediaAdView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 192
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    invoke-virtual {v0}, Lcom/my/target/nativeads/views/MediaAdView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    .line 193
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 194
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    .line 198
    :cond_0
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->promoCardRecyclerView:Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    if-nez v0, :cond_1

    .line 200
    invoke-virtual {p0}, Lcom/my/target/nativeads/views/ContentStreamAdView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/nativeads/factories/NativeViewsFactory;->getPromoCardRecyclerView(Landroid/content/Context;)Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    move-result-object v0

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->promoCardRecyclerView:Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    .line 201
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->promoCardRecyclerView:Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    sget v3, Lcom/my/target/nativeads/views/ContentStreamAdView;->MEDIA_ID:I

    invoke-virtual {v0, v3}, Lcom/my/target/nativeads/views/PromoCardRecyclerView;->setId(I)V

    .line 202
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdViewParams:Landroid/widget/RelativeLayout$LayoutParams;

    .line 204
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdViewParams:Landroid/widget/RelativeLayout$LayoutParams;

    sget v3, Lcom/my/target/nativeads/views/ContentStreamAdView;->LABELS_ID:I

    invoke-virtual {v0, v9, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 205
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdViewParams:Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    const/16 v4, 0x9

    invoke-virtual {v3, v4}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v3

    iput v3, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 206
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->promoCardRecyclerView:Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdViewParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v3}, Lcom/my/target/nativeads/views/PromoCardRecyclerView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 208
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->promoCardRecyclerView:Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getCards()Ljava/util/List;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/my/target/nativeads/views/ContentStreamAdView;->createPromoCardAdapter(Ljava/util/List;)Lcom/my/target/nativeads/views/PromoCardRecyclerView$PromoCardAdapter;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/my/target/nativeads/views/PromoCardRecyclerView;->setPromoCardAdapter(Lcom/my/target/nativeads/views/PromoCardRecyclerView$PromoCardAdapter;)V

    .line 211
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->promoCardRecyclerView:Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    invoke-virtual {p0, v0}, Lcom/my/target/nativeads/views/ContentStreamAdView;->addView(Landroid/view/View;)V

    .line 239
    :cond_1
    :goto_1
    const-string/jumbo v0, "web"

    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getNavigationType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 241
    if-nez v1, :cond_2

    .line 243
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->url2Label:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 244
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ratingLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 245
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->urlLabel:Landroid/widget/TextView;

    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getDomain()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 247
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->url2Label:Landroid/widget/TextView;

    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getDomain()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 248
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v7, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerParams:Landroid/widget/RelativeLayout$LayoutParams;

    .line 250
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerParams:Landroid/widget/RelativeLayout$LayoutParams;

    sget v1, Lcom/my/target/nativeads/views/ContentStreamAdView;->URL_2_ID:I

    invoke-virtual {v0, v9, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 251
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerLabel:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 314
    :cond_2
    :goto_2
    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getDisclaimer()Ljava/lang/String;

    move-result-object v0

    .line 316
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_e

    .line 318
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerLabel:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 324
    :goto_3
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    if-eqz v0, :cond_3

    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getImage()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 326
    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getImage()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/nativeads/models/ImageData;->getData()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 328
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    invoke-virtual {v0}, Lcom/my/target/nativeads/views/MediaAdView;->getImageView()Lcom/my/target/core/ui/views/CacheImageView;

    move-result-object v1

    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getImage()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/nativeads/models/ImageData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-virtual {v1, v0}, Lcom/my/target/core/ui/views/CacheImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 336
    :cond_3
    :goto_4
    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getIcon()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 338
    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getIcon()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/nativeads/models/ImageData;->getData()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_10

    .line 340
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->iconImageView:Lcom/my/target/core/ui/views/CacheImageView;

    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getIcon()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/nativeads/models/ImageData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-virtual {v1, v0}, Lcom/my/target/core/ui/views/CacheImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 349
    :cond_4
    :goto_5
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->titleLabel:Landroid/widget/TextView;

    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 350
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->descriptionLabel:Landroid/widget/TextView;

    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getDescription()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 351
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->advertisingLabel:Landroid/widget/TextView;

    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getAdvertisingLabel()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 352
    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getAgeRestrictions()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_11

    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getAgeRestrictions()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11

    .line 353
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ageRestrictionLabel:Lcom/my/target/core/ui/views/BorderedTextView;

    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getAgeRestrictions()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/BorderedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 355
    :goto_6
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ctaButton:Landroid/widget/Button;

    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getCtaText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 356
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->title2Label:Landroid/widget/TextView;

    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 357
    return-void

    :cond_5
    move v1, v2

    .line 179
    goto/16 :goto_0

    .line 215
    :cond_6
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->promoCardRecyclerView:Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    if-eqz v0, :cond_7

    .line 217
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->promoCardRecyclerView:Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    invoke-virtual {v0}, Lcom/my/target/nativeads/views/PromoCardRecyclerView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 219
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->promoCardRecyclerView:Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    invoke-virtual {v0}, Lcom/my/target/nativeads/views/PromoCardRecyclerView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->promoCardRecyclerView:Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    .line 220
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 221
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->promoCardRecyclerView:Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    .line 225
    :cond_7
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    if-nez v0, :cond_1

    .line 227
    invoke-virtual {p0}, Lcom/my/target/nativeads/views/ContentStreamAdView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/nativeads/factories/NativeViewsFactory;->getMediaAdView(Landroid/content/Context;)Lcom/my/target/nativeads/views/MediaAdView;

    move-result-object v0

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    .line 228
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    sget v3, Lcom/my/target/nativeads/views/ContentStreamAdView;->MEDIA_ID:I

    invoke-virtual {v0, v3}, Lcom/my/target/nativeads/views/MediaAdView;->setId(I)V

    .line 229
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v8, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdViewParams:Landroid/widget/RelativeLayout$LayoutParams;

    .line 231
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdViewParams:Landroid/widget/RelativeLayout$LayoutParams;

    sget v3, Lcom/my/target/nativeads/views/ContentStreamAdView;->LABELS_ID:I

    invoke-virtual {v0, v9, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 232
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdViewParams:Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    const/16 v4, 0x9

    invoke-virtual {v3, v4}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v3

    iput v3, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 233
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    iget-object v3, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdViewParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v3}, Lcom/my/target/nativeads/views/MediaAdView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 234
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    invoke-virtual {p0, v0}, Lcom/my/target/nativeads/views/ContentStreamAdView;->addView(Landroid/view/View;)V

    goto/16 :goto_1

    .line 253
    :cond_8
    const-string/jumbo v0, "store"

    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getNavigationType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 255
    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getCategory()Ljava/lang/String;

    move-result-object v3

    .line 256
    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getSubcategory()Ljava/lang/String;

    move-result-object v4

    .line 258
    const-string/jumbo v0, ""

    .line 260
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_9

    .line 262
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 265
    :cond_9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_a

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_a

    .line 267
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v3, ", "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 270
    :cond_a
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_b

    .line 272
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 275
    :cond_b
    if-nez v1, :cond_c

    .line 277
    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getRating()F

    move-result v1

    const/4 v3, 0x0

    cmpl-float v1, v1, v3

    if-lez v1, :cond_d

    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getRating()F

    move-result v1

    const/high16 v3, 0x40a00000    # 5.0f

    cmpg-float v1, v1, v3

    if-gtz v1, :cond_d

    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getVotes()I

    move-result v1

    if-lez v1, :cond_d

    .line 279
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->url2Label:Landroid/widget/TextView;

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 280
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ratingLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 282
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->urlLabel:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 283
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->starsView:Lcom/my/target/nativeads/views/StarsRatingView;

    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getRating()F

    move-result v3

    invoke-virtual {v1, v3}, Lcom/my/target/nativeads/views/StarsRatingView;->setRating(F)V

    .line 284
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->votesLabel:Landroid/widget/TextView;

    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getVotes()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 286
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v7, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerParams:Landroid/widget/RelativeLayout$LayoutParams;

    .line 288
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerParams:Landroid/widget/RelativeLayout$LayoutParams;

    sget v3, Lcom/my/target/nativeads/views/ContentStreamAdView;->RATING_ID:I

    invoke-virtual {v1, v9, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 289
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerParams:Landroid/widget/RelativeLayout$LayoutParams;

    sget v3, Lcom/my/target/nativeads/views/ContentStreamAdView;->CTA_ID:I

    invoke-virtual {v1, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 290
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerParams:Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v2, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v2

    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    .line 291
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerParams:Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v2, 0x9

    invoke-virtual {v1, v2, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 292
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerLabel:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 311
    :cond_c
    :goto_7
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->urlLabel:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 295
    :cond_d
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->url2Label:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 296
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ratingLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 298
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->url2Label:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 300
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v7, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerParams:Landroid/widget/RelativeLayout$LayoutParams;

    .line 303
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerParams:Landroid/widget/RelativeLayout$LayoutParams;

    sget v3, Lcom/my/target/nativeads/views/ContentStreamAdView;->URL_2_ID:I

    invoke-virtual {v1, v9, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 304
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerParams:Landroid/widget/RelativeLayout$LayoutParams;

    sget v3, Lcom/my/target/nativeads/views/ContentStreamAdView;->CTA_ID:I

    invoke-virtual {v1, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 305
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerParams:Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v2, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->uiUtils:Lcom/my/target/core/utils/l;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v2

    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    .line 306
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerParams:Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v2, 0x9

    invoke-virtual {v1, v2, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 307
    iget-object v1, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerLabel:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_7

    .line 321
    :cond_e
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->disclaimerLabel:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_3

    .line 331
    :cond_f
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->mediaAdView:Lcom/my/target/nativeads/views/MediaAdView;

    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getImage()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/my/target/nativeads/models/ImageData;->getWidth()I

    move-result v1

    .line 332
    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getImage()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v2

    invoke-virtual {v2}, Lcom/my/target/nativeads/models/ImageData;->getHeight()I

    move-result v2

    .line 331
    invoke-virtual {v0, v1, v2}, Lcom/my/target/nativeads/views/MediaAdView;->setPlaceHolderDimension(II)V

    goto/16 :goto_4

    .line 343
    :cond_10
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->iconImageView:Lcom/my/target/core/ui/views/CacheImageView;

    const v1, -0x111112

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/CacheImageView;->setBackgroundColor(I)V

    .line 344
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->iconImageView:Lcom/my/target/core/ui/views/CacheImageView;

    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getIcon()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/my/target/nativeads/models/ImageData;->getWidth()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/CacheImageView;->setPlaceholderWidth(I)V

    .line 345
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->iconImageView:Lcom/my/target/core/ui/views/CacheImageView;

    invoke-interface {p1}, Lcom/my/target/nativeads/banners/NativePromoBanner;->getIcon()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/my/target/nativeads/models/ImageData;->getHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/CacheImageView;->setPlaceholderHeight(I)V

    goto/16 :goto_5

    .line 354
    :cond_11
    iget-object v0, p0, Lcom/my/target/nativeads/views/ContentStreamAdView;->ageRestrictionLabel:Lcom/my/target/core/ui/views/BorderedTextView;

    invoke-virtual {v0, v6}, Lcom/my/target/core/ui/views/BorderedTextView;->setVisibility(I)V

    goto/16 :goto_6
.end method
