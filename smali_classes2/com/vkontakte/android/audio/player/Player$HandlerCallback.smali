.class Lcom/vkontakte/android/audio/player/Player$HandlerCallback;
.super Ljava/lang/Object;
.source "Player.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/Player;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HandlerCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/audio/player/Player;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/player/Player;)V
    .locals 0

    .prologue
    .line 914
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/Player$HandlerCallback;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/player/Player;Lcom/vkontakte/android/audio/player/Player$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/player/Player;
    .param p2, "x1"    # Lcom/vkontakte/android/audio/player/Player$1;

    .prologue
    .line 914
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/Player$HandlerCallback;-><init>(Lcom/vkontakte/android/audio/player/Player;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 7
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 917
    iget v5, p1, Landroid/os/Message;->what:I

    packed-switch v5, :pswitch_data_0

    move v3, v4

    .line 956
    :cond_0
    :goto_0
    return v3

    .line 919
    :pswitch_0
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/Player$HandlerCallback;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v4}, Lcom/vkontakte/android/audio/player/Player;->access$100(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;

    move-result-object v4

    invoke-interface {v4}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->getState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v2

    .line 920
    .local v2, "state":Lcom/vkontakte/android/audio/player/PlayerState;
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/Player$HandlerCallback;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v4}, Lcom/vkontakte/android/audio/player/Player;->access$2000(Lcom/vkontakte/android/audio/player/Player;)Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/player/PlayerListener;

    .line 921
    .local v1, "listener":Lcom/vkontakte/android/audio/player/PlayerListener;
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/Player$HandlerCallback;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v5}, Lcom/vkontakte/android/audio/player/Player;->access$700(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v5

    invoke-interface {v1, v2, v5}, Lcom/vkontakte/android/audio/player/PlayerListener;->onStateChanged(Lcom/vkontakte/android/audio/player/PlayerState;Lcom/vkontakte/android/audio/player/TrackInfo;)V

    goto :goto_1

    .line 926
    .end local v1    # "listener":Lcom/vkontakte/android/audio/player/PlayerListener;
    .end local v2    # "state":Lcom/vkontakte/android/audio/player/PlayerState;
    :pswitch_1
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/Player$HandlerCallback;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v5}, Lcom/vkontakte/android/audio/player/Player;->getTrackList()Ljava/util/List;

    move-result-object v0

    .line 927
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/Player$HandlerCallback;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v5, v3}, Lcom/vkontakte/android/audio/player/Player;->access$2102(Lcom/vkontakte/android/audio/player/Player;Z)Z

    .line 929
    :try_start_0
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/Player$HandlerCallback;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v5}, Lcom/vkontakte/android/audio/player/Player;->access$2000(Lcom/vkontakte/android/audio/player/Player;)Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/player/PlayerListener;

    .line 930
    .restart local v1    # "listener":Lcom/vkontakte/android/audio/player/PlayerListener;
    invoke-interface {v1, v0}, Lcom/vkontakte/android/audio/player/PlayerListener;->onTrackListChanged(Ljava/util/List;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    .line 932
    .end local v1    # "listener":Lcom/vkontakte/android/audio/player/PlayerListener;
    :catchall_0
    move-exception v3

    iget-object v5, p0, Lcom/vkontakte/android/audio/player/Player$HandlerCallback;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v5, v4}, Lcom/vkontakte/android/audio/player/Player;->access$2102(Lcom/vkontakte/android/audio/player/Player;Z)Z

    throw v3

    :cond_1
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/Player$HandlerCallback;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v5, v4}, Lcom/vkontakte/android/audio/player/Player;->access$2102(Lcom/vkontakte/android/audio/player/Player;Z)Z

    goto :goto_0

    .line 938
    .end local v0    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    :pswitch_2
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/Player$HandlerCallback;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v4}, Lcom/vkontakte/android/audio/player/Player;->access$2000(Lcom/vkontakte/android/audio/player/Player;)Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/player/PlayerListener;

    .line 939
    .restart local v1    # "listener":Lcom/vkontakte/android/audio/player/PlayerListener;
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/Player$HandlerCallback;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v5}, Lcom/vkontakte/android/audio/player/Player;->access$700(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v5

    invoke-interface {v1, v5}, Lcom/vkontakte/android/audio/player/PlayerListener;->onProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V

    goto :goto_3

    .line 944
    .end local v1    # "listener":Lcom/vkontakte/android/audio/player/PlayerListener;
    :pswitch_3
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/Player$HandlerCallback;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v4}, Lcom/vkontakte/android/audio/player/Player;->access$2000(Lcom/vkontakte/android/audio/player/Player;)Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/player/PlayerListener;

    .line 945
    .restart local v1    # "listener":Lcom/vkontakte/android/audio/player/PlayerListener;
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/Player$HandlerCallback;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v5}, Lcom/vkontakte/android/audio/player/Player;->access$700(Lcom/vkontakte/android/audio/player/Player;)Lcom/vkontakte/android/audio/player/TrackInfo;

    move-result-object v5

    invoke-interface {v1, v5}, Lcom/vkontakte/android/audio/player/PlayerListener;->onBufferingProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V

    goto :goto_4

    .line 950
    .end local v1    # "listener":Lcom/vkontakte/android/audio/player/PlayerListener;
    :pswitch_4
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/Player$HandlerCallback;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-static {v4}, Lcom/vkontakte/android/audio/player/Player;->access$2000(Lcom/vkontakte/android/audio/player/Player;)Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_5
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/player/PlayerListener;

    .line 951
    .restart local v1    # "listener":Lcom/vkontakte/android/audio/player/PlayerListener;
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/Player$HandlerCallback;->this$0:Lcom/vkontakte/android/audio/player/Player;

    invoke-interface {v1, v5}, Lcom/vkontakte/android/audio/player/PlayerListener;->onParametersChanged(Lcom/vkontakte/android/audio/player/Player;)V

    goto :goto_5

    .line 917
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
