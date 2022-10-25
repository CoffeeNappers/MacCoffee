.class Lcom/vkontakte/android/OverScrollView$ScrollEndTimerTask;
.super Ljava/util/TimerTask;
.source "OverScrollView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/OverScrollView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScrollEndTimerTask"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/OverScrollView;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/OverScrollView;)V
    .locals 0

    .prologue
    .line 204
    iput-object p1, p0, Lcom/vkontakte/android/OverScrollView$ScrollEndTimerTask;->this$0:Lcom/vkontakte/android/OverScrollView;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/OverScrollView;Lcom/vkontakte/android/OverScrollView$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/OverScrollView;
    .param p2, "x1"    # Lcom/vkontakte/android/OverScrollView$1;

    .prologue
    .line 204
    invoke-direct {p0, p1}, Lcom/vkontakte/android/OverScrollView$ScrollEndTimerTask;-><init>(Lcom/vkontakte/android/OverScrollView;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 207
    iget-object v0, p0, Lcom/vkontakte/android/OverScrollView$ScrollEndTimerTask;->this$0:Lcom/vkontakte/android/OverScrollView;

    invoke-virtual {v0}, Lcom/vkontakte/android/OverScrollView;->postScrollEnd()V

    .line 209
    return-void
.end method
