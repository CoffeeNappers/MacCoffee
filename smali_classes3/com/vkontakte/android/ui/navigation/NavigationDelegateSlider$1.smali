.class Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider$1;
.super Ljava/lang/Object;
.source "NavigationDelegateSlider.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->initializeLeftMenu(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider$1;->this$0:Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider$1;->this$0:Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;

    iget-object v0, v0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->menuList:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 46
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider$1;->this$0:Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;

    iget-object v0, v0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateSlider;->menuList:Lcom/vkontakte/android/ui/widget/MenuListView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->setExpansion(F)V

    .line 47
    const/4 v0, 0x1

    return v0
.end method
