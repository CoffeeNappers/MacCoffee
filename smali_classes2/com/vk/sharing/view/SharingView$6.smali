.class Lcom/vk/sharing/view/SharingView$6;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SharingView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/sharing/view/SharingView;->animateHide()V
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
    .line 459
    iput-object p1, p0, Lcom/vk/sharing/view/SharingView$6;->this$0:Lcom/vk/sharing/view/SharingView;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 463
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView$6;->this$0:Lcom/vk/sharing/view/SharingView;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/vk/sharing/view/SharingView;->animating:Z

    .line 464
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView$6;->this$0:Lcom/vk/sharing/view/SharingView;

    iget-object v0, v0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    if-eqz v0, :cond_0

    .line 465
    iget-object v0, p0, Lcom/vk/sharing/view/SharingView$6;->this$0:Lcom/vk/sharing/view/SharingView;

    iget-object v0, v0, Lcom/vk/sharing/view/SharingView;->presenter:Lcom/vk/sharing/view/SharingView$Presenter;

    invoke-interface {v0}, Lcom/vk/sharing/view/SharingView$Presenter;->onViewHidden()V

    .line 467
    :cond_0
    return-void
.end method
