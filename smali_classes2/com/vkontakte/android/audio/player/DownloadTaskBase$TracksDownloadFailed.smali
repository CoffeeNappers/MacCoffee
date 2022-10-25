.class Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksDownloadFailed;
.super Ljava/lang/Object;
.source "DownloadTaskBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/DownloadTaskBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TracksDownloadFailed"
.end annotation


# instance fields
.field private final mTrack:Lcom/vkontakte/android/audio/MusicTrack;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 0
    .param p1, "track"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 572
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 573
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksDownloadFailed;->mTrack:Lcom/vkontakte/android/audio/MusicTrack;

    .line 574
    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksDownloadFailed;)Lcom/vkontakte/android/audio/MusicTrack;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksDownloadFailed;

    .prologue
    .line 569
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksDownloadFailed;->mTrack:Lcom/vkontakte/android/audio/MusicTrack;

    return-object v0
.end method
