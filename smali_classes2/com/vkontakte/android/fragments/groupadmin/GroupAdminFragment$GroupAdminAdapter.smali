.class Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment$GroupAdminAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "GroupAdminFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/CardItemDecorator$Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GroupAdminAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment$GroupAdminViewHolder;",
        ">;",
        "Lcom/vkontakte/android/ui/CardItemDecorator$Provider;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment;)V
    .locals 0

    .prologue
    .line 217
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment$GroupAdminAdapter;->this$0:Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment;Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment$1;

    .prologue
    .line 217
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment$GroupAdminAdapter;-><init>(Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment;)V

    return-void
.end method


# virtual methods
.method public getBlockType(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    const/4 v0, 0x1

    .line 237
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment$GroupAdminAdapter;->this$0:Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment;->access$600(Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ne v1, v0, :cond_1

    .line 238
    const/4 v0, 0x6

    .line 244
    :cond_0
    :goto_0
    return v0

    .line 239
    :cond_1
    if-nez p1, :cond_2

    .line 240
    const/4 v0, 0x2

    goto :goto_0

    .line 241
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment$GroupAdminAdapter;->this$0:Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment;->access$700(Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne p1, v1, :cond_0

    .line 242
    const/4 v0, 0x4

    goto :goto_0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 232
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment$GroupAdminAdapter;->this$0:Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment;->access$500(Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 217
    check-cast p1, Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment$GroupAdminViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment$GroupAdminAdapter;->onBindViewHolder(Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment$GroupAdminViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment$GroupAdminViewHolder;I)V
    .locals 1
    .param p1, "holder"    # Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment$GroupAdminViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 227
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment$GroupAdminAdapter;->this$0:Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment;->access$400(Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment$GroupAdminViewHolder;->bind(Ljava/lang/Object;)V

    .line 228
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 217
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment$GroupAdminAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment$GroupAdminViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment$GroupAdminViewHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 222
    new-instance v0, Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment$GroupAdminViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment$GroupAdminAdapter;->this$0:Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment$GroupAdminViewHolder;-><init>(Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment;)V

    return-object v0
.end method
