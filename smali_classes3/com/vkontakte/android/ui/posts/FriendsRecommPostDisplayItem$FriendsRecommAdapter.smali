.class Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "FriendsRecommPostDisplayItem.java"

# interfaces
.implements Lme/grishka/appkit/utils/Preloader$Callback;
.implements Lme/grishka/appkit/views/UsableRecyclerView$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FriendsRecommAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;",
        ">;",
        "Lme/grishka/appkit/utils/Preloader$Callback",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Listener;"
    }
.end annotation


# instance fields
.field private dataLoading:Z

.field private preloader:Lme/grishka/appkit/utils/Preloader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lme/grishka/appkit/utils/Preloader",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;Ljava/util/List;)V
    .locals 2
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
    .line 218
    .local p2, "initialList":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;->this$0:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 215
    new-instance v0, Lme/grishka/appkit/utils/Preloader;

    const/16 v1, 0x14

    invoke-direct {v0, p0, v1}, Lme/grishka/appkit/utils/Preloader;-><init>(Lme/grishka/appkit/utils/Preloader$Callback;I)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    .line 216
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;->dataLoading:Z

    .line 219
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    const/4 v1, 0x1

    invoke-virtual {v0, p2, v1}, Lme/grishka/appkit/utils/Preloader;->onDataLoaded(Ljava/util/List;Z)V

    .line 220
    return-void
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;)Lme/grishka/appkit/utils/Preloader;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;

    .prologue
    .line 213
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    return-object v0
.end method

.method static synthetic access$1602(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;
    .param p1, "x1"    # Z

    .prologue
    .line 213
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;->dataLoading:Z

    return p1
.end method


# virtual methods
.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 239
    const/4 v0, 0x1

    return v0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 1
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 244
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    invoke-virtual {v0}, Lme/grishka/appkit/utils/Preloader;->getData()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 234
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    invoke-virtual {v0}, Lme/grishka/appkit/utils/Preloader;->getData()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public isDataLoading()Z
    .locals 1

    .prologue
    .line 285
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;->dataLoading:Z

    return v0
.end method

.method public isRefreshing()Z
    .locals 1

    .prologue
    .line 290
    const/4 v0, 0x0

    return v0
.end method

.method public loadData(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 254
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;->dataLoading:Z

    .line 255
    new-instance v0, Lcom/vkontakte/android/api/friends/FriendsGetRecommendations;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;->this$0:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;

    iget-object v1, v1, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;->att:Lcom/vkontakte/android/attachments/FriendsRecommAttachment;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/FriendsRecommAttachment;->nextFrom:Ljava/lang/String;

    invoke-direct {v0, v1, p2}, Lcom/vkontakte/android/api/friends/FriendsGetRecommendations;-><init>(Ljava/lang/String;I)V

    new-instance v1, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter$1;-><init>(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;)V

    .line 256
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/friends/FriendsGetRecommendations;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 270
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/os/Looper;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 271
    return-void
.end method

.method public onAppendItems(Ljava/util/List;)V
    .locals 0
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
    .line 276
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 213
    check-cast p1, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;->onBindViewHolder(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;I)V
    .locals 1
    .param p1, "holder"    # Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 229
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    invoke-virtual {v0}, Lme/grishka/appkit/utils/Preloader;->getData()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->bind(Ljava/lang/Object;)V

    .line 230
    return-void
.end method

.method public onClearItems()V
    .locals 0

    .prologue
    .line 281
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 213
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 224
    new-instance v0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;->this$0:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v1, v2, p1}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;-><init>(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;Landroid/content/Context;Landroid/view/ViewGroup;)V

    return-object v0
.end method

.method public onScrollStarted()V
    .locals 0

    .prologue
    .line 301
    return-void
.end method

.method public onScrolledToLastItem()V
    .locals 1

    .prologue
    .line 295
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    invoke-virtual {v0}, Lme/grishka/appkit/utils/Preloader;->onScrolledToLastItem()V

    .line 296
    return-void
.end method

.method public updateList()V
    .locals 0

    .prologue
    .line 249
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;->notifyDataSetChanged()V

    .line 250
    return-void
.end method
