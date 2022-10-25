.class Lcom/vkontakte/android/AudioMessagePlayerService$1;
.super Ljava/lang/Object;
.source "AudioMessagePlayerService.java"

# interfaces
.implements Landroid/media/AudioTrack$OnPlaybackPositionUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/AudioMessagePlayerService;->playOpusFile(Ljava/io/File;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/AudioMessagePlayerService;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/AudioMessagePlayerService;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 298
    iput-object p1, p0, Lcom/vkontakte/android/AudioMessagePlayerService$1;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMarkerReached(Landroid/media/AudioTrack;)V
    .locals 2
    .param p1, "audioTrack"    # Landroid/media/AudioTrack;

    .prologue
    .line 301
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService$1;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$400(Lcom/vkontakte/android/AudioMessagePlayerService;)V

    .line 302
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService$1;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$500(Lcom/vkontakte/android/AudioMessagePlayerService;)V

    .line 303
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService$1;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$600(Lcom/vkontakte/android/AudioMessagePlayerService;)V

    .line 304
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService$1;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$702(Lcom/vkontakte/android/AudioMessagePlayerService;F)F

    .line 305
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService$1;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$800(Lcom/vkontakte/android/AudioMessagePlayerService;)V

    .line 306
    return-void
.end method

.method public onPeriodicNotification(Landroid/media/AudioTrack;)V
    .locals 0
    .param p1, "audioTrack"    # Landroid/media/AudioTrack;

    .prologue
    .line 311
    return-void
.end method
