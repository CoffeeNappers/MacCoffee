.class final Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;
.super Ljava/lang/Object;
.source "Cea708Decoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "CueBuilder"
.end annotation


# static fields
.field private static final BORDER_AND_EDGE_TYPE_NONE:I = 0x0

.field private static final BORDER_AND_EDGE_TYPE_UNIFORM:I = 0x3

.field public static final COLOR_SOLID_BLACK:I

.field public static final COLOR_SOLID_WHITE:I

.field public static final COLOR_TRANSPARENT:I

.field private static final DEFAULT_PRIORITY:I = 0x4

.field private static final DIRECTION_BOTTOM_TO_TOP:I = 0x3

.field private static final DIRECTION_LEFT_TO_RIGHT:I = 0x0

.field private static final DIRECTION_RIGHT_TO_LEFT:I = 0x1

.field private static final DIRECTION_TOP_TO_BOTTOM:I = 0x2

.field private static final HORIZONTAL_SIZE:I = 0xd1

.field private static final JUSTIFICATION_CENTER:I = 0x2

.field private static final JUSTIFICATION_FULL:I = 0x3

.field private static final JUSTIFICATION_LEFT:I = 0x0

.field private static final JUSTIFICATION_RIGHT:I = 0x1

.field private static final MAXIMUM_ROW_COUNT:I = 0xf

.field private static final PEN_FONT_STYLE_DEFAULT:I = 0x0

.field private static final PEN_FONT_STYLE_MONOSPACED_WITHOUT_SERIFS:I = 0x3

.field private static final PEN_FONT_STYLE_MONOSPACED_WITH_SERIFS:I = 0x1

.field private static final PEN_FONT_STYLE_PROPORTIONALLY_SPACED_WITHOUT_SERIFS:I = 0x4

.field private static final PEN_FONT_STYLE_PROPORTIONALLY_SPACED_WITH_SERIFS:I = 0x2

.field private static final PEN_OFFSET_NORMAL:I = 0x1

.field private static final PEN_SIZE_STANDARD:I = 0x1

