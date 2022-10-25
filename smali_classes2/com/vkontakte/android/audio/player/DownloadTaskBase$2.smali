.class Lcom/vkontakte/android/audio/player/DownloadTaskBase$2;
.super Lcom/vkontakte/android/audio/player/DownloadTrackFileConverter;
.source "DownloadTaskBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/audio/player/DownloadTaskBase;->downloadTracks(Ljava/util/Collection;)Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/audio/player/DownloadTaskBase;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/audio/player/DownloadTaskBase;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/audio/player/DownloadTaskBase;

    .prologue
    .line 249
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$2;->this$0:Lcom/vkontakte/android/audio/player/DownloadTaskBase;

    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/DownloadTrackFileConverter;-><init>()V

    return-void
.end method


# virtual methods
.method public checkPause()V
    .locals 1

    .prologue
    .line 252
    invoke-super {p0}, Lcom/vkontakte/android/audio/player/DownloadTrackFileConverter;->checkPause()V

    .line 254
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$2;->this$0:Lcom/vkontakte/android/audio/player/DownloadTaskBase;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->access$300(Lcom/vkontakte/android/audio/player/DownloadTaskBase;)V

    .line 255
    return-void
.end method
