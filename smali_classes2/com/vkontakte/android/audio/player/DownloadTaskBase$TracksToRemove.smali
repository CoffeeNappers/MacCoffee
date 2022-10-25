.class Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksToRemove;
.super Ljava/lang/Object;
.source "DownloadTaskBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/DownloadTaskBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TracksToRemove"
.end annotation


# instance fields
.field public final tracks:[Lcom/vkontakte/android/audio/player/SavedTrack;


# direct methods
.method public varargs constructor <init>([Lcom/vkontakte/android/audio/player/SavedTrack;)V
    .locals 0
    .param p1, "tracks"    # [Lcom/vkontakte/android/audio/player/SavedTrack;

    .prologue
    .line 556
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 557
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksToRemove;->tracks:[Lcom/vkontakte/android/audio/player/SavedTrack;

    .line 558
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 562
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "TracksToRemove "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 563
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$TracksToRemove;->tracks:[Lcom/vkontakte/android/audio/player/SavedTrack;

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->access$400(Ljava/lang/StringBuilder;[Lcom/vkontakte/android/audio/player/SavedTrack;)V

    .line 565
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
