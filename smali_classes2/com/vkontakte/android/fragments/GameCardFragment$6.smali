.class Lcom/vkontakte/android/fragments/GameCardFragment$6;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "GameCardFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/GameCardFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/GameCardFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/GameCardFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/GameCardFragment;

    .prologue
    .line 230
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GameCardFragment$6;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 238
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$6;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$300(Lcom/vkontakte/android/fragments/GameCardFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 239
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GameCardFragment$6;->this$0:Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/GameCardFragment;->access$400(Lcom/vkontakte/android/fragments/GameCardFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->smoothScrollToPosition(I)V

    .line 241
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 233
    const/4 v0, 0x1

    return v0
.end method
