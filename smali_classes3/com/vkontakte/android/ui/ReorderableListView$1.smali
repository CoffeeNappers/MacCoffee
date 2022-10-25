.class Lcom/vkontakte/android/ui/ReorderableListView$1;
.super Ljava/lang/Object;
.source "ReorderableListView.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/ReorderableListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/ReorderableListView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/ReorderableListView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/ReorderableListView;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/vkontakte/android/ui/ReorderableListView$1;->this$0:Lcom/vkontakte/android/ui/ReorderableListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .locals 8
    .param p2, "arg1"    # Landroid/view/View;
    .param p3, "pos"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)Z"
        }
    .end annotation

    .prologue
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 96
    iget-object v3, p0, Lcom/vkontakte/android/ui/ReorderableListView$1;->this$0:Lcom/vkontakte/android/ui/ReorderableListView;

    invoke-static {v3, v4}, Lcom/vkontakte/android/ui/ReorderableListView;->access$002(Lcom/vkontakte/android/ui/ReorderableListView;I)I

    .line 97
    iget-object v3, p0, Lcom/vkontakte/android/ui/ReorderableListView$1;->this$0:Lcom/vkontakte/android/ui/ReorderableListView;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/ReorderableListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v3

    instance-of v3, v3, Lcom/vkontakte/android/ui/ReorderableListView$DraggableChecker;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/vkontakte/android/ui/ReorderableListView$1;->this$0:Lcom/vkontakte/android/ui/ReorderableListView;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/ReorderableListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/ui/ReorderableListView$DraggableChecker;

    invoke-interface {v3, p3}, Lcom/vkontakte/android/ui/ReorderableListView$DraggableChecker;->canDragItem(I)Z

    move-result v3

    if-nez v3, :cond_0

    move v3, v4

    .line 116
    :goto_0
    return v3

    .line 101
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/ui/ReorderableListView$1;->this$0:Lcom/vkontakte/android/ui/ReorderableListView;

    iget-object v4, p0, Lcom/vkontakte/android/ui/ReorderableListView$1;->this$0:Lcom/vkontakte/android/ui/ReorderableListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/ReorderableListView;->access$100(Lcom/vkontakte/android/ui/ReorderableListView;)I

    move-result v4

    iget-object v6, p0, Lcom/vkontakte/android/ui/ReorderableListView$1;->this$0:Lcom/vkontakte/android/ui/ReorderableListView;

    invoke-static {v6}, Lcom/vkontakte/android/ui/ReorderableListView;->access$200(Lcom/vkontakte/android/ui/ReorderableListView;)I

    move-result v6

    invoke-virtual {v3, v4, v6}, Lcom/vkontakte/android/ui/ReorderableListView;->pointToPosition(II)I

    move-result v1

    .line 102
    .local v1, "position":I
    iget-object v3, p0, Lcom/vkontakte/android/ui/ReorderableListView$1;->this$0:Lcom/vkontakte/android/ui/ReorderableListView;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/ReorderableListView;->getFirstVisiblePosition()I

    move-result v3

    sub-int v0, v1, v3

    .line 104
    .local v0, "itemNum":I
    iget-object v3, p0, Lcom/vkontakte/android/ui/ReorderableListView$1;->this$0:Lcom/vkontakte/android/ui/ReorderableListView;

    invoke-virtual {v3, v0}, Lcom/vkontakte/android/ui/ReorderableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 105
    .local v2, "selectedView":Landroid/view/View;
    iget-object v3, p0, Lcom/vkontakte/android/ui/ReorderableListView$1;->this$0:Lcom/vkontakte/android/ui/ReorderableListView;

    iget-object v4, p0, Lcom/vkontakte/android/ui/ReorderableListView$1;->this$0:Lcom/vkontakte/android/ui/ReorderableListView;

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/ReorderableListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v4

    invoke-interface {v4, v1}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v6

    invoke-static {v3, v6, v7}, Lcom/vkontakte/android/ui/ReorderableListView;->access$302(Lcom/vkontakte/android/ui/ReorderableListView;J)J

    .line 106
    iget-object v3, p0, Lcom/vkontakte/android/ui/ReorderableListView$1;->this$0:Lcom/vkontakte/android/ui/ReorderableListView;

    iget-object v4, p0, Lcom/vkontakte/android/ui/ReorderableListView$1;->this$0:Lcom/vkontakte/android/ui/ReorderableListView;

    invoke-static {v4, v2}, Lcom/vkontakte/android/ui/ReorderableListView;->access$500(Lcom/vkontakte/android/ui/ReorderableListView;Landroid/view/View;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/ui/ReorderableListView;->access$402(Lcom/vkontakte/android/ui/ReorderableListView;Landroid/graphics/drawable/BitmapDrawable;)Landroid/graphics/drawable/BitmapDrawable;

    .line 107
    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 109
    iget-object v3, p0, Lcom/vkontakte/android/ui/ReorderableListView$1;->this$0:Lcom/vkontakte/android/ui/ReorderableListView;

    invoke-static {v3, v5}, Lcom/vkontakte/android/ui/ReorderableListView;->access$602(Lcom/vkontakte/android/ui/ReorderableListView;Z)Z

    .line 111
    iget-object v3, p0, Lcom/vkontakte/android/ui/ReorderableListView$1;->this$0:Lcom/vkontakte/android/ui/ReorderableListView;

    iget-object v4, p0, Lcom/vkontakte/android/ui/ReorderableListView$1;->this$0:Lcom/vkontakte/android/ui/ReorderableListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/ReorderableListView;->access$300(Lcom/vkontakte/android/ui/ReorderableListView;)J

    move-result-wide v6

    invoke-static {v3, v6, v7}, Lcom/vkontakte/android/ui/ReorderableListView;->access$700(Lcom/vkontakte/android/ui/ReorderableListView;J)V

    .line 112
    iget-object v3, p0, Lcom/vkontakte/android/ui/ReorderableListView$1;->this$0:Lcom/vkontakte/android/ui/ReorderableListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/ReorderableListView;->access$800(Lcom/vkontakte/android/ui/ReorderableListView;)Lcom/vkontakte/android/ui/ReorderableListView$DragListener;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 113
    iget-object v3, p0, Lcom/vkontakte/android/ui/ReorderableListView$1;->this$0:Lcom/vkontakte/android/ui/ReorderableListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/ReorderableListView;->access$800(Lcom/vkontakte/android/ui/ReorderableListView;)Lcom/vkontakte/android/ui/ReorderableListView$DragListener;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/ui/ReorderableListView$1;->this$0:Lcom/vkontakte/android/ui/ReorderableListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/ReorderableListView;->access$300(Lcom/vkontakte/android/ui/ReorderableListView;)J

    move-result-wide v6

    invoke-interface {v3, v6, v7}, Lcom/vkontakte/android/ui/ReorderableListView$DragListener;->onDragStart(J)V

    :cond_1
    move v3, v5

    .line 116
    goto :goto_0
.end method
