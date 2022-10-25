.class Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;
.super Landroid/os/Handler;
.source "StoriesGestureDetectorCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GestureHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;


# direct methods
.method constructor <init>(Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;)V
    .locals 0

    .prologue
    .line 89
    iput-object p1, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;->this$0:Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;

    .line 90
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 91
    return-void
.end method

.method constructor <init>(Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;Landroid/os/Handler;)V
    .locals 1
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    .line 93
    iput-object p1, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;->this$0:Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;

    .line 94
    invoke-virtual {p2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 95
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 99
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 120
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unknown message "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 101
    :pswitch_0
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;->this$0:Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    iget-object v1, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;->this$0:Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;

    iget-object v1, v1, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    invoke-interface {v0, v1}, Landroid/view/GestureDetector$OnGestureListener;->onShowPress(Landroid/view/MotionEvent;)V

    .line 122
    :cond_0
    :goto_0
    return-void

    .line 105
    :pswitch_1
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;->this$0:Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;

    invoke-virtual {v0}, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->dispatchLongPress()V

    goto :goto_0

    .line 110
    :pswitch_2
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;->this$0:Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    if-eqz v0, :cond_0

    .line 111
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;->this$0:Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;

    iget-boolean v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mStillDown:Z

    if-nez v0, :cond_1

    .line 112
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;->this$0:Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;

    iget-object v0, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    iget-object v1, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;->this$0:Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;

    iget-object v1, v1, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    invoke-interface {v0, v1}, Landroid/view/GestureDetector$OnDoubleTapListener;->onSingleTapConfirmed(Landroid/view/MotionEvent;)Z

    goto :goto_0

    .line 114
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;->this$0:Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;->mDeferConfirmSingleTap:Z

    goto :goto_0

    .line 99
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
