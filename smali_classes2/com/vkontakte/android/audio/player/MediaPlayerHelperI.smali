.class public interface abstract Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
.super Ljava/lang/Object;
.source "MediaPlayerHelperI.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;,
        Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Factory;,
        Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;,
        Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;,
        Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;
    }
.end annotation


# static fields
.field public static final PROGRESS_DELAY:J = 0x1f4L

.field public static final URL_CREATOR_EXO_PLAYER_CACHE_FILE:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;

.field public static final URL_CREATOR_EXO_PLAYER_CACHE_HTTP:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;

.field public static final URL_CREATOR_LOCAL_HOST_CACHE:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    invoke-static {}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$$Lambda$1;->lambdaFactory$()Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->URL_CREATOR_LOCAL_HOST_CACHE:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;

    .line 28
    invoke-static {}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$$Lambda$5;->lambdaFactory$()Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->URL_CREATOR_EXO_PLAYER_CACHE_HTTP:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;

    .line 29
    invoke-static {}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$$Lambda$6;->lambdaFactory$()Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->URL_CREATOR_EXO_PLAYER_CACHE_FILE:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;

    return-void
.end method


# virtual methods
.method public abstract canPlay()Z
.end method

.method public abstract getAudioSessionId()I
.end method

.method public abstract getCurrentPosition()J
.end method

.method public abstract getDuration()J
.end method

.method public abstract getId()I
.end method

.method public abstract getRefer()Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;
.end method

.method public abstract getState()Lcom/vkontakte/android/audio/player/PlayerState;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract pause()Z
.end method

.method public abstract play(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)V
    .param p1    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract release()V
.end method

.method public abstract resume()Z
.end method

.method public abstract rewind()Z
.end method

.method public abstract seekTo(I)Z
.end method

.method public abstract setVolume(F)V
.end method

.method public abstract stop()V
.end method

.method public abstract tryNext()Z
.end method
