.class Lcom/vkontakte/android/audio/MusicApp$UpdateBroadcastSender;
.super Ljava/lang/Object;
.source "MusicApp.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/MusicApp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "UpdateBroadcastSender"
.end annotation


# instance fields
.field final f:Lcom/vkontakte/android/audio/MusicTrack;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 0
    .param p1, "f"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 225
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 226
    iput-object p1, p0, Lcom/vkontakte/android/audio/MusicApp$UpdateBroadcastSender;->f:Lcom/vkontakte/android/audio/MusicTrack;

    .line 227
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 232
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getCurrentTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    .line 233
    .local v0, "currentFile":Lcom/vkontakte/android/audio/MusicTrack;
    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/audio/MusicApp$UpdateBroadcastSender;->f:Lcom/vkontakte/android/audio/MusicTrack;

    iget v2, v2, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    iget v3, v0, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    if-ne v2, v3, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/audio/MusicApp$UpdateBroadcastSender;->f:Lcom/vkontakte/android/audio/MusicTrack;

    iget v2, v2, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    iget v3, v0, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    if-eq v2, v3, :cond_1

    .line 240
    .end local v0    # "currentFile":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_0
    :goto_0
    return-void

    .line 236
    .restart local v0    # "currentFile":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_1
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->updateBroadcast()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 237
    .end local v0    # "currentFile":Lcom/vkontakte/android/audio/MusicTrack;
    :catch_0
    move-exception v1

    .line 238
    .local v1, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method
