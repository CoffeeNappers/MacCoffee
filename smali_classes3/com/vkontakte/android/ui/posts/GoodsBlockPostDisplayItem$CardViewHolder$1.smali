.class Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder$1;
.super Ljava/lang/Object;
.source "GoodsBlockPostDisplayItem.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->onBind(Lcom/vkontakte/android/attachments/ShitAttachment$Card;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

.field final synthetic val$card:Lcom/vkontakte/android/attachments/ShitAttachment$Card;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;Lcom/vkontakte/android/attachments/ShitAttachment$Card;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    .prologue
    .line 270
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    iput-object p2, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder$1;->val$card:Lcom/vkontakte/android/attachments/ShitAttachment$Card;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 7

    .prologue
    const/16 v4, 0x8

    const/4 v0, 0x1

    const/4 v3, 0x0

    .line 273
    iget-object v5, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    iget-object v5, v5, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v5

    invoke-virtual {v5, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 274
    iget-object v5, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder$1;->val$card:Lcom/vkontakte/android/attachments/ShitAttachment$Card;

    iget v5, v5, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->rating:F

    const/4 v6, 0x0

    cmpl-float v5, v5, v6

    if-lez v5, :cond_2

    iget-object v5, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    .line 275
    invoke-static {v5}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->access$200(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;)I

    move-result v5

    iget-object v6, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    invoke-static {v6}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->access$300(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;)I

    move-result v6

    mul-int/lit8 v6, v6, 0x2

    sub-int/2addr v5, v6

    iget-object v6, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    invoke-static {v6}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->access$400(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;)Lcom/vkontakte/android/ui/RatingView;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/ui/RatingView;->getWidth()I

    move-result v6

    sub-int/2addr v5, v6

    iget-object v6, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    invoke-static {v6}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->access$500(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/TextView;->getWidth()I

    move-result v6

    sub-int/2addr v5, v6

    if-lez v5, :cond_2

    move v1, v0

    .line 276
    .local v1, "showRating":Z
    :goto_0
    if-nez v1, :cond_3

    iget-object v5, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder$1;->val$card:Lcom/vkontakte/android/attachments/ShitAttachment$Card;

    iget-object v5, v5, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->followers:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    iget-object v5, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    .line 277
    invoke-static {v5}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->access$200(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;)I

    move-result v5

    iget-object v6, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    invoke-static {v6}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->access$300(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;)I

    move-result v6

    mul-int/lit8 v6, v6, 0x2

    sub-int/2addr v5, v6

    iget-object v6, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    invoke-static {v6}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->access$600(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/TextView;->getWidth()I

    move-result v6

    sub-int/2addr v5, v6

    iget-object v6, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    invoke-static {v6}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->access$500(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/TextView;->getWidth()I

    move-result v6

    sub-int/2addr v5, v6

    if-lez v5, :cond_3

    .line 278
    .local v0, "showFollowers":Z
    :goto_1
    if-eqz v0, :cond_4

    move v2, v3

    .line 279
    .local v2, "visibility":I
    :goto_2
    iget-object v5, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    invoke-static {v5}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->access$600(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/TextView;->getVisibility()I

    move-result v5

    if-eq v5, v2, :cond_0

    .line 280
    iget-object v5, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    invoke-static {v5}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->access$600(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 282
    :cond_0
    if-eqz v1, :cond_5

    move v2, v3

    .line 283
    :goto_3
    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    invoke-static {v4}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->access$400(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;)Lcom/vkontakte/android/ui/RatingView;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/RatingView;->getVisibility()I

    move-result v4

    if-eq v2, v4, :cond_1

    .line 284
    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    invoke-static {v4}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->access$400(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;)Lcom/vkontakte/android/ui/RatingView;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/vkontakte/android/ui/RatingView;->setVisibility(I)V

    .line 286
    :cond_1
    return v3

    .end local v0    # "showFollowers":Z
    .end local v1    # "showRating":Z
    .end local v2    # "visibility":I
    :cond_2
    move v1, v3

    .line 275
    goto :goto_0

    .restart local v1    # "showRating":Z
    :cond_3
    move v0, v3

    .line 277
    goto :goto_1

    .restart local v0    # "showFollowers":Z
    :cond_4
    move v2, v4

    .line 278
    goto :goto_2

    .restart local v2    # "visibility":I
    :cond_5
    move v2, v4

    .line 282
    goto :goto_3
.end method
