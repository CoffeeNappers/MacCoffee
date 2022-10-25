.class public Lcom/vk/music/view/holders/SectionAudioSpecialHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "SectionAudioSpecialHolder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderThumps;,
        Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vk/music/dto/Section;",
        ">;"
    }
.end annotation


# instance fields
.field private subtitle:Landroid/widget/TextView;

.field private final thumpHolders:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderThumps;",
            ">;"
        }
    .end annotation
.end field

.field private title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Lcom/vk/music/model/RecommendedModel;)V
    .locals 6
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "recommendedModel"    # Lcom/vk/music/model/RecommendedModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 33
    invoke-static {p1}, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->createView(Landroid/view/ViewGroup;)Landroid/widget/FrameLayout;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/view/View;)V

    .line 29
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->thumpHolders:Ljava/util/ArrayList;

    .line 34
    invoke-virtual {p0}, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f09011a

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 35
    .local v2, "verMargin":I
    invoke-virtual {p0}, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f090119

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 36
    .local v1, "horMargin":I
    const v3, 0x7f03014f

    const/16 v4, 0x55

    invoke-direct {p0, v3, v4, v1, v2}, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->addThumbs(IIII)V

    .line 37
    const v3, 0x7f030150

    const/16 v4, 0x33

    invoke-direct {p0, v3, v4, v1, v2}, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->addThumbs(IIII)V

    .line 39
    new-instance v0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;

    iget-object v3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->itemView:Landroid/view/View;

    check-cast v3, Landroid/view/ViewGroup;

    invoke-direct {v0, p0, v3, p2}, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;-><init>(Lcom/vk/music/view/holders/SectionAudioSpecialHolder;Landroid/view/ViewGroup;Lcom/vk/music/model/RecommendedModel;)V

    .line 41
    .local v0, "holderBlock":Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;
    iget-object v3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->itemView:Landroid/view/View;

    check-cast v3, Landroid/view/ViewGroup;

    iget-object v4, v0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->itemView:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->getLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 43
    const v3, 0x1020014

    invoke-virtual {p0, v3}, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->$(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->title:Landroid/widget/TextView;

    .line 44
    const v3, 0x1020015

    invoke-virtual {p0, v3}, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->$(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->subtitle:Landroid/widget/TextView;

    .line 45
    return-void
.end method

.method static synthetic access$000(IIIIF)I
    .locals 1
    .param p0, "x0"    # I
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # I
    .param p4, "x4"    # F

    .prologue
    .line 27
    invoke-static {p0, p1, p2, p3, p4}, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->normalize(IIIIF)I

    move-result v0

    return v0
.end method

.method private addThumbs(IIII)V
    .locals 4
    .param p1, "layout"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param
    .param p2, "gravity"    # I
    .param p3, "horMargin"    # I
    .param p4, "verMargin"    # I

    .prologue
    const/4 v3, -0x2

    .line 48
    new-instance v0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderThumps;

    iget-object v2, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->itemView:Landroid/view/View;

    check-cast v2, Landroid/view/ViewGroup;

    invoke-direct {v0, p1, v2}, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderThumps;-><init>(ILandroid/view/ViewGroup;)V

    .line 49
    .local v0, "holder":Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderThumps;
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 50
    .local v1, "lp":Landroid/widget/FrameLayout$LayoutParams;
    iput p4, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 51
    iput p3, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 52
    iput p4, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 53
    iput p3, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 54
    iput p2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 55
    iget-object v2, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->itemView:Landroid/view/View;

    check-cast v2, Landroid/widget/FrameLayout;

    iget-object v3, v0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderThumps;->itemView:Landroid/view/ViewGroup;

    invoke-virtual {v2, v3, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 56
    iget-object v2, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->thumpHolders:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    return-void
.end method

.method private static createView(Landroid/view/ViewGroup;)Landroid/widget/FrameLayout;
    .locals 13
    .param p0, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 60
    const/high16 v1, 0x43a00000    # 320.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    .local v2, "DP_320":I
    const/high16 v1, 0x43d20000    # 420.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    .local v4, "DP_420":I
    const/high16 v1, 0x43f00000    # 480.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    .local v6, "DP_480":I
    const/high16 v1, 0x44200000    # 640.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v8

    .line 61
    .local v8, "DP_640":I
    const/high16 v1, 0x41600000    # 14.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    .local v3, "DP_14":I
    const/high16 v1, 0x42080000    # 34.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    .local v5, "DP_34":I
    const/high16 v1, 0x42940000    # 74.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v7

    .local v7, "DP_74":I
    const/high16 v1, 0x41a00000    # 20.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v9

    .line 62
    .local v9, "DP_20":I
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v11, 0x7f09011b

    invoke-virtual {v1, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    .line 63
    .local v10, "thumbsSize":I
    new-instance v0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct/range {v0 .. v10}, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;-><init>(Landroid/content/Context;IIIIIIIII)V

    .line 111
    .local v0, "layout":Landroid/widget/FrameLayout;
    const v1, 0x7f020317

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackgroundResource(I)V

    .line 112
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v11, -0x1

    const/4 v12, -0x2

    invoke-direct {v1, v11, v12}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 113
    const/high16 v1, 0x43300000    # 176.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setMinimumHeight(I)V

    .line 114
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setClipToPadding(Z)V

    .line 115
    return-object v0
.end method

.method private static normalize(IIIIF)I
    .locals 2
    .param p0, "inputMin"    # I
    .param p1, "inputMax"    # I
    .param p2, "outputMin"    # I
    .param p3, "outputMax"    # I
    .param p4, "input"    # F

    .prologue
    .line 121
    sub-int/2addr p1, p0

    .line 122
    int-to-float v0, p0

    sub-float/2addr p4, v0

    .line 123
    sub-int/2addr p3, p2

    .line 124
    int-to-float v0, p3

    mul-float/2addr v0, p4

    int-to-float v1, p1

    div-float/2addr v0, v1

    float-to-int v0, v0

    add-int/2addr v0, p2

    return v0
.end method


# virtual methods
.method public onBind(Lcom/vk/music/dto/Section;)V
    .locals 10
    .param p1, "item"    # Lcom/vk/music/dto/Section;

    .prologue
    .line 129
    iget-object v5, p1, Lcom/vk/music/dto/Section;->thumbs:Ljava/util/ArrayList;

    if-eqz v5, :cond_3

    .line 130
    const/high16 v5, 0x42900000    # 72.0f

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    .line 131
    .local v0, "DP_72":I
    const/4 v1, 0x0

    .line 132
    .local v1, "currentImage":I
    iget-object v5, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->thumpHolders:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderThumps;

    .line 133
    .local v2, "holder":Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderThumps;
    iget-object v8, v2, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderThumps;->imageViews:[Lcom/vk/imageloader/view/VKImageView;

    array-length v9, v8

    const/4 v5, 0x0

    move v6, v5

    :goto_0
    if-ge v6, v9, :cond_0

    aget-object v3, v8, v6

    .line 134
    .local v3, "imageView":Lcom/vk/imageloader/view/VKImageView;
    iget-object v5, p1, Lcom/vk/music/dto/Section;->thumbs:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-le v5, v1, :cond_1

    iget-object v5, p1, Lcom/vk/music/dto/Section;->thumbs:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vk/music/dto/Thumb;

    invoke-virtual {v5, v0}, Lcom/vk/music/dto/Thumb;->getForSize(I)Ljava/lang/String;

    move-result-object v4

    .line 135
    .local v4, "url":Ljava/lang/String;
    :goto_1
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 136
    invoke-virtual {v3, v4}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 140
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 133
    add-int/lit8 v5, v6, 0x1

    move v6, v5

    goto :goto_0

    .line 134
    .end local v4    # "url":Ljava/lang/String;
    :cond_1
    const/4 v4, 0x0

    goto :goto_1

    .line 138
    .restart local v4    # "url":Ljava/lang/String;
    :cond_2
    invoke-virtual {v3}, Lcom/vk/imageloader/view/VKImageView;->clear()V

    goto :goto_2

    .line 144
    .end local v0    # "DP_72":I
    .end local v1    # "currentImage":I
    .end local v2    # "holder":Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderThumps;
    .end local v3    # "imageView":Lcom/vk/imageloader/view/VKImageView;
    .end local v4    # "url":Ljava/lang/String;
    :cond_3
    iget-object v5, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->title:Landroid/widget/TextView;

    iget-object v6, p1, Lcom/vk/music/dto/Section;->title:Ljava/lang/String;

    invoke-static {v5, v6}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;)V

    .line 145
    iget-object v5, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->subtitle:Landroid/widget/TextView;

    iget-object v6, p1, Lcom/vk/music/dto/Section;->subtitle:Ljava/lang/String;

    const/4 v7, 0x1

    invoke-static {v5, v6, v7}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;Z)V

    .line 146
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 27
    check-cast p1, Lcom/vk/music/dto/Section;

    invoke-virtual {p0, p1}, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->onBind(Lcom/vk/music/dto/Section;)V

    return-void
.end method
