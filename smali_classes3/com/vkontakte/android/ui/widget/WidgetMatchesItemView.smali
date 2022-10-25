.class public Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;
.super Landroid/widget/LinearLayout;
.source "WidgetMatchesItemView.java"


# static fields
.field private static final iconSize:I


# instance fields
.field private final gameIcon:Lcom/vk/imageloader/view/VKImageView;

.field private final liveIcon:Landroid/view/View;

.field private final scoreNone:Landroid/widget/TextView;

.field private final scoreTeamA:Landroid/widget/TextView;

.field private final scoreTeamB:Landroid/widget/TextView;

.field private final scoreView:Landroid/view/View;

.field private final separator:Landroid/view/View;

.field private final teamIconA:Lcom/vk/imageloader/view/VKImageView;

.field private final teamIconB:Lcom/vk/imageloader/view/VKImageView;

.field private final teamIcons:Landroid/view/View;

.field private final teamNameA:Landroid/widget/TextView;

.field private final teamNameB:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const/high16 v0, 0x41c00000    # 24.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->iconSize:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 42
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 43
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 46
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 47
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0301e2

    invoke-static {v1, v2, p0}, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 48
    .local v0, "widgetView":Landroid/view/View;
    const v1, 0x7f100506

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->teamIconA:Lcom/vk/imageloader/view/VKImageView;

    .line 49
    const v1, 0x7f10050a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->teamIconB:Lcom/vk/imageloader/view/VKImageView;

    .line 50
    const v1, 0x7f100511

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->gameIcon:Lcom/vk/imageloader/view/VKImageView;

    .line 51
    const v1, 0x7f100512

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->scoreTeamA:Landroid/widget/TextView;

    .line 52
    const v1, 0x7f100514

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->scoreTeamB:Landroid/widget/TextView;

    .line 53
    const v1, 0x7f100513

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->scoreNone:Landroid/widget/TextView;

    .line 54
    const v1, 0x7f10050b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->teamNameA:Landroid/widget/TextView;

    .line 55
    const v1, 0x7f10050d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->teamNameB:Landroid/widget/TextView;

    .line 56
    const v1, 0x7f100507

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->scoreView:Landroid/view/View;

    .line 57
    const v1, 0x7f100515

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->teamIcons:Landroid/view/View;

    .line 58
    const v1, 0x7f100505

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->separator:Landroid/view/View;

    .line 59
    const v1, 0x7f100516

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->liveIcon:Landroid/view/View;

    .line 60
    return-void
.end method

