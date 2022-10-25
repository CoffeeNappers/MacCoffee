.class Lcom/vkontakte/android/fragments/messages/ChatFragment$11;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ChatFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/messages/ChatFragment;->hideJumpButton()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;Landroid/view/View;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 1764
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$11;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$11;->val$v:Landroid/view/View;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "a"    # Landroid/animation/Animator;

    .prologue
    .line 1766
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$11;->val$v:Landroid/view/View;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 1767
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$11;->val$v:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 1768
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$11;->val$v:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1769
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$11;->val$v:Landroid/view/View;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 1770
    return-void
.end method
