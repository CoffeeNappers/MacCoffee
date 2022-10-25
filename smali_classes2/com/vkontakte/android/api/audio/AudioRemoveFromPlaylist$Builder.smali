.class public final Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;
.super Ljava/lang/Object;
.source "AudioRemoveFromPlaylist.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field audioIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field ownerId:I

.field playlistId:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addAudio(Lcom/vkontakte/android/audio/MusicTrack;)Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;
    .locals 2
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;->audioIds:Ljava/util/List;

    if-nez v0, :cond_0

    .line 33
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;->audioIds:Ljava/util/List;

    .line 35
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;->audioIds:Ljava/util/List;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/MusicTrack;->getUid()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    return-object p0
.end method

.method public build()Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist;
    .locals 2

    .prologue
    .line 40
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist;-><init>(Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$1;)V

    return-object v0
.end method

.method public ownerId(I)Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;
    .locals 0
    .param p1, "val"    # I

    .prologue
    .line 22
    iput p1, p0, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;->ownerId:I

    .line 23
    return-object p0
.end method

.method public playlistId(I)Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;
    .locals 0
    .param p1, "val"    # I

    .prologue
    .line 27
    iput p1, p0, Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Builder;->playlistId:I

    .line 28
    return-object p0
.end method