.method private static loadImage(Lcom/vk/imageloader/view/VKImageView;Lcom/vk/core/common/ImageSize;)V
    .locals 1
    .param p0, "view"    # Lcom/vk/imageloader/view/VKImageView;
    .param p1, "image"    # Lcom/vk/core/common/ImageSize;

    .prologue
    .line 113
    if-nez p1, :cond_0

    .line 114
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vk/imageloader/view/VKImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 118
    :goto_0
    return-void

    .line 116
    :cond_0
    invoke-virtual {p1}, Lcom/vk/core/common/ImageSize;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static openLink(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 121
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 122
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/vkontakte/android/LinkRedirActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 123
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 124
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 126
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    return-void
.end method


# virtual methods
.method public bind(Lcom/vkontakte/android/api/widget/Match;)V
    .locals 13
    .param p1, "match"    # Lcom/vkontakte/android/api/widget/Match;

    .prologue
    const/4 v11, 0x4

    const/16 v9, 0x8

    const/4 v10, 0x0

    .line 63
    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/Match;->getTeamA()Lcom/vkontakte/android/api/widget/Team;

    move-result-object v6

    .line 64
    .local v6, "teamA":Lcom/vkontakte/android/api/widget/Team;
    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/Match;->getTeamB()Lcom/vkontakte/android/api/widget/Team;

    move-result-object v7

    .line 65
    .local v7, "teamB":Lcom/vkontakte/android/api/widget/Team;
    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/Match;->getScore()Lcom/vkontakte/android/api/widget/Match$Score;

    move-result-object v5

    .line 67
    .local v5, "score":Lcom/vkontakte/android/api/widget/Match$Score;
    iget-object v8, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->teamNameA:Landroid/widget/TextView;

    invoke-virtual {v6}, Lcom/vkontakte/android/api/widget/Team;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v8, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    iget-object v8, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->teamNameB:Landroid/widget/TextView;

    invoke-virtual {v7}, Lcom/vkontakte/android/api/widget/Team;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v8, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    invoke-virtual {v5}, Lcom/vkontakte/android/api/widget/Match$Score;->hasScore()Z

    move-result v0

    .line 71
    .local v0, "hasScore":Z
    iget-object v12, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->scoreNone:Landroid/widget/TextView;

    if-eqz v0, :cond_3

    move v8, v9

    :goto_0
    invoke-virtual {v12, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 72
    iget-object v12, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->scoreTeamA:Landroid/widget/TextView;

    if-eqz v0, :cond_4

    move v8, v10

    :goto_1
    invoke-virtual {v12, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 73
    iget-object v12, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->scoreTeamB:Landroid/widget/TextView;

    if-eqz v0, :cond_5

    move v8, v10

    :goto_2
    invoke-virtual {v12, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 74
    if-eqz v0, :cond_0

    .line 75
    iget-object v8, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->scoreTeamA:Landroid/widget/TextView;

    invoke-virtual {v5}, Lcom/vkontakte/android/api/widget/Match$Score;->getScoreA()I

    move-result v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v8, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    iget-object v8, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->scoreTeamB:Landroid/widget/TextView;

    invoke-virtual {v5}, Lcom/vkontakte/android/api/widget/Match$Score;->getScoreB()I

    move-result v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v8, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    :cond_0
    sget v8, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->iconSize:I

    invoke-virtual {p1, v8}, Lcom/vkontakte/android/api/widget/Match;->getIcon(I)Lcom/vk/core/common/ImageSize;

    move-result-object v1

    .line 80
    .local v1, "icon":Lcom/vk/core/common/ImageSize;
    sget v8, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->iconSize:I

    invoke-virtual {v6, v8}, Lcom/vkontakte/android/api/widget/Team;->getImage(I)Lcom/vk/core/common/ImageSize;

    move-result-object v2

    .line 81
    .local v2, "imageA":Lcom/vk/core/common/ImageSize;
    sget v8, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->iconSize:I

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/api/widget/Team;->getImage(I)Lcom/vk/core/common/ImageSize;

    move-result-object v3

    .line 83
    .local v3, "imageB":Lcom/vk/core/common/ImageSize;
    iget-object v8, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->gameIcon:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {v8, v1}, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->loadImage(Lcom/vk/imageloader/view/VKImageView;Lcom/vk/core/common/ImageSize;)V

    .line 84
    iget-object v8, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->teamIconA:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {v8, v2}, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->loadImage(Lcom/vk/imageloader/view/VKImageView;Lcom/vk/core/common/ImageSize;)V

    .line 85
    iget-object v8, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->teamIconB:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {v8, v3}, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->loadImage(Lcom/vk/imageloader/view/VKImageView;Lcom/vk/core/common/ImageSize;)V

    .line 87
    iget-object v12, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->gameIcon:Lcom/vk/imageloader/view/VKImageView;

    if-eqz v1, :cond_6

    move v8, v10

    :goto_3
    invoke-virtual {v12, v8}, Lcom/vk/imageloader/view/VKImageView;->setVisibility(I)V

    .line 88
    iget-object v8, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->teamIcons:Landroid/view/View;

    if-nez v2, :cond_1

    if-eqz v3, :cond_2

    :cond_1
    move v11, v10

    :cond_2
    invoke-virtual {v8, v11}, Landroid/view/View;->setVisibility(I)V

    .line 90
    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/Match;->getLiveUrl()Ljava/lang/String;

    move-result-object v4

    .line 91
    .local v4, "liveUrl":Ljava/lang/String;
    iget-object v8, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->liveIcon:Landroid/view/View;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_7

    :goto_4
    invoke-virtual {v8, v9}, Landroid/view/View;->setVisibility(I)V

    .line 92
    iget-object v8, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->liveIcon:Landroid/view/View;

    invoke-static {p0, v4}, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;Ljava/lang/String;)Landroid/view/View$OnClickListener;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 93
    return-void

    .end local v1    # "icon":Lcom/vk/core/common/ImageSize;
    .end local v2    # "imageA":Lcom/vk/core/common/ImageSize;
    .end local v3    # "imageB":Lcom/vk/core/common/ImageSize;
    .end local v4    # "liveUrl":Ljava/lang/String;
    :cond_3
    move v8, v10

    .line 71
    goto :goto_0

    :cond_4
    move v8, v9

    .line 72
    goto :goto_1

    :cond_5
    move v8, v9

    .line 73
    goto :goto_2

    .restart local v1    # "icon":Lcom/vk/core/common/ImageSize;
    .restart local v2    # "imageA":Lcom/vk/core/common/ImageSize;
    .restart local v3    # "imageB":Lcom/vk/core/common/ImageSize;
    :cond_6
    move v8, v11

    .line 87
    goto :goto_3

    .restart local v4    # "liveUrl":Ljava/lang/String;
    :cond_7
    move v9, v10

    .line 91
    goto :goto_4
.end method

.method synthetic lambda$bind$0(Ljava/lang/String;Landroid/view/View;)V
    .locals 1
    .param p1, "liveUrl"    # Ljava/lang/String;
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 92
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->openLink(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public measureScoreWidth()I
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 108
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->scoreView:Landroid/view/View;

    invoke-virtual {v0, v1, v1}, Landroid/view/View;->measure(II)V

    .line 109
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->scoreView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    return v0
.end method

.method public postBind(ZZZI)V
    .locals 3
    .param p1, "showSeparator"    # Z
    .param p2, "showGameIcon"    # Z
    .param p3, "showTeamIcons"    # Z
    .param p4, "scoreWidth"    # I

    .prologue
    const/16 v1, 0x8

    .line 96
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->scoreView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput p4, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 97
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->scoreView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 98
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->separator:Landroid/view/View;

    if-eqz p1, :cond_2

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 99
    if-nez p2, :cond_0

    .line 100
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->gameIcon:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setVisibility(I)V

    .line 102
    :cond_0
    if-nez p3, :cond_1

    .line 103
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchesItemView;->teamIcons:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 105
    :cond_1
    return-void

    :cond_2
    move v0, v1

    .line 98
    goto :goto_0
.end method
