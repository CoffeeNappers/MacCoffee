.class Lcom/vkontakte/android/ui/widget/MenuListView$5;
.super Ljava/lang/Object;
.source "MenuListView.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/widget/MenuListView;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/MenuListView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 462
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$5;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 2

    .prologue
    .line 465
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$5;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getRootView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 466
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$5;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->prepare()V

    .line 467
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$5;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f10002b

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    new-instance v1, Lcom/vkontakte/android/ui/widget/MenuListView$5$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ui/widget/MenuListView$5$1;-><init>(Lcom/vkontakte/android/ui/widget/MenuListView$5;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V

    .line 479
    const/4 v0, 0x1

    return v0
.end method
