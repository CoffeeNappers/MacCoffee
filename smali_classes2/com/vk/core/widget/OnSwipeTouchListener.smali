.class public Lcom/vk/core/widget/OnSwipeTouchListener;
.super Lcom/vk/core/widget/OnTouchDownListener;
.source "OnSwipeTouchListener.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/core/widget/OnSwipeTouchListener$OnSwipeGestureListener;,
        Lcom/vk/core/widget/OnSwipeTouchListener$GestureListener;
    }
.end annotation


# static fields
.field private static final DEFAULT_SWIPE_THRESHOLD:I


# instance fields
.field private final gestureDetector:Landroid/view/GestureDetector;

.field private gestureListener:Lcom/vk/core/widget/OnSwipeTouchListener$OnSwipeGestureListener;

.field private final swipeThreshold:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    const/16 v0, 0x58

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/core/widget/OnSwipeTouchListener;->DEFAULT_SWIPE_THRESHOLD:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILcom/vk/core/widget/OnTouchDownListener$DownUpListener;)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "swipeThreshold"    # I
    .param p3, "downUpListener"    # Lcom/vk/core/widget/OnTouchDownListener$DownUpListener;

    .prologue
    .line 26
    invoke-direct {p0, p3}, Lcom/vk/core/widget/OnTouchDownListener;-><init>(Lcom/vk/core/widget/OnTouchDownListener$DownUpListener;)V

    .line 27
    iput p2, p0, Lcom/vk/core/widget/OnSwipeTouchListener;->swipeThreshold:I

    .line 28
    new-instance v0, Landroid/view/GestureDetector;

    new-instance v1, Lcom/vk/core/widget/OnSwipeTouchListener$GestureListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/vk/core/widget/OnSwipeTouchListener$GestureListener;-><init>(Lcom/vk/core/widget/OnSwipeTouchListener;Lcom/vk/core/widget/OnSwipeTouchListener$1;)V

    invoke-direct {v0, p1, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/vk/core/widget/OnSwipeTouchListener;->gestureDetector:Landroid/view/GestureDetector;

    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/vk/core/widget/OnTouchDownListener$DownUpListener;)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "downUpListener"    # Lcom/vk/core/widget/OnTouchDownListener$DownUpListener;

    .prologue
    .line 20
    invoke-direct {p0, p2}, Lcom/vk/core/widget/OnTouchDownListener;-><init>(Lcom/vk/core/widget/OnTouchDownListener$DownUpListener;)V

    .line 21
    sget v0, Lcom/vk/core/widget/OnSwipeTouchListener;->DEFAULT_SWIPE_THRESHOLD:I

    iput v0, p0, Lcom/vk/core/widget/OnSwipeTouchListener;->swipeThreshold:I

    .line 22
    new-instance v0, Landroid/view/GestureDetector;

    new-instance v1, Lcom/vk/core/widget/OnSwipeTouchListener$GestureListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/vk/core/widget/OnSwipeTouchListener$GestureListener;-><init>(Lcom/vk/core/widget/OnSwipeTouchListener;Lcom/vk/core/widget/OnSwipeTouchListener$1;)V

    invoke-direct {v0, p1, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/vk/core/widget/OnSwipeTouchListener;->gestureDetector:Landroid/view/GestureDetector;

    .line 23
    return-void
.end method

.method static synthetic access$100(Lcom/vk/core/widget/OnSwipeTouchListener;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/widget/OnSwipeTouchListener;

    .prologue
    .line 11
    iget v0, p0, Lcom/vk/core/widget/OnSwipeTouchListener;->swipeThreshold:I

    return v0
.end method

.method static synthetic access$200(Lcom/vk/core/widget/OnSwipeTouchListener;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/widget/OnSwipeTouchListener;

    .prologue
    .line 11
    invoke-direct {p0}, Lcom/vk/core/widget/OnSwipeTouchListener;->onSwipeRight()V

    return-void
.end method

.method static synthetic access$300(Lcom/vk/core/widget/OnSwipeTouchListener;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/widget/OnSwipeTouchListener;

    .prologue
    .line 11
    invoke-direct {p0}, Lcom/vk/core/widget/OnSwipeTouchListener;->onSwipeLeft()V

    return-void
.end method

.method static synthetic access$400(Lcom/vk/core/widget/OnSwipeTouchListener;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/widget/OnSwipeTouchListener;

    .prologue
    .line 11
    invoke-direct {p0}, Lcom/vk/core/widget/OnSwipeTouchListener;->onSwipeBottom()V

    return-void
.end method

.method static synthetic access$500(Lcom/vk/core/widget/OnSwipeTouchListener;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/core/widget/OnSwipeTouchListener;

    .prologue
    .line 11
    invoke-direct {p0}, Lcom/vk/core/widget/OnSwipeTouchListener;->onSwipeTop()V

    return-void
.end method

.method private onSwipeBottom()V
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/vk/core/widget/OnSwipeTouchListener;->gestureListener:Lcom/vk/core/widget/OnSwipeTouchListener$OnSwipeGestureListener;

    if-eqz v0, :cond_0

    .line 102
    iget-object v0, p0, Lcom/vk/core/widget/OnSwipeTouchListener;->gestureListener:Lcom/vk/core/widget/OnSwipeTouchListener$OnSwipeGestureListener;

    invoke-interface {v0}, Lcom/vk/core/widget/OnSwipeTouchListener$OnSwipeGestureListener;->onSwipeBottom()V

    .line 104
    :cond_0
    return-void
.end method

.method private onSwipeLeft()V
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vk/core/widget/OnSwipeTouchListener;->gestureListener:Lcom/vk/core/widget/OnSwipeTouchListener$OnSwipeGestureListener;

    if-eqz v0, :cond_0

    .line 90
    iget-object v0, p0, Lcom/vk/core/widget/OnSwipeTouchListener;->gestureListener:Lcom/vk/core/widget/OnSwipeTouchListener$OnSwipeGestureListener;

    invoke-interface {v0}, Lcom/vk/core/widget/OnSwipeTouchListener$OnSwipeGestureListener;->onSwipeLeft()V

    .line 92
    :cond_0
    return-void
.end method

.method private onSwipeRight()V
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/vk/core/widget/OnSwipeTouchListener;->gestureListener:Lcom/vk/core/widget/OnSwipeTouchListener$OnSwipeGestureListener;

    if-eqz v0, :cond_0

    .line 84
    iget-object v0, p0, Lcom/vk/core/widget/OnSwipeTouchListener;->gestureListener:Lcom/vk/core/widget/OnSwipeTouchListener$OnSwipeGestureListener;

    invoke-interface {v0}, Lcom/vk/core/widget/OnSwipeTouchListener$OnSwipeGestureListener;->onSwipeRight()V

    .line 86
    :cond_0
    return-void
.end method

.method private onSwipeTop()V
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/vk/core/widget/OnSwipeTouchListener;->gestureListener:Lcom/vk/core/widget/OnSwipeTouchListener$OnSwipeGestureListener;

    if-eqz v0, :cond_0

    .line 96
    iget-object v0, p0, Lcom/vk/core/widget/OnSwipeTouchListener;->gestureListener:Lcom/vk/core/widget/OnSwipeTouchListener$OnSwipeGestureListener;

    invoke-interface {v0}, Lcom/vk/core/widget/OnSwipeTouchListener$OnSwipeGestureListener;->onSwipeTop()V

    .line 98
    :cond_0
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 37
    invoke-super {p0, p1, p2}, Lcom/vk/core/widget/OnTouchDownListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 38
    iget-object v0, p0, Lcom/vk/core/widget/OnSwipeTouchListener;->gestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 39
    const/4 v0, 0x1

    return v0
.end method

.method public setGestureListener(Lcom/vk/core/widget/OnSwipeTouchListener$OnSwipeGestureListener;)V
    .locals 0
    .param p1, "gestureListener"    # Lcom/vk/core/widget/OnSwipeTouchListener$OnSwipeGestureListener;

    .prologue
    .line 32
    iput-object p1, p0, Lcom/vk/core/widget/OnSwipeTouchListener;->gestureListener:Lcom/vk/core/widget/OnSwipeTouchListener$OnSwipeGestureListener;

    .line 33
    return-void
.end method
