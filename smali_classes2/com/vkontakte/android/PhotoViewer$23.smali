.class Lcom/vkontakte/android/PhotoViewer$23;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PhotoViewer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/PhotoViewer;->toggleControls()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/PhotoViewer;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/PhotoViewer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 1099
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer$23;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 1102
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$23;->this$0:Lcom/vkontakte/android/PhotoViewer;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/PhotoViewer;->access$3102(Lcom/vkontakte/android/PhotoViewer;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 1103
    return-void
.end method
