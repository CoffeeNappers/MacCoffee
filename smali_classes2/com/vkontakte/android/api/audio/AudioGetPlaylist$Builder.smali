.class public final Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;
.super Ljava/lang/Object;
.source "AudioGetPlaylist.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/audio/AudioGetPlaylist;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field accessKey:Ljava/lang/String;

.field audioCount:I

.field audioOffset:I

.field final id:I

.field needOwner:Z

.field needPlaylist:Z

.field final ownerId:I


# direct methods
.method public constructor <init>(II)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "ownerId"    # I

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    iput p1, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->id:I

    .line 95
    iput p2, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->ownerId:I

    .line 96
    return-void
.end method

.method public constructor <init>(Lcom/vk/music/dto/Playlist;)V
    .locals 2
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;

    .prologue
    const/4 v1, 0x0

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    iget v0, p1, Lcom/vk/music/dto/Playlist;->id:I

    iput v0, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->id:I

    .line 100
    iget v0, p1, Lcom/vk/music/dto/Playlist;->ownerId:I

    iput v0, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->ownerId:I

    .line 101
    iget-object v0, p1, Lcom/vk/music/dto/Playlist;->accessKey:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->accessKey(Ljava/lang/String;)Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;

    .line 102
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->needOwner(Z)Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;

    .line 103
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->needPlaylist(Z)Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;

    .line 104
    return-void
.end method


# virtual methods
.method public accessKey(Ljava/lang/String;)Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;
    .locals 0
    .param p1, "accessKey"    # Ljava/lang/String;

    .prologue
    .line 127
    iput-object p1, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->accessKey:Ljava/lang/String;

    .line 128
    return-object p0
.end method

.method public audioCount(I)Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;
    .locals 0
    .param p1, "audioCount"    # I

    .prologue
    .line 122
    iput p1, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->audioCount:I

    .line 123
    return-object p0
.end method

.method public audioOffset(I)Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;
    .locals 0
    .param p1, "audioOffset"    # I

    .prologue
    .line 117
    iput p1, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->audioOffset:I

    .line 118
    return-object p0
.end method

.method public build()Lcom/vkontakte/android/api/audio/AudioGetPlaylist;
    .locals 6

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 132
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist;

    iget v1, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->ownerId:I

    iget v4, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->id:I

    const/4 v5, 0x0

    invoke-direct {v0, v1, v4, v5}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist;-><init>(IILcom/vkontakte/android/api/audio/AudioGetPlaylist$1;)V

    .line 133
    .local v0, "audioGetPlaylist":Lcom/vkontakte/android/api/audio/AudioGetPlaylist;
    const-string/jumbo v4, "need_owner"

    iget-boolean v1, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->needOwner:Z

    if-eqz v1, :cond_0

    move v1, v2

    :goto_0
    invoke-virtual {v0, v4, v1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 134
    const-string/jumbo v1, "need_playlist"

    iget-boolean v4, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->needPlaylist:Z

    if-eqz v4, :cond_1

    :goto_1
    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 135
    const-string/jumbo v1, "audio_offset"

    iget v2, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->audioOffset:I

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 136
    const-string/jumbo v1, "audio_count"

    iget v2, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->audioCount:I

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 137
    const-string/jumbo v1, "access_key"

    iget-object v2, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->accessKey:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/audio/AudioGetPlaylist;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 138
    return-object v0

    :cond_0
    move v1, v3

    .line 133
    goto :goto_0

    :cond_1
    move v2, v3

    .line 134
    goto :goto_1
.end method

.method public needOwner(Z)Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;
    .locals 0
    .param p1, "needOwner"    # Z

    .prologue
    .line 107
    iput-boolean p1, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->needOwner:Z

    .line 108
    return-object p0
.end method

.method public needPlaylist(Z)Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;
    .locals 0
    .param p1, "needPlaylist"    # Z

    .prologue
    .line 112
    iput-boolean p1, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Builder;->needPlaylist:Z

    .line 113
    return-object p0
.end method
