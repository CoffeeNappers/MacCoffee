.class Lcom/vk/imageloader/view/zoomable/Attacher$1;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "Attacher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/imageloader/view/zoomable/Attacher;-><init>(Lcom/vk/imageloader/view/VKDraweeView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/imageloader/view/zoomable/Attacher;


# direct methods
.method constructor <init>(Lcom/vk/imageloader/view/zoomable/Attacher;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/imageloader/view/zoomable/Attacher;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/vk/imageloader/view/zoomable/Attacher$1;->this$0:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 2
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 66
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onLongPress(Landroid/view/MotionEvent;)V

    .line 67
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher$1;->this$0:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-static {v0}, Lcom/vk/imageloader/view/zoomable/Attacher;->access$000(Lcom/vk/imageloader/view/zoomable/Attacher;)Landroid/view/View$OnLongClickListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 68
    iget-object v0, p0, Lcom/vk/imageloader/view/zoomable/Attacher$1;->this$0:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-static {v0}, Lcom/vk/imageloader/view/zoomable/Attacher;->access$000(Lcom/vk/imageloader/view/zoomable/Attacher;)Landroid/view/View$OnLongClickListener;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/imageloader/view/zoomable/Attacher$1;->this$0:Lcom/vk/imageloader/view/zoomable/Attacher;

    invoke-virtual {v1}, Lcom/vk/imageloader/view/zoomable/Attacher;->getDraweeView()Lcom/vk/imageloader/view/VKDraweeView;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/view/View$OnLongClickListener;->onLongClick(Landroid/view/View;)Z

    .line 70
    :cond_0
    return-void
.end method