.field private static final PEN_STYLE_BACKGROUND:[I

.field private static final PEN_STYLE_EDGE_TYPE:[I

.field private static final PEN_STYLE_FONT_STYLE:[I

.field private static final RELATIVE_CUE_SIZE:I = 0x63

.field private static final VERTICAL_SIZE:I = 0x4a

.field private static final WINDOW_STYLE_FILL:[I

.field private static final WINDOW_STYLE_JUSTIFICATION:[I

.field private static final WINDOW_STYLE_PRINT_DIRECTION:[I

.field private static final WINDOW_STYLE_SCROLL_DIRECTION:[I

.field private static final WINDOW_STYLE_WORD_WRAP:[Z


# instance fields
.field private anchorId:I

.field private backgroundColor:I

.field private backgroundColorStartPosition:I

.field private final captionStringBuilder:Landroid/text/SpannableStringBuilder;

.field private defined:Z

.field private foregroundColor:I

.field private foregroundColorStartPosition:I

.field private horizontalAnchor:I

.field private italicsStartPosition:I

.field private justification:I

.field private penStyleId:I

.field private priority:I

.field private relativePositioning:Z

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

.field private rowCount:I

.field private rowLock:Z

.field private underlineStartPosition:I

.field private verticalAnchor:I

.field private visible:Z

.field private windowFillColor:I

.field private windowStyleId:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x7

    const/4 v3, 0x0

    .line 784
    invoke-static {v5, v5, v5, v3}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->getArgbColorFromCeaColor(IIII)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_SOLID_WHITE:I

    .line 785
    invoke-static {v3, v3, v3, v3}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->getArgbColorFromCeaColor(IIII)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_SOLID_BLACK:I

    .line 786
    invoke-static {v3, v3, v3, v6}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->getArgbColorFromCeaColor(IIII)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_TRANSPARENT:I

    .line 802
    new-array v0, v4, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->WINDOW_STYLE_JUSTIFICATION:[I

    .line 807
    new-array v0, v4, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->WINDOW_STYLE_PRINT_DIRECTION:[I

    .line 812
    new-array v0, v4, [I

    fill-array-data v0, :array_2

    sput-object v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->WINDOW_STYLE_SCROLL_DIRECTION:[I

    .line 817
    new-array v0, v4, [Z

    fill-array-data v0, :array_3

    sput-object v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->WINDOW_STYLE_WORD_WRAP:[Z

    .line 820
    new-array v0, v4, [I

    sget v1, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_SOLID_BLACK:I

    aput v1, v0, v3

    sget v1, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_TRANSPARENT:I

    aput v1, v0, v7

    sget v1, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_SOLID_BLACK:I

    aput v1, v0, v5

    sget v1, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_SOLID_BLACK:I

    aput v1, v0, v6

    const/4 v1, 0x4

    sget v2, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_TRANSPARENT:I

    aput v2, v0, v1

    const/4 v1, 0x5

    sget v2, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_SOLID_BLACK:I

    aput v2, v0, v1

    const/4 v1, 0x6

    sget v2, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_SOLID_BLACK:I

    aput v2, v0, v1

    sput-object v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->WINDOW_STYLE_FILL:[I

    .line 826
    new-array v0, v4, [I

    fill-array-data v0, :array_4

    sput-object v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->PEN_STYLE_FONT_STYLE:[I

    .line 833
    new-array v0, v4, [I

    fill-array-data v0, :array_5

    sput-object v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->PEN_STYLE_EDGE_TYPE:[I

    .line 838
    new-array v0, v4, [I

    sget v1, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_SOLID_BLACK:I

    aput v1, v0, v3

    sget v1, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_SOLID_BLACK:I

    aput v1, v0, v7

    sget v1, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_SOLID_BLACK:I

    aput v1, v0, v5

    sget v1, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_SOLID_BLACK:I

    aput v1, v0, v6

    const/4 v1, 0x4

    sget v2, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_SOLID_BLACK:I

    aput v2, v0, v1

    const/4 v1, 0x5

    sget v2, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_TRANSPARENT:I

    aput v2, v0, v1

    const/4 v1, 0x6

    sget v2, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_TRANSPARENT:I

    aput v2, v0, v1

    sput-object v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->PEN_STYLE_BACKGROUND:[I

    return-void

    .line 802
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x2
        0x0
    .end array-data

    .line 807
    :array_1
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x2
    .end array-data

    .line 812
    :array_2
    .array-data 4
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x1
    .end array-data

    .line 817
    :array_3
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x1t
        0x1t
        0x1t
        0x0t
    .end array-data

    .line 826
    :array_4
    .array-data 4
        0x0
        0x1
        0x2
        0x3
        0x4
        0x3
        0x4
    .end array-data

    .line 833
    :array_5
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x3
        0x3
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 868
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 869
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->rolledUpCaptions:Ljava/util/List;

    .line 870
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    .line 871
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->reset()V

    .line 872
    return-void
.end method

.method public static getArgbColorFromCeaColor(III)I
    .locals 1
    .param p0, "red"    # I
    .param p1, "green"    # I
    .param p2, "blue"    # I

    .prologue
    .line 1188
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->getArgbColorFromCeaColor(IIII)I

    move-result v0

    return v0
.end method

.method public static getArgbColorFromCeaColor(IIII)I
    .locals 6
    .param p0, "red"    # I
    .param p1, "green"    # I
    .param p2, "blue"    # I
    .param p3, "opacity"    # I

    .prologue
    const/16 v1, 0xff

    const/4 v5, 0x1

    const/4 v3, 0x4

    const/4 v2, 0x0

    .line 1192
    invoke-static {p0, v2, v3}, Lcom/google/android/exoplayer2/util/Assertions;->checkIndex(III)I

    .line 1193
    invoke-static {p1, v2, v3}, Lcom/google/android/exoplayer2/util/Assertions;->checkIndex(III)I

    .line 1194
    invoke-static {p2, v2, v3}, Lcom/google/android/exoplayer2/util/Assertions;->checkIndex(III)I

    .line 1195
    invoke-static {p3, v2, v3}, Lcom/google/android/exoplayer2/util/Assertions;->checkIndex(III)I

    .line 1198
    packed-switch p3, :pswitch_data_0

    .line 1211
    const/16 v0, 0xff

    .line 1217
    .local v0, "alpha":I
    :goto_0
    if-le p0, v5, :cond_0

    move v4, v1

    :goto_1
    if-le p1, v5, :cond_1

    move v3, v1

    :goto_2
    if-le p2, v5, :cond_2

    :goto_3
    invoke-static {v0, v4, v3, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result v1

    return v1

    .line 1202
    .end local v0    # "alpha":I
    :pswitch_0
    const/16 v0, 0xff

    .line 1203
    .restart local v0    # "alpha":I
    goto :goto_0

    .line 1205
    .end local v0    # "alpha":I
    :pswitch_1
    const/16 v0, 0x7f

    .line 1206
    .restart local v0    # "alpha":I
    goto :goto_0

    .line 1208
    .end local v0    # "alpha":I
    :pswitch_2
    const/4 v0, 0x0

    .line 1209
    .restart local v0    # "alpha":I
    goto :goto_0

    :cond_0
    move v4, v2

    .line 1217
    goto :goto_1

    :cond_1
    move v3, v2

    goto :goto_2

    :cond_2
    move v1, v2

    goto :goto_3

    .line 1198
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public append(C)V
    .locals 4
    .param p1, "text"    # C

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x0

    .line 1051
    const/16 v0, 0xa

    if-ne p1, v0, :cond_6

    .line 1052
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->rolledUpCaptions:Ljava/util/List;

    invoke-virtual {p0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->buildSpannableString()Landroid/text/SpannableString;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1053
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->clear()V

    .line 1055
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->italicsStartPosition:I

    if-eq v0, v3, :cond_0

    .line 1056
    iput v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->italicsStartPosition:I

    .line 1058
    :cond_0
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->underlineStartPosition:I

    if-eq v0, v3, :cond_1

    .line 1059
    iput v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->underlineStartPosition:I

    .line 1061
    :cond_1
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->foregroundColorStartPosition:I

    if-eq v0, v3, :cond_2

    .line 1062
    iput v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->foregroundColorStartPosition:I

    .line 1064
    :cond_2
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->backgroundColorStartPosition:I

    if-eq v0, v3, :cond_3

    .line 1065
    iput v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->backgroundColorStartPosition:I

    .line 1068
    :cond_3
    :goto_0
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->rowLock:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->rolledUpCaptions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->rowCount:I

    if-ge v0, v1, :cond_5

    :cond_4
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->rolledUpCaptions:Ljava/util/List;

    .line 1069
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0xf

    if-lt v0, v1, :cond_7

    .line 1070
    :cond_5
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->rolledUpCaptions:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_0

    .line 1073
    :cond_6
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0, p1}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 1075
    :cond_7
    return-void
.end method

.method public backspace()V
    .locals 3

    .prologue
    .line 1044
    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    .line 1045
    .local v0, "length":I
    if-lez v0, :cond_0

    .line 1046
    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2, v0}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 1048
    :cond_0
    return-void
.end method

.method public build()Lcom/google/android/exoplayer2/text/cea/Cea708Cue;
    .locals 13

    .prologue
    const/4 v4, 0x0

    const/high16 v8, 0x42c60000    # 99.0f

    const v11, 0x3f666666    # 0.9f

    const v10, 0x3d4ccccd    # 0.05f

    const/4 v9, 0x1

    .line 1108
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1110
    const/4 v0, 0x0

    .line 1182
    :goto_0
    return-object v0

    .line 1113
    :cond_0
    new-instance v1, Landroid/text/SpannableStringBuilder;

    invoke-direct {v1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 1116
    .local v1, "cueString":Landroid/text/SpannableStringBuilder;
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->rolledUpCaptions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v12, v0, :cond_1

    .line 1117
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->rolledUpCaptions:Ljava/util/List;

    invoke-interface {v0, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1118
    const/16 v0, 0xa

    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 1116
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .line 1121
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->buildSpannableString()Landroid/text/SpannableString;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1126
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->justification:I

    packed-switch v0, :pswitch_data_0

    .line 1139
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Unexpected justification value: "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v8, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->justification:I

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1130
    :pswitch_0
    sget-object v2, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 1144
    .local v2, "alignment":Landroid/text/Layout$Alignment;
    :goto_2
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->relativePositioning:Z

    if-eqz v0, :cond_2

    .line 1145
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->horizontalAnchor:I

    int-to-float v0, v0

    div-float v6, v0, v8

    .line 1146
    .local v6, "position":F
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->verticalAnchor:I

    int-to-float v0, v0

    div-float v3, v0, v8

    .line 1152
    .local v3, "line":F
    :goto_3
    mul-float v0, v6, v11

    add-float v6, v0, v10

    .line 1153
    mul-float v0, v3, v11

    add-float v3, v0, v10

    .line 1163
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->anchorId:I

    rem-int/lit8 v0, v0, 0x3

    if-nez v0, :cond_3

    .line 1164
    const/4 v5, 0x0

    .line 1172
    .local v5, "verticalAnchorType":I
    :goto_4
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->anchorId:I

    div-int/lit8 v0, v0, 0x3

    if-nez v0, :cond_5

    .line 1173
    const/4 v7, 0x0

    .line 1180
    .local v7, "horizontalAnchorType":I
    :goto_5
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->windowFillColor:I

    sget v8, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_SOLID_BLACK:I

    if-eq v0, v8, :cond_7

    .line 1182
    .local v9, "windowColorSet":Z
    :goto_6
    new-instance v0, Lcom/google/android/exoplayer2/text/cea/Cea708Cue;

    const/4 v8, 0x1

    iget v10, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->windowFillColor:I

    iget v11, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->priority:I

    invoke-direct/range {v0 .. v11}, Lcom/google/android/exoplayer2/text/cea/Cea708Cue;-><init>(Ljava/lang/CharSequence;Landroid/text/Layout$Alignment;FIIFIFZII)V

    goto :goto_0

    .line 1133
    .end local v2    # "alignment":Landroid/text/Layout$Alignment;
    .end local v3    # "line":F
    .end local v5    # "verticalAnchorType":I
    .end local v6    # "position":F
    .end local v7    # "horizontalAnchorType":I
    .end local v9    # "windowColorSet":Z
    :pswitch_1
    sget-object v2, Landroid/text/Layout$Alignment;->ALIGN_OPPOSITE:Landroid/text/Layout$Alignment;

    .line 1134
    .restart local v2    # "alignment":Landroid/text/Layout$Alignment;
    goto :goto_2

    .line 1136
    .end local v2    # "alignment":Landroid/text/Layout$Alignment;
    :pswitch_2
    sget-object v2, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    .line 1137
    .restart local v2    # "alignment":Landroid/text/Layout$Alignment;
    goto :goto_2

    .line 1148
    :cond_2
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->horizontalAnchor:I

    int-to-float v0, v0

    const/high16 v8, 0x43510000    # 209.0f

    div-float v6, v0, v8

    .line 1149
    .restart local v6    # "position":F
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->verticalAnchor:I

    int-to-float v0, v0

    const/high16 v8, 0x42940000    # 74.0f

    div-float v3, v0, v8

    .restart local v3    # "line":F
    goto :goto_3

    .line 1165
    :cond_3
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->anchorId:I

    rem-int/lit8 v0, v0, 0x3

    if-ne v0, v9, :cond_4

    .line 1166
    const/4 v5, 0x1

    .restart local v5    # "verticalAnchorType":I
    goto :goto_4

    .line 1168
    .end local v5    # "verticalAnchorType":I
    :cond_4
    const/4 v5, 0x2

    .restart local v5    # "verticalAnchorType":I
    goto :goto_4

    .line 1174
    :cond_5
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->anchorId:I

    div-int/lit8 v0, v0, 0x3

    if-ne v0, v9, :cond_6

    .line 1175
    const/4 v7, 0x1

    .restart local v7    # "horizontalAnchorType":I
    goto :goto_5

    .line 1177
    .end local v7    # "horizontalAnchorType":I
    :cond_6
    const/4 v7, 0x2

    .restart local v7    # "horizontalAnchorType":I
    goto :goto_5

    :cond_7
    move v9, v4

    .line 1180
    goto :goto_6

    .line 1126
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public buildSpannableString()Landroid/text/SpannableString;
    .locals 6

    .prologue
    const/16 v5, 0x21

    const/4 v4, -0x1

    .line 1078
    new-instance v1, Landroid/text/SpannableStringBuilder;

    iget-object v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-direct {v1, v2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1080
    .local v1, "spannableStringBuilder":Landroid/text/SpannableStringBuilder;
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    .line 1082
    .local v0, "length":I
    if-lez v0, :cond_3

    .line 1083
    iget v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->italicsStartPosition:I

    if-eq v2, v4, :cond_0

    .line 1084
    new-instance v2, Landroid/text/style/StyleSpan;

    const/4 v3, 0x2

    invoke-direct {v2, v3}, Landroid/text/style/StyleSpan;-><init>(I)V

    iget v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->italicsStartPosition:I

    invoke-virtual {v1, v2, v3, v0, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 1088
    :cond_0
    iget v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->underlineStartPosition:I

    if-eq v2, v4, :cond_1

    .line 1089
    new-instance v2, Landroid/text/style/UnderlineSpan;

    invoke-direct {v2}, Landroid/text/style/UnderlineSpan;-><init>()V

    iget v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->underlineStartPosition:I

    invoke-virtual {v1, v2, v3, v0, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 1093
    :cond_1
    iget v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->foregroundColorStartPosition:I

    if-eq v2, v4, :cond_2

    .line 1094
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    iget v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->foregroundColor:I

    invoke-direct {v2, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    iget v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->foregroundColorStartPosition:I

    invoke-virtual {v1, v2, v3, v0, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 1098
    :cond_2
    iget v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->backgroundColorStartPosition:I

    if-eq v2, v4, :cond_3

    .line 1099
    new-instance v2, Landroid/text/style/BackgroundColorSpan;

    iget v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->backgroundColor:I

    invoke-direct {v2, v3}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    iget v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->backgroundColorStartPosition:I

    invoke-virtual {v1, v2, v3, v0, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 1104
    :cond_3
    new-instance v2, Landroid/text/SpannableString;

    invoke-direct {v2, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    return-object v2
.end method

.method public clear()V
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 900
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->rolledUpCaptions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 901
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->clear()V

    .line 902
    iput v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->italicsStartPosition:I

    .line 903
    iput v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->underlineStartPosition:I

    .line 904
    iput v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->foregroundColorStartPosition:I

    .line 905
    iput v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->backgroundColorStartPosition:I

    .line 906
    return-void
.end method

.method public defineWindow(ZZZIZIIIIIII)V
    .locals 11
    .param p1, "visible"    # Z
    .param p2, "rowLock"    # Z
    .param p3, "columnLock"    # Z
    .param p4, "priority"    # I
    .param p5, "relativePositioning"    # Z
    .param p6, "verticalAnchor"    # I
    .param p7, "horizontalAnchor"    # I
    .param p8, "rowCount"    # I
    .param p9, "columnCount"    # I
    .param p10, "anchorId"    # I
    .param p11, "windowStyleId"    # I
    .param p12, "penStyleId"    # I

    .prologue
    .line 923
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->defined:Z

    .line 924
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->visible:Z

    .line 925
    iput-boolean p2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->rowLock:Z

    .line 926
    iput p4, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->priority:I

    .line 927
    move/from16 v0, p5

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->relativePositioning:Z

    .line 928
    move/from16 v0, p6

    iput v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->verticalAnchor:I

    .line 929
    move/from16 v0, p7

    iput v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->horizontalAnchor:I

    .line 930
    move/from16 v0, p10

    iput v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->anchorId:I

    .line 933
    iget v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->rowCount:I

    add-int/lit8 v2, p8, 0x1

    if-eq v1, v2, :cond_2

    .line 934
    add-int/lit8 v1, p8, 0x1

    iput v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->rowCount:I

    .line 937
    :goto_0
    if-eqz p2, :cond_0

    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->rolledUpCaptions:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iget v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->rowCount:I

    if-ge v1, v2, :cond_1

    :cond_0
    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->rolledUpCaptions:Ljava/util/List;

    .line 938
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/16 v2, 0xf

    if-lt v1, v2, :cond_2

    .line 939
    :cond_1
    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->rolledUpCaptions:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_0

    .line 945
    :cond_2
    if-eqz p11, :cond_3

    iget v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->windowStyleId:I

    move/from16 v0, p11

    if-eq v1, v0, :cond_3

    .line 946
    move/from16 v0, p11

    iput v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->windowStyleId:I

    .line 948
    add-int/lit8 v10, p11, -0x1

    .line 950
    .local v10, "windowStyleIdIndex":I
    sget-object v1, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->WINDOW_STYLE_FILL:[I

    aget v2, v1, v10

    sget v3, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_TRANSPARENT:I

    sget-object v1, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->WINDOW_STYLE_WORD_WRAP:[Z

    aget-boolean v4, v1, v10

    const/4 v5, 0x0

    sget-object v1, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->WINDOW_STYLE_PRINT_DIRECTION:[I

    aget v6, v1, v10

    sget-object v1, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->WINDOW_STYLE_SCROLL_DIRECTION:[I

    aget v7, v1, v10

    sget-object v1, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->WINDOW_STYLE_JUSTIFICATION:[I

    aget v8, v1, v10

    move-object v1, p0

    invoke-virtual/range {v1 .. v8}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->setWindowAttributes(IIZIIII)V

    .line 957
    .end local v10    # "windowStyleIdIndex":I
    :cond_3
    if-eqz p12, :cond_4

    iget v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->penStyleId:I

    move/from16 v0, p12

    if-eq v1, v0, :cond_4

    .line 958
    move/from16 v0, p12

    iput v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->penStyleId:I

    .line 960
    add-int/lit8 v9, p12, -0x1

    .line 963
    .local v9, "penStyleIdIndex":I
    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    sget-object v1, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->PEN_STYLE_EDGE_TYPE:[I

    aget v7, v1, v9

    sget-object v1, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->PEN_STYLE_FONT_STYLE:[I

    aget v8, v1, v9

    move-object v1, p0

    invoke-virtual/range {v1 .. v8}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->setPenAttributes(IIIZZII)V

    .line 965
    sget v1, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_SOLID_WHITE:I

    sget-object v2, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->PEN_STYLE_BACKGROUND:[I

    aget v2, v2, v9

    sget v3, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_SOLID_BLACK:I

    invoke-virtual {p0, v1, v2, v3}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->setPenColor(III)V

    .line 967
    .end local v9    # "penStyleIdIndex":I
    :cond_4
    return-void
.end method

.method public isDefined()Z
    .locals 1

    .prologue
    .line 909
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->defined:Z

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 875
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->isDefined()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->rolledUpCaptions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isVisible()Z
    .locals 1

    .prologue
    .line 917
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->visible:Z

    return v0
.end method

.method public reset()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 879
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->clear()V

    .line 881
    iput-boolean v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->defined:Z

    .line 882
    iput-boolean v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->visible:Z

    .line 883
    const/4 v0, 0x4

    iput v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->priority:I

    .line 884
    iput-boolean v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->relativePositioning:Z

    .line 885
    iput v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->verticalAnchor:I

    .line 886
    iput v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->horizontalAnchor:I

    .line 887
    iput v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->anchorId:I

    .line 888
    const/16 v0, 0xf

    iput v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->rowCount:I

    .line 889
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->rowLock:Z

    .line 890
    iput v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->justification:I

    .line 891
    iput v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->windowStyleId:I

    .line 892
    iput v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->penStyleId:I

    .line 893
    sget v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_SOLID_BLACK:I

    iput v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->windowFillColor:I

    .line 895
    sget v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_SOLID_WHITE:I

    iput v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->foregroundColor:I

    .line 896
    sget v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_SOLID_BLACK:I

    iput v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->backgroundColor:I

    .line 897
    return-void
.end method

.method public setPenAttributes(IIIZZII)V
    .locals 6
    .param p1, "textTag"    # I
    .param p2, "offset"    # I
    .param p3, "penSize"    # I
    .param p4, "italicsToggle"    # Z
    .param p5, "underlineToggle"    # Z
    .param p6, "edgeType"    # I
    .param p7, "fontStyle"    # I

    .prologue
    const/16 v5, 0x21

    const/4 v4, -0x1

    .line 987
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->italicsStartPosition:I

    if-eq v0, v4, :cond_2

    .line 988
    if-nez p4, :cond_0

    .line 989
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    new-instance v1, Landroid/text/style/StyleSpan;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    iget v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->italicsStartPosition:I

    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    .line 990
    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    .line 989
    invoke-virtual {v0, v1, v2, v3, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 991
    iput v4, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->italicsStartPosition:I

    .line 997
    :cond_0
    :goto_0
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->underlineStartPosition:I

    if-eq v0, v4, :cond_3

    .line 998
    if-nez p5, :cond_1

    .line 999
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    new-instance v1, Landroid/text/style/UnderlineSpan;

    invoke-direct {v1}, Landroid/text/style/UnderlineSpan;-><init>()V

    iget v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->underlineStartPosition:I

    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    .line 1000
    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    .line 999
    invoke-virtual {v0, v1, v2, v3, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 1001
    iput v4, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->underlineStartPosition:I

    .line 1009
    :cond_1
    :goto_1
    return-void

    .line 993
    :cond_2
    if-eqz p4, :cond_0

    .line 994
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    iput v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->italicsStartPosition:I

    goto :goto_0

    .line 1003
    :cond_3
    if-eqz p5, :cond_1

    .line 1004
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    iput v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->underlineStartPosition:I

    goto :goto_1
.end method

.method public setPenColor(III)V
    .locals 6
    .param p1, "foregroundColor"    # I
    .param p2, "backgroundColor"    # I
    .param p3, "edgeColor"    # I

    .prologue
    const/16 v5, 0x21

    const/4 v4, -0x1

    .line 1012
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->foregroundColorStartPosition:I

    if-eq v0, v4, :cond_0

    .line 1013
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->foregroundColor:I

    if-eq v0, p1, :cond_0

    .line 1014
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    iget v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->foregroundColor:I

    invoke-direct {v1, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    iget v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->foregroundColorStartPosition:I

    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    .line 1015
    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    .line 1014
    invoke-virtual {v0, v1, v2, v3, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 1019
    :cond_0
    sget v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_SOLID_WHITE:I

    if-eq p1, v0, :cond_1

    .line 1020
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    iput v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->foregroundColorStartPosition:I

    .line 1021
    iput p1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->foregroundColor:I

    .line 1024
    :cond_1
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->backgroundColorStartPosition:I

    if-eq v0, v4, :cond_2

    .line 1025
    iget v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->backgroundColor:I

    if-eq v0, p2, :cond_2

    .line 1026
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    new-instance v1, Landroid/text/style/BackgroundColorSpan;

    iget v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->backgroundColor:I

    invoke-direct {v1, v2}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    iget v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->backgroundColorStartPosition:I

    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    .line 1027
    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    .line 1026
    invoke-virtual {v0, v1, v2, v3, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 1031
    :cond_2
    sget v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->COLOR_SOLID_BLACK:I

    if-eq p2, v0, :cond_3

    .line 1032
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->captionStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    iput v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->backgroundColorStartPosition:I

    .line 1033
    iput p2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->backgroundColor:I

    .line 1037
    :cond_3
    return-void
.end method

.method public setPenLocation(II)V
    .locals 0
    .param p1, "row"    # I
    .param p2, "column"    # I

    .prologue
    .line 1041
    return-void
.end method

.method public setVisibility(Z)V
    .locals 0
    .param p1, "visible"    # Z

    .prologue
    .line 913
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->visible:Z

    .line 914
    return-void
.end method

.method public setWindowAttributes(IIZIIII)V
    .locals 0
    .param p1, "fillColor"    # I
    .param p2, "borderColor"    # I
    .param p3, "wordWrapToggle"    # Z
    .param p4, "borderType"    # I
    .param p5, "printDirection"    # I
    .param p6, "scrollDirection"    # I
    .param p7, "justification"    # I

    .prologue
    .line 972
    iput p1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->windowFillColor:I

    .line 977
    iput p7, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->justification:I

    .line 979
    return-void
.end method
