.class public Lcom/google/android/exoplayer2/text/Cue;
.super Ljava/lang/Object;
.source "Cue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/text/Cue$LineType;,
        Lcom/google/android/exoplayer2/text/Cue$AnchorType;
    }
.end annotation


# static fields
.field public static final ANCHOR_TYPE_END:I = 0x2

.field public static final ANCHOR_TYPE_MIDDLE:I = 0x1

.field public static final ANCHOR_TYPE_START:I = 0x0

.field public static final DIMEN_UNSET:F = 1.4E-45f

.field public static final LINE_TYPE_FRACTION:I = 0x0

.field public static final LINE_TYPE_NUMBER:I = 0x1

.field public static final TYPE_UNSET:I = -0x80000000


# instance fields
.field public final line:F

.field public final lineAnchor:I

.field public final lineType:I

.field public final position:F

.field public final positionAnchor:I

.field public final size:F

.field public final text:Ljava/lang/CharSequence;

.field public final textAlignment:Landroid/text/Layout$Alignment;

.field public final windowColor:I

.field public final windowColorSet:Z


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;)V
    .locals 9
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    const/high16 v4, -0x80000000

    const/4 v3, 0x1

    .line 183
    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move v5, v4

    move v6, v3

    move v7, v4

    move v8, v3

    invoke-direct/range {v0 .. v8}, Lcom/google/android/exoplayer2/text/Cue;-><init>(Ljava/lang/CharSequence;Landroid/text/Layout$Alignment;FIIFIF)V

    .line 184
    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;Landroid/text/Layout$Alignment;FIIFIF)V
    .locals 11
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "textAlignment"    # Landroid/text/Layout$Alignment;
    .param p3, "line"    # F
    .param p4, "lineType"    # I
    .param p5, "lineAnchor"    # I
    .param p6, "position"    # F
    .param p7, "positionAnchor"    # I
    .param p8, "size"    # F

    .prologue
    .line 198
    const/4 v9, 0x0

    const/high16 v10, -0x1000000

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-direct/range {v0 .. v10}, Lcom/google/android/exoplayer2/text/Cue;-><init>(Ljava/lang/CharSequence;Landroid/text/Layout$Alignment;FIIFIFZI)V

    .line 200
    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;Landroid/text/Layout$Alignment;FIIFIFZI)V
    .locals 0
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "textAlignment"    # Landroid/text/Layout$Alignment;
    .param p3, "line"    # F
    .param p4, "lineType"    # I
    .param p5, "lineAnchor"    # I
    .param p6, "position"    # F
    .param p7, "positionAnchor"    # I
    .param p8, "size"    # F
    .param p9, "windowColorSet"    # Z
    .param p10, "windowColor"    # I

    .prologue
    .line 216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 217
    iput-object p1, p0, Lcom/google/android/exoplayer2/text/Cue;->text:Ljava/lang/CharSequence;

    .line 218
    iput-object p2, p0, Lcom/google/android/exoplayer2/text/Cue;->textAlignment:Landroid/text/Layout$Alignment;

    .line 219
    iput p3, p0, Lcom/google/android/exoplayer2/text/Cue;->line:F

    .line 220
    iput p4, p0, Lcom/google/android/exoplayer2/text/Cue;->lineType:I

    .line 221
    iput p5, p0, Lcom/google/android/exoplayer2/text/Cue;->lineAnchor:I

    .line 222
    iput p6, p0, Lcom/google/android/exoplayer2/text/Cue;->position:F

    .line 223
    iput p7, p0, Lcom/google/android/exoplayer2/text/Cue;->positionAnchor:I

    .line 224
    iput p8, p0, Lcom/google/android/exoplayer2/text/Cue;->size:F

    .line 225
    iput-boolean p9, p0, Lcom/google/android/exoplayer2/text/Cue;->windowColorSet:Z

    .line 226
    iput p10, p0, Lcom/google/android/exoplayer2/text/Cue;->windowColor:I

    .line 227
    return-void
.end method
