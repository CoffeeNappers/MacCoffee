.class Lcom/vkontakte/android/audio/player/PlayerService$StopRunnable;
.super Ljava/lang/Object;
.source "PlayerService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/PlayerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StopRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/audio/player/PlayerService;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/player/PlayerService;)V
    .locals 0

    .prologue
    .line 650
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/PlayerService$StopRunnable;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/player/PlayerService;Lcom/vkontakte/android/audio/player/PlayerService$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/player/PlayerService;
    .param p2, "x1"    # Lcom/vkontakte/android/audio/player/PlayerService$1;

    .prologue
    .line 650
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/PlayerService$StopRunnable;-><init>(Lcom/vkontakte/android/audio/player/PlayerService;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 653
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService$StopRunnable;->this$0:Lcom/vkontakte/android/audio/player/PlayerService;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/player/PlayerService;->access$1100(Lcom/vkontakte/android/audio/player/PlayerService;Z)V

    .line 654
    return-void
.end method
