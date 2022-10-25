.class Lcom/vkontakte/android/fragments/utils/FilePickerFragment$FileListAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "FilePickerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/utils/FilePickerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FileListAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/ui/holder/documents/DocumentHolder",
        "<",
        "Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/utils/FilePickerFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/utils/FilePickerFragment;)V
    .locals 0

    .prologue
    .line 381
    iput-object p1, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$FileListAdapter;->this$0:Lcom/vkontakte/android/fragments/utils/FilePickerFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/utils/FilePickerFragment;Lcom/vkontakte/android/fragments/utils/FilePickerFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/utils/FilePickerFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/utils/FilePickerFragment$1;

    .prologue
    .line 381
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$FileListAdapter;-><init>(Lcom/vkontakte/android/fragments/utils/FilePickerFragment;)V

    return-void
.end method


# virtual methods
.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "item"    # I

    .prologue
    .line 404
    iget-object v0, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$FileListAdapter;->this$0:Lcom/vkontakte/android/fragments/utils/FilePickerFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->access$1000(Lcom/vkontakte/android/fragments/utils/FilePickerFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->thumb:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 1
    .param p1, "item"    # I
    .param p2, "image"    # I

    .prologue
    .line 409
    iget-object v0, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$FileListAdapter;->this$0:Lcom/vkontakte/android/fragments/utils/FilePickerFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->access$1000(Lcom/vkontakte/android/fragments/utils/FilePickerFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->thumb:Ljava/lang/String;

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 399
    iget-object v0, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$FileListAdapter;->this$0:Lcom/vkontakte/android/fragments/utils/FilePickerFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->access$1000(Lcom/vkontakte/android/fragments/utils/FilePickerFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 384
    iget-object v0, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$FileListAdapter;->this$0:Lcom/vkontakte/android/fragments/utils/FilePickerFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->access$1000(Lcom/vkontakte/android/fragments/utils/FilePickerFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->thumb:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$FileListAdapter;->this$0:Lcom/vkontakte/android/fragments/utils/FilePickerFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->access$1000(Lcom/vkontakte/android/fragments/utils/FilePickerFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;

    iget v0, v0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->icon:I

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 381
    check-cast p1, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$FileListAdapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;I)V

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
            "Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 394
    .local p1, "holder":Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;, "Lcom/vkontakte/android/ui/holder/documents/DocumentHolder<Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$FileListAdapter;->this$0:Lcom/vkontakte/android/fragments/utils/FilePickerFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->access$1000(Lcom/vkontakte/android/fragments/utils/FilePickerFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->bind(Ljava/lang/Object;)V

    .line 395
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 381
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$FileListAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "I)",
            "Lcom/vkontakte/android/ui/holder/documents/DocumentHolder",
            "<",
            "Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 389
    new-instance v0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$FileListAdapter;->this$0:Lcom/vkontakte/android/fragments/utils/FilePickerFragment;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v1, v2, p2}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ViewHolder;-><init>(Lcom/vkontakte/android/fragments/utils/FilePickerFragment;Landroid/content/Context;I)V

    return-object v0
.end method
