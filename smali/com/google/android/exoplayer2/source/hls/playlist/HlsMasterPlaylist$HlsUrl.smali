.class public final Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;
.super Ljava/lang/Object;
.source "HlsMasterPlaylist.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "HlsUrl"
.end annotation


# instance fields
.field public final audioFormat:Lcom/google/android/exoplayer2/Format;

.field public final format:Lcom/google/android/exoplayer2/Format;

.field public final name:Ljava/lang/String;

.field public final textFormats:[Lcom/google/android/exoplayer2/Format;

.field public final url:Ljava/lang/String;

.field public final videoFormat:Lcom/google/android/exoplayer2/Format;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/exoplayer2/Format;Lcom/google/android/exoplayer2/Format;Lcom/google/android/exoplayer2/Format;[Lcom/google/android/exoplayer2/Format;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "format"    # Lcom/google/android/exoplayer2/Format;
    .param p4, "videoFormat"    # Lcom/google/android/exoplayer2/Format;
    .param p5, "audioFormat"    # Lcom/google/android/exoplayer2/Format;
    .param p6, "textFormats"    # [Lcom/google/android/exoplayer2/Format;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;->name:Ljava/lang/String;

    .line 50
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;->url:Ljava/lang/String;

    .line 51
    iput-object p3, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;->format:Lcom/google/android/exoplayer2/Format;

    .line 52
    iput-object p4, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;->videoFormat:Lcom/google/android/exoplayer2/Format;

    .line 53
    iput-object p5, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;->audioFormat:Lcom/google/android/exoplayer2/Format;

    .line 54
    iput-object p6, p0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;->textFormats:[Lcom/google/android/exoplayer2/Format;

    .line 55
    return-void
.end method

.method public static createMediaPlaylistHlsUrl(Ljava/lang/String;)Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;
    .locals 8
    .param p0, "baseUri"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 42
    const-string/jumbo v0, "0"

    const-string/jumbo v1, "application/x-mpegURL"

    const/4 v4, -0x1

    const/4 v5, 0x0

    move-object v3, v2

    move-object v6, v2

    invoke-static/range {v0 .. v6}, Lcom/google/android/exoplayer2/Format;->createContainerFormat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;)Lcom/google/android/exoplayer2/Format;

    move-result-object v4

    .line 44
    .local v4, "format":Lcom/google/android/exoplayer2/Format;
    new-instance v1, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;

    move-object v3, p0

    move-object v5, v2

    move-object v6, v2

    move-object v7, v2

    invoke-direct/range {v1 .. v7}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/exoplayer2/Format;Lcom/google/android/exoplayer2/Format;Lcom/google/android/exoplayer2/Format;[Lcom/google/android/exoplayer2/Format;)V

    return-object v1
.end method
