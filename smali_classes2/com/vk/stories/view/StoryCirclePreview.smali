.class public Lcom/vk/stories/view/StoryCirclePreview;
.super Landroid/widget/FrameLayout;
.source "StoryCirclePreview.java"


# static fields
.field private static final TEXT_COLOR_NORMAL:I = -0x8e8a86

.field private static final TEXT_COLOR_SELECTED:I = -0xae7e48


# instance fields
.field private clickHandler:Landroid/view/View;

.field private firstName:Landroid/widget/TextView;

.field private myStoryBackground:Landroid/widget/ImageView;

.field private story:Lcom/vk/stories/model/StoriesContainer;

.field private storyImageView:Lcom/vk/stories/view/StoryCircleImageView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 30
    invoke-direct {p0}, Lcom/vk/stories/view/StoryCirclePreview;->init()V

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 35
    invoke-direct {p0}, Lcom/vk/stories/view/StoryCirclePreview;->init()V

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 39
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 40
    invoke-direct {p0}, Lcom/vk/stories/view/StoryCirclePreview;->init()V

    .line 41
    return-void
.end method

.method private init()V
    .locals 2

    .prologue
    .line 44
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryCirclePreview;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0300ea

    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 45
    const v0, 0x7f100357

    invoke-virtual {p0, v0}, Lcom/vk/stories/view/StoryCirclePreview;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/view/StoryCircleImageView;

    iput-object v0, p0, Lcom/vk/stories/view/StoryCirclePreview;->storyImageView:Lcom/vk/stories/view/StoryCircleImageView;

    .line 46
    const v0, 0x7f100359

    invoke-virtual {p0, v0}, Lcom/vk/stories/view/StoryCirclePreview;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/stories/view/StoryCirclePreview;->firstName:Landroid/widget/TextView;

    .line 47
    const v0, 0x7f100358

    invoke-virtual {p0, v0}, Lcom/vk/stories/view/StoryCirclePreview;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vk/stories/view/StoryCirclePreview;->myStoryBackground:Landroid/widget/ImageView;

    .line 48
    const v0, 0x7f100335

    invoke-virtual {p0, v0}, Lcom/vk/stories/view/StoryCirclePreview;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/view/StoryCirclePreview;->clickHandler:Landroid/view/View;

    .line 49
    return-void
.end method


# virtual methods
.method public getStory()Lcom/vk/stories/model/StoriesContainer;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/vk/stories/view/StoryCirclePreview;->story:Lcom/vk/stories/model/StoriesContainer;

    return-object v0
.end method

.method public getStoryImageView()Lcom/vk/stories/view/StoryCircleImageView;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/vk/stories/view/StoryCirclePreview;->storyImageView:Lcom/vk/stories/view/StoryCircleImageView;

    return-object v0
.end method

