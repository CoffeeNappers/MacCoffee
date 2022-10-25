.class Lcom/vkontakte/android/AudioMessagePlayerService$UpdateRunnable;
.super Ljava/lang/Object;
.source "AudioMessagePlayerService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/AudioMessagePlayerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UpdateRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/AudioMessagePlayerService;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/AudioMessagePlayerService;)V
    .locals 0

    .prologue
    .line 613
    iput-object p1, p0, Lcom/vkontakte/android/AudioMessagePlayerService$UpdateRunnable;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/AudioMessagePlayerService;Lcom/vkontakte/android/AudioMessagePlayerService$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;
    .param p2, "x1"    # Lcom/vkontakte/android/AudioMessagePlayerService$1;

    .prologue
    .line 613
    invoke-direct {p0, p1}, Lcom/vkontakte/android/AudioMessagePlayerService$UpdateRunnable;-><init>(Lcom/vkontakte/android/AudioMessagePlayerService;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 616
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService$UpdateRunnable;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$2200(Lcom/vkontakte/android/AudioMessagePlayerService;)V

    .line 617
    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 618
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService$UpdateRunnable;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$2300(Lcom/vkontakte/android/AudioMessagePlayerService;)Lcom/vkontakte/android/utils/DispatchQueue;

    move-result-object v0

    const-wide/16 v2, 0x64

    invoke-virtual {v0, p0, v2, v3}, Lcom/vkontakte/android/utils/DispatchQueue;->postRunnable(Ljava/lang/Runnable;J)V

    .line 620
    :cond_0
    return-void
.end method
