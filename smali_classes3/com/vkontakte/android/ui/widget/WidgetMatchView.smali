.class public Lcom/vkontakte/android/ui/widget/WidgetMatchView;
.super Lcom/vkontakte/android/ui/widget/WidgetTitleView;
.source "WidgetMatchView.java"


# static fields
.field private static final iconSize:I


# instance fields
.field private final descriptionSpace:Landroid/view/View;

.field private final nameSpace:Landroid/view/View;

.field private final score:Landroid/widget/TextView;

.field private final scoreView:Landroid/view/View;

.field private final state:Landroid/widget/TextView;

.field private final teamDescription:Landroid/view/View;

.field private final teamDescriptionA:Landroid/widget/TextView;

.field private final teamDescriptionB:Landroid/widget/TextView;

.field private final teamIconA:Lcom/vk/imageloader/view/VKImageView;

.field private final teamIconB:Lcom/vk/imageloader/view/VKImageView;

.field private final teamNameA:Landroid/widget/TextView;

.field private final teamNameB:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    const/high16 v0, 0x42600000    # 56.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->iconSize:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 42
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ui/widget/WidgetMatchView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 43
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
    .line 46
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/ui/widget/WidgetMatchView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 47
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
    .line 50
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/ui/widget/WidgetTitleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 51
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0301e1

    invoke-static {v1, v2, p0}, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 52
    .local v0, "widgetView":Landroid/view/View;
    const v1, 0x7f100506

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamIconA:Lcom/vk/imageloader/view/VKImageView;

    .line 53
    const v1, 0x7f10050a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamIconB:Lcom/vk/imageloader/view/VKImageView;

    .line 54
    const v1, 0x7f10050b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamNameA:Landroid/widget/TextView;

    .line 55
    const v1, 0x7f10050d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamNameB:Landroid/widget/TextView;

    .line 56
    const v1, 0x7f10050e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamDescriptionA:Landroid/widget/TextView;

    .line 57
    const v1, 0x7f100510

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamDescriptionB:Landroid/widget/TextView;

    .line 58
    const v1, 0x7f1001cc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamDescription:Landroid/view/View;

    .line 59
    const v1, 0x7f100509

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->state:Landroid/widget/TextView;

    .line 60
    const v1, 0x7f100508

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->score:Landroid/widget/TextView;

    .line 61
    const v1, 0x7f100507

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->scoreView:Landroid/view/View;

    .line 62
    const v1, 0x7f10050c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->nameSpace:Landroid/view/View;

    .line 63
    const v1, 0x7f10050f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->descriptionSpace:Landroid/view/View;

    .line 64
    return-void
.end method

.method private bind(Lcom/vkontakte/android/api/widget/Match;)V
    .locals 9
    .param p1, "match"    # Lcom/vkontakte/android/api/widget/Match;

    .prologue
    const/16 v7, 0x8

    const/4 v5, 0x0

    .line 122
    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/Match;->getTeamA()Lcom/vkontakte/android/api/widget/Team;

    move-result-object v3

    .line 123
    .local v3, "teamA":Lcom/vkontakte/android/api/widget/Team;
    iget-object v6, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamNameA:Landroid/widget/TextView;

    invoke-virtual {v3}, Lcom/vkontakte/android/api/widget/Team;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    iget-object v6, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamDescriptionA:Landroid/widget/TextView;

    invoke-virtual {v3}, Lcom/vkontakte/android/api/widget/Team;->getDescription()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/Match;->getTeamB()Lcom/vkontakte/android/api/widget/Team;

    move-result-object v4

    .line 127
    .local v4, "teamB":Lcom/vkontakte/android/api/widget/Team;
    iget-object v6, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamNameB:Landroid/widget/TextView;

    invoke-virtual {v4}, Lcom/vkontakte/android/api/widget/Team;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 128
    iget-object v6, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamDescriptionB:Landroid/widget/TextView;

    invoke-virtual {v4}, Lcom/vkontakte/android/api/widget/Team;->getDescription()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    invoke-virtual {v3}, Lcom/vkontakte/android/api/widget/Team;->getDescription()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {v4}, Lcom/vkontakte/android/api/widget/Team;->getDescription()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_2

    const/4 v2, 0x1

    .line 131
    .local v2, "noDescription":Z
    :goto_0
    iget-object v8, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamDescription:Landroid/view/View;

    if-eqz v2, :cond_3

    move v6, v7

    :goto_1
    invoke-virtual {v8, v6}, Landroid/view/View;->setVisibility(I)V

    .line 133
    iget-object v6, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->state:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/Match;->getState()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 134
    iget-object v6, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->state:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/Match;->getState()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_4

    :goto_2
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 135
    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->score:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/Match;->getScore()Lcom/vkontakte/android/api/widget/Match$Score;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/api/widget/Match$Score;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 137
    sget v5, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->iconSize:I

    invoke-virtual {v3, v5}, Lcom/vkontakte/android/api/widget/Team;->getImage(I)Lcom/vk/core/common/ImageSize;

    move-result-object v0

    .line 138
    .local v0, "imageA":Lcom/vk/core/common/ImageSize;
    sget v5, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->iconSize:I

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/widget/Team;->getImage(I)Lcom/vk/core/common/ImageSize;

    move-result-object v1

    .line 139
    .local v1, "imageB":Lcom/vk/core/common/ImageSize;
    if-eqz v0, :cond_0

    .line 140
    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamIconA:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0}, Lcom/vk/core/common/ImageSize;->getUrl()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 142
    :cond_0
    if-eqz v1, :cond_1

    .line 143
    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamIconB:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v1}, Lcom/vk/core/common/ImageSize;->getUrl()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 145
    :cond_1
    return-void

    .end local v0    # "imageA":Lcom/vk/core/common/ImageSize;
    .end local v1    # "imageB":Lcom/vk/core/common/ImageSize;
    .end local v2    # "noDescription":Z
    :cond_2
    move v2, v5

    .line 130
    goto :goto_0

    .restart local v2    # "noDescription":Z
    :cond_3
    move v6, v5

    .line 131
    goto :goto_1

    :cond_4
    move v7, v5

    .line 134
    goto :goto_2
