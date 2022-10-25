.class Lcom/vkontakte/android/audio/player/Player$1;
.super Ljava/lang/Object;
.source "Player.java"

# interfaces
.implements Lcom/vkontakte/android/audio/player/TrackInfo$TrackInfoProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/audio/player/Player;-><init>(Lcom/vkontakte/android/audio/player/PlayerService;Lcom/vkontakte/android/audio/player/Player$OnLoadedListener;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/audio/player/Player;

.field final synthetic val$service:Lcom/vkontakte/android/audio/player/PlayerService;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/audio/player/Player;Lcom/vkontakte/android/audio/player/PlayerService;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/Player$1;->this$0:Lcom/vkontakte/android/audio/player/Player;

    iput-object p2, p0, Lcom/vkontakte/android/audio/player/Player$1;->val$service:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getActions(Lcom/vkontakte/android/audio/player/TrackInfo;I)[Lcom/vkontakte/android/audio/PlayerAction;
    .locals 3
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;
    .param p2, "currentIndex"    # I

    .prologue
    const/4 v1, 0x0

    .line 114
    packed-switch p2, :pswitch_data_0

    .line 120
    :cond_0
    :goto_0
    return-object v1

    .line 119
    :pswitch_0
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Player$1;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v2}, Lcom/vkontakte/android/audio/player/Player;->access$100(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    move-result-object v0

    .line 120
    .local v0, "helperI":Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
    instance-of v2, v0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;

    if-eqz v2, :cond_0

    check-cast v0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;

    .end local v0    # "helperI":Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->getPlayerActions()[Lcom/vkontakte/android/audio/PlayerAction;

    move-result-object v1

    goto :goto_0

    .line 114
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public getSubtitle(Lcom/vkontakte/android/audio/player/TrackInfo;I)Ljava/lang/String;
    .locals 2
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;
    .param p2, "currentIndex"    # I

    .prologue
    .line 102
    packed-switch p2, :pswitch_data_0

    .line 105
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasTrack()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v1

    iget-object v1, v1, Lcom/vkontakte/android/audio/player/PlayerTrack;->artist:Ljava/lang/String;

    .line 108
    :goto_0
    return-object v1

    .line 105
    :cond_0
    const-string/jumbo v1, ""

    goto :goto_0

    .line 107
    :pswitch_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Player$1;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/Player;->access$100(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    move-result-object v0

    .line 108
    .local v0, "helperI":Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
    instance-of v1, v0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;

    if-eqz v1, :cond_1

    check-cast v0, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;

    .end local v0    # "helperI":Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/ads/AdPlayerHelper;->getAdText()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .restart local v0    # "helperI":Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
    :cond_1
    const-string/jumbo v1, ""

    goto :goto_0

    .line 102
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public getTitle(Lcom/vkontakte/android/audio/player/TrackInfo;I)Ljava/lang/String;
    .locals 2
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;
    .param p2, "currentIndex"    # I

    .prologue
    .line 91
    packed-switch p2, :pswitch_data_0

    .line 94
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->hasTrack()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/audio/player/PlayerTrack;->title:Ljava/lang/String;

    .line 96
    :goto_0
    return-object v0

    .line 94
    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0

    .line 96
    :pswitch_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$1;->val$service:Lcom/vkontakte/android/audio/player/PlayerService;

    const v1, 0x7f0800e2

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/player/PlayerService;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 91
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public isContentMode(Lcom/vkontakte/android/audio/player/TrackInfo;I)Z
    .locals 1
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;
    .param p2, "currentIndex"    # I

    .prologue
    .line 126
    if-nez p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
