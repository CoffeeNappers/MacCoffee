.class Lcom/vkontakte/android/audio/player/proxy/PlayerProxy$ReadQueryDataThread;
.super Ljava/lang/Thread;
.source "PlayerProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReadQueryDataThread"
.end annotation


# instance fields
.field private final mClient:I

.field private final mSocket:Ljava/nio/channels/SocketChannel;

.field final synthetic this$0:Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;Ljava/nio/channels/SocketChannel;I)V
    .locals 0
    .param p2, "socket"    # Ljava/nio/channels/SocketChannel;
    .param p3, "client"    # I

    .prologue
    .line 116
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy$ReadQueryDataThread;->this$0:Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 117
    iput-object p2, p0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy$ReadQueryDataThread;->mSocket:Ljava/nio/channels/SocketChannel;

    .line 118
    iput p3, p0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy$ReadQueryDataThread;->mClient:I

    .line 119
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 123
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 126
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy$ReadQueryDataThread;->mSocket:Ljava/nio/channels/SocketChannel;

    iget v3, p0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy$ReadQueryDataThread;->mClient:I

    invoke-static {v0, v3}, Lcom/vkontakte/android/audio/player/proxy/QueryData;->read(Ljava/nio/channels/SocketChannel;I)Lcom/vkontakte/android/audio/player/proxy/QueryData;

    move-result-object v4

    .line 127
    .local v4, "queryData":Lcom/vkontakte/android/audio/player/proxy/QueryData;
    iget-object v0, v4, Lcom/vkontakte/android/audio/player/proxy/QueryData;->parameters:Ljava/util/Map;

    const-string/jumbo v3, "mid"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 128
    .local v1, "mid":Ljava/lang/String;
    iget-object v0, v4, Lcom/vkontakte/android/audio/player/proxy/QueryData;->parameters:Ljava/util/Map;

    const-string/jumbo v3, "url"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 129
    .local v2, "url":Ljava/lang/String;
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy$ReadQueryDataThread;->this$0:Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;->access$000(Lcom/vkontakte/android/audio/player/proxy/PlayerProxy;)Landroid/content/Context;

    move-result-object v0

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy$ReadQueryDataThread;->mSocket:Ljava/nio/channels/SocketChannel;

    iget v5, p0, Lcom/vkontakte/android/audio/player/proxy/PlayerProxy$ReadQueryDataThread;->mClient:I

    invoke-static/range {v0 .. v5}, Lcom/vkontakte/android/audio/player/proxy/ClientThread;->play(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/nio/channels/SocketChannel;Lcom/vkontakte/android/audio/player/proxy/QueryData;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    .end local v1    # "mid":Ljava/lang/String;
    .end local v2    # "url":Ljava/lang/String;
    .end local v4    # "queryData":Lcom/vkontakte/android/audio/player/proxy/QueryData;
    :goto_0
    return-void

    .line 130
    :catch_0
    move-exception v6

    .line 131
    .local v6, "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {v6, v0}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method
