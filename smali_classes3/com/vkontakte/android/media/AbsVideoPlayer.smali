.class public abstract Lcom/vkontakte/android/media/AbsVideoPlayer;
.super Ljava/lang/Object;
.source "AbsVideoPlayer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;,
        Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;,
        Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;
    }
.end annotation


# static fields
.field public static final ERROR_CANT_DECODE:I = 0x1

.field public static final ERROR_CONTENT_RESTRICTED:I = 0x6

.field public static final ERROR_LIVE_NOT_STARTED:I = 0x5

.field public static final ERROR_NETWORK:I = -0x1

.field public static final ERROR_NOT_PROCESSED:I = 0x4

.field public static final ERROR_NOT_SUPPORT:I = 0x7

.field public static final ERROR_NOT_SUPPORT_RESOLUTION:I = 0x8

.field public static final ERROR_SERVER:I = 0x2

.field public static final UNKNOWN_POSITION:I = -0x1


# instance fields
.field protected final context:Landroid/content/Context;

.field protected final handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

.field protected isAutoplay:Z

.field protected final mFile:Lcom/vkontakte/android/api/VideoFile;

.field private final rangeListener:Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;

.field protected renderView:Lcom/vkontakte/android/ui/widget/VideoTextureView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vkontakte/android/api/VideoFile;Ljava/lang/String;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "videoFile"    # Lcom/vkontakte/android/api/VideoFile;
    .param p3, "referrer"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    invoke-direct {v0}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/media/AbsVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    .line 37
    iput-object p1, p0, Lcom/vkontakte/android/media/AbsVideoPlayer;->context:Landroid/content/Context;

    .line 38
    iput-object p2, p0, Lcom/vkontakte/android/media/AbsVideoPlayer;->mFile:Lcom/vkontakte/android/api/VideoFile;

    .line 39
    invoke-virtual {p2}, Lcom/vkontakte/android/api/VideoFile;->isLive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 40
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/media/AbsVideoPlayer;->rangeListener:Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;

    .line 45
    :goto_0
    return-void

    .line 42
    :cond_0
    new-instance v0, Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;

    iget v1, p2, Lcom/vkontakte/android/api/VideoFile;->vid:I

    iget v2, p2, Lcom/vkontakte/android/api/VideoFile;->oid:I

    invoke-direct {v0, v1, v2, p3}, Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;-><init>(IILjava/lang/String;)V

    iput-object v0, p0, Lcom/vkontakte/android/media/AbsVideoPlayer;->rangeListener:Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;

    .line 43
    iget-object v0, p0, Lcom/vkontakte/android/media/AbsVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    iget-object v1, p0, Lcom/vkontakte/android/media/AbsVideoPlayer;->rangeListener:Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->setRangeListener(Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;)V

    goto :goto_0
.end method

.method public static getErrorString(I)I
    .locals 1
    .param p0, "error"    # I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 108
    const/4 v0, 0x0

    .line 109
    .local v0, "stringR":I
    packed-switch p0, :pswitch_data_0

    .line 136
    :goto_0
    :pswitch_0
    return v0

    .line 111
    :pswitch_1
    const v0, 0x7f080756

    .line 112
    goto :goto_0

    .line 114
    :pswitch_2
    const v0, 0x7f0801f5

    .line 115
    goto :goto_0

    .line 117
    :pswitch_3
    const v0, 0x7f080758

    .line 118
    goto :goto_0

    .line 120
    :pswitch_4
    const v0, 0x7f0801f8

    .line 121
    goto :goto_0

    .line 123
    :pswitch_5
    const v0, 0x7f080757

    .line 124
    goto :goto_0

    .line 126
    :pswitch_6
    const v0, 0x7f080761

    .line 127
    goto :goto_0

    .line 129
    :pswitch_7
    const v0, 0x7f08075d

    .line 130
    goto :goto_0

    .line 132
    :pswitch_8
    const v0, 0x7f08075e

    goto :goto_0

    .line 109
    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_3
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method


# virtual methods
.method public abstract createPlayer(IIII)V
.end method

.method public abstract getPosition()I
.end method

.method public abstract getQuality()I
.end method

.method public getView()Lcom/vkontakte/android/ui/widget/VideoTextureView;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vkontakte/android/media/AbsVideoPlayer;->renderView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    return-object v0
.end method

.method public isAutoplay()Z
    .locals 1

    .prologue
    .line 79
    iget-boolean v0, p0, Lcom/vkontakte/android/media/AbsVideoPlayer;->isAutoplay:Z

    return v0
.end method

.method public abstract isCompleted()Z
.end method

.method public abstract pause()V
.end method

.method public abstract play(Z)V
.end method

.method public abstract recallReady()V
.end method

.method public abstract replay(I)V
.end method

.method public abstract seek(I)V
.end method

.method sendViewedRanges()V
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/vkontakte/android/media/AbsVideoPlayer;->rangeListener:Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;

    if-eqz v0, :cond_0

    .line 74
    iget-object v0, p0, Lcom/vkontakte/android/media/AbsVideoPlayer;->rangeListener:Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;->sendViewedRanges()V

    .line 76
    :cond_0
    return-void
.end method

.method public abstract setDataSourceAndPrepare(Ljava/lang/String;IZZ)V
.end method

.method public setPlayerStateListener(Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;)V
    .locals 1
    .param p1, "l"    # Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/vkontakte/android/media/AbsVideoPlayer;->handler:Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/media/AbsVideoPlayer$UiHandler;->setListener(Lcom/vkontakte/android/media/AbsVideoPlayer$PlayerStateListener;)V

    .line 57
    return-void
.end method

.method public setView(Lcom/vkontakte/android/ui/widget/VideoTextureView;)V
    .locals 0
    .param p1, "view"    # Lcom/vkontakte/android/ui/widget/VideoTextureView;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 48
    iput-object p1, p0, Lcom/vkontakte/android/media/AbsVideoPlayer;->renderView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    .line 49
    return-void
.end method

.method public abstract setVolume(F)V
.end method

.method public abstract stopAndRelease()V
.end method

.method public userStartSeeking()V
    .locals 2

    .prologue
    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/media/AbsVideoPlayer;->rangeListener:Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;

    if-eqz v0, :cond_0

    .line 61
    iget-object v0, p0, Lcom/vkontakte/android/media/AbsVideoPlayer;->rangeListener:Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;->setSeeking(Z)V

    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/media/AbsVideoPlayer;->rangeListener:Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;->closeCurrentRange()V

    .line 64
    :cond_0
    return-void
.end method

.method public userStopSeeking()V
    .locals 2

    .prologue
    .line 67
    iget-object v0, p0, Lcom/vkontakte/android/media/AbsVideoPlayer;->rangeListener:Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;

    if-eqz v0, :cond_0

    .line 68
    iget-object v0, p0, Lcom/vkontakte/android/media/AbsVideoPlayer;->rangeListener:Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;->setSeeking(Z)V

    .line 70
    :cond_0
    return-void
.end method
