.class Lcom/vkontakte/android/ui/SwipeDismissListViewTouchListener$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SwipeDismissListViewTouchListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/SwipeDismissListViewTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/SwipeDismissListViewTouchListener;

.field final synthetic val$downPosition:I

.field final synthetic val$downView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/SwipeDismissListViewTouchListener;Landroid/view/View;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/SwipeDismissListViewTouchListener;

    .prologue
    .line 269
    iput-object p1, p0, Lcom/vkontakte/android/ui/SwipeDismissListViewTouchListener$2;->this$0:Lcom/vkontakte/android/ui/SwipeDismissListViewTouchListener;

    iput-object p2, p0, Lcom/vkontakte/android/ui/SwipeDismissListViewTouchListener$2;->val$downView:Landroid/view/View;

    iput p3, p0, Lcom/vkontakte/android/ui/SwipeDismissListViewTouchListener$2;->val$downPosition:I

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 272
    iget-object v0, p0, Lcom/vkontakte/android/ui/SwipeDismissListViewTouchListener$2;->this$0:Lcom/vkontakte/android/ui/SwipeDismissListViewTouchListener;

    iget-object v1, p0, Lcom/vkontakte/android/ui/SwipeDismissListViewTouchListener$2;->val$downView:Landroid/view/View;

    iget v2, p0, Lcom/vkontakte/android/ui/SwipeDismissListViewTouchListener$2;->val$downPosition:I

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/ui/SwipeDismissListViewTouchListener;->access$000(Lcom/vkontakte/android/ui/SwipeDismissListViewTouchListener;Landroid/view/View;I)V

    .line 273
    return-void
.end method
