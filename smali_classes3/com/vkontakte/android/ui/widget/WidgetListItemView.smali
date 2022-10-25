.class public Lcom/vkontakte/android/ui/widget/WidgetListItemView;
.super Landroid/widget/FrameLayout;
.source "WidgetListItemView.java"


# static fields
.field private static final iconSize:I


# instance fields
.field private final address:Landroid/widget/TextView;

.field private final button:Landroid/widget/TextView;

.field private final description:Landroid/widget/TextView;

.field private final icon:Lcom/vk/imageloader/view/VKImageView;

.field private item:Lcom/vkontakte/android/api/widget/WidgetList$Item;

.field private final separator:Landroid/view/View;

.field private final text:Landroid/widget/TextView;

.field private final time:Landroid/widget/TextView;

.field private final title:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const/high16 v0, 0x42400000    # 48.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->iconSize:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 37
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ui/widget/WidgetListItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 38
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
    .line 41
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/ui/widget/WidgetListItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4
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
    const v3, 0x7f0f0083

    .line 45
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 46
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0301e0

    invoke-static {v1, v2, p0}, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 47
    .local v0, "widgetView":Landroid/view/View;
    const v1, 0x7f100127

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->icon:Lcom/vk/imageloader/view/VKImageView;

    .line 48
    const v1, 0x7f100128

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->title:Landroid/widget/TextView;

    .line 49
    const v1, 0x7f1001cc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->description:Landroid/widget/TextView;

    .line 50
    const v1, 0x7f10028d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->address:Landroid/widget/TextView;

    .line 51
    const v1, 0x7f100428

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->time:Landroid/widget/TextView;

    .line 52
    const v1, 0x7f1001c3

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->text:Landroid/widget/TextView;

    .line 53
    const v1, 0x7f10010f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->button:Landroid/widget/TextView;

    .line 54
    const v1, 0x7f100505

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->separator:Landroid/view/View;

    .line 56
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->address:Landroid/widget/TextView;

    const v2, 0x7f020237

    invoke-static {v1, v2, v3}, Lcom/vk/core/util/DrawableUtils;->setLeft(Landroid/widget/TextView;II)V

    .line 57
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->time:Landroid/widget/TextView;

    const v2, 0x7f0202c7

    invoke-static {v1, v2, v3}, Lcom/vk/core/util/DrawableUtils;->setLeft(Landroid/widget/TextView;II)V

    .line 59
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->button:Landroid/widget/TextView;

    new-instance v2, Lcom/vkontakte/android/ui/widget/WidgetListItemView$1;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/ui/widget/WidgetListItemView$1;-><init>(Lcom/vkontakte/android/ui/widget/WidgetListItemView;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    new-instance v1, Lcom/vkontakte/android/ui/widget/WidgetListItemView$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ui/widget/WidgetListItemView$2;-><init>(Lcom/vkontakte/android/ui/widget/WidgetListItemView;)V

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/widget/WidgetListItemView;)Lcom/vkontakte/android/api/widget/WidgetList$Item;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/WidgetListItemView;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->item:Lcom/vkontakte/android/api/widget/WidgetList$Item;

    return-object v0
.end method

.method private static bindTextView(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
    .locals 1
    .param p0, "textView"    # Landroid/widget/TextView;
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 94
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x8

    :goto_0
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 96
    return-void

    .line 95
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
    .line 99
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 100
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v0, -0x1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 109
    invoke-static {p0, p1}, Lcom/vkontakte/android/utils/LinkUtils;->processInternalHiddenLink(Landroid/content/Context;Ljava/lang/String;)V

    .line 113
    :cond_1
    :goto_1
    return-void

    .line 100
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

    .line 102
    :pswitch_0
    invoke-static {p0, p1}, Lcom/vkontakte/android/utils/LinkUtils;->processExternalLink(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1

    .line 105
    :pswitch_1
    invoke-static {p0, p1}, Lcom/vkontakte/android/utils/LinkUtils;->processInternalLink(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1

    .line 100
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
.method public bind(Lcom/vkontakte/android/api/widget/WidgetList$Item;Z)V
    .locals 5
    .param p1, "item"    # Lcom/vkontakte/android/api/widget/WidgetList$Item;
    .param p2, "showSeparator"    # Z

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 74
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->item:Lcom/vkontakte/android/api/widget/WidgetList$Item;

    .line 75
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->title:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/WidgetList$Item;->getTitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->description:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/WidgetList$Item;->getDescription()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->bindTextView(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 77
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->address:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/WidgetList$Item;->getAddress()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->bindTextView(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 78
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->time:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/WidgetList$Item;->getTime()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->bindTextView(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 79
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->text:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/WidgetList$Item;->getText()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->bindTextView(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 80
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->button:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/WidgetList$Item;->getButton()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->bindTextView(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 81
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->separator:Landroid/view/View;

    if-eqz p2, :cond_0

    move v1, v2

    :goto_0
    invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

    .line 83
    sget v1, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->iconSize:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/api/widget/WidgetList$Item;->getIcon(I)Lcom/vk/core/common/ImageSize;

    move-result-object v0

    .line 84
    .local v0, "icon":Lcom/vk/core/common/ImageSize;
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->icon:Lcom/vk/imageloader/view/VKImageView;

    if-nez v0, :cond_1

    :goto_1
    invoke-virtual {v1, v3}, Lcom/vk/imageloader/view/VKImageView;->setVisibility(I)V

    .line 85
    if-nez v0, :cond_2

    .line 86
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->icon:Lcom/vk/imageloader/view/VKImageView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 90
    :goto_2
    return-void

    .end local v0    # "icon":Lcom/vk/core/common/ImageSize;
    :cond_0
    move v1, v3

    .line 81
    goto :goto_0

    .restart local v0    # "icon":Lcom/vk/core/common/ImageSize;
    :cond_1
    move v3, v2

    .line 84
    goto :goto_1

    .line 88
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetListItemView;->icon:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0}, Lcom/vk/core/common/ImageSize;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    goto :goto_2
.end method
