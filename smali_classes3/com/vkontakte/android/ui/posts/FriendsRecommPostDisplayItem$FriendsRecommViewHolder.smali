.class Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "FriendsRecommPostDisplayItem.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FriendsRecommViewHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;"
    }
.end annotation


# instance fields
.field private button:Landroid/widget/ImageView;

.field private hide:Landroid/widget/ImageView;

.field private name:Landroid/widget/TextView;

.field private parent:Lme/grishka/appkit/views/UsableRecyclerView;

.field private photo:Lcom/vk/imageloader/view/VKImageView;

.field private progress:Landroid/widget/ProgressBar;

.field private subtitle:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;Landroid/content/Context;Landroid/view/ViewGroup;)V
    .locals 2
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 129
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->this$0:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;

    .line 130
    const v0, 0x7f0300ad

    invoke-direct {p0, p2, v0, p3}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/content/Context;ILandroid/view/ViewGroup;)V

    .line 131
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f1002ba

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->name:Landroid/widget/TextView;

    .line 132
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f10019c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->subtitle:Landroid/widget/TextView;

    .line 133
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f1001e8

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    .line 134
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f10010f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->button:Landroid/widget/ImageView;

    .line 135
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f1002bb

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->hide:Landroid/widget/ImageView;

    .line 136
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100184

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->progress:Landroid/widget/ProgressBar;

    move-object v0, p3

    .line 137
    check-cast v0, Lme/grishka/appkit/views/UsableRecyclerView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->parent:Lme/grishka/appkit/views/UsableRecyclerView;

    .line 138
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->button:Landroid/widget/ImageView;

    new-instance v1, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$1;-><init>(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 173
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->hide:Landroid/widget/ImageView;

    invoke-static {p0, p3}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;Landroid/view/ViewGroup;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 185
    return-void
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->item:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->item:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->item:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->item:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->item:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->item:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->item:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->item:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->item:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->item:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->item:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->item:Ljava/lang/Object;

    return-object v0
.end method


# virtual methods
.method synthetic lambda$new$0(Landroid/view/ViewGroup;Landroid/view/View;)V
    .locals 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    .line 174
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->this$0:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;->att:Lcom/vkontakte/android/attachments/FriendsRecommAttachment;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/FriendsRecommAttachment;->profiles:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->item:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 175
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->this$0:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;

    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;->access$1100(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/cache/NewsfeedCache;->replaceOne(Lcom/vkontakte/android/NewsEntry;)V

    move-object v0, p1

    .line 176
    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;

    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;->access$1500(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommAdapter;)Lme/grishka/appkit/utils/Preloader;

    move-result-object v0

    invoke-virtual {v0}, Lme/grishka/appkit/utils/Preloader;->getData()Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->item:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 177
    check-cast p1, Landroid/support/v7/widget/RecyclerView;

    .end local p1    # "parent":Landroid/view/ViewGroup;
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->getAdapterPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyItemRemoved(I)V

    .line 178
    new-instance v1, Lcom/vkontakte/android/api/friends/FriendsHideSuggestion;

    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-direct {v1, v0}, Lcom/vkontakte/android/api/friends/FriendsHideSuggestion;-><init>(I)V

    new-instance v0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$2;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, p0, v2}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$2;-><init>(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/friends/FriendsHideSuggestion;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 183
    invoke-virtual {v0, v3, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->persist(Ljava/lang/reflect/Method;Lorg/json/JSONObject;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/view/View;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 184
    return-void
.end method

.method public onBind(Lcom/vkontakte/android/UserProfile;)V
    .locals 6
    .param p1, "item"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 189
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    iget-object v4, p1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 190
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->name:Landroid/widget/TextView;

    iget-object v4, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 191
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->subtitle:Landroid/widget/TextView;

    iget-object v4, p1, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "description"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 192
    iget v3, p1, Lcom/vkontakte/android/UserProfile;->online:I

    if-nez v3, :cond_2

    iget-boolean v0, p1, Lcom/vkontakte/android/UserProfile;->isFriend:Z

    .line 193
    .local v0, "added":Z
    :goto_0
    iget v3, p1, Lcom/vkontakte/android/UserProfile;->online:I

    const/4 v4, 0x2

    if-eq v3, v4, :cond_0

    iget v3, p1, Lcom/vkontakte/android/UserProfile;->online:I

    const/4 v4, -0x2

    if-ne v3, v4, :cond_4

    .line 194
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->progress:Landroid/widget/ProgressBar;

    invoke-virtual {v3, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 195
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->button:Landroid/widget/ImageView;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 201
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "friend_recomm_view"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->this$0:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;

    invoke-static {v3}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;->access$1100(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v3

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->time:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/data/Analytics;->isLogged(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 202
    const-string/jumbo v2, "show_user_rec"

    invoke-static {v2}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->collapse()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->unique()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->map(I)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    const-string/jumbo v2, "user_ids"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->this$0:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;

    invoke-static {v4}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;->access$1100(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v4

    iget v4, v4, Lcom/vkontakte/android/NewsEntry;->time:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 203
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "friend_recomm_view"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->this$0:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;->access$1100(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v2

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->time:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-wide/32 v2, 0x5265c00

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/data/Analytics;->logEvent(Ljava/lang/String;J)V

    .line 205
    :cond_1
    return-void

    .line 192
    .end local v0    # "added":Z
    :cond_2
    iget v3, p1, Lcom/vkontakte/android/UserProfile;->online:I

    if-lez v3, :cond_3

    move v0, v1

    goto/16 :goto_0

    :cond_3
    move v0, v2

    goto/16 :goto_0

    .line 197
    .restart local v0    # "added":Z
    :cond_4
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->progress:Landroid/widget/ProgressBar;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 198
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->button:Landroid/widget/ImageView;

    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 199
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->button:Landroid/widget/ImageView;

    if-eqz v0, :cond_5

    const v2, 0x7f020269

    :goto_2
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_1

    :cond_5
    const v2, 0x7f02026b

    goto :goto_2
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 121
    check-cast p1, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->onBind(Lcom/vkontakte/android/UserProfile;)V

    return-void
.end method

.method public onClick()V
    .locals 2

    .prologue
    .line 209
    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-direct {v1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    const-string/jumbo v0, "user_rec"

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->setReferrer(Ljava/lang/String;)Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 210
    return-void
.end method
