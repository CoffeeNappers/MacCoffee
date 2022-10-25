.class Lcom/vkontakte/android/AudioMessagePlayerService$AbandonFocus;
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
    name = "AbandonFocus"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/AudioMessagePlayerService;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/AudioMessagePlayerService;)V
    .locals 0

    .prologue
    .line 688
    iput-object p1, p0, Lcom/vkontakte/android/AudioMessagePlayerService$AbandonFocus;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/AudioMessagePlayerService;Lcom/vkontakte/android/AudioMessagePlayerService$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/AudioMessagePlayerService;
    .param p2, "x1"    # Lcom/vkontakte/android/AudioMessagePlayerService$1;

    .prologue
    .line 688
    invoke-direct {p0, p1}, Lcom/vkontakte/android/AudioMessagePlayerService$AbandonFocus;-><init>(Lcom/vkontakte/android/AudioMessagePlayerService;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 691
    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService$AbandonFocus;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/Utils;->getAudioManager(Landroid/content/Context;)Landroid/media/AudioManager;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService$AbandonFocus;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v1}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$2800(Lcom/vkontakte/android/AudioMessagePlayerService;)Lcom/vkontakte/android/AudioMessagePlayerService$FocusListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 692
    return-void
.end method
