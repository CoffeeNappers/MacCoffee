.class public Lcom/vkontakte/android/PlayerBigWidget;
.super Landroid/appwidget/AppWidgetProvider;
.source "PlayerBigWidget.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/appwidget/AppWidgetProvider;-><init>()V

    return-void
.end method

.method private static getSelectedIcon(Landroid/content/Context;I)Landroid/graphics/Bitmap;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "res"    # I

    .prologue
    const/4 v6, 0x0

    .line 156
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 157
    .local v1, "d":Landroid/graphics/drawable/Drawable;
    new-instance v2, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    const v3, -0xa57034

    invoke-direct {v2, v1, v3}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 158
    .local v2, "rd":Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v4, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 159
    .local v0, "bmp":Landroid/graphics/Bitmap;
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    invoke-virtual {v2, v6, v6, v3, v4}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;->setBounds(IIII)V

    .line 160
    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 161
    return-object v0
.end method

.method public static notAvailable(Landroid/widget/RemoteViews;)V
    .locals 2
    .param p0, "rv"    # Landroid/widget/RemoteViews;

    .prologue
    .line 151
    const v0, 0x7f1005b3

    const/16 v1, 0x8

    invoke-virtual {p0, v0, v1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 152
    const v0, 0x7f1005b6

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 153
    return-void
.end method

.method public static onImageLoaded(Landroid/graphics/Bitmap;Landroid/widget/RemoteViews;)V
    .locals 2
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "rv"    # Landroid/widget/RemoteViews;

    .prologue
    const v1, 0x7f1005b3

    .line 145
    invoke-virtual {p1, v1, p0}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    .line 146
    const/4 v0, 0x0

    invoke-virtual {p1, v1, v0}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 147
    const v0, 0x7f1005b6

    const/16 v1, 0x8

    invoke-virtual {p1, v0, v1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 148
    return-void
.end method

.method private static pending(Landroid/content/Context;Landroid/content/Intent;)Landroid/app/PendingIntent;
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 35
    const/4 v0, 0x0

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {p0, v0, p1, v1}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method

.method public static update(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V
    .locals 13
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "awm"    # Landroid/appwidget/AppWidgetManager;
    .param p2, "appWidgetIds"    # [I

    .prologue
    .line 44
    new-instance v6, Landroid/widget/RemoteViews;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    const v10, 0x7f03023b

    invoke-direct {v6, v9, v10}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 46
    .local v6, "rv":Landroid/widget/RemoteViews;
    new-instance v9, Lcom/vk/music/fragment/MusicFragment$Builder;

    invoke-direct {v9}, Lcom/vk/music/fragment/MusicFragment$Builder;-><init>()V

    invoke-virtual {v9, p0}, Lcom/vk/music/fragment/MusicFragment$Builder;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v5

    .line 47
    .local v5, "openApp":Landroid/content/Intent;
    const-string/jumbo v9, "fdsafsafdsafs"

    invoke-virtual {v5, v9}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 48
    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static {p0, v9, v5, v10}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 49
    .local v0, "appPending":Landroid/app/PendingIntent;
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v10, 0x10

    if-ge v9, v10, :cond_3

    const/4 v9, 0x0

    new-instance v10, Landroid/content/Intent;

    invoke-direct {v10}, Landroid/content/Intent;-><init>()V

    const/high16 v11, 0x10000000

    .line 50
    invoke-static {p0, v9, v10, v11}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    .line 52
    .local v4, "nullIntent":Landroid/app/PendingIntent;
    :goto_0
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v9

    sget-object v10, Lcom/vkontakte/android/audio/player/PlayerState;->IDLE:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq v9, v10, :cond_e

    .line 53
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrackInfo()Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v7

    .line 54
    .local v7, "ti":Lcom/vkontakte/android/audio/player/TrackInfo;
    if-nez v7, :cond_4

    const/4 v2, 0x0

    .line 55
    .local v2, "f":Lcom/vkontakte/android/audio/MusicTrack;
    :goto_1
    if-eqz v2, :cond_1

    .line 56
    const v10, 0x7f1005ba

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/vkontakte/android/audio/PlayerAction;

    const/4 v11, 0x0

    sget-object v12, Lcom/vkontakte/android/audio/PlayerAction;->playPause:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v12, v9, v11

    .line 57
    invoke-virtual {v7, v9}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 58
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioFacade;->getToggleResumePauseIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v9

    invoke-static {p0, v9}, Lcom/vkontakte/android/PlayerBigWidget;->pending(Landroid/content/Context;Landroid/content/Intent;)Landroid/app/PendingIntent;

    move-result-object v9

    .line 56
    :goto_2
    invoke-virtual {v6, v10, v9}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 60
    const v10, 0x7f1005bb

    const/4 v9, 0x2

    new-array v9, v9, [Lcom/vkontakte/android/audio/PlayerAction;

    const/4 v11, 0x0

    sget-object v12, Lcom/vkontakte/android/audio/PlayerAction;->changeTrack:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v12, v9, v11

    const/4 v11, 0x1

    sget-object v12, Lcom/vkontakte/android/audio/PlayerAction;->skipAd:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v12, v9, v11

    .line 61
    invoke-virtual {v7, v9}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 62
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioFacade;->getNextIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v9

    invoke-static {p0, v9}, Lcom/vkontakte/android/PlayerBigWidget;->pending(Landroid/content/Context;Landroid/content/Intent;)Landroid/app/PendingIntent;

    move-result-object v9

    .line 60
    :goto_3
    invoke-virtual {v6, v10, v9}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 64
    const v10, 0x7f1005b9

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/vkontakte/android/audio/PlayerAction;

    const/4 v11, 0x0

    sget-object v12, Lcom/vkontakte/android/audio/PlayerAction;->changeTrack:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v12, v9, v11

    .line 65
    invoke-virtual {v7, v9}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 66
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioFacade;->getPrevIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v9

    invoke-static {p0, v9}, Lcom/vkontakte/android/PlayerBigWidget;->pending(Landroid/content/Context;Landroid/content/Intent;)Landroid/app/PendingIntent;

    move-result-object v9

    .line 64
    :goto_4
    invoke-virtual {v6, v10, v9}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 68
    const v10, 0x7f1005be

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/vkontakte/android/audio/PlayerAction;

    const/4 v11, 0x0

    sget-object v12, Lcom/vkontakte/android/audio/PlayerAction;->shuffle:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v12, v9, v11

    .line 69
    invoke-virtual {v7, v9}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 70
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioFacade;->getToggleShuffleIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v9

    invoke-static {p0, v9}, Lcom/vkontakte/android/PlayerBigWidget;->pending(Landroid/content/Context;Landroid/content/Intent;)Landroid/app/PendingIntent;

    move-result-object v9

    .line 68
    :goto_5
    invoke-virtual {v6, v10, v9}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 72
    const v9, 0x7f1005bf

    const/4 v10, 0x1

    new-array v10, v10, [Lcom/vkontakte/android/audio/PlayerAction;

    const/4 v11, 0x0

    sget-object v12, Lcom/vkontakte/android/audio/PlayerAction;->repeat:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v12, v10, v11

    .line 73
    invoke-virtual {v7, v10}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 74
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioFacade;->getToggleRepeatNoneOrTrackIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v10

    invoke-static {p0, v10}, Lcom/vkontakte/android/PlayerBigWidget;->pending(Landroid/content/Context;Landroid/content/Intent;)Landroid/app/PendingIntent;

    move-result-object v4

    .line 72
    .end local v4    # "nullIntent":Landroid/app/PendingIntent;
    :cond_0
    invoke-virtual {v6, v9, v4}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 76
    const v9, 0x7f1005c0

    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioFacade;->getShowPlayerIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v10

    invoke-static {p0, v10}, Lcom/vkontakte/android/PlayerBigWidget;->pending(Landroid/content/Context;Landroid/content/Intent;)Landroid/app/PendingIntent;

    move-result-object v10

    invoke-virtual {v6, v9, v10}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 77
    const v9, 0x7f1005b7

    invoke-virtual {v7}, Lcom/vkontakte/android/audio/player/TrackInfo;->getSubTitle()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v9, v10}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 78
    const v9, 0x7f1005c2

    invoke-virtual {v7}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTitle()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v9, v10}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 80
    invoke-static {}, Lcom/vkontakte/android/audio/utils/Utils;->getMaxCoverSize()I

    move-result v9

    invoke-virtual {v2, v9}, Lcom/vkontakte/android/audio/MusicTrack;->getThumbUrl(I)Ljava/lang/String;

    move-result-object v8

    .line 82
    .local v8, "url":Ljava/lang/String;
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 83
    invoke-static {v6}, Lcom/vkontakte/android/PlayerBigWidget;->notAvailable(Landroid/widget/RemoteViews;)V

    .line 93
    .end local v8    # "url":Ljava/lang/String;
    :cond_1
    :goto_6
    const v9, 0x7f1005b7

    const-string/jumbo v10, "setSingleLine"

    const/4 v11, 0x1

    invoke-virtual {v6, v9, v10, v11}, Landroid/widget/RemoteViews;->setBoolean(ILjava/lang/String;Z)V

    .line 94
    const v10, 0x7f1005ba

    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v9

    invoke-virtual {v9}, Lcom/vkontakte/android/audio/player/PlayerState;->isPlayState()Z

    move-result v9

    if-eqz v9, :cond_b

    const v9, 0x7f020230

    :goto_7
    invoke-virtual {v6, v10, v9}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 95
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->isShuffle()Z

    move-result v9

    if-eqz v9, :cond_c

    .line 96
    const v9, 0x7f1005be

    const v10, 0x7f02028f

    invoke-static {p0, v10}, Lcom/vkontakte/android/PlayerBigWidget;->getSelectedIcon(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object v10

    invoke-virtual {v6, v9, v10}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    .line 100
    :goto_8
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getLoopMode()Lcom/vkontakte/android/audio/player/LoopMode;

    move-result-object v9

    sget-object v10, Lcom/vkontakte/android/audio/player/LoopMode;->TRACK:Lcom/vkontakte/android/audio/player/LoopMode;

    if-ne v9, v10, :cond_d

    .line 101
    const v9, 0x7f1005bf

    const v10, 0x7f020271

    invoke-static {p0, v10}, Lcom/vkontakte/android/PlayerBigWidget;->getSelectedIcon(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object v10

    invoke-virtual {v6, v9, v10}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    .line 107
    :goto_9
    const v9, 0x7f1005c1

    const/16 v10, 0x8

    invoke-virtual {v6, v9, v10}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 109
    const v9, 0x7f1005ba

    const-string/jumbo v10, "setBackgroundResource"

    const v11, 0x7f02013e

    invoke-virtual {v6, v9, v10, v11}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 110
    const v9, 0x7f1005bb

    const-string/jumbo v10, "setBackgroundResource"

    const v11, 0x7f02013e

    invoke-virtual {v6, v9, v10, v11}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 111
    const v9, 0x7f1005b9

    const-string/jumbo v10, "setBackgroundResource"

    const v11, 0x7f02013e

    invoke-virtual {v6, v9, v10, v11}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 112
    const v9, 0x7f1005be

    const-string/jumbo v10, "setBackgroundResource"

    const v11, 0x7f020142

    invoke-virtual {v6, v9, v10, v11}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 113
    const v9, 0x7f1005bf

    const-string/jumbo v10, "setBackgroundResource"

    const v11, 0x7f020142

    invoke-virtual {v6, v9, v10, v11}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 135
    .end local v2    # "f":Lcom/vkontakte/android/audio/MusicTrack;
    .end local v7    # "ti":Lcom/vkontakte/android/audio/player/TrackInfo;
    :goto_a
    if-nez p2, :cond_f

    .line 136
    new-instance v9, Landroid/content/ComponentName;

    const-class v10, Lcom/vkontakte/android/PlayerBigWidget;

    invoke-direct {v9, p0, v10}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, v9, v6}, Landroid/appwidget/AppWidgetManager;->updateAppWidget(Landroid/content/ComponentName;Landroid/widget/RemoteViews;)V

    .line 142
    :cond_2
    return-void

    .line 50
    :cond_3
    const/4 v4, 0x0

    goto/16 :goto_0

    .line 54
    .restart local v4    # "nullIntent":Landroid/app/PendingIntent;
    .restart local v7    # "ti":Lcom/vkontakte/android/audio/player/TrackInfo;
    :cond_4
    invoke-virtual {v7}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v2

    goto/16 :goto_1

    .restart local v2    # "f":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_5
    move-object v9, v4

    .line 58
    goto/16 :goto_2

    :cond_6
    move-object v9, v4

    .line 62
    goto/16 :goto_3

    :cond_7
    move-object v9, v4

    .line 66
    goto/16 :goto_4

    :cond_8
    move-object v9, v4

    .line 70
    goto/16 :goto_5

    .line 85
    .end local v4    # "nullIntent":Landroid/app/PendingIntent;
    .restart local v8    # "url":Ljava/lang/String;
    :cond_9
    invoke-static {v8}, Lcom/vk/imageloader/VKImageLoader;->getBitmapFromMemoryCache(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 86
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    if-nez v1, :cond_a

    .line 87
    invoke-static {v6}, Lcom/vkontakte/android/PlayerBigWidget;->notAvailable(Landroid/widget/RemoteViews;)V

    goto/16 :goto_6

    .line 89
    :cond_a
    invoke-static {v1, v6}, Lcom/vkontakte/android/PlayerBigWidget;->onImageLoaded(Landroid/graphics/Bitmap;Landroid/widget/RemoteViews;)V

    goto/16 :goto_6

    .line 94
    .end local v1    # "bitmap":Landroid/graphics/Bitmap;
    .end local v8    # "url":Ljava/lang/String;
    :cond_b
    const v9, 0x7f02023f

    goto/16 :goto_7

    .line 98
    :cond_c
    const v9, 0x7f1005be

    const v10, 0x7f02028f

    invoke-virtual {v6, v9, v10}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    goto/16 :goto_8

    .line 103
    :cond_d
    const v9, 0x7f1005bf

    const v10, 0x7f020271

    invoke-virtual {v6, v9, v10}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    goto/16 :goto_9

    .line 116
    .end local v2    # "f":Lcom/vkontakte/android/audio/MusicTrack;
    .end local v7    # "ti":Lcom/vkontakte/android/audio/player/TrackInfo;
    .restart local v4    # "nullIntent":Landroid/app/PendingIntent;
    :cond_e
    const v9, 0x7f1005c0

    invoke-virtual {v6, v9, v0}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 117
    const v9, 0x7f1005c2

    const-string/jumbo v10, ""

    invoke-virtual {v6, v9, v10}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 118
    const v9, 0x7f1005b7

    const-string/jumbo v10, ""

    invoke-virtual {v6, v9, v10}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 119
    const v9, 0x7f1005ba

    const-string/jumbo v10, "setBackgroundColor"

    const/4 v11, 0x0

    invoke-virtual {v6, v9, v10, v11}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 120
    const v9, 0x7f1005bb

    const-string/jumbo v10, "setBackgroundColor"

    const/4 v11, 0x0

    invoke-virtual {v6, v9, v10, v11}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 121
    const v9, 0x7f1005b9

    const-string/jumbo v10, "setBackgroundColor"

    const/4 v11, 0x0

    invoke-virtual {v6, v9, v10, v11}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 122
    const v9, 0x7f1005be

    const-string/jumbo v10, "setBackgroundColor"

    const/4 v11, 0x0

    invoke-virtual {v6, v9, v10, v11}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 123
    const v9, 0x7f1005bf

    const-string/jumbo v10, "setBackgroundColor"

    const/4 v11, 0x0

    invoke-virtual {v6, v9, v10, v11}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 124
    const v9, 0x7f1005b3

    const/16 v10, 0x8

    invoke-virtual {v6, v9, v10}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 125
    const v9, 0x7f1005b6

    const/4 v10, 0x0

    invoke-virtual {v6, v9, v10}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 126
    const v9, 0x7f1005c1

    const/4 v10, 0x0

    invoke-virtual {v6, v9, v10}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 128
    const v9, 0x7f1005ba

    invoke-virtual {v6, v9, v4}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 129
    const v9, 0x7f1005bb

    invoke-virtual {v6, v9, v4}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 130
    const v9, 0x7f1005b9

    invoke-virtual {v6, v9, v4}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 131
    const v9, 0x7f1005be

    invoke-virtual {v6, v9, v4}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 132
    const v9, 0x7f1005bf

    invoke-virtual {v6, v9, v4}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    goto/16 :goto_a

    .line 138
    .end local v4    # "nullIntent":Landroid/app/PendingIntent;
    :cond_f
    array-length v10, p2

    const/4 v9, 0x0

    :goto_b
    if-ge v9, v10, :cond_2

    aget v3, p2, v9

    .line 139
    .local v3, "id":I
    invoke-virtual {p1, v3, v6}, Landroid/appwidget/AppWidgetManager;->updateAppWidget(ILandroid/widget/RemoteViews;)V

    .line 138
    add-int/lit8 v9, v9, 0x1

    goto :goto_b
.end method


# virtual methods
.method public onUpdate(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "appWidgetManager"    # Landroid/appwidget/AppWidgetManager;
    .param p3, "appWidgetIds"    # [I

    .prologue
    .line 40
    invoke-static {p1, p2, p3}, Lcom/vkontakte/android/PlayerBigWidget;->update(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V

    .line 41
    return-void
.end method
