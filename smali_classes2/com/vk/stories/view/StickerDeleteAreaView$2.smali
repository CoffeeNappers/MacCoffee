.class Lcom/vk/stories/view/StickerDeleteAreaView$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "StickerDeleteAreaView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/view/StickerDeleteAreaView;->createAnimatorSet()Landroid/animation/AnimatorSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/view/StickerDeleteAreaView;


# direct methods
.method constructor <init>(Lcom/vk/stories/view/StickerDeleteAreaView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/view/StickerDeleteAreaView;

    .prologue
    .line 156
    iput-object p1, p0, Lcom/vk/stories/view/StickerDeleteAreaView$2;->this$0:Lcom/vk/stories/view/StickerDeleteAreaView;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 159
    invoke-virtual {p0, p1}, Lcom/vk/stories/view/StickerDeleteAreaView$2;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 160
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vk/stories/view/StickerDeleteAreaView$2;->this$0:Lcom/vk/stories/view/StickerDeleteAreaView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/stories/view/StickerDeleteAreaView;->access$002(Lcom/vk/stories/view/StickerDeleteAreaView;Landroid/animation/AnimatorSet;)Landroid/animation/AnimatorSet;

    .line 165
    return-void
.end method
