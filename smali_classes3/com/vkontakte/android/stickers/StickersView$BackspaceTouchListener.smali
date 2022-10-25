.class Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;
.super Ljava/lang/Object;
.source "StickersView.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/stickers/StickersView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BackspaceTouchListener"
.end annotation


# instance fields
.field private final BIG_PERIOD:J

.field private final DELETE_MSG:I

.field private final PERIOD:J

.field private final handler:Landroid/os/Handler;

.field private final listener:Lcom/vkontakte/android/stickers/StickersView$Listener;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/stickers/StickersView$Listener;)V
    .locals 2
    .param p1, "listener"    # Lcom/vkontakte/android/stickers/StickersView$Listener;

    .prologue
    .line 377
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 363
    const-wide/16 v0, 0x46

    iput-wide v0, p0, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;->PERIOD:J

    .line 364
    const-wide/16 v0, 0x12c

    iput-wide v0, p0, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;->BIG_PERIOD:J

    .line 365
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;->DELETE_MSG:I

    .line 367
    new-instance v0, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener$1;-><init>(Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;->handler:Landroid/os/Handler;

    .line 378
    iput-object p1, p0, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;->listener:Lcom/vkontakte/android/stickers/StickersView$Listener;

    .line 379
    return-void
.end method

.method static synthetic access$500(Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;)Lcom/vkontakte/android/stickers/StickersView$Listener;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;

    .prologue
    .line 361
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;->listener:Lcom/vkontakte/android/stickers/StickersView$Listener;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;

    .prologue
    .line 361
    invoke-direct {p0}, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;->sendDeleteMessage()V

    return-void
.end method

.method private sendDeleteMessage()V
    .locals 4

    .prologue
    .line 382
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;->handler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    const-wide/16 v2, 0x46

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 383
    return-void
.end method

.method private sendDeleteMessageBigDelay()V
    .locals 4

    .prologue
    .line 386
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;->handler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 387
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v3, 0x1

    .line 391
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    and-int/lit16 v0, v1, 0xff

    .line 393
    .local v0, "action":I
    if-eqz v0, :cond_0

    const/4 v1, 0x5

    if-ne v0, v1, :cond_2

    .line 394
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;->sendDeleteMessageBigDelay()V

    .line 400
    :cond_1
    :goto_0
    return v3

    .line 395
    :cond_2
    if-eq v0, v3, :cond_3

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 396
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;->handler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 397
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;->listener:Lcom/vkontakte/android/stickers/StickersView$Listener;

    invoke-interface {v1}, Lcom/vkontakte/android/stickers/StickersView$Listener;->onBackspace()V

    goto :goto_0
.end method
