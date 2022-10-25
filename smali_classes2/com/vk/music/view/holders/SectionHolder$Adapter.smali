.class Lcom/vk/music/view/holders/SectionHolder$Adapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "SectionHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/holders/SectionHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Adapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder;",
        ">;"
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

.field data:Ljava/util/ArrayList;

.field final recommendedModel:Lcom/vk/music/model/RecommendedModel;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field section:Lcom/vk/music/dto/Section;

.field final type:Lcom/vk/music/dto/Section$Type;


# direct methods
.method public constructor <init>(Lcom/vk/music/dto/Section$Type;Lcom/vk/music/model/RecommendedModel;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V
    .locals 1
    .param p1, "type"    # Lcom/vk/music/dto/Section$Type;
    .param p2, "recommendedModel"    # Lcom/vk/music/model/RecommendedModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/dto/Section$Type;",
            "Lcom/vk/music/model/RecommendedModel;",
            "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 174
    .local p3, "callback":Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 170
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$Adapter;->data:Ljava/util/ArrayList;

    .line 175
    iput-object p1, p0, Lcom/vk/music/view/holders/SectionHolder$Adapter;->type:Lcom/vk/music/dto/Section$Type;

    .line 176
    iput-object p2, p0, Lcom/vk/music/view/holders/SectionHolder$Adapter;->recommendedModel:Lcom/vk/music/model/RecommendedModel;

    .line 177
    iput-object p3, p0, Lcom/vk/music/view/holders/SectionHolder$Adapter;->callback:Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;

    .line 178
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vk/music/view/holders/SectionHolder$Adapter;->setHasStableIds(Z)V

    .line 179
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 235
    sget-object v1, Lcom/vk/music/view/holders/SectionHolder$1;->$SwitchMap$com$vk$music$dto$Section$Type:[I

    iget-object v2, p0, Lcom/vk/music/view/holders/SectionHolder$Adapter;->type:Lcom/vk/music/dto/Section$Type;

    invoke-virtual {v2}, Lcom/vk/music/dto/Section$Type;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 239
    iget-object v1, p0, Lcom/vk/music/view/holders/SectionHolder$Adapter;->data:Ljava/util/ArrayList;

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return v0

    .line 237
    :pswitch_0
    iget-object v1, p0, Lcom/vk/music/view/holders/SectionHolder$Adapter;->data:Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$Adapter;->data:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    div-int/lit8 v0, v0, 0x3

    mul-int/lit8 v0, v0, 0x3

    goto :goto_0

    .line 239
    :cond_1
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$Adapter;->data:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_0

    .line 235
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 207
    sget-object v0, Lcom/vk/music/view/holders/SectionHolder$1;->$SwitchMap$com$vk$music$dto$Section$Type:[I

    iget-object v1, p0, Lcom/vk/music/view/holders/SectionHolder$Adapter;->type:Lcom/vk/music/dto/Section$Type;

    invoke-virtual {v1}, Lcom/vk/music/dto/Section$Type;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 219
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Wrong view type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 209
    :pswitch_0
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$Adapter;->data:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/MusicTrack;->getMidId()J

    move-result-wide v0

    .line 217
    :goto_0
    return-wide v0

    .line 213
    :pswitch_1
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$Adapter;->data:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    int-to-long v0, v0

    goto :goto_0

    .line 215
    :pswitch_2
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$Adapter;->data:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Playlist;

    iget v0, v0, Lcom/vk/music/dto/Playlist;->id:I

    int-to-long v0, v0

    goto :goto_0

    .line 217
    :pswitch_3
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$Adapter;->data:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/ExtendedPlaylist;

    iget-object v0, v0, Lcom/vk/music/dto/ExtendedPlaylist;->playlist:Lcom/vk/music/dto/Playlist;

    iget v0, v0, Lcom/vk/music/dto/Playlist;->id:I

    int-to-long v0, v0

    goto :goto_0

    .line 207
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 230
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$Adapter;->type:Lcom/vk/music/dto/Section$Type;

    invoke-virtual {v0}, Lcom/vk/music/dto/Section$Type;->ordinal()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 163
    check-cast p1, Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vk/music/view/holders/SectionHolder$Adapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V
    .locals 1
    .param p1, "holder"    # Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .param p2, "position"    # I

    .prologue
    .line 225
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$Adapter;->data:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->bind(Ljava/lang/Object;)V

    .line 226
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 163
    invoke-virtual {p0, p1, p2}, Lcom/vk/music/view/holders/SectionHolder$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 189
    sget-object v0, Lcom/vk/music/view/holders/SectionHolder$1;->$SwitchMap$com$vk$music$dto$Section$Type:[I

    iget-object v1, p0, Lcom/vk/music/view/holders/SectionHolder$Adapter;->type:Lcom/vk/music/dto/Section$Type;

    invoke-virtual {v1}, Lcom/vk/music/dto/Section$Type;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 201
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Wrong view type:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/view/holders/SectionHolder$Adapter;->type:Lcom/vk/music/dto/Section$Type;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 191
    :pswitch_0
    new-instance v0, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;

    iget-object v1, p0, Lcom/vk/music/view/holders/SectionHolder$Adapter;->recommendedModel:Lcom/vk/music/model/RecommendedModel;

    invoke-direct {v0, p1, v1, p0}, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;-><init>(Landroid/view/ViewGroup;Lcom/vk/music/model/RecommendedModel;Lcom/vk/music/view/holders/SectionHolder$Adapter;)V

    .line 199
    :goto_0
    return-object v0

    .line 195
    :pswitch_1
    new-instance v0, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;

    invoke-direct {v0, p1}, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;-><init>(Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 197
    :pswitch_2
    new-instance v0, Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;

    invoke-direct {v0, p1}, Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;-><init>(Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 199
    :pswitch_3
    new-instance v0, Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;

    invoke-direct {v0, p1}, Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;-><init>(Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 189
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method setDataAndUpdateView(Ljava/util/ArrayList;Lcom/vk/music/dto/Section;)V
    .locals 0
    .param p1, "data"    # Ljava/util/ArrayList;
    .param p2, "section"    # Lcom/vk/music/dto/Section;

    .prologue
    .line 182
    iput-object p1, p0, Lcom/vk/music/view/holders/SectionHolder$Adapter;->data:Ljava/util/ArrayList;

    .line 183
    iput-object p2, p0, Lcom/vk/music/view/holders/SectionHolder$Adapter;->section:Lcom/vk/music/dto/Section;

    .line 184
    invoke-virtual {p0}, Lcom/vk/music/view/holders/SectionHolder$Adapter;->notifyDataSetChanged()V

    .line 185
    return-void
.end method
