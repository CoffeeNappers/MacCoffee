.class public final Lcom/vkontakte/android/cache/Videos;
.super Ljava/lang/Object;
.source "Videos.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/cache/Videos$Quality;
    }
.end annotation


# static fields
.field public static final QUALITY_1080:I = 0x6

.field public static final QUALITY_240:I = 0x2

.field public static final QUALITY_360:I = 0x3

.field public static final QUALITY_480:I = 0x4

.field public static final QUALITY_720:I = 0x5

.field public static final QUALITY_HLS:I = -0x2

.field public static final QUALITY_UNKNOWN:I = -0x1


# direct methods
.method private constructor <init>()V
    .locals 5

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    .line 46
    .local v0, "account":Lcom/vkontakte/android/auth/VKAccount;
    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isUseVigo()Z

    move-result v2

    if-nez v2, :cond_0

    .line 47
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string/jumbo v3, "Vigo is disabled"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 50
    :cond_0
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v2

    sget-object v3, Lcom/vk/core/network/Network$ClientType;->CLIENT_VIGO:Lcom/vk/core/network/Network$ClientType;

    invoke-virtual {v2, v3}, Lcom/vk/core/network/Network;->getBuilder(Lcom/vk/core/network/Network$ClientType;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    .line 51
    .local v1, "vigoBuilder":Lokhttp3/OkHttpClient$Builder;
    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getVigoConnectTimeout()I

    move-result v2

    int-to-long v2, v2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    .line 52
    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getVigoReadTimeout()I

    move-result v2

    int-to-long v2, v2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    .line 53
    const-wide/16 v2, 0x3e8

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4}, Lokhttp3/OkHttpClient$Builder;->writeTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    .line 54
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v2

    sget-object v3, Lcom/vk/core/network/Network$ClientType;->CLIENT_VIGO:Lcom/vk/core/network/Network$ClientType;

    invoke-virtual {v2, v3, v1}, Lcom/vk/core/network/Network;->setBuilder(Lcom/vk/core/network/Network$ClientType;Lokhttp3/OkHttpClient$Builder;)Lokhttp3/OkHttpClient;

    .line 55
    return-void
.end method

.method public static allowAutoPlayVideo()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 293
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->isVideoAutoPlayAvailable()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 294
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 295
    .local v0, "preferences":Landroid/content/SharedPreferences;
    const-string/jumbo v3, "video_autoplay"

    const-string/jumbo v4, "always"

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 296
    .local v1, "value":Ljava/lang/String;
    const-string/jumbo v3, "always"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string/jumbo v3, "wifi"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->isWifi()Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    const/4 v2, 0x1

    .line 298
    :cond_1
    return v2
.end method

