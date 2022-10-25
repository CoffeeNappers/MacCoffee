.class public Lcom/vkontakte/android/audio/player/SavedTrack$SavedTrackProvider;
.super Lcom/vkontakte/android/audio/MusicTrack$MusicTrackProvider;
.source "SavedTrack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/SavedTrack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SavedTrackProvider"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/audio/MusicTrack$MusicTrackProvider",
        "<",
        "Lcom/vkontakte/android/audio/player/SavedTrack;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    .line 104
    const-string/jumbo v0, "saved_track"

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/audio/MusicTrack$MusicTrackProvider;-><init>(Ljava/lang/String;Z)V

    .line 105
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/player/SavedTrack$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/player/SavedTrack$1;

    .prologue
    .line 102
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/SavedTrack$SavedTrackProvider;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic createNew()Lcom/vkontakte/android/audio/database/DataObject;
    .locals 1

    .prologue
    .line 102
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/SavedTrack$SavedTrackProvider;->createNew()Lcom/vkontakte/android/audio/player/SavedTrack;

    move-result-object v0

    return-object v0
.end method

.method protected createNew()Lcom/vkontakte/android/audio/player/SavedTrack;
    .locals 1

    .prologue
    .line 109
    new-instance v0, Lcom/vkontakte/android/audio/player/SavedTrack;

    invoke-direct {v0}, Lcom/vkontakte/android/audio/player/SavedTrack;-><init>()V

    return-object v0
.end method

.method protected getProjection()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 118
    invoke-static {}, Lcom/vkontakte/android/audio/player/SavedTrack;->access$100()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public loadTracks()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/player/SavedTrack;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 113
    invoke-static {}, Lcom/vkontakte/android/audio/player/SavedTrack;->access$100()[Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/vkontakte/android/audio/player/SavedTrack;->access$200()I

    move-result v1

    aget-object v0, v0, v1

    invoke-virtual {p0, v2, v2, v0}, Lcom/vkontakte/android/audio/player/SavedTrack$SavedTrackProvider;->getListByQuery(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method
