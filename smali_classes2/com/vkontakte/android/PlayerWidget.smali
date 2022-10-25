.class public Lcom/vkontakte/android/PlayerWidget;
.super Landroid/appwidget/AppWidgetProvider;
.source "PlayerWidget.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Landroid/appwidget/AppWidgetProvider;-><init>()V

    return-void
.end method

.method public static notAvailable(Landroid/widget/RemoteViews;)V
    .locals 2
    .param p0, "remoteViews"    # Landroid/widget/RemoteViews;

    .prologue
    .line 129
    const v0, 0x7f1005b3

    const/16 v1, 0x8

    invoke-virtual {p0, v0, v1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 130
    const v0, 0x7f1005b4

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 131
    return-void
.end method

.method public static onImageLoaded(Landroid/graphics/Bitmap;Landroid/widget/RemoteViews;)V
    .locals 12
    .param p0, "cover"    # Landroid/graphics/Bitmap;
    .param p1, "remoteViews"    # Landroid/widget/RemoteViews;

    .prologue
    const v11, 0x7f1005b3

    const/high16 v6, 0x42900000    # 72.0f

    const/high16 v10, 0x40000000    # 2.0f

    const/4 v9, 0x0

    .line 114
    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v5, v6, v7}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 115
    .local v1, "cv":Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 116
    .local v0, "c":Landroid/graphics/Canvas;
    new-instance v3, Landroid/graphics/Paint;

    const/4 v5, 0x3

    invoke-direct {v3, v5}, Landroid/graphics/Paint;-><init>(I)V

    .line 117
    .local v3, "paint":Landroid/graphics/Paint;
    new-instance v4, Landroid/graphics/BitmapShader;

    sget-object v5, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v6, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v4, p0, v5, v6}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 118
    .local v4, "shader":Landroid/graphics/BitmapShader;
    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    .line 119
    .local v2, "matrix":Landroid/graphics/Matrix;
    new-instance v5, Landroid/graphics/RectF;

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    int-to-float v7, v7

    invoke-direct {v5, v9, v9, v6, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    new-instance v6, Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/Canvas;->getWidth()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v0}, Landroid/graphics/Canvas;->getHeight()I

    move-result v8

    int-to-float v8, v8

    invoke-direct {v6, v9, v9, v7, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    sget-object v7, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v2, v5, v6, v7}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 120
    invoke-virtual {v4, v2}, Landroid/graphics/BitmapShader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 121
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 122
    new-instance v5, Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/Canvas;->getWidth()I

    move-result v6

    const/high16 v7, 0x41200000    # 10.0f

    invoke-static {v7}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v7

    add-int/2addr v6, v7

    int-to-float v6, v6

    invoke-virtual {v0}, Landroid/graphics/Canvas;->getHeight()I

    move-result v7

    int-to-float v7, v7

    invoke-direct {v5, v9, v9, v6, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-static {v10}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    int-to-float v6, v6

    invoke-static {v10}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v0, v5, v6, v7, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 123
    invoke-virtual {p1, v11, v1}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    .line 124
    const/4 v5, 0x0

    invoke-virtual {p1, v11, v5}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 125
    const v5, 0x7f1005b4

    const/16 v6, 0x8

    invoke-virtual {p1, v5, v6}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 126
    return-void
.end method

.method private static pending(Landroid/content/Context;Landroid/content/Intent;)Landroid/app/PendingIntent;
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 37
    const/4 v0, 0x0

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {p0, v0, p1, v1}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method

.method public static update(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V
    .locals 15
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "awm"    # Landroid/appwidget/AppWidgetManager;
    .param p2, "appWidgetIds"    # [I

    .prologue
    .line 46
    new-instance v8, Landroid/widget/RemoteViews;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v11

    const v12, 0x7f03023a

    invoke-direct {v8, v11, v12}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 47
    .local v8, "remoteViews":Landroid/widget/RemoteViews;
    sget v11, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v12, 0x10

    if-ge v11, v12, :cond_5

    const/4 v11, 0x0

    new-instance v12, Landroid/content/Intent;

    invoke-direct {v12}, Landroid/content/Intent;-><init>()V

    const/high16 v13, 0x10000000

    .line 48
    invoke-static {p0, v11, v12, v13}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v5

    .line 50
    .local v5, "nullIntent":Landroid/app/PendingIntent;
    :goto_0
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrackInfo()Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v9

    .line 52
    .local v9, "ti":Lcom/vkontakte/android/audio/player/TrackInfo;
    const v12, 0x7f1005ba

    if-eqz v9, :cond_0

    const/4 v11, 0x1

    new-array v11, v11, [Lcom/vkontakte/android/audio/PlayerAction;

    const/4 v13, 0x0

    sget-object v14, Lcom/vkontakte/android/audio/PlayerAction;->playPause:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v14, v11, v13

    .line 53
    invoke-virtual {v9, v11}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 54
    :cond_0
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioFacade;->getToggleResumePauseIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v11

    invoke-static {p0, v11}, Lcom/vkontakte/android/PlayerWidget;->pending(Landroid/content/Context;Landroid/content/Intent;)Landroid/app/PendingIntent;

    move-result-object v11

    .line 52
    :goto_1
    invoke-virtual {v8, v12, v11}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 56
    const v12, 0x7f1005bb

    if-eqz v9, :cond_1

    const/4 v11, 0x2

    new-array v11, v11, [Lcom/vkontakte/android/audio/PlayerAction;

    const/4 v13, 0x0

    sget-object v14, Lcom/vkontakte/android/audio/PlayerAction;->changeTrack:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v14, v11, v13

    const/4 v13, 0x1

    sget-object v14, Lcom/vkontakte/android/audio/PlayerAction;->skipAd:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v14, v11, v13

    .line 57
    invoke-virtual {v9, v11}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 58
    :cond_1
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioFacade;->getNextIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v11

    invoke-static {p0, v11}, Lcom/vkontakte/android/PlayerWidget;->pending(Landroid/content/Context;Landroid/content/Intent;)Landroid/app/PendingIntent;

    move-result-object v11

    .line 56
    :goto_2
    invoke-virtual {v8, v12, v11}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 60
    const v11, 0x7f1005b9

    if-eqz v9, :cond_2

    const/4 v12, 0x1

    new-array v12, v12, [Lcom/vkontakte/android/audio/PlayerAction;

    const/4 v13, 0x0

    sget-object v14, Lcom/vkontakte/android/audio/PlayerAction;->changeTrack:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v14, v12, v13

    .line 61
    invoke-virtual {v9, v12}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 62
    :cond_2
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioFacade;->getPrevIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v12

    invoke-static {p0, v12}, Lcom/vkontakte/android/PlayerWidget;->pending(Landroid/content/Context;Landroid/content/Intent;)Landroid/app/PendingIntent;

    move-result-object v5

    .line 60
    .end local v5    # "nullIntent":Landroid/app/PendingIntent;
    :cond_3
    invoke-virtual {v8, v11, v5}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 65
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioFacade;->getShowPlayerIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v11

    invoke-static {p0, v11}, Lcom/vkontakte/android/PlayerWidget;->pending(Landroid/content/Context;Landroid/content/Intent;)Landroid/app/PendingIntent;

    move-result-object v7

    .line 67
    .local v7, "pendingShowPlayer":Landroid/app/PendingIntent;
    new-instance v11, Lcom/vk/music/fragment/MusicFragment$Builder;

    invoke-direct {v11}, Lcom/vk/music/fragment/MusicFragment$Builder;-><init>()V

    invoke-virtual {v11, p0}, Lcom/vk/music/fragment/MusicFragment$Builder;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v6

    .line 68
    .local v6, "openApp":Landroid/content/Intent;
    const-string/jumbo v11, "fdsafsafdsafs"

    invoke-virtual {v6, v11}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 69
    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static {p0, v11, v6, v12}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 71
    .local v1, "appPending":Landroid/app/PendingIntent;
    if-nez v9, :cond_8

    const/4 v3, 0x0

    .line 72
    .local v3, "f":Lcom/vkontakte/android/audio/MusicTrack;
    :goto_3
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v11

    sget-object v12, Lcom/vkontakte/android/audio/player/PlayerState;->IDLE:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq v11, v12, :cond_d

    if-eqz v3, :cond_d

    .line 73
    const v11, 0x7f1005b7

    invoke-virtual {v8, v11, v7}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 74
    const v12, 0x7f1005b7

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTitle()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 75
    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/TrackInfo;->getSubTitle()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_9

    const-string/jumbo v11, ""

    :goto_4
    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 74
    invoke-virtual {v8, v12, v11}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 77
    const/16 v11, 0xaa

    invoke-virtual {v3, v11}, Lcom/vkontakte/android/audio/MusicTrack;->getThumbUrl(I)Ljava/lang/String;

    move-result-object v10

    .line 79
    .local v10, "url":Ljava/lang/String;
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_a

    .line 80
    invoke-static {v8}, Lcom/vkontakte/android/PlayerWidget;->notAvailable(Landroid/widget/RemoteViews;)V

    .line 90
    :goto_5
    const v12, 0x7f1005ba

    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v11

    invoke-virtual {v11}, Lcom/vkontakte/android/audio/player/PlayerState;->isPlayState()Z

    move-result v11

    if-eqz v11, :cond_c

    const v11, 0x7f02022f

    :goto_6
    invoke-virtual {v8, v12, v11}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 91
    const v11, 0x7f1005b8

    const/4 v12, 0x0

    invoke-virtual {v8, v11, v12}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 92
    const v11, 0x7f1005b7

    const/4 v12, 0x0

    invoke-virtual {v8, v11, v12}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 93
    const v11, 0x7f1005b6

    const/16 v12, 0x8

    invoke-virtual {v8, v11, v12}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 104
    .end local v10    # "url":Ljava/lang/String;
    :goto_7
    if-nez p2, :cond_e

    .line 105
    new-instance v11, Landroid/content/ComponentName;

    const-class v12, Lcom/vkontakte/android/PlayerWidget;

    invoke-direct {v11, p0, v12}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    move-object/from16 v0, p1

    invoke-virtual {v0, v11, v8}, Landroid/appwidget/AppWidgetManager;->updateAppWidget(Landroid/content/ComponentName;Landroid/widget/RemoteViews;)V

    .line 111
    :cond_4
    return-void

    .line 48
    .end local v1    # "appPending":Landroid/app/PendingIntent;
    .end local v3    # "f":Lcom/vkontakte/android/audio/MusicTrack;
    .end local v6    # "openApp":Landroid/content/Intent;
    .end local v7    # "pendingShowPlayer":Landroid/app/PendingIntent;
    .end local v9    # "ti":Lcom/vkontakte/android/audio/player/TrackInfo;
    :cond_5
    const/4 v5, 0x0

    goto/16 :goto_0

    .restart local v5    # "nullIntent":Landroid/app/PendingIntent;
    .restart local v9    # "ti":Lcom/vkontakte/android/audio/player/TrackInfo;
    :cond_6
    move-object v11, v5

    .line 54
    goto/16 :goto_1

    :cond_7
    move-object v11, v5

    .line 58
    goto/16 :goto_2

    .line 71
    .end local v5    # "nullIntent":Landroid/app/PendingIntent;
    .restart local v1    # "appPending":Landroid/app/PendingIntent;
    .restart local v6    # "openApp":Landroid/content/Intent;
    .restart local v7    # "pendingShowPlayer":Landroid/app/PendingIntent;
    :cond_8
    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v3

    goto/16 :goto_3

    .line 75
    .restart local v3    # "f":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_9
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, " - "

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/TrackInfo;->getSubTitle()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    goto :goto_4

    .line 82
    .restart local v10    # "url":Ljava/lang/String;
    :cond_a
    invoke-static {v10}, Lcom/vk/imageloader/VKImageLoader;->getBitmapFromMemoryCache(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 83
    .local v2, "bitmap":Landroid/graphics/Bitmap;
    if-nez v2, :cond_b

    .line 84
    invoke-static {v8}, Lcom/vkontakte/android/PlayerWidget;->notAvailable(Landroid/widget/RemoteViews;)V

    goto :goto_5

    .line 86
    :cond_b
    invoke-static {v2, v8}, Lcom/vkontakte/android/PlayerWidget;->onImageLoaded(Landroid/graphics/Bitmap;Landroid/widget/RemoteViews;)V

    goto :goto_5

    .line 90
    .end local v2    # "bitmap":Landroid/graphics/Bitmap;
    :cond_c
    const v11, 0x7f02023e

    goto :goto_6

    .line 95
    .end local v10    # "url":Ljava/lang/String;
    :cond_d
    const v11, 0x7f1005b7

    const/16 v12, 0x8

    invoke-virtual {v8, v11, v12}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 96
    const v11, 0x7f1005b6

    const/4 v12, 0x0

    invoke-virtual {v8, v11, v12}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 97
    const v11, 0x7f1005b8

    const/16 v12, 0x8

    invoke-virtual {v8, v11, v12}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 98
    const v11, 0x7f1005b3

    const/16 v12, 0x8

    invoke-virtual {v8, v11, v12}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 99
    const v11, 0x7f1005b4

    const/4 v12, 0x0

    invoke-virtual {v8, v11, v12}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 100
    const v11, 0x7f1005b1

    const v12, 0x7f0203d2

    invoke-virtual {v8, v11, v12}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 101
    const v11, 0x7f1005b6

    invoke-virtual {v8, v11, v1}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    goto :goto_7

    .line 107
    :cond_e
    move-object/from16 v0, p2

    array-length v12, v0

    const/4 v11, 0x0

    :goto_8
    if-ge v11, v12, :cond_4

    aget v4, p2, v11

    .line 108
    .local v4, "id":I
    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v8}, Landroid/appwidget/AppWidgetManager;->updateAppWidget(ILandroid/widget/RemoteViews;)V

    .line 107
    add-int/lit8 v11, v11, 0x1

    goto :goto_8
.end method


# virtual methods
.method public onUpdate(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "appWidgetManager"    # Landroid/appwidget/AppWidgetManager;
    .param p3, "appWidgetIds"    # [I

    .prologue
    .line 42
    invoke-static {p1, p2, p3}, Lcom/vkontakte/android/PlayerWidget;->update(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V

    .line 43
    return-void
.end method
