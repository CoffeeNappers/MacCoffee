.class public Lcom/vkontakte/android/ui/adapters/MessagesAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "MessagesAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private bottomLoadingView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

.field private chatFragment:Lcom/vkontakte/android/fragments/messages/ChatFragment;

.field private fontSize:I

.field private isTimeVisible:Z

.field private items:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ui/holder/messages/MessageListItem;",
            ">;"
        }
    .end annotation
.end field

.field private topLoadingView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

.field private weakReferences:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 3
    .param p1, "chatFragment"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    const/4 v1, 0x0

    .line 129
    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 22
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->isTimeVisible:Z

    .line 25
    iput-object v1, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->topLoadingView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    .line 27
    iput-object v1, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->bottomLoadingView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->items:Ljava/util/ArrayList;

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->weakReferences:Ljava/util/ArrayList;

    .line 130
    iput-object p1, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->chatFragment:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .line 131
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->setHasStableIds(Z)V

    .line 133
    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "fontSize"

    const-string/jumbo v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->fontSize:I

    .line 134
    return-void
.end method


# virtual methods
.method public getFooterViewsCount()I
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->bottomLoadingView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getHeaderViewsCount()I
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->topLoadingView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getItemCount()I
    .locals 4

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 206
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->topLoadingView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    add-int/2addr v0, v3

    iget-object v3, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->bottomLoadingView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    if-nez v3, :cond_1

    :goto_1
    add-int/2addr v0, v1

    return v0

    :cond_0
    move v0, v2

    goto :goto_0

    :cond_1
    move v1, v2

    goto :goto_1
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 193
    if-nez p1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->topLoadingView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    if-eqz v0, :cond_0

    .line 194
    const-wide/16 v0, 0x0

    .line 201
    :goto_0
    return-wide v0

    .line 196
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->topLoadingView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    :goto_1
    sub-int/2addr p1, v0

    .line 198
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_2

    .line 199
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->items:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    iget-wide v0, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->itemId:J

    goto :goto_0

    .line 196
    :cond_1
    const/4 v0, 0x1

    goto :goto_1

    .line 201
    :cond_2
    const-wide/16 v0, -0x1

    goto :goto_0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 157
    if-nez p1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->topLoadingView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    if-eqz v0, :cond_0

    .line 158
    const v0, 0x7f100051

    .line 165
    :goto_0
    return v0

    .line 160
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->topLoadingView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    :goto_1
    sub-int/2addr p1, v0

    .line 162
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_2

    .line 163
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->items:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    invoke-static {v0}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->getViewType(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;)I

    move-result v0

    goto :goto_0

    .line 160
    :cond_1
    const/4 v0, 0x1

    goto :goto_1

    .line 165
    :cond_2
    const v0, 0x7f100046

    goto :goto_0
.end method

.method public getMessageItemByPosition(I)Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    .locals 2
    .param p1, "position"    # I

    .prologue
    const/4 v0, 0x0

    .line 88
    if-nez p1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->topLoadingView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    if-eqz v1, :cond_1

    .line 96
    :cond_0
    :goto_0
    return-object v0

    .line 91
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->topLoadingView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    if-nez v1, :cond_2

    const/4 v1, 0x0

    :goto_1
    sub-int/2addr p1, v1

    .line 93
    if-lez p1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->items:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge p1, v1, :cond_0

    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->items:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    goto :goto_0

    .line 91
    :cond_2
    const/4 v1, 0x1

    goto :goto_1
.end method

