.class Lcom/vkontakte/android/fragments/NewsFragment$HeaderAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "NewsFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/CardItemDecorator$Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/NewsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "HeaderAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;",
        ">;",
        "Lcom/vkontakte/android/ui/CardItemDecorator$Provider;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/NewsFragment;

.field final url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/NewsFragment;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/NewsFragment;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 1513
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderAdapter;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 1514
    iput-object p2, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderAdapter;->url:Ljava/lang/String;

    .line 1515
    return-void
.end method


# virtual methods
.method public getBlockType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 1534
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderAdapter;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/NewsFragment;->access$4700(Lcom/vkontakte/android/fragments/NewsFragment;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x6

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x4

    goto :goto_0
.end method

.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 1544
    const/4 v0, 0x1

    return v0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 1
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 1549
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderAdapter;->url:Ljava/lang/String;

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 1529
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderAdapter;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/NewsFragment;->access$4600(Lcom/vkontakte/android/fragments/NewsFragment;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 1539
    const v0, 0x2dc2fc9

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 1509
    check-cast p1, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderAdapter;->onBindViewHolder(Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;I)V
    .locals 1
    .param p1, "holder"    # Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;
    .param p2, "position"    # I

    .prologue
    .line 1524
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderAdapter;->url:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->bind(Ljava/lang/Object;)V

    .line 1525
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 1509
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 1519
    new-instance v0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderAdapter;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;-><init>(Lcom/vkontakte/android/fragments/NewsFragment;Landroid/view/ViewGroup;)V

    return-object v0
.end method
