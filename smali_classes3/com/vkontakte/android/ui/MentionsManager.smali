.class public Lcom/vkontakte/android/ui/MentionsManager;
.super Ljava/lang/Object;
.source "MentionsManager.java"

# interfaces
.implements Lcom/vkontakte/android/ui/widget/RichEditText$OnKeyPreImeListener;


# static fields
.field private static final EDIT_THRESHOLD_MS:I = 0x12c

.field private static final STR_FRM:Ljava/lang/String; = "[id%d|%s]"

.field private static final mentionPrefixAt:Ljava/lang/String; = "@"

.field private static final mentionPrefixStar:Ljava/lang/String; = "*"


# instance fields
.field private editText:Lcom/vkontakte/android/ui/widget/RichEditText;

.field private pendingSpan:Lcom/vkontakte/android/ui/MentionSpan;

.field private pendingSpanTime:J

.field private suggestionsSupplier:Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;

.field private wordSeparators:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Character;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/ui/widget/RichEditText;Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;)V
    .locals 5
    .param p1, "editText"    # Lcom/vkontakte/android/ui/widget/RichEditText;
    .param p2, "suggestionsSupplier"    # Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;

    .prologue
    const/16 v4, 0xa

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/HashSet;

    const/16 v1, 0xc

    new-array v1, v1, [Ljava/lang/Character;

    const/4 v2, 0x0

    const/16 v3, 0x20

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const/16 v3, 0x2c

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const/16 v3, 0x3b

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const/16 v3, 0x2e

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const/16 v3, 0x21

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const/16 v3, 0x3f

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const/16 v3, 0x2d

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x7

    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const/16 v3, 0x28

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    aput-object v3, v1, v2

    const/16 v2, 0x9

    const/16 v3, 0x29

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    aput-object v3, v1, v2

    const/16 v2, 0x5b

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    aput-object v2, v1, v4

    const/16 v2, 0xb

    const/16 v3, 0x5d

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/MentionsManager;->wordSeparators:Ljava/util/HashSet;

    .line 48
    iput-object p1, p0, Lcom/vkontakte/android/ui/MentionsManager;->editText:Lcom/vkontakte/android/ui/widget/RichEditText;

    .line 50
    iput-object p2, p0, Lcom/vkontakte/android/ui/MentionsManager;->suggestionsSupplier:Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;

    .line 52
    iput-object p0, p1, Lcom/vkontakte/android/ui/widget/RichEditText;->onKeyPreImeListener:Lcom/vkontakte/android/ui/widget/RichEditText$OnKeyPreImeListener;

    .line 54
    new-instance v0, Lcom/vkontakte/android/ui/MentionsManager$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/ui/MentionsManager$1;-><init>(Lcom/vkontakte/android/ui/MentionsManager;Lcom/vkontakte/android/ui/widget/RichEditText;Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;)V

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/widget/RichEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 147
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/MentionsManager;)[I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/MentionsManager;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/vkontakte/android/ui/MentionsManager;->getCurrentWordBoundaries()[I

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ui/MentionsManager;)Lcom/vkontakte/android/ui/MentionSpan;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/MentionsManager;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/vkontakte/android/ui/MentionsManager;->pendingSpan:Lcom/vkontakte/android/ui/MentionSpan;

    return-object v0
.end method

.method static synthetic access$102(Lcom/vkontakte/android/ui/MentionsManager;Lcom/vkontakte/android/ui/MentionSpan;)Lcom/vkontakte/android/ui/MentionSpan;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/MentionsManager;
    .param p1, "x1"    # Lcom/vkontakte/android/ui/MentionSpan;

    .prologue
    .line 24
    iput-object p1, p0, Lcom/vkontakte/android/ui/MentionsManager;->pendingSpan:Lcom/vkontakte/android/ui/MentionSpan;

    return-object p1
.end method

.method static synthetic access$200(Lcom/vkontakte/android/ui/MentionsManager;)J
    .locals 2
    .param p0, "x0"    # Lcom/vkontakte/android/ui/MentionsManager;

    .prologue
    .line 24
    iget-wide v0, p0, Lcom/vkontakte/android/ui/MentionsManager;->pendingSpanTime:J

    return-wide v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/ui/MentionsManager;J)J
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/MentionsManager;
    .param p1, "x1"    # J

    .prologue
    .line 24
    iput-wide p1, p0, Lcom/vkontakte/android/ui/MentionsManager;->pendingSpanTime:J

    return-wide p1
.end method

