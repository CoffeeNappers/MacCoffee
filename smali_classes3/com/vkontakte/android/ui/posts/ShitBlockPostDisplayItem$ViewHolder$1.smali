.class Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder$1;
.super Ljava/lang/Object;
.source "ShitBlockPostDisplayItem.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->updateHeight()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;

    .prologue
    .line 238
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 4

    .prologue
    .line 241
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;

    iget-object v3, v3, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v3

    invoke-virtual {v3, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 242
    const/4 v2, 0x0

    .line 243
    .local v2, "maxH":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;

    iget-object v3, v3, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->items:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_0

    .line 244
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;

    iget-object v3, v3, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->items:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;

    .line 245
    .local v1, "item":Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;
    invoke-virtual {v1}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->getItem()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_2

    .line 250
    .end local v1    # "item":Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;
    :cond_0
    const/4 v0, 0x0

    :goto_1
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;

    iget-object v3, v3, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->items:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_1

    .line 251
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;

    iget-object v3, v3, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->items:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;

    .line 252
    .restart local v1    # "item":Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;
    invoke-virtual {v1}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->getItem()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_3

    .line 258
    .end local v1    # "item":Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;
    :cond_1
    const/4 v3, 0x0

    return v3

    .line 248
    .restart local v1    # "item":Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;
    :cond_2
    iget-object v3, v1, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->text:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 243
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 255
    :cond_3
    iget-object v3, v1, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->text:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    iput v2, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 256
    iget-object v3, v1, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->itemView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->requestLayout()V

    .line 250
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method
