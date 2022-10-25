.class Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;
.super Landroid/widget/FrameLayout;
.source "StoryViewDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/StoryViewDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FrameLayoutTouchListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/StoryViewDialog;


# direct methods
.method public constructor <init>(Lcom/vk/stories/StoryViewDialog;Landroid/content/Context;)V
    .locals 0
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 431
    iput-object p1, p0, Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;->this$0:Lcom/vk/stories/StoryViewDialog;

    .line 432
    invoke-direct {p0, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 433
    return-void
.end method


# virtual methods
.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 437
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v0, p1}, Lcom/vk/stories/StoryViewDialog;->access$1000(Lcom/vk/stories/StoryViewDialog;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 442
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$FrameLayoutTouchListener;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v0, p1}, Lcom/vk/stories/StoryViewDialog;->access$1000(Lcom/vk/stories/StoryViewDialog;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
