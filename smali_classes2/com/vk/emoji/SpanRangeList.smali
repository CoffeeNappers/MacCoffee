.class final Lcom/vk/emoji/SpanRangeList;
.super Ljava/lang/Object;
.source "SpanRangeList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/emoji/SpanRangeList$Range;
    }
.end annotation


# static fields
.field public static final SPAN_NOT_FOUND:I = -0x1


# instance fields
.field private final ranges:[Lcom/vk/emoji/SpanRangeList$Range;


# direct methods
.method public constructor <init>(Landroid/text/Spanned;)V
    .locals 6
    .param p1, "spanned"    # Landroid/text/Spanned;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const/4 v2, 0x0

    invoke-interface {p1}, Landroid/text/Spanned;->length()I

    move-result v3

    const-class v4, Lcom/vk/emoji/EmojiSpan;

    invoke-interface {p1, v2, v3, v4}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/vk/emoji/EmojiSpan;

    .line 16
    .local v1, "spans":[Lcom/vk/emoji/EmojiSpan;
    array-length v2, v1

    new-array v2, v2, [Lcom/vk/emoji/SpanRangeList$Range;

    iput-object v2, p0, Lcom/vk/emoji/SpanRangeList;->ranges:[Lcom/vk/emoji/SpanRangeList$Range;

    .line 17
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 18
    iget-object v2, p0, Lcom/vk/emoji/SpanRangeList;->ranges:[Lcom/vk/emoji/SpanRangeList$Range;

    new-instance v3, Lcom/vk/emoji/SpanRangeList$Range;

    aget-object v4, v1, v0

    invoke-interface {p1, v4}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v4

    aget-object v5, v1, v0

    invoke-interface {p1, v5}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v5

    invoke-direct {v3, v4, v5}, Lcom/vk/emoji/SpanRangeList$Range;-><init>(II)V

    aput-object v3, v2, v0

    .line 17
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 20
    :cond_0
    iget-object v2, p0, Lcom/vk/emoji/SpanRangeList;->ranges:[Lcom/vk/emoji/SpanRangeList$Range;

    invoke-static {v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 21
    return-void
.end method

.method private rangeBinarySearch(I)I
    .locals 5
    .param p1, "index"    # I

    .prologue
    .line 42
    const/4 v1, 0x0

    .line 43
    .local v1, "low":I
    iget-object v4, p0, Lcom/vk/emoji/SpanRangeList;->ranges:[Lcom/vk/emoji/SpanRangeList$Range;

    array-length v4, v4

    add-int/lit8 v0, v4, -0x1

    .line 45
    .local v0, "high":I
    :cond_0
    :goto_0
    if-gt v1, v0, :cond_3

    .line 46
    add-int v4, v1, v0

    ushr-int/lit8 v2, v4, 0x1

    .line 47
    .local v2, "mid":I
    iget-object v4, p0, Lcom/vk/emoji/SpanRangeList;->ranges:[Lcom/vk/emoji/SpanRangeList$Range;

    aget-object v3, v4, v2

    .line 49
    .local v3, "midVal":Lcom/vk/emoji/SpanRangeList$Range;
    iget v4, v3, Lcom/vk/emoji/SpanRangeList$Range;->start:I

    if-lt p1, v4, :cond_1

    iget v4, v3, Lcom/vk/emoji/SpanRangeList$Range;->end:I

    if-ge p1, v4, :cond_1

    .line 57
    .end local v2    # "mid":I
    .end local v3    # "midVal":Lcom/vk/emoji/SpanRangeList$Range;
    :goto_1
    return v2

    .line 51
    .restart local v2    # "mid":I
    .restart local v3    # "midVal":Lcom/vk/emoji/SpanRangeList$Range;
    :cond_1
    iget v4, v3, Lcom/vk/emoji/SpanRangeList$Range;->end:I

    if-gt v4, p1, :cond_2

    .line 52
    add-int/lit8 v1, v2, 0x1

    goto :goto_0

    .line 53
    :cond_2
    iget v4, v3, Lcom/vk/emoji/SpanRangeList$Range;->start:I

    if-le v4, p1, :cond_0

    .line 54
    add-int/lit8 v0, v2, -0x1

    goto :goto_0

    .line 57
    .end local v2    # "mid":I
    .end local v3    # "midVal":Lcom/vk/emoji/SpanRangeList$Range;
    :cond_3
    const/4 v2, -0x1

    goto :goto_1
.end method


# virtual methods
.method public nextSpanStart(I)I
    .locals 3
    .param p1, "index"    # I

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/vk/emoji/SpanRangeList;->rangeBinarySearch(I)I

    move-result v0

    .line 34
    .local v0, "res":I
    if-ltz v0, :cond_0

    iget-object v1, p0, Lcom/vk/emoji/SpanRangeList;->ranges:[Lcom/vk/emoji/SpanRangeList$Range;

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    if-lt v0, v1, :cond_1

    .line 35
    :cond_0
    const/4 v1, -0x1

    .line 37
    :goto_0
    return v1

    :cond_1
    iget-object v1, p0, Lcom/vk/emoji/SpanRangeList;->ranges:[Lcom/vk/emoji/SpanRangeList$Range;

    add-int/lit8 v2, v0, 0x1

    aget-object v1, v1, v2

    iget v1, v1, Lcom/vk/emoji/SpanRangeList$Range;->start:I

    goto :goto_0
.end method

.method public spanEnd(I)I
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/vk/emoji/SpanRangeList;->rangeBinarySearch(I)I

    move-result v0

    .line 25
    .local v0, "res":I
    if-gez v0, :cond_0

    .line 26
    const/4 v1, -0x1

    .line 28
    :goto_0
    return v1

    :cond_0
    iget-object v1, p0, Lcom/vk/emoji/SpanRangeList;->ranges:[Lcom/vk/emoji/SpanRangeList$Range;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/vk/emoji/SpanRangeList$Range;->end:I

    goto :goto_0
.end method
