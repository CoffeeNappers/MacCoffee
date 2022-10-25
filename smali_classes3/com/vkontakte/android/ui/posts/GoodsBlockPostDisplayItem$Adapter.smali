.class Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "GoodsBlockPostDisplayItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Adapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field cards:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/ShitAttachment$Card;",
            ">;"
        }
    .end annotation
.end field

.field displayItem:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;

.field padding:I

.field shitAttachment:Lcom/vkontakte/android/attachments/ShitAttachment;

.field size:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 177
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 179
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;->cards:Ljava/util/List;

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$1;

    .prologue
    .line 177
    invoke-direct {p0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;-><init>()V

    return-void
.end method


# virtual methods
.method bind(Ljava/util/List;Lcom/vkontakte/android/attachments/ShitAttachment;Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;II)V
    .locals 0
    .param p2, "shitAttachment"    # Lcom/vkontakte/android/attachments/ShitAttachment;
    .param p3, "postDisplayItem"    # Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;
    .param p4, "padding"    # I
    .param p5, "size"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/ShitAttachment$Card;",
            ">;",
            "Lcom/vkontakte/android/attachments/ShitAttachment;",
            "Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;",
            "II)V"
        }
    .end annotation

    .prologue
    .line 186
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/ShitAttachment$Card;>;"
    if-nez p1, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    .end local p1    # "items":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/ShitAttachment$Card;>;"
    :cond_0
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;->cards:Ljava/util/List;

    .line 187
    iput-object p2, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;->shitAttachment:Lcom/vkontakte/android/attachments/ShitAttachment;

    .line 188
    iput-object p3, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;->displayItem:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;

    .line 189
    iput p4, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;->padding:I

    .line 190
    iput p5, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;->size:I

    .line 191
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;->notifyDataSetChanged()V

    .line 192
    return-void
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 206
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;->cards:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 177
    check-cast p1, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;->onBindViewHolder(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;I)V
    .locals 6
    .param p1, "holder"    # Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 201
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;->cards:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/ShitAttachment$Card;

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;->shitAttachment:Lcom/vkontakte/android/attachments/ShitAttachment;

    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;->displayItem:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;

    iget v4, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;->padding:I

    iget v5, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;->size:I

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;->bind(Lcom/vkontakte/android/attachments/ShitAttachment$Card;Lcom/vkontakte/android/attachments/ShitAttachment;Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;II)V

    .line 202
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 177
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 196
    new-instance v0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$CardViewHolder;-><init>(Landroid/content/Context;)V

    return-object v0
.end method