.method protected onMeasure(II)V
    .locals 4
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/high16 v3, 0x40000000    # 2.0f

    .line 110
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryCirclePreview;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f09014b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-static {v0, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 111
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryCirclePreview;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f09014a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    invoke-static {v1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 110
    invoke-super {p0, v0, v1}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 112
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 1
    .param p1, "l"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/vk/stories/view/StoryCirclePreview;->clickHandler:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    return-void
.end method

.method public setStory(Lcom/vk/stories/model/StoriesContainer;)V
    .locals 5
    .param p1, "container"    # Lcom/vk/stories/model/StoriesContainer;

    .prologue
    const v2, -0x8e8a86

    const/16 v4, 0x8

    const/4 v3, 0x0

    .line 65
    iput-object p1, p0, Lcom/vk/stories/view/StoryCirclePreview;->story:Lcom/vk/stories/model/StoriesContainer;

    .line 66
    invoke-virtual {p1}, Lcom/vk/stories/model/StoriesContainer;->myStory()Z

    move-result v0

    .line 68
    .local v0, "myStory":Z
    iget-object v1, p0, Lcom/vk/stories/view/StoryCirclePreview;->storyImageView:Lcom/vk/stories/view/StoryCircleImageView;

    invoke-virtual {v1, p1}, Lcom/vk/stories/view/StoryCircleImageView;->setStoryContainer(Lcom/vk/stories/model/StoriesContainer;)V

    .line 69
    if-eqz p1, :cond_5

    .line 70
    if-eqz v0, :cond_1

    .line 71
    iget-object v1, p0, Lcom/vk/stories/view/StoryCirclePreview;->firstName:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 72
    iget-object v1, p0, Lcom/vk/stories/view/StoryCirclePreview;->firstName:Landroid/widget/TextView;

    sget-object v2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 74
    invoke-virtual {p1}, Lcom/vk/stories/model/StoriesContainer;->hasValidStories()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 75
    iget-object v1, p0, Lcom/vk/stories/view/StoryCirclePreview;->myStoryBackground:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 76
    iget-object v1, p0, Lcom/vk/stories/view/StoryCirclePreview;->storyImageView:Lcom/vk/stories/view/StoryCircleImageView;

    invoke-virtual {v1, v3}, Lcom/vk/stories/view/StoryCircleImageView;->setVisibility(I)V

    .line 94
    :goto_0
    invoke-virtual {p1}, Lcom/vk/stories/model/StoriesContainer;->getAuthorFirstName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    if-nez v0, :cond_3

    .line 95
    iget-object v1, p0, Lcom/vk/stories/view/StoryCirclePreview;->firstName:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vk/stories/model/StoriesContainer;->getAuthorFirstName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    :goto_1
    return-void

    .line 78
    :cond_0
    iget-object v1, p0, Lcom/vk/stories/view/StoryCirclePreview;->myStoryBackground:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 79
    iget-object v1, p0, Lcom/vk/stories/view/StoryCirclePreview;->storyImageView:Lcom/vk/stories/view/StoryCircleImageView;

    invoke-virtual {v1, v4}, Lcom/vk/stories/view/StoryCircleImageView;->setVisibility(I)V

    goto :goto_0

    .line 82
    :cond_1
    iget-object v1, p0, Lcom/vk/stories/view/StoryCirclePreview;->myStoryBackground:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 83
    iget-object v1, p0, Lcom/vk/stories/view/StoryCirclePreview;->storyImageView:Lcom/vk/stories/view/StoryCircleImageView;

    invoke-virtual {v1, v3}, Lcom/vk/stories/view/StoryCircleImageView;->setVisibility(I)V

    .line 85
    invoke-virtual {p1}, Lcom/vk/stories/model/StoriesContainer;->hasNewStories()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 86
    iget-object v1, p0, Lcom/vk/stories/view/StoryCirclePreview;->firstName:Landroid/widget/TextView;

    const v2, -0xae7e48

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 87
    iget-object v1, p0, Lcom/vk/stories/view/StoryCirclePreview;->firstName:Landroid/widget/TextView;

    invoke-static {}, Lcom/vk/attachpicker/util/Fonts;->getRobotoMedium()Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto :goto_0

    .line 89
    :cond_2
    iget-object v1, p0, Lcom/vk/stories/view/StoryCirclePreview;->firstName:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 90
    iget-object v1, p0, Lcom/vk/stories/view/StoryCirclePreview;->firstName:Landroid/widget/TextView;

    sget-object v2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto :goto_0

    .line 96
    :cond_3
    if-eqz v0, :cond_4

    .line 97
    iget-object v1, p0, Lcom/vk/stories/view/StoryCirclePreview;->firstName:Landroid/widget/TextView;

    const v2, 0x7f0806cb

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1

    .line 99
    :cond_4
    iget-object v1, p0, Lcom/vk/stories/view/StoryCirclePreview;->firstName:Landroid/widget/TextView;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 102
    :cond_5
    iget-object v1, p0, Lcom/vk/stories/view/StoryCirclePreview;->firstName:Landroid/widget/TextView;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method
