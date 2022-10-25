.class final Lcom/vk/core/widget/OnSwipeTouchListener$GestureListener;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "OnSwipeTouchListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/widget/OnSwipeTouchListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "GestureListener"
.end annotation


# static fields
.field private static final SWIPE_VELOCITY_THRESHOLD:I = 0x64


# instance fields
.field final synthetic this$0:Lcom/vk/core/widget/OnSwipeTouchListener;


# direct methods
.method private constructor <init>(Lcom/vk/core/widget/OnSwipeTouchListener;)V
    .locals 0

    .prologue
    .line 42
    iput-object p1, p0, Lcom/vk/core/widget/OnSwipeTouchListener$GestureListener;->this$0:Lcom/vk/core/widget/OnSwipeTouchListener;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/core/widget/OnSwipeTouchListener;Lcom/vk/core/widget/OnSwipeTouchListener$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/core/widget/OnSwipeTouchListener;
    .param p2, "x1"    # Lcom/vk/core/widget/OnSwipeTouchListener$1;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/vk/core/widget/OnSwipeTouchListener$GestureListener;-><init>(Lcom/vk/core/widget/OnSwipeTouchListener;)V

    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 48
    const/4 v0, 0x1

    return v0
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 8
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    const/high16 v7, 0x42c80000    # 100.0f

    const/4 v6, 0x0

    .line 53
    const/4 v3, 0x0

    .line 55
    .local v3, "result":Z
    :try_start_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    sub-float v1, v4, v5

    .line 56
    .local v1, "diffY":F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    sub-float v0, v4, v5

    .line 57
    .local v0, "diffX":F
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v4

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_3

    .line 58
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iget-object v5, p0, Lcom/vk/core/widget/OnSwipeTouchListener$GestureListener;->this$0:Lcom/vk/core/widget/OnSwipeTouchListener;

    invoke-static {v5}, Lcom/vk/core/widget/OnSwipeTouchListener;->access$100(Lcom/vk/core/widget/OnSwipeTouchListener;)I

    move-result v5

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_0

    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpl-float v4, v4, v7

    if-lez v4, :cond_0

    .line 59
    cmpl-float v4, v0, v6

    if-lez v4, :cond_2

    .line 60
    iget-object v4, p0, Lcom/vk/core/widget/OnSwipeTouchListener$GestureListener;->this$0:Lcom/vk/core/widget/OnSwipeTouchListener;

    invoke-static {v4}, Lcom/vk/core/widget/OnSwipeTouchListener;->access$200(Lcom/vk/core/widget/OnSwipeTouchListener;)V

    .line 65
    :cond_0
    :goto_0
    const/4 v3, 0x1

    .line 73
    :cond_1
    :goto_1
    const/4 v3, 0x1

    .line 78
    .end local v0    # "diffX":F
    .end local v1    # "diffY":F
    :goto_2
    return v3

    .line 62
    .restart local v0    # "diffX":F
    .restart local v1    # "diffY":F
    :cond_2
    iget-object v4, p0, Lcom/vk/core/widget/OnSwipeTouchListener$GestureListener;->this$0:Lcom/vk/core/widget/OnSwipeTouchListener;

    invoke-static {v4}, Lcom/vk/core/widget/OnSwipeTouchListener;->access$300(Lcom/vk/core/widget/OnSwipeTouchListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 75
    .end local v0    # "diffX":F
    .end local v1    # "diffY":F
    :catch_0
    move-exception v2

    .line 76
    .local v2, "exception":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    .line 66
    .end local v2    # "exception":Ljava/lang/Exception;
    .restart local v0    # "diffX":F
    .restart local v1    # "diffY":F
    :cond_3
    :try_start_1
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iget-object v5, p0, Lcom/vk/core/widget/OnSwipeTouchListener$GestureListener;->this$0:Lcom/vk/core/widget/OnSwipeTouchListener;

    invoke-static {v5}, Lcom/vk/core/widget/OnSwipeTouchListener;->access$100(Lcom/vk/core/widget/OnSwipeTouchListener;)I

    move-result v5

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_1

    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpl-float v4, v4, v7

    if-lez v4, :cond_1

    .line 67
    cmpl-float v4, v1, v6

    if-lez v4, :cond_4

    .line 68
    iget-object v4, p0, Lcom/vk/core/widget/OnSwipeTouchListener$GestureListener;->this$0:Lcom/vk/core/widget/OnSwipeTouchListener;

    invoke-static {v4}, Lcom/vk/core/widget/OnSwipeTouchListener;->access$400(Lcom/vk/core/widget/OnSwipeTouchListener;)V

    goto :goto_1

    .line 70
    :cond_4
    iget-object v4, p0, Lcom/vk/core/widget/OnSwipeTouchListener$GestureListener;->this$0:Lcom/vk/core/widget/OnSwipeTouchListener;

    invoke-static {v4}, Lcom/vk/core/widget/OnSwipeTouchListener;->access$500(Lcom/vk/core/widget/OnSwipeTouchListener;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method
