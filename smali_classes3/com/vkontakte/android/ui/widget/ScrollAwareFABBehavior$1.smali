.class Lcom/vkontakte/android/ui/widget/ScrollAwareFABBehavior$1;
.super Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;
.source "ScrollAwareFABBehavior.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/widget/ScrollAwareFABBehavior;->onNestedScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/FloatingActionButton;Landroid/view/View;IIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/ScrollAwareFABBehavior;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/widget/ScrollAwareFABBehavior;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/widget/ScrollAwareFABBehavior;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/ScrollAwareFABBehavior$1;->this$0:Lcom/vkontakte/android/ui/widget/ScrollAwareFABBehavior;

    invoke-direct {p0}, Landroid/support/design/widget/FloatingActionButton$OnVisibilityChangedListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onHidden(Landroid/support/design/widget/FloatingActionButton;)V
    .locals 1
    .param p1, "fab"    # Landroid/support/design/widget/FloatingActionButton;

    .prologue
    .line 37
    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/support/design/widget/FloatingActionButton;->setVisibility(I)V

    .line 38
    return-void
.end method
