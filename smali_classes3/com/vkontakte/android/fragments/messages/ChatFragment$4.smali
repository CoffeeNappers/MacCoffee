.class Lcom/vkontakte/android/fragments/messages/ChatFragment$4;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "ChatFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/messages/ChatFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 1029
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 4
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    .prologue
    const/4 v0, 0x1

    .line 1032
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result v1

    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    mul-float/2addr v2, v3

    cmpl-float v1, v1, v2

    if-lez v1, :cond_1

    .line 1033
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->isShowingTime()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1034
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->toggleTime()V

    .line 1041
    :goto_0
    return v0

    .line 1036
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->isShowingTime()Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x0

    cmpl-float v1, p3, v1

    if-lez v1, :cond_1

    .line 1037
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->toggleTime()V

    goto :goto_0

    .line 1041
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
