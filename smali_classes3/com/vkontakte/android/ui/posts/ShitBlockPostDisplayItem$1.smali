.class Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$1;
.super Ljava/lang/Object;
.source "ShitBlockPostDisplayItem.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;->onBindView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;

.field final synthetic val$viewHolder:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;

    iput-object p2, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$1;->val$viewHolder:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I
    .param p6, "oldLeft"    # I
    .param p7, "oldTop"    # I
    .param p8, "oldRight"    # I
    .param p9, "oldBottom"    # I

    .prologue
    .line 70
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$1;->val$viewHolder:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;

    iget-object v3, v3, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->content:Landroid/widget/LinearLayout;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 71
    .local v0, "item":Landroid/view/View;
    const/4 v1, 0x1

    .line 72
    .local v1, "needUpdateLayoutParams":Z
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    instance-of v3, v3, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v3, :cond_0

    .line 73
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 74
    .local v2, "params":Landroid/widget/LinearLayout$LayoutParams;
    iget v3, v2, Landroid/widget/LinearLayout$LayoutParams;->width:I

    sub-int v4, p4, p2

    if-ne v3, v4, :cond_0

    iget v3, v2, Landroid/widget/LinearLayout$LayoutParams;->height:I

    const/4 v4, -0x2

    if-ne v3, v4, :cond_0

    .line 75
    const/4 v1, 0x0

    .line 78
    .end local v2    # "params":Landroid/widget/LinearLayout$LayoutParams;
    :cond_0
    if-eqz v1, :cond_1

    .line 79
    new-instance v3, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$1$1;

    invoke-direct {v3, p0, v0, p4, p2}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$1$1;-><init>(Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$1;Landroid/view/View;II)V

    const-wide/16 v4, 0x0

    invoke-static {v3, v4, v5}, Lcom/vkontakte/android/ViewUtils;->postDelayed(Ljava/lang/Runnable;J)V

    .line 86
    :cond_1
    return-void
.end method
