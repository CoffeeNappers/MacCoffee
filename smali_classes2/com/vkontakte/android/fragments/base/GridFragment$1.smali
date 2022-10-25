.class Lcom/vkontakte/android/fragments/base/GridFragment$1;
.super Ljava/lang/Object;
.source "GridFragment.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/base/GridFragment;->updateLayoutManager(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/base/GridFragment;

.field final synthetic val$force:Z

.field final synthetic val$oldWidth:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/base/GridFragment;IZ)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/base/GridFragment;

    .prologue
    .line 72
    .local p0, "this":Lcom/vkontakte/android/fragments/base/GridFragment$1;, "Lcom/vkontakte/android/fragments/base/GridFragment$1;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/base/GridFragment$1;->this$0:Lcom/vkontakte/android/fragments/base/GridFragment;

    iput p2, p0, Lcom/vkontakte/android/fragments/base/GridFragment$1;->val$oldWidth:I

    iput-boolean p3, p0, Lcom/vkontakte/android/fragments/base/GridFragment$1;->val$force:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 3

    .prologue
    .line 75
    .local p0, "this":Lcom/vkontakte/android/fragments/base/GridFragment$1;, "Lcom/vkontakte/android/fragments/base/GridFragment$1;"
    iget-object v1, p0, Lcom/vkontakte/android/fragments/base/GridFragment$1;->this$0:Lcom/vkontakte/android/fragments/base/GridFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/base/GridFragment;->access$000(Lcom/vkontakte/android/fragments/base/GridFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/vkontakte/android/fragments/base/GridFragment$1;->this$0:Lcom/vkontakte/android/fragments/base/GridFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/base/GridFragment;->access$100(Lcom/vkontakte/android/fragments/base/GridFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v1

    invoke-virtual {v1}, Lme/grishka/appkit/views/UsableRecyclerView;->getWidth()I

    move-result v1

    iget v2, p0, Lcom/vkontakte/android/fragments/base/GridFragment$1;->val$oldWidth:I

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/base/GridFragment$1;->this$0:Lcom/vkontakte/android/fragments/base/GridFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/base/GridFragment;->access$200(Lcom/vkontakte/android/fragments/base/GridFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v1

    invoke-virtual {v1}, Lme/grishka/appkit/views/UsableRecyclerView;->getWidth()I

    move-result v1

    if-lez v1, :cond_2

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/base/GridFragment$1;->val$force:Z

    if-eqz v1, :cond_2

    .line 76
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/base/GridFragment$1;->this$0:Lcom/vkontakte/android/fragments/base/GridFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/base/GridFragment;->access$300(Lcom/vkontakte/android/fragments/base/GridFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v1

    invoke-virtual {v1}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/GridLayoutManager;

    .line 77
    .local v0, "layoutManager":Landroid/support/v7/widget/GridLayoutManager;
    if-eqz v0, :cond_1

    .line 78
    iget-object v1, p0, Lcom/vkontakte/android/fragments/base/GridFragment$1;->this$0:Lcom/vkontakte/android/fragments/base/GridFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/base/GridFragment;->getColumnsCount()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/GridLayoutManager;->setSpanCount(I)V

    .line 79
    invoke-virtual {v0}, Landroid/support/v7/widget/GridLayoutManager;->requestLayout()V

    .line 81
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/base/GridFragment$1;->this$0:Lcom/vkontakte/android/fragments/base/GridFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/base/GridFragment;->access$400(Lcom/vkontakte/android/fragments/base/GridFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v1

    invoke-virtual {v1}, Lme/grishka/appkit/views/UsableRecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 83
    .end local v0    # "layoutManager":Landroid/support/v7/widget/GridLayoutManager;
    :cond_2
    return-void
.end method
