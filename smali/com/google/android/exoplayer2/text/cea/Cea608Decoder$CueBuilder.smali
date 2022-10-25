.class Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;
.super Ljava/lang/Object;
.source "Cea608Decoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/text/cea/Cea608Decoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CueBuilder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder$CueStyle;
    }
.end annotation


# static fields
.field private static final BASE_ROW:I = 0xf

.field private static final POSITION_UNSET:I = -0x1

.field private static final SCREEN_CHARWIDTH:I = 0x20


# instance fields
.field private captionMode:I

.field private captionRowCount:I

.field private final captionStringBuilder:Landroid/text/SpannableStringBuilder;

.field private indent:I

.field private final midrowStyles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder$CueStyle;",
            ">;"
        }
    .end annotation
.end field

.field private final preambleStyles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/text/style/CharacterStyle;",
            ">;"
        }
    .end annotation
.end field

.field private final rolledUpCaptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/text/SpannableString;",
            ">;"
        }
    .end annotation
.end field

.field private row:I

.field private tabOffset:I

.field private underlineStartPosition:I


# direct methods
.method public constructor <init>(II)V
    .locals 1
    .param p1, "captionMode"    # I
    .param p2, "captionRowCount"    # I

    .prologue
    .line 591
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 592
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->preambleStyles:Ljava/util/List;

    .line 593
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->midrowStyles:Ljava/util/List;

    .line 594
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->rolledUpCaptions:Ljava/util/List;

    .line 595
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    .line 596
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->reset(II)V

    .line 597
    return-void
.end method


# virtual methods
.method public append(C)V
    .locals 1
    .param p1, "text"    # C

    .prologue
    .line 673
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0, p1}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 674
    return-void
.end method

.method public backspace()V
    .locals 3

    .prologue
    .line 618
    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    .line 619
    .local v0, "length":I
    if-lez v0, :cond_0

    .line 620
    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2, v0}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 622
    :cond_0
    return-void
.end method

