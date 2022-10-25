.class public Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "PhotoListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/photos/PhotoListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "PhotoAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private count:I

.field private offset:I

.field final synthetic this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;II)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;
    .param p2, "offset"    # I
    .param p3, "count"    # I

    .prologue
    .line 674
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 675
    iput p2, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;->offset:I

    .line 676
    iput p3, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;->count:I

    .line 677
    return-void
.end method

.method static synthetic access$1900(Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;

    .prologue
    .line 670
    iget v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;->offset:I

    return v0
.end method


# virtual methods
.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 699
    const/4 v0, 0x1

    return v0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 7
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    const/4 v5, 0x0

    .line 704
    iget v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;->offset:I

    add-int v1, v4, p1

    .line 705
    .local v1, "index":I
    if-ltz v1, :cond_0

    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->access$2300(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_0

    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->access$2400(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/Photo;

    move-object v3, v4

    .line 706
    .local v3, "photo":Lcom/vkontakte/android/Photo;
    :goto_0
    if-ltz v1, :cond_1

    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v4, v4, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->layout:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_1

    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v4, v4, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->layout:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;

    move-object v2, v4

    .line 707
    .local v2, "layoutInfo":Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;
    :goto_1
    if-eqz v3, :cond_3

    if-eqz v2, :cond_3

    .line 708
    const/16 v4, 0x140

    iget v6, v2, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->height:I

    invoke-static {v4, v6}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/Photo;->getImageByHeight(I)Lcom/vkontakte/android/Photo$Image;

    move-result-object v0

    .line 709
    .local v0, "image1":Lcom/vkontakte/android/Photo$Image;
    if-nez v0, :cond_2

    move-object v4, v5

    .line 711
    .end local v0    # "image1":Lcom/vkontakte/android/Photo$Image;
    :goto_2
    return-object v4

    .end local v2    # "layoutInfo":Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;
    .end local v3    # "photo":Lcom/vkontakte/android/Photo;
    :cond_0
    move-object v3, v5

    .line 705
    goto :goto_0

    .restart local v3    # "photo":Lcom/vkontakte/android/Photo;
    :cond_1
    move-object v2, v5

    .line 706
    goto :goto_1

    .line 709
    .restart local v0    # "image1":Lcom/vkontakte/android/Photo$Image;
    .restart local v2    # "layoutInfo":Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;
    :cond_2
    iget-object v4, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    goto :goto_2

    .end local v0    # "image1":Lcom/vkontakte/android/Photo$Image;
    :cond_3
    move-object v4, v5

    .line 711
    goto :goto_2
.end method

.method public getItemCount()I
    .locals 2

    .prologue
    .line 694
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->access$2200(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;->offset:I

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;->count:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 717
    const/4 v0, 0x1

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 670
    check-cast p1, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;->onBindViewHolder(Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;I)V
    .locals 2
    .param p1, "holder"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 686
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->layout:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 687
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->layout:Ljava/util/ArrayList;

    iget v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;->offset:I

    add-int/2addr v1, p2

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;->bindLayout(Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;)V

    .line 689
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->access$2100(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;->offset:I

    add-int/2addr v1, p2

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;->bind(Ljava/lang/Object;)V

    .line 690
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 670
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 681
    new-instance v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoViewHolder;-><init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)V

    return-object v0
.end method
