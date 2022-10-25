.class public final Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist$Result;
.super Ljava/lang/Object;
.source "AudioRemoveFromPlaylist.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/audio/AudioRemoveFromPlaylist;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Result"
.end annotation


# instance fields
.field public playlist:Lcom/vk/music/dto/Playlist;

.field public result:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
