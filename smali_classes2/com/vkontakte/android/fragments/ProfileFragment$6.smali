.class Lcom/vkontakte/android/fragments/ProfileFragment$6;
.super Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;->onCreateLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 522
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$6;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {p0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;-><init>()V

    return-void
.end method


# virtual methods
.method public getSpanSize(I)I
    .locals 5
    .param p1, "position"    # I

    .prologue
    const/4 v3, 0x2

    .line 525
    if-eqz p1, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$6;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1700(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt p1, v2, :cond_1

    :cond_0
    move v2, v3

    .line 541
    :goto_0
    return v2

    .line 528
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$6;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1700(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge p1, v2, :cond_3

    .line 529
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$6;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1700(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    if-eqz v2, :cond_3

    .line 530
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$6;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1700(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    iget-object v1, v2, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->view:Landroid/view/View;

    .line 531
    .local v1, "view":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v2

    const v4, 0x7f1004ff

    if-eq v2, v4, :cond_2

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v2

    const v4, 0x7f10007a

    if-eq v2, v4, :cond_2

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v2

    const v4, 0x7f100078

    if-eq v2, v4, :cond_2

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v2

    const v4, 0x7f1004ec

    if-ne v2, v4, :cond_3

    :cond_2
    move v2, v3

    .line 532
    goto :goto_0

    .line 536
    .end local v1    # "view":Landroid/view/View;
    :cond_3
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_1
    if-gt v0, p1, :cond_5

    .line 537
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$6;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1700(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;

    iget v2, v2, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;->backgroundType:I

    and-int/lit8 v2, v2, 0x4

    const/4 v4, 0x4

    if-ne v2, v4, :cond_4

    move v2, v3

    .line 538
    goto :goto_0

    .line 536
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 541
    :cond_5
    const/4 v2, 0x1

    goto :goto_0
.end method
