.class Lcom/vkontakte/android/attachments/PrettyCardAttachment$Adapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "PrettyCardAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/PrettyCardAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Adapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;",
        ">;>;"
    }
.end annotation


# instance fields
.field cards:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 238
    .local p1, "cards":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;>;"
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 239
    iput-object p1, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Adapter;->cards:Ljava/util/List;

    .line 240
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .prologue
    .line 254
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Adapter;->cards:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 234
    check-cast p1, Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Adapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V
    .locals 1
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
            "<",
            "Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 249
    .local p1, "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;>;"
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Adapter;->cards:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->bind(Ljava/lang/Object;)V

    .line 250
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 234
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "I)",
            "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
            "<",
            "Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;",
            ">;"
        }
    .end annotation

    .prologue
    .line 244
    new-instance v0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;)V

    return-object v0
.end method

.method public setItems(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 258
    .local p1, "cards":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;>;"
    iput-object p1, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Adapter;->cards:Ljava/util/List;

    .line 259
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Adapter;->notifyDataSetChanged()V

    .line 260
    return-void
.end method
