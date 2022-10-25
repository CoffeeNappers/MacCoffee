.class public Lcom/vkontakte/android/TextStyleParser;
.super Ljava/lang/Object;
.source "TextStyleParser.java"


# static fields
.field private static final BOLD_MARKER:Ljava/lang/String; = "\'\'\'"

.field private static final BOLD_PATTERN:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const-string/jumbo v0, "\\\'\'\'(.*?)\\\'\'\'"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/TextStyleParser;->BOLD_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parse(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 3
    .param p0, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 17
    sget-object v0, Lcom/vkontakte/android/TextStyleParser;->BOLD_PATTERN:Ljava/util/regex/Pattern;

    const-string/jumbo v1, "\'\'\'"

    const/4 v2, 0x1

    invoke-static {p0, v0, v1, v2}, Lcom/vkontakte/android/TextStyleParser;->parse(Ljava/lang/CharSequence;Ljava/util/regex/Pattern;Ljava/lang/String;I)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method private static parse(Ljava/lang/CharSequence;Ljava/util/regex/Pattern;Ljava/lang/String;I)Ljava/lang/CharSequence;
    .locals 11
    .param p0, "text"    # Ljava/lang/CharSequence;
    .param p1, "pattern"    # Ljava/util/regex/Pattern;
    .param p2, "marker"    # Ljava/lang/String;
    .param p3, "typeface"    # I

    .prologue
    const/4 v10, 0x0

    .line 21
    if-nez p0, :cond_0

    .line 22
    const-string/jumbo v5, ""

    .line 42
    :goto_0
    return-object v5

    .line 24
    :cond_0
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 25
    .local v3, "sb":Ljava/lang/StringBuffer;
    new-instance v5, Landroid/text/SpannableStringBuilder;

    invoke-direct {v5}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 26
    .local v5, "spannable":Landroid/text/SpannableStringBuilder;
    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 27
    .local v2, "matcher":Ljava/util/regex/Matcher;
    :goto_1
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 28
    invoke-virtual {v3, v10}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 29
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v1

    .line 30
    .local v1, "group":Ljava/lang/String;
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v8, v9

    invoke-virtual {v1, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 31
    .local v4, "spanText":Ljava/lang/String;
    invoke-virtual {v2, v3, v4}, Ljava/util/regex/Matcher;->appendReplacement(Ljava/lang/StringBuffer;Ljava/lang/String;)Ljava/util/regex/Matcher;

    .line 32
    invoke-virtual {v5, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 34
    invoke-virtual {v5}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v7

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v8

    sub-int v6, v7, v8

    .line 35
    .local v6, "start":I
    new-instance v0, Landroid/text/style/StyleSpan;

    invoke-direct {v0, p3}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 36
    .local v0, "boldStyleSpan":Landroid/text/style/StyleSpan;
    invoke-virtual {v5}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v7

    const/16 v8, 0x21

    invoke-virtual {v5, v0, v6, v7, v8}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    goto :goto_1

    .line 38
    .end local v0    # "boldStyleSpan":Landroid/text/style/StyleSpan;
    .end local v1    # "group":Ljava/lang/String;
    .end local v4    # "spanText":Ljava/lang/String;
    .end local v6    # "start":I
    :cond_1
    invoke-virtual {v3, v10}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 39
    invoke-virtual {v2, v3}, Ljava/util/regex/Matcher;->appendTail(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    .line 40
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto :goto_0
.end method