.method public build()Lcom/google/android/exoplayer2/text/Cue;
    .locals 14

    .prologue
    .line 705
    new-instance v1, Landroid/text/SpannableStringBuilder;

    invoke-direct {v1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 707
    .local v1, "cueString":Landroid/text/SpannableStringBuilder;
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->rolledUpCaptions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v10, v0, :cond_0

    .line 708
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->rolledUpCaptions:Ljava/util/List;

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 709
    const/16 v0, 0xa

    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 707
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 712
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->buildSpannableString()Landroid/text/SpannableString;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 714
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 716
    const/4 v0, 0x0

    .line 760
    :goto_1
    return-object v0

    .line 722
    :cond_1
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->indent:I

    iget v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->tabOffset:I

    add-int v13, v0, v2

    .line 724
    .local v13, "startPadding":I
    rsub-int/lit8 v0, v13, 0x20

    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    sub-int v9, v0, v2

    .line 725
    .local v9, "endPadding":I
    sub-int v12, v13, v9

    .line 726
    .local v12, "startEndPaddingDelta":I
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionMode:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_3

    invoke-static {v12}, Ljava/lang/Math;->abs(I)I

    move-result v0

    const/4 v2, 0x3

    if-ge v0, v2, :cond_3

    .line 728
    const/high16 v6, 0x3f000000    # 0.5f

    .line 729
    .local v6, "position":F
    const/4 v7, 0x1

    .line 747
    .local v7, "positionAnchor":I
    :goto_2
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionMode:I

    const/4 v2, 0x1

    if-eq v0, v2, :cond_2

    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->row:I

    const/4 v2, 0x7

    if-le v0, v2, :cond_5

    .line 748
    :cond_2
    const/4 v5, 0x2

    .line 749
    .local v5, "lineAnchor":I
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->row:I

    add-int/lit8 v11, v0, -0xf

    .line 752
    .local v11, "line":I
    add-int/lit8 v11, v11, -0x2

    .line 760
    :goto_3
    new-instance v0, Lcom/google/android/exoplayer2/text/Cue;

    sget-object v2, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    int-to-float v3, v11

    const/4 v4, 0x1

    const/4 v8, 0x1

    invoke-direct/range {v0 .. v8}, Lcom/google/android/exoplayer2/text/Cue;-><init>(Ljava/lang/CharSequence;Landroid/text/Layout$Alignment;FIIFIF)V

    goto :goto_1

    .line 730
    .end local v5    # "lineAnchor":I
    .end local v6    # "position":F
    .end local v7    # "positionAnchor":I
    .end local v11    # "line":I
    :cond_3
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionMode:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_4

    if-lez v12, :cond_4

    .line 732
    rsub-int/lit8 v0, v9, 0x20

    int-to-float v0, v0

    const/high16 v2, 0x42000000    # 32.0f

    div-float v6, v0, v2

    .line 734
    .restart local v6    # "position":F
    const v0, 0x3f4ccccd    # 0.8f

    mul-float/2addr v0, v6

    const v2, 0x3dcccccd    # 0.1f

    add-float v6, v0, v2

    .line 735
    const/4 v7, 0x2

    .restart local v7    # "positionAnchor":I
    goto :goto_2

    .line 738
    .end local v6    # "position":F
    .end local v7    # "positionAnchor":I
    :cond_4
    int-to-float v0, v13

    const/high16 v2, 0x42000000    # 32.0f

    div-float v6, v0, v2

    .line 740
    .restart local v6    # "position":F
    const v0, 0x3f4ccccd    # 0.8f

    mul-float/2addr v0, v6

    const v2, 0x3dcccccd    # 0.1f

    add-float v6, v0, v2

    .line 741
    const/4 v7, 0x0

    .restart local v7    # "positionAnchor":I
    goto :goto_2

    .line 754
    :cond_5
    const/4 v5, 0x0

    .line 757
    .restart local v5    # "lineAnchor":I
    iget v11, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->row:I

    .restart local v11    # "line":I
    goto :goto_3
.end method

.method public buildSpannableString()Landroid/text/SpannableString;
    .locals 8

    .prologue
    const/16 v7, 0x21

    .line 677
    iget-object v4, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v4}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    .line 680
    .local v3, "length":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v4, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->preambleStyles:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_0

    .line 681
    iget-object v4, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    iget-object v5, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->preambleStyles:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6, v3, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 680
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 686
    :cond_0
    const/4 v2, 0x0

    :goto_1
    iget-object v4, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->midrowStyles:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_2

    .line 687
    iget-object v4, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->midrowStyles:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder$CueStyle;

    .line 688
    .local v0, "cueStyle":Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder$CueStyle;
    iget-object v4, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->midrowStyles:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    iget v5, v0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder$CueStyle;->nextStyleIncrement:I

    sub-int/2addr v4, v5

    if-ge v2, v4, :cond_1

    iget-object v4, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->midrowStyles:Ljava/util/List;

    iget v5, v0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder$CueStyle;->nextStyleIncrement:I

    add-int/2addr v5, v2

    .line 689
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder$CueStyle;

    iget v1, v4, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder$CueStyle;->start:I

    .line 691
    .local v1, "end":I
    :goto_2
    iget-object v4, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    iget-object v5, v0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder$CueStyle;->style:Landroid/text/style/CharacterStyle;

    iget v6, v0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder$CueStyle;->start:I

    invoke-virtual {v4, v5, v6, v1, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 686
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .end local v1    # "end":I
    :cond_1
    move v1, v3

    .line 689
    goto :goto_2

    .line 696
    .end local v0    # "cueStyle":Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder$CueStyle;
    :cond_2
    iget v4, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->underlineStartPosition:I

    const/4 v5, -0x1

    if-eq v4, v5, :cond_3

    .line 697
    iget-object v4, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    new-instance v5, Landroid/text/style/UnderlineSpan;

    invoke-direct {v5}, Landroid/text/style/UnderlineSpan;-><init>()V

    iget v6, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->underlineStartPosition:I

    invoke-virtual {v4, v5, v6, v3, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 701
    :cond_3
    new-instance v4, Landroid/text/SpannableString;

    iget-object v5, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-direct {v4, v5}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    return-object v4
.end method

.method public getRow()I
    .locals 1

    .prologue
    .line 625
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->row:I

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 613
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->preambleStyles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->midrowStyles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->rolledUpCaptions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    .line 614
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public reset(II)V
    .locals 2
    .param p1, "captionMode"    # I
    .param p2, "captionRowCount"    # I

    .prologue
    const/4 v1, 0x0

    .line 600
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->preambleStyles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 601
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->midrowStyles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 602
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->rolledUpCaptions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 603
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->clear()V

    .line 604
    const/16 v0, 0xf

    iput v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->row:I

    .line 605
    iput v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->indent:I

    .line 606
    iput v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->tabOffset:I

    .line 607
    iput p1, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionMode:I

    .line 608
    iput p2, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionRowCount:I

    .line 609
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->underlineStartPosition:I

    .line 610
    return-void
.end method

.method public rollUp()V
    .locals 3

    .prologue
    .line 633
    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->rolledUpCaptions:Ljava/util/List;

    invoke-virtual {p0}, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->buildSpannableString()Landroid/text/SpannableString;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 634
    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->clear()V

    .line 635
    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->preambleStyles:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 636
    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->midrowStyles:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 637
    const/4 v1, -0x1

    iput v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->underlineStartPosition:I

    .line 639
    iget v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionRowCount:I

    iget v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->row:I

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 640
    .local v0, "numRows":I
    :goto_0
    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->rolledUpCaptions:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v1, v0, :cond_0

    .line 641
    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->rolledUpCaptions:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_0

    .line 643
    :cond_0
    return-void
.end method

.method public setIndent(I)V
    .locals 0
    .param p1, "indent"    # I

    .prologue
    .line 646
    iput p1, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->indent:I

    .line 647
    return-void
.end method

.method public setMidrowStyle(Landroid/text/style/CharacterStyle;I)V
    .locals 3
    .param p1, "style"    # Landroid/text/style/CharacterStyle;
    .param p2, "nextStyleIncrement"    # I

    .prologue
    .line 658
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->midrowStyles:Ljava/util/List;

    new-instance v1, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder$CueStyle;

    iget-object v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    invoke-direct {v1, p1, v2, p2}, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder$CueStyle;-><init>(Landroid/text/style/CharacterStyle;II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 659
    return-void
.end method

.method public setPreambleStyle(Landroid/text/style/CharacterStyle;)V
    .locals 1
    .param p1, "style"    # Landroid/text/style/CharacterStyle;

    .prologue
    .line 654
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->preambleStyles:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 655
    return-void
.end method

.method public setRow(I)V
    .locals 0
    .param p1, "row"    # I

    .prologue
    .line 629
    iput p1, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->row:I

    .line 630
    return-void
.end method

.method public setUnderline(Z)V
    .locals 6
    .param p1, "enabled"    # Z

    .prologue
    const/4 v5, -0x1

    .line 662
    if-eqz p1, :cond_1

    .line 663
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    iput v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->underlineStartPosition:I

    .line 670
    :cond_0
    :goto_0
    return-void

    .line 664
    :cond_1
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->underlineStartPosition:I

    if-eq v0, v5, :cond_0

    .line 666
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    new-instance v1, Landroid/text/style/UnderlineSpan;

    invoke-direct {v1}, Landroid/text/style/UnderlineSpan;-><init>()V

    iget v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->underlineStartPosition:I

    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    .line 667
    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    const/16 v4, 0x21

    .line 666
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 668
    iput v5, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->underlineStartPosition:I

    goto :goto_0
.end method

.method public tab(I)V
    .locals 1
    .param p1, "tabs"    # I

    .prologue
    .line 650
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->tabOffset:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->tabOffset:I

    .line 651
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 766
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea608Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
