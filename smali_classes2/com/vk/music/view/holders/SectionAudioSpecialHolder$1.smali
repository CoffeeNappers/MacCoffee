.class final Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;
.super Landroid/widget/FrameLayout;
.source "SectionAudioSpecialHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->createView(Landroid/view/ViewGroup;)Landroid/widget/FrameLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$DP_14:I

.field final synthetic val$DP_20:I

.field final synthetic val$DP_320:I

.field final synthetic val$DP_34:I

.field final synthetic val$DP_420:I

.field final synthetic val$DP_480:I

.field final synthetic val$DP_640:I

.field final synthetic val$DP_74:I

.field final synthetic val$thumbsSize:I


# direct methods
.method constructor <init>(Landroid/content/Context;IIIIIIIII)V
    .locals 0
    .param p1, "x0"    # Landroid/content/Context;

    .prologue
    .line 63
    iput p2, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_320:I

    iput p3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_14:I

    iput p4, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_420:I

    iput p5, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_34:I

    iput p6, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_480:I

    iput p7, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_74:I

    iput p8, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_640:I

    iput p9, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_20:I

    iput p10, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$thumbsSize:I

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .locals 13
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 66
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v7

    .line 68
    .local v7, "w":I
    const/4 v2, 0x0

    .line 69
    .local v2, "holderBlock":Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;
    const/4 v1, 0x0

    .line 70
    .local v1, "gravity":I
    const/4 v0, 0x0

    .line 71
    .local v0, "dx":I
    const/4 v5, 0x1

    .line 73
    .local v5, "isOneThumbs":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->getChildCount()I

    move-result v8

    if-ge v3, v8, :cond_8

    .line 74
    invoke-virtual {p0, v3}, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 75
    .local v6, "view":Landroid/view/View;
    invoke-virtual {v6}, Landroid/view/View;->getId()I

    move-result v8

    const v9, 0x7f1003e7

    if-ne v8, v9, :cond_0

    .line 76
    invoke-virtual {v6}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "holderBlock":Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;
    check-cast v2, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;

    .line 73
    .restart local v2    # "holderBlock":Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 79
    :cond_0
    iget v8, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_320:I

    if-ge v7, v8, :cond_1

    .line 80
    const/4 v5, 0x1

    .line 81
    iget v0, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_14:I

    .line 82
    const/4 v1, 0x3

    .line 100
    :goto_2
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    check-cast v8, Landroid/widget/FrameLayout$LayoutParams;

    iget v8, v8, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    and-int/lit8 v8, v8, 0x3

    const/4 v9, 0x3

    if-ne v8, v9, :cond_5

    const/4 v4, 0x1

    .line 101
    .local v4, "isLeft":Z
    :goto_3
    if-eqz v4, :cond_7

    if-eqz v5, :cond_6

    iget v8, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$thumbsSize:I

    neg-int v8, v8

    :goto_4
    int-to-float v8, v8

    :goto_5
    invoke-virtual {v6, v8}, Landroid/view/View;->setTranslationX(F)V

    goto :goto_1

    .line 83
    .end local v4    # "isLeft":Z
    :cond_1
    iget v8, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_320:I

    if-gt v8, v7, :cond_2

    iget v8, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_420:I

    if-ge v7, v8, :cond_2

    .line 84
    const/4 v5, 0x1

    .line 85
    iget v8, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_320:I

    iget v9, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_420:I

    iget v10, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_14:I

    iget v11, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_34:I

    int-to-float v12, v7

    invoke-static {v8, v9, v10, v11, v12}, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->access$000(IIIIF)I

    move-result v0

    .line 86
    const/4 v1, 0x3

    goto :goto_2

    .line 87
    :cond_2
    iget v8, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_420:I

    if-gt v8, v7, :cond_3

    iget v8, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_480:I

    if-ge v7, v8, :cond_3

    .line 88
    const/4 v5, 0x1

    .line 89
    iget v0, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_74:I

    .line 90
    const/4 v1, 0x3

    goto :goto_2

    .line 91
    :cond_3
    iget v8, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_480:I

    if-gt v8, v7, :cond_4

    iget v8, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_640:I

    if-ge v7, v8, :cond_4

    .line 92
    const/4 v5, 0x0

    .line 93
    iget v8, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_480:I

    iget v9, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_640:I

    const/4 v10, 0x0

    iget v11, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_20:I

    int-to-float v12, v7

    invoke-static {v8, v9, v10, v11, v12}, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->access$000(IIIIF)I

    move-result v0

    .line 94
    const/4 v1, 0x1

    goto :goto_2

    .line 96
    :cond_4
    const/4 v5, 0x0

    .line 97
    iget v0, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$1;->val$DP_20:I

    .line 98
    const/4 v1, 0x1

    goto :goto_2

    .line 100
    :cond_5
    const/4 v4, 0x0

    goto :goto_3

    .restart local v4    # "isLeft":Z
    :cond_6
    move v8, v0

    .line 101
    goto :goto_4

    :cond_7
    neg-int v8, v0

    int-to-float v8, v8

    goto :goto_5

    .line 104
    .end local v4    # "isLeft":Z
    .end local v6    # "view":Landroid/view/View;
    :cond_8
    if-eqz v2, :cond_9

    .line 105
    invoke-virtual {v2, v1, v0, v5}, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->setParams(IIZ)V

    .line 108
    :cond_9
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 109
    return-void
.end method
