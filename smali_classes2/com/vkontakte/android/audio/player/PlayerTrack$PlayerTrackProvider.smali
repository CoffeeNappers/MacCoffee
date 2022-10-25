.class public Lcom/vkontakte/android/audio/player/PlayerTrack$PlayerTrackProvider;
.super Lcom/vkontakte/android/audio/MusicTrack$MusicTrackProvider;
.source "PlayerTrack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/PlayerTrack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PlayerTrackProvider"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/audio/MusicTrack$MusicTrackProvider",
        "<",
        "Lcom/vkontakte/android/audio/player/PlayerTrack;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    .line 104
    const-string/jumbo v0, "player_track"

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/audio/MusicTrack$MusicTrackProvider;-><init>(Ljava/lang/String;Z)V

    .line 105
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/player/PlayerTrack$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/player/PlayerTrack$1;

    .prologue
    .line 102
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/PlayerTrack$PlayerTrackProvider;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic createNew()Lcom/vkontakte/android/audio/database/DataObject;
    .locals 1

    .prologue
    .line 102
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/PlayerTrack$PlayerTrackProvider;->createNew()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    return-object v0
.end method

.method protected createNew()Lcom/vkontakte/android/audio/player/PlayerTrack;
    .locals 2

    .prologue
    .line 109
    new-instance v0, Lcom/vkontakte/android/audio/player/PlayerTrack;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/audio/player/PlayerTrack;-><init>(Lcom/vkontakte/android/audio/player/PlayerTrack$1;)V

    return-object v0
.end method

.method protected getProjection()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 118
    invoke-static {}, Lcom/vkontakte/android/audio/player/PlayerTrack;->access$200()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public loadTracks()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerTrack;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 113
    invoke-static {}, Lcom/vkontakte/android/audio/player/PlayerTrack;->access$200()[Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/vkontakte/android/audio/player/PlayerTrack;->access$300()I

    move-result v1

    aget-object v0, v0, v1

    invoke-virtual {p0, v2, v2, v0}, Lcom/vkontakte/android/audio/player/PlayerTrack$PlayerTrackProvider;->getListByQuery(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method
