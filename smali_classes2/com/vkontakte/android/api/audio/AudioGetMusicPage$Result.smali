.class public final Lcom/vkontakte/android/api/audio/AudioGetMusicPage$Result;
.super Ljava/lang/Object;
.source "AudioGetMusicPage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/audio/AudioGetMusicPage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Result"
.end annotation


# instance fields
.field public musicTracks:Lcom/vkontakte/android/data/VKList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field public ownerImage:Ljava/lang/String;

.field public ownerName:Ljava/lang/String;

.field public playlists:Lcom/vkontakte/android/data/VKList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;"
        }
    .end annotation
.end field

.field public savedAudios:Lcom/vk/music/dto/Playlist;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
