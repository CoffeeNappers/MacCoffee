.class Lcom/vkontakte/android/attachments/PollAttachment$7;
.super Ljava/lang/Object;
.source "PollAttachment.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/attachments/PollAttachment;->updateAttachViewProgress(Landroid/view/View;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/attachments/PollAttachment;

.field final synthetic val$av:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/attachments/PollAttachment;Landroid/view/View;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/attachments/PollAttachment;

    .prologue
    .line 284
    iput-object p1, p0, Lcom/vkontakte/android/attachments/PollAttachment$7;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iput-object p2, p0, Lcom/vkontakte/android/attachments/PollAttachment$7;->val$av:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1
    .param p1, "animation"    # Landroid/animation/ValueAnimator;

    .prologue
    .line 287
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PollAttachment$7;->val$av:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 288
    return-void
.end method
