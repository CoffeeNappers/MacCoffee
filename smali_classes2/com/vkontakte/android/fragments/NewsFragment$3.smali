.class Lcom/vkontakte/android/fragments/NewsFragment$3;
.super Landroid/animation/AnimatorListenerAdapter;
.source "NewsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/NewsFragment;->setNewPostsBtnVisible(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/NewsFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/NewsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 646
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsFragment$3;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 649
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$3;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/NewsFragment;->access$1102(Lcom/vkontakte/android/fragments/NewsFragment;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 650
    return-void
.end method
