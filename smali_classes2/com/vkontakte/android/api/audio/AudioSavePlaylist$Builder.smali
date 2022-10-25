.class public final Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;
.super Ljava/lang/Object;
.source "AudioSavePlaylist.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/audio/AudioSavePlaylist;
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

.field audioIdsToAdd:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field audioIdsToRemove:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field description:Ljava/lang/String;

.field hash:Ljava/lang/String;

.field ownerId:I

.field photo:Ljava/lang/String;

.field playlistId:I

.field saveCover:Z

.field title:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addAudio(Lcom/vkontakte/android/audio/MusicTrack;)Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;
    .locals 2
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 54
    iget-object v0, p0, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->audioIds:Ljava/util/List;

    if-nez v0, :cond_0

    .line 55
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->audioIds:Ljava/util/List;

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->audioIds:Ljava/util/List;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/MusicTrack;->getSecureUid()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    return-object p0
.end method

.method public addAudioToAdd(Lcom/vkontakte/android/audio/MusicTrack;)Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;
    .locals 2
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->audioIdsToAdd:Ljava/util/List;

    if-nez v0, :cond_0

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->audioIdsToAdd:Ljava/util/List;

    .line 65
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->audioIdsToAdd:Ljava/util/List;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/MusicTrack;->getSecureUid()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    return-object p0
.end method

.method public addAudioToRemove(Lcom/vkontakte/android/audio/MusicTrack;)Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;
    .locals 2
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 70
    iget-object v0, p0, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->audioIdsToRemove:Ljava/util/List;

    if-nez v0, :cond_0

    .line 71
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->audioIdsToRemove:Ljava/util/List;

    .line 73
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->audioIdsToRemove:Ljava/util/List;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/MusicTrack;->getUid()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    return-object p0
.end method

.method public build()Lcom/vkontakte/android/api/audio/AudioSavePlaylist;
    .locals 2

    .prologue
    .line 93
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioSavePlaylist;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/api/audio/AudioSavePlaylist;-><init>(Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;Lcom/vkontakte/android/api/audio/AudioSavePlaylist$1;)V

    return-object v0
.end method

.method public description(Ljava/lang/String;)Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;
    .locals 0
    .param p1, "val"    # Ljava/lang/String;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->description:Ljava/lang/String;

    .line 50
    return-object p0
.end method

.method public hash(Ljava/lang/String;)Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;
    .locals 0
    .param p1, "val"    # Ljava/lang/String;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->hash:Ljava/lang/String;

    .line 84
    return-object p0
.end method

.method public ownerId(I)Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;
    .locals 0
    .param p1, "val"    # I

    .prologue
    .line 34
    iput p1, p0, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->ownerId:I

    .line 35
    return-object p0
.end method

.method public photo(Ljava/lang/String;)Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;
    .locals 0
    .param p1, "val"    # Ljava/lang/String;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->photo:Ljava/lang/String;

    .line 89
    return-object p0
.end method

.method public playlistId(I)Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;
    .locals 0
    .param p1, "val"    # I

    .prologue
    .line 39
    iput p1, p0, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->playlistId:I

    .line 40
    return-object p0
.end method

.method public saveCover(Z)Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;
    .locals 0
    .param p1, "val"    # Z

    .prologue
    .line 78
    iput-boolean p1, p0, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->saveCover:Z

    .line 79
    return-object p0
.end method

.method public title(Ljava/lang/String;)Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;
    .locals 0
    .param p1, "val"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/vkontakte/android/api/audio/AudioSavePlaylist$Builder;->title:Ljava/lang/String;

    .line 45
    return-object p0
.end method
