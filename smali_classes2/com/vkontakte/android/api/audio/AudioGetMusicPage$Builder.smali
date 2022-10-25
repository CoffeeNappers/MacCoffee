.class public final Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;
.super Ljava/lang/Object;
.source "AudioGetMusicPage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/audio/AudioGetMusicPage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field audioCount:I

.field audioOffset:I

.field loadSaved:Z

.field needOwner:Z

.field needPlaylists:Z

.field final ownerId:I

.field playlistsCount:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "ownerId"    # I

    .prologue
    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    iput p1, p0, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->ownerId:I

    .line 117
    return-void
.end method


# virtual methods
.method public audioCount(I)Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;
    .locals 0
    .param p1, "audioCount"    # I

    .prologue
    .line 140
    iput p1, p0, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->audioCount:I

    .line 141
    return-object p0
.end method

.method public audioOffset(I)Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;
    .locals 0
    .param p1, "audioOffset"    # I

    .prologue
    .line 135
    iput p1, p0, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->audioOffset:I

    .line 136
    return-object p0
.end method

.method public build()Lcom/vkontakte/android/api/audio/AudioGetMusicPage;
    .locals 2

    .prologue
    .line 150
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetMusicPage;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/api/audio/AudioGetMusicPage;-><init>(Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;Lcom/vkontakte/android/api/audio/AudioGetMusicPage$1;)V

    return-object v0
.end method

.method public loadSaved(Z)Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;
    .locals 0
    .param p1, "loadSaved"    # Z

    .prologue
    .line 145
    iput-boolean p1, p0, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->loadSaved:Z

    .line 146
    return-object p0
.end method

.method public needOwner(Z)Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;
    .locals 0
    .param p1, "needOwner"    # Z

    .prologue
    .line 120
    iput-boolean p1, p0, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->needOwner:Z

    .line 121
    return-object p0
.end method

.method public needPlaylists(Z)Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;
    .locals 0
    .param p1, "needPlaylists"    # Z

    .prologue
    .line 125
    iput-boolean p1, p0, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->needPlaylists:Z

    .line 126
    return-object p0
.end method

.method public playlistsCount(I)Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;
    .locals 0
    .param p1, "playlistsCount"    # I

    .prologue
    .line 130
    iput p1, p0, Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Builder;->playlistsCount:I

    .line 131
    return-object p0
.end method
