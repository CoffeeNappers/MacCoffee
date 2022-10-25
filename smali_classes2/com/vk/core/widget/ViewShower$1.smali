.class Lcom/vk/core/widget/ViewShower$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ViewShower.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/core/widget/ViewShower;->show()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/core/widget/ViewShower;


# direct methods
.method constructor <init>(Lcom/vk/core/widget/ViewShower;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/core/widget/ViewShower;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/vk/core/widget/ViewShower$1;->this$0:Lcom/vk/core/widget/ViewShower;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/vk/core/widget/ViewShower$1;->this$0:Lcom/vk/core/widget/ViewShower;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/core/widget/ViewShower;->access$002(Lcom/vk/core/widget/ViewShower;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 55
    return-void
.end method