.method static synthetic access$300(Lcom/vkontakte/android/ui/MentionsManager;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/MentionsManager;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/vkontakte/android/ui/MentionsManager;->getCurrentWord()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getAsStringWithFrm(Ljava/lang/String;)Ljava/lang/String;
    .locals 16
    .param p1, "frmStr"    # Ljava/lang/String;

    .prologue
    .line 208
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/ui/MentionsManager;->editText:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-virtual {v13}, Lcom/vkontakte/android/ui/widget/RichEditText;->getEditableText()Landroid/text/Editable;

    move-result-object v3

    .line 210
    .local v3, "editable":Landroid/text/Editable;
    const/4 v13, 0x0

    invoke-interface {v3}, Landroid/text/Editable;->length()I

    move-result v14

    const-class v15, Lcom/vkontakte/android/ui/MentionSpan;

    invoke-interface {v3, v13, v14, v15}, Landroid/text/Editable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Lcom/vkontakte/android/ui/MentionSpan;

    .line 213
    .local v10, "spans":[Lcom/vkontakte/android/ui/MentionSpan;
    new-instance v13, Lcom/vkontakte/android/ui/MentionsManager$2;

    move-object/from16 v0, p0

    invoke-direct {v13, v0, v3}, Lcom/vkontakte/android/ui/MentionsManager$2;-><init>(Lcom/vkontakte/android/ui/MentionsManager;Landroid/text/Editable;)V

    invoke-static {v10, v13}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 220
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 222
    .local v1, "builder":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .line 223
    .local v2, "delta":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    array-length v13, v10

    if-ge v5, v13, :cond_2

    .line 224
    aget-object v9, v10, v5

    .line 225
    .local v9, "span":Lcom/vkontakte/android/ui/MentionSpan;
    invoke-interface {v3, v9}, Landroid/text/Editable;->getSpanStart(Ljava/lang/Object;)I

    move-result v11

    .line 226
    .local v11, "start":I
    invoke-interface {v3, v9}, Landroid/text/Editable;->getSpanEnd(Ljava/lang/Object;)I

    move-result v4

    .line 228
    .local v4, "end":I
    invoke-interface {v3, v11, v4}, Landroid/text/Editable;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v13

    invoke-interface {v13}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v8

    .line 230
    .local v8, "mentionName":Ljava/lang/String;
    const-string/jumbo v13, "@"

    invoke-virtual {v8, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_0

    const-string/jumbo v13, "*"

    invoke-virtual {v8, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 232
    :cond_0
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    const/16 v14, 0x28

    invoke-virtual {v13, v14, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v7

    .line 233
    .local v7, "indOfOpeningBrackets":I
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    const/16 v14, 0x29

    invoke-virtual {v13, v14, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v6

    .line 234
    .local v6, "indOfClosingBrackets":I
    if-ltz v6, :cond_1

    if-ltz v7, :cond_1

    sub-int v13, v6, v7

    const/4 v14, 0x1

    if-le v13, v14, :cond_1

    .line 238
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13, v4, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v13

    if-nez v13, :cond_1

    .line 241
    const-class v13, Lcom/vkontakte/android/ui/MentionSpan;

    invoke-interface {v3, v7, v6, v13}, Landroid/text/Editable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v13

    check-cast v13, [Lcom/vkontakte/android/ui/MentionSpan;

    array-length v13, v13

    if-nez v13, :cond_1

    .line 242
    add-int/lit8 v4, v6, 0x1

    .line 243
    add-int/lit8 v13, v7, 0x1

    invoke-interface {v3, v13, v6}, Landroid/text/Editable;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v13

    invoke-interface {v13}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v8

    .line 249
    .end local v6    # "indOfClosingBrackets":I
    .end local v7    # "indOfOpeningBrackets":I
    :cond_1
    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    .line 251
    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    iget v15, v9, Lcom/vkontakte/android/ui/MentionSpan;->id:I

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x1

    aput-object v8, v13, v14

    move-object/from16 v0, p1

    invoke-static {v0, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    .line 253
    .local v12, "substituteStr":Ljava/lang/String;
    add-int v13, v11, v2

    add-int v14, v4, v2

    invoke-virtual {v1, v13, v14, v12}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v13

    sub-int v14, v4, v11

    sub-int/2addr v13, v14

    add-int/2addr v2, v13

    .line 223
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 258
    .end local v4    # "end":I
    .end local v8    # "mentionName":Ljava/lang/String;
    .end local v9    # "span":Lcom/vkontakte/android/ui/MentionSpan;
    .end local v11    # "start":I
    .end local v12    # "substituteStr":Ljava/lang/String;
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    return-object v13
.end method

.method private getCurrentWord()Ljava/lang/String;
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 262
    invoke-direct {p0}, Lcom/vkontakte/android/ui/MentionsManager;->getCurrentWordBoundaries()[I

    move-result-object v3

    .line 264
    .local v3, "indexes":[I
    aget v2, v3, v5

    .line 265
    .local v2, "indStart":I
    const/4 v4, 0x1

    aget v1, v3, v4

    .line 267
    .local v1, "indEnd":I
    if-le v1, v2, :cond_0

    .line 269
    sub-int v4, v1, v2

    new-array v0, v4, [C

    .line 270
    .local v0, "chars":[C
    iget-object v4, p0, Lcom/vkontakte/android/ui/MentionsManager;->editText:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/widget/RichEditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4, v2, v1, v0, v5}, Landroid/text/Editable;->getChars(II[CI)V

    .line 272
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v0}, Ljava/lang/String;-><init>([C)V

    .line 275
    .end local v0    # "chars":[C
    :goto_0
    return-object v4

    :cond_0
    const-string/jumbo v4, ""

    goto :goto_0
.end method

.method private getCurrentWordBoundaries()[I
    .locals 7

    .prologue
    .line 279
    iget-object v4, p0, Lcom/vkontakte/android/ui/MentionsManager;->editText:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/widget/RichEditText;->getSelectionStart()I

    move-result v0

    .line 281
    .local v0, "currentInd":I
    const/4 v4, 0x2

    new-array v3, v4, [I

    .line 283
    .local v3, "indexes":[I
    move v2, v0

    .line 284
    .local v2, "indStart":I
    move v1, v0

    .line 286
    .local v1, "indEnd":I
    :goto_0
    if-lez v2, :cond_0

    iget-object v4, p0, Lcom/vkontakte/android/ui/MentionsManager;->wordSeparators:Ljava/util/HashSet;

    iget-object v5, p0, Lcom/vkontakte/android/ui/MentionsManager;->editText:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-virtual {v5}, Lcom/vkontakte/android/ui/widget/RichEditText;->getText()Landroid/text/Editable;

    move-result-object v5

    add-int/lit8 v6, v2, -0x1

    invoke-interface {v5, v6}, Landroid/text/Editable;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 287
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 290
    :cond_0
    :goto_1
    iget-object v4, p0, Lcom/vkontakte/android/ui/MentionsManager;->editText:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/widget/RichEditText;->length()I

    move-result v4

    if-ge v1, v4, :cond_1

    iget-object v4, p0, Lcom/vkontakte/android/ui/MentionsManager;->wordSeparators:Ljava/util/HashSet;

    iget-object v5, p0, Lcom/vkontakte/android/ui/MentionsManager;->editText:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-virtual {v5}, Lcom/vkontakte/android/ui/widget/RichEditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-interface {v5, v1}, Landroid/text/Editable;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 291
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 294
    :cond_1
    const/4 v4, 0x0

    aput v2, v3, v4

    .line 295
    const/4 v4, 0x1

    aput v1, v3, v4

    .line 297
    return-object v3
.end method


# virtual methods
.method public getAsFormattedString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 204
    const-string/jumbo v0, "[id%d|%s]"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/MentionsManager;->getAsStringWithFrm(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMentionsForSerialization()Ljava/lang/String;
    .locals 7

    .prologue
    .line 167
    iget-object v4, p0, Lcom/vkontakte/android/ui/MentionsManager;->editText:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/widget/RichEditText;->getEditableText()Landroid/text/Editable;

    move-result-object v1

    .line 168
    .local v1, "editable":Landroid/text/Editable;
    const/4 v4, 0x0

    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v5

    const-class v6, Lcom/vkontakte/android/ui/MentionSpan;

    invoke-interface {v1, v4, v5, v6}, Landroid/text/Editable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/vkontakte/android/ui/MentionSpan;

    .line 170
    .local v3, "spans":[Lcom/vkontakte/android/ui/MentionSpan;
    new-instance v0, Ljava/util/ArrayList;

    array-length v4, v3

    mul-int/lit8 v4, v4, 0x3

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 171
    .local v0, "data":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v4, v3

    if-ge v2, v4, :cond_0

    .line 172
    aget-object v4, v3, v2

    invoke-interface {v1, v4}, Landroid/text/Editable;->getSpanStart(Ljava/lang/Object;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 173
    aget-object v4, v3, v2

    iget v4, v4, Lcom/vkontakte/android/ui/MentionSpan;->id:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 174
    aget-object v4, v3, v2

    invoke-interface {v1, v4}, Landroid/text/Editable;->getSpanEnd(Ljava/lang/Object;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 171
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 177
    :cond_0
    const-string/jumbo v4, ","

    invoke-virtual {v0}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public mentionSelected(Lcom/vkontakte/android/UserProfile;)V
    .locals 7
    .param p1, "up"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    const/4 v6, 0x0

    .line 150
    iget-object v2, p0, Lcom/vkontakte/android/ui/MentionsManager;->suggestionsSupplier:Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;

    invoke-interface {v2}, Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;->hideMentionSuggestions()V

    .line 154
    invoke-direct {p0}, Lcom/vkontakte/android/ui/MentionsManager;->getCurrentWordBoundaries()[I

    move-result-object v0

    .line 156
    .local v0, "boundaries":[I
    iget-object v2, p0, Lcom/vkontakte/android/ui/MentionsManager;->editText:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/widget/RichEditText;->getEditableText()Landroid/text/Editable;

    move-result-object v2

    aget v3, v0, v6

    const/4 v4, 0x1

    aget v4, v0, v4

    iget-object v5, p1, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-interface {v2, v3, v4, v5}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 158
    new-instance v1, Lcom/vkontakte/android/ui/MentionSpan;

    invoke-direct {v1}, Lcom/vkontakte/android/ui/MentionSpan;-><init>()V

    .line 160
    .local v1, "span":Lcom/vkontakte/android/ui/MentionSpan;
    iget v2, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    iput v2, v1, Lcom/vkontakte/android/ui/MentionSpan;->id:I

    .line 162
    iget-object v2, p0, Lcom/vkontakte/android/ui/MentionsManager;->editText:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/widget/RichEditText;->getEditableText()Landroid/text/Editable;

    move-result-object v2

    aget v3, v0, v6

    aget v4, v0, v6

    iget-object v5, p1, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v4, v5

    const/16 v5, 0x21

    invoke-interface {v2, v1, v3, v4, v5}, Landroid/text/Editable;->setSpan(Ljava/lang/Object;III)V

    .line 163
    return-void
.end method

.method public onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 302
    iget-object v0, p0, Lcom/vkontakte/android/ui/MentionsManager;->suggestionsSupplier:Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;

    invoke-interface {v0}, Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;->getIsShowingMentionsSuggestions()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 305
    iget-object v0, p0, Lcom/vkontakte/android/ui/MentionsManager;->suggestionsSupplier:Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;

    invoke-interface {v0}, Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;->hideMentionSuggestions()V

    .line 306
    const/4 v0, 0x1

    .line 308
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setMentionsFromSerializedString(Ljava/lang/String;)V
    .locals 10
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 182
    :try_start_0
    const-string/jumbo v7, ","

    invoke-virtual {p1, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 183
    .local v6, "splitData":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v7, v6

    if-ge v1, v7, :cond_1

    .line 184
    aget-object v7, v6, v1

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 185
    .local v5, "spanStart":I
    add-int/lit8 v7, v1, 0x1

    aget-object v7, v6, v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 186
    .local v2, "id":I
    add-int/lit8 v7, v1, 0x2

    aget-object v7, v6, v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 188
    .local v4, "spanEnd":I
    new-instance v3, Lcom/vkontakte/android/ui/MentionSpan;

    invoke-direct {v3}, Lcom/vkontakte/android/ui/MentionSpan;-><init>()V

    .line 189
    .local v3, "ms":Lcom/vkontakte/android/ui/MentionSpan;
    iput v2, v3, Lcom/vkontakte/android/ui/MentionSpan;->id:I

    .line 192
    iget-object v7, p0, Lcom/vkontakte/android/ui/MentionsManager;->editText:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-virtual {v7}, Lcom/vkontakte/android/ui/widget/RichEditText;->getEditableText()Landroid/text/Editable;

    move-result-object v7

    invoke-interface {v7}, Landroid/text/Editable;->length()I

    move-result v7

    if-lt v7, v4, :cond_0

    .line 193
    iget-object v7, p0, Lcom/vkontakte/android/ui/MentionsManager;->editText:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-virtual {v7}, Lcom/vkontakte/android/ui/widget/RichEditText;->getEditableText()Landroid/text/Editable;

    move-result-object v7

    const/16 v8, 0x21

    invoke-interface {v7, v3, v5, v4, v8}, Landroid/text/Editable;->setSpan(Ljava/lang/Object;III)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 183
    :cond_0
    add-int/lit8 v1, v1, 0x3

    goto :goto_0

    .line 197
    .end local v1    # "i":I
    .end local v2    # "id":I
    .end local v3    # "ms":Lcom/vkontakte/android/ui/MentionSpan;
    .end local v4    # "spanEnd":I
    .end local v5    # "spanStart":I
    .end local v6    # "splitData":[Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 199
    .local v0, "exc":Ljava/lang/Exception;
    const-string/jumbo v7, "MentionsManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "setMentionsFromSerializedString failed data = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v0}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 201
    .end local v0    # "exc":Ljava/lang/Exception;
    :cond_1
    return-void
.end method
