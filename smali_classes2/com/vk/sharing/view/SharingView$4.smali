.class Lcom/vk/sharing/view/SharingView$4;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SharingView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/sharing/view/SharingView;->animateShow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/sharing/view/SharingView;


# direct methods
.method constructor <init>(Lcom/vk/sharing/view/SharingView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/sharing/view/SharingView;

    .prologue
    .line 419
    iput-object p1, p0, Lcom/vk/sharing/view/SharingView$4;->this$0:Lcom/vk/sharing/view/SharingView;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 423
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView$4;->this$0:Lcom/vk/sharing/view/SharingView;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/vk/sharing/view/SharingView;->animating:Z

    .line 424
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView$4;->this$0:Lcom/vk/sharing/view/SharingView;

    iget-object v0, v0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    if-eqz v0, :cond_0

    .line 425
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView$4;->this$0:Lcom/vk/sharing/view/SharingView;

    iget-object v0, v0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    invoke-interface {v0}, Lcom/vk/sharing/view/SharingView$Presenter;->onViewShown()V

    .line 427
    :cond_0
    return-void
.end method
