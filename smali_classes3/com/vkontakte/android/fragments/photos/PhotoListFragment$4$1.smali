.class Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PhotoListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->onPreDraw()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;

    .prologue
    .line 290
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4$1;->this$1:Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 293
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4$1;->this$1:Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->access$1802(Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 294
    return-void
.end method