.method public isTimeVisible()Z
    .locals 1

    .prologue
    .line 38
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->isTimeVisible:Z

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 19
    check-cast p1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V
    .locals 7
    .param p1, "holder"    # Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v6, 0x0

    .line 170
    if-nez p2, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->topLoadingView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    if-eqz v0, :cond_1

    .line 171
    check-cast p1, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder;

    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->topLoadingView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder;->bind(Ljava/lang/Object;)V

    .line 189
    :cond_0
    :goto_0
    return-void

    .line 174
    .restart local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->topLoadingView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    if-nez v0, :cond_2

    move v0, v6

    :goto_1
    sub-int/2addr p2, v0

    .line 176
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p2, v0, :cond_4

    .line 177
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->items:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .local v1, "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    move-object v0, p1

    .line 178
    check-cast v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;

    iget-boolean v2, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->isTimeVisible:Z

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->setTimeIsVisible(Z)V

    move-object v0, p1

    .line 179
    check-cast v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;

    iget-object v2, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->chatFragment:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iget v4, v1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->msgId:I

    invoke-virtual {v2, v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->isSelected(I)Z

    move-result v2

    iget-object v4, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->chatFragment:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iget-object v4, v4, Lcom/vkontakte/android/fragments/messages/ChatFragment;->actionMode:Landroid/view/ActionMode;

    if-eqz v4, :cond_3

    :goto_2
    iget-object v4, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->chatFragment:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .line 180
    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getPeerID()I

    move-result v4

    iget v5, v1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->msgId:I

    .line 179
    invoke-virtual/range {v0 .. v6}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->bind(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;ZZIIZ)V

    .line 181
    check-cast p1, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;

    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    iget-object v0, p1, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->referenceLinkToHolder:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->setHolder(Ljava/lang/ref/WeakReference;)V

    goto :goto_0

    .end local v1    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    .restart local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    :cond_2
    move v0, v3

    .line 174
    goto :goto_1

    .restart local v1    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    :cond_3
    move v3, v6

    .line 179
    goto :goto_2

    .line 184
    .end local v1    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    :cond_4
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr p2, v0

    .line 186
    if-nez p2, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->bottomLoadingView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    if-eqz v0, :cond_0

    .line 187
    check-cast p1, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder;

    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->bottomLoadingView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .locals 6
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 146
    const v1, 0x7f100051

    if-eq p2, v1, :cond_0

    const v1, 0x7f100046

    if-ne p2, v1, :cond_1

    .line 147
    :cond_0
    new-instance v0, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder;-><init>(Landroid/view/ViewGroup;)V

    .line 151
    :goto_0
    return-object v0

    .line 149
    :cond_1
    new-instance v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->chatFragment:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getPeerID()I

    move-result v3

    iget-object v4, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->chatFragment:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iget v5, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->fontSize:I

    move-object v1, p1

    move v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;-><init>(Landroid/view/ViewGroup;IILcom/vkontakte/android/fragments/messages/ChatFragment;I)V

    .line 150
    .local v0, "holder":Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;
    iget-object v1, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->weakReferences:Ljava/util/ArrayList;

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public prepareItems(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ui/holder/messages/MessageListItem;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ui/holder/messages/MessageListItem;",
            ">;"
        }
    .end annotation

    .prologue
    .local p1, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/messages/MessageListItem;>;"
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 100
    if-nez p1, :cond_1

    new-instance p1, Ljava/util/ArrayList;

    .end local p1    # "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/messages/MessageListItem;>;"
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 101
    .restart local p1    # "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/messages/MessageListItem;>;"
    :goto_0
    const/4 v2, 0x0

    .line 102
    .local v2, "lastMessage":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_3

    .line 103
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .line 104
    .local v1, "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    if-eqz v2, :cond_0

    iget v3, v2, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v6, 0x5

    if-eq v3, v6, :cond_0

    iget v3, v2, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v6, 0x6

    if-eq v3, v6, :cond_0

    iget v3, v2, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->uid:I

    iget v6, v1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->uid:I

    if-eq v3, v6, :cond_2

    :cond_0
    move v3, v5

    :goto_2
    iput-boolean v3, v1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isFirst:Z

    .line 107
    move-object v2, v1

    .line 108
    iput-boolean v4, v2, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isLast:Z

    .line 102
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 100
    .end local v0    # "i":I
    .end local v1    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    .end local v2    # "lastMessage":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    :cond_1
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object p1, v3

    goto :goto_0

    .restart local v0    # "i":I
    .restart local v1    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    .restart local v2    # "lastMessage":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    :cond_2
    move v3, v4

    .line 104
    goto :goto_2

    .line 110
    .end local v1    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    :cond_3
    if-eqz v2, :cond_4

    .line 111
    iput-boolean v5, v2, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isLast:Z

    .line 113
    :cond_4
    return-object p1
.end method

.method public setBottomLoadingView(Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;)V
    .locals 0
    .param p1, "bottomLoadinView"    # Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    .prologue
    .line 126
    iput-object p1, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->bottomLoadingView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    .line 127
    return-void
.end method

.method public setItems(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ui/holder/messages/MessageListItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 117
    .local p1, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/messages/MessageListItem;>;"
    iput-object p1, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->items:Ljava/util/ArrayList;

    .line 118
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->notifyDataSetChanged()V

    .line 119
    return-void
.end method

.method public setSearchedViewBackgroundColor(I)V
    .locals 10
    .param p1, "id"    # I

    .prologue
    .line 42
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .local v2, "animators":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/animation/Animator;>;"
    iget-object v6, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->weakReferences:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 44
    .local v4, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/ref/WeakReference<Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;>;>;"
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 45
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/ref/WeakReference;

    .line 46
    .local v5, "reference":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;>;"
    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;

    .line 47
    .local v3, "holder":Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;
    if-nez v3, :cond_1

    .line 48
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 49
    :cond_1
    iget-object v6, v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->lastItem:Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    iget v6, v6, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->msgId:I

    if-ne v6, p1, :cond_0

    .line 50
    invoke-virtual {v3}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->getSearchedMessageColorAnimator()Landroid/animation/Animator;

    move-result-object v0

    .line 51
    .local v0, "animator":Landroid/animation/Animator;
    if-eqz v0, :cond_0

    .line 52
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 56
    .end local v0    # "animator":Landroid/animation/Animator;
    .end local v3    # "holder":Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;
    .end local v5    # "reference":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;>;"
    :cond_2
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_3

    .line 57
    new-instance v6, Landroid/animation/AnimatorSet;

    invoke-direct {v6}, Landroid/animation/AnimatorSet;-><init>()V

    const-wide/16 v8, 0x190

    invoke-virtual {v6, v8, v9}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    move-result-object v1

    .line 58
    .local v1, "animatorSet":Landroid/animation/AnimatorSet;
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 59
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 61
    .end local v1    # "animatorSet":Landroid/animation/AnimatorSet;
    :cond_3
    return-void
.end method

.method public setTimeIsVisible(Z)V
    .locals 10
    .param p1, "isTimeVisible"    # Z

    .prologue
    .line 64
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->isTimeVisible:Z

    .line 66
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .local v2, "animators":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/animation/Animator;>;"
    iget-object v6, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->weakReferences:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 68
    .local v4, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/ref/WeakReference<Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;>;>;"
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 69
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/ref/WeakReference;

    .line 70
    .local v5, "reference":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;>;"
    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;

    .line 71
    .local v3, "holder":Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;
    if-nez v3, :cond_1

    .line 72
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 74
    :cond_1
    invoke-virtual {v3, p1}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->setTimeIsVisibleAnim(Z)Ljava/util/List;

    move-result-object v0

    .line 75
    .local v0, "animator":Ljava/util/List;, "Ljava/util/List<Landroid/animation/Animator;>;"
    if-eqz v0, :cond_0

    .line 76
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 80
    .end local v0    # "animator":Ljava/util/List;, "Ljava/util/List<Landroid/animation/Animator;>;"
    .end local v3    # "holder":Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;
    .end local v5    # "reference":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;>;"
    :cond_2
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_3

    .line 81
    new-instance v6, Landroid/animation/AnimatorSet;

    invoke-direct {v6}, Landroid/animation/AnimatorSet;-><init>()V

    const-wide/16 v8, 0xc8

    invoke-virtual {v6, v8, v9}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    move-result-object v1

    .line 82
    .local v1, "animatorSet":Landroid/animation/AnimatorSet;
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 83
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 85
    .end local v1    # "animatorSet":Landroid/animation/AnimatorSet;
    :cond_3
    return-void
.end method

.method public setTopLoadingView(Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;)V
    .locals 0
    .param p1, "topLoadingView"    # Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    .prologue
    .line 122
    iput-object p1, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->topLoadingView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    .line 123
    return-void
.end method

.method public toggle()V
    .locals 1

    .prologue
    .line 34
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->isTimeVisible:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->setTimeIsVisible(Z)V

    .line 35
    return-void

    .line 34
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
