.class public Lcom/vkontakte/android/ui/util/AlphabetSegmenter;
.super Lcom/vkontakte/android/ui/util/SectionSegmenter;
.source "AlphabetSegmenter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/util/AlphabetSegmenter$Converter;
    }
.end annotation


# static fields
.field public static final IMPORTANT_SECTION_TITLE:Ljava/lang/CharSequence;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    const-string/jumbo v0, "\u2605"

    sput-object v0, Lcom/vkontakte/android/ui/util/AlphabetSegmenter;->IMPORTANT_SECTION_TITLE:Ljava/lang/CharSequence;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Lcom/vkontakte/android/ui/util/SectionSegmenter;-><init>()V

    return-void
.end method


# virtual methods
.method public bind(Ljava/util/List;Ljava/util/Comparator;Lcom/vkontakte/android/ui/util/AlphabetSegmenter$Converter;IZ)V
    .locals 9
    .param p4, "importantSize"    # I
    .param p5, "buildIndex"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<TT;>;",
            "Ljava/util/Comparator",
            "<TT;>;",
            "Lcom/vkontakte/android/ui/util/AlphabetSegmenter$Converter",
            "<TT;>;IZ)V"
        }
    .end annotation

    .prologue
    .local p1, "objects":Ljava/util/List;, "Ljava/util/List<TT;>;"
    .local p2, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<TT;>;"
    .local p3, "converter":Lcom/vkontakte/android/ui/util/AlphabetSegmenter$Converter;, "Lcom/vkontakte/android/ui/util/AlphabetSegmenter$Converter<TT;>;"
    const/4 v6, 0x0

    .line 14
    if-eqz p5, :cond_5

    .line 15
    if-lez p4, :cond_0

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_0

    .line 16
    sget-object v7, Lcom/vkontakte/android/ui/util/AlphabetSegmenter;->IMPORTANT_SECTION_TITLE:Ljava/lang/CharSequence;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v8

    invoke-static {v8, p4}, Ljava/lang/Math;->min(II)I

    move-result v8

    invoke-virtual {p0, p1, v7, v6, v8}, Lcom/vkontakte/android/ui/util/AlphabetSegmenter;->addSection(Ljava/util/List;Ljava/lang/CharSequence;II)V

    .line 18
    :cond_0
    invoke-static {p1, p2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 20
    const/4 v5, 0x0

    .line 21
    .local v5, "start":I
    const/4 v4, 0x0

    .line 23
    .local v4, "prevLetter":C
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v7

    if-gt v2, v7, :cond_6

    .line 25
    const/4 v1, 0x0

    .line 26
    .local v1, "currentLetter":C
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v7

    if-ge v2, v7, :cond_4

    .line 27
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 28
    .local v3, "object":Ljava/lang/Object;, "TT;"
    invoke-interface {p3, v3}, Lcom/vkontakte/android/ui/util/AlphabetSegmenter$Converter;->getIndex(Ljava/lang/Object;)C

    move-result v1

    .line 29
    if-eq v4, v1, :cond_3

    const/4 v0, 0x1

    .line 34
    .end local v3    # "object":Ljava/lang/Object;, "TT;"
    .local v0, "buildSection":Z
    :goto_1
    if-eqz v0, :cond_2

    .line 35
    if-eqz v4, :cond_1

    .line 36
    invoke-static {v4}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, p1, v7, v5, v2}, Lcom/vkontakte/android/ui/util/AlphabetSegmenter;->addSection(Ljava/util/List;Ljava/lang/CharSequence;II)V

    .line 38
    :cond_1
    move v4, v1

    .line 39
    move v5, v2

    .line 23
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v0    # "buildSection":Z
    .restart local v3    # "object":Ljava/lang/Object;, "TT;"
    :cond_3
    move v0, v6

    .line 29
    goto :goto_1

    .line 31
    .end local v3    # "object":Ljava/lang/Object;, "TT;"
    :cond_4
    const/4 v0, 0x1

    .restart local v0    # "buildSection":Z
    goto :goto_1

    .line 43
    .end local v0    # "buildSection":Z
    .end local v1    # "currentLetter":C
    .end local v2    # "i":I
    .end local v4    # "prevLetter":C
    .end local v5    # "start":I
    :cond_5
    invoke-virtual {p0, p1, v6}, Lcom/vkontakte/android/ui/util/AlphabetSegmenter;->addItems(Ljava/util/List;Z)V

    .line 45
    :cond_6
    return-void
.end method