.end method


# virtual methods
.method public bind(Lcom/vkontakte/android/api/widget/Widget;)V
    .locals 1
    .param p1, "widget"    # Lcom/vkontakte/android/api/widget/Widget;

    .prologue
    .line 115
    invoke-super {p0, p1}, Lcom/vkontakte/android/ui/widget/WidgetTitleView;->bind(Lcom/vkontakte/android/api/widget/Widget;)V

    .line 116
    instance-of v0, p1, Lcom/vkontakte/android/api/widget/WidgetMatch;

    if-eqz v0, :cond_0

    .line 117
    check-cast p1, Lcom/vkontakte/android/api/widget/WidgetMatch;

    .end local p1    # "widget":Lcom/vkontakte/android/api/widget/Widget;
    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/WidgetMatch;->getMatch()Lcom/vkontakte/android/api/widget/Match;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->bind(Lcom/vkontakte/android/api/widget/Match;)V

    .line 119
    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 10
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/4 v9, 0x0

    const/4 v5, -0x2

    const/4 v8, 0x5

    const/4 v7, 0x3

    const/4 v6, 0x1

    .line 68
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/ui/widget/WidgetTitleView;->onMeasure(II)V

    .line 69
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamIconA:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v4}, Lcom/vk/imageloader/view/VKImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 70
    .local v0, "paramsIconA":Landroid/widget/FrameLayout$LayoutParams;
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamIconB:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v4}, Lcom/vk/imageloader/view/VKImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 71
    .local v1, "paramsIconB":Landroid/widget/FrameLayout$LayoutParams;
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->scoreView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 73
    .local v2, "scoreParams":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->getMeasuredWidth()I

    move-result v4

    div-int/lit8 v3, v4, 0x3

    .line 74
    .local v3, "width":I
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->state:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v4

    if-le v4, v3, :cond_1

    .line 75
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 76
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->state:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->requestLayout()V

    .line 77
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->measure(II)V

    .line 111
    :cond_0
    :goto_0
    return-void

    .line 79
    :cond_1
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->state:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v4

    if-ge v4, v3, :cond_2

    iget v4, v2, Landroid/widget/LinearLayout$LayoutParams;->width:I

    if-eq v4, v5, :cond_2

    .line 80
    iput v5, v2, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 81
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->measure(II)V

    goto :goto_0

    .line 85
    :cond_2
    sget v4, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->iconSize:I

    div-int/lit8 v5, v3, 0x3

    if-ge v4, v5, :cond_4

    iget v4, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    if-ne v4, v6, :cond_3

    iget v4, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    if-eq v4, v6, :cond_4

    .line 87
    :cond_3
    iput v6, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 88
    iput v6, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 89
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamNameA:Landroid/widget/TextView;

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 90
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamNameB:Landroid/widget/TextView;

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 91
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamDescriptionA:Landroid/widget/TextView;

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 92
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamDescriptionB:Landroid/widget/TextView;

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 93
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->nameSpace:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->scoreView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 94
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->descriptionSpace:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->scoreView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 95
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->nameSpace:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->requestLayout()V

    .line 96
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->descriptionSpace:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->requestLayout()V

    .line 97
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->measure(II)V

    goto :goto_0

    .line 98
    :cond_4
    sget v4, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->iconSize:I

    div-int/lit8 v5, v3, 0x3

    if-le v4, v5, :cond_0

    iget v4, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    if-ne v4, v7, :cond_5

    iget v4, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    if-eq v4, v8, :cond_0

    .line 99
    :cond_5
    iput v7, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 100
    iput v8, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 101
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamNameA:Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setGravity(I)V

    .line 102
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamNameB:Landroid/widget/TextView;

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setGravity(I)V

    .line 103
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamDescriptionA:Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setGravity(I)V

    .line 104
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->teamDescriptionB:Landroid/widget/TextView;

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setGravity(I)V

    .line 105
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->nameSpace:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    iput v9, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 106
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->descriptionSpace:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    iput v9, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 107
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->nameSpace:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->requestLayout()V

    .line 108
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->descriptionSpace:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->requestLayout()V

    .line 109
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/widget/WidgetMatchView;->measure(II)V

    goto/16 :goto_0
.end method
