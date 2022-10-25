.class Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "DialogsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/messages/DialogsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DialogsAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/ui/holder/messages/DialogHolder;",
        ">;"
    }
.end annotation


# instance fields
.field final dialogsFragment:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

.field displayItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/DialogEntry;",
            ">;"
        }
    .end annotation
.end field

.field final userPhotoUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V
    .locals 1
    .param p1, "userPhotoUrl"    # Ljava/lang/String;
    .param p2, "dialogsFragment"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    .prologue
    .line 860
    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 856
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;->displayItems:Ljava/util/ArrayList;

    .line 861
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;->userPhotoUrl:Ljava/lang/String;

    .line 862
    iput-object p2, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;->dialogsFragment:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    .line 863
    return-void
.end method


# virtual methods
.method public getImageCountForItem(I)I
    .locals 2
    .param p1, "item"    # I

    .prologue
    .line 887
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;->displayItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/DialogEntry;

    iget-object v0, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-boolean v0, v0, Lcom/vkontakte/android/Message;->out:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;->displayItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/DialogEntry;

    iget-object v0, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    const v1, 0x77359400

    if-le v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x2

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 1
    .param p1, "item"    # I
    .param p2, "image"    # I

    .prologue
    .line 892
    const/4 v0, 0x0

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 882
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;->displayItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 854
    check-cast p1, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/messages/DialogHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/holder/messages/DialogHolder;I)V
    .locals 1
    .param p1, "holder"    # Lcom/vkontakte/android/ui/holder/messages/DialogHolder;
    .param p2, "position"    # I

    .prologue
    .line 877
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;->displayItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->bind(Ljava/lang/Object;)V

    .line 878
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 854
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/messages/DialogHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/messages/DialogHolder;
    .locals 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 872
    new-instance v0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;->dialogsFragment:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;->userPhotoUrl:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;-><init>(Landroid/content/Context;Lcom/vkontakte/android/fragments/messages/DialogsFragment;Ljava/lang/String;)V

    return-object v0
.end method

.method public setData(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/DialogEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 866
    .local p1, "displayItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/DialogEntry;>;"
    if-nez p1, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :goto_0
    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;->displayItems:Ljava/util/ArrayList;

    .line 867
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;->notifyDataSetChanged()V

    .line 868
    return-void

    .line 866
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_0
.end method
