.class final Lcom/vkontakte/android/media/VideoPools$1;
.super Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;
.source "VideoPools.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/media/VideoPools;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lcom/vkontakte/android/media/VideoPools$PoolPlayerFactory;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public createPlayer(Landroid/content/Context;Lcom/vkontakte/android/api/VideoFile;Ljava/lang/String;)Lcom/vkontakte/android/media/AbsVideoPlayer;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "file"    # Lcom/vkontakte/android/api/VideoFile;
    .param p3, "referrer"    # Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 83
    new-instance v0, Lcom/vkontakte/android/media/ExoVideoPlayer;

    invoke-direct {v0, p1, p2, p3}, Lcom/vkontakte/android/media/ExoVideoPlayer;-><init>(Landroid/content/Context;Lcom/vkontakte/android/api/VideoFile;Ljava/lang/String;)V

    return-object v0
.end method
