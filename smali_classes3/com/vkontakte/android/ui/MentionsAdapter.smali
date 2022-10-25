.class public Lcom/vkontakte/android/ui/MentionsAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "MentionsAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/ui/MentionViewHolder;",
        ">;"
    }
.end annotation


# static fields
.field private static final EMPTY_QUERY:Ljava/lang/String; = "%empty%"


# instance fields
.field private mentionsManager:Lcom/vkontakte/android/ui/MentionsManager;

.field private searchIndexer:Lcom/vkontakte/android/fragments/friends/SearchIndexer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/fragments/friends/SearchIndexer",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private userPriorities:Landroid/util/SparseIntArray;

.field private userProfiles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private userProfilesFiltered:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/ui/MentionsManager;)V
    .locals 2
    .param p1, "mentionsManager"    # Lcom/vkontakte/android/ui/MentionsManager;

    .prologue
    .line 87
    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 26
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/MentionsAdapter;->userPriorities:Landroid/util/SparseIntArray;

    .line 124
    new-instance v0, Lcom/vkontakte/android/fragments/friends/SearchIndexer;

    new-instance v1, Lcom/vkontakte/android/ui/MentionsAdapter$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ui/MentionsAdapter$1;-><init>(Lcom/vkontakte/android/ui/MentionsAdapter;)V

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/friends/SearchIndexer;-><init>(Lcom/vkontakte/android/fragments/friends/SearchIndexer$Provider;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/MentionsAdapter;->searchIndexer:Lcom/vkontakte/android/fragments/friends/SearchIndexer;

    .line 88
    iput-object p1, p0, Lcom/vkontakte/android/ui/MentionsAdapter;->mentionsManager:Lcom/vkontakte/android/ui/MentionsManager;

    .line 89
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/MentionsAdapter;)Landroid/util/SparseIntArray;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/MentionsAdapter;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/vkontakte/android/ui/MentionsAdapter;->userPriorities:Landroid/util/SparseIntArray;

    return-object v0
.end method


# virtual methods
.method public buildUserPriorities(Ljava/util/ArrayList;)V
    .locals 3
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
    .line 63
    .local p1, "messages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/messages/MessageListItem;>;"
    iget-object v1, p0, Lcom/vkontakte/android/ui/MentionsAdapter;->userPriorities:Landroid/util/SparseIntArray;

    invoke-virtual {v1}, Landroid/util/SparseIntArray;->clear()V

    .line 66
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x64

    const/4 v2, 0x0

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 67
    iget-object v2, p0, Lcom/vkontakte/android/ui/MentionsAdapter;->userPriorities:Landroid/util/SparseIntArray;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    iget v1, v1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->sender:I

    invoke-virtual {v2, v1, v0}, Landroid/util/SparseIntArray;->put(II)V

    .line 66
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 69
    :cond_0
    return-void
.end method

.method public filterResults(Ljava/lang/String;)V
    .locals 3
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 119
    iget-object v1, p0, Lcom/vkontakte/android/ui/MentionsAdapter;->searchIndexer:Lcom/vkontakte/android/fragments/friends/SearchIndexer;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    sget-object p1, Lcom/vkontakte/android/ui/MentionsAdapter;->EMPTY_QUERY:Ljava/lang/String;

    .end local p1    # "query":Ljava/lang/String;
    :cond_0
    invoke-virtual {v1, p1}, Lcom/vkontakte/android/fragments/friends/SearchIndexer;->search(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 120
    .local v0, "filtered":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    iput-object v0, p0, Lcom/vkontakte/android/ui/MentionsAdapter;->userProfilesFiltered:Ljava/util/ArrayList;

    .line 121
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/MentionsAdapter;->notifyDataSetChanged()V

    .line 122
    return-void
.end method

.method public findExactMatch(Ljava/lang/String;)I
    .locals 4
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 54
    iget-object v1, p0, Lcom/vkontakte/android/ui/MentionsAdapter;->userProfiles:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 55
    .local v0, "up":Lcom/vkontakte/android/UserProfile;
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, v0, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    :cond_1
    const-string/jumbo v2, "id"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget v2, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 56
    :cond_2
    iget v1, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 59
    .end local v0    # "up":Lcom/vkontakte/android/UserProfile;
    :goto_0
    return v1

    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lcom/vkontakte/android/ui/MentionsAdapter;->userProfilesFiltered:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/MentionsAdapter;->userProfilesFiltered:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 20
    check-cast p1, Lcom/vkontakte/android/ui/MentionViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/MentionsAdapter;->onBindViewHolder(Lcom/vkontakte/android/ui/MentionViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/MentionViewHolder;I)V
    .locals 1
    .param p1, "holder"    # Lcom/vkontakte/android/ui/MentionViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 99
    iget-object v0, p0, Lcom/vkontakte/android/ui/MentionsAdapter;->userProfilesFiltered:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/MentionViewHolder;->bind(Ljava/lang/Object;)V

    .line 100
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 20
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/MentionsAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/MentionViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/MentionViewHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 94
    new-instance v0, Lcom/vkontakte/android/ui/MentionViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/MentionsAdapter;->mentionsManager:Lcom/vkontakte/android/ui/MentionsManager;

    invoke-direct {v0, p1, v1}, Lcom/vkontakte/android/ui/MentionViewHolder;-><init>(Landroid/view/ViewGroup;Lcom/vkontakte/android/ui/MentionsManager;)V

    return-object v0
.end method

.method public setUsers(Landroid/util/SparseArray;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 33
    .local p1, "userProfiles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    if-nez p1, :cond_0

    .line 51
    :goto_0
    return-void

    .line 37
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 38
    .local v1, "profilesArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v0, v3, :cond_2

    .line 39
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    .line 42
    .local v2, "up":Lcom/vkontakte/android/UserProfile;
    if-eqz v2, :cond_1

    .line 44
    iget v3, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v3}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v3

    if-nez v3, :cond_1

    .line 45
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 50
    .end local v2    # "up":Lcom/vkontakte/android/UserProfile;
    :cond_2
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/MentionsAdapter;->setUsers(Ljava/util/ArrayList;)V

    goto :goto_0
.end method

.method public setUsers(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 72
    .local p1, "userProfiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    if-nez p1, :cond_0

    .line 85
    :goto_0
    return-void

    .line 76
    :cond_0
    iput-object p1, p0, Lcom/vkontakte/android/ui/MentionsAdapter;->userProfiles:Ljava/util/ArrayList;

    .line 78
    iget-object v0, p0, Lcom/vkontakte/android/ui/MentionsAdapter;->searchIndexer:Lcom/vkontakte/android/fragments/friends/SearchIndexer;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/friends/SearchIndexer;->bind(Ljava/util/List;)V

    .line 79
    iget-object v0, p0, Lcom/vkontakte/android/ui/MentionsAdapter;->searchIndexer:Lcom/vkontakte/android/fragments/friends/SearchIndexer;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/SearchIndexer;->build()V

    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/ui/MentionsAdapter;->userProfilesFiltered:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    .line 82
    iput-object p1, p0, Lcom/vkontakte/android/ui/MentionsAdapter;->userProfilesFiltered:Ljava/util/ArrayList;

    .line 84
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/MentionsAdapter;->notifyDataSetChanged()V

    goto :goto_0
.end method
