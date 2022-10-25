.class public Lcom/vkontakte/android/audio/MusicApp;
.super Ljava/lang/Object;
.source "MusicApp.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/MusicApp$UpdateBroadcastSender;
    }
.end annotation


# static fields
.field private static statsHandler:Landroid/os/Handler;

.field private static updateBroadcastSender:Lcom/vkontakte/android/audio/MusicApp$UpdateBroadcastSender;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 203
    sput-object v0, Lcom/vkontakte/android/audio/MusicApp;->statsHandler:Landroid/os/Handler;

    .line 204
    sput-object v0, Lcom/vkontakte/android/audio/MusicApp;->updateBroadcastSender:Lcom/vkontakte/android/audio/MusicApp$UpdateBroadcastSender;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createNotification(Landroid/content/Context;Lcom/vkontakte/android/audio/player/Player;Landroid/graphics/Bitmap;)Landroid/app/Notification;
    .locals 17
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "player"    # Lcom/vkontakte/android/audio/player/Player;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "cover"    # Landroid/graphics/Bitmap;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 108
    new-instance v14, Landroid/app/Notification$Builder;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 109
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/audio/player/Player;->getState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v13

    invoke-virtual {v13}, Lcom/vkontakte/android/audio/player/PlayerState;->isPlayState()Z

    move-result v13

    if-eqz v13, :cond_7

    const v13, 0x7f02029f

    .line 108
    :goto_0
    invoke-virtual {v14, v13}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v13

    .line 111
    invoke-virtual {v13}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v3

    .line 112
    .local v3, "notification":Landroid/app/Notification;
    iget v13, v3, Landroid/app/Notification;->flags:I

    or-int/lit8 v13, v13, 0x22

    iput v13, v3, Landroid/app/Notification;->flags:I

    .line 113
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/audio/AudioFacade;->getShowPlayerIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-static {v0, v13}, Lcom/vkontakte/android/audio/MusicApp;->pending(Landroid/content/Context;Landroid/content/Intent;)Landroid/app/PendingIntent;

    move-result-object v13

    iput-object v13, v3, Landroid/app/Notification;->contentIntent:Landroid/app/PendingIntent;

    .line 114
    const/4 v13, 0x2

    iput v13, v3, Landroid/app/Notification;->priority:I

    .line 115
    sget v13, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v14, 0x15

    if-lt v13, v14, :cond_0

    .line 116
    const/4 v13, 0x1

    iput v13, v3, Landroid/app/Notification;->visibility:I

    .line 119
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/audio/player/Player;->getTrackInfo()Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v10

    .line 123
    .local v10, "trackInfo":Lcom/vkontakte/android/audio/player/TrackInfo;
    sget v13, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v14, 0x10

    if-ge v13, v14, :cond_8

    const/4 v13, 0x0

    new-instance v14, Landroid/content/Intent;

    invoke-direct {v14}, Landroid/content/Intent;-><init>()V

    const/high16 v15, 0x10000000

    .line 124
    move-object/from16 v0, p0

    invoke-static {v0, v13, v14, v15}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    .line 126
    .local v4, "nullIntent":Landroid/app/PendingIntent;
    :goto_1
    if-eqz v10, :cond_1

    const/4 v13, 0x1

    new-array v13, v13, [Lcom/vkontakte/android/audio/PlayerAction;

    const/4 v14, 0x0

    sget-object v15, Lcom/vkontakte/android/audio/PlayerAction;->playPause:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v15, v13, v14

    invoke-virtual {v10, v13}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v13

    if-eqz v13, :cond_9

    .line 127
    :cond_1
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/audio/AudioFacade;->getToggleResumePauseIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-static {v0, v13}, Lcom/vkontakte/android/audio/MusicApp;->pending(Landroid/content/Context;Landroid/content/Intent;)Landroid/app/PendingIntent;

    move-result-object v6

    .line 128
    .local v6, "pendingPlaypause":Landroid/app/PendingIntent;
    :goto_2
    if-eqz v10, :cond_2

    const/4 v13, 0x2

    new-array v13, v13, [Lcom/vkontakte/android/audio/PlayerAction;

    const/4 v14, 0x0

    sget-object v15, Lcom/vkontakte/android/audio/PlayerAction;->changeTrack:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v15, v13, v14

    const/4 v14, 0x1

    sget-object v15, Lcom/vkontakte/android/audio/PlayerAction;->skipAd:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v15, v13, v14

    invoke-virtual {v10, v13}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v13

    if-eqz v13, :cond_a

    .line 129
    :cond_2
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/audio/AudioFacade;->getNextIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-static {v0, v13}, Lcom/vkontakte/android/audio/MusicApp;->pending(Landroid/content/Context;Landroid/content/Intent;)Landroid/app/PendingIntent;

    move-result-object v5

    .line 130
    .local v5, "pendingNext":Landroid/app/PendingIntent;
    :goto_3
    if-eqz v10, :cond_3

    const/4 v13, 0x1

    new-array v13, v13, [Lcom/vkontakte/android/audio/PlayerAction;

    const/4 v14, 0x0

    sget-object v15, Lcom/vkontakte/android/audio/PlayerAction;->changeTrack:Lcom/vkontakte/android/audio/PlayerAction;

    aput-object v15, v13, v14

    invoke-virtual {v10, v13}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z

    move-result v13

    if-eqz v13, :cond_b

    .line 131
    :cond_3
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/audio/AudioFacade;->getPrevIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-static {v0, v13}, Lcom/vkontakte/android/audio/MusicApp;->pending(Landroid/content/Context;Landroid/content/Intent;)Landroid/app/PendingIntent;

    move-result-object v7

    .line 132
    .local v7, "pendingPrev":Landroid/app/PendingIntent;
    :goto_4
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/audio/AudioFacade;->getStopIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-static {v0, v13}, Lcom/vkontakte/android/audio/MusicApp;->pending(Landroid/content/Context;Landroid/content/Intent;)Landroid/app/PendingIntent;

    move-result-object v8

    .line 134
    .local v8, "pendingStop":Landroid/app/PendingIntent;
    if-eqz v10, :cond_c

    invoke-virtual {v10}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasTrack()Z

    move-result v13

    if-eqz v13, :cond_c

    .line 135
    invoke-virtual {v10}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTitle()Ljava/lang/String;

    move-result-object v9

    .line 136
    .local v9, "title":Ljava/lang/String;
    invoke-virtual {v10}, Lcom/vkontakte/android/audio/player/TrackInfo;->getSubTitle()Ljava/lang/String;

    move-result-object v1

    .line 142
    .local v1, "artist":Ljava/lang/String;
    :goto_5
    new-instance v11, Landroid/widget/RemoteViews;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v13

    const v14, 0x7f03005d

    invoke-direct {v11, v13, v14}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 143
    .local v11, "views":Landroid/widget/RemoteViews;
    const v13, 0x7f100128

    invoke-virtual {v11, v13, v9}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 144
    const v13, 0x7f10000e

    invoke-virtual {v11, v13, v1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 145
    const v13, 0x7f10021b

    const v14, 0x7f02005a

    invoke-virtual {v11, v13, v14}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 146
    const v14, 0x7f10021c

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/audio/player/Player;->getState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v13

    invoke-virtual {v13}, Lcom/vkontakte/android/audio/player/PlayerState;->isPlayState()Z

    move-result v13

    if-eqz v13, :cond_d

    const v13, 0x7f02022e

    :goto_6
    invoke-virtual {v11, v14, v13}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 147
    const v13, 0x7f10021c

    invoke-virtual {v11, v13, v6}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 148
    const v14, 0x7f10021d

    const-string/jumbo v15, "setAlpha"

    if-ne v5, v4, :cond_e

    const/16 v13, 0x4c

    :goto_7
    invoke-virtual {v11, v14, v15, v13}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 149
    const v14, 0x7f10021d

    if-ne v5, v4, :cond_f

    const/4 v13, 0x4

    :goto_8
    invoke-virtual {v11, v14, v13}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 150
    const v13, 0x7f10021d

    invoke-virtual {v11, v13, v5}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 151
    const v13, 0x7f10021e

    invoke-virtual {v11, v13, v8}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 152
    const v14, 0x7f10021f

    const-string/jumbo v15, "setAlpha"

    if-ne v7, v4, :cond_10

    const/16 v13, 0x4c

    :goto_9
    invoke-virtual {v11, v14, v15, v13}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 153
    const v14, 0x7f10021f

    if-ne v7, v4, :cond_11

    const/4 v13, 0x4

    :goto_a
    invoke-virtual {v11, v14, v13}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 154
    const v13, 0x7f10021f

    invoke-virtual {v11, v13, v7}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 156
    const/4 v2, 0x0

    .line 157
    .local v2, "bgRes":I
    sget v13, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v14, 0x15

    if-ge v13, v14, :cond_12

    .line 158
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v13

    const-string/jumbo v14, "notification_bg"

    const-string/jumbo v15, "drawable"

    const-string/jumbo v16, "android"

    invoke-virtual/range {v13 .. v16}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 167
    :goto_b
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/audio/MusicApp;->isFlymeOrMIUI(Landroid/content/Context;)Z

    move-result v13

    if-eqz v13, :cond_14

    .line 168
    const v13, 0x7f10021a

    const-string/jumbo v14, "setBackgroundColor"

    const/4 v15, -0x1

    invoke-virtual {v11, v13, v14, v15}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 173
    :cond_4
    :goto_c
    iput-object v11, v3, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    .line 174
    new-instance v12, Landroid/widget/RemoteViews;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v13

    const v14, 0x7f03005e

    invoke-direct {v12, v13, v14}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 175
    .local v12, "xviews":Landroid/widget/RemoteViews;
    const v13, 0x7f100128

    invoke-virtual {v12, v13, v9}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 176
    const v13, 0x7f10000e

    invoke-virtual {v12, v13, v1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 177
    const v13, 0x7f10021b

    const v14, 0x7f02005a

    invoke-virtual {v12, v13, v14}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 178
    const v14, 0x7f10021c

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/audio/player/Player;->getState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v13

    invoke-virtual {v13}, Lcom/vkontakte/android/audio/player/PlayerState;->isPlayState()Z

    move-result v13

    if-eqz v13, :cond_15

    const v13, 0x7f02022e

    :goto_d
    invoke-virtual {v12, v14, v13}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 179
    const v13, 0x7f10021c

    invoke-virtual {v12, v13, v6}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 180
    const v14, 0x7f10021d

    const-string/jumbo v15, "setAlpha"

    if-ne v5, v4, :cond_16

    const/16 v13, 0x4c

    :goto_e
    invoke-virtual {v12, v14, v15, v13}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 181
    const v13, 0x7f10021d

    invoke-virtual {v12, v13, v5}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 182
    const v14, 0x7f10021f

    const-string/jumbo v15, "setAlpha"

    if-ne v7, v4, :cond_17

    const/16 v13, 0x4c

    :goto_f
    invoke-virtual {v12, v14, v15, v13}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 183
    const v13, 0x7f10021f

    invoke-virtual {v12, v13, v7}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 184
    const v13, 0x7f10021e

    invoke-virtual {v12, v13, v8}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 185
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/audio/MusicApp;->isFlymeOrMIUI(Landroid/content/Context;)Z

    move-result v13

    if-eqz v13, :cond_18

    .line 186
    const v13, 0x7f10021a

    const-string/jumbo v14, "setBackgroundColor"

    const/4 v15, -0x1

    invoke-virtual {v12, v13, v14, v15}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 190
    :cond_5
    :goto_10
    iput-object v12, v3, Landroid/app/Notification;->bigContentView:Landroid/widget/RemoteViews;

    .line 192
    if-eqz p2, :cond_6

    .line 193
    const/high16 v13, 0x43020000    # 130.0f

    invoke-static {v13}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v13

    const/high16 v14, 0x43020000    # 130.0f

    invoke-static {v14}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v14

    const/4 v15, 0x1

    move-object/from16 v0, p2

    invoke-static {v0, v13, v14, v15}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p2

    .line 194
    iget-object v13, v3, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    const v14, 0x7f10021b

    move-object/from16 v0, p2

    invoke-virtual {v13, v14, v0}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    .line 195
    iget-object v13, v3, Landroid/app/Notification;->bigContentView:Landroid/widget/RemoteViews;

    const v14, 0x7f10021b

    move-object/from16 v0, p2

    invoke-virtual {v13, v14, v0}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    .line 198
    :cond_6
    return-object v3

    .line 109
    .end local v1    # "artist":Ljava/lang/String;
    .end local v2    # "bgRes":I
    .end local v3    # "notification":Landroid/app/Notification;
    .end local v4    # "nullIntent":Landroid/app/PendingIntent;
    .end local v5    # "pendingNext":Landroid/app/PendingIntent;
    .end local v6    # "pendingPlaypause":Landroid/app/PendingIntent;
    .end local v7    # "pendingPrev":Landroid/app/PendingIntent;
    .end local v8    # "pendingStop":Landroid/app/PendingIntent;
    .end local v9    # "title":Ljava/lang/String;
    .end local v10    # "trackInfo":Lcom/vkontakte/android/audio/player/TrackInfo;
    .end local v11    # "views":Landroid/widget/RemoteViews;
    .end local v12    # "xviews":Landroid/widget/RemoteViews;
    :cond_7
    const v13, 0x7f02029e

    goto/16 :goto_0

    .line 124
    .restart local v3    # "notification":Landroid/app/Notification;
    .restart local v10    # "trackInfo":Lcom/vkontakte/android/audio/player/TrackInfo;
    :cond_8
    const/4 v4, 0x0

    goto/16 :goto_1

    .restart local v4    # "nullIntent":Landroid/app/PendingIntent;
    :cond_9
    move-object v6, v4

    .line 127
    goto/16 :goto_2

    .restart local v6    # "pendingPlaypause":Landroid/app/PendingIntent;
    :cond_a
    move-object v5, v4

    .line 129
    goto/16 :goto_3

    .restart local v5    # "pendingNext":Landroid/app/PendingIntent;
    :cond_b
    move-object v7, v4

    .line 131
    goto/16 :goto_4

    .line 138
    .restart local v7    # "pendingPrev":Landroid/app/PendingIntent;
    .restart local v8    # "pendingStop":Landroid/app/PendingIntent;
    :cond_c
    const/4 v9, 0x0

    .line 139
    .restart local v9    # "title":Ljava/lang/String;
    const/4 v1, 0x0

    .restart local v1    # "artist":Ljava/lang/String;
    goto/16 :goto_5

    .line 146
    .restart local v11    # "views":Landroid/widget/RemoteViews;
    :cond_d
    const v13, 0x7f02023d

    goto/16 :goto_6

    .line 148
    :cond_e
    const/16 v13, 0xff

    goto/16 :goto_7

    .line 149
    :cond_f
    const/4 v13, 0x0

    goto/16 :goto_8

    .line 152
    :cond_10
    const/16 v13, 0xff

    goto/16 :goto_9

    .line 153
    :cond_11
    const/4 v13, 0x0

    goto/16 :goto_a

    .line 160
    .restart local v2    # "bgRes":I
    :cond_12
    iput-object v8, v3, Landroid/app/Notification;->deleteIntent:Landroid/app/PendingIntent;

    .line 161
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/audio/player/Player;->getState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v13

    invoke-virtual {v13}, Lcom/vkontakte/android/audio/player/PlayerState;->isPlayState()Z

    move-result v13

    if-eqz v13, :cond_13

    .line 162
    iget v13, v3, Landroid/app/Notification;->flags:I

    or-int/lit8 v13, v13, 0x22

    iput v13, v3, Landroid/app/Notification;->flags:I

    goto/16 :goto_b

    .line 164
    :cond_13
    iget v13, v3, Landroid/app/Notification;->flags:I

    and-int/lit8 v13, v13, -0x23

    iput v13, v3, Landroid/app/Notification;->flags:I

    goto/16 :goto_b

    .line 169
    :cond_14
    if-eqz v2, :cond_4

    .line 170
    const v13, 0x7f10021a

    const-string/jumbo v14, "setBackgroundResource"

    invoke-virtual {v11, v13, v14, v2}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    goto/16 :goto_c

    .line 178
    .restart local v12    # "xviews":Landroid/widget/RemoteViews;
    :cond_15
    const v13, 0x7f02023d

    goto/16 :goto_d

    .line 180
    :cond_16
    const/16 v13, 0xff

    goto/16 :goto_e

    .line 182
    :cond_17
    const/16 v13, 0xff

    goto/16 :goto_f

    .line 187
    :cond_18
    if-eqz v2, :cond_5

    .line 188
    const v13, 0x7f10021a

    const-string/jumbo v14, "setBackgroundResource"

    invoke-virtual {v12, v13, v14, v2}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    goto/16 :goto_10
.end method

.method public static getActualLink(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "mid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 53
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/MusicApp;->getActualLink(Ljava/lang/String;Lcom/vkontakte/android/audio/MusicTrack;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getActualLink(Ljava/lang/String;Lcom/vkontakte/android/audio/MusicTrack;)Ljava/lang/String;
    .locals 6
    .param p0, "mid"    # Ljava/lang/String;
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 57
    const/4 v2, 0x2

    new-array v0, v2, [Ljava/lang/Object;

    aput-object v3, v0, v5

    aput-object v3, v0, v4

    .line 58
    .local v0, "result":[Ljava/lang/Object;
    new-instance v2, Lcom/vkontakte/android/api/audio/AudioGetUrlForPlay;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/api/audio/AudioGetUrlForPlay;-><init>(Ljava/lang/String;)V

    new-instance v3, Lcom/vkontakte/android/audio/MusicApp$1;

    invoke-direct {v3, v0}, Lcom/vkontakte/android/audio/MusicApp$1;-><init>([Ljava/lang/Object;)V

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/audio/AudioGetUrlForPlay;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 68
    invoke-virtual {v2}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    .line 69
    aget-object v2, v0, v4

    instance-of v2, v2, Ljava/lang/Exception;

    if-eqz v2, :cond_0

    .line 70
    aget-object v2, v0, v4

    check-cast v2, Ljava/lang/Exception;

    throw v2

    .line 72
    :cond_0
    aget-object v1, v0, v5

    check-cast v1, Lcom/vkontakte/android/audio/MusicTrack;

    .line 73
    .local v1, "track":Lcom/vkontakte/android/audio/MusicTrack;
    if-eqz p1, :cond_1

    .line 74
    invoke-virtual {v1}, Lcom/vkontakte/android/audio/MusicTrack;->getRestrictionType()I

    move-result v2

    invoke-virtual {p1, v2}, Lcom/vkontakte/android/audio/MusicTrack;->setRestrictionType(I)V

    .line 76
    :cond_1
    iget-object v2, v1, Lcom/vkontakte/android/audio/MusicTrack;->url:Ljava/lang/String;

    return-object v2
.end method

.method public static getAudioPlayerActivityClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 49
    const-class v0, Lcom/vkontakte/android/AudioPlayerActivity;

    return-object v0
.end method

.method public static getInstance()Landroid/content/Context;
    .locals 1

    .prologue
    .line 41
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    return-object v0
.end method

.method public static getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    .prologue
    .line 45
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/vkontakte/android/data/db/Database;->getInst(Landroid/content/Context;)Lcom/vkontakte/android/data/db/Database;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/db/Database;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method private static isFlymeOrMIUI(Landroid/content/Context;)Z
    .locals 6
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 95
    new-instance v3, Ljava/io/File;

    const-string/jumbo v4, "/system/framework/flyme-framework.jar"

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 96
    invoke-static {p0}, Lcom/vkontakte/android/audio/MusicApp;->isNotificationColorLight(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 104
    :cond_0
    :goto_0
    return v1

    :cond_1
    move v1, v2

    .line 96
    goto :goto_0

    .line 99
    :cond_2
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const-string/jumbo v4, "com.miui.core"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 100
    .local v0, "info":Landroid/content/pm/PackageInfo;
    iget-object v3, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v3, v3, 0x1

    if-ne v3, v1, :cond_3

    invoke-static {p0}, Lcom/vkontakte/android/audio/MusicApp;->isNotificationColorLight(Landroid/content/Context;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-eqz v3, :cond_0

    :cond_3
    move v1, v2

    goto :goto_0

    .line 101
    .end local v0    # "info":Landroid/content/pm/PackageInfo;
    :catch_0
    move-exception v1

    move v1, v2

    .line 104
    goto :goto_0
.end method

.method private static isNotificationColorLight(Landroid/content/Context;)Z
    .locals 7
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 85
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x15

    if-ge v4, v5, :cond_1

    .line 91
    :cond_0
    :goto_0
    return v2

    .line 88
    :cond_1
    const v4, 0x1030203

    new-array v5, v2, [I

    const v6, 0x1010098

    aput v6, v5, v3

    invoke-virtual {p0, v4, v5}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 89
    .local v1, "ta":Landroid/content/res/TypedArray;
    invoke-virtual {v1, v3, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    .line 90
    .local v0, "color":I
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 91
    and-int/lit16 v4, v0, 0xff

    shr-int/lit8 v5, v0, 0x8

    and-int/lit16 v5, v5, 0xff

    add-int/2addr v4, v5

    shr-int/lit8 v5, v0, 0x10

    and-int/lit16 v5, v5, 0xff

    add-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x3

    const/16 v5, 0x80

    if-gt v4, v5, :cond_0

    move v2, v3

    goto :goto_0
.end method

.method private static pending(Landroid/content/Context;Landroid/content/Intent;)Landroid/app/PendingIntent;
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 81
    const/4 v0, 0x0

    const/high16 v1, 0x10000000

    invoke-static {p0, v0, p1, v1}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method

.method public static sendBroadcast(Lcom/vkontakte/android/audio/player/PlayerTrack;)V
    .locals 6
    .param p0, "file"    # Lcom/vkontakte/android/audio/player/PlayerTrack;

    .prologue
    .line 207
    const-class v1, Lcom/vkontakte/android/audio/MusicApp;

    monitor-enter v1

    .line 208
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/audio/MusicApp;->statsHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 209
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/vkontakte/android/audio/MusicApp;->statsHandler:Landroid/os/Handler;

    .line 212
    :cond_0
    sget-object v0, Lcom/vkontakte/android/audio/MusicApp;->updateBroadcastSender:Lcom/vkontakte/android/audio/MusicApp$UpdateBroadcastSender;

    if-eqz v0, :cond_1

    .line 213
    sget-object v0, Lcom/vkontakte/android/audio/MusicApp;->statsHandler:Landroid/os/Handler;

    sget-object v2, Lcom/vkontakte/android/audio/MusicApp;->updateBroadcastSender:Lcom/vkontakte/android/audio/MusicApp$UpdateBroadcastSender;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 215
    :cond_1
    new-instance v0, Lcom/vkontakte/android/audio/MusicApp$UpdateBroadcastSender;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/audio/MusicApp$UpdateBroadcastSender;-><init>(Lcom/vkontakte/android/audio/MusicTrack;)V

    sput-object v0, Lcom/vkontakte/android/audio/MusicApp;->updateBroadcastSender:Lcom/vkontakte/android/audio/MusicApp$UpdateBroadcastSender;

    .line 217
    sget-object v0, Lcom/vkontakte/android/audio/MusicApp;->statsHandler:Landroid/os/Handler;

    sget-object v2, Lcom/vkontakte/android/audio/MusicApp;->updateBroadcastSender:Lcom/vkontakte/android/audio/MusicApp$UpdateBroadcastSender;

    const-wide/16 v4, 0x7d0

    invoke-virtual {v0, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 218
    monitor-exit v1

    .line 219
    return-void

    .line 218
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
