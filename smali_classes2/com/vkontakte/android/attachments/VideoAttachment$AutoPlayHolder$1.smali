.class Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$1;
.super Ljava/lang/Object;
.source "VideoAttachment.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->animateWrap(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

.field final synthetic val$showPlay:Z

.field final synthetic val$showProgress:Z

.field final synthetic val$size:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;ZZI)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    .prologue
    .line 1126
    iput-object p1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$1;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    iput-boolean p2, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$1;->val$showPlay:Z

    iput-boolean p3, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$1;->val$showProgress:Z

    iput p4, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$1;->val$size:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 1137
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$1;->val$showPlay:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$1;->val$showProgress:Z

    if-nez v0, :cond_0

    .line 1138
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$1;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mIconWrap:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1140
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$1;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$1;->val$showPlay:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$1;->val$showProgress:Z

    if-eqz v0, :cond_2

    :cond_1
    iget v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$1;->val$size:I

    :goto_0
    invoke-static {v1, v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->access$1800(Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;I)V

    .line 1141
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$1;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->resize:Landroid/view/animation/Animation;

    .line 1142
    return-void

    .line 1140
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 1145
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 3
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    const/4 v0, 0x0

    .line 1129
    iget-boolean v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$1;->val$showPlay:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$1;->val$showProgress:Z

    if-eqz v1, :cond_1

    .line 1130
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$1;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->mIconWrap:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 1132
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$1;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    iget-boolean v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$1;->val$showPlay:Z

    if-nez v2, :cond_2

    iget-boolean v2, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$1;->val$showProgress:Z

    if-eqz v2, :cond_3

    :cond_2
    :goto_0
    invoke-static {v1, v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->access$1800(Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;I)V

    .line 1133
    return-void

    .line 1132
    :cond_3
    iget v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$1;->val$size:I

    goto :goto_0
.end method
