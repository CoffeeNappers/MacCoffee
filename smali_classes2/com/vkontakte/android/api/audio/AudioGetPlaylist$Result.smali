.class public final Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;
.super Ljava/lang/Object;
.source "AudioGetPlaylist.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/audio/AudioGetPlaylist;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Result"
.end annotation


# instance fields
.field public musicTracks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field public owner:Ljava/lang/String;

.field public playlist:Lcom/vk/music/dto/Playlist;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
