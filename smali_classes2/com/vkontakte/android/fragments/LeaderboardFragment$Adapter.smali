.class public Lcom/vkontakte/android/fragments/LeaderboardFragment$Adapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "LeaderboardFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/LeaderboardFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Adapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private final TYPE_HEADER:I

.field private final TYPE_LEADERBOARD_ITEM:I

.field final synthetic this$0:Lcom/vkontakte/android/fragments/LeaderboardFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/LeaderboardFragment;)V
    .locals 1
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/LeaderboardFragment;

    .prologue
    .line 146
    iput-object p1, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/LeaderboardFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 147
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$Adapter;->TYPE_HEADER:I

    .line 148
    const/4 v0, 0x1

    iput v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$Adapter;->TYPE_LEADERBOARD_ITEM:I

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/LeaderboardFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/LeaderboardFragment;->access$200(Lcom/vkontakte/android/fragments/LeaderboardFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 166
    if-nez p1, :cond_0

    .line 167
    const/4 v0, 0x0

    .line 170
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 146
    check-cast p1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/LeaderboardFragment$Adapter;->onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V
    .locals 2
    .param p1, "holder"    # Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 177
    if-nez p2, :cond_0

    .line 178
    check-cast p1, Lcom/vkontakte/android/fragments/LeaderboardFragment$HeaderHolder;

    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/LeaderboardFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/LeaderboardFragment;->access$100(Lcom/vkontakte/android/fragments/LeaderboardFragment;)Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/LeaderboardFragment$HeaderHolder;->bind(Ljava/lang/Object;)V

    .line 183
    :goto_0
    return-void

    .line 181
    .restart local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    :cond_0
    check-cast p1, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;

    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/LeaderboardFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/LeaderboardFragment;->access$200(Lcom/vkontakte/android/fragments/LeaderboardFragment;)Ljava/util/ArrayList;

    move-result-object v0

    add-int/lit8 v1, p2, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 146
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/LeaderboardFragment$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 153
    packed-switch p2, :pswitch_data_0

    .line 161
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 155
    :pswitch_0
    new-instance v0, Lcom/vkontakte/android/fragments/LeaderboardFragment$HeaderHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/fragments/LeaderboardFragment$HeaderHolder;-><init>(Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 157
    :pswitch_1
    new-instance v0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/LeaderboardFragment;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;-><init>(Lcom/vkontakte/android/fragments/LeaderboardFragment;Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 153
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