.method public static formatDuration(I)Ljava/lang/String;
    .locals 6
    .param p0, "duration"    # I

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 303
    if-gez p0, :cond_0

    .line 304
    const/4 p0, 0x0

    .line 306
    :cond_0
    const/16 v0, 0xe10

    if-ge p0, v0, :cond_1

    .line 307
    const-string/jumbo v0, "%d:%02d"

    new-array v1, v5, [Ljava/lang/Object;

    div-int/lit8 v2, p0, 0x3c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    rem-int/lit8 v2, p0, 0x3c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 309
    :goto_0
    return-object v0

    :cond_1
    const-string/jumbo v0, "%d:%02d:%02d"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    div-int/lit16 v2, p0, 0xe10

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    div-int/lit8 v2, p0, 0x3c

    rem-int/lit8 v2, v2, 0x3c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    rem-int/lit8 v2, p0, 0x3c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static formatQuality(I)Ljava/lang/String;
    .locals 1
    .param p0, "quality"    # I

    .prologue
    .line 314
    packed-switch p0, :pswitch_data_0

    .line 329
    :pswitch_0
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 316
    :pswitch_1
    const-string/jumbo v0, "Auto"

    goto :goto_0

    .line 318
    :pswitch_2
    const-string/jumbo v0, "240"

    goto :goto_0

    .line 320
    :pswitch_3
    const-string/jumbo v0, "360"

    goto :goto_0

    .line 322
    :pswitch_4
    const-string/jumbo v0, "480"

    goto :goto_0

    .line 324
    :pswitch_5
    const-string/jumbo v0, "720"

    goto :goto_0

    .line 326
    :pswitch_6
    const-string/jumbo v0, "1080"

    goto :goto_0

    .line 314
    nop

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public static getAutoPlayState()Ljava/lang/String;
    .locals 3

    .prologue
    .line 284
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->isVideoAutoPlayAvailable()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 285
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 286
    .local v0, "preferences":Landroid/content/SharedPreferences;
    const-string/jumbo v1, "video_autoplay"

    const-string/jumbo v2, "always"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 288
    .end local v0    # "preferences":Landroid/content/SharedPreferences;
    :goto_0
    return-object v1

    :cond_0
    const-string/jumbo v1, "unavailable"

    goto :goto_0
.end method

.method public static getMaxSupportedQuality()I
    .locals 5

    .prologue
    .line 241
    const/4 v1, 0x3

    .line 242
    .local v1, "fromScreen":I
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 243
    .local v0, "dm":Landroid/util/DisplayMetrics;
    iget v3, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v4, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 244
    .local v2, "screenSize":I
    const/16 v3, 0x400

    if-lt v2, v3, :cond_1

    .line 245
    const/4 v1, 0x6

    .line 251
    :cond_0
    :goto_0
    return v1

    .line 246
    :cond_1
    const/16 v3, 0x320

    if-lt v2, v3, :cond_2

    .line 247
    const/4 v1, 0x5

    goto :goto_0

    .line 248
    :cond_2
    const/16 v3, 0x1e0

    if-lt v2, v3, :cond_0

    .line 249
    const/4 v1, 0x4

    goto :goto_0
.end method

.method public static getQuality(Lcom/vkontakte/android/api/VideoFile;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/lang/String;)I
    .locals 24
    .param p0, "file"    # Lcom/vkontakte/android/api/VideoFile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "useVigo"    # Ljava/util/concurrent/atomic/AtomicBoolean;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "svcid"    # Ljava/lang/String;
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .prologue
    .line 64
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/api/VideoFile;->isHLSSupported()Z

    move-result v22

    if-eqz v22, :cond_1

    .line 65
    const/16 v18, -0x2

    .line 168
    :cond_0
    :goto_0
    return v18

    .line 68
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/api/VideoFile;->url240:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    .line 69
    .local v12, "no240":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/api/VideoFile;->url360:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    .line 70
    .local v13, "no360":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/api/VideoFile;->url480:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    .line 71
    .local v14, "no480":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/api/VideoFile;->url720:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v15

    .line 72
    .local v15, "no720":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/api/VideoFile;->url1080:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    .line 75
    .local v11, "no1080":Z
    if-nez v12, :cond_2

    if-eqz v13, :cond_2

    if-eqz v14, :cond_2

    if-eqz v15, :cond_2

    if-eqz v11, :cond_2

    .line 76
    const/16 v18, 0x2

    goto :goto_0

    .line 78
    :cond_2
    if-eqz v12, :cond_3

    if-nez v13, :cond_3

    if-eqz v14, :cond_3

    if-eqz v15, :cond_3

    if-eqz v11, :cond_3

    .line 79
    const/16 v18, 0x3

    goto :goto_0

    .line 81
    :cond_3
    if-eqz v12, :cond_4

    if-eqz v13, :cond_4

    if-nez v14, :cond_4

    if-eqz v15, :cond_4

    if-eqz v11, :cond_4

    .line 82
    const/16 v18, 0x4

    goto :goto_0

    .line 84
    :cond_4
    if-eqz v12, :cond_5

    if-eqz v13, :cond_5

    if-eqz v14, :cond_5

    if-nez v15, :cond_5

    if-eqz v11, :cond_5

    .line 85
    const/16 v18, 0x5

    goto :goto_0

    .line 87
    :cond_5
    if-eqz v12, :cond_6

    if-eqz v13, :cond_6

    if-eqz v14, :cond_6

    if-eqz v15, :cond_6

    if-nez v11, :cond_6

    .line 88
    const/16 v18, 0x6

    goto :goto_0

    .line 91
    :cond_6
    invoke-static {}, Lcom/vkontakte/android/cache/Videos;->getMaxSupportedQuality()I

    move-result v7

    .line 93
    .local v7, "maxDeviceSupportedQuality":I
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    .line 94
    .local v3, "account":Lcom/vkontakte/android/auth/VKAccount;
    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->isUseVigo()Z

    move-result v22

    if-nez v22, :cond_8

    .line 95
    new-instance v22, Ljava/lang/IllegalStateException;

    const-string/jumbo v23, "Vigo is disabled"

    invoke-direct/range {v22 .. v23}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v22
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    .end local v3    # "account":Lcom/vkontakte/android/auth/VKAccount;
    :catch_0
    move-exception v19

    .line 149
    .local v19, "t":Ljava/lang/Throwable;
    if-eqz p1, :cond_7

    .line 150
    const/16 v22, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 153
    :cond_7
    if-nez v11, :cond_11

    const/4 v8, 0x6

    .line 159
    .local v8, "maxVideoSupportedQuality":I
    :goto_1
    if-nez v12, :cond_15

    const/4 v10, 0x2

    .line 165
    .local v10, "minVideoSupportedQuality":I
    :goto_2
    if-ge v8, v7, :cond_19

    move v6, v8

    .line 166
    .local v6, "max":I
    :goto_3
    invoke-static {v10, v7}, Ljava/lang/Math;->min(II)I

    move-result v9

    .line 168
    .local v9, "min":I
    invoke-static {v6, v9}, Lcom/vkontakte/android/cache/Videos;->getQualityByUserOrNetwork(II)I

    move-result v18

    goto/16 :goto_0

    .line 98
    .end local v6    # "max":I
    .end local v8    # "maxVideoSupportedQuality":I
    .end local v9    # "min":I
    .end local v10    # "minVideoSupportedQuality":I
    .end local v19    # "t":Ljava/lang/Throwable;
    .restart local v3    # "account":Lcom/vkontakte/android/auth/VKAccount;
    :cond_8
    :try_start_1
    const-string/jumbo v22, "http://api.vigo.ru/uxzoom/2/network_status"

    invoke-static/range {v22 .. v22}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v4

    .line 100
    .local v4, "builder":Landroid/net/Uri$Builder;
    if-nez v12, :cond_9

    .line 101
    const-string/jumbo v22, "quality"

    const-string/jumbo v23, "2"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v4, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 103
    :cond_9
    if-nez v13, :cond_a

    .line 104
    const-string/jumbo v22, "quality"

    const-string/jumbo v23, "3"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v4, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 106
    :cond_a
    if-nez v14, :cond_b

    const/16 v22, 0x4

    move/from16 v0, v22

    if-lt v7, v0, :cond_b

    .line 107
    const-string/jumbo v22, "quality"

    const-string/jumbo v23, "4"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v4, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 109
    :cond_b
    if-nez v15, :cond_c

    const/16 v22, 0x5

    move/from16 v0, v22

    if-lt v7, v0, :cond_c

    .line 110
    const-string/jumbo v22, "quality"

    const-string/jumbo v23, "5"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v4, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 112
    :cond_c
    if-nez v11, :cond_d

    const/16 v22, 0x6

    move/from16 v0, v22

    if-lt v7, v0, :cond_d

    .line 113
    const-string/jumbo v22, "quality"

    const-string/jumbo v23, "6"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v4, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 116
    :cond_d
    sget-object v22, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static/range {v22 .. v22}, Lcom/vkontakte/android/VKApplication;->getVigo(Landroid/content/Context;)Lcom/vkontakte/android/media/Vigo;

    move-result-object v21

    .line 117
    .local v21, "vigo":Lcom/vkontakte/android/media/Vigo;
    invoke-virtual {v4}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v20

    .line 119
    .local v20, "url":Ljava/lang/String;
    if-eqz v21, :cond_e

    .line 121
    const/16 v22, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, p2

    move-object/from16 v2, v22

    invoke-virtual {v0, v4, v1, v2}, Lcom/vkontakte/android/media/Vigo;->fillPlaybackUrlParams(Landroid/net/Uri$Builder;Ljava/lang/String;Lcom/vkontakte/android/media/VigoBinaryBuffer;)Landroid/net/Uri$Builder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v20

    .line 127
    :cond_e
    new-instance v22, Lokhttp3/Request$Builder;

    invoke-direct/range {v22 .. v22}, Lokhttp3/Request$Builder;-><init>()V

    .line 128
    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v22

    .line 129
    invoke-virtual/range {v22 .. v22}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v16

    .line 131
    .local v16, "req":Lokhttp3/Request;
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v22

    sget-object v23, Lcom/vk/core/network/Network$ClientType;->CLIENT_VIGO:Lcom/vk/core/network/Network$ClientType;

    invoke-virtual/range {v22 .. v23}, Lcom/vk/core/network/Network;->getClient(Lcom/vk/core/network/Network$ClientType;)Lokhttp3/OkHttpClient;

    move-result-object v5

    .line 133
    .local v5, "client":Lokhttp3/OkHttpClient;
    new-instance v17, Lorg/json/JSONObject;

    move-object/from16 v0, v16

    invoke-virtual {v5, v0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v22

    invoke-interface/range {v22 .. v22}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 135
    .local v17, "response":Lorg/json/JSONObject;
    if-eqz p1, :cond_f

    .line 136
    const-string/jumbo v22, "supported"

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v22

    move-object/from16 v0, p1

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 139
    :cond_f
    const-string/jumbo v22, "load_info"

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v22

    const-string/jumbo v23, "quality"

    invoke-virtual/range {v22 .. v23}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v18

    .line 140
    .local v18, "result":I
    const/16 v22, 0x2

    move/from16 v0, v18

    move/from16 v1, v22

    if-le v0, v1, :cond_10

    const/16 v22, 0x6

    move/from16 v0, v18

    move/from16 v1, v22

    if-le v0, v1, :cond_0

    .line 141
    :cond_10
    new-instance v22, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v23, "Unable to find best quality via Vigo"

    invoke-direct/range {v22 .. v23}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v22
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    .line 153
    .end local v3    # "account":Lcom/vkontakte/android/auth/VKAccount;
    .end local v4    # "builder":Landroid/net/Uri$Builder;
    .end local v5    # "client":Lokhttp3/OkHttpClient;
    .end local v16    # "req":Lokhttp3/Request;
    .end local v17    # "response":Lorg/json/JSONObject;
    .end local v18    # "result":I
    .end local v20    # "url":Ljava/lang/String;
    .end local v21    # "vigo":Lcom/vkontakte/android/media/Vigo;
    .restart local v19    # "t":Ljava/lang/Throwable;
    :cond_11
    if-nez v15, :cond_12

    const/4 v8, 0x5

    goto/16 :goto_1

    :cond_12
    if-nez v14, :cond_13

    const/4 v8, 0x4

    goto/16 :goto_1

    :cond_13
    if-nez v13, :cond_14

    const/4 v8, 0x3

    goto/16 :goto_1

    :cond_14
    const/4 v8, 0x2

    goto/16 :goto_1

    .line 159
    .restart local v8    # "maxVideoSupportedQuality":I
    :cond_15
    if-nez v13, :cond_16

    const/4 v10, 0x3

    goto/16 :goto_2

    :cond_16
    if-nez v14, :cond_17

    const/4 v10, 0x4

    goto/16 :goto_2

    :cond_17
    if-nez v15, :cond_18

    const/4 v10, 0x5

    goto/16 :goto_2

    :cond_18
    const/4 v10, 0x6

    goto/16 :goto_2

    .restart local v10    # "minVideoSupportedQuality":I
    :cond_19
    move v6, v7

    .line 165
    goto/16 :goto_3
.end method

.method private static getQualityByUserOrNetwork(II)I
    .locals 8
    .param p0, "maxAllowedQuality"    # I
    .param p1, "minAllowedQuality"    # I

    .prologue
    const/4 v7, -0x1

    .line 217
    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->getNetworkType()Ljava/lang/String;

    move-result-object v0

    .line 218
    .local v0, "netType":Ljava/lang/String;
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "video_quality_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    .line 219
    .local v3, "usersChoice":I
    if-eq v3, v7, :cond_0

    .line 220
    add-int/lit8 v1, v3, 0x2

    .line 234
    .local v1, "quality":I
    :goto_0
    if-ge v1, p0, :cond_6

    move v2, v1

    .line 236
    .local v2, "result":I
    :goto_1
    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    move-result v4

    return v4

    .line 222
    .end local v1    # "quality":I
    .end local v2    # "result":I
    :cond_0
    const-string/jumbo v4, "edge"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 223
    const/4 v1, 0x2

    .restart local v1    # "quality":I
    goto :goto_0

    .line 224
    .end local v1    # "quality":I
    :cond_1
    const-string/jumbo v4, "3g"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 225
    const/4 v1, 0x4

    .restart local v1    # "quality":I
    goto :goto_0

    .line 226
    .end local v1    # "quality":I
    :cond_2
    const-string/jumbo v4, "wifi"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    const-string/jumbo v4, "ethernet"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 227
    :cond_3
    const/4 v1, 0x6

    .restart local v1    # "quality":I
    goto :goto_0

    .line 228
    .end local v1    # "quality":I
    :cond_4
    const-string/jumbo v4, "lte"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 229
    const/4 v1, 0x5

    .restart local v1    # "quality":I
    goto :goto_0

    .line 231
    .end local v1    # "quality":I
    :cond_5
    const/4 v1, 0x3

    .restart local v1    # "quality":I
    goto :goto_0

    :cond_6
    move v2, p0

    .line 234
    goto :goto_1
.end method

.method public static getUrl(Lcom/vkontakte/android/api/VideoFile;I)Ljava/lang/String;
    .locals 1
    .param p0, "file"    # Lcom/vkontakte/android/api/VideoFile;
    .param p1, "quality"    # I

    .prologue
    .line 178
    packed-switch p1, :pswitch_data_0

    .line 193
    :pswitch_0
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 180
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->urlHls:Ljava/lang/String;

    goto :goto_0

    .line 182
    :pswitch_2
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->url240:Ljava/lang/String;

    goto :goto_0

    .line 184
    :pswitch_3
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->url360:Ljava/lang/String;

    goto :goto_0

    .line 186
    :pswitch_4
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->url480:Ljava/lang/String;

    goto :goto_0

    .line 188
    :pswitch_5
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->url720:Ljava/lang/String;

    goto :goto_0

    .line 190
    :pswitch_6
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->url1080:Ljava/lang/String;

    goto :goto_0

    .line 178
    nop

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public static saveUsersChoice(ILjava/lang/String;)Z
    .locals 3
    .param p0, "quality"    # I
    .param p1, "netType"    # Ljava/lang/String;

    .prologue
    .line 58
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "video_quality_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    add-int/lit8 v2, p0, -0x2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    return v0
.end method
