.class Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup$SuggestionsAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "MessagesSearchSuggestionsPopup.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SuggestionsAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/ui/holder/UserHolder;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;

.field private users:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;)V
    .locals 1

    .prologue
    .line 253
    iput-object p1, p0, Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup$SuggestionsAdapter;->this$0:Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 254
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup$SuggestionsAdapter;->users:Ljava/util/List;

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;
    .param p2, "x1"    # Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup$1;

    .prologue
    .line 253
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup$SuggestionsAdapter;-><init>(Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;)V

    return-void
.end method


# virtual methods
.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "item"    # I

    .prologue
    .line 278
    const/4 v0, 0x1

    return v0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 1
    .param p1, "item"    # I
    .param p2, "image"    # I

    .prologue
    .line 283
    iget-object v0, p0, Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup$SuggestionsAdapter;->users:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 273
    iget-object v0, p0, Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup$SuggestionsAdapter;->users:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 253
    check-cast p1, Lcom/vkontakte/android/ui/holder/UserHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup$SuggestionsAdapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/UserHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/holder/UserHolder;I)V
    .locals 1
    .param p1, "holder"    # Lcom/vkontakte/android/ui/holder/UserHolder;
    .param p2, "position"    # I

    .prologue
    .line 268
    iget-object v0, p0, Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup$SuggestionsAdapter;->users:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/UserHolder;->bind(Ljava/lang/Object;)V

    .line 269
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 253
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup$SuggestionsAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/UserHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 263
    const v0, 0x7f030091

    invoke-static {p1, v0}, Lcom/vkontakte/android/ui/holder/UserHolder;->simple(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup$SuggestionsAdapter;->this$0:Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;

    invoke-static {v1}, Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;->access$700(Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/UserHolder;->onClick(Lcom/vkontakte/android/functions/VoidF1;)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    return-object v0
.end method

.method public setData(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 257
    .local p1, "users":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    if-nez p1, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup$SuggestionsAdapter;->users:Ljava/util/List;

    .line 258
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup$SuggestionsAdapter;->notifyDataSetChanged()V

    .line 259
    return-void

    .line 257
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_0
.end method
