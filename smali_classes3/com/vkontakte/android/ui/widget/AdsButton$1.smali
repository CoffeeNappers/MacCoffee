.class Lcom/vkontakte/android/ui/widget/AdsButton$1;
.super Ljava/lang/Object;
.source "AdsButton.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/widget/AdsButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/AdsButton;

.field final synthetic val$navigationHeight:I

.field final synthetic val$rect:Landroid/graphics/Rect;

.field final synthetic val$rootRect:Landroid/graphics/Rect;

.field final synthetic val$rootView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/widget/AdsButton;Landroid/graphics/Rect;Landroid/view/View;Landroid/graphics/Rect;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/widget/AdsButton;

    .prologue
    .line 59
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/AdsButton$1;->this$0:Lcom/vkontakte/android/ui/widget/AdsButton;

    iput-object p2, p0, Lcom/vkontakte/android/ui/widget/AdsButton$1;->val$rect:Landroid/graphics/Rect;

    iput-object p3, p0, Lcom/vkontakte/android/ui/widget/AdsButton$1;->val$rootView:Landroid/view/View;

    iput-object p4, p0, Lcom/vkontakte/android/ui/widget/AdsButton$1;->val$rootRect:Landroid/graphics/Rect;

    iput p5, p0, Lcom/vkontakte/android/ui/widget/AdsButton$1;->val$navigationHeight:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton$1;->this$0:Lcom/vkontakte/android/ui/widget/AdsButton;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/AdsButton;->access$000(Lcom/vkontakte/android/ui/widget/AdsButton;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 63
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton$1;->this$0:Lcom/vkontakte/android/ui/widget/AdsButton;

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/AdsButton$1;->val$rect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/AdsButton;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 64
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton$1;->val$rootView:Landroid/view/View;

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/AdsButton$1;->val$rootRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 65
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton$1;->val$rootRect:Landroid/graphics/Rect;

    iget v1, p0, Lcom/vkontakte/android/ui/widget/AdsButton$1;->val$navigationHeight:I

    neg-int v1, v1

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Rect;->offset(II)V

    .line 66
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton$1;->this$0:Lcom/vkontakte/android/ui/widget/AdsButton;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/AdsButton;->getMeasuredHeight()I

    move-result v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/AdsButton$1;->val$rect:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton$1;->val$rootRect:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/AdsButton$1;->val$rect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->contains(Landroid/graphics/Rect;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton$1;->this$0:Lcom/vkontakte/android/ui/widget/AdsButton;

    invoke-static {v0, v2}, Lcom/vkontakte/android/ui/widget/AdsButton;->access$002(Lcom/vkontakte/android/ui/widget/AdsButton;Z)Z

    .line 68
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/AdsButton$1;->this$0:Lcom/vkontakte/android/ui/widget/AdsButton;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/AdsButton;->access$100(Lcom/vkontakte/android/ui/widget/AdsButton;)V

    .line 71
    :cond_0
    const/4 v0, 0x1

    return v0
.end method
