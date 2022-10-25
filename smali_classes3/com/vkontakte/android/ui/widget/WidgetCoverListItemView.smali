.class public Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;
.super Landroid/widget/FrameLayout;
.source "WidgetCoverListItemView.java"


# instance fields
.field private final button:Landroid/widget/TextView;

.field private final content:Landroid/view/ViewGroup;

.field private final cover:Lcom/vk/imageloader/view/VKImageView;

.field private final coverAspectRation:F

.field private final description:Landroid/widget/TextView;

.field private iconSize:I

.field private item:Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;

.field private final title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 36
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 40
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyleAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 44
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 45
    invoke-static {p1}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/high16 v1, 0x40800000    # 4.0f

    :goto_0
    iput v1, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->coverAspectRation:F

    .line 47
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0301df

    invoke-static {v1, v2, p0}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 48
    .local v0, "widgetView":Landroid/view/View;
    const v1, 0x7f10000e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->content:Landroid/view/ViewGroup;

    .line 49
    const v1, 0x7f10021b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->cover:Lcom/vk/imageloader/view/VKImageView;

    .line 50
    const v1, 0x7f100128

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->title:Landroid/widget/TextView;

    .line 51
    const v1, 0x7f1001cc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->description:Landroid/widget/TextView;

    .line 52
    const v1, 0x7f10010f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->button:Landroid/widget/TextView;

    .line 54
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->button:Landroid/widget/TextView;

    new-instance v2, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView$1;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView$1;-><init>(Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    new-instance v1, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView$2;-><init>(Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;)V

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 66
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView$3;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView$3;-><init>(Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 77
    return-void

    .line 45
    .end local v0    # "widgetView":Landroid/view/View;
    :cond_0
    const/high16 v1, 0x40400000    # 3.0f

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;)Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->item:Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;)Lcom/vk/imageloader/view/VKImageView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->cover:Lcom/vk/imageloader/view/VKImageView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;

    .prologue
    .line 23
    iget v0, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->iconSize:I

    return v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;
    .param p1, "x1"    # I

    .prologue
    .line 23
    iput p1, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->iconSize:I

    return p1
.end method

.method static synthetic access$300(Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;
    .param p1, "x1"    # I

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->bindCover(I)V

    return-void
.end method

.method private bindCover(I)V
    .locals 3
    .param p1, "coverSize"    # I

    .prologue
    .line 90
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->item:Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->getCover(I)Lcom/vk/core/common/ImageSize;

    move-result-object v0

    .line 91
    .local v0, "cover":Lcom/vk/core/common/ImageSize;
    if-nez v0, :cond_0

    .line 92
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->cover:Lcom/vk/imageloader/view/VKImageView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 97
    :goto_0
    return-void

    .line 94
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->cover:Lcom/vk/imageloader/view/VKImageView;

    iget v2, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->coverAspectRation:F

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->setAspectRatio(F)V

    .line 95
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->cover:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0}, Lcom/vk/core/common/ImageSize;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static bindTextView(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
    .locals 1
    .param p0, "textView"    # Landroid/widget/TextView;
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 101
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x8

    :goto_0
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 103
    return-void

    .line 102
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static processLink(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "target"    # Ljava/lang/String;

    .prologue
    .line 106
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 107
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v0, -0x1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 116
    invoke-static {p0, p1}, Lcom/vkontakte/android/utils/LinkUtils;->processInternalHiddenLink(Landroid/content/Context;Ljava/lang/String;)V

    .line 120
    :cond_1
    :goto_1
    return-void

    .line 107
    :sswitch_0
    const-string/jumbo v2, "external"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v2, "internal"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :sswitch_2
    const-string/jumbo v2, "internal_hidden"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x3

    goto :goto_0

    .line 109
    :pswitch_0
    invoke-static {p0, p1}, Lcom/vkontakte/android/utils/LinkUtils;->processExternalLink(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1

    .line 112
    :pswitch_1
    invoke-static {p0, p1}, Lcom/vkontakte/android/utils/LinkUtils;->processInternalLink(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1

    .line 107
    :sswitch_data_0
    .sparse-switch
        -0x6c869c35 -> :sswitch_0
        -0x5c0dca94 -> :sswitch_2
        0x21ffc6bd -> :sswitch_1
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public bind(Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;Z)V
    .locals 5
    .param p1, "item"    # Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;
    .param p2, "topPadding"    # Z

    .prologue
    .line 80
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->item:Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;

    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->title:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->description:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->getDescription()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->bindTextView(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 83
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->button:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->getButton()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->bindTextView(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 84
    iget v0, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->iconSize:I

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->bindCover(I)V

    .line 85
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->content:Landroid/view/ViewGroup;

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->content:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v2

    if-eqz p2, :cond_0

    const/high16 v0, 0x41000000    # 8.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->content:Landroid/view/ViewGroup;

    .line 86
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v3

    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetCoverListItemView;->content:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v4

    .line 85
    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 87
    return-void

    .line 85
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
