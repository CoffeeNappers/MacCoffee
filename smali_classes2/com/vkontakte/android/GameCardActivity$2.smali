.class Lcom/vkontakte/android/GameCardActivity$2;
.super Ljava/lang/Object;
.source "GameCardActivity.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/GameCardActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/GameCardActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/GameCardActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/GameCardActivity;

    .prologue
    .line 225
    iput-object p1, p0, Lcom/vkontakte/android/GameCardActivity$2;->this$0:Lcom/vkontakte/android/GameCardActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onPreDraw$0()V
    .locals 1

    .prologue
    .line 229
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity$2;->this$0:Lcom/vkontakte/android/GameCardActivity;

    invoke-static {v0}, Lcom/vkontakte/android/GameCardActivity;->access$300(Lcom/vkontakte/android/GameCardActivity;)Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout;->smoothToTop()V

    return-void
.end method

.method public onPreDraw()Z
    .locals 2

    .prologue
    .line 228
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity$2;->this$0:Lcom/vkontakte/android/GameCardActivity;

    invoke-static {v0}, Lcom/vkontakte/android/GameCardActivity;->access$300(Lcom/vkontakte/android/GameCardActivity;)Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 229
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity$2;->this$0:Lcom/vkontakte/android/GameCardActivity;

    invoke-static {v0}, Lcom/vkontakte/android/GameCardActivity;->access$300(Lcom/vkontakte/android/GameCardActivity;)Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/GameCardActivity$2$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/GameCardActivity$2;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout;->post(Ljava/lang/Runnable;)Z

    .line 230
    const/4 v0, 0x1

    return v0
.end method
