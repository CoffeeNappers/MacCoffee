.class Lcom/vk/stories/view/VerticalPagerIndicator$3;
.super Landroid/animation/AnimatorListenerAdapter;
.source "VerticalPagerIndicator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/view/VerticalPagerIndicator;->animateScrollOffsetTo(F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/view/VerticalPagerIndicator;


# direct methods
.method constructor <init>(Lcom/vk/stories/view/VerticalPagerIndicator;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/view/VerticalPagerIndicator;

    .prologue
    .line 191
    iput-object p1, p0, Lcom/vk/stories/view/VerticalPagerIndicator$3;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 194
    iget-object v0, p0, Lcom/vk/stories/view/VerticalPagerIndicator$3;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/stories/view/VerticalPagerIndicator;->access$602(Lcom/vk/stories/view/VerticalPagerIndicator;Landroid/animation/ObjectAnimator;)Landroid/animation/ObjectAnimator;

    .line 195
    return-void
.end method
