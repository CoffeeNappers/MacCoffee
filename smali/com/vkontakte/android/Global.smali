.class public Lcom/vkontakte/android/Global;
.super Ljava/lang/Object;
.source "Global.java"


# static fields
.field public static final FONT_SIZE_MULTIPLIER:F = 2.0f

.field private static final SUPPORTED_LANGS:[Ljava/lang/String;

.field private static final decimalFormat:Ljava/text/DecimalFormat;

.field private static dfnd:Ljava/text/DecimalFormat;

.field public static displayDensity:F

.field private static emojiSkinModifierChars:Ljava/util/regex/Pattern;

.field private static entitiesPtn:Ljava/util/regex/Pattern;

.field public static inited:Z

.field public static longPoll:Lcom/vkontakte/android/LongPollService;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 30
    new-instance v0, Ljava/text/DecimalFormat;

    const-string/jumbo v1, "#.#"

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/Global;->decimalFormat:Ljava/text/DecimalFormat;

    .line 42
    sput-object v3, Lcom/vkontakte/android/Global;->longPoll:Lcom/vkontakte/android/LongPollService;

    .line 44
    sput-boolean v2, Lcom/vkontakte/android/Global;->inited:Z

    .line 45
    sput-object v3, Lcom/vkontakte/android/Global;->entitiesPtn:Ljava/util/regex/Pattern;

    .line 48
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "ru"

    aput-object v1, v0, v2

    const/4 v1, 0x1

    const-string/jumbo v2, "ua"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "en"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "pt"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "kz"

    aput-object v2, v0, v1

    sput-object v0, Lcom/vkontakte/android/Global;->SUPPORTED_LANGS:[Ljava/lang/String;

    .line 50
    const-string/jumbo v0, "(\ud83c\udffb|\ud83c\udffc|\ud83c\udffd|\ud83c\udffe|\ud83c\udfff)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/Global;->emojiSkinModifierChars:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static extractLinks(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 4
    .param p0, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 134
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 135
    .local v2, "ss":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string/jumbo v3, "((?:(?:http|https)://)?[a-zA-Z\u0430-\u044f\u0410-\u042f0-9\\.-]+\\.[a-zA-Z\u0440\u0444\u0420\u0424]{2,4}[0-9a-zA-Z~/?\\.=#!%&_-]*(?<!\\.)(?<!!))"

    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    .line 136
    .local v1, "ptn":Ljava/util/regex/Pattern;
    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 137
    .local v0, "m":Ljava/util/regex/Matcher;
    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 138
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 140
    :cond_0
    return-object v2
.end method

.method public static formatBigNumber(I)Ljava/lang/String;
    .locals 5
    .param p0, "num"    # I

    .prologue
    .line 263
    const v0, 0x989680

    if-le p0, v0, :cond_0

    .line 264
    const-string/jumbo v0, "%.02f M"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    int-to-float v3, p0

    const v4, 0x49742400    # 1000000.0f

    div-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 269
    :goto_0
    return-object v0

    .line 266
    :cond_0
    const/16 v0, 0x2710

    if-le p0, v0, :cond_1

    .line 267
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    div-int/lit16 v1, p0, 0x3e8

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " K"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 269
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private static formatFloat(F)Ljava/lang/String;
    .locals 2
    .param p0, "f"    # F

    .prologue
    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v1, v1

    cmpl-float v1, p0, v1

    if-nez v1, :cond_0

    float-to-int v1, p0

    int-to-float p0, v1

    .end local p0    # "f":F
    :cond_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatNumber(I)Ljava/lang/String;
    .locals 4
    .param p0, "num"    # I

    .prologue
    .line 273
    const v0, 0xf4240

    if-lt p0, v0, :cond_0

    .line 274
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/vkontakte/android/Global;->decimalFormat:Ljava/text/DecimalFormat;

    int-to-float v2, p0

    const v3, 0x49742400    # 1000000.0f

    div-float/2addr v2, v3

    float-to-double v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "M"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 278
    :goto_0
    return-object v0

    .line 275
    :cond_0
    const/16 v0, 0x3e8

    if-lt p0, v0, :cond_1

    .line 276
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/vkontakte/android/Global;->decimalFormat:Ljava/text/DecimalFormat;

    int-to-float v2, p0

    const/high16 v3, 0x447a0000    # 1000.0f

    div-float/2addr v2, v3

    float-to-double v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "K"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 278
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static formatNumberWithThousandSeparator(I)Ljava/lang/String;
    .locals 4
    .param p0, "num"    # I

    .prologue
    .line 283
    sget-object v1, Lcom/vkontakte/android/Global;->dfnd:Ljava/text/DecimalFormat;

    if-nez v1, :cond_0

    .line 284
    new-instance v1, Ljava/text/DecimalFormat;

    invoke-direct {v1}, Ljava/text/DecimalFormat;-><init>()V

    sput-object v1, Lcom/vkontakte/android/Global;->dfnd:Ljava/text/DecimalFormat;

    .line 285
    sget-object v1, Lcom/vkontakte/android/Global;->dfnd:Ljava/text/DecimalFormat;

    invoke-virtual {v1}, Ljava/text/DecimalFormat;->getDecimalFormatSymbols()Ljava/text/DecimalFormatSymbols;

    move-result-object v0

    .line 287
    .local v0, "symbols":Ljava/text/DecimalFormatSymbols;
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/text/DecimalFormatSymbols;->setGroupingSeparator(C)V

    .line 288
    sget-object v1, Lcom/vkontakte/android/Global;->dfnd:Ljava/text/DecimalFormat;

    invoke-virtual {v1, v0}, Ljava/text/DecimalFormat;->setDecimalFormatSymbols(Ljava/text/DecimalFormatSymbols;)V

    .line 291
    .end local v0    # "symbols":Ljava/text/DecimalFormatSymbols;
    :cond_0
    sget-object v1, Lcom/vkontakte/android/Global;->dfnd:Ljava/text/DecimalFormat;

    int-to-long v2, p0

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getDeviceLang()Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v4, 0x0

    .line 154
    :try_start_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    .line 155
    .local v0, "l":Ljava/lang/String;
    const-string/jumbo v3, "uk"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 156
    const-string/jumbo v0, "ua"

    .line 158
    :cond_0
    const-string/jumbo v3, "kk"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 159
    const-string/jumbo v0, "kz"

    .line 161
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v5, 0x2

    if-ge v3, v5, :cond_2

    .line 162
    const-string/jumbo v0, "en"

    .line 164
    :cond_2
    sget-object v5, Lcom/vkontakte/android/Global;->SUPPORTED_LANGS:[Ljava/lang/String;

    array-length v6, v5

    move v3, v4

    :goto_0
    if-ge v3, v6, :cond_4

    aget-object v1, v5, v3

    .line 165
    .local v1, "lang":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v7

    if-eqz v7, :cond_3

    .line 172
    .end local v1    # "lang":Ljava/lang/String;
    :goto_1
    return-object v1

    .line 164
    .restart local v1    # "lang":Ljava/lang/String;
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 169
    .end local v1    # "lang":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 170
    .local v2, "x":Ljava/lang/Exception;
    new-array v3, v4, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 172
    .end local v2    # "x":Ljava/lang/Exception;
    :cond_4
    const-string/jumbo v1, "en"

    goto :goto_1
.end method

.method public static getResBitmap(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;
    .locals 2
    .param p0, "res"    # Landroid/content/res/Resources;
    .param p1, "id"    # I

    .prologue
    .line 145
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 146
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/graphics/drawable/BitmapDrawable;

    if-nez v1, :cond_1

    .line 147
    :cond_0
    const/4 v1, 0x0

    .line 149
    .end local v0    # "d":Landroid/graphics/drawable/Drawable;
    :goto_0
    return-object v1

    .restart local v0    # "d":Landroid/graphics/drawable/Drawable;
    :cond_1
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    .end local v0    # "d":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_0
.end method

.method public static getStaticMapURL(DD)Ljava/lang/String;
    .locals 8
    .param p0, "lat"    # D
    .param p2, "lon"    # D

    .prologue
    const/4 v1, 0x2

    const/4 v0, 0x1

    .line 190
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v3, "http://maps.googleapis.com/maps/api/staticmap?center=%1$s,%2$s&zoom=16&size=300x130&sensor=false&scale=%3$d&language=%4$s"

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p0, p1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p2, p3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    sget v5, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v6, 0x3f800000    # 1.0f

    cmpl-float v5, v5, v6

    if-lez v5, :cond_0

    move v0, v1

    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v4, v1

    const/4 v0, 0x3

    const-string/jumbo v1, "user.language"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v0

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getStaticMapURL(DDII)Ljava/lang/String;
    .locals 8
    .param p0, "lat"    # D
    .param p2, "lon"    # D
    .param p4, "w"    # I
    .param p5, "h"    # I

    .prologue
    const/4 v1, 0x2

    const/4 v0, 0x1

    .line 194
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v3, "http://maps.googleapis.com/maps/api/staticmap?center=%1$s,%2$s&zoom=16&size=%5$dx%6$d&sensor=false&scale=%3$d&language=%4$s"

    const/4 v4, 0x6

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p0, p1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p2, p3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    sget v5, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v6, 0x3f800000    # 1.0f

    cmpl-float v5, v5, v6

    if-lez v5, :cond_0

    move v0, v1

    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v4, v1

    const/4 v0, 0x3

    const-string/jumbo v1, "user.language"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v0

    const/4 v0, 0x4

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v0

    const/4 v0, 0x5

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v0

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getStaticMapURL(DDIII)Ljava/lang/String;
    .locals 8
    .param p0, "lat"    # D
    .param p2, "lon"    # D
    .param p4, "w"    # I
    .param p5, "h"    # I
    .param p6, "zoom"    # I

    .prologue
    const/4 v1, 0x2

    const/4 v0, 0x1

    .line 198
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v3, "http://maps.googleapis.com/maps/api/staticmap?center=%1$s,%2$s&zoom=%7$d&size=%5$dx%6$d&sensor=false&scale=%3$d&language=%4$s"

    const/4 v4, 0x7

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p0, p1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p2, p3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    sget v5, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v6, 0x3f800000    # 1.0f

    cmpl-float v5, v5, v6

    if-lez v5, :cond_0

    move v0, v1

    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v4, v1

    const/4 v0, 0x3

    const-string/jumbo v1, "user.language"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v0

    const/4 v0, 0x4

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v0

    const/4 v0, 0x5

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v0

    const/4 v0, 0x6

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v0

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getUserOnlineStatus(Lorg/json/JSONObject;)I
    .locals 3
    .param p0, "user"    # Lorg/json/JSONObject;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 202
    const-string/jumbo v2, "online"

    invoke-virtual {p0, v2, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v0, :cond_2

    .line 203
    const-string/jumbo v1, "online_mobile"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    if-ne v1, v0, :cond_0

    .line 204
    const-string/jumbo v0, "online_app"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_1

    .line 205
    const/4 v0, 0x3

    .line 211
    :cond_0
    :goto_0
    return v0

    .line 207
    :cond_1
    const/4 v0, 0x2

    goto :goto_0

    :cond_2
    move v0, v1

    .line 211
    goto :goto_0
.end method

.method private static inArray(C[C)Z
    .locals 4
    .param p0, "c"    # C
    .param p1, "a"    # [C

    .prologue
    const/4 v1, 0x0

    .line 215
    array-length v3, p1

    move v2, v1

    :goto_0
    if-ge v2, v3, :cond_0

    aget-char v0, p1, v2

    .line 216
    .local v0, "cc":C
    if-ne v0, p0, :cond_1

    .line 217
    const/4 v1, 0x1

    .line 220
    .end local v0    # "cc":C
    :cond_0
    return v1

    .line 215
    .restart local v0    # "cc":C
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public static init(Landroid/content/Context;)V
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 34
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 35
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    iget v2, v0, Landroid/util/DisplayMetrics;->density:F

    sput v2, Lcom/vkontakte/android/Global;->displayDensity:F
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .end local v0    # "metrics":Landroid/util/DisplayMetrics;
    :goto_0
    return-void

    .line 37
    :catch_0
    move-exception v1

    .line 38
    .local v1, "x":Ljava/lang/Exception;
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static isAppInstalled(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "pkg"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 181
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, p1, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    :goto_0
    return v1

    .line 183
    :catch_0
    move-exception v0

    .line 184
    .local v0, "x":Ljava/lang/Exception;
    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    move v1, v2

    .line 186
    goto :goto_0
.end method

.method public static isBuggyMeizu()Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 251
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x16

    if-ge v2, v3, :cond_0

    .line 258
    .local v0, "x":Ljava/lang/ClassNotFoundException;
    :goto_0
    return v1

    .line 255
    .end local v0    # "x":Ljava/lang/ClassNotFoundException;
    :cond_0
    :try_start_0
    const-string/jumbo v2, "com.android.internal.widget.MzActionBarView"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 256
    const/4 v1, 0x1

    goto :goto_0

    .line 257
    :catch_0
    move-exception v0

    .line 258
    .restart local v0    # "x":Ljava/lang/ClassNotFoundException;
    goto :goto_0
.end method

.method public static isTouchwiz()Z
    .locals 2

    .prologue
    .line 247
    new-instance v0, Ljava/io/File;

    const-string/jumbo v1, "/system/app/SecLauncher2.apk"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    return v0
.end method

.method public static langFileSize(JLandroid/content/res/Resources;)Ljava/lang/String;
    .locals 6
    .param p0, "sz"    # J
    .param p2, "r"    # Landroid/content/res/Resources;

    .prologue
    const/high16 v4, 0x42c80000    # 100.0f

    const/high16 v3, 0x41200000    # 10.0f

    .line 58
    const-wide/32 v0, 0x40000000

    cmp-long v0, p0, v0

    if-lez v0, :cond_0

    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    long-to-float v1, p0

    const/high16 v2, 0x4e800000

    div-float/2addr v1, v2

    mul-float/2addr v1, v4

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v4

    invoke-static {v1}, Lcom/vkontakte/android/Global;->formatFloat(F)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const v1, 0x7f08024d

    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 67
    :goto_0
    return-object v0

    .line 61
    :cond_0
    const-wide/32 v0, 0x100000

    cmp-long v0, p0, v0

    if-lez v0, :cond_1

    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    long-to-float v1, p0

    const/high16 v2, 0x49800000    # 1048576.0f

    div-float/2addr v1, v2

    mul-float/2addr v1, v3

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v3

    invoke-static {v1}, Lcom/vkontakte/android/Global;->formatFloat(F)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const v1, 0x7f08024f

    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 64
    :cond_1
    const-wide/16 v0, 0x400

    cmp-long v0, p0, v0

    if-lez v0, :cond_2

    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    long-to-float v1, p0

    const/high16 v2, 0x44800000    # 1024.0f

    div-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const v1, 0x7f08024e

    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 67
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const v1, 0x7f08024c

    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0
.end method

.method public static replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 1
    .param p0, "cs"    # Ljava/lang/CharSequence;

    .prologue
    .line 238
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/vk/emoji/Emoji;->instance(Landroid/content/Context;)Lcom/vk/emoji/Emoji;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vk/emoji/Emoji;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public static replaceEmojiModifiers(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "s"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 225
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 234
    .end local p0    # "s":Ljava/lang/String;
    :goto_0
    return-object p0

    .line 228
    .restart local p0    # "s":Ljava/lang/String;
    :cond_0
    sget-object v2, Lcom/vkontakte/android/Global;->emojiSkinModifierChars:Ljava/util/regex/Pattern;

    invoke-virtual {v2, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 229
    .local v1, "m":Ljava/util/regex/Matcher;
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 230
    .local v0, "buf":Ljava/lang/StringBuffer;
    :goto_1
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 231
    const-string/jumbo v2, ""

    invoke-virtual {v1, v0, v2}, Ljava/util/regex/Matcher;->appendReplacement(Ljava/lang/StringBuffer;Ljava/lang/String;)Ljava/util/regex/Matcher;

    goto :goto_1

    .line 233
    :cond_1
    invoke-virtual {v1, v0}, Ljava/util/regex/Matcher;->appendTail(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    .line 234
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static replaceHTML(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    .line 72
    if-nez p0, :cond_0

    .line 73
    const-string/jumbo v5, ""

    .line 122
    :goto_0
    return-object v5

    .line 75
    :cond_0
    const-string/jumbo v5, "<br>"

    const-string/jumbo v6, "\\n"

    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 84
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 85
    .local v0, "buf":Ljava/lang/StringBuffer;
    sget-object v5, Lcom/vkontakte/android/Global;->entitiesPtn:Ljava/util/regex/Pattern;

    if-nez v5, :cond_1

    .line 86
    const-string/jumbo v5, "&([a-zA-Z0-9#]+);"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v5

    sput-object v5, Lcom/vkontakte/android/Global;->entitiesPtn:Ljava/util/regex/Pattern;

    .line 88
    :cond_1
    sget-object v5, Lcom/vkontakte/android/Global;->entitiesPtn:Ljava/util/regex/Pattern;

    invoke-virtual {v5, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 89
    .local v3, "matcher":Ljava/util/regex/Matcher;
    const-string/jumbo v4, ""

    .line 90
    .local v4, "replacement":Ljava/lang/String;
    :goto_1
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_b

    .line 91
    invoke-virtual {v3, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 93
    .local v2, "entity":Ljava/lang/String;
    const-string/jumbo v5, "#"

    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 94
    invoke-virtual {v2, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    int-to-char v1, v5

    .line 95
    .local v1, "ch":C
    const/16 v5, 0x5c

    if-ne v1, v5, :cond_2

    .line 96
    const-string/jumbo v4, "\\\\\\\\"

    .line 119
    .end local v1    # "ch":C
    :goto_2
    invoke-virtual {v3, v0, v4}, Ljava/util/regex/Matcher;->appendReplacement(Ljava/lang/StringBuffer;Ljava/lang/String;)Ljava/util/regex/Matcher;

    goto :goto_1

    .line 97
    .restart local v1    # "ch":C
    :cond_2
    const/16 v5, 0x22

    if-ne v1, v5, :cond_3

    .line 98
    const-string/jumbo v4, "\\\\\""

    goto :goto_2

    .line 99
    :cond_3
    invoke-static {v1}, Ljava/lang/Character;->isISOControl(C)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 100
    const-string/jumbo v4, ""

    goto :goto_2

    .line 102
    :cond_4
    invoke-static {v1}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    .line 105
    .end local v1    # "ch":C
    :cond_5
    const-string/jumbo v5, "gt"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 106
    const-string/jumbo v4, ">"

    goto :goto_2

    .line 107
    :cond_6
    const-string/jumbo v5, "lt"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 108
    const-string/jumbo v4, "<"

    goto :goto_2

    .line 109
    :cond_7
    const-string/jumbo v5, "amp"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 110
    const-string/jumbo v4, "&"

    goto :goto_2

    .line 111
    :cond_8
    const-string/jumbo v5, "quot"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 112
    const-string/jumbo v4, "\\\\\""

    goto :goto_2

    .line 113
    :cond_9
    const-string/jumbo v5, "ndash"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 114
    const-string/jumbo v4, "-"

    goto :goto_2

    .line 116
    :cond_a
    const-string/jumbo v4, "?"

    goto :goto_2

    .line 121
    .end local v2    # "entity":Ljava/lang/String;
    :cond_b
    invoke-virtual {v3, v0}, Ljava/util/regex/Matcher;->appendTail(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    .line 122
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_0
.end method

.method public static scale(F)I
    .locals 1
    .param p0, "dip"    # F

    .prologue
    .line 176
    sget v0, Lcom/vkontakte/android/Global;->displayDensity:F

    mul-float/2addr v0, p0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method public static unwrapMentions(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 126
    if-nez p0, :cond_0

    .line 127
    const-string/jumbo v0, ""

    .line 130
    :goto_0
    return-object v0

    .line 129
    :cond_0
    const-string/jumbo v0, "\\[id(\\d+)\\|([^\\]]+)\\]"

    const-string/jumbo v1, "$2"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "\\[club(\\d+)\\|([^\\]]+)\\]"

    const-string/jumbo v2, "$2"

    .line 130
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
