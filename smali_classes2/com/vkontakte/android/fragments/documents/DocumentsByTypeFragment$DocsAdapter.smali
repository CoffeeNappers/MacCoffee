.class Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "DocumentsByTypeFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DocsAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/ui/holder/documents/DocumentHolder",
        "<",
        "Lcom/vkontakte/android/api/Document;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;

    .prologue
    .line 166
    iput-object p1, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 206
    const/4 v0, 0x1

    return v0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 1
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 211
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->access$400(Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Document;

    iget-object v0, v0, Lcom/vkontakte/android/api/Document;->thumb:Ljava/lang/String;

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 201
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->access$300(Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 166
    check-cast p1, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;I)V
    .locals 1
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/ui/holder/documents/DocumentHolder",
            "<",
            "Lcom/vkontakte/android/api/Document;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 196
    .local p1, "holder":Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;, "Lcom/vkontakte/android/ui/holder/documents/DocumentHolder<Lcom/vkontakte/android/api/Document;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->access$200(Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->bind(Ljava/lang/Object;)V

    .line 197
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 166
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "I)",
            "Lcom/vkontakte/android/ui/holder/documents/DocumentHolder",
            "<",
            "Lcom/vkontakte/android/api/Document;",
            ">;"
        }
    .end annotation

    .prologue
    .line 170
    new-instance v0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter$1;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter$1;-><init>(Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;Landroid/content/Context;)V

    return-object v0
.end method
