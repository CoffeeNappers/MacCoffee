.class public Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;
.super Landroid/widget/LinearLayout;
.source "WidgetTilesItemView.java"


# static fields
.field private static final iconSize:I

.field static final padding:I


# instance fields
.field private final button:Landroid/widget/TextView;

.field private final description:Landroid/widget/TextView;

.field private final icon:Lcom/vk/imageloader/view/VKImageView;

.field private item:Lcom/vkontakte/android/api/widget/WidgetTiles$Item;

.field private final title:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const/high16 v0, 0x40c00000    # 6.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->padding:I

    .line 24
    const/high16 v0, 0x43040000    # 132.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->iconSize:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 34
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 35
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
    .line 38
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 6
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
    .line 42
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 44
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0301e4

    invoke-static {v2, v3, p0}, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 45
    .local v1, "widgetView":Landroid/view/View;
    const v2, 0x7f100127

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vk/imageloader/view/VKImageView;

    iput-object v2, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->icon:Lcom/vk/imageloader/view/VKImageView;

    .line 46
    const v2, 0x7f100128

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->title:Landroid/widget/TextView;

    .line 47
    const v2, 0x7f1001cc

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->description:Landroid/widget/TextView;

    .line 48
    const v2, 0x7f10010f

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->button:Landroid/widget/TextView;

    .line 49
    const v2, 0x7f10000e

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 50
    .local v0, "content":Landroid/view/ViewGroup;
    sget v2, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->padding:I

    const/4 v3, 0x0

    sget v4, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->padding:I

    sget v5, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->padding:I

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 52
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->button:Landroid/widget/TextView;

    new-instance v3, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView$1;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView$1;-><init>(Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 58
    new-instance v2, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView$2;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView$2;-><init>(Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;)V

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 64
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;)Lcom/vkontakte/android/api/widget/WidgetTiles$Item;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->item:Lcom/vkontakte/android/api/widget/WidgetTiles$Item;

    return-object v0
.end method

.method private bindCover(I)V
    .locals 4
    .param p1, "coverSize"    # I

    .prologue
    .line 75
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->item:Lcom/vkontakte/android/api/widget/WidgetTiles$Item;

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/api/widget/WidgetTiles$Item;->getIcon(I)Lcom/vk/core/common/ImageSize;

    move-result-object v0

    .line 76
    .local v0, "icon":Lcom/vk/core/common/ImageSize;
    if-nez v0, :cond_0

    .line 77
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->icon:Lcom/vk/imageloader/view/VKImageView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 82
    :goto_0
    return-void

    .line 79
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->icon:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0}, Lcom/vk/core/common/ImageSize;->getWidth()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0}, Lcom/vk/core/common/ImageSize;->getHeight()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1, v2, v3}, Lcom/vk/imageloader/view/VKImageView;->setAspectRatio(FF)V

    .line 80
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->icon:Lcom/vk/imageloader/view/VKImageView;

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
    .line 86
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x8

    :goto_0
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 88
    return-void

    .line 87
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
    .line 91
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 92
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v0, -0x1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 101
    invoke-static {p0, p1}, Lcom/vkontakte/android/utils/LinkUtils;->processInternalHiddenLink(Landroid/content/Context;Ljava/lang/String;)V

    .line 105
    :cond_1
    :goto_1
    return-void

    .line 92
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

    .line 94
    :pswitch_0
    invoke-static {p0, p1}, Lcom/vkontakte/android/utils/LinkUtils;->processExternalLink(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1

    .line 97
    :pswitch_1
    invoke-static {p0, p1}, Lcom/vkontakte/android/utils/LinkUtils;->processInternalLink(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1

    .line 92
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
.method public bind(Lcom/vkontakte/android/api/widget/WidgetTiles$Item;)V
    .locals 2
    .param p1, "item"    # Lcom/vkontakte/android/api/widget/WidgetTiles$Item;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->item:Lcom/vkontakte/android/api/widget/WidgetTiles$Item;

    .line 68
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->title:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/WidgetTiles$Item;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->description:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/WidgetTiles$Item;->getDescription()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->bindTextView(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 70
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->button:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/WidgetTiles$Item;->getButton()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->bindTextView(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 71
    sget v0, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->iconSize:I

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/widget/WidgetTilesItemView;->bindCover(I)V

    .line 72
    return-void
.end method
