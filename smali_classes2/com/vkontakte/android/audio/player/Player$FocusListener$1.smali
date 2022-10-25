.class Lcom/vkontakte/android/audio/player/Player$FocusListener$1;
.super Ljava/lang/Object;
.source "Player.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/Player$FocusListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/audio/player/Player$FocusListener;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/audio/player/Player$FocusListener;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/audio/player/Player$FocusListener;

    .prologue
    .line 876
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/Player$FocusListener$1;->this$1:Lcom/vkontakte/android/audio/player/Player$FocusListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 879
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const-string/jumbo v1, "PlayerService"

    aput-object v1, v0, v3

    const/4 v1, 0x1

    const-string/jumbo v2, "Player"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "Audio focus gain"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 880
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$FocusListener$1;->this$1:Lcom/vkontakte/android/audio/player/Player$FocusListener;

    iget-object v0, v0, Lcom/vkontakte/android/audio/player/Player$FocusListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player;->access$100(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-interface {v0, v1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->setVolume(F)V

    .line 881
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$FocusListener$1;->this$1:Lcom/vkontakte/android/audio/player/Player$FocusListener;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Player$FocusListener;->access$1700(Lcom/vkontakte/android/audio/player/Player$FocusListener;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 882
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$FocusListener$1;->this$1:Lcom/vkontakte/android/audio/player/Player$FocusListener;

    invoke-static {v0, v3}, Lcom/vkontakte/android/audio/player/Player$FocusListener;->access$1702(Lcom/vkontakte/android/audio/player/Player$FocusListener;Z)Z

    .line 883
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Player$FocusListener$1;->this$1:Lcom/vkontakte/android/audio/player/Player$FocusListener;

    iget-object v0, v0, Lcom/vkontakte/android/audio/player/Player$FocusListener;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/Player;->resume()Z

    .line 885
    :cond_0
    return-void
.end method
