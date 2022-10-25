.class public Lcom/vkontakte/android/LinkParser;
.super Ljava/lang/Object;
.source "LinkParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/LinkParser$CharRange;
    }
.end annotation


# static fields
.field public static final ALL:I = 0x7

.field public static final BOARD_REPLIES_PATTERN:Ljava/util/regex/Pattern;

.field public static final HASHTAGS:I = 0x4

.field public static final HASHTAGS_PATTERN:Ljava/util/regex/Pattern;

.field public static final MENTIONS_PATTERN:Ljava/util/regex/Pattern;

.field public static final URLS:I = 0x1

.field public static final URL_PATTERN:Ljava/util/regex/Pattern;

.field public static final VK_MENTIONS:I = 0x2


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 24
    const-string/jumbo v0, "(?:http(?:s)?:\\/\\/)?(?:(?:[a-z\u0430-\u044f]|[a-z\u0430-\u044f0-9_-]{2,})\\.)+(?:[a-z][a-z0-9-]{1,20}|\u0440\u0444)(?:\\/[!a-z0-9\u0430-\u044f\u0451_z%~:\\.,-]*)*(?:[\\?&#:\\/][a-z0-9\\[\\]_]*(?:=?[a-z0-9~\\._=,%\\|+!-]*))*(?<![\\.,:!?-])"

    const/16 v1, 0x42

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/LinkParser;->URL_PATTERN:Ljava/util/regex/Pattern;

    .line 25
    const-string/jumbo v0, "\\[((?:id|club)[0-9]+)\\|([^\\]]+)\\]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/LinkParser;->MENTIONS_PATTERN:Ljava/util/regex/Pattern;

    .line 26
    const-string/jumbo v0, "\\[((?:id|club)[0-9]+):bp[0-9_-]+\\|([^\\]]+)\\]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/LinkParser;->BOARD_REPLIES_PATTERN:Ljava/util/regex/Pattern;

    .line 27
    const-string/jumbo v0, "\\B(#\\w{2,})(?:@([-a-zA-Z0-9_\\.]{2,}))?"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/LinkParser;->HASHTAGS_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static hasCurrentUserMention(Ljava/lang/String;)Z
    .locals 7
    .param p0, "in"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 200
    sget-object v6, Lcom/vkontakte/android/LinkParser;->MENTIONS_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v6, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 201
    .local v3, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 202
    invoke-virtual {v3, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    .line 203
    .local v0, "group":Ljava/lang/String;
    const-string/jumbo v6, "id"

    invoke-virtual {v0, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 205
    const/4 v6, 0x2

    :try_start_0
    invoke-virtual {v0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 206
    .local v1, "id":I
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-ne v1, v6, :cond_1

    :goto_0
    move v5, v4

    .line 214
    .end local v0    # "group":Ljava/lang/String;
    .end local v1    # "id":I
    :cond_0
    :goto_1
    return v5

    .restart local v0    # "group":Ljava/lang/String;
    .restart local v1    # "id":I
    :cond_1
    move v4, v5

    .line 206
    goto :goto_0

    .line 207
    .end local v1    # "id":I
    :catch_0
    move-exception v2

    .line 208
    .local v2, "ignored":Ljava/lang/NumberFormatException;
    goto :goto_1
.end method

.method public static isLink(Ljava/lang/String;)Z
    .locals 3
    .param p0, "in"    # Ljava/lang/String;

    .prologue
    .line 189
    sget-object v1, Lcom/vkontakte/android/LinkParser;->URL_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 190
    .local v0, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result v1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isMention(Ljava/lang/String;)Z
    .locals 3
    .param p0, "in"    # Ljava/lang/String;

    .prologue
    .line 194
    sget-object v1, Lcom/vkontakte/android/LinkParser;->MENTIONS_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 195
    .local v0, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v1

    if-nez v1, :cond_1

    .line 196
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result v1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-eq v1, v2, :cond_0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result v1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ne v1, v2, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static parseLinks(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 1
    .param p0, "in"    # Ljava/lang/CharSequence;

    .prologue
    .line 173
    const/4 v0, 0x7

    invoke-static {p0, v0}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public static parseLinks(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;
    .locals 1
    .param p0, "in"    # Ljava/lang/CharSequence;
    .param p1, "flags"    # I

    .prologue
    .line 30
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;ILcom/vkontakte/android/data/PostInteract;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public static parseLinks(Ljava/lang/CharSequence;ILcom/vkontakte/android/data/PostInteract;)Ljava/lang/CharSequence;
    .locals 18
    .param p0, "in"    # Ljava/lang/CharSequence;
    .param p1, "flags"    # I
    .param p2, "postInteract"    # Lcom/vkontakte/android/data/PostInteract;

    .prologue
    .line 34
    if-nez p0, :cond_1

    .line 35
    const-string/jumbo p0, ""

    .line 117
    .end local p0    # "in":Ljava/lang/CharSequence;
    :cond_0
    :goto_0
    return-object p0

    .line 37
    .restart local p0    # "in":Ljava/lang/CharSequence;
    :cond_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v13

    .line 38
    .local v13, "usedRanges":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/LinkParser$CharRange;>;"
    const/4 v9, 0x0

    .line 39
    .local v9, "result":Landroid/text/SpannableStringBuilder;
    and-int/lit8 v14, p1, 0x1

    if-lez v14, :cond_9

    .line 40
    sget-object v14, Lcom/vkontakte/android/LinkParser;->URL_PATTERN:Ljava/util/regex/Pattern;

    move-object/from16 v0, p0

    invoke-virtual {v14, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    .line 41
    .local v4, "matcher":Ljava/util/regex/Matcher;
    const/4 v5, 0x0

    .line 42
    .local v5, "offset":I
    :cond_2
    :goto_1
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v14

    if-eqz v14, :cond_9

    .line 43
    if-nez v9, :cond_3

    .line 44
    new-instance v9, Landroid/text/SpannableStringBuilder;

    .end local v9    # "result":Landroid/text/SpannableStringBuilder;
    move-object/from16 v0, p0

    invoke-direct {v9, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 46
    .restart local v9    # "result":Landroid/text/SpannableStringBuilder;
    :cond_3
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->start()I

    move-result v14

    if-lez v14, :cond_4

    .line 47
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->start()I

    move-result v14

    add-int/lit8 v14, v14, -0x1

    sub-int/2addr v14, v5

    invoke-virtual {v9, v14}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v6

    .line 48
    .local v6, "prev":C
    const/16 v14, 0x40

    if-eq v6, v14, :cond_2

    .line 54
    .end local v6    # "prev":C
    :cond_4
    new-instance v12, Lcom/vkontakte/android/LinkSpan;

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-direct {v12, v14, v0}, Lcom/vkontakte/android/LinkSpan;-><init>(Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;)V

    .line 55
    .local v12, "span":Lcom/vkontakte/android/LinkSpan;
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v8

    .line 56
    .local v8, "replacement":Ljava/lang/String;
    const/4 v11, -0x1

    .line 57
    .local v11, "slashIndex":I
    const-string/jumbo v14, "http:"

    invoke-virtual {v8, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_5

    const-string/jumbo v14, "https:"

    invoke-virtual {v8, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_8

    .line 58
    :cond_5
    const/16 v14, 0x2f

    const/4 v15, 0x7

    invoke-virtual {v8, v14, v15}, Ljava/lang/String;->indexOf(II)I

    move-result v11

    .line 62
    :goto_2
    const/4 v14, -0x1

    if-eq v11, v14, :cond_6

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v14

    sub-int/2addr v14, v11

    const/16 v15, 0x1e

    if-le v14, v15, :cond_6

    .line 63
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v15, 0x0

    add-int/lit8 v16, v11, 0x1e

    move/from16 v0, v16

    invoke-virtual {v8, v15, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, "..."

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 65
    :cond_6
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->start()I

    move-result v14

    sub-int/2addr v14, v5

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->end()I

    move-result v15

    sub-int/2addr v15, v5

    invoke-virtual {v9, v14, v15, v8}, Landroid/text/SpannableStringBuilder;->replace(IILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v9

    .line 66
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->start()I

    move-result v14

    sub-int/2addr v14, v5

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->start()I

    move-result v15

    sub-int/2addr v15, v5

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v16

    add-int v15, v15, v16

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v9, v12, v14, v15, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 67
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v14

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v15

    sub-int/2addr v14, v15

    add-int/2addr v5, v14

    .line 69
    sget-object v14, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    if-ne v13, v14, :cond_7

    .line 70
    new-instance v13, Ljava/util/ArrayList;

    .end local v13    # "usedRanges":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/LinkParser$CharRange;>;"
    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 72
    .restart local v13    # "usedRanges":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/LinkParser$CharRange;>;"
    :cond_7
    new-instance v14, Lcom/vkontakte/android/LinkParser$CharRange;

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->start()I

    move-result v15

    sub-int/2addr v15, v5

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->start()I

    move-result v16

    sub-int v16, v16, v5

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v17

    add-int v16, v16, v17

    invoke-direct/range {v14 .. v16}, Lcom/vkontakte/android/LinkParser$CharRange;-><init>(II)V

    invoke-interface {v13, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 60
    :cond_8
    const/16 v14, 0x2f

    invoke-virtual {v8, v14}, Ljava/lang/String;->indexOf(I)I

    move-result v11

    goto/16 :goto_2

    .line 75
    .end local v4    # "matcher":Ljava/util/regex/Matcher;
    .end local v5    # "offset":I
    .end local v8    # "replacement":Ljava/lang/String;
    .end local v11    # "slashIndex":I
    .end local v12    # "span":Lcom/vkontakte/android/LinkSpan;
    :cond_9
    and-int/lit8 v14, p1, 0x4

    if-lez v14, :cond_12

    .line 76
    sget-object v15, Lcom/vkontakte/android/LinkParser;->HASHTAGS_PATTERN:Ljava/util/regex/Pattern;

    if-nez v9, :cond_f

    move-object/from16 v14, p0

    :goto_3
    invoke-virtual {v15, v14}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    .line 77
    .restart local v4    # "matcher":Ljava/util/regex/Matcher;
    :cond_a
    :goto_4
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v14

    if-eqz v14, :cond_12

    .line 79
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->start()I

    move-result v10

    .line 80
    .local v10, "s":I
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->end()I

    move-result v1

    .line 81
    .local v1, "e":I
    const/4 v3, 0x0

    .line 82
    .local v3, "intersects":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v14

    if-ge v2, v14, :cond_d

    .line 83
    invoke-interface {v13, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/LinkParser$CharRange;

    .line 84
    .local v7, "r":Lcom/vkontakte/android/LinkParser$CharRange;
    iget v14, v7, Lcom/vkontakte/android/LinkParser$CharRange;->start:I

    if-lt v10, v14, :cond_b

    iget v14, v7, Lcom/vkontakte/android/LinkParser$CharRange;->end:I

    if-le v10, v14, :cond_c

    :cond_b
    iget v14, v7, Lcom/vkontakte/android/LinkParser$CharRange;->start:I

    if-lt v1, v14, :cond_10

    iget v14, v7, Lcom/vkontakte/android/LinkParser$CharRange;->end:I

    if-gt v1, v14, :cond_10

    .line 85
    :cond_c
    const/4 v3, 0x1

    .line 89
    .end local v7    # "r":Lcom/vkontakte/android/LinkParser$CharRange;
    :cond_d
    if-nez v3, :cond_a

    .line 92
    if-nez v9, :cond_e

    .line 93
    new-instance v9, Landroid/text/SpannableStringBuilder;

    .end local v9    # "result":Landroid/text/SpannableStringBuilder;
    move-object/from16 v0, p0

    invoke-direct {v9, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 95
    .restart local v9    # "result":Landroid/text/SpannableStringBuilder;
    :cond_e
    const/4 v14, 0x2

    invoke-virtual {v4, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v14

    if-nez v14, :cond_11

    .line 96
    new-instance v12, Lcom/vkontakte/android/LinkSpan;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "vkontakte://search/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-direct {v12, v14, v0}, Lcom/vkontakte/android/LinkSpan;-><init>(Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;)V

    .line 97
    .restart local v12    # "span":Lcom/vkontakte/android/LinkSpan;
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->start()I

    move-result v14

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->end()I

    move-result v15

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v9, v12, v14, v15, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    goto :goto_4

    .end local v1    # "e":I
    .end local v2    # "i":I
    .end local v3    # "intersects":Z
    .end local v4    # "matcher":Ljava/util/regex/Matcher;
    .end local v10    # "s":I
    .end local v12    # "span":Lcom/vkontakte/android/LinkSpan;
    :cond_f
    move-object v14, v9

    .line 76
    goto :goto_3

    .line 82
    .restart local v1    # "e":I
    .restart local v2    # "i":I
    .restart local v3    # "intersects":Z
    .restart local v4    # "matcher":Ljava/util/regex/Matcher;
    .restart local v7    # "r":Lcom/vkontakte/android/LinkParser$CharRange;
    .restart local v10    # "s":I
    :cond_10
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 99
    .end local v7    # "r":Lcom/vkontakte/android/LinkParser$CharRange;
    :cond_11
    new-instance v12, Lcom/vkontakte/android/LinkSpan;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "vkontakte://vk.com/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/4 v15, 0x2

    invoke-virtual {v4, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, "/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/4 v15, 0x1

    invoke-virtual {v4, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x1

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-direct {v12, v14, v0}, Lcom/vkontakte/android/LinkSpan;-><init>(Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;)V

    .line 100
    .restart local v12    # "span":Lcom/vkontakte/android/LinkSpan;
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->start()I

    move-result v14

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->end()I

    move-result v15

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v9, v12, v14, v15, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    goto/16 :goto_4

    .line 104
    .end local v1    # "e":I
    .end local v2    # "i":I
    .end local v3    # "intersects":Z
    .end local v4    # "matcher":Ljava/util/regex/Matcher;
    .end local v10    # "s":I
    .end local v12    # "span":Lcom/vkontakte/android/LinkSpan;
    :cond_12
    and-int/lit8 v14, p1, 0x2

    if-lez v14, :cond_15

    .line 105
    sget-object v15, Lcom/vkontakte/android/LinkParser;->MENTIONS_PATTERN:Ljava/util/regex/Pattern;

    if-nez v9, :cond_14

    move-object/from16 v14, p0

    :goto_6
    invoke-virtual {v15, v14}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    .line 106
    .restart local v4    # "matcher":Ljava/util/regex/Matcher;
    const/4 v5, 0x0

    .line 107
    .restart local v5    # "offset":I
    :goto_7
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v14

    if-eqz v14, :cond_15

    .line 108
    if-nez v9, :cond_13

    .line 109
    new-instance v9, Landroid/text/SpannableStringBuilder;

    .end local v9    # "result":Landroid/text/SpannableStringBuilder;
    move-object/from16 v0, p0

    invoke-direct {v9, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 111
    .restart local v9    # "result":Landroid/text/SpannableStringBuilder;
    :cond_13
    new-instance v12, Lcom/vkontakte/android/LinkSpan;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "vkontakte://vk.com/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/4 v15, 0x1

    invoke-virtual {v4, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-direct {v12, v14, v0}, Lcom/vkontakte/android/LinkSpan;-><init>(Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;)V

    .line 112
    .restart local v12    # "span":Lcom/vkontakte/android/LinkSpan;
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->start()I

    move-result v14

    sub-int/2addr v14, v5

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->end()I

    move-result v15

    sub-int/2addr v15, v5

    const/16 v16, 0x2

    move/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v9, v14, v15, v0}, Landroid/text/SpannableStringBuilder;->replace(IILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v9

    .line 113
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->start()I

    move-result v14

    sub-int/2addr v14, v5

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->start()I

    move-result v15

    sub-int/2addr v15, v5

    const/16 v16, 0x2

    move/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v16

    add-int v15, v15, v16

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v9, v12, v14, v15, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 114
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v14

    const/4 v15, 0x2

    invoke-virtual {v4, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v15

    sub-int/2addr v14, v15

    add-int/2addr v5, v14

    .line 115
    goto :goto_7

    .end local v4    # "matcher":Ljava/util/regex/Matcher;
    .end local v5    # "offset":I
    .end local v12    # "span":Lcom/vkontakte/android/LinkSpan;
    :cond_14
    move-object v14, v9

    .line 105
    goto :goto_6

    .line 117
    :cond_15
    if-eqz v9, :cond_0

    move-object/from16 p0, v9

    goto/16 :goto_0
.end method

.method public static parseLinks(Ljava/lang/CharSequence;Lcom/vkontakte/android/data/PostInteract;)Ljava/lang/CharSequence;
    .locals 1
    .param p0, "in"    # Ljava/lang/CharSequence;
    .param p1, "postInteract"    # Lcom/vkontakte/android/data/PostInteract;

    .prologue
    .line 177
    const/4 v0, 0x7

    invoke-static {p0, v0, p1}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;ILcom/vkontakte/android/data/PostInteract;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public static stripMentions(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "src"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x2

    .line 121
    sget-object v2, Lcom/vkontakte/android/LinkParser;->MENTIONS_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v2, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 122
    .local v0, "matcher":Ljava/util/regex/Matcher;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 123
    .local v1, "result":Ljava/lang/StringBuffer;
    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 124
    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/regex/Matcher;->appendReplacement(Ljava/lang/StringBuffer;Ljava/lang/String;)Ljava/util/regex/Matcher;

    goto :goto_0

    .line 126
    :cond_0
    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->appendTail(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    .line 127
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 128
    new-instance v1, Ljava/lang/StringBuffer;

    .end local v1    # "result":Ljava/lang/StringBuffer;
    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 129
    .restart local v1    # "result":Ljava/lang/StringBuffer;
    sget-object v2, Lcom/vkontakte/android/LinkParser;->BOARD_REPLIES_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v2, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 130
    :goto_1
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 131
    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/regex/Matcher;->appendReplacement(Ljava/lang/StringBuffer;Ljava/lang/String;)Ljava/util/regex/Matcher;

    goto :goto_1

    .line 133
    :cond_1
    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->appendTail(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    .line 134
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static truncatePost(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 1
    .param p0, "in"    # Ljava/lang/CharSequence;

    .prologue
    .line 138
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/vkontakte/android/LinkParser;->truncatePost(Ljava/lang/CharSequence;Z)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public static truncatePost(Ljava/lang/CharSequence;Z)Ljava/lang/CharSequence;
    .locals 14
    .param p0, "in"    # Ljava/lang/CharSequence;
    .param p1, "addShowMore"    # Z

    .prologue
    const/16 v13, 0x12c

    const/16 v12, 0x118

    const/4 v11, 0x6

    const/4 v10, 0x0

    const/4 v9, -0x1

    .line 142
    const/4 v6, -0x1

    .line 143
    .local v6, "truncateAt":I
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    array-length v7, v7

    if-le v7, v11, :cond_1

    .line 144
    const/4 v1, 0x0

    .line 145
    .local v1, "index":I
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    .line 146
    .local v5, "str":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v11, :cond_0

    .line 147
    const/16 v7, 0xa

    add-int/lit8 v8, v1, 0x1

    invoke-virtual {v5, v7, v8}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 146
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 149
    :cond_0
    move v6, v1

    .line 151
    .end local v0    # "i":I
    .end local v1    # "index":I
    .end local v5    # "str":Ljava/lang/String;
    :cond_1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v7

    if-le v7, v12, :cond_3

    if-eq v6, v9, :cond_2

    if-le v6, v13, :cond_3

    .line 152
    :cond_2
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v7

    const/16 v8, 0x20

    invoke-virtual {v7, v8, v12}, Ljava/lang/String;->indexOf(II)I

    move-result v7

    invoke-static {v7, v13}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 153
    if-ne v6, v9, :cond_3

    .line 154
    const/16 v6, 0x118

    .line 157
    :cond_3
    if-ne v6, v9, :cond_4

    .line 169
    .end local p0    # "in":Ljava/lang/CharSequence;
    :goto_1
    return-object p0

    .line 160
    .restart local p0    # "in":Ljava/lang/CharSequence;
    :cond_4
    new-instance v4, Landroid/text/SpannableStringBuilder;

    invoke-direct {v4}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 161
    .local v4, "ssb":Landroid/text/SpannableStringBuilder;
    invoke-virtual {v4, p0, v10, v6}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;II)Landroid/text/SpannableStringBuilder;

    .line 162
    const-string/jumbo v7, "...\n"

    invoke-virtual {v4, v7}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 163
    if-eqz p1, :cond_5

    .line 164
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v7

    sget-object v8, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f08051d

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v2

    .line 165
    .local v2, "showMore":Landroid/text/Spannable;
    new-instance v3, Lcom/vkontakte/android/ExpandTextSpan;

    const/4 v7, 0x0

    invoke-direct {v3, v7}, Lcom/vkontakte/android/ExpandTextSpan;-><init>(Ljava/lang/String;)V

    .line 166
    .local v3, "span":Lcom/vkontakte/android/ExpandTextSpan;
    invoke-interface {v2}, Landroid/text/Spannable;->length()I

    move-result v7

    invoke-interface {v2, v3, v10, v7, v10}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 167
    invoke-virtual {v4, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .end local v2    # "showMore":Landroid/text/Spannable;
    .end local v3    # "span":Lcom/vkontakte/android/ExpandTextSpan;
    :cond_5
    move-object p0, v4

    .line 169
    goto :goto_1
.end method

.method public static tryExtractLink(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 2
    .param p0, "in"    # Ljava/lang/CharSequence;

    .prologue
    .line 181
    sget-object v1, Lcom/vkontakte/android/LinkParser;->URL_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 182
    .local v0, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-nez v1, :cond_0

    .line 183
    const/4 v1, 0x0

    .line 185
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method
