.class public final Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;
.super Ljava/lang/Object;
.source "AudioAddToPlaylist.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/audio/AudioAddToPlaylist;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field final audioIds:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

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
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;->audioIds:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addAudio(Lcom/vkontakte/android/audio/MusicTrack;)Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;
    .locals 2
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;->audioIds:Ljava/util/List;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/MusicTrack;->getSecureUid()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    return-object p0
.end method

.method public build()Lcom/vkontakte/android/api/audio/AudioAddToPlaylist;
    .locals 2

    .prologue
    .line 45
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist;-><init>(Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$1;)V

    return-object v0
.end method

.method public ownerId(I)Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;
    .locals 0
    .param p1, "val"    # I

    .prologue
    .line 30
    iput p1, p0, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;->ownerId:I

    .line 31
    return-object p0
.end method

.method public playlistId(I)Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;
    .locals 0
    .param p1, "val"    # I

    .prologue
    .line 35
    iput p1, p0, Lcom/vkontakte/android/api/audio/AudioAddToPlaylist$Builder;->playlistId:I

    .line 36
    return-object p0
.end method
