.class Lcom/vkontakte/android/AudioMessagePlayerService$ReleaseRunnable;
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
    name = "ReleaseRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/AudioMessagePlayerService;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/AudioMessagePlayerService;)V
    .locals 0

    .prologue
    .line 681
    iput-object p1, p0, Lcom/vkontakte/android/AudioMessagePlayerService$ReleaseRunnable;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/AudioMessagePlayerService;Lcom/vkontakte/android/AudioMessagePlayerService$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;
    .param p2, "x1"    # Lcom/vkontakte/android/AudioMessagePlayerService$1;

    .prologue
    .line 681
    invoke-direct {p0, p1}, Lcom/vkontakte/android/AudioMessagePlayerService$ReleaseRunnable;-><init>(Lcom/vkontakte/android/AudioMessagePlayerService;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 684
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService$ReleaseRunnable;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-virtual {v0}, Lcom/vkontakte/android/AudioMessagePlayerService;->stopSelf()V

    .line 685
    return-void
.end method
