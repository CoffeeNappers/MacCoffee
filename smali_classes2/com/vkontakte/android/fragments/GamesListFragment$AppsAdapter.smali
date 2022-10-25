.class Lcom/vkontakte/android/fragments/GamesListFragment$AppsAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "GamesListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/GamesListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AppsAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/GamesListFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/GamesListFragment;)V
    .locals 0

    .prologue
    .line 123
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GamesListFragment$AppsAdapter;->this$0:Lcom/vkontakte/android/fragments/GamesListFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/GamesListFragment;Lcom/vkontakte/android/fragments/GamesListFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/GamesListFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/GamesListFragment$1;

    .prologue
    .line 123
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/GamesListFragment$AppsAdapter;-><init>(Lcom/vkontakte/android/fragments/GamesListFragment;)V

    return-void
.end method


# virtual methods
.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 141
    const/4 v0, 0x1

    return v0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 1
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 146
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesListFragment$AppsAdapter;->this$0:Lcom/vkontakte/android/fragments/GamesListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/GamesListFragment;->access$400(Lcom/vkontakte/android/fragments/GamesListFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/ApiApplication;

    invoke-static {v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->getIconUrl(Lcom/vkontakte/android/data/ApiApplication;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesListFragment$AppsAdapter;->this$0:Lcom/vkontakte/android/fragments/GamesListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/GamesListFragment;->access$300(Lcom/vkontakte/android/fragments/GamesListFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 123
    check-cast p1, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/GamesListFragment$AppsAdapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;I)V
    .locals 1
    .param p1, "holder"    # Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;
    .param p2, "position"    # I

    .prologue
    .line 131
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesListFragment$AppsAdapter;->this$0:Lcom/vkontakte/android/fragments/GamesListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/GamesListFragment;->access$200(Lcom/vkontakte/android/fragments/GamesListFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->bind(Ljava/lang/Object;)V

    .line 132
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 123
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/GamesListFragment$AppsAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;
    .locals 6
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 126
    new-instance v0, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesListFragment$AppsAdapter;->this$0:Lcom/vkontakte/android/fragments/GamesListFragment;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/GamesListFragment$AppsAdapter;->this$0:Lcom/vkontakte/android/fragments/GamesListFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/GamesListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v4, "visitSource"

    const-string/jumbo v5, "direct"

    invoke-static {v3, v4, v5}, Lcom/vkontakte/android/utils/Utils;->readString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;-><init>(Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder$GetterData;Landroid/content/Context;Ljava/lang/String;)V

    return-object v0
.end method
