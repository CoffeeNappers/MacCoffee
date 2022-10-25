.class Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "GamesRequestFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/GamesRequestFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Adapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/GamesRequestFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/GamesRequestFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/GamesRequestFragment;

    .prologue
    .line 193
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/GamesRequestFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getGameRequestsData()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/GameRequest;",
            ">;"
        }
    .end annotation

    .prologue
    .line 196
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/GamesRequestFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->access$400(Lcom/vkontakte/android/fragments/GamesRequestFragment;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 213
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/GamesRequestFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->access$700(Lcom/vkontakte/android/fragments/GamesRequestFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 193
    check-cast p1, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;I)V
    .locals 1
    .param p1, "holder"    # Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;
    .param p2, "position"    # I

    .prologue
    .line 208
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/GamesRequestFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->access$600(Lcom/vkontakte/android/fragments/GamesRequestFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->bind(Ljava/lang/Object;)V

    .line 209
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 193
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;
    .locals 5
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 201
    new-instance v0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/GamesRequestFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "visitSource"

    const-string/jumbo v4, "direct"

    invoke-static {v2, v3, v4}, Lcom/vkontakte/android/utils/Utils;->readString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;

    invoke-direct {v3}, Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;-><init>()V

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;)V

    .line 202
    .local v0, "gameInviteHolder":Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/GamesRequestFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->access$500(Lcom/vkontakte/android/fragments/GamesRequestFragment;)Ljava/util/ArrayList;

    move-result-object v1

    new-instance v2, Ljava/lang/ref/WeakReference;

    iget-object v3, v0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->drawable:Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;

    invoke-direct {v2, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 203
    return-object v0
.end method
