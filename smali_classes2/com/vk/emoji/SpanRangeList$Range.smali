.class Lcom/vk/emoji/SpanRangeList$Range;
.super Ljava/lang/Object;
.source "SpanRangeList.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/emoji/SpanRangeList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Range"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/vk/emoji/SpanRangeList$Range;",
        ">;"
    }
.end annotation


# instance fields
.field final end:I

.field final start:I


# direct methods
.method public constructor <init>(II)V
    .locals 0
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    iput p1, p0, Lcom/vk/emoji/SpanRangeList$Range;->start:I

    .line 66
    iput p2, p0, Lcom/vk/emoji/SpanRangeList$Range;->end:I

    .line 67
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/vk/emoji/SpanRangeList$Range;)I
    .locals 2
    .param p1, "o"    # Lcom/vk/emoji/SpanRangeList$Range;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 71
    iget v0, p0, Lcom/vk/emoji/SpanRangeList$Range;->start:I

    iget v1, p1, Lcom/vk/emoji/SpanRangeList$Range;->start:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 60
    check-cast p1, Lcom/vk/emoji/SpanRangeList$Range;

    invoke-virtual {p0, p1}, Lcom/vk/emoji/SpanRangeList$Range;->compareTo(Lcom/vk/emoji/SpanRangeList$Range;)I

    move-result v0

    return v0
.end method
