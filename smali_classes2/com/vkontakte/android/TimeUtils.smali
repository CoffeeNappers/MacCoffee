.class public Lcom/vkontakte/android/TimeUtils;
.super Ljava/lang/Object;
.source "TimeUtils.java"


# static fields
.field public static final DAY:J = 0x5265c00L

.field public static final HOUR:J = 0x36ee80L

.field public static final MIN:J = 0xea60L

.field public static final MONTH:J = 0x9a7ec800L

.field public static final PERIODS:[J

.field public static final SEC:J = 0x3e8L

.field public static final WEEK:J = 0x240c8400L

.field public static final YEAR:J = 0x757b12c00L

.field private static customTimeZone:Ljava/util/TimeZone;

.field private static diff:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 28
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2, v6, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string/jumbo v3, "custom_timezone"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v1

    .line 29
    .local v1, "tz":F
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2, v6, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string/jumbo v3, "time_diff"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 30
    .local v0, "diff":I
    invoke-static {v1, v0}, Lcom/vkontakte/android/TimeUtils;->setCustomTimeZone(FI)V

    .line 60
    const/4 v2, 0x7

    new-array v2, v2, [J

    fill-array-data v2, :array_0

    sput-object v2, Lcom/vkontakte/android/TimeUtils;->PERIODS:[J

    return-void

    nop

    :array_0
    .array-data 8
        0x3e8
        0xea60
        0x36ee80
        0x5265c00
        0x240c8400
        0x9a7ec800L
        0x757b12c00L
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAge(III)I
    .locals 6
    .param p0, "bDay"    # I
    .param p1, "bMonth"    # I
    .param p2, "bYear"    # I

    .prologue
    .line 266
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 267
    .local v0, "c":Ljava/util/Calendar;
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v2

    .line 268
    .local v2, "now":I
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 269
    .local v1, "c2":Ljava/util/Calendar;
    const/4 v4, 0x5

    invoke-virtual {v1, v4, p0}, Ljava/util/Calendar;->set(II)V

    .line 270
    const/4 v4, 0x2

    add-int/lit8 v5, p1, -0x1

    invoke-virtual {v1, v4, v5}, Ljava/util/Calendar;->set(II)V

    .line 271
    sub-int v3, v2, p2

    .line 272
    .local v3, "years":I
    invoke-virtual {v1, v0}, Ljava/util/Calendar;->after(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 273
    add-int/lit8 v3, v3, -0x1

    .line 275
    :cond_0
    return v3
.end method

.method public static getCalendar()Ljava/util/Calendar;
    .locals 6

    .prologue
    .line 44
    sget-object v1, Lcom/vkontakte/android/TimeUtils;->customTimeZone:Ljava/util/TimeZone;

    if-eqz v1, :cond_0

    .line 45
    sget-object v1, Lcom/vkontakte/android/TimeUtils;->customTimeZone:Ljava/util/TimeZone;

    invoke-static {v1}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    .line 46
    .local v0, "cal":Ljava/util/Calendar;
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v1

    int-to-long v2, v1

    const-wide/16 v4, 0x3e8

    mul-long/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 49
    .end local v0    # "cal":Ljava/util/Calendar;
    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    goto :goto_0
.end method

.method public static getCurrentTime()I
    .locals 6

    .prologue
    .line 221
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    long-to-int v0, v2

    .line 222
    .local v0, "rawUnixTime":I
    sget-object v1, Lcom/vkontakte/android/TimeUtils;->customTimeZone:Ljava/util/TimeZone;

    if-nez v1, :cond_0

    .line 225
    .end local v0    # "rawUnixTime":I
    :goto_0
    return v0

    .restart local v0    # "rawUnixTime":I
    :cond_0
    sget v1, Lcom/vkontakte/android/TimeUtils;->diff:I

    sub-int/2addr v0, v1

    goto :goto_0
.end method

.method public static getOffset()I
    .locals 1

    .prologue
    .line 229
    sget v0, Lcom/vkontakte/android/TimeUtils;->diff:I

    neg-int v0, v0

    return v0
.end method

.method public static getVideoTimestampMs(Ljava/lang/String;)J
    .locals 6
    .param p0, "timestamp"    # Ljava/lang/String;

    .prologue
    const-wide/16 v2, 0x0

    .line 279
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 295
    :goto_0
    return-wide v2

    .line 283
    :cond_0
    const-string/jumbo v4, "m"

    invoke-virtual {p0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_2

    .line 284
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "00h00s"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 290
    :cond_1
    :goto_1
    :try_start_0
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string/jumbo v4, "HH\'h\'mm\'m\'ss\'s\'"

    invoke-direct {v1, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 291
    .local v1, "sdf":Ljava/text/SimpleDateFormat;
    const-string/jumbo v4, "UTC"

    invoke-static {v4}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 292
    invoke-virtual {v1, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 293
    .local v0, "date":Ljava/util/Date;
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    goto :goto_0

    .line 285
    .end local v0    # "date":Ljava/util/Date;
    .end local v1    # "sdf":Ljava/text/SimpleDateFormat;
    :cond_2
    const-string/jumbo v4, "h"

    invoke-virtual {p0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_1

    .line 286
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "00h"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    .line 294
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method public static langDate(I)Ljava/lang/String;
    .locals 1
    .param p0, "_dt"    # I

    .prologue
    .line 111
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/vkontakte/android/TimeUtils;->langDate(IZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static langDate(IZ)Ljava/lang/String;
    .locals 18
    .param p0, "_dt"    # I
    .param p1, "forceShortMonth"    # Z

    .prologue
    .line 81
    sget-object v11, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    .line 82
    .local v10, "res":Landroid/content/res/Resources;
    move/from16 v0, p0

    int-to-long v12, v0

    const-wide/16 v14, 0x3e8

    mul-long v6, v12, v14

    .line 83
    .local v6, "dt":J
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCalendar()Ljava/util/Calendar;

    move-result-object v8

    .line 84
    .local v8, "now":Ljava/util/Calendar;
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCalendar()Ljava/util/Calendar;

    move-result-object v3

    .line 85
    .local v3, "ds":Ljava/util/Calendar;
    const/16 v11, 0xc

    const/4 v12, 0x0

    invoke-virtual {v3, v11, v12}, Ljava/util/Calendar;->set(II)V

    .line 86
    const/16 v11, 0xb

    const/4 v12, 0x0

    invoke-virtual {v3, v11, v12}, Ljava/util/Calendar;->set(II)V

    .line 87
    const/16 v11, 0xd

    const/4 v12, 0x0

    invoke-virtual {v3, v11, v12}, Ljava/util/Calendar;->set(II)V

    .line 88
    const/16 v11, 0xe

    const/4 v12, 0x0

    invoke-virtual {v3, v11, v12}, Ljava/util/Calendar;->set(II)V

    .line 89
    invoke-virtual {v3}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    .line 90
    .local v4, "daystart":J
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCalendar()Ljava/util/Calendar;

    move-result-object v2

    .line 91
    .local v2, "c":Ljava/util/Calendar;
    invoke-virtual {v2, v6, v7}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 92
    const-string/jumbo v9, ""

    .line 93
    .local v9, "r":Ljava/lang/String;
    cmp-long v11, v4, v6

    if-gez v11, :cond_1

    const-wide/32 v12, 0x5265c00

    add-long/2addr v12, v4

    cmp-long v11, v12, v6

    if-ltz v11, :cond_1

    .line 94
    const-string/jumbo v12, "%s %s %d:%02d"

    const/4 v11, 0x4

    new-array v13, v11, [Ljava/lang/Object;

    const/4 v11, 0x0

    const v14, 0x7f080709

    invoke-virtual {v10, v14}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v13, v11

    const/4 v14, 0x1

    const/16 v11, 0xb

    invoke-virtual {v2, v11}, Ljava/util/Calendar;->get(I)I

    move-result v11

    const/4 v15, 0x1

    if-ne v11, v15, :cond_0

    const v11, 0x7f08079e

    :goto_0
    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v13, v14

    const/4 v11, 0x2

    const/16 v14, 0xb

    invoke-virtual {v2, v14}, Ljava/util/Calendar;->get(I)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v13, v11

    const/4 v11, 0x3

    const/16 v14, 0xc

    invoke-virtual {v2, v14}, Ljava/util/Calendar;->get(I)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v13, v11

    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 107
    :goto_1
    return-object v9

    .line 94
    :cond_0
    const v11, 0x7f080199

    goto :goto_0

    .line 95
    :cond_1
    const-wide/32 v12, 0x5265c00

    add-long/2addr v12, v4

    cmp-long v11, v12, v6

    if-gez v11, :cond_3

    const-wide/32 v12, 0xa4cb800

    add-long/2addr v12, v4

    cmp-long v11, v12, v6

    if-lez v11, :cond_3

    .line 96
    const-string/jumbo v12, "%s %s %d:%02d"

    const/4 v11, 0x4

    new-array v13, v11, [Ljava/lang/Object;

    const/4 v11, 0x0

    const v14, 0x7f08070c

    invoke-virtual {v10, v14}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v13, v11

    const/4 v14, 0x1

    const/16 v11, 0xb

    invoke-virtual {v2, v11}, Ljava/util/Calendar;->get(I)I

    move-result v11

    const/4 v15, 0x1

    if-ne v11, v15, :cond_2

    const v11, 0x7f08079e

    :goto_2
    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v13, v14

    const/4 v11, 0x2

    const/16 v14, 0xb

    invoke-virtual {v2, v14}, Ljava/util/Calendar;->get(I)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v13, v11

    const/4 v11, 0x3

    const/16 v14, 0xc

    invoke-virtual {v2, v14}, Ljava/util/Calendar;->get(I)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v13, v11

    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    goto :goto_1

    :cond_2
    const v11, 0x7f080199

    goto :goto_2

    .line 97
    :cond_3
    const-wide/32 v12, 0x5265c00

    sub-long v12, v4, v12

    cmp-long v11, v12, v6

    if-gez v11, :cond_5

    cmp-long v11, v4, v6

    if-ltz v11, :cond_5

    .line 98
    const-string/jumbo v12, "%s %s %d:%02d"

    const/4 v11, 0x4

    new-array v13, v11, [Ljava/lang/Object;

    const/4 v11, 0x0

    const v14, 0x7f080799

    invoke-virtual {v10, v14}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v13, v11

    const/4 v14, 0x1

    const/16 v11, 0xb

    invoke-virtual {v2, v11}, Ljava/util/Calendar;->get(I)I

    move-result v11

    const/4 v15, 0x1

    if-ne v11, v15, :cond_4

    const v11, 0x7f08079e

    :goto_3
    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v13, v14

    const/4 v11, 0x2

    const/16 v14, 0xb

    invoke-virtual {v2, v14}, Ljava/util/Calendar;->get(I)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v13, v11

    const/4 v11, 0x3

    const/16 v14, 0xc

    invoke-virtual {v2, v14}, Ljava/util/Calendar;->get(I)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v13, v11

    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    goto/16 :goto_1

    :cond_4
    const v11, 0x7f080199

    goto :goto_3

    .line 100
    :cond_5
    const/4 v11, 0x1

    invoke-virtual {v2, v11}, Ljava/util/Calendar;->get(I)I

    move-result v11

    const/4 v12, 0x1

    invoke-virtual {v8, v12}, Ljava/util/Calendar;->get(I)I

    move-result v12

    if-eq v11, v12, :cond_6

    .line 101
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const v12, 0x7f08019b

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    const/4 v15, 0x5

    invoke-virtual {v2, v15}, Ljava/util/Calendar;->get(I)I

    move-result v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x1

    const v15, 0x7f0c0017

    invoke-virtual {v10, v15}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x2

    move/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/util/Calendar;->get(I)I

    move-result v16

    const/16 v17, 0xb

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->min(II)I

    move-result v16

    aget-object v15, v15, v16

    aput-object v15, v13, v14

    const/4 v14, 0x2

    const/4 v15, 0x1

    invoke-virtual {v2, v15}, Ljava/util/Calendar;->get(I)I

    move-result v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-virtual {v10, v12, v13}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 105
    :goto_4
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, " %s %d:%02d"

    const/4 v11, 0x3

    new-array v14, v11, [Ljava/lang/Object;

    const/4 v15, 0x0

    const/16 v11, 0xb

    invoke-virtual {v2, v11}, Ljava/util/Calendar;->get(I)I

    move-result v11

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ne v11, v0, :cond_8

    const v11, 0x7f08079e

    :goto_5
    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v14, v15

    const/4 v11, 0x1

    const/16 v15, 0xb

    invoke-virtual {v2, v15}, Ljava/util/Calendar;->get(I)I

    move-result v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v14, v11

    const/4 v11, 0x2

    const/16 v15, 0xc

    invoke-virtual {v2, v15}, Ljava/util/Calendar;->get(I)I

    move-result v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v14, v11

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    goto/16 :goto_1

    .line 103
    :cond_6
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const v13, 0x7f08019a

    const/4 v11, 0x2

    new-array v14, v11, [Ljava/lang/Object;

    const/4 v11, 0x0

    const/4 v15, 0x5

    invoke-virtual {v2, v15}, Ljava/util/Calendar;->get(I)I

    move-result v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v14, v11

    const/4 v15, 0x1

    if-eqz p1, :cond_7

    const v11, 0x7f0c0017

    :goto_6
    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v11

    const/16 v16, 0x2

    move/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/util/Calendar;->get(I)I

    move-result v16

    const/16 v17, 0xb

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->min(II)I

    move-result v16

    aget-object v11, v11, v16

    aput-object v11, v14, v15

    invoke-virtual {v10, v13, v14}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    goto/16 :goto_4

    :cond_7
    const v11, 0x7f0c0016

    goto :goto_6

    .line 105
    :cond_8
    const v11, 0x7f080199

    goto :goto_5
.end method

.method public static langDateDay(I)Ljava/lang/String;
    .locals 15
    .param p0, "_dt"    # I

    .prologue
    .line 140
    sget-object v9, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 141
    .local v8, "res":Landroid/content/res/Resources;
    int-to-long v10, p0

    const-wide/16 v12, 0x3e8

    mul-long v4, v10, v12

    .line 142
    .local v4, "dt":J
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCalendar()Ljava/util/Calendar;

    move-result-object v6

    .line 143
    .local v6, "now":Ljava/util/Calendar;
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCalendar()Ljava/util/Calendar;

    move-result-object v1

    .line 144
    .local v1, "ds":Ljava/util/Calendar;
    const/16 v9, 0xc

    const/4 v10, 0x0

    invoke-virtual {v1, v9, v10}, Ljava/util/Calendar;->set(II)V

    .line 145
    const/16 v9, 0xb

    const/4 v10, 0x0

    invoke-virtual {v1, v9, v10}, Ljava/util/Calendar;->set(II)V

    .line 146
    const/16 v9, 0xd

    const/4 v10, 0x0

    invoke-virtual {v1, v9, v10}, Ljava/util/Calendar;->set(II)V

    .line 147
    const/16 v9, 0xe

    const/4 v10, 0x0

    invoke-virtual {v1, v9, v10}, Ljava/util/Calendar;->set(II)V

    .line 148
    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    .line 149
    .local v2, "daystart":J
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCalendar()Ljava/util/Calendar;

    move-result-object v0

    .line 150
    .local v0, "c":Ljava/util/Calendar;
    invoke-virtual {v0, v4, v5}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 151
    const-string/jumbo v7, ""

    .line 152
    .local v7, "r":Ljava/lang/String;
    cmp-long v9, v2, v4

    if-gez v9, :cond_0

    const-wide/32 v10, 0x5265c00

    add-long/2addr v10, v2

    cmp-long v9, v10, v4

    if-ltz v9, :cond_0

    .line 153
    const v9, 0x7f080709

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 163
    :goto_0
    return-object v7

    .line 154
    :cond_0
    const-wide/32 v10, 0x5265c00

    add-long/2addr v10, v2

    cmp-long v9, v10, v4

    if-gez v9, :cond_1

    const-wide/32 v10, 0xa4cb800

    add-long/2addr v10, v2

    cmp-long v9, v10, v4

    if-lez v9, :cond_1

    .line 155
    const v9, 0x7f08070c

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 156
    :cond_1
    const-wide/32 v10, 0x5265c00

    sub-long v10, v2, v10

    cmp-long v9, v10, v4

    if-gez v9, :cond_2

    cmp-long v9, v2, v4

    if-ltz v9, :cond_2

    .line 157
    const v9, 0x7f080799

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 158
    :cond_2
    const/4 v9, 0x1

    invoke-virtual {v0, v9}, Ljava/util/Calendar;->get(I)I

    move-result v9

    const/4 v10, 0x1

    invoke-virtual {v6, v10}, Ljava/util/Calendar;->get(I)I

    move-result v10

    if-eq v9, v10, :cond_3

    .line 159
    const v9, 0x7f08019b

    const/4 v10, 0x3

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const/4 v12, 0x5

    invoke-virtual {v0, v12}, Ljava/util/Calendar;->get(I)I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    const v12, 0x7f0c0017

    invoke-virtual {v8, v12}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x2

    invoke-virtual {v0, v13}, Ljava/util/Calendar;->get(I)I

    move-result v13

    const/16 v14, 0xb

    invoke-static {v13, v14}, Ljava/lang/Math;->min(II)I

    move-result v13

    aget-object v12, v12, v13

    aput-object v12, v10, v11

    const/4 v11, 0x2

    const/4 v12, 0x1

    invoke-virtual {v0, v12}, Ljava/util/Calendar;->get(I)I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-virtual {v8, v9, v10}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 161
    :cond_3
    const v9, 0x7f08019a

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const/4 v12, 0x5

    invoke-virtual {v0, v12}, Ljava/util/Calendar;->get(I)I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    const v12, 0x7f0c0016

    invoke-virtual {v8, v12}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x2

    invoke-virtual {v0, v13}, Ljava/util/Calendar;->get(I)I

    move-result v13

    const/16 v14, 0xb

    invoke-static {v13, v14}, Ljava/lang/Math;->min(II)I

    move-result v13

    aget-object v12, v12, v13

    aput-object v12, v10, v11

    invoke-virtual {v8, v9, v10}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_0
.end method

.method public static langDateRelative(ILandroid/content/res/Resources;)Ljava/lang/String;
    .locals 7
    .param p0, "dt"    # I
    .param p1, "r"    # Landroid/content/res/Resources;

    .prologue
    const v3, 0x7f0c0006

    const/4 v4, 0x1

    const/4 v6, 0x0

    .line 167
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v1

    .line 168
    .local v1, "now":I
    sub-int v0, v1, p0

    .line 169
    .local v0, "diff":I
    const/16 v2, 0x3840

    if-ge v0, v2, :cond_0

    if-gez v0, :cond_1

    .line 170
    :cond_0
    invoke-static {p0}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v2

    .line 187
    :goto_0
    return-object v2

    .line 172
    :cond_1
    const/16 v2, 0x2a30

    if-lt v0, v2, :cond_2

    .line 173
    invoke-virtual {p1, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    aget-object v2, v2, v3

    goto :goto_0

    .line 175
    :cond_2
    const/16 v2, 0x1c20

    if-lt v0, v2, :cond_3

    .line 176
    invoke-virtual {p1, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    aget-object v2, v2, v4

    goto :goto_0

    .line 178
    :cond_3
    const/16 v2, 0xe10

    if-lt v0, v2, :cond_4

    .line 179
    invoke-virtual {p1, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    aget-object v2, v2, v6

    goto :goto_0

    .line 181
    :cond_4
    const/16 v2, 0x3c

    if-lt v0, v2, :cond_5

    .line 182
    const v2, 0x7f0d0009

    div-int/lit8 v3, v0, 0x3c

    new-array v4, v4, [Ljava/lang/Object;

    div-int/lit8 v5, v0, 0x3c

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {p1, v2, v3, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 184
    :cond_5
    const/16 v2, 0xa

    if-gt v0, v2, :cond_6

    .line 185
    const v2, 0x7f080198

    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 187
    :cond_6
    const v2, 0x7f0d000a

    new-array v3, v4, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {p1, v2, v0, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public static langDateRelativeNoDiff(ILandroid/content/res/Resources;)Ljava/lang/String;
    .locals 7
    .param p0, "dt"    # I
    .param p1, "r"    # Landroid/content/res/Resources;

    .prologue
    const v3, 0x7f0c0006

    const/4 v4, 0x1

    const/4 v6, 0x0

    .line 191
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v1

    .line 192
    .local v1, "now":I
    sub-int v0, v1, p0

    .line 193
    .local v0, "diff":I
    const/16 v2, 0x3840

    if-ge v0, v2, :cond_0

    if-gez v0, :cond_1

    .line 194
    :cond_0
    invoke-static {p0}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v2

    .line 211
    :goto_0
    return-object v2

    .line 196
    :cond_1
    const/16 v2, 0x2a30

    if-lt v0, v2, :cond_2

    .line 197
    invoke-virtual {p1, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    aget-object v2, v2, v3

    goto :goto_0

    .line 199
    :cond_2
    const/16 v2, 0x1c20

    if-lt v0, v2, :cond_3

    .line 200
    invoke-virtual {p1, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    aget-object v2, v2, v4

    goto :goto_0

    .line 202
    :cond_3
    const/16 v2, 0xe10

    if-lt v0, v2, :cond_4

    .line 203
    invoke-virtual {p1, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    aget-object v2, v2, v6

    goto :goto_0

    .line 205
    :cond_4
    const/16 v2, 0x3c

    if-lt v0, v2, :cond_5

    .line 206
    const v2, 0x7f0d0009

    div-int/lit8 v3, v0, 0x3c

    new-array v4, v4, [Ljava/lang/Object;

    div-int/lit8 v5, v0, 0x3c

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {p1, v2, v3, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 208
    :cond_5
    const/16 v2, 0xa

    if-gt v0, v2, :cond_6

    .line 209
    const v2, 0x7f080198

    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 211
    :cond_6
    const v2, 0x7f0d000a

    new-array v3, v4, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {p1, v2, v0, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public static langDateShort(I)Ljava/lang/String;
    .locals 15
    .param p0, "_dt"    # I

    .prologue
    .line 115
    sget-object v9, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 116
    .local v8, "res":Landroid/content/res/Resources;
    int-to-long v10, p0

    const-wide/16 v12, 0x3e8

    mul-long v4, v10, v12

    .line 117
    .local v4, "dt":J
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCalendar()Ljava/util/Calendar;

    move-result-object v6

    .line 118
    .local v6, "now":Ljava/util/Calendar;
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCalendar()Ljava/util/Calendar;

    move-result-object v1

    .line 119
    .local v1, "ds":Ljava/util/Calendar;
    const/16 v9, 0xc

    const/4 v10, 0x0

    invoke-virtual {v1, v9, v10}, Ljava/util/Calendar;->set(II)V

    .line 120
    const/16 v9, 0xb

    const/4 v10, 0x0

    invoke-virtual {v1, v9, v10}, Ljava/util/Calendar;->set(II)V

    .line 121
    const/16 v9, 0xd

    const/4 v10, 0x0

    invoke-virtual {v1, v9, v10}, Ljava/util/Calendar;->set(II)V

    .line 122
    const/16 v9, 0xe

    const/4 v10, 0x0

    invoke-virtual {v1, v9, v10}, Ljava/util/Calendar;->set(II)V

    .line 123
    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    .line 124
    .local v2, "daystart":J
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCalendar()Ljava/util/Calendar;

    move-result-object v0

    .line 125
    .local v0, "c":Ljava/util/Calendar;
    invoke-virtual {v0, v4, v5}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 126
    const-string/jumbo v7, ""

    .line 127
    .local v7, "r":Ljava/lang/String;
    cmp-long v9, v2, v4

    if-gez v9, :cond_0

    .line 128
    const-string/jumbo v9, "%d:%02d"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const/16 v12, 0xb

    invoke-virtual {v0, v12}, Ljava/util/Calendar;->get(I)I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    const/16 v12, 0xc

    invoke-virtual {v0, v12}, Ljava/util/Calendar;->get(I)I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 136
    :goto_0
    return-object v7

    .line 129
    :cond_0
    const-wide/32 v10, 0x5265c00

    sub-long v10, v2, v10

    cmp-long v9, v10, v4

    if-gez v9, :cond_1

    cmp-long v9, v2, v4

    if-ltz v9, :cond_1

    .line 130
    const v9, 0x7f080799

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 131
    :cond_1
    const/4 v9, 0x1

    invoke-virtual {v0, v9}, Ljava/util/Calendar;->get(I)I

    move-result v9

    const/4 v10, 0x1

    invoke-virtual {v6, v10}, Ljava/util/Calendar;->get(I)I

    move-result v10

    if-eq v9, v10, :cond_2

    .line 132
    const v9, 0x7f08019b

    const/4 v10, 0x3

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const/4 v12, 0x5

    invoke-virtual {v0, v12}, Ljava/util/Calendar;->get(I)I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    const v12, 0x7f0c0017

    invoke-virtual {v8, v12}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x2

    invoke-virtual {v0, v13}, Ljava/util/Calendar;->get(I)I

    move-result v13

    const/16 v14, 0xb

    invoke-static {v13, v14}, Ljava/lang/Math;->min(II)I

    move-result v13

    aget-object v12, v12, v13

    aput-object v12, v10, v11

    const/4 v11, 0x2

    const/4 v12, 0x1

    invoke-virtual {v0, v12}, Ljava/util/Calendar;->get(I)I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-virtual {v8, v9, v10}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 134
    :cond_2
    const v9, 0x7f08019a

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const/4 v12, 0x5

    invoke-virtual {v0, v12}, Ljava/util/Calendar;->get(I)I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    const v12, 0x7f0c0017

    invoke-virtual {v8, v12}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x2

    invoke-virtual {v0, v13}, Ljava/util/Calendar;->get(I)I

    move-result v13

    const/16 v14, 0xb

    invoke-static {v13, v14}, Ljava/lang/Math;->min(II)I

    move-result v13

    aget-object v12, v12, v13

    aput-object v12, v10, v11

    invoke-virtual {v8, v9, v10}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_0
.end method

.method public static resyncOffset()V
    .locals 2

    .prologue
    .line 246
    new-instance v0, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v1, "getServerTime"

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/TimeUtils$1;

    invoke-direct {v1}, Lcom/vkontakte/android/TimeUtils$1;-><init>()V

    .line 247
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 262
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 263
    return-void
.end method

.method public static setCustomTimeZone(FI)V
    .locals 9
    .param p0, "offset"    # F
    .param p1, "diff"    # I

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x0

    const/high16 v6, 0x42700000    # 60.0f

    .line 34
    const/4 v0, 0x0

    cmpl-float v0, p0, v0

    if-nez v0, :cond_0

    .line 35
    sput-object v8, Lcom/vkontakte/android/TimeUtils;->customTimeZone:Ljava/util/TimeZone;

    .line 39
    :goto_0
    sput p1, Lcom/vkontakte/android/TimeUtils;->diff:I

    .line 40
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v0, v8, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "custom_timezone"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "time_diff"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 41
    return-void

    .line 37
    :cond_0
    new-instance v0, Ljava/util/SimpleTimeZone;

    const/high16 v1, 0x45610000    # 3600.0f

    mul-float/2addr v1, p0

    const/high16 v2, 0x447a0000    # 1000.0f

    mul-float/2addr v1, v2

    float-to-int v1, v1

    const-string/jumbo v2, "Custom %d:%02d"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    float-to-int v4, p0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v7

    const/4 v4, 0x1

    mul-float v5, p0, v6

    rem-float/2addr v5, v6

    float-to-int v5, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/util/SimpleTimeZone;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/TimeUtils;->customTimeZone:Ljava/util/TimeZone;

    goto :goto_0
.end method

.method public static setServerTime(I)V
    .locals 9
    .param p0, "serverTime"    # I

    .prologue
    const/high16 v8, 0x45610000    # 3600.0f

    .line 233
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    long-to-int v1, v4

    .line 234
    .local v1, "localTime":I
    sub-int v4, p0, v1

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    const/16 v5, 0x708

    if-le v4, v5, :cond_0

    .line 235
    sub-int v4, v1, p0

    int-to-float v4, v4

    div-float/2addr v4, v8

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    int-to-float v0, v4

    .line 236
    .local v0, "diffHours":F
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x447a0000    # 1000.0f

    div-float/2addr v4, v5

    div-float v2, v4, v8

    .line 237
    .local v2, "localTimeZone":F
    add-float v3, v2, v0

    .line 238
    .local v3, "offset":F
    mul-float v4, v0, v8

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/TimeUtils;->setCustomTimeZone(FI)V

    .line 239
    const-string/jumbo v4, "vk"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Using custom timezone with offset "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    .end local v0    # "diffHours":F
    .end local v2    # "localTimeZone":F
    .end local v3    # "offset":F
    :goto_0
    return-void

    .line 241
    :cond_0
    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lcom/vkontakte/android/TimeUtils;->setCustomTimeZone(FI)V

    goto :goto_0
.end method

.method public static shortDate(JLandroid/content/Context;)Ljava/lang/String;
    .locals 10
    .param p0, "_dt"    # J
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v8, 0x0

    .line 64
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0c0035

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    .line 65
    .local v1, "s":[Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    mul-long/2addr v6, p0

    sub-long p0, v4, v6

    .line 66
    sget-object v4, Lcom/vkontakte/android/TimeUtils;->PERIODS:[J

    array-length v4, v4

    add-int/lit8 v0, v4, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_2

    .line 67
    sget-object v4, Lcom/vkontakte/android/TimeUtils;->PERIODS:[J

    aget-wide v4, v4, v0

    cmp-long v4, p0, v4

    if-lez v4, :cond_1

    .line 68
    sget-object v4, Lcom/vkontakte/android/TimeUtils;->PERIODS:[J

    aget-wide v4, v4, v0

    div-long v2, p0, v4

    .line 69
    .local v2, "time":J
    sget-object v4, Lcom/vkontakte/android/TimeUtils;->PERIODS:[J

    array-length v4, v4

    add-int/lit8 v4, v4, -0x1

    if-ne v0, v4, :cond_0

    const-wide/16 v4, 0x5

    cmp-long v4, v2, v4

    if-ltz v4, :cond_0

    .line 70
    sget-object v4, Lcom/vkontakte/android/TimeUtils;->PERIODS:[J

    aget-wide v4, v4, v0

    div-long v4, p0, v4

    const-wide/16 v6, 0x7b2

    add-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    .line 77
    .end local v2    # "time":J
    :goto_1
    return-object v4

    .line 72
    .restart local v2    # "time":J
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/vkontakte/android/TimeUtils;->PERIODS:[J

    aget-wide v6, v5, v0

    div-long v6, p0, v6

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, v1, v0

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    .line 66
    .end local v2    # "time":J
    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 77
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, v1, v8

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_1
.end method

.method public static time(I)Ljava/lang/String;
    .locals 6
    .param p0, "t"    # I

    .prologue
    .line 215
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCalendar()Ljava/util/Calendar;

    move-result-object v0

    .line 216
    .local v0, "c":Ljava/util/Calendar;
    int-to-long v2, p0

    const-wide/16 v4, 0x3e8

    mul-long/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 217
    const-string/jumbo v1, "%d:%02d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const/16 v4, 0xb

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const/16 v4, 0xc

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
