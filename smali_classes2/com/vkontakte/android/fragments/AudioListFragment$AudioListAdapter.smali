.class Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "AudioListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/AudioListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AudioListAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;",
        ">;"
    }
.end annotation


# static fields
.field static final SECTION_MAIN:I = 0x0

.field static final SECTION_SEARCH:I = 0x1


# instance fields
.field final audioListFragment:Lcom/vkontakte/android/fragments/AudioListFragment;

.field private section:I

.field final synthetic this$0:Lcom/vkontakte/android/fragments/AudioListFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/AudioListFragment;ILcom/vkontakte/android/fragments/AudioListFragment;)V
    .locals 1
    .param p2, "section"    # I
    .param p3, "audioListFragment"    # Lcom/vkontakte/android/fragments/AudioListFragment;

    .prologue
    .line 373
    iput-object p1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 374
    iput p2, p0, Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;->section:I

    .line 375
    iput-object p3, p0, Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;->audioListFragment:Lcom/vkontakte/android/fragments/AudioListFragment;

    .line 376
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;->setHasStableIds(Z)V

    .line 377
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .prologue
    .line 391
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;->getList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItemId(I)J
    .locals 6
    .param p1, "position"    # I

    .prologue
    .line 401
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;->getList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    .line 402
    .local v0, "af":Lcom/vkontakte/android/audio/MusicTrack;
    iget v1, v0, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    int-to-long v2, v1

    const/16 v1, 0x20

    shl-long/2addr v2, v1

    iget v1, v0, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    int-to-long v4, v1

    or-long/2addr v2, v4

    return-wide v2
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 396
    iget v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;->section:I

    return v0
.end method

.method getList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation

    .prologue
    .line 406
    iget v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;->section:I

    if-nez v0, :cond_0

    .line 407
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$800(Lcom/vkontakte/android/fragments/AudioListFragment;)Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->getFirstList()Ljava/util/List;

    move-result-object v0

    .line 409
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$800(Lcom/vkontakte/android/fragments/AudioListFragment;)Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/AudioListFragment$DataContainer;->getSecondList()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 364
    check-cast p1, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;I)V
    .locals 1
    .param p1, "holder"    # Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;
    .param p2, "position"    # I

    .prologue
    .line 386
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;->getList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;->bind(Ljava/lang/Object;)V

    .line 387
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 364
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 381
    new-instance v0, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach;

    iget v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;->section:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/AudioListFragment$AudioListAdapter;->audioListFragment:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-direct {v0, p1, v1, v2}, Lcom/vkontakte/android/ui/holder/audio/AudioViewHolderAttach;-><init>(Landroid/view/ViewGroup;ILcom/vkontakte/android/ui/holder/audio/AudioViewHolderBase$AudioViewHolderDelegate;)V

    return-object v0
.end method
