.class Lcom/vk/music/view/RecommendedContainer$Adapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "RecommendedContainer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/RecommendedContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Adapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vk/music/dto/Section;",
        ">;>;"
    }
.end annotation


# instance fields
.field final callback:Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field final recommendedModel:Lcom/vk/music/model/RecommendedModel;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field sections:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/music/dto/Section;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/vk/music/model/RecommendedModel;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V
    .locals 1
    .param p1, "recommendedModel"    # Lcom/vk/music/model/RecommendedModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/model/RecommendedModel;",
            "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 161
    .local p2, "callback":Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 154
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/view/RecommendedContainer$Adapter;->sections:Ljava/util/ArrayList;

    .line 162
    iput-object p1, p0, Lcom/vk/music/view/RecommendedContainer$Adapter;->recommendedModel:Lcom/vk/music/model/RecommendedModel;

    .line 163
    iput-object p2, p0, Lcom/vk/music/view/RecommendedContainer$Adapter;->callback:Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;

    .line 164
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vk/music/view/RecommendedContainer$Adapter;->setHasStableIds(Z)V

    .line 165
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .prologue
    .line 199
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer$Adapter;->sections:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer$Adapter;->sections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 194
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer$Adapter;->sections:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Section;

    iget v0, v0, Lcom/vk/music/dto/Section;->id:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer$Adapter;->sections:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Section;

    iget-object v0, v0, Lcom/vk/music/dto/Section;->type:Lcom/vk/music/dto/Section$Type;

    invoke-virtual {v0}, Lcom/vk/music/dto/Section$Type;->ordinal()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 152
    check-cast p1, Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vk/music/view/RecommendedContainer$Adapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V
    .locals 1
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
            "<",
            "Lcom/vk/music/dto/Section;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 184
    .local p1, "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<Lcom/vk/music/dto/Section;>;"
    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer$Adapter;->sections:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->bind(Ljava/lang/Object;)V

    .line 185
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 152
    invoke-virtual {p0, p1, p2}, Lcom/vk/music/view/RecommendedContainer$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "I)",
            "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
            "<",
            "Lcom/vk/music/dto/Section;",
            ">;"
        }
    .end annotation

    .prologue
    .line 174
    sget-object v0, Lcom/vk/music/view/RecommendedContainer$2;->$SwitchMap$com$vk$music$dto$Section$Type:[I

    invoke-static {p2}, Lcom/vk/music/view/holders/SectionHolder;->getTypeByOrdinal(I)Lcom/vk/music/dto/Section$Type;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/music/dto/Section$Type;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 178
    new-instance v0, Lcom/vk/music/view/holders/SectionHolder;

    iget-object v1, p0, Lcom/vk/music/view/RecommendedContainer$Adapter;->recommendedModel:Lcom/vk/music/model/RecommendedModel;

    iget-object v2, p0, Lcom/vk/music/view/RecommendedContainer$Adapter;->callback:Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;

    invoke-direct {v0, p1, p2, v1, v2}, Lcom/vk/music/view/holders/SectionHolder;-><init>(Landroid/view/ViewGroup;ILcom/vk/music/model/RecommendedModel;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V

    :goto_0
    return-object v0

    .line 176
    :pswitch_0
    new-instance v0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;

    iget-object v1, p0, Lcom/vk/music/view/RecommendedContainer$Adapter;->recommendedModel:Lcom/vk/music/model/RecommendedModel;

    invoke-direct {v0, p1, v1}, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;-><init>(Landroid/view/ViewGroup;Lcom/vk/music/model/RecommendedModel;)V

    goto :goto_0

    .line 174
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method setSectionsAndUpdateView(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/music/dto/Section;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 168
    .local p1, "sections":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/music/dto/Section;>;"
    iput-object p1, p0, Lcom/vk/music/view/RecommendedContainer$Adapter;->sections:Ljava/util/ArrayList;

    .line 169
    invoke-virtual {p0}, Lcom/vk/music/view/RecommendedContainer$Adapter;->notifyDataSetChanged()V

    .line 170
    return-void
.end method
