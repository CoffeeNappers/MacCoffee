.class Lcom/vk/attachpicker/PhotoVideoAttachActivity$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PhotoVideoAttachActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/PhotoVideoAttachActivity;->hideCancelButton()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/attachpicker/PhotoVideoAttachActivity;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/PhotoVideoAttachActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/PhotoVideoAttachActivity;

    .prologue
    .line 220
    iput-object p1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity$2;->this$0:Lcom/vk/attachpicker/PhotoVideoAttachActivity;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 223
    iget-object v0, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity$2;->this$0:Lcom/vk/attachpicker/PhotoVideoAttachActivity;

    invoke-static {v0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->access$000(Lcom/vk/attachpicker/PhotoVideoAttachActivity;)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 224
    return-void
.end method
